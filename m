Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A71D8C433EF
	for <webhook@archiver.kernel.org>; Fri, 12 Nov 2021 19:44:13 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
 [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web08.864.1636746252758624708
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 12 Nov 2021 11:44:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=fDL9iV43;
 spf=pass (domain: gmail.com, ip: 209.85.221.44,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f44.google.com with SMTP id b12so17439980wrh.4
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 12 Nov 2021 11:44:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=JT11noaumXRChd/Gpbn8J3A6+NkiVOpZ98U10z6ogR4=;
        b=fDL9iV43pqyyUe5P9fjN8+7qxOXjyt2vnAkgRtyfKoRh+hxe3ihjOlnFByaU4unErx
         wN9aFciHZm6Ekkq3Mb7vyZj32c/wsYzjSJKm7JwojCr+vK4B8OqhOhXKjo9aWM42bo2B
         l2Kcb9Zq9LrFcNwiCP5dKd4z3J9SDESpPV7RYOBNQFtoOijNGsCLJnUhgEvKKyxVBetd
         FIloLfU40QOHaY72ADNv64CCLmAjxuZBhmCWNAsXN02/8HtKp4UvJHBNtRUjRrTseRmz
         2n1du3nlbpVcQzrOp39fYTLcDHu0WYnn7857QCKQtIJoPCWK994BZMwQCTE4t3XaBMr+
         hMmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=JT11noaumXRChd/Gpbn8J3A6+NkiVOpZ98U10z6ogR4=;
        b=3A6gW8rh8bg+IIh+jAn7xQio55HBF0QD1R3sitA52AK057PQ2RIUjOg0sr8/SG3IQP
         9bBnu7gaQZip8JBXWBsO+60IpnGErCLfxSnT/v8qGXBu2b7q2Yp0bD5ZGIko4Si5ospA
         s4ImYu3uTwan/QQ61vjkzTaCLC48xQl6x77/PhsSXBnvkzz2V66IcAbLlqKJYOwrtFAY
         Vo3g8wLqXJ1V5O5jmqQ4/eqLQl+UCeaOJ+fuUvQiHgKCZzZSvBwhik6JY3I0lODLA8jr
         yWs4apC6NozCDBxucCjY8mR3IZEHzEFTOSt2BlyfT5zjoBis9QU5YNEeAVVoXXSAogLR
         q9SA==
X-Gm-Message-State: AOAM532mib0WstPCg7muqKgpVpUvtZlYof2D1lVjKEsL+5ZvPMSHILJJ
	VJUpfRobcGbXFqty2TcRRQ+4XETlOrrggA==
X-Google-Smtp-Source: 
 ABdhPJzJKM3STZxk76pv580pA7F7zMbiSB7CjQFZkviXVeKs5cPjAGGDIopWuaQwNgH3s3XzQ76Vfg==
X-Received: by 2002:a5d:65c7:: with SMTP id e7mr21412776wrw.319.1636746250966;
        Fri, 12 Nov 2021 11:44:10 -0800 (PST)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 c17sm6927535wmk.23.2021.11.12.11.44.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Nov 2021 11:44:10 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-devel@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>,
	Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 1/2] libstatgrab: update 0.92 -> 0.92.1
Date: Fri, 12 Nov 2021 20:44:07 +0100
Message-Id: <20211112194408.1496194-1-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 12 Nov 2021 19:44:13 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93924

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...re.ac-Do-not-use-single-line-comment.patch | 33 -------------------
 ...statgrab_0.92.bb => libstatgrab_0.92.1.bb} |  6 ++--
 2 files changed, 2 insertions(+), 37 deletions(-)
 delete mode 100644 meta-oe/recipes-extended/libstatgrab/libstatgrab/0001-configure.ac-Do-not-use-single-line-comment.patch
 rename meta-oe/recipes-extended/libstatgrab/{libstatgrab_0.92.bb => libstatgrab_0.92.1.bb} (81%)

