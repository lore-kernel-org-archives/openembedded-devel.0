Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB860E77180
	for <webhook@archiver.kernel.org>; Sat, 14 Dec 2024 18:02:35 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web11.22097.1734199350048527644
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 14 Dec 2024 10:02:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=IV7/IJh/;
 spf=pass (domain: gmail.com, ip: 209.85.210.176, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-725f3594965so2099193b3a.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 14 Dec 2024 10:02:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734199349; x=1734804149; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mpVkL6VbY8dr9uTEhCVPUpTZblX5K5Y8wBARAANzcAo=;
        b=IV7/IJh/OeZpw+h8+/jzrA5nlMBya84uIRh0pwh5mLoKW1RVv8LaZ5KDzrJiJ6RAoO
         oRwqgL2GJtXAM1TzfEWmPCeTxoqXrKQjxFHw56YKTOzpv/sMdM9onKd7Bi+xmrmPs7IF
         V3mrkU3l2s2v6iAa8m6dwAqOrac15Eqo0MIF/zILEZpI45K4azwLvN71BNL68EfF7Z3q
         VHwT368kpgQxkA7EoQ9vZmGbPRbuTGlsABQ+hk+R7l19YrPn2S/5rQcrd7KYp/RxvsdK
         ToQrW/jlVH9LYANjIQhnZNKATWSuYnDvfw0w+wDf8hWKR146nFqelIrjAwPzgVbJSs4d
         J6Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734199349; x=1734804149;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mpVkL6VbY8dr9uTEhCVPUpTZblX5K5Y8wBARAANzcAo=;
        b=CsEfAYz9LAYFkY80oWayoFWICIqRdTn08w/FVUAp6IGZlML+smhy882+/NS1pgeo+f
         9pG7sD28XR+Nws9LCMihAvZZxKK2kWP5JLdgAC9DRDHEkMgaXhJlQZmgV4BpCUIzIOpm
         54BaVx+vSG3WB95P85zTUsD1N3eTcwHFtaSsr31GE9UtMXUTj07JpLOkA/rkJ7zgU67T
         Dg7xZx8rwvSPF+IDpjFZui/42Iu4RYheMzSt4J0+AnDjBU5R+/F5+/SBJ+4VL/LWvQ9e
         RERuzgOGGaqjfEZAqT+asT2ZglWt4BnNyN4SxOMlx1Mzmy7G2o4jcCIPhHCX/+UEzWzR
         c1ig==
X-Gm-Message-State: AOJu0Yz9qnrnnSVmw39NuzrV0i9Mry12ZXfDymMI6XLfABSrpov1SrpR
	P9HI4n6C2dbpYIRooidwDCPGvPNZnqdw2bDNdmd7ZsGaxsIi3LwwAlngh33d
X-Gm-Gg: ASbGncsYxe9TQE0V/hhsuhX2dFZLjElL91f3r91qDzi3lk/dARIk44R8R5POPecfNIp
	oPbr4k+sn6NGkNopLNw6SZRXd1yUND7cj/RobN5jve7Hs8k6GVy0Ld05YjV63fgvtTyBXKSEpeM
	AlXuo66LtwlFFrj+f569GofJOwRA+just/bGvITPyq5UCsWJXzM2KSNMZGDayEHm/nkaq3XChDf
	wl4xxvKJ0v1UWi+hYtc4NuEVNTjui7twF2hjCUbZLWH2BlN
X-Google-Smtp-Source: AGHT+IHhwQ8P67yAS680sh9vrHo1ka93ytq9aejkj1q2R+lFFz7c4LWWP1Pvm0C68kT72TXDszBoJg==
X-Received: by 2002:a05:6a00:4fd2:b0:724:5815:62c1 with SMTP id d2e1a72fcca58-7290c24d06cmr10367485b3a.19.1734199349144;
        Sat, 14 Dec 2024 10:02:29 -0800 (PST)
Received: from apollo.localdomain ([2601:646:8201:fd20::86b6])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72918ac51b5sm1686095b3a.8.2024.12.14.10.02.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Dec 2024 10:02:28 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] kernel-module-emlog: Fix build with kernel 6.12+
Date: Sat, 14 Dec 2024 10:02:26 -0800
Message-ID: <20241214180226.1218440-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 14 Dec 2024 18:02:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114315

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-core/emlog/emlog.inc          |  1 +
 ...move-modules_clean-from-clean-target.patch |  0
 ...not-use-no_llseek-with-kernel-6.12.0.patch | 32 +++++++++++++++++++
 .../Drop-use-of-error-h.patch                 |  0
 .../emlog/{emlog => files}/emlog.initd        |  0
 5 files changed, 33 insertions(+)
 rename meta-oe/recipes-core/emlog/{emlog => files}/0001-Remove-modules_clean-from-clean-target.patch (100%)
 create mode 100644 meta-oe/recipes-core/emlog/files/0001-emlog-Do-not-use-no_llseek-with-kernel-6.12.0.patch
 rename meta-oe/recipes-core/emlog/{emlog => files}/Drop-use-of-error-h.patch (100%)
 rename meta-oe/recipes-core/emlog/{emlog => files}/emlog.initd (100%)

