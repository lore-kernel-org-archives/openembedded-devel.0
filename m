Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C1A3CA6012
	for <webhook@archiver.kernel.org>; Fri,  9 Oct 2026 10:06:26 +0000 (UTC)
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4470.1791540384922268530
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 09 Oct 2026 03:06:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=or45FYja;
 spf=pass (domain: gmail.com, ip: 209.85.215.177, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-cc1d57602e8so1866573a12.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 09 Oct 2026 03:06:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791540384; x=1792145184; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zO6fVCmdJGAuYUYzQttECH9er2gcqkmjxZUFtmyO1h0=;
        b=or45FYjaRO/fEBb6+iXJx4sIYQTKV7F41Q1OVceL+5XZhwnj18ou24OPR9kRE2cNMk
         PS89d25Nayt9eqYMLeENHbRizDYdFRo63S1GPO+PjAsjbxus3yA8y+0iyRPqdKd6rAL6
         DlR5z8/v+HCYYrZOU1SNSKx3s28bAmrqJ0N/Meb4M7iFlmHs8/XrB7WEAF65JPqrsoJg
         qLaO/FZenTfwNWbSTHlS3taHdcLN0wS0k5zwAbbYrz/FQlnJhaPmRxXGtVZAlVZ9L0CJ
         t65pj+7T+H2JKC/aja1T4g1/KkbUGgn1DsAVM7Z5G1OPydH0rqiePevwN8NjArk+wnAB
         +FRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791540384; x=1792145184;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zO6fVCmdJGAuYUYzQttECH9er2gcqkmjxZUFtmyO1h0=;
        b=Rw3LT6t87NBEcLFOR46jGGU1NUTT/MTCSQLZ7bWUBOlKL2fe5OObR4+IGVxJ1P5fTU
         MhvkSV8FSnv4P1jvZuBwItGri9mhWo/vJ7XmPVDElgwCphHQja06A0rI3WaKYFukN5xa
         W7bPJiC2J1Yom1ZL3NpjIkuEgzeFlCNKidvpMhLxflNiyxwVajTvNdFf0h/LIQjOK/FH
         8+Nb6FfO5SzZysUGYaaViDdAIk2YSamAiFGJgQ0EK05/JP4C9uxDg7AzimrZ67uwj5dQ
         yiH40UAfIcTuN66FdRs1zhAhLJ32U+8P3E7TVYzqJK6jHC7Z/CSYYAnx9PNBrBcUIRgL
         l26A==
X-Gm-Message-State: AFq9FYJWYdnqVw/HJSyYfm31s6P9PlchC371f9sTBFH2CjZMNXmzq5jg
	LwElqKH9kr/pecxHDspkdGlj3cq2lC5JKIswaDdRITNkymBxj/dGVMbuaHtRRg==
X-Gm-Gg: AYBFou2FfaqxLlzv3Z9AKEtg0EgT2uGdyOiVcmlZPSFW0oNfFNaR3VvFEDcyQ5lkxLb
	z5HP4VXaUb/TcmecMkdEjmwh0k4NQJCPtEPn0KupYQYDHxdxbCtJAo7lRSkqg8OMbHAnsTO6e4O
	fLZKDUExyvfY6K9L9di2EXpiPxUxvfH3aWq7ZVg4z+7n88wTV68UT1bsuswWIXOTovps7/H+qXA
	bXAT6RT0oVuqFPVmZDsUDmvZf052BTAT7AKzeuSfDHsXN41z5hOtRD7hIuGBSUyXNNvI8sXiPHw
	89rocsjd2mtaKoF8E8LTafJl3MOxgRQbkniViTtUizT8NKN3gdOB8GMJkQQ/T6Kc4AoK7FIjU62
	FpdZw/FBSuOanFeOsgVJLrsMAzSirSBiODDwx058LbfZPPjowa/9eqdAJF3+hzKdYbSTubgUuew
	GZJgq+5BGBgRcUXc3t96Z8BZjqjlxkP3HssiuuhfVfTXfEiNez3YkV3mbV0n9z78BwtwQD/juXm
	+4sYVYRKEG6pxE0z4sbBCC9OBEvw7Snssqhvq/jXg==
X-Received: by 2002:a17:90b:258f:b0:3a6:f1d2:57f3 with SMTP id 98e67ed59e1d1-3ab3a8d974emr1306384a91.58.1791540384272;
        Fri, 09 Oct 2026 03:06:24 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.brunswick.com ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab38fc9e52sm2723866a91.13.2026.10.09.03.06.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 03:06:23 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-python][wrynose][PATCH 8/8] python3-werkzeug: upgrade 3.1.8 -> 3.1.9
Date: Fri,  9 Oct 2026 23:05:43 +1300
Message-ID: <20261009100544.1428938-8-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261009100544.1428938-1-ankur.tyagi85@gmail.com>
References: <20261009100544.1428938-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 09 Oct 2026 10:06:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130692

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://github.com/pallets/werkzeug/releases/tag/3.1.9

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../{python3-werkzeug_3.1.8.bb => python3-werkzeug_3.1.9.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-werkzeug_3.1.8.bb => python3-werkzeug_3.1.9.bb} (91%)

diff --git a/meta-python/recipes-devtools/python/python3-werkzeug_3.1.8.bb b/meta-python/recipes-devtools/python/python3-werkzeug_3.1.9.bb
similarity index 91%
rename from meta-python/recipes-devtools/python/python3-werkzeug_3.1.8.bb
rename to meta-python/recipes-devtools/python/python3-werkzeug_3.1.9.bb
index fae4de2a3f..d3b1598f78 100644
--- a/meta-python/recipes-devtools/python/python3-werkzeug_3.1.8.bb
+++ b/meta-python/recipes-devtools/python/python3-werkzeug_3.1.9.bb
@@ -10,7 +10,7 @@ HOMEPAGE = "https://werkzeug.palletsprojects.com"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=5dc88300786f1c214c1e9827a5229462"
 
-SRC_URI[sha256sum] = "9bad61a4268dac112f1c5cd4630a56ede601b6ed420300677a869083d70a4c44"
+SRC_URI[sha256sum] = "55ca7c70a75689be937aa27f8ff4b018f06ff4838fc73045560bf0f5a1291060"
 
 CVE_PRODUCT = "pallets:werkzeug palletsprojects:werkzeug"
 

