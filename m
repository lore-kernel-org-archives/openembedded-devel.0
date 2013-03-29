Received: from mail-ee0-f43.google.com ([74.125.83.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1ULaVR-0001Cw-AE
	for openembedded-devel@lists.openembedded.org;
	Fri, 29 Mar 2013 15:42:13 +0100
Received: by mail-ee0-f43.google.com with SMTP id e50so250516eek.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 Mar 2013 07:25:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer
	:x-gm-message-state;
	bh=vy39pvJ1nT32mvwntlBhMw9tEbJYtAHUYbY7pMpCOzs=;
	b=dnA2MIX0f+M+IO2WChmJsNRRkHYQ0pL3JKthPZYN8pUoFy16ek7/l/r6ckQP7uo3vD
	V9HMrtf+mINVjuD4wOyyAmhtH03P8ivcdkRRhMpGiRjt0Fe5PHrAIvRSIAi6qg9oYbuW
	G3FQvDKituC+I1gjs8d70rtqaAT237ihVk2ovEKPLNEIrCt9vdUJ2ldzR4TEhrVLuRXG
	BcgebHAx4jZCPAd9cJkDFn9hnx2h8kYDRbq5We401lPvKWTGJxxQ7hrwzxG1G4aIu9YX
	wNH9JltvEagoBVcb7GqRBIS/FgoxS5tu9T62kQ0cc+UCZSwKrTo1aLPYND2XqmN+u2vo
	Z0HA==
X-Received: by 10.14.175.71 with SMTP id y47mr8420636eel.18.1364567108966;
	Fri, 29 Mar 2013 07:25:08 -0700 (PDT)
Received: from localhost.localdomain (ip4da2a5ae.direct-adsl.nl.
	[77.162.165.174])
	by mx.google.com with ESMTPS id m46sm4277855eeo.16.2013.03.29.07.25.07
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Fri, 29 Mar 2013 07:25:07 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 29 Mar 2013 15:25:01 +0100
Message-Id: <1364567102-6409-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.8.1.4
X-Gm-Message-State: ALoCoQlVRi/Q2O2y5SKosDo6i6Rxr0E/4xQHHxT+6/bVObp0DiwbRieMlLD5JjJind3T3rAnZgws
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [meta-networking][meta-oe][PATCH 1/2] python-m2crypto: add 0.21.1
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
X-List-Received-Date: Fri, 29 Mar 2013 14:42:13 -0000

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 ...y-link-in-sysroot-not-in-host-directories.patch | 39 ++++++++++++++++++++++
 .../python/python-m2crypto_0.21.1.bb               | 19 +++++++++++
 2 files changed, 58 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/python/python-m2crypto/0001-setup.py-link-in-sysroot-not-in-host-directories.patch
 create mode 100644 meta-oe/recipes-devtools/python/python-m2crypto_0.21.1.bb

diff --git a/meta-oe/recipes-devtools/python/python-m2crypto/0001-setup.py-link-in-sysroot-not-in-host-directories.patch b/meta-oe/recipes-devtools/python/python-m2crypto/0001-setup.py-link-in-sysroot-not-in-host-directories.patch
new file mode 100644
index 0000000..bcbdf24
--- /dev/null
+++ b/meta-oe/recipes-devtools/python/python-m2crypto/0001-setup.py-link-in-sysroot-not-in-host-directories.patch
@@ -0,0 +1,39 @@
+From f11b9c71080513f9b867ba8f40613ba2ebc6e960 Mon Sep 17 00:00:00 2001
+From: Koen Kooi <koen@dominion.thruhere.net>
+Date: Fri, 29 Mar 2013 15:17:17 +0100
+Subject: [PATCH] setup.py: link in sysroot, not in host directories
+
+Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
+
+Upstream-status: Unknown
+---
+ setup.py | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/setup.py b/setup.py
+index e7c49eb..8deaa34 100644
+--- a/setup.py
++++ b/setup.py
+@@ -40,7 +40,7 @@ class _M2CryptoBuildExt(build_ext.build_ext):
+             self.openssl = 'c:\\pkg'
+         else:
+             self.libraries = ['ssl', 'crypto']
+-            self.openssl = '/usr'
++            self.openssl = os.environ.get( "STAGING_DIR" )
+        
+     
+     def finalize_options(self):
+@@ -49,8 +49,8 @@ class _M2CryptoBuildExt(build_ext.build_ext):
+ 
+         build_ext.build_ext.finalize_options(self)
+ 
+-        opensslIncludeDir = os.path.join(self.openssl, 'include')
+-        opensslLibraryDir = os.path.join(self.openssl, 'lib')
++        opensslIncludeDir = os.environ.get( "STAGING_INCDIR" )
++        opensslLibraryDir = os.environ.get( "STAGING_LIBDIR" )
+         
+         self.swig_opts = ['-I%s' % i for i in self.include_dirs + \
+                           [opensslIncludeDir]]
+-- 
+1.8.1.4
+
diff --git a/meta-oe/recipes-devtools/python/python-m2crypto_0.21.1.bb b/meta-oe/recipes-devtools/python/python-m2crypto_0.21.1.bb
new file mode 100644
index 0000000..9babc04
--- /dev/null
+++ b/meta-oe/recipes-devtools/python/python-m2crypto_0.21.1.bb
@@ -0,0 +1,19 @@
+DESCRIPTION = "A Python crypto and SSL toolkit"
+HOMEPAGE = "http://chandlerproject.org/bin/view/Projects/MeTooCrypto"
+
+DEPENDS = "openssl swig-native"
+
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://LICENCE;md5=b0e1f0b7d0ce8a62c18b1287b991800e"
+
+SRC_URI = "http://pypi.python.org/packages/source/M/M2Crypto/M2Crypto-${PV}.tar.gz \
+           file://0001-setup.py-link-in-sysroot-not-in-host-directories.patch"
+
+SRC_URI[md5sum] = "f93d8462ff7646397a9f77a2fe602d17"
+SRC_URI[sha256sum] = "25b94498505c2d800ee465db0cc1aff097b1615adc3ac042a1c85ceca264fc0a"
+
+S = "${WORKDIR}/M2Crypto-${PV}"
+
+inherit setuptools
+
+BBCLASSEXTEND = "native"
-- 
1.8.1.4



