Received: from [81.169.183.159] (helo=coruscant.onosendai.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <zecke@selfish.org>) id 1Ju1p2-0002AR-MB
	for openembedded-devel@lists.openembedded.org;
	Thu, 08 May 2008 10:49:52 +0200
Received: from world202.mi.fu-berlin.de ([160.45.115.202])
	by coruscant.onosendai.de with esmtpsa
	(TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32) (Exim 4.69)
	(envelope-from <zecke@selfish.org>)
	id 1Ju1oP-0001jc-9p; Thu, 08 May 2008 10:49:13 +0200
To: bitbake-dev@lists.berlios.de
From: Holger Freyther <zecke@selfish.org>
Date: Thu, 8 May 2008 02:15:23 +0200
MIME-Version: 1.0
Message-Id: <200805080215.23729.zecke@selfish.org>
Cc: openembedded-devel@lists.openembedded.org
Subject: Creating a pristine environment?
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
X-List-Received-Date: Thu, 08 May 2008 08:49:53 -0000
X-Groupsio-MsgNum: 5109
Content-Type: Multipart/Mixed;
  boundary="Boundary-00=_bYkII5F3DT6JtuZ"

--Boundary-00=_bYkII5F3DT6JtuZ
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hey,

I have seen raster's environment breaking various buildsystems and we might 
want to really start having a clean environment before starting to build.

the patch below should implement it. Should we do this in OE? I'm aware of the 
unexport inside OE but we really should do this the otherway around.


comments?

	z.

--Boundary-00=_bYkII5F3DT6JtuZ
Content-Type: text/x-diff;
  charset="us-ascii";
  name="clean_environment.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename="clean_environment.patch"

Index: bin/bitbake
===================================================================
--- bin/bitbake	(Revision 1063)
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
 
@@ -111,6 +161,8 @@
     configuration.pkgs_to_build = []
     configuration.pkgs_to_build.extend(args[1:])
 
+    clean_environment()
+
     cooker = bb.cooker.BBCooker(configuration)
 
     if configuration.profile:

--Boundary-00=_bYkII5F3DT6JtuZ--
