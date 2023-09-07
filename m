Return-Path: <sanakazisk19@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD3CFEE14D4
	for <webhook@archiver.kernel.org>; Thu,  7 Sep 2023 06:57:36 +0000 (UTC)
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
 by mx.groups.io with SMTP id smtpd.web10.7552.1694069853644737571
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 06 Sep 2023 23:57:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=Y7Vd2ARV;
 spf=pass (domain: gmail.com, ip: 209.85.215.180, mailfrom: sanakazisk19@gmail.com)
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-517ab9a4a13so482691a12.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 06 Sep 2023 23:57:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694069853; x=1694674653; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=p1fJUqj9S2MpgCPRVHdxcFB7bX706d20rbWG1+Q2s6g=;
        b=Y7Vd2ARVhnMQunawgpOiRGNmSJlsG369R6D103ATM60K/plHAMbpuqsrdE4M1L/BCH
         2V6d5IvondAEo9lP3Zq3kC2jTUIDMx9H3JvG+xPFC75emMzZAo+vuBb4UgTu1RG0WgPM
         jGMHrReyuLro/df+mIEfo6Yga91wQnS2k/2H/Ajc3z9lH0uwgqBUwj71SXKEalrIk+lg
         /HrnshRWc9xXLWtnaJr3TLpbH9gcfORlHv0HzEoiUjW75EWlWDugjjebg65J7YUxenfG
         mYDnJDRfoOC/9NqGMO+DEsyGpcZ1syzx9sgm48ip+3r2uv+arrn8/PxAfaUFda5MHBM7
         H6bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694069853; x=1694674653;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p1fJUqj9S2MpgCPRVHdxcFB7bX706d20rbWG1+Q2s6g=;
        b=JtajvqLThLuF8qAC8Ch40AtgJzjgmuEXGSfQVroufKjM8A+uMOkJc3y5VWFGnyfDVF
         ySL49jLrTROwqbKFtivJafudaP1SuQkXVhVYL+0tJz7J7LejTiLejem2/LhmsQscCxbS
         EKIniB5sVq9MTMIh0EQbetQS0pedFt/V4QAxJaGmTBwzVFPv6SHszEwUrntPKRsYJr+A
         Jvu1PPxClLdayF2hu7DsuTL4ENAOsIM1ZoWwbPTllxMNE4hNq0pourCq91ZfZ0ilaVpY
         TMbe8iHyRzR4kEVnjIr6u42YTPrpIWFWZeX5Q+rvNkCP8iLhZeWu6d0HoEdLFTvuoaDJ
         5dAg==
X-Gm-Message-State: AOJu0YytYkIlbO2sPx+uuW+Ew8U4rmvi81q8J/bViYkbj/DMCHGEOx1V
	IS0aQSXuYzAjHmyKJS6PCI0HTU9GWnm1pA==
X-Google-Smtp-Source: AGHT+IGBkrsBhri80COXzFKbZF+1oa6lMc026P229u6RJRka78x+3LylpxMO1ADZtQSyx6OGbYMWmQ==
X-Received: by 2002:a05:6a21:7905:b0:14d:7b6:cf2f with SMTP id bg5-20020a056a21790500b0014d07b6cf2fmr19760941pzc.47.1694069852493;
        Wed, 06 Sep 2023 23:57:32 -0700 (PDT)
Received: from localhost.localdomain ([182.69.125.69])
        by smtp.gmail.com with ESMTPSA id x6-20020aa793a6000000b00687dde8ae5dsm11664071pff.154.2023.09.06.23.57.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Sep 2023 23:57:31 -0700 (PDT)
From: Sana Kazi <sanakazisk19@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: sanakazisk19@gmail.com
Subject: [meta-oe][kirkstone][PATCH] ntfs-3g-ntfsprogs: Upgrade 2022.5.17 to 2022.10.3
Date: Thu,  7 Sep 2023 12:26:17 +0530
Message-Id: <20230907065617.2172750-1-sanakazisk19@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 07 Sep 2023 06:57:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104788

From: Omkar Patil <omkar.patil@kpit.com>

Changes:
Rejected zero-sized runs
Avoided merging runlists with no runs

Fix CVE-2022-40284

Dunfell and master both have latest version of ntfs-3g-ntfsprogs
2022.10.3. Therefore, upgrade the version on kirkstone too.

Signed-off-by: Omkar Patil <omkarpatil10.93@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 5d5e8854718dab02c2737e3faf288f830a514841)
Signed-off-by: Sana Kazi <sanakazisk19@gmail.com>
---
 ...3g-ntfsprogs_2022.5.17.bb => ntfs-3g-ntfsprogs_2022.10.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/{ntfs-3g-ntfsprogs_2022.5.17.bb => ntfs-3g-ntfsprogs_2022.10.3.bb} (95%)

diff --git a/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/ntfs-3g-ntfsprogs_2022.5.17.bb b/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/ntfs-3g-ntfsprogs_2022.10.3.bb
similarity index 95%
rename from meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/ntfs-3g-ntfsprogs_2022.5.17.bb
rename to meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/ntfs-3g-ntfsprogs_2022.10.3.bb
index b29716ad4..37a8106bb 100644
--- a/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/ntfs-3g-ntfsprogs_2022.5.17.bb
+++ b/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/ntfs-3g-ntfsprogs_2022.10.3.bb
@@ -10,7 +10,7 @@ SRC_URI = "http://tuxera.com/opensource/ntfs-3g_ntfsprogs-${PV}.tgz \
            file://0001-libntfs-3g-Makefile.am-fix-install-failed-while-host.patch \
 "
 S = "${WORKDIR}/ntfs-3g_ntfsprogs-${PV}"
-SRC_URI[sha256sum] = "0489fbb6972581e1b417ab578d543f6ae522e7fa648c3c9b49c789510fd5eb93"
+SRC_URI[sha256sum] = "f20e36ee68074b845e3629e6bced4706ad053804cbaf062fbae60738f854170c"
 
 UPSTREAM_CHECK_URI = "https://www.tuxera.com/community/open-source-ntfs-3g/"
 UPSTREAM_CHECK_REGEX = "ntfs-3g_ntfsprogs-(?P<pver>\d+(\.\d+)+)\.tgz"
-- 
2.25.1


