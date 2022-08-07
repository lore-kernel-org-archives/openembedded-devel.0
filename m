Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41CB6C48BEA
	for <webhook@archiver.kernel.org>; Sun,  7 Aug 2022 05:53:09 +0000 (UTC)
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com
 [209.85.215.179])
 by mx.groups.io with SMTP id smtpd.web08.11099.1659851583048069451
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 06 Aug 2022 22:53:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ABhybwiU;
 spf=pass (domain: gmail.com, ip: 209.85.215.179,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f179.google.com with SMTP id q16so5992892pgq.6
        for <openembedded-devel@lists.openembedded.org>;
 Sat, 06 Aug 2022 22:53:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=SgwG+CC25YOjubbyjIhLAJ3npBgZXPb5CtIfZs5jGok=;
        b=ABhybwiUFR5eE3rYQghYKHLyF6eLIRIEfF9jauLJrqfSyU2KTURb8sIOnrSZHePZa0
         EYpHEuIxAvQoSbsIakbXYctuGnr1BINA04GVeLDNkPCAH0NwGvOEsdnYU91x1Z9y1Nm/
         j87NCW1wMAvqrpPhap3qU3EfGNEtTc40WkDEpx+VrEDpNGzd4X/dAb0v3+Sr/vByGp3w
         T4D6NOnWOYNRhxJy8TeonePCvs3YdyIsltupkswFS69olxAFsA9CneByH25oeiDnTO6i
         /CncoBLiW5fsbYqiwOdIp6L77gsdzg0veRN/O+M8niJxfHw6tOSzbdDPQtTQ0YQOgYj6
         QN2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=SgwG+CC25YOjubbyjIhLAJ3npBgZXPb5CtIfZs5jGok=;
        b=4STI6naAT8j7etU9sptG1KkXTpwdiS7UKP+nVLCGxQ5a9IQ2LED4+BpXPt7OjRP9BB
         Jln1A7RveU7dPwlEetgI9Xm8kOxUb6KBVc1GiRWwh0Evu7gYszTENuVqIVvi4t1X4nL6
         jVSLbQu97oen6GV84hwJX0t/zEy0ZiikXbhCUGFFg7ESNVEnQ9Aq9aY1ogZo1sozuosr
         6OLmSKC5rxKIfIIKpHitbAPIBiP7WuW3E0s5QHkjOXLMKXMAr0G28po/u1wYW/SBC+za
         JY6MmmNm3hgzqP4b4mQO8v9pOWU1QFoyUQonbxNUlf2VaJUXqXvTxooTNwB7firYxRbK
         x/vQ==
X-Gm-Message-State: ACgBeo2hSm+/Qnyn7w8hLN88E3s+uGIKg7VUP6Z9J2cG+QyM4kYe061A
	OFYVrwgmv4IC5pYRhmXVekpnFZdjRys=
X-Google-Smtp-Source: 
 AA6agR4ohR1/VHoVfuQn8QlWvyv3V4Ibz+K/euwnRcJIRNFPkws8yEP0FtS3lRtH7SY6P71RwZ7EsQ==
X-Received: by 2002:a63:d315:0:b0:41a:d15a:b1b7 with SMTP id
 b21-20020a63d315000000b0041ad15ab1b7mr11662702pgg.275.1659851582052;
        Sat, 06 Aug 2022 22:53:02 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::9f45])
        by smtp.gmail.com with ESMTPSA id
 f20-20020a635554000000b0041a716cec9esm3872380pgm.62.2022.08.06.22.53.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Aug 2022 22:53:01 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-filesystems][PATCH 4/5] xfstests: Upgrade to v2022.07.10
Date: Sat,  6 Aug 2022 22:52:54 -0700
Message-Id: <20220807055255.2982774-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220807055255.2982774-1-raj.khem@gmail.com>
References: <20220807055255.2982774-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 07 Aug 2022 05:53:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98145

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-filesystems/recipes-utils/xfstests/xfstests_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-filesystems/recipes-utils/xfstests/xfstests_git.bb b/meta-filesystems/recipes-utils/xfstests/xfstests_git.bb
index 868fa0330f..a6fc89d606 100644
--- a/meta-filesystems/recipes-utils/xfstests/xfstests_git.bb
+++ b/meta-filesystems/recipes-utils/xfstests/xfstests_git.bb
@@ -9,8 +9,8 @@ SRC_URI = "\
     git://github.com/amir73il/unionmount-testsuite.git;branch=master;protocol=https;name=unionmount;destsuffix=unionmount-testsuite \
 "
 
-SRCREV_xfstests = "37881397f1aa62df3c63468049c80b301b0e89eb"
-SRCREV_unionmount = "cec4c51a3bf8ba80bb99fc74b302749d4e3d2f1d"
+SRCREV_xfstests = "47ed066309716c73a97fff9b7f557f72d90bffb4"
+SRCREV_unionmount = "e3825b16b46f4c4574a1a69909944c059835f914"
 
 S = "${WORKDIR}/git"
 
-- 
2.37.1


