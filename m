Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 592F7CCD183
	for <webhook@archiver.kernel.org>; Sat, 11 Oct 2025 06:20:52 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web11.6175.1760163650649213512
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 10 Oct 2025 23:20:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TVDhweeR;
 spf=pass (domain: gmail.com, ip: 209.85.214.174, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-27c369f898fso36438375ad.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 10 Oct 2025 23:20:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760163650; x=1760768450; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Z/u8/+hqn0Hn32aFb6K0yvQLR/SVwMz9xm6Pd+yXTXE=;
        b=TVDhweeR+3AMt+FBEkmXP6RqzpUCDzAOcKnrg4UjaK9cpjUSwjz/4Oa+qWLksPmTdf
         IrWigNWtRtxMM5O2ljX5CSFFUq1X9uyOI/VXaCFZ3fY3ntL1mxu2diioyHbnH68HQsQK
         2LIaSlGTsMIyzTyBV7DaswDiMsRs1d4HAVMPwm7jl0EDpeEYi471bZq81WkWzA2eaGIy
         qJZUo5pRuAzfT6mJjiT53UcfS1uJTpdKV379DCAwRD3l0Pu+rFYrredG6j4weL14ayBD
         IktYE6Ivu7JW7hMlGi3pLUTh9JX/6DXapv945cHD6UrAM9QyannZ4PgkGK/emosfwJD/
         V87w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760163650; x=1760768450;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z/u8/+hqn0Hn32aFb6K0yvQLR/SVwMz9xm6Pd+yXTXE=;
        b=tNghucBm6gI1y8904yiLeZhJAbsmnWYJw5acah12DEeXN9u2lc3aUYQSklgNA4zoI4
         rNSUEDYz/O72tlBhlKHUMtTuQyKMzlyyn7Lo+HNtcI1htgK2Pal043jWCRVt/cZXLUgA
         J2SRdhuSVp+Pligd8GLrpxSUteU4neQmBz/S//BPmw7qE8noa8ozJeIKSCBgvCS2uLkL
         z/lRDJdWx8zJ5H1vh1xDCR9CT8rjr8x1qjH1kna+a26Nhvk0oqE3bxC07ly7UlGTSZHK
         tKQ/HnKiJUvq55kH9dkHZbrHXe+D5hMV5Sq7p2odksDmKyVREpKHURhZbByw4PhePfgP
         oqMg==
X-Gm-Message-State: AOJu0YxvHpgyQSufRSICiJRJ3hNl74v2JI2Mawep8qtzOHTN/eK3oDsR
	e0tsmCpDHOC8oOkTt63Yd1iIT/W6ThDCQVeuOaOv+xAP3w1ut3Zfb++nWDbSIcCI
X-Gm-Gg: ASbGncttILPbvYpEExznOF9nJ/avuj0YVa3tE5sqEx4BHvg231bNIsGfwLfZT0KXobM
	qxkyNYXOJfGFYsdg/f897WtVyXGFYFV+38+aiY3RLPJRzetoH86aOPq9l7zsvKFzjbNc3UKgN+o
	t0QvGokj/g3NDJc/2UyJ05FPs6a+s4LEYfSDVsNW6Yw3sBicA7+xtwW3YgeQQ8FQA3gHrfHnPWg
	lEINv0DqkN4tZV+wKinCsUvSxDTZ9KPMetnNTVZNElVuIZrpqnC8b2awFcVlJdjka0sJXEGPsOe
	EX+5xkQZd/8CVu0OzLW83g1tyteUs1aL2sYbAij4O/FLWflnu1sfqq5zs2aCHQFH+Br09ESuNK9
	U81MRBA/gK2Uf9FcYrvHrXqic5VPtNnAydiJ4qGDgWQ==
X-Google-Smtp-Source: AGHT+IGciFAOujdsdw10J922DulUoKlxOL391cAMZ4OLgZhjUrJ/kpr2Ja0DVsjEiPNdqU0No5xnvg==
X-Received: by 2002:a17:903:a90:b0:27e:f201:ec90 with SMTP id d9443c01a7336-29027264d78mr191230315ad.25.1760163649677;
        Fri, 10 Oct 2025 23:20:49 -0700 (PDT)
Received: from apollo.tail3ccdd3.ts.net ([2601:646:8201:fd20::4a63])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29034f39a4fsm74959645ad.106.2025.10.10.23.20.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Oct 2025 23:20:49 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] abseil-cpp: Upgrade to 20250814.1 release
Date: Fri, 10 Oct 2025 23:20:47 -0700
Message-ID: <20251011062047.1483273-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 11 Oct 2025 06:20:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120491

Use tarball instead of git fetcher

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../{abseil-cpp_20250512.1.bb => abseil-cpp_20250814.1.bb}  | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)
 rename meta-oe/recipes-devtools/abseil-cpp/{abseil-cpp_20250512.1.bb => abseil-cpp_20250814.1.bb} (90%)

diff --git a/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_20250512.1.bb b/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_20250814.1.bb
similarity index 90%
rename from meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_20250512.1.bb
rename to meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_20250814.1.bb
index d4e616a733..1504dacb00 100644
--- a/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_20250512.1.bb
+++ b/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_20250814.1.bb
@@ -7,13 +7,11 @@ SECTION = "libs"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=df52c6edb7adc22e533b2bacc3bd3915"
 
-SRCREV = "76bb24329e8bf5f39704eb10d21b9a80befa7c81"
-BRANCH = "lts_2025_05_12"
-SRC_URI = "git://github.com/abseil/abseil-cpp;branch=${BRANCH};protocol=https \
+SRC_URI = "https://github.com/abseil/${BPN}/releases/download/${PV}/${BP}.tar.gz \
            file://0001-absl-always-use-asm-sgidefs.h.patch \
            file://0002-abseil-ppc-fixes.patch \
            "
-
+SRC_URI[sha256sum] = "1692f77d1739bacf3f94337188b78583cf09bab7e420d2dc6c5605a4f86785a1"
 
 inherit cmake
 

