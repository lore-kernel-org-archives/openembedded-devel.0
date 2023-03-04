Return-Path: <festevam@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4532DC678D5
	for <webhook@archiver.kernel.org>; Sat,  4 Mar 2023 19:29:07 +0000 (UTC)
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
 by mx.groups.io with SMTP id smtpd.web11.16333.1677958141025210323
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 04 Mar 2023 11:29:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=nEScMGUO;
 spf=pass (domain: gmail.com, ip: 209.85.167.172, mailfrom: festevam@gmail.com)
Received: by mail-oi1-f172.google.com with SMTP id bp19so4305639oib.4
        for <openembedded-devel@lists.openembedded.org>; Sat, 04 Mar 2023 11:29:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1677958140;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=elXjQnH7JPa+cPd/X4Uecpa8OGucwjcspNo2afy3MYE=;
        b=nEScMGUOB1tGTh+9C66b+anfO/G2glnyIywlYa0C41f8XugZWD0aA5193rzpwWK1pT
         KzN8pbNlc352aDRfyBpsAiecS8hrfUMjzQt9MFxxGx/Sw/31o7tt3CxKkq1xy9S5o2lK
         eECYMaAozRAtrk0NzLBUZNezQegg+/o/MQgmhbsWWMYfw8rMOPiJGd4Iw8+OCP1aZhXC
         tvTJc3Dbx9ocOFEwtiOQwGNG8W/xwqhcuGv6WVxg1lgnW/lyq1IgG5UoaUD7po3bA2LN
         M1NID/Glh64MoSxQL+oHCGCSPGqqTpyd9vgczno2PdagmwzJ5xpfqEkcsI8KG/hEGTzS
         vwYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677958140;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=elXjQnH7JPa+cPd/X4Uecpa8OGucwjcspNo2afy3MYE=;
        b=4lOw2xhWxGlNwqcIvMlSLTYkklD8hOaWmmUE2NEVFx16Y/mSCfpxb8U0JfhYS4CPqU
         AITMLMfD10eVGct5QPCNZ4TB70euTXCOMgEMnFezahB9o5kLpT08wxoQ3snmszjOlU3+
         fb1db9z65Z0IGjRP+bmWjrp4mDSatCHzjC5gqY+khcE1Z+66O9ifVTMjjVKNt3pO9bHy
         yJwe5DmFa0KQGvOMgvI20vn+mpWKlllLvoiRkpGpDlTwWAhHyKlTMvRhPeHYKqlt2Prq
         PJ8f/zbIs/FWMYBtUHdiUWVlqcO1pubXwVElaliEXy8VkIpYxySzK9EYj2R2kx3Yidfc
         tXmA==
X-Gm-Message-State: AO0yUKVDGRUg4BhdehU+/nY3WtdxnCnECdl9d8lgpiZn/UdFo6bC8zWU
	800I0pjp4n0aqBoN5xZub5Zm8+IH98Y=
X-Google-Smtp-Source: AK7set8/1T3ZZ28Zu6CSBcRh1w/W8jDax4q7bW1FePqJIZeor7DeRLsGuT9a9265MK/8bJza6HeRvw==
X-Received: by 2002:aca:e182:0:b0:384:f0d:de5b with SMTP id y124-20020acae182000000b003840f0dde5bmr2946728oig.2.1677958139869;
        Sat, 04 Mar 2023 11:28:59 -0800 (PST)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b69:2725:be7e:f2d2:38a4])
        by smtp.gmail.com with ESMTPSA id e129-20020acab587000000b003847ca255fasm2312013oif.30.2023.03.04.11.28.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Mar 2023 11:28:59 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Fabio Estevam <festevam@denx.de>
Subject: [PATCH] iperf3: Update to 3.13
Date: Sat,  4 Mar 2023 16:28:53 -0300
Message-Id: <20230304192853.344341-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 04 Mar 2023 19:29:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101379

From: Fabio Estevam <festevam@denx.de>

Update to the 3.13 version.

The iperf3 release notes are available at:

https://github.com/esnet/iperf/blob/6bfe27d82a3f74ad1239aba987a4fb75c1005078/RELNOTES.md

The only change in the LICENSE file was the year update.

Signed-off-by: Fabio Estevam <festevam@denx.de>
---
 .../iperf3/{iperf3_3.12.bb => iperf3_3.13.bb}                 | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-benchmark/iperf3/{iperf3_3.12.bb => iperf3_3.13.bb} (89%)

diff --git a/meta-oe/recipes-benchmark/iperf3/iperf3_3.12.bb b/meta-oe/recipes-benchmark/iperf3/iperf3_3.13.bb
similarity index 89%
rename from meta-oe/recipes-benchmark/iperf3/iperf3_3.12.bb
rename to meta-oe/recipes-benchmark/iperf3/iperf3_3.13.bb
index 8c5ce36e8..62a95b303 100644
--- a/meta-oe/recipes-benchmark/iperf3/iperf3_3.12.bb
+++ b/meta-oe/recipes-benchmark/iperf3/iperf3_3.13.bb
@@ -11,14 +11,14 @@ BUGTRACKER = "https://github.com/esnet/iperf/issues"
 AUTHOR = "ESNET <info@es.net>, Lawrence Berkeley National Laboratory <websupport@lbl.gov>"
 
 LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=68ae8cfc577a2c8c51bb51e9628e80b7"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=dc6301c8256ceb8f71c9e3c2ae9096b9"
 
 SRC_URI = "git://github.com/esnet/iperf.git;branch=master;protocol=https \
            file://0002-Remove-pg-from-profile_CFLAGS.patch \
            file://0001-configure.ac-check-for-CPP-prog.patch \
            "
 
-SRCREV = "e61aaf8c95df956cefbc54fab7b3d78914664180"
+SRCREV = "f48e7fa92b8932814f3d92f36986d51be9efe6e0"
 
 S = "${WORKDIR}/git"
 
-- 
2.34.1


