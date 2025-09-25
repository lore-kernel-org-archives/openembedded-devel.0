Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 449CFCAC5A7
	for <webhook@archiver.kernel.org>; Thu, 25 Sep 2025 12:03:59 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.web11.9941.1758801836064350508
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Sep 2025 05:03:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YmNo82Y/;
 spf=pass (domain: gmail.com, ip: 209.85.218.45, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-b3164978f11so161153066b.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 25 Sep 2025 05:03:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758801834; x=1759406634; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OUVRYH5Zlfu9OxKpI9afBzEp+APA97W7JkD8c92l/a8=;
        b=YmNo82Y/MGAwRPR1Xu3oetiagWKVi6SIp974+7gRmbrBHdFaHcNfcdIA67obUvC4to
         8GJWLSfuO4C0L+QFFbl38qdRvstNd3KYZl62eFTchmQY2jAR8KclcefpYCvOzen+nqcQ
         CqudhFxhEalXPMCCnPxnMe5z+9TF3k1vukXiEq7YfyljWA0jM36eY+KXg17ynUinUwTu
         HWGQ04jDllAv52IWNcxukhZzDfP05iYBCbKtlOt/2SfTTWBH+MzBeZMjZCI1pBAPBJGQ
         1d7531fq4Uq0ooYZNUASpR8ralDD0SchpORiEb6r1gigunEhLUTL9WkFQ5hP45XPlcvf
         pGqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758801834; x=1759406634;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OUVRYH5Zlfu9OxKpI9afBzEp+APA97W7JkD8c92l/a8=;
        b=f/BQ1n/wZzuexrNKkFVoIv0k5Zze45JK1Rf600ZHzNdorWO3TX04h21C0ugXCBA/ir
         nvxuuze/m1rGTO5TLCrJcRUhGgV1V3xnSg8qlYekD5Xmy/EW6pHydGYmWycRlNuxbrgh
         BrUk9mvVBw4z496+HwoN3X6XDd96ZwkbsE8re049I3ECdqmnkQv0FPLTrc0ZEN1QH+Yj
         p0PV/Ul5z3H8y/ZumBXfXB/U909aRL3SNdldRjAuA4WJm/2nrR+l++gAereXPF+Y6tN9
         sIy9flrfHQZzcbh8YIOePpWRT3UsBOmdyjAH8+Lqmj0Bjf7UWdPPV22YzqF+gQb/YzTO
         lYlA==
X-Gm-Message-State: AOJu0YxjKBEf6wCV/l9V4FcHlDWiNTomoeUMq6zUTq0mLGcH4WbBruiw
	Ty23nPfcznHjjvaArw9DyJ62WlijRDXTJIYbuusXpMIJRJqAOdowNz//7jIx0m2F
X-Gm-Gg: ASbGnct6GKariN4R7ysIOfVrBZsxSVp4JqgieHyekhIhX/8zUneEZP2pxLN7Bc3+kRo
	aVT4PoUF34xlL3hMl2EAkb81nwzQu+QnAj2zFSXmeg/OmCWLLFgVFB0BNG8qR9GKh6e6FSoIPRI
	aa7ofgRtZcSRqGq00d/QaeXkqi8q3ysBYJ+H6Edp2On/ViHWwnyAwY+TYJ7J/2YrTOC8zOTFt2/
	A6v1pOhaFvuRpJQa2RdjQkD47g3BPKOmNQXAGIRnGkwX2JS/h2QMl8yTf59qI+4s8GRzNE+c6fd
	FHqSoBTlsZiXD1RhWBT5ksmgfWgTLauimrk5PLGARsQCqfR/x1hvtbkvihw0EjBpTAUG1lwmit6
	vL27ehiLAMjOtInFzdfdr
X-Google-Smtp-Source: AGHT+IHu+YhE/z+RMYFihkpRC8KjglrMmmY5NxjoRjIQKc4IEhMdQ4LS6QLkN0rjE3G1E1wvsnPKyA==
X-Received: by 2002:a17:907:7f0f:b0:aff:16eb:8b09 with SMTP id a640c23a62f3a-b34b6449b22mr318073866b.5.1758801834189;
        Thu, 25 Sep 2025 05:03:54 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b3545a98e54sm153761266b.97.2025.09.25.05.03.53
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Sep 2025 05:03:53 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-multimedia][kirkstone][PATCH 13/21] opencore-amr: upgrade 0.1.3 -> 0.1.6
Date: Thu, 25 Sep 2025 14:03:25 +0200
Message-ID: <20250925120334.1670367-14-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250925120334.1670367-1-skandigraun@gmail.com>
References: <20250925120334.1670367-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 25 Sep 2025 12:03:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119873

From: alperak <alperyasinak1@gmail.com>

Changelog:

0.1.6
 - Fixed an infinite loop when decoding some AMR-NB samples
 - Fixed noise spikes when decoding non-voice frames for both AMR-NB and AMR-WB

0.1.5
 - Fix an autotools issue with cross compiling from the 0.1.4 release

0.1.4
 - Autotools cleanups
 - Fixes for SID/DTX in the AMR-WB decoder, fixes for handling of bad
   frames in both AMR-WB and AMR-NB

Signed-off-by: alperak <alperyasinak1@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 55274f650e304074783d171a406454748b2d456e)
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../{opencore-amr_0.1.3.bb => opencore-amr_0.1.6.bb}        | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-multimedia/recipes-multimedia/opencore-amr/{opencore-amr_0.1.3.bb => opencore-amr_0.1.6.bb} (59%)

diff --git a/meta-multimedia/recipes-multimedia/opencore-amr/opencore-amr_0.1.3.bb b/meta-multimedia/recipes-multimedia/opencore-amr/opencore-amr_0.1.6.bb
similarity index 59%
rename from meta-multimedia/recipes-multimedia/opencore-amr/opencore-amr_0.1.3.bb
rename to meta-multimedia/recipes-multimedia/opencore-amr/opencore-amr_0.1.6.bb
index ab5813ebe9..be7977308b 100644
--- a/meta-multimedia/recipes-multimedia/opencore-amr/opencore-amr_0.1.3.bb
+++ b/meta-multimedia/recipes-multimedia/opencore-amr/opencore-amr_0.1.6.bb
@@ -4,10 +4,10 @@ SECTION = "libs"
 
 LICENSE = "Apache-2.0"
 LICENSE_FLAGS = "commercial"
-LIC_FILES_CHKSUM = "file://COPYING;md5=dd2c2486aca02190153cf399e508c7e7"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=dd2c2486aca02190153cf399e508c7e7"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/opencore-amr/${BP}.tar.gz"
-SRC_URI[md5sum] = "09d2c5dfb43a9f6e9fec8b1ae678e725"
-SRC_URI[sha256sum] = "106bf811c1f36444d7671d8fd2589f8b2e0cca58a2c764da62ffc4a070595385"
+SRC_URI[md5sum] = "03de025060a4f16c4c44218f65e13e95"
+SRC_URI[sha256sum] = "483eb4061088e2b34b358e47540b5d495a96cd468e361050fae615b1809dc4a1"
 
 inherit autotools

