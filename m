Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8299E7718F
	for <webhook@archiver.kernel.org>; Fri,  3 Jan 2025 17:29:20 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.web11.1866.1735925358980261778
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Jan 2025 09:29:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=ezptvjmV;
 spf=pass (domain: konsulko.com, ip: 209.85.218.51, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-aa67f31a858so2210080666b.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 03 Jan 2025 09:29:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1735925357; x=1736530157; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=n3rBRcZ+wlTq1Cic84TN7ZCiuIr96f/tp4GPAR7srnU=;
        b=ezptvjmVDKa6a3LwJR8UNbkVphC0OroHjsx+HXLPtkH5T1fU2jYkftQd7y+yBDCTW+
         od9wc+kKA96rF8M2gptTle1FslmyHraRlP/DOFquYcYJCRB3YYIkxCdC/qlCZR5NqS5V
         byDFRIl2gJCOuYSvQGxDpD1RE5IJRX70Imnk0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735925357; x=1736530157;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n3rBRcZ+wlTq1Cic84TN7ZCiuIr96f/tp4GPAR7srnU=;
        b=rxMMlXXM21B3J3EW2T7L45g7RbgLTWBCvHtRDlBV6hDHviBll+ZPUyc3PX+5tD2Dl+
         IYITgLMXHaxD+MS8MtxwaMqtnnang6lDWVqVBBt8hDxwTVuRvHrBDfVUAiMILwg2ML9s
         2aXsKXqN0FE/rYzEFVpUZSU/idvf5+dFXMTcUuVd816tpdl5WgAtI9G2gZyMuJKSzXfR
         RM9I4IUr0mFqugkNHZMnsAXg+zD61dFaCsBX93zaQ2kDs+ldLayfefqn51oYkjn8EqfM
         ZhTiA3PWhqARDRT/sYbny/JvERTiXHjkamgLX7+OMpb/rYkIZ/I4XLhhJI2jsnQNEh7n
         +V/Q==
X-Gm-Message-State: AOJu0YyvWWveozrPbcsOB5OjEzug5hCGEkxtSFNDd9HECY+vlnRmmChY
	S7takrsKQicu3+QyGuDTe5XlRZcA16+HXpOzPoJG5qS+SyrJBk5R06vtVyqYX7VZDjWDLmbqQWQ
	S
X-Gm-Gg: ASbGncvOTtcQXvO3mUPyK83XBAI9Rq6V8FeDA0E7daSZJqKmY4Kj3loJF4s1E5RZnld
	GN2U9qjtNkxgSBLf7sFmNOkOIgxVhdkMLiMutxhuqogXXgJ+w6pGYzDoRBzlyfhE7iA0SjVhL0v
	ptG69ecrzAhKo8jDHypl/orUquX+3CXhyM1SO407Jpwa9lbSmERcWODpZZy8KSIXQ+QdbtBLm2l
	4zRhVVmlp44WNbIdp+Q5vhy027GTiyM3upVljNd6LBwftoV8YnBHaAoT/bDQPkBwfAqSVA=
X-Google-Smtp-Source: AGHT+IGt12Sa9qisDf75Sh5lmdsBSC/A2DiDnN87qP796yjKn9UjpQE2BghodQWKPAKYWc8Ef7HdWw==
X-Received: by 2002:a17:907:9496:b0:aa6:762e:8c20 with SMTP id a640c23a62f3a-aac334e37c6mr5089197566b.43.1735925357047;
        Fri, 03 Jan 2025 09:29:17 -0800 (PST)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0f015ab9sm1902571666b.155.2025.01.03.09.29.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jan 2025 09:29:16 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/2] python3-charset-normalizer: Upgrade 3.4.0 -> 3.4.1
Date: Fri,  3 Jan 2025 19:29:12 +0200
Message-Id: <20250103172913.3888678-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 03 Jan 2025 17:29:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114626

Upgrade to version 3.4.1:

- Project metadata are now stored using pyproject.toml instead of
  setup.cfg using setuptools as the build backend.
- Enforce annotation delayed loading for a simpler and consistent
  types in the project.
- Optional mypyc compilation upgraded to version 1.14 for Python
  >= 3.8
- Converting content to Unicode bytes may insert utf_8 instead of
  preferred utf-8.
- Deprecation warning "'count' is passed as positional argument"
  when converting to Unicode bytes on Python 3.13+

License-Update: Update year

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...ormalizer_3.4.0.bb => python3-charset-normalizer_3.4.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-charset-normalizer_3.4.0.bb => python3-charset-normalizer_3.4.1.bb} (72%)

diff --git a/meta-python/recipes-devtools/python/python3-charset-normalizer_3.4.0.bb b/meta-python/recipes-devtools/python/python3-charset-normalizer_3.4.1.bb
similarity index 72%
rename from meta-python/recipes-devtools/python/python3-charset-normalizer_3.4.0.bb
rename to meta-python/recipes-devtools/python/python3-charset-normalizer_3.4.1.bb
index 89d73c08fc..b13524c227 100644
--- a/meta-python/recipes-devtools/python/python3-charset-normalizer_3.4.0.bb
+++ b/meta-python/recipes-devtools/python/python3-charset-normalizer_3.4.1.bb
@@ -1,9 +1,9 @@
 SUMMARY = "The Real First Universal Charset Detector. Open, modern and actively maintained alternative to Chardet."
 HOMEPAGE = "https://github.com/ousret/charset_normalizer"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=0974a390827087287db39928f7c524b5"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=48178f3fc1374ad7e830412f812bde05"
 
-SRC_URI[sha256sum] = "223217c3d4f82c3ac5e29032b3f1c2eb0fb591b72161f86d93f5719079dae93e"
+SRC_URI[sha256sum] = "44251f18cd68a75b56585dd00dae26183e102cd5e0f9f1466e6df5da2ed64ea3"
 
 inherit pypi setuptools3
 
-- 
2.39.5