diff --git a/meta-oe/recipes-extended/libstatgrab/libstatgrab/0001-configure.ac-Do-not-use-single-line-comment.patch b/meta-oe/recipes-extended/libstatgrab/libstatgrab/0001-configure.ac-Do-not-use-single-line-comment.patch
deleted file mode 100644
index 46493bb9e..000000000
--- a/meta-oe/recipes-extended/libstatgrab/libstatgrab/0001-configure.ac-Do-not-use-single-line-comment.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From a8502c5a7e336f1e5068f9dd3bdb359d787f9bdc Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Fri, 5 Feb 2021 18:35:12 -0800
-Subject: [PATCH] configure.ac: Do not use single line comment
-
-autoconf 2.70+ does not like it and regenerating configure script fails
-
-| ../libstatgrab-0.92/configure: line 7818: syntax error near unexpected token `ac_fn_check_decl'
-| ../libstatgrab-0.92/configure: line 7818: `fi ac_fn_check_decl "$LINENO" "__sun" "ac_cv_have_decl___sun" "$ac_includes_default" "$ac_c_undeclared_builtin_options" "CFLAGS"'
-
-Upstream-Status: Submitted [https://github.com/libstatgrab/libstatgrab/pull/128]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- configure.ac | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index 99518f8..74e7f0f 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -100,7 +100,8 @@ AC_TYPE_UNSIGNED_LONG_LONG_INT
- 
- dnl Check for extra flags to enable some kind of behavior
- AC_CHECK_DECL([_AIX],[ac_cv_need_minus_d_linux_source_compat="yes"; ac_cv_need_minus_d_all_source="yes"])
--AC_CHECK_DECL([__linux],[ac_cv_need_minus_d_gnu_source="yes"]) dnl probably required by kfreebsd, too?
-+dnl probably required by kfreebsd, too?
-+AC_CHECK_DECL([__linux],[ac_cv_need_minus_d_gnu_source="yes"])
- AC_CHECK_DECL([__sun],[ac_cv_need_minus_d_extensions="yes"; ac_cv_need_minus_d_posix_pthread_semantics="yes"])
- AC_CHECK_DECL([__hpux],[ac_cv_need_minus_d_hpux_source="yes"])
- 
--- 
-2.30.0
-
diff --git a/meta-oe/recipes-extended/libstatgrab/libstatgrab_0.92.bb b/meta-oe/recipes-extended/libstatgrab/libstatgrab_0.92.1.bb
similarity index 81%
rename from meta-oe/recipes-extended/libstatgrab/libstatgrab_0.92.bb
rename to meta-oe/recipes-extended/libstatgrab/libstatgrab_0.92.1.bb
index 3f15a259b..61f159c57 100644
--- a/meta-oe/recipes-extended/libstatgrab/libstatgrab_0.92.bb
+++ b/meta-oe/recipes-extended/libstatgrab/libstatgrab_0.92.1.bb
@@ -9,11 +9,9 @@ DEPENDS = "ncurses"
 PACKAGES:prepend = "statgrab statgrab-dbg saidar saidar-dbg ${PN}-mrtg "
 
 # don't use the git tag unless docbooc2x is available to build the manpages
-SRC_URI = "https://github.com/libstatgrab/libstatgrab/releases/download/LIBSTATGRAB_0_92/libstatgrab-0.92.tar.gz \
-           file://0001-configure.ac-Do-not-use-single-line-comment.patch \
+SRC_URI = "https://github.com/libstatgrab/libstatgrab/releases/download/LIBSTATGRAB_0_92_1/libstatgrab-${PV}.tar.gz \
           "
-SRC_URI[md5sum] = "5362b2ddbec54b3901e7d70c22cda249"
-SRC_URI[sha256sum] = "5bf1906aff9ffc3eeacf32567270f4d819055d8386d98b9c8c05519012d5a196"
+SRC_URI[sha256sum] = "5688aa4a685547d7174a8a373ea9d8ee927e766e3cc302bdee34523c2c5d6c11"
 
 UPSTREAM_CHECK_URI = "https://github.com/${BPN}/${BPN}/releases"
 
-- 
2.20.1


