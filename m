Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AEB68CCF9E5
	for <webhook@archiver.kernel.org>; Mon, 27 Oct 2025 00:42:19 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web10.22053.1761525736477070183
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 26 Oct 2025 17:42:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dPAtJHYe;
 spf=pass (domain: gmail.com, ip: 209.85.216.49, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-33ff5149ae8so896113a91.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 26 Oct 2025 17:42:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761525735; x=1762130535; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lxwfxTH6zMul1D3SGVtWlGg6t1ZDzthcGCPlgm9Ooig=;
        b=dPAtJHYe66fmEECAxpdsu8Lkji6PVBxcLgf/Ycwo9C66u32vlKUN3irV+hPvErdxAY
         LvXF2+qa27vQp37joY0oDz8fs1S+1XWj9r8UbrGLTOOZZpXYgOdj5D00aQ0EIE1DU7x6
         ADRqtIrFQgulu1xMs4WhFmSjoX2/Ef7EcnbE6UBrFOvNqxUpDtqNl/rsWuvmCxpj3NQ+
         pl9sdkJ3HAqnhJoYjjV6sK009HExPn9cooE0fj/7X2+SjArTWJFo039EziBNBbLBRcY+
         erTmbkoyEgGmb+vi1HsfWjf9RDua3846Ozeu2miEXpKLFbvfLiMRLeEcU6qL9zyVRZgT
         4k0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761525735; x=1762130535;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lxwfxTH6zMul1D3SGVtWlGg6t1ZDzthcGCPlgm9Ooig=;
        b=tQMDc3fTmbfFrfalwk0ojLrFqE65ZMxhrWjQ/6QNWnXupPKQtLCKU4+upeCmqy6FqD
         PCUZ0zkFKKwu4wAbXCIPvX8HJVmT1X1MNy78nEBHEx7YS+VRWzdTMbOZ9eFlo63xKypn
         Cq7kpXFVTfSJ8vBtOVbmDPzV6oI7a+KorUugah/7kkPnvC3NLm01koymMHL4+fI4A9SZ
         mYnzCFGwv9zn2jwmjXeHIxeTAUTnUuWJ2WHMq54x2LCuab/CqZr828BYKZNoSU689PNT
         YoObw2zixTCDgYthnY7QAPA92zMYC0u7wBwDqUUu/lfx1BSt/e5DhLmSi3Vj1+A0L5YB
         4Z/A==
X-Gm-Message-State: AOJu0Yx4vhh36SXwI381+7l63I1XhxBoRmbyUN0uVPYSX69LNA9cqJHR
	4ikwfgYLjdI1sXzk/+4JYRK7vOIodIJjQiUqV1of6e81JvTjJtvC9fBostovocBr
X-Gm-Gg: ASbGncttP1pNDk8nbPqNWse0wCV3ZcwuUTHz8uSgKi2e94mi885Ckq7OA7SKz2sdXwU
	IblWYuInv39Y66ZuypFzuN6Djia31ygSjR1hBxeXuQe0Gn+/xJaJ5tOYMtlxHdprEJDfgnu8Qd9
	RKYZlMDAJlWyhORZASiOnQpSLeCleAkUWJhsxtt+auIp2D0BdVSzKjxjMQbdpqWlpd20lOJf/tI
	uuPPdt2ZLRxM4TilHUXEwfaZWGWnavdJ+VTLniSL9TeUIQ141AB83BIeZdm+4KshZe4aGU89r66
	zDFpeabjffzMgGYGCX12D56mlcg0nBsvrkuUmSLynQNozmZZi7O3u3HhUhT/qrE8QRDsSGp1znu
	xnBEvnaBNKCNHfI4TNTcw4FQwJrbnxu5i+/PW+wI/Ui6yqEWFUwioNCkuUVshRp1uiRVLoSyrQq
	ik66ifPLbtvEPzdu067i7M48mE38VzjAnCqUPlSBkHYuKDVyh42+qHNR7n35Wr/Hnik3BNNWCP
X-Google-Smtp-Source: AGHT+IGDrvM6GvqDmYuYrKggEutpa3R2oOM/5k4l8nmWW4gvCLIEJk2clN6r5+a8ovqYrTk9hVSYrQ==
X-Received: by 2002:a17:90b:250e:b0:33f:ebdd:9961 with SMTP id 98e67ed59e1d1-33febdd9ccdmr4887312a91.28.1761525735431;
        Sun, 26 Oct 2025 17:42:15 -0700 (PDT)
Received: from apollo.tail3ccdd3.ts.net ([2601:646:8201:fd20::9dbe])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33fed7e9f9asm6342093a91.11.2025.10.26.17.42.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Oct 2025 17:42:14 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-filesystem][PATCH] xfsdump: Make build reproducible
Date: Sun, 26 Oct 2025 17:42:13 -0700
Message-ID: <20251027004213.2432916-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.51.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 27 Oct 2025 00:42:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121019

install step is not consistent especially when usrmerge is not
enabled ( which is default ), based upon what it finds on build host
it decides to install the xfsdump and xfsrestore locations to be either
/sbin or /usr/sbin, therefore it should be made consistent

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../files/0001-xfsdump-support-usrmerge.patch | 52 -------------------
 .../recipes-utils/xfsdump/xfsdump_3.2.0.bb    | 10 +++-
 2 files changed, 9 insertions(+), 53 deletions(-)
 delete mode 100644 meta-filesystems/recipes-utils/xfsdump/files/0001-xfsdump-support-usrmerge.patch

