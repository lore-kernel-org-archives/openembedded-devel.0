Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1171CC369D3
	for <webhook@archiver.kernel.org>; Sun, 20 Apr 2025 02:51:08 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web10.2199.1745117464639566919
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 19 Apr 2025 19:51:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=nJFuwBlC;
 spf=pass (domain: gmail.com, ip: 209.85.214.171, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-22622ddcc35so45029965ad.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 19 Apr 2025 19:51:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745117464; x=1745722264; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ODgMTIiee+3Oa12kiMymlv6Wo4sfdW4hAG6Uvos7n2Y=;
        b=nJFuwBlCu4lrwR9HBYGfauox7kGl5DOjUx9l13/kfo1fv3p4fqU07vy89P4z/MHmUU
         gXp7aXbmhP9sKU/rLUzmX3hk6oJu4MVw8n29hQ9eD5GALcERFKOuJQpyDrF1H7/aO57l
         cdGLS3QPGs+Bw7FG1EDQoh22Oq1fRewVAd7sLJ/bPr7H6ShP63mjUr9OKvrBDwu/cxmm
         qdrxCNdglHzw6+KzL0BFiZnWVifunrpLC/3dEK4akG8mPx0WiVSG7Ya3bXirTCGtLd7Y
         SBfOhyurFSQwHiLBcyzF2n2vCOLqpuhvd4UkJ5v03w6sY14KD3tjeX1/mk9PieyI0JD0
         FOPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745117464; x=1745722264;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ODgMTIiee+3Oa12kiMymlv6Wo4sfdW4hAG6Uvos7n2Y=;
        b=DV1luvUBHZ5+Fl1zvKEmYAb7R3iMA7yWZAG58YMwJrXWyyzYVtb2ze8BCo6AeOOO0M
         B8N35Is4nBONSpHyRJlyb8pa5nV7yg6TCAYnqVMzP8u/NvMIfzdjjyF4vROI+DCWFXG/
         AL/4w7Q4lIWDLbnFPVBhCVB3kmL40a3yt+4HmT+aaTA1+RSk7+SwsZumqFMwLqJ3/KwY
         C4g8Mu/0u7CRt8Pnm9q+Pe/V6ekQtfyhS5mkRup/shl7nsUqp0rbvIddegh3nfqMCT7G
         3UxTGVL81YvlZYlXstukKnkY+7E/w1RRRNFQ5NtYtWksbz2zaQzteUuUyeoN5UHBAfeW
         tmOA==
X-Gm-Message-State: AOJu0YxuCwRdh/LNwu5cEbA3b38vDjNF/JV6W/3dCZNOkpy0aR1isRI0
	L02vA2NKX0E+a50vtLwyc/RW2JtrBDc+sOF/eoHkcusc/fv+8p8lEHDMZuDJ
X-Gm-Gg: ASbGncsd3p83XmMGDJJEF22Io7lS3ZJmB+4ufV2mtzzzhH8yGgllaB7gKwBngthde8e
	1AHSYDmXjUBu6KO/em2VKe/Af6DQHAeQaoSCSnjuRKf/Z6RpeG0mk1Xq+hQaLsmiunHusbT6MRq
	brnVipDmKf6zXysT0sEx02I6RdY3u9wjykU1LVn1NzDn623cwNFLcTJltPlYYiaN/zVNE/qc59h
	bMS2DCoIq/bWeOtGPh31iiIQ9TJ0DpIYIOH7BeNBPq/5H4PIvZFCsj65WivN/c7Dc6aLRauQUuI
	jsmsmt9O3XsN3NmZILAF0TUQG+e2oisC
X-Google-Smtp-Source: AGHT+IF3DKUYRukqxGID0GH3z84GZ9qFYMRf6yi5oMgSFF+FPria8NQ2WyXhmG2c9b0tqw2195Po9w==
X-Received: by 2002:a17:903:1aa5:b0:220:e896:54e1 with SMTP id d9443c01a7336-22c535c8e2amr107022355ad.26.1745117463821;
        Sat, 19 Apr 2025 19:51:03 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::c043])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73dbf8c04afsm3986138b3a.23.2025.04.19.19.51.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Apr 2025 19:51:03 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH 1/2] python3-pydantic: Use tip of trunk
Date: Sat, 19 Apr 2025 19:51:00 -0700
Message-ID: <20250420025101.3189663-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 20 Apr 2025 02:51:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116986

Its needed for using pydantic-core 2.34 support

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-devtools/python/python3-pydantic_2.11.3.bb    | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-pydantic_2.11.3.bb b/meta-python/recipes-devtools/python/python3-pydantic_2.11.3.bb
index 704d4ad98b..c323534e12 100644
--- a/meta-python/recipes-devtools/python/python3-pydantic_2.11.3.bb
+++ b/meta-python/recipes-devtools/python/python3-pydantic_2.11.3.bb
@@ -9,9 +9,13 @@ HOMEPAGE = "https://github.com/samuelcolvin/pydantic"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=09280955509d1c4ca14bae02f21d49a6"
 
-inherit pypi python_hatchling ptest-python-pytest
+inherit python_hatchling ptest-python-pytest
 
-SRC_URI[sha256sum] = "7471657138c16adad9322fe3070c0116dd6c3ad8d649300e3cbdfe91f4db4ec3"
+SRCREV = "bce81efdeac1cbefd0196b478a32aa2586bd595a"
+PV .= "+git"
+SRC_URI = "git://github.com/pydantic/pydantic;protocol=https;branch=main"
+
+S = "${WORKDIR}/git"
 
 DEPENDS += "python3-hatch-fancy-pypi-readme-native"
 

