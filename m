Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E19E0C43602
	for <webhook@archiver.kernel.org>; Sun, 28 Jun 2026 08:12:48 +0000 (UTC)
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.69157.1782634366316665736
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 28 Jun 2026 01:12:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Xz0+8HpQ;
 spf=pass (domain: gmail.com, ip: 74.125.82.177, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-30b6dad2382so4557820eec.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 28 Jun 2026 01:12:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782634366; x=1783239166; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uWbcpxyop6+RQ1GQhFBrgaTTzLbUoW99ng3ZD4PH1rw=;
        b=Xz0+8HpQd7nIu19pE2uk04vgp/1x40EPL43JX2ZJV+mbYceHlTfmJ/D9YImBIrB4da
         DjHfjKwEu7eu1E6GVBMwXmt5UaCo4pj/fLBzv+LWuVSmX6RDq74Ok+5iKo9hXdJHY4Qw
         e8vWmgBOOMokxvZqbcNpWkpwOmCYF2ANBAF8ZcWo1Dl8QBWZ40yPOqXwH+WkTDE2MYqH
         djhNwoaox4YMT+0GSPPMKjzJGBk4gga+ZEjxK8zEpkpakozChnACCw6hEF+DV1A40J4T
         dALcuBa+AtaBGby6uoOrpJy63qdQWBJnbqt2o03wky9KJ+LCzTXf4ufl/iV/D/vA1mJ3
         JLxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782634366; x=1783239166;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uWbcpxyop6+RQ1GQhFBrgaTTzLbUoW99ng3ZD4PH1rw=;
        b=jbFVcal9hYUsUctuzntib8mpTXbih5y9AgQpkFoDTwehUJv5JmhP5rc0w2h5egdFif
         yCQ+b2RNMR4pMXD9d9QZcfRnslkZN0Lvlks18TfcZZPpperv4dM0+n+9ZKpLpk2TehEH
         /6PSautj0VxeZmybr3xpSW+N1HJ0KYYgo1xkbGuRLqudzGKywb+qZjCNgEGcn1Ugge+7
         2YxrtARTq1qujazVHDnkpQ4HZuf0LbPY9YHBuBEJzuXQVaLDfBJD76pzPfm4wrpWS4Vq
         A3H2phu+0XmgLjmPprXQm8E8iHufo/0vvvHssGBZUqBmU/ASYCWK0r1kTNFqzcKhDMfS
         BBMQ==
X-Gm-Message-State: AOJu0YyEWNyH9NQdRW4Q/PqSWiFREgzJ4Tw9L6UjWyziUSnEUw7jP1XL
	jyXdkMA87m/jYJ+mg9NyYEtevw4q3QIgARdRGGO9X5hmAKUpxNmv1jSllTjX8cHCFjDKpA==
X-Gm-Gg: AfdE7cmu5HTAnDNw/glQFRm9YVj723i8/3W3XDvkhCjyGmlt+ZIHXKpjlUoCWGzJocI
	hPqxQYqWTmRPytmdzZm0w/ICRUEPOSFGTQ4KoohrOhv2cnF26IfrrU5LYbAX7sjeMQa22vd6cr3
	GqtnLJ9/4UD/gCwhZSy2PRuJwX4efDGNNItLDzVp4dnJOAzoUlYuFzf9wN7lvp0Pu94VHk5nUkc
	AjGBZMAQ5Z/ve4EX7imY2612qcZWCfROitHgcl26vHMGGYk0wQJ1hEeUOhTNefs3uZPxtR7i3eN
	ca6tO+YIGgykSMlsQtVDbAF4JUGpcLFiRKeBPhwKvIiXHocoWzfMYHxYR4CpWwDwFEZ50kULLo4
	QCxSCpNxrRHyC+Q1Oaw7XFwpgT7dpuAlIdFspQ1Pxf/d/cDlVJRmlBPSRWum2pd+pflQHol6LIC
	baeEeCnAN02d/ClcIyWSLY2VKlJikdbqfS5rVhEuM7N2i+9sdOJFZ96qU9Vn0fpUZu3JS1XEIVE
	TgBGHaXc7ZO6BE65Av4J4gIvXpQ5/hnusWLiL5zYMG0VPESh3xXtgjhaSidGVYcXD1ppiFCdMMZ
	IokX9DN5G6gi3B94d+W2vZqeUkSJyw==
X-Received: by 2002:a05:7301:3d10:b0:30c:b149:233b with SMTP id 5a478bee46e88-30cb1492bf3mr5315435eec.20.1782634365582;
        Sun, 28 Jun 2026 01:12:45 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30ea81b39easm6306040eec.31.2026.06.28.01.12.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 01:12:45 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 087/128] libmtp: upgrade 1.1.21 -> 1.1.23
