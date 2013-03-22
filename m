Received: from mail-wi0-f170.google.com ([209.85.212.170])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UJ6EP-0007fK-HJ
	for openembedded-devel@lists.openembedded.org;
	Fri, 22 Mar 2013 18:58:21 +0100
Received: by mail-wi0-f170.google.com with SMTP id hm11so8911114wib.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Mar 2013 10:41:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references:x-gm-message-state;
	bh=wq1aJGYJ1uedtWsJBjKqPKTFA75oShzJUPHkPnIT998=;
	b=d2HvyfHYspxSGUS89hsBqfsm4tvpiYT4nOQI3Lh1N7nLM+QC/3BXD+NJZ5rMbdEdUH
	V9SWg/3eqLl/MxjI7DhFcfo5iLh5mXeDyenoOVbu7QkVGSClWn2zwETI+zr03mzjY5UM
	OKjuCMZ8je9LjpIDSRlA//SW2tgDG4+VBMf7jWmIYnAyFAHFYEHjETdV9qFhM17yyB6r
	UV4vIsl0oz+0uJZ43NceH27GDVBBLmA80BTlxEpkuKJO/AKYNGWDry6fHCs+ExEmywnB
	GM8lQe0gOTWFQSvBq8YWIa8T+LERNlE9KUg64KNXxZuXZWceENkGenGAxe3l1+fwvS3W
	qjjg==
X-Received: by 10.180.81.193 with SMTP id c1mr4611154wiy.19.1363974087678;
	Fri, 22 Mar 2013 10:41:27 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id dm9sm12260880wib.3.2013.03.22.10.41.26
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 22 Mar 2013 10:41:27 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 22 Mar 2013 17:38:22 +0000
Message-Id: <59f306671ae2b52bec53ecb16847ca7998e11e28.1363973088.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1363973088.git.ross.burton@intel.com>
References: <cover.1363973088.git.ross.burton@intel.com>
In-Reply-To: <cover.1363973088.git.ross.burton@intel.com>
References: <cover.1363973088.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQntNjcrhZ3rd5RKLhmQkDvwqKj6ljD1P6lRow3S/SDoM1hHaBfVasmHqVSEWtMJmzo2WcyC
Cc: openembedded-devel@lists.openembedded.org
Subject: [PATCH 02/22] busybox: add strictatime support to mount
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
X-List-Received-Date: Fri, 22 Mar 2013 17:58:25 -0000

systemd uses strictatime when mounting tmpfs.  Luckily this is already supported
upstream, so backport the patch from git.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../busybox/busybox-1.20.2/strict-atime.patch      |   49 ++++++++++++++++++++
 meta/recipes-core/busybox/busybox_1.20.2.bb        |    3 +-
 2 files changed, 51 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-core/busybox/busybox-1.20.2/strict-atime.patch

diff --git a/meta/recipes-core/busybox/busybox-1.20.2/strict-atime.patch b/meta/recipes-core/busybox/busybox-1.20.2/strict-atime.patch
new file mode 100644
index 0000000..8696427
--- /dev/null
+++ b/meta/recipes-core/busybox/busybox-1.20.2/strict-atime.patch
@@ -0,0 +1,49 @@
+Add support for the "strictatime" mount option.
+
+Upstream-Status: Backport [9ad8979ff15e1b894ee1f4bb6a2535a1a2c20d65]
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+
+Index: busybox-1.20.2/util-linux/mount.c
+===================================================================
+--- busybox-1.20.2.orig/util-linux/mount.c	2012-07-02 15:08:25.000000000 +0100
++++ busybox-1.20.2/util-linux/mount.c	2013-03-22 15:37:31.340277463 +0000
+@@ -113,6 +113,12 @@
+ #ifndef MS_RELATIME
+ # define MS_RELATIME    (1 << 21)
+ #endif
++#ifndef MS_STRICTATIME
++# define MS_STRICTATIME (1 << 24)
++#endif
++
++/* Any ~MS_FOO value has this bit set: */
++#define BB_MS_INVERTED_VALUE (1u << 31)
+ 
+ #include "libbb.h"
+ #if ENABLE_FEATURE_MOUNT_LABEL
+@@ -239,6 +245,7 @@
+ 		/* "nomand"      */ ~MS_MANDLOCK,
+ 		/* "relatime"    */ MS_RELATIME,
+ 		/* "norelatime"  */ ~MS_RELATIME,
++		/* "strictatime" */ MS_STRICTATIME,
+ 		/* "loud"        */ ~MS_SILENT,
+ 		/* "rbind"       */ MS_BIND|MS_RECURSIVE,
+ 
+@@ -295,6 +302,7 @@
+ 		"nomand\0"
+ 		"relatime\0"
+ 		"norelatime\0"
++		"strictatime\0"
+ 		"loud\0"
+ 		"rbind\0"
+ 
+@@ -466,8 +474,8 @@
+ 		// Find this option in mount_options
+ 		for (i = 0; i < ARRAY_SIZE(mount_options); i++) {
+ 			if (strcasecmp(option_str, options) == 0) {
+-				long fl = mount_options[i];
+-				if (fl < 0)
++				unsigned long fl = mount_options[i];
++				if (fl & BB_MS_INVERTED_VALUE)
+ 					flags &= fl;
+ 				else
+ 					flags |= fl;
diff --git a/meta/recipes-core/busybox/busybox_1.20.2.bb b/meta/recipes-core/busybox/busybox_1.20.2.bb
index a02cd38..c09a492 100644
--- a/meta/recipes-core/busybox/busybox_1.20.2.bb
+++ b/meta/recipes-core/busybox/busybox_1.20.2.bb
@@ -30,7 +30,8 @@ SRC_URI = "http://www.busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
            file://stat-usr-bin.patch \
            file://busybox-syslog.service.in \
            file://busybox-klogd.service.in \
-           file://testsuite-du-du-k-works-fix-false-positive.patch"
+           file://testsuite-du-du-k-works-fix-false-positive.patch \
+           file://strict-atime.patch"
 
 SRC_URI[tarball.md5sum] = "e025414bc6cd79579cc7a32a45d3ae1c"
 SRC_URI[tarball.sha256sum] = "eb13ff01dae5618ead2ef6f92ba879e9e0390f9583bd545d8789d27cf39b6882"
-- 
1.7.10.4



