Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1NhKoG-0002Rq-MB
	for openembedded-devel@lists.openembedded.org;
	Tue, 16 Feb 2010 11:37:44 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id o1GAZ1o2023255;
	Tue, 16 Feb 2010 10:35:01 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 22890-07; Tue, 16 Feb 2010 10:34:56 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id o1GAYrvg023244
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Tue, 16 Feb 2010 10:34:53 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: bitbake-dev@lists.berlios.de, openembedded-devel@lists.openembedded.org
Date: Tue, 16 Feb 2010 10:34:52 +0000
Message-ID: <1266316492.6436.127.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.2 
X-Virus-Scanned: amavisd-new at rpsys.net
X-SA-Exim-Connect-IP: 93.97.173.237
X-SA-Exim-Mail-From: rpurdie@rpsys.net
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: RFC: Improve our default conf file setup
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 16 Feb 2010 10:37:47 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hi,

I've been thinking for a while that our "look for a conf/bitbake.conf"
approach to finding our configuration is rather dated and inflexible.
Talking to others I think they feel the same way and its time to take a
step back and think about what we actually need. I've tried to do this
and I have a proposal based on what I found.

The fundamental problem currently is that the build directory is not in
control of what bitbake does. We require BBPATH to be set to some magic
value, find bitbake.conf, this transfers control back to a single file
(local.conf) which then further influences things further. The build
directory has to be combined with the right BBPATH setting.

Furthermore, we have the powerful overlay extension mechanism but when
adding an overlay, you have to change BBPATH, BBFILES and a load of
other things to correctly integrate any overlay into a build.

So taking a step back, what's needed is for the build directory to have
the basic configuration contained within it and no need for some magic
BBPATH. Overlays should ship with configuration information attached to
them.

I therefore propose that before conf/bitbake.conf, bitbake looks for a
conf/bblayers.conf. This file sets a variable BBLAYERS.

BBLAYERS is simply a list of overlay directories to include for the
given build directory.

For *each* overlay listed, bitbake will then include conf/layer.conf.
This is the main change in behaviour for bitbake since normally only one
file of a given name would ever be included but I think this makes sense
to give us some new functionality.

These layer.conf files are free to do whatever they need such as adding
paths to BBPATH, BBFILES and so on (I see new variables being added
which is to be encouraged e.g. extra site files). Experimenting, its
obvious the one thing you need in a layer.conf file is the layer
directory name so I've let bitbake set this in the LAYERDIR variable.

LAYERDIR is a tricky thing since you always want to do immediate
expansion on it since it will change later. This is going to catch
people out but so be it, it works really well.

The nice thing about this approach is that its in keeping with the way
bitbake works, but its powerful and easily extensible and uses the
existing configuration syntax, parser and so on.

I wrote a patch for Poky illustrating how this thing could be used which
is included below.

Its also totally backwards compatible. If bblayers.conf doesn't exist,
it uses the old behaviour and you can mix and match them if you're
careful too.

Does anyone have any feedback on this approach?

Cheers,

Richard


diff --git a/bitbake/lib/bb/cooker.py b/bitbake/lib/bb/cooker.py
index 5f9becc..002dfa7 100644
--- a/bitbake/lib/bb/cooker.py
+++ b/bitbake/lib/bb/cooker.py
@@ -87,10 +87,7 @@ class BBCooker:
 
         bb.data.inheritFromOS(self.configuration.data)
 
-        for f in self.configuration.file:
-            self.parseConfigurationFile( f )
-
-        self.parseConfigurationFile( os.path.join( "conf", "bitbake.conf" ) )
+        self.parseConfigurationFiles(self.configuration.file)
 
         if not self.configuration.cmd:
             self.configuration.cmd = bb.data.getVar("BB_DEFAULT_TASK", self.configuration.data, True) or "build"
@@ -527,9 +524,27 @@ class BBCooker:
         else:
             shell.start( self )
 
-    def parseConfigurationFile( self, afile ):
+    def parseConfigurationFiles(self, files):
         try:
-            self.configuration.data = bb.parse.handle( afile, self.configuration.data )
+            data = self.configuration.data
+            for f in files:
+                data = bb.parse.handle(f, data)
+
+            layerconf = os.path.join(os.getcwd(), "conf", "bblayers.conf")
+            if os.path.exists(layerconf):
+                bb.msg.debug(2, bb.msg.domain.Parsing, "Found bblayers.conf (%s)" % layerconf)
+                data = bb.parse.handle(layerconf, data)
+
+                layers = (bb.data.getVar('BBLAYERS', data, True) or "").split()
+
+                for layer in layers:
+                    bb.msg.debug(2, bb.msg.domain.Parsing, "Adding layer %s" % layer)
+                    bb.data.setVar('LAYERDIR', layer, data)
+                    data = bb.parse.handle(os.path.join(layer, "conf", "layer.conf"), data)
+
+            data = bb.parse.handle(os.path.join("conf", "bitbake.conf"), data )
+
+            self.configuration.data = data
 
             # Handle any INHERITs and inherit the base class
             inherits  = ["base"] + (bb.data.getVar('INHERIT', self.configuration.data, True ) or "").split()
@@ -546,9 +561,9 @@ class BBCooker:
             bb.event.fire(bb.event.ConfigParsed(), self.configuration.data)
 
         except IOError, e:
-            bb.msg.fatal(bb.msg.domain.Parsing, "Error when parsing %s: %s" % (afile, str(e)))
+            bb.msg.fatal(bb.msg.domain.Parsing, "Error when parsing %s: %s" % (files, str(e)))
         except bb.parse.ParseError, details:
-            bb.msg.fatal(bb.msg.domain.Parsing, "Unable to parse %s (%s)" % (afile, details) )
+            bb.msg.fatal(bb.msg.domain.Parsing, "Unable to parse %s (%s)" % (files, details) )
 
     def handleCollections( self, collections ):
         """Handle collections"""
diff --git a/build/conf/bblayers.conf.sample b/build/conf/bblayers.conf.sample
new file mode 100644
index 0000000..0b56d10
--- /dev/null
+++ b/build/conf/bblayers.conf.sample
@@ -0,0 +1,2 @@
+BBFILES ?= ""
+BBLAYERS = "${OEROOT}/meta ${OEROOT}/meta-moblin"
diff --git a/meta-moblin/conf/layer.conf b/meta-moblin/conf/layer.conf
new file mode 100644
index 0000000..e6d3b49
--- /dev/null
+++ b/meta-moblin/conf/layer.conf
@@ -0,0 +1,5 @@
+# We have a conf and classes directory, add to BBPATH
+BBPATH := "${BBPATH}${LAYERDIR}"
+
+# We have a packages directory, add to BBFILES
+BBFILES := "${BBFILES} ${LAYERDIR}/packages/*/*.bb"
diff --git a/meta/conf/layer.conf b/meta/conf/layer.conf
new file mode 100644
index 0000000..ba9c87b
--- /dev/null
+++ b/meta/conf/layer.conf
@@ -0,0 +1,8 @@
+# We have a conf and classes directory, add to BBPATH
+BBPATH := "${BBPATH}${LAYERDIR}"
+
+# We have a packages directory, add to BBFILES
+BBFILES := "${BBFILES} ${LAYERDIR}/packages/*/*.bb"
+
+
+



