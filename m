Return-Path: <raj.khem@gmail.com>
Received: from mail-pb0-f52.google.com (mail-pb0-f52.google.com
	[209.85.160.52])
	by mail.openembedded.org (Postfix) with ESMTP id 892C46A59B
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Jun 2013 09:39:30 +0000 (UTC)
Received: by mail-pb0-f52.google.com with SMTP id xa12so10168722pbc.11
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Jun 2013 02:39:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=k1xk/jHkMgVY3ZNmzMw0DqUd6FN77twJK43HYgAH5zU=;
	b=yft2824tDbsIvtJ8qadKJcxcvP1KzRiwO9v6RHH7gja4d//ONd8T9hy5xOw6bjz1Sl
	+rM7wabuDi6Icn8mVM3ZkLk/XNeNDslyzu7p5Q1w+V0Onb6bZrHSjiuoVwp576NWMaRl
	+p/ITC/+vPSG8eKNkpqltNON8A/BSLX/c4oie8s+wqJSa6CKaEJnEAhaqFo5PsOoT1Ql
	94xY0tyKmjoWlal6nr8yQUyur1B4wQhzpQNvEbKZBfQBkVdWxBwpZncEStc/KU8ecSz0
	tfJK/1oz9r1WXHeZPlaSfVZBefPik3JyHJadJWnTk1v4JZnJqx3yeMLy/dSVaNw0Td+q
	UMCg==
X-Received: by 10.66.126.11 with SMTP id mu11mr1947303pab.81.1371116371664;
	Thu, 13 Jun 2013 02:39:31 -0700 (PDT)
Received: from isis.gateway.2wire.net
	(99-57-140-209.lightspeed.sntcca.sbcglobal.net. [99.57.140.209])
	by mx.google.com with ESMTPSA id
	pm7sm22638961pbb.31.2013.06.13.02.39.30 for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 13 Jun 2013 02:39:31 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 13 Jun 2013 02:37:16 -0700
Message-Id: <1371116236-25088-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [meta-oe][PATCH] omgps: Fix build with glib-2.0 > 2.35
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 13 Jun 2013 09:39:30 -0000

Fix errors like

| src/main.c: In function 'main':
| src/main.c:490:2: error: 'g_type_init' is deprecated (declared at
/builds1/angstrom/build/tmp-angstrom_next-eglibc/sysroots/qemuarm/usr/include/glib-2.0/gobject/gtype.h:669)
[-Werror=deprecated-declarations]
|   g_type_init();
|   ^
| cc1: all warnings being treated as errors
| make[1]: *** [omgps-main.o] Error 1

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...g_type_init-is-deprecated-for-glib-2.35.0.patch |   33 ++++++++++++++++++++
 meta-oe/recipes-navigation/omgps/omgps_svn.bb      |    1 +
 2 files changed, 34 insertions(+)
 create mode 100644 meta-oe/recipes-navigation/omgps/omgps/0001-g_type_init-is-deprecated-for-glib-2.35.0.patch

diff --git a/meta-oe/recipes-navigation/omgps/omgps/0001-g_type_init-is-deprecated-for-glib-2.35.0.patch b/meta-oe/recipes-navigation/omgps/omgps/0001-g_type_init-is-deprecated-for-glib-2.35.0.patch
new file mode 100644
index 0000000..6b9f465
--- /dev/null
+++ b/meta-oe/recipes-navigation/omgps/omgps/0001-g_type_init-is-deprecated-for-glib-2.35.0.patch
@@ -0,0 +1,33 @@
+From 22bcf06637d64e40af6c152e28b31eef41e3f583 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 13 Jun 2013 02:35:22 -0700
+Subject: [PATCH] g_type_init() is deprecated for glib >= 2.35.0
+
+Call it for old versions.
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Upstream-Status: Pending
+---
+ src/main.c |    4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/main.c b/src/main.c
+index e984da4..a63ddf3 100644
+--- a/src/main.c
++++ b/src/main.c
+@@ -486,9 +486,9 @@ int main(int argc, char **argv)
+ 		if (strcmp(argv[1], "-log2file") == 0)
+ 			log2console = FALSE;
+ 	}
+-
++#if !GLIB_CHECK_VERSION(2,35,0)
+ 	g_type_init();
+-
++#endif
+ 	gdk_threads_init();
+ 
+ 	gdk_threads_enter();
+-- 
+1.7.9.5
+
diff --git a/meta-oe/recipes-navigation/omgps/omgps_svn.bb b/meta-oe/recipes-navigation/omgps/omgps_svn.bb
index e1c1a71..1a79df4 100644
--- a/meta-oe/recipes-navigation/omgps/omgps_svn.bb
+++ b/meta-oe/recipes-navigation/omgps/omgps_svn.bb
@@ -21,6 +21,7 @@ SRC_URI = "svn://omgps.googlecode.com/svn/trunk;module=omgps;protocol=http \
            file://use.unused.variable.patch \
            file://fix.build.with.glib.2.34.patch \
            file://gdk-pixbuf-2.26.5.patch \
+           file://0001-g_type_init-is-deprecated-for-glib-2.35.0.patch \
 "
 
 inherit autotools
-- 
1.7.9.5