Date: Sun, 28 Jun 2026 01:10:38 -0700
Message-ID: <20260628081122.178348-87-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260628081122.178348-1-khem.raj@oss.qualcomm.com>
References: <20260628081122.178348-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 28 Jun 2026 08:12:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127897

1.1.23 gained --enable-crossbuilddir, which uses the native mtp-hotplug
to generate udev rules. Use it and drop the local
0001-Use-native-mtp-hotplug and 0002-util-mtp-hotplug patches.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../libmtp/0001-Use-native-mtp-hotplug.patch  | 43 -------------------
 ...lug.c-Enable-stack-memory-protection.patch | 33 --------------
 .../{libmtp_1.1.21.bb => libmtp_1.1.23.bb}    | 10 +++--
 3 files changed, 7 insertions(+), 79 deletions(-)
 delete mode 100644 meta-oe/recipes-connectivity/libmtp/libmtp/0001-Use-native-mtp-hotplug.patch
 delete mode 100644 meta-oe/recipes-connectivity/libmtp/libmtp/0002-util-mtp-hotplug.c-Enable-stack-memory-protection.patch
 rename meta-oe/recipes-connectivity/libmtp/{libmtp_1.1.21.bb => libmtp_1.1.23.bb} (82%)

diff --git a/meta-oe/recipes-connectivity/libmtp/libmtp/0001-Use-native-mtp-hotplug.patch b/meta-oe/recipes-connectivity/libmtp/libmtp/0001-Use-native-mtp-hotplug.patch
deleted file mode 100644
index 83c58061f7..0000000000
--- a/meta-oe/recipes-connectivity/libmtp/libmtp/0001-Use-native-mtp-hotplug.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From 4e8eab047a43e48bd541f2887104299fcfb99b0d Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
-Date: Tue, 27 Nov 2018 12:03:20 +0100
-Subject: [PATCH] Use native mtp-hotplug
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Upstream-Status: Inappropriate [OE-specific]
-
-Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
----
- Makefile.am | 8 ++++----
- 1 file changed, 4 insertions(+), 4 deletions(-)
-
-diff --git a/Makefile.am b/Makefile.am
-index 7b7e06b..083e1c6 100644
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -16,16 +16,16 @@ hwdb_DATA=69-libmtp.hwdb
- noinst_DATA=libmtp.usermap libmtp.fdi
- 
- libmtp.usermap: util/mtp-hotplug
--	util/mtp-hotplug > libmtp.usermap
-+	mtp-hotplug > libmtp.usermap
- 
- @UDEV_RULES@: util/mtp-hotplug
--	util/mtp-hotplug -u -p"@UDEV@" @UDEV_GROUP@ @UDEV_MODE@ > @UDEV_RULES@
-+	mtp-hotplug -u -p"@UDEV@" @UDEV_GROUP@ @UDEV_MODE@ > @UDEV_RULES@
- 
- libmtp.fdi: util/mtp-hotplug
--	util/mtp-hotplug -H > libmtp.fdi
-+	mtp-hotplug -H > libmtp.fdi
- 
- $(hwdb_DATA): util/mtp-hotplug
--	util/mtp-hotplug -w > $(hwdb_DATA)
-+	mtp-hotplug -w > $(hwdb_DATA)
- 
- CLEANFILES = libmtp.usermap @UDEV_RULES@ libmtp.fdi libmtp.hwdb
- endif
--- 
-2.14.5
-
diff --git a/meta-oe/recipes-connectivity/libmtp/libmtp/0002-util-mtp-hotplug.c-Enable-stack-memory-protection.patch b/meta-oe/recipes-connectivity/libmtp/libmtp/0002-util-mtp-hotplug.c-Enable-stack-memory-protection.patch
deleted file mode 100644
index 9cd4b2fbd6..0000000000
--- a/meta-oe/recipes-connectivity/libmtp/libmtp/0002-util-mtp-hotplug.c-Enable-stack-memory-protection.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 0644188a537a06bc6d04483b21e23b80987eb497 Mon Sep 17 00:00:00 2001
-From: Hieu Van Nguyen <hieu2.nguyen@lge.com>
-Date: Fri, 11 Oct 2024 04:21:21 +0000
-Subject: [PATCH] util/mtp-hotplug.c: Enable stack memory protection
-
-Use "return 0" instead of "exit(0)" at the end of main()
-function to enable checking for Stack Overflow at Runtime.
-
-Use "return 0" to let the program exit normally by returning from
-the main function. This allows the compiler to perform necessary
-cleanup operations, including stack canary checks.
-
-__stack_chk_fail function isn't being invoked when using exit(0) at
-the end of the main function
-$ objdump -T ./util/.libs/mtp-hotplug | grep __stack_chk_fail
-This return empty.
----
-Upstream-Status: Backport [https://github.com/libmtp/libmtp/commit/e89dbb6ecf244936acc9a52aa4af9635bda5926a]
-
- util/mtp-hotplug.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/util/mtp-hotplug.c b/util/mtp-hotplug.c
-index b5bc6da40f..db75cb38a1 100644
---- a/util/mtp-hotplug.c
-+++ b/util/mtp-hotplug.c
-@@ -301,5 +301,5 @@ int main (int argc, char **argv)
-     printf("\n");
-   }
- 
--  exit (0);
-+  return 0;
- }
diff --git a/meta-oe/recipes-connectivity/libmtp/libmtp_1.1.21.bb b/meta-oe/recipes-connectivity/libmtp/libmtp_1.1.23.bb
similarity index 82%
rename from meta-oe/recipes-connectivity/libmtp/libmtp_1.1.21.bb
rename to meta-oe/recipes-connectivity/libmtp/libmtp_1.1.23.bb
index 69dff50cd7..a991c0a670 100644
--- a/meta-oe/recipes-connectivity/libmtp/libmtp_1.1.21.bb
+++ b/meta-oe/recipes-connectivity/libmtp/libmtp_1.1.23.bb
@@ -18,9 +18,7 @@ DEPENDS = "libusb1 gettext-native"
 DEPENDS:append:class-target = " ${BPN}-native"
 
 SRC_URI = "https://github.com/${BPN}/${BPN}/releases/download/v${PV}/${BP}.tar.gz"