diff --git a/meta-oe/recipes-core/emlog/emlog.inc b/meta-oe/recipes-core/emlog/emlog.inc
index 631e52f388..5e96b8b3bd 100644
--- a/meta-oe/recipes-core/emlog/emlog.inc
+++ b/meta-oe/recipes-core/emlog/emlog.inc
@@ -4,6 +4,7 @@ LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
 SRC_URI = "git://github.com/nicupavel/emlog.git;protocol=https;branch=master"
+SRC_URI += "file://0001-emlog-Do-not-use-no_llseek-with-kernel-6.12.0.patch"
 SRCREV = "a9bbf324fde131ff4cf064e32674086c4ced4dca"
 PV = "0.70+git"
 S = "${WORKDIR}/git"
diff --git a/meta-oe/recipes-core/emlog/emlog/0001-Remove-modules_clean-from-clean-target.patch b/meta-oe/recipes-core/emlog/files/0001-Remove-modules_clean-from-clean-target.patch
similarity index 100%
rename from meta-oe/recipes-core/emlog/emlog/0001-Remove-modules_clean-from-clean-target.patch
rename to meta-oe/recipes-core/emlog/files/0001-Remove-modules_clean-from-clean-target.patch
diff --git a/meta-oe/recipes-core/emlog/files/0001-emlog-Do-not-use-no_llseek-with-kernel-6.12.0.patch b/meta-oe/recipes-core/emlog/files/0001-emlog-Do-not-use-no_llseek-with-kernel-6.12.0.patch
new file mode 100644
index 0000000000..86f719b0bb
--- /dev/null
+++ b/meta-oe/recipes-core/emlog/files/0001-emlog-Do-not-use-no_llseek-with-kernel-6.12.0.patch
@@ -0,0 +1,32 @@
+From dca01ea62833249d78ac3bdf277b73424bf93e89 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 14 Dec 2024 09:55:10 -0800
+Subject: [PATCH] emlog: Do not use no_llseek with kernel 6.12.0+
+
+no_llseek is finally gone with 6.12-rc1 [1]
+
+[1] https://github.com/torvalds/linux/commit/cb787f4ac0c2e439ea8d7e6387b925f74576bdf8
+
+Upstream-Status: Submitted [https://github.com/nicupavel/emlog/pull/16]
+---
+ emlog.c | 7 ++++++-
+ 1 file changed, 6 insertions(+), 1 deletion(-)
+
+diff --git a/emlog.c b/emlog.c
+index 2ead738..b45c72d 100644
+--- a/emlog.c
++++ b/emlog.c
+@@ -464,7 +464,12 @@ static const struct file_operations emlog_fops = {
+     .open = emlog_open,
+     .release = emlog_release,
+     .poll = emlog_poll,
+-    .llseek = no_llseek,        /* no_llseek by default introduced at v2.6.37-rc1 */
++#if LINUX_VERSION_CODE < KERNEL_VERSION(6, 12, 0)
++    /* no_llseek by default introduced at v2.6.37-rc1 and
++     * removed in 6.12.0
++     */
++    .llseek = no_llseek,
++#endif
+     .owner = THIS_MODULE,
+ };
+ 
diff --git a/meta-oe/recipes-core/emlog/emlog/Drop-use-of-error-h.patch b/meta-oe/recipes-core/emlog/files/Drop-use-of-error-h.patch
similarity index 100%
rename from meta-oe/recipes-core/emlog/emlog/Drop-use-of-error-h.patch
rename to meta-oe/recipes-core/emlog/files/Drop-use-of-error-h.patch
diff --git a/meta-oe/recipes-core/emlog/emlog/emlog.initd b/meta-oe/recipes-core/emlog/files/emlog.initd
similarity index 100%
rename from meta-oe/recipes-core/emlog/emlog/emlog.initd
rename to meta-oe/recipes-core/emlog/files/emlog.initd

