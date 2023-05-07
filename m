Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDD7BC77B7C
	for <webhook@archiver.kernel.org>; Sun,  7 May 2023 18:30:23 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web10.72582.1683484217129965190
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 07 May 2023 11:30:17 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=gciUIiNH;
 spf=pass (domain: gmail.com, ip: 209.85.214.171, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-1aad5245571so24695055ad.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 07 May 2023 11:30:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683484216; x=1686076216;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NY2/7tggJKvRxpkUWdn7ls9uMzirAg2TG9ek8LGVFHI=;
        b=gciUIiNHqzAqY6z23+9TGC7OrbHyylycePq/DmMkDxnCb9y+VjoUG/R2ADloHuU9gk
         5vOsbQ/gv67/yL3lTx1hoK2q6uft5kCT/BqP12Yr1nu5aGP9dRw2Xfu9UKbkzog0MpK6
         hqcQY0pVpKtcFePwRvGYuylB+rIu8Za+DD4BtpSGpxLiyAwwCOdWz0k5VjgvcJJottRh
         fWMz5ZtzLWk5nsUiPSnxvKnG8ViUJZJe3TOTm4WeP3EAtVKGj9obAjTp/mttad1F6HsA
         xtgkEMAVpSYzp9TyFaQa4P/O2MFW4TrpCu96WqusMcuD2UxAQXeJnBZUpx/0KVHCApEh
         4AMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683484216; x=1686076216;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NY2/7tggJKvRxpkUWdn7ls9uMzirAg2TG9ek8LGVFHI=;
        b=lpxWJW8nLkdIiyIwFtOTLvbjiJZRCqkzAyRjKHulD7Skzk5Amn1LiX0dI51WQ2F0al
         xzUy0xRWyZwK0FcEPnfJn/r6W/KpI4AQZmgYutjIdrCRKIgD/i6JGB1ik85sZKSVQogf
         YVVvL8TjIJh4EJIe+65H59mgmcw+jVtIerCF/RPrxEhspfH9OpCyu/yLqwGSvRb0DNwI
         MdwVMgvl6+VwcRHKDiBz5ctIFpyfqfMs5ZBg/mCq8trhuUzDPrm4FTnsp/kFUNDcNQRj
         XJgUz4/HYX8AE3g70qfsy9DLFp+IOwIcTmLZ0kNi07YiXXcaRb1nBc2S+hM+kuNhzy2W
         hYoA==
X-Gm-Message-State: AC+VfDwbWuHZGilGPFcyoKYol4b62uoP0acTCCR6Hz1xRBDs6p27lX0O
	aUtyTz4w8dMTXsUu0Q1auwdS9A5rCdlOWQ==
X-Google-Smtp-Source: ACHHUZ4aXyd4P7jX4a+UmCBMRZwL5rkniZVR9q4Knq/ReBVY7vvSABcyqY3xzBRK/Y0/8BwUJOT7Gg==
X-Received: by 2002:a17:902:c40a:b0:1ab:1a73:7c7f with SMTP id k10-20020a170902c40a00b001ab1a737c7fmr10995399plk.63.1683484216116;
        Sun, 07 May 2023 11:30:16 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:d380::298a])
        by smtp.gmail.com with ESMTPSA id a13-20020a170902b58d00b001a6d4ea7301sm5377421pls.251.2023.05.07.11.30.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 May 2023 11:30:15 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-perl][PATCH 1/2] libencode-perl: Remove buildpaths from generated .exh files
Date: Sun,  7 May 2023 11:30:13 -0700
Message-Id: <20230507183014.2466816-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 07 May 2023 18:30:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102360

there are generated .exh files which has the absolute perl interpreter
path in comments, which is caught by build QA, therefore remove the
absolute perl native path prefix

Fixes warnings like
WARNING: libencode-perl-3.19-r0 do_package_qa: QA Issue: File /usr/src/debug/libencode-perl/3.19-r0/def_t.exh in package libencode-perl-src contains reference to TMPDIR [buildpaths]

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-perl/recipes-perl/libencode/libencode-perl_3.19.bb | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta-perl/recipes-perl/libencode/libencode-perl_3.19.bb b/meta-perl/recipes-perl/libencode/libencode-perl_3.19.bb
index 352517ca67..79934e2229 100644
--- a/meta-perl/recipes-perl/libencode/libencode-perl_3.19.bb
+++ b/meta-perl/recipes-perl/libencode/libencode-perl_3.19.bb
@@ -21,8 +21,8 @@ UPSTREAM_CHECK_REGEX = "Encode\-(?P<pver>(\d+\.\d+))(?!_\d+).tar"
 
 S = "${WORKDIR}/Encode-${PV}"
 
+#EXTRA_CPANFLAGS:append = "PERL=../recipe-sysroot-native/usr/bin/perl-native/perl"
 inherit cpan ptest-perl
-
 do_install:prepend() {
     # Requires "-T" (taint) option on command line
     rm -rf ${B}/t/taint.t
@@ -32,6 +32,10 @@ do_install:prepend() {
     rm -rf ${B}/t/use-Encode-Alias.t
 }
 
+do_install:append() {
+    sed -i -e "s|${STAGING_BINDIR_NATIVE}/perl-native||g" ${S}/*/*.exh ${S}/*.exh
+}
+
 do_install_ptest() {
     mkdir ${D}${PTEST_PATH}/bin
     cp -r ${B}/bin/piconv ${D}${PTEST_PATH}/bin
-- 
2.40.1