-SRC_URI:append:class-target = " file://0001-Use-native-mtp-hotplug.patch \
-                                file://0002-util-mtp-hotplug.c-Enable-stack-memory-protection.patch"
-SRC_URI[sha256sum] = "f4c1ceb3df020a6cb851110f620c14fe399518c494ed252039cbfb4e34335135"
+SRC_URI[sha256sum] = "74a2b6e8cb4a0304e95b995496ea3ac644c29371649b892b856e22f12a0bdeed"
 
 UPSTREAM_CHECK_URI = "https://github.com/libmtp/libmtp/releases"
 UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)"
@@ -33,6 +31,12 @@ EXTRA_OECONF += " \
     --with-udev=${nonarch_base_libdir}/udev \
 "
 
+# Upstream 1.1.23 gained native crossbuild support: with this enabled the
+# build uses the host (native) mtp-hotplug (HOST_MTP_HOTPLUG) instead of the
+# just-built target binary to generate the udev rules/hwdb. libmtp-native
+# provides mtp-hotplug on PATH.
+EXTRA_OECONF:append:class-target = " --enable-crossbuilddir=${nonarch_base_libdir}/udev"
+
 PACKAGECONFIG ?= ""
 PACKAGECONFIG[doxygen] = "--enable-doxygen,--disable-doxygen,doxygen-native"
 PACKAGECONFIG[mtpz] = "--enable-mtpz,--disable-mtpz,libgcrypt"

