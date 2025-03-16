Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CB3BC35FF3
	for <webhook@archiver.kernel.org>; Sun, 16 Mar 2025 22:55:45 +0000 (UTC)
Received: from mta-65-226.siemens.flowmailer.net (mta-65-226.siemens.flowmailer.net [185.136.65.226])
 by mx.groups.io with SMTP id smtpd.web10.39886.1742165736402115729
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 16 Mar 2025 15:55:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=SoZyWbn2;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.226, mailfrom: fm-256628-202503162255349f19052e5cf8581401-_ejxer@rts-flowmailer.siemens.com)
Received: by mta-65-226.siemens.flowmailer.net with ESMTPSA id 202503162255349f19052e5cf8581401
        for <openembedded-devel@lists.openembedded.org>;
        Sun, 16 Mar 2025 23:55:34 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=3plD5DB0OC29KtQu6wu64NgcPG4PKJoIbWLkG6RAUrI=;
 b=SoZyWbn2jlOk4BQ3itej8VVRMz8feVm5n+f/iWFBHUy1hZtulwVsPzinuYGSyT5SEs4LsQ
 yWPH2AF3jqD4VCFvb7SVK/iFlkziBeIO45WhxI3pNOoPCquxRHPeX+13EOGAYjGjJM+g1sbx
 jGjglpKU7dHwBJ12YNSAw5iF//UaO3DIQMvSbBYJrl9aAQzEis3AUYGFxIoEV2EiSVGgM4Kd
 Jbr1a/Th+r6FFh+5dRLLmYSndGQrZfwZKUehc4rNu8Iqvwbpwlsp3Ig4rOWaN7bf1rYT0WvG
 0gPbc3ZDc82uPhP0G+Z39YS+dWR02QAIOR/fLJ47e9bBQ68FtJCCe4mA==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-multimedia][PATCH 11/12] sox: patch CVE-2023-32627
Date: Sun, 16 Mar 2025 23:53:57 +0100
Message-Id: <20250316225358.2816208-11-peter.marko@siemens.com>
In-Reply-To: <20250316225358.2816208-1-peter.marko@siemens.com>
References: <20250316225358.2816208-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 16 Mar 2025 22:55:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116016

From: Peter Marko <peter.marko@siemens.com>

Use patch from Debian:
https://salsa.debian.org/lts-team/packages/sox/-/blob/debian/14.4.2+git20190427-1+deb10u3/debian/patches/0028-CVE-2023-32627-Filter-null-sampling-rate-in-VOC-code.patch

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../sox/sox/CVE-2023-32627.patch              | 30 +++++++++++++++++++
 .../recipes-multimedia/sox/sox_14.4.2.bb      |  1 +
 2 files changed, 31 insertions(+)
 create mode 100644 meta-multimedia/recipes-multimedia/sox/sox/CVE-2023-32627.patch

diff --git a/meta-multimedia/recipes-multimedia/sox/sox/CVE-2023-32627.patch b/meta-multimedia/recipes-multimedia/sox/sox/CVE-2023-32627.patch
new file mode 100644
index 0000000000..b4e9994eab
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/sox/sox/CVE-2023-32627.patch
@@ -0,0 +1,30 @@
+From b0b7e7fa7a48485c4d6b0ae64bfddedd519716f5 Mon Sep 17 00:00:00 2001
+From: =?utf-8?q?Bastien_Roucari=C3=A8s?= <rouca@debian.org>
+Date: Sun, 16 Mar 2025 23:25:15 +0100
+Subject: [PATCH] CVE-2023-32627 Filter null sampling rate in VOC coder
+
+Source: https://salsa.debian.org/lts-team/packages/sox/-/blob/debian/14.4.2+git20190427-1+deb10u3/debian/patches/0028-CVE-2023-32627-Filter-null-sampling-rate-in-VOC-code.patch
+
+CVE: CVE-2023-32627
+Upstream-Status: Inactive-Upstream [lastrelease: 2015]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ src/voc.c | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/src/voc.c b/src/voc.c
+index 0ca07f94..d8b982c5 100644
+--- a/src/voc.c
++++ b/src/voc.c
+@@ -353,6 +353,11 @@ static size_t read_samples(sox_format_t * ft, sox_sample_t * buf,
+             v->block_remaining = 0;
+             return done;
+           }
++          if(uc == 0) {
++            lsx_fail_errno(ft, EINVAL, "invalid rate value");
++            v->block_remaining = 0;
++            return done;
++          }
+           *buf = SOX_UNSIGNED_8BIT_TO_SAMPLE(uc,);
+           lsx_adpcm_init(&v->adpcm, 6 - v->size, SOX_SAMPLE_TO_SIGNED_16BIT(*buf, ft->clips));
+           ++buf;
diff --git a/meta-multimedia/recipes-multimedia/sox/sox_14.4.2.bb b/meta-multimedia/recipes-multimedia/sox/sox_14.4.2.bb
index 94072cb35a..7856407c67 100644
--- a/meta-multimedia/recipes-multimedia/sox/sox_14.4.2.bb
+++ b/meta-multimedia/recipes-multimedia/sox/sox_14.4.2.bb
@@ -35,6 +35,7 @@ SRC_URI = "git://git.code.sf.net/p/sox/code;protocol=https;branch=master \
            file://CVE-2021-40426.patch \
            file://CVE-2022-31650.patch \
            file://CVE-2022-31651.patch \
+           file://CVE-2023-32627.patch \
            "
 
 # last release was in 2015, use latest hash from 2024-05-30

