Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49D1AC433FE
	for <webhook@archiver.kernel.org>; Sun, 15 May 2022 13:49:50 +0000 (UTC)
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com
 [209.85.215.178])
 by mx.groups.io with SMTP id smtpd.web09.17035.1652622580990345138
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 15 May 2022 06:49:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=EkOnPT5C;
 spf=pass (domain: gmail.com, ip: 209.85.215.178,
 mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f178.google.com with SMTP id 191so610921pgf.4
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 15 May 2022 06:49:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=XLlgQ3jDxDDDUMww6g2vqAkAZbMHK4byKVtN5S0t4Ng=;
        b=EkOnPT5CTImNuAnALMPKOWNHL44goT7DTdEIytixTFNxz97BEYv+ZFgXwF5BIspkII
         aiJF1kAR2rG/h6lXZyS69zVWn6puC0lYrvD3SkXyGJCjxtaNOQuQf0P6qNQaIxbfq0Ys
         ndosgJBdupogHNkTeNbh+4z+/2qXxTfCBHjeQVHDoo9rqaTWlkT1r3ApImRubdKxwAxo
         m9R0bPbTmE3GPPQTfe9bG3jHxFh8Oc1RM3bnhnELVRMkLji4C1IHeny7eOl2YcYiUf9+
         I2wEinTENN9L1EyAljgT3izpHymbY3HtrNtn3jnv5m00/+vwg/5FbXZICBq/84ys/R+x
         OGag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=XLlgQ3jDxDDDUMww6g2vqAkAZbMHK4byKVtN5S0t4Ng=;
        b=6CJSP9/0SWONoGIy4cEXkaNZWfAwbmcENPcbWaeg0ioUI+6XxUWcPQmskzadTbqBME
         wIp0fb27F83OmMCqfAuc7N/AgiByphd8X5lvsx5AVgpGYZ2bfK3qCeClcGG/H6nGdSKp
         T+LpO51jyUdaNxW4bxh0rZJTo3WqoyLbg9CQloooXivv9URx+U1x2pi1LD/MKYCIW7yU
         EfRVPXkVEFLL24EJ4Z43S6UTjWyY5TWShRBS787G6Wj7+hAWkrSomhOzl49WQhDqjlCz
         RQo81Fg3k20mXWa4QEmc2ITfuOGeGoOv1Abia1C06PbCyMOatKCdhSSM3At2X57vWoJW
         l9ZA==
X-Gm-Message-State: AOAM530g72tB/8nJJ4kmLVAWz/DUVeIQ70//l74sO7PGT4YA0aeDnAq2
	KWQwUOg2jdzik9zGMnkIbscR3QkPmJyi+w==
X-Google-Smtp-Source: 
 ABdhPJwuRGMOaPP96+ArF94N1TWrIMwwEypKMevPAL4hg/YIRrBCOTJfxYzliDMixv6v5LASsaACXA==
X-Received: by 2002:a05:6a00:1a08:b0:510:a1db:1a91 with SMTP id
 g8-20020a056a001a0800b00510a1db1a91mr13121259pfv.69.1652622580185;
        Sun, 15 May 2022 06:49:40 -0700 (PDT)
Received: from keaua.caveonetworks.com
 ([2601:202:4180:a5c0:48be:3d3d:c26:7949])
        by smtp.gmail.com with ESMTPSA id
 z22-20020a63e556000000b003c644b2180asm4961650pgj.77.2022.05.15.06.49.39
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 May 2022 06:49:39 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [kirkstone 11/22] meta-python-image: Fix build depends
Date: Sun, 15 May 2022 06:49:11 -0700
Message-Id: 
 <c9b1e122a31de05db8762090fbe6a0a1d11d2462.1652622481.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1652622481.git.akuster808@gmail.com>
References: <cover.1652622481.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 15 May 2022 13:49:50 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97108

Signed-off-by: Armin Kuster <akuster808@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 91f01ce558e27dea6c5307d58a0426f5ca54fa58)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../packagegroups/packagegroup-meta-python.bb          | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
index f7bf365192..fdeb83c42a 100644
--- a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
+++ b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
@@ -12,9 +12,9 @@ PACKAGES = ' \
 # FORTRAN:forcevariable = ",fortran"
 RDEPENDS:packagegroup-meta-python3 = "\
     ${@bb.utils.contains("DISTRO_FEATURES", "systemd", "python3-systemd", "", d)} \
-    ${@bb.utils.contains("DISTRO_FEATURES", "x11", "python3-blivetgui", "", d)} \
+    ${@bb.utils.contains("DISTRO_FEATURES", "x11 systemd", "python3-blivetgui", "", d)} \
     gyp \
-    pamela \
+    ${@bb.utils.contains("DISTRO_FEATURES", "pam", "pamela", "", d)} \
     pyrtm \
     python3-absl \
     python3-aenum \
@@ -52,7 +52,7 @@ RDEPENDS:packagegroup-meta-python3 = "\
     python3-bitstring \
     python3-bitstruct \
     python3-blinker \
-    python3-blivet \
+    ${@bb.utils.contains("DISTRO_FEATURES", "systemd", "python3-blivet", "", d)} \
     python3-booleanpy \
     python3-cachecontrol \
     python3-cached-property \
@@ -84,7 +84,7 @@ RDEPENDS:packagegroup-meta-python3 = "\
     python3-croniter \
     python3-cson \
     python3-custom-inherit \
-    python3-cvxopt \
+    ${@bb.utils.contains_any('FORTRAN', [',fortran',',f77'], 'python3-cvxopt', '', d)} \
     python3-cycler \
     python3-dateparser \
     python3-dateutil \
@@ -327,7 +327,7 @@ RDEPENDS:packagegroup-meta-python3 = "\
     python3-pyscaffold \
     python3-pyserial \
     python3-pysonos \
-    python3-pystemd \
+    ${@bb.utils.contains("DISTRO_FEATURES", "systemd", "python3-pystemd", "", d)} \
     python3-pytest-asyncio \
     python3-pytest-benchmark \
     python3-pytest-cache \
-- 
2.25.1


