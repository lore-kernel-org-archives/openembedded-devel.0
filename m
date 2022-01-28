Return-Path: <thakur.virendra1810@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D070C433F5
	for <webhook@archiver.kernel.org>; Fri, 28 Jan 2022 10:24:30 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com
 [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.web08.5332.1643365468714325326
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 28 Jan 2022 02:24:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Q+1vmm1c;
 spf=pass (domain: gmail.com, ip: 209.85.216.46,
 mailfrom: thakur.virendra1810@gmail.com)
Received: by mail-pj1-f46.google.com with SMTP id
 nn16-20020a17090b38d000b001b56b2bce31so5973535pjb.3
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 28 Jan 2022 02:24:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id;
        bh=FMZgvaOnefNJEZSO0N4hB6VfqyiPMBIvC6QFBbu8xdg=;
        b=Q+1vmm1c7mVDSfdOJ+bZuQJgrW6crsUniwM9cnTB6xfSywByd0RULSqx6hW4ZYwQnI
         PiSUi0FXElAXPkNgkjwjqebQIJ+wmmNoGEKRYwslI66VK6qfTiaB1qtV4+ayF/QyPLD1
         bLZNlvUbm4ZCpKS6BR3JP6eQf+4HGjS5mECr16LOcCJ//7eZs/9JcxqpiMPWpAU9KUeQ
         +3coZmopJMm2T2M3JUrvCwh/wsh7e2zglNRCP7mCO6UKjvGylwNCUGiBirPY5fQX0L8m
         PvR2bbtEhWH4ORPGXifEwoam6A1ofZXhAcXJEElN4Ivm0atLIaiBnMyySxjlF2LojhMQ
         pO8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=FMZgvaOnefNJEZSO0N4hB6VfqyiPMBIvC6QFBbu8xdg=;
        b=XgIf+1a5dOVJJ4wp8dSgvgej8wUuTqlMIkkRFIl3PbT7kNaPiRgbH4Ly33pAz08AKZ
         6WaskLiVFlz2e97CVUr9CTKteX314lMs/k5o3rwbbtwBjVjT4MDkvLjo5O3zPkZsmBLs
         NIgJknkppiE6UhaDtUnhOtGLJseW4pNoBX7WYjTq2VlLBMME5VmMsj3SvDbBc4iu8Dd6
         O/h23OAe9pcWcU5pAk8AlIW8UtBEWPBrvd6/IwY26Rg0NE+4B8TVbPK+DqeCSthm8UJE
         ExJY6qAcbTe8Qs30eELSfVzzuCQ6yNIujmRXmLf/zan8l3bAF9EeciVE1CrdoK8s+Z54
         QR9g==
X-Gm-Message-State: AOAM53036zdfyTemlFOgS9nw3Wcsb/ZNN+HfjcWfQxXxc64D9NALOV7N
	n/iOCTRDXeyW/udyhn0+qnUPmetsLi0=
X-Google-Smtp-Source: 
 ABdhPJwkHdYseNY7XdZ42IgVqQEjpAAX0wWa8dV+8G5sldaYSbgPms26Nr8/7eszvoohPfvh0Pe28Q==
X-Received: by 2002:a17:90a:1784:: with SMTP id
 q4mr19069132pja.3.1643365467911;
        Fri, 28 Jan 2022 02:24:27 -0800 (PST)
Received: from localhost.localdomain ([182.70.37.104])
        by smtp.gmail.com with ESMTPSA id
 c8sm9168013pfl.122.2022.01.28.02.24.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jan 2022 02:24:27 -0800 (PST)
From: virendra thakur <thakur.virendra1810@gmail.com>
To: openembedded-devel@lists.openembedded.org,
	raj.khem@gmail.com
Cc: akuster808@gmail.com,
	Virendra Thakur <virendrak@kpit.com>,
	Virendra Thakur <virendra.thakur@kpit.com>
Subject: [oe][meta-oe][dunfell][PATCH] udisks2: Fix for CVE-2021-3802
Date: Fri, 28 Jan 2022 15:54:11 +0530
Message-Id: <20220128102411.2742-1-thakur.virendra1810@gmail.com>
X-Mailer: git-send-email 2.17.1
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 28 Jan 2022 10:24:30 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95145

From: Virendra Thakur <virendrak@kpit.com>

Add patch to fix CVE-2021-3802

Signed-off-by: Virendra Thakur <virendra.thakur@kpit.com>
---
 .../udisks/udisks2/CVE-2021-3802.patch        | 63 +++++++++++++++++++
 meta-oe/recipes-support/udisks/udisks2_git.bb |  1 +
 2 files changed, 64 insertions(+)
 create mode 100644 meta-oe/recipes-support/udisks/udisks2/CVE-2021-3802.patch

diff --git a/meta-oe/recipes-support/udisks/udisks2/CVE-2021-3802.patch b/meta-oe/recipes-support/udisks/udisks2/CVE-2021-3802.patch
new file mode 100644
index 000000000..0189833b4
--- /dev/null
+++ b/meta-oe/recipes-support/udisks/udisks2/CVE-2021-3802.patch
@@ -0,0 +1,63 @@
+From 2517b8feb13919c382e53ab5f9b63c5b5ee5b063 Mon Sep 17 00:00:00 2001
+From: Emilio Pozuelo Monfort <pochu@debian.org>
+Date: Fri, 5 Nov 2021 09:29:13 +0100
+Subject: [PATCH] udisks2 security update
+
+mount options: Always use errors=remount-ro for ext filesystems
+
+Stefan Walter found that udisks2, a service to access and manipulate
+storage devices, could cause denial of service via system crash if a
+corrupted or specially crafted ext2/3/4 device or image was mounted,
+which could happen automatically on certain environments.
+
+For Debian 9 stretch, this problem has been fixed in version
+2.1.8-1+deb9u1.
+
+Default mount options are focused primarily on data safety, mounting
+damaged ext2/3/4 filesystem as readonly would indicate something's wrong.
+
+Upstream-Status: Backport [http://security.debian.org/debian-security/pool/updates/main/u/udisks2/udisks2_2.1.8-1+deb9u1.debian.tar.xz]
+CVE: CVE-2021-3802
+
+Signed-off-by: Virendra Thakur <virendra.thakur@kpit.com>
+
+---
+ src/udiskslinuxfilesystem.c | 18 ++++++++++++++++++
+ 1 file changed, 18 insertions(+)
+
+diff --git a/src/udiskslinuxfilesystem.c b/src/udiskslinuxfilesystem.c
+index a5a3898c..eac8cab3 100644
+--- a/src/udiskslinuxfilesystem.c
++++ b/src/udiskslinuxfilesystem.c
+@@ -421,6 +421,21 @@ static const gchar *hfsplus_allow[] = { "creator", "type", "umask", "session", "
+ static const gchar *hfsplus_allow_uid_self[] = { "uid", NULL };
+ static const gchar *hfsplus_allow_gid_self[] = { "gid", NULL };
+ 
++/* ---------------------- ext2 -------------------- */
++
++static const gchar *ext2_defaults[] = { "errors=remount-ro", NULL };
++static const gchar *ext2_allow[] = { "errors=remount-ro", NULL };
++
++/* ---------------------- ext3 -------------------- */
++
++static const gchar *ext3_defaults[] = { "errors=remount-ro", NULL };
++static const gchar *ext3_allow[] = { "errors=remount-ro", NULL };
++
++/* ---------------------- ext4 -------------------- */
++
++static const gchar *ext4_defaults[] = { "errors=remount-ro", NULL };
++static const gchar *ext4_allow[] = { "errors=remount-ro", NULL };
++
+ /* ------------------------------------------------ */
+ /* TODO: support context= */
+ 
+@@ -434,6 +449,9 @@ static const FSMountOptions fs_mount_options[] =
+     { "udf", udf_defaults, udf_allow, udf_allow_uid_self, udf_allow_gid_self },
+     { "exfat", exfat_defaults, exfat_allow, exfat_allow_uid_self, exfat_allow_gid_self },
+     { "hfsplus", hfsplus_defaults, hfsplus_allow, hfsplus_allow_uid_self, hfsplus_allow_gid_self },
++    { "ext2", ext2_defaults, ext2_allow, NULL, NULL },
++    { "ext3", ext3_defaults, ext3_allow, NULL, NULL },
++    { "ext4", ext4_defaults, ext4_allow, NULL, NULL },
+   };
+ 
+ /* ------------------------------------------------ */
diff --git a/meta-oe/recipes-support/udisks/udisks2_git.bb b/meta-oe/recipes-support/udisks/udisks2_git.bb
index c4d0fa75e..58c8a9899 100644
--- a/meta-oe/recipes-support/udisks/udisks2_git.bb
+++ b/meta-oe/recipes-support/udisks/udisks2_git.bb
@@ -18,6 +18,7 @@ RDEPENDS_${PN} = "acl"
 
 SRC_URI = " \
     git://github.com/storaged-project/udisks.git;branch=master;protocol=https \
+    file://CVE-2021-3802.patch \
 "
 PV = "2.8.4+git${SRCREV}"
 SRCREV = "db5f487345da2eaa87976450ea51c2c465d9b82e"
-- 
2.17.1


