Received: from [81.169.183.159] (helo=coruscant.onosendai.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <zecke@selfish.org>) id 1Junqt-0005Se-FJ
	for openembedded-devel@lists.openembedded.org;
	Sat, 10 May 2008 14:06:59 +0200
Received: from [92.116.92.247] (helo=[10.129.92.247])
	by coruscant.onosendai.de with esmtpsa
	(TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32) (Exim 4.69)
	(envelope-from <zecke@selfish.org>)
	id 1Junpt-0000T7-9d; Sat, 10 May 2008 14:06:01 +0200
From: Holger Freyther <zecke@selfish.org>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 10 May 2008 14:05:38 +0200
User-Agent: KMail/1.9.9
References: <200805080215.23729.zecke@selfish.org>
	<200805081306.37230.zecke@selfish.org>
	<1210246170.5006.34.camel@dax.rpnet.com>
In-Reply-To: <1210246170.5006.34.camel@dax.rpnet.com>
MIME-Version: 1.0
Message-Id: <200805101405.38789.zecke@selfish.org>
X-Broken-Reverse-DNS: no host name found for IP address 92.116.92.247
Cc: bitbake-dev@lists.berlios.de
Subject: Re: Creating a pristine environment?
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10b4
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
X-List-Received-Date: Sat, 10 May 2008 12:06:59 -0000
X-Groupsio-MsgNum: 5135
Content-Type: Multipart/Mixed;
  boundary="Boundary-00=_S+YJIi3cpKrCNiL"

--Boundary-00=_S+YJIi3cpKrCNiL
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Thursday 08 May 2008 13:29:30 Richard Purdie wrote:
> On Thu, 2008-05-08 at 13:06 +0200, Holger Freyther wrote:
> > On Thursday 08 May 2008 12:05:38 Koen Kooi wrote:
> > > Holger Freyther wrote:
> > > > Hey,
> > > >
> > > > I have seen raster's environment breaking various buildsystems and we
> > > > might want to really start having a clean environment before starting
> > > > to build.
> > > >
> > > > the patch below should implement it. Should we do this in OE? I'm
> > > > aware of the unexport inside OE but we really should do this the
> > > > otherway around.
> > >
> > > While this is a good idea, your current implementation breaks:
> > >
> > > MACHINE=foo ANGSTROM_MODE=bar bitbake foo-bar-image
> >
> > Well, that would make a case for keeping the unexport feature in OE. Or
> > we could move the unsetting to after having parsed the configuration. I
> > will give the 2nd idea a go...
>
> I agree we should do something, I'm just not sure what. Personally I do
> set things in the environment quite heavily and I'd prefer not to lose
> that capability. Perhaps we clean by default but allow a user to
> override and claim their starting environment is clean at their own
> risk?

Okay. I added an option, I clean the environment after having parsed the 
configuration. This means everything used from conf/local.conf (TOPDIR, 
BBPATH, BBFILES, MACHINE...) will be inside the configuration data of bitbake 
but not be exported. I also updated the documentation (man page and 
usermanual).

comments?

	z.


--Boundary-00=_S+YJIi3cpKrCNiL
Content-Type: text/x-diff;
  charset="iso-8859-1";
  name="bitbake-remove-environment-r1.diff"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename="bitbake-remove-environment-r1.diff"

Index: doc/bitbake.1
===================================================================
--- doc/bitbake.1	(Revision 1067)
+++ doc/bitbake.1	(Arbeitskopie)
@@ -97,13 +97,18 @@
 .B \-IIGNORED\_DOT\_DEPS, \-\-ignore-deps=IGNORED_DOT_DEPS
 Stop processing at the given list of dependencies when generating dependency
 graphs. This can help to make the graph more appealing
-.\"
-.\" Next option is only in BitBake 1.7.x (trunk)
-.\"
-.\".TP
-.\".B \-lDEBUG_DOMAINS, \-\-log-domains=DEBUG_DOMAINS
-.\"Show debug logging for the specified logging domains
+.TP
+.B \-lDEBUG_DOMAINS, \-\-log-domains=DEBUG_DOMAINS
+Show debug logging for the specified logging domains
+.TP
+.B \-P, \-\-profile
+profile the command and print a report
+.TP
+.B \-S, \-\-sane-environment
+Do not clean the environment variables. Use this on your own risk.
+.TP
 
+
 .SH AUTHORS
 BitBake was written by 
 Phil Blundell,
Index: doc/manual/usermanual.xml
===================================================================
--- doc/manual/usermanual.xml	(Revision 1067)
+++ doc/manual/usermanual.xml	(Arbeitskopie)
@@ -415,6 +415,10 @@
                         the graph more appealing
   -l DEBUG_DOMAINS, --log-domains=DEBUG_DOMAINS
                         Show debug logging for the specified logging domains
+  -P, --profile         profile the command and print a report
+  -S, --sane-environment
+                        Do not clean the environment variables. Use this on
+                        your own risk.
 
 </screen>
                 </para>
Index: bin/bitbake
===================================================================
--- bin/bitbake	(Revision 1067)
+++ bin/bitbake	(Arbeitskopie)
@@ -42,6 +42,56 @@
 
 
 #============================================================================#
+# clean_environment 
+#============================================================================#
+def clean_environment():
+    """
+    Create a pristine environment for bitbake. This will remove variables that
+    are not known and may influence the build in a negative way.
+    """
+    good_keys = [
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
+
+    removed_vars = []
+    for key in os.environ.keys():
+        if key in good_keys:
+            continue
+        
+        removed_vars.append(key)
+        os.unsetenv(key)
+        del os.environ[key]
+
+    if len(removed_vars):
+        bb.note("Removed the following variables from the environment:", ",".join(removed_vars))
+
+
+#============================================================================#
 # main
 #============================================================================#
 
@@ -105,6 +155,9 @@
     parser.add_option( "-P", "--profile", help = "profile the command and print a report",
                action = "store_true", dest = "profile", default = False )
 
+    parser.add_option( "-S", "--sane-environment", help = """Do not clean the environment variables. Use this on your own risk.""",
+                action = "store_false", dest = "clean_environment", default = True)
+
     options, args = parser.parse_args(sys.argv)
 
     configuration = BBConfiguration(options)
@@ -112,6 +165,8 @@
     configuration.pkgs_to_build.extend(args[1:])
 
     cooker = bb.cooker.BBCooker(configuration)
+    if options.clean_environment:
+        clean_environment()
 
     if configuration.profile:
         try:

--Boundary-00=_S+YJIi3cpKrCNiL--
