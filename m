Received: from [194.106.48.114] (helo=tim.rpsys.net ident=0)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1JyCkK-0000KH-5X
	for openembedded-devel@openembedded.org; Mon, 19 May 2008 23:18:16 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m4JLFbK7018556;
	Mon, 19 May 2008 22:15:37 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 18457-02; Mon, 19 May 2008 22:15:32 +0100 (BST)
Received: from [192.168.1.3] (dax.rpnet.com [192.168.1.3])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m4JLFSw2018546
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Mon, 19 May 2008 22:15:28 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <200805101405.38789.zecke@selfish.org>
References: <200805080215.23729.zecke@selfish.org>
	<200805081306.37230.zecke@selfish.org>
	<1210246170.5006.34.camel@dax.rpnet.com>
	<200805101405.38789.zecke@selfish.org>
Date: Mon, 19 May 2008 22:15:30 +0100
Message-Id: <1211231730.20390.18.camel@dax.rpnet.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.12.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: bitbake-dev@lists.berlios.de
Subject: Re: Creating a pristine environment?
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10
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
X-List-Received-Date: Mon, 19 May 2008 21:18:16 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hi,

On Sat, 2008-05-10 at 14:05 +0200, Holger Freyther wrote:
> Okay. I added an option, I clean the environment after having parsed the 
> configuration. This means everything used from conf/local.conf (TOPDIR, 
> BBPATH, BBFILES, MACHINE...) will be inside the configuration data of bitbake 
> but not be exported. I also updated the documentation (man page and 
> usermanual).

I merged the manual bits of this so they no longer complicate the
equation. 

I've given this patch some thought and I'd like to propose the following
rehashed version of it. It has bitbake look at three different
environmental variables which whilst complicated, does keep everyone
happy:

BB_PRESERVE_ENV - if set don't touch the environment
BB_ENV_WHITELIST - a list of variables to whitelist overriding the default
BB_ENV_EXTRAWHITE - extra variables to whitelist (not touch)

So in Poky I can add MACHINE and POKYMODE to the whitelist by default in
the environment setup script and in my personal case, I can preserve my
environment since I trust myself to do this :).

Any thoughts on this?

Cheers,

Richard

Index: lib/bb/utils.py
===================================================================
--- lib/bb/utils.py	(revision 4503)
+++ lib/bb/utils.py	(working copy)
@@ -268,3 +268,56 @@
     for line in open(filename):
         s.update(line)
     return s.hexdigest()
+
+def preserved_envvars_list():
+    return [
+        "BBPATH",
+        "COLORTERM",
+        "DBUS_SESSION_BUS_ADDRESS",
+        "DESKTOP_SESSION",
+        "DESKTOP_STARTUP_ID",
+        "DISPLAY",
+        "GNOME_KEYRING_PID",
+        "GNOME_KEYRING_SOCKET",
+        "GPG_AGENT_INFO",
+        "GTK_RC_FILES",
+        "HOME",
+        "LANG",
+        "LOGNAME",
+        "PATH",
+        "PWD",
+        "SESSION_MANAGER",
+        "SHELL",
+        "SSH_AUTH_SOCK",
+        "TERM",
+        "USER",
+        "USERNAME",
+        "_",
+        "XAUTHORITY",
+        "XDG_DATA_DIRS",
+        "XDG_SESSION_COOKIE",
+    ]
+
+def filter_environment(good_vars):
+    """
+    Create a pristine environment for bitbake. This will remove variables that
+    are not known and may influence the build in a negative way.
+    """
+
+    import bb
+
+    removed_vars = []
+    for key in os.environ.keys():
+        if key in good_vars:
+            continue
+        
+        removed_vars.append(key)
+        os.unsetenv(key)
+        del os.environ[key]
+
+    #if len(removed_vars):
+    #    bb.debug(1, "Removed the following variables from the environment:", ",".join(removed_vars))
+
+    return removed_vars
+
+
Index: lib/bb/cooker.py
===================================================================
--- lib/bb/cooker.py	(revision 4504)
+++ lib/bb/cooker.py	(working copy)
@@ -59,6 +59,8 @@
 
         self.configuration.data = bb.data.init()
 
+    def parseConfiguration(self):
+
         for f in self.configuration.file:
             self.parseConfigurationFile( f )
 
Index: bin/bitbake
===================================================================
--- bin/bitbake	(revision 4460)
+++ bin/bitbake	(working copy)
@@ -113,6 +113,19 @@
 
     cooker = bb.cooker.BBCooker(configuration)
 
+    # Optionally clean up the environment
+    if 'BB_PRESERVE_ENV' not in os.environ:
+        if 'BB_ENV_WHITELIST' in os.environ:
+            good_vars = os.environ['BB_ENV_WHITELIST'].split()
+        else:
+            good_vars = bb.utils.preserved_envvars_list()
+        if 'BB_ENV_EXTRAWHITE' in os.environ:
+            good_vars.extend(os.environ['BB_ENV_EXTRAWHITE'].split())
+            print "here %s" % good_vars
+        bb.utils.filter_environment(good_vars)
+
+    cooker.parseConfiguration()
+
     if configuration.profile:
         try:
             import cProfile as profile



