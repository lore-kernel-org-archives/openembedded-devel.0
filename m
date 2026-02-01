Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 461FFE65281
	for <webhook@archiver.kernel.org>; Sun,  1 Feb 2026 14:26:01 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.30363.1769955953622501373
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 01 Feb 2026 06:25:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ESQXXas+;
 spf=pass (domain: gmail.com, ip: 209.85.128.45, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4806ce0f97bso30321575e9.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 01 Feb 2026 06:25:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769955952; x=1770560752; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bZ2fj5eNmlOwC+HqSq5nYW6Kyqz+FGHqSsdTi/kj5uo=;
        b=ESQXXas+vvtBWJuetJvtRLeIIDvcFL0bvSE21XdUtWUoRO2nA7zbIl4e8oI7OgW+4W
         0vX+a3mvt3im7MBPKnXG6rL5cUtKAGekvZGv31p2/KrUNjcaTDJJWhF2TXRDihvu+8Qs
         aqFFp3xM5H0ozvedfbmgpWrjFkziWn977lWhAPNUVcmGMYpKkHVHcTXNBWbfctE5CvQV
         9wdEgwg/K0rUlRxtWf1JeR1FeMObQWup6YG6T21augoaLP1ulV0xPEGKr1iYm7OK7YEb
         1jpMza2Z4b2kfSsACTeDwceQW5cKSfeKoARtBzc3eKTDfFHLN5WyLi1xxoDdHOgLLCHR
         Hfyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769955952; x=1770560752;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bZ2fj5eNmlOwC+HqSq5nYW6Kyqz+FGHqSsdTi/kj5uo=;
        b=SRZ98LPtNSHCMmVEEH40nygqgiQZjrJb+08Rmt5zdXwFUHmO9rbYQo019hS5ZnDrj+
         nrqMzrH+llMyQWyR9Vmn8Hl1OorDJcCiDMN1sSVBIVPU2LJ4K2pSGQPLnZbpwOxxBaas
         RnrlXek8NFrMcbkyRMagvCDSva/c+st2tVfcepmumS9yqme1k4RATI824ewbhRKFLxK0
         iPbEAZ9AE6IlcZNLSwb42NpMT6rWTcthgHJ0G3O+9pIMreZzy43zGRAr2+uYLQNowtyt
         0Q29EA78dj2n36sKrdcqBSlBYKIIA70QhcjyfVcRxstXajqr9vaYL5/nwLotqiHNYAoh
         JHHQ==
X-Gm-Message-State: AOJu0YwfGxg4MN2I9LTqyB1N7tlEG2rS5hxRYPHq1wxbzCH4h/sv9Gp0
	9Ph65tjlJubQIbiF016CcLV0pYB3cNpYx6hwu4bOW29RKZow4k/Yej86nAv/Ow==
X-Gm-Gg: AZuq6aJqPm2aJqT6eal5Hqoutt3Ik9S4cyFbNtqtQDhMg/DkSntn7d9uURZpnzkcOUP
	DtsSs3uPQtXMsZuIIMYcpzkZsYSpQTP3w6sMfo00DiuEpbHvAz6EytYfk3dacXLzN3hhLSneq8M
	n7jY/XgiaOD75RJDLo8+hqJYef5VvfTIvCwXkKG72byOb+dGK7AiEFqRxU6DBktD0bRqHju9bUM
	LxxFxThfHnGvwBvhVDohc/vqLB8y0JSYeFKsyXFNK/ounfdJyHckBvxBfxXUT/4AoiOoLdmsUla
	dhN/v8CUMV7Bqa1Dy3V5WhXYw4FOdq20GlFFSm5BDpF+JP4I/91o+092yAf2DrqXG2XZuAGyZoK
	gbbmUy1PubxB9Yf/OObOunpjtccOnElVyHxIusjRy+a5Py3WolQ+5fKRFL14bbuAnuRhWyEbg3/
	Rd3J1e3iH7
X-Received: by 2002:a05:600c:5289:b0:477:abea:9028 with SMTP id 5b1f17b1804b1-482db44931bmr132646615e9.6.1769955951879;
        Sun, 01 Feb 2026 06:25:51 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48066c37433sm356723755e9.10.2026.02.01.06.25.50
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Feb 2026 06:25:51 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][whinlatter][PATCH 2/2] unicode-ucd: adjust to correct checksum values.
Date: Sun,  1 Feb 2026 15:25:49 +0100
Message-ID: <20260201142549.771383-2-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260201142549.771383-1-skandigraun@gmail.com>
References: <20260201142549.771383-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 01 Feb 2026 14:26:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124039

From: Tom Geelen <t.f.g.geelen@gmail.com>

The checksums are wrong and thus this fails to build.

Signed-off-by: Tom Geelen <t.f.g.geelen@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit dc5132edf7c7464371122ea9af871406fa66635a)
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-support/unicode-ucd/unicode-ucd_14.0.0.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/unicode-ucd/unicode-ucd_14.0.0.bb b/meta-oe/recipes-support/unicode-ucd/unicode-ucd_14.0.0.bb
index 890568d727..7a1b463c5d 100644
--- a/meta-oe/recipes-support/unicode-ucd/unicode-ucd_14.0.0.bb
+++ b/meta-oe/recipes-support/unicode-ucd/unicode-ucd_14.0.0.bb
@@ -1,14 +1,14 @@
 SUMMARY = "Unicode Character Database"
 HOMEPAGE = "https://unicode.org/ucd/"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://${UNPACKDIR}/ucd-license-v3.txt;md5=ea17640caddb659394df50e5db6efd69"
+LIC_FILES_CHKSUM = "file://${UNPACKDIR}/ucd-license-v3.txt;md5=3049f4ad14be1ebf8c80a93d9d32b2d6"
 
 SRC_URI = " \
     https://www.unicode.org/Public/zipped/${PV}/UCD.zip;name=ucd;subdir=ucd;downloadfilename=unicode-ucd-${PV}.zip \
     https://www.unicode.org/license.txt;downloadfilename=ucd-license-v3.txt;name=ucd-license \
 "
 SRC_URI[ucd.sha256sum] = "033a5276b5d7af8844589f8e3482f3977a8385e71d107d375055465178c23600"
-SRC_URI[ucd-license.sha256sum] = "abf84f74dea2812799e1dbef7f0581adf7db244881e4febb8684f441568da0ad"
+SRC_URI[ucd-license.sha256sum] = "e7a93b009565cfce55919a381437ac4db883e9da2126fa28b91d12732bc53d96"
 
 inherit allarch
 