diff --git a/meta-filesystems/recipes-utils/xfsdump/files/0001-xfsdump-support-usrmerge.patch b/meta-filesystems/recipes-utils/xfsdump/files/0001-xfsdump-support-usrmerge.patch
deleted file mode 100644
index bfb25e87f7..0000000000
--- a/meta-filesystems/recipes-utils/xfsdump/files/0001-xfsdump-support-usrmerge.patch
+++ /dev/null
@@ -1,52 +0,0 @@
-From fea8c4634469784c16211e2597411c18c72dfa4a Mon Sep 17 00:00:00 2001
-From: Changqing Li <changqing.li@windriver.com>
-Date: Thu, 5 Mar 2020 14:36:14 +0800
-Subject: [PATCH] xfsdump: support usrmerge
-
-Upstream-Status: Inappropriate [oe-specific]
-
-Signed-off-by: Changqing Li <changqing.li@windriver.com>
----
- dump/Makefile    | 6 +-----
- restore/Makefile | 6 +-----
- 2 files changed, 2 insertions(+), 10 deletions(-)
-
-diff --git a/dump/Makefile b/dump/Makefile
-index 66f00d3..cc2d973 100644
---- a/dump/Makefile
-+++ b/dump/Makefile
-@@ -97,12 +97,8 @@ default: depend $(LTCOMMAND)
- include $(BUILDRULES)
-
- install: default
--	$(INSTALL) -m 755 -d $(PKG_ROOT_SBIN_DIR)
--	$(LTINSTALL) -m 755 $(LTCOMMAND) $(PKG_ROOT_SBIN_DIR)
- 	$(INSTALL) -m 755 -d $(PKG_SBIN_DIR)
--	# skip symlink when /sbin is alread symlinked to /usr/sbin, like on Fedora
--	test $(PKG_ROOT_SBIN_DIR) -ef $(PKG_SBIN_DIR) || \
--		$(INSTALL) -S $(PKG_ROOT_SBIN_DIR)/$(LTCOMMAND) $(PKG_SBIN_DIR)/$(LTCOMMAND)
-+	$(LTINSTALL) -m 755 $(LTCOMMAND) $(PKG_SBIN_DIR)
- install-dev:
-
- .dep: $(COMMINCL) $(COMMON) $(INVINCL) $(INVCOMMON)
-diff --git a/restore/Makefile b/restore/Makefile
-index ac3f8c8..3c46394 100644
---- a/restore/Makefile
-+++ b/restore/Makefile
-@@ -111,12 +111,8 @@ default: depend $(LTCOMMAND)
- include $(BUILDRULES)
-
- install: default
--	$(INSTALL) -m 755 -d $(PKG_ROOT_SBIN_DIR)
--	$(LTINSTALL) -m 755 $(LTCOMMAND) $(PKG_ROOT_SBIN_DIR)
- 	$(INSTALL) -m 755 -d $(PKG_SBIN_DIR)
--	# skip symlink when /sbin is alread symlinked to /usr/sbin, like on Fedora
--	test $(PKG_ROOT_SBIN_DIR) -ef $(PKG_SBIN_DIR) || \
--		$(INSTALL) -S $(PKG_ROOT_SBIN_DIR)/$(LTCOMMAND) $(PKG_SBIN_DIR)/$(LTCOMMAND)
-+	$(LTINSTALL) -m 755 $(LTCOMMAND) $(PKG_SBIN_DIR)
- install-dev:
-
- .dep: $(COMMINCL) $(COMMON) $(INVINCL) $(INVCOMMON)
---
-2.7.4
-
diff --git a/meta-filesystems/recipes-utils/xfsdump/xfsdump_3.2.0.bb b/meta-filesystems/recipes-utils/xfsdump/xfsdump_3.2.0.bb
index c65344f536..bca7e7471e 100644
--- a/meta-filesystems/recipes-utils/xfsdump/xfsdump_3.2.0.bb
+++ b/meta-filesystems/recipes-utils/xfsdump/xfsdump_3.2.0.bb
@@ -13,7 +13,6 @@ DEPENDS = "xfsprogs attr"
 SRC_URI = "https://www.kernel.org/pub/linux/utils/fs/xfs/xfsdump/${BP}.tar.xz \
            file://remove-install-as-user.patch \
            file://0001-include-libgen.h-for-basename-API-prototype.patch \
-           ${@bb.utils.contains('DISTRO_FEATURES','usrmerge','file://0001-xfsdump-support-usrmerge.patch','',d)} \
            "
 SRC_URI[sha256sum] = "2914dbbe1ebc88c7d93ad88e220aa57dabc43d216e11f06221c01edf3cc10732"

@@ -37,4 +36,13 @@ do_install () {
     export DIST_ROOT=${D}
     oe_runmake install
     oe_runmake install-dev
+    if ${@bb.utils.contains('DISTRO_FEATURES','usrmerge','true','false',d)}
+    then
+        # move files from /sbin to /usr/sbin
+        mv -vf ${D}${exec_prefix}/../sbin/* ${D}${sbindir}
+        rmdir ${D}${exec_prefix}/../sbin
+    else
+        ln -sf ${base_sbindir}/xfsdump ${D}${sbindir}/xfsdump
+        ln -sf ${base_sbindir}/xfsrestore ${D}${sbindir}/xfsrestore
+    fi
 }

