Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE2E3C3601E
	for <webhook@archiver.kernel.org>; Sun,  6 Apr 2025 07:23:19 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.web11.20652.1743924198146823555
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 06 Apr 2025 00:23:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=h2Z21hoi;
 spf=pass (domain: gmail.com, ip: 209.85.216.42, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-301c4850194so2613967a91.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 06 Apr 2025 00:23:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743924197; x=1744528997; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ccNwV+Ene+3DLa3dYeupVVtTVru/atSgaQK0fVxOXm8=;
        b=h2Z21hoiDW6E/8sM8pNu2AfjnaWG8je4AatQkDGDcmNzl1S2UX+By0LPILbGaw/Oic
         BtXzA4pz8HdEE+jXvXxnoSJ+D5Pcpe4jsHLkhbMcQ+2AVkcYMPgfOwq/TwRPCXbYduNz
         XkqEZZlZX1z7G26f680/yl1pOVLnu+3RFHwt1sw4V0OTkJ6TiulVBtpLWNdwgxwS8G1U
         1bZEGhkkYMlQAao3KOPPXQuTLUmus3jMaGjrodVsmoEsxU6jxBawpebvfkjPBLp1V0Fl
         tsRNf7RL4gYrBPgIgkLuGK1NJO3OqdxhqoQumZWIJcp2ltqesDnFoAO91isKYL3GsHYn
         +DKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743924197; x=1744528997;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ccNwV+Ene+3DLa3dYeupVVtTVru/atSgaQK0fVxOXm8=;
        b=EsWLppF3wQrPr78QDMwEYyVxQ6xS1c4kxBZal4S5Ml76KOYiBNAb6WhIC7F5wWSzJA
         FW4eu8hZ0NF1EfifnvrDp2B+HuAJJHW7sViXmdw7oNoSNFfTFvpNuf5wh3Ib70kmSH3v
         LbcR8ibr+7HymSfEG4bYxwqCKcAaRbW9uU7ORLd0HdKhf/czDnauKUIiTPc/PASEhP3s
         1AIXAKsJcz3+SgTcjnw9EDvFm4ijIzcSXLYCnA2Lf5sB1O5Skz70njY3NKvPpzr1L7uJ
         Lz0Q0ei0gcJ3h9lj8Qk9oLImhH8jIajjHxEkdFhes7P5w3W56ygBBFFrUIdU4koqhmFF
         v4NQ==
X-Gm-Message-State: AOJu0YzaabFBbvs2Ho3F7lwo7QwzjR+AKPIUp0FOo4EhstV3JK41oil4
	GKr9wVaTV0lwET/8gBXoEH5ezj/m1GzyAhouLnCzdDtSs8DVl5RDmiCv1quY
X-Gm-Gg: ASbGncuXIYGUu3KLHyKswkgthbHVMkRm5gQT07h2evYqC6WBX10lGdGJ9xKmvD93QCX
	FP7cl9f9vbC6fYqTaCFkjNMWMutb8igQmjdd6zP9sJecp4k5Ib+wfeE7gAgnuJ4J0JuzqBPm9Or
	C/B33RBSCWtEv+xThEIT5hNnM7vHuUluNXmT8Bf5bvWPN5pJLbe4iv3vJS118R+vY3QUq0I96No
	q/ZQjxGJQ7a9xj6VkoAobdGlC9M05MAQv1oxNl/qeYoakL8jPb0S3FfX2G2qwifVd94rlbdAsXV
	fE6zPMUht6YCUBHaEWPxOBvVAKb6/Mj44Xs+
X-Google-Smtp-Source: AGHT+IGVOjBI/p9Tcvp9esAIhGq8k0sr4eNqI6viqqqtJIikAhq+FagOpikBKr4Ng3TWLoxiE6eTHg==
X-Received: by 2002:a17:90b:2542:b0:2ff:702f:7172 with SMTP id 98e67ed59e1d1-306a4b86ccdmr13950717a91.33.1743924197037;
        Sun, 06 Apr 2025 00:23:17 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::f900])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30561c98496sm11373673a91.0.2025.04.06.00.23.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Apr 2025 00:23:16 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 5/5] unicode-ucd: Updates due to license.txt updates
Date: Sun,  6 Apr 2025 00:23:10 -0700
Message-ID: <20250406072310.862374-5-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250406072310.862374-1-raj.khem@gmail.com>
References: <20250406072310.862374-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 06 Apr 2025 07:23:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116609

This is downloaded and does not have version, so we have to
update it whenever upstream update it. The copyright year
is changed this time.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-support/unicode-ucd/unicode-ucd_14.0.0.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/unicode-ucd/unicode-ucd_14.0.0.bb b/meta-oe/recipes-support/unicode-ucd/unicode-ucd_14.0.0.bb
index 026d4ffe02..302b86009a 100644
--- a/meta-oe/recipes-support/unicode-ucd/unicode-ucd_14.0.0.bb
+++ b/meta-oe/recipes-support/unicode-ucd/unicode-ucd_14.0.0.bb
@@ -1,14 +1,14 @@
 SUMMARY = "Unicode Character Database"
 HOMEPAGE = "https://unicode.org/ucd/"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://${UNPACKDIR}/license.txt;md5=4b11b5cbb0a24df9f4e7db63db98f22f"
+LIC_FILES_CHKSUM = "file://${UNPACKDIR}/license.txt;md5=ea17640caddb659394df50e5db6efd69"
 
 SRC_URI = " \
     https://www.unicode.org/Public/zipped/${PV}/UCD.zip;name=ucd;subdir=ucd;downloadfilename=unicode-ucd-${PV}.zip \
     https://www.unicode.org/license.txt;name=ucd-license \
 "
 SRC_URI[ucd.sha256sum] = "033a5276b5d7af8844589f8e3482f3977a8385e71d107d375055465178c23600"
-SRC_URI[ucd-license.sha256sum] = "f7830d126f59d83842565d3dddedc79db4ca978ed52aee0ebcc040ea76a85519"
+SRC_URI[ucd-license.sha256sum] = "abf84f74dea2812799e1dbef7f0581adf7db244881e4febb8684f441568da0ad"
 
 inherit allarch
 

