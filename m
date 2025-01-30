Return-Path: <derek@asterius.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79872C02194
	for <webhook@archiver.kernel.org>; Thu, 30 Jan 2025 21:58:26 +0000 (UTC)
Received: from mail-il1-f181.google.com (mail-il1-f181.google.com [209.85.166.181])
 by mx.groups.io with SMTP id smtpd.web10.6251.1738274296501262732
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 Jan 2025 13:58:16 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.166.181, mailfrom: straka.derek@gmail.com)
Received: by mail-il1-f181.google.com with SMTP id e9e14a558f8ab-3cf880d90bdso4838615ab.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 30 Jan 2025 13:58:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738274295; x=1738879095;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dXTK/AO4EGL0SopHEPGhwbfpmSPuI2CIi3f34mf40X0=;
        b=o/YZhHKUzyje1u1avjtQpL/GQdv4BF/E5ibd9yankKwTiU/yR2tePTbe96dgkDY308
         dxrTMPZD4gb4/xHOEOI3jeEhSQYWlSd+GrPqEQX2L14vaZ0HyS9w2OFSBXP6McyedmzO
         MaYLdaYT/g/kIRCte5mtcBHhkQnbMlEHMNImDMUMaakgP+KF+tyXayRxKzooSpwd8TFe
         +0rzJivM4KvHIM2dCOhZK4M7Jm86o+YrUi+BlHmUe7Wy9liD2uQo2Va+piG0zN1YTHHg
         6MoRN1uH8Jj6l0Y2Sj/TJdCBTuF3t6iquLNNX/XU7mmPvLilwZrbI1IBhC+fJK4P1DJQ
         G1hw==
X-Gm-Message-State: AOJu0Yyh7Xi2LUtObZIeEY1w8W2lSUO4wptjZfIqM7WCEoUAeNDLMd/+
	Z09PJLua7HhbT4aSOLH4RoPmYwdQfaC0ua6TVEfEv2CQUTq8bmJYz5E1HMJjEak=
X-Gm-Gg: ASbGncsL/tK1wrCNMzngxIhDAetq1cakShlvkB6aDnTCEDbVLNUYwKVVh3S1TjyrCGL
	rjzegBw46waSMSpM+JbsosmA42Vam17SMdw80q9+0ii1MwIhemHtafjZpnRrAtNuWMQF5uXwvUx
	GLiMj0LXD9B91aD6MtAHhwZrAqdAz2Dyx/plHKnaumxvO52wD6hr0Va+adSzaxRVX/i9GEb+4Y3
	JAnRWtfJLKOPAZHa4mhw9n2b3tnkNq0wJS/N3Swnj5BHSbu8NdknPWhUrVO3JG3SqyB1XrPMfR3
	Zh+xd+JkeFNg9KXKIDj5+z1A7b1zSwLCgMt23LZAMhzG3IYoYCXNbldwotxY
X-Google-Smtp-Source: AGHT+IHOl7VVnwO2ZR10DMdSVi8DwdUL608pFUjKQvdi2lOIvp2A60Gc6QTJCOTD/58EFs+cERKtqg==
X-Received: by 2002:a05:6e02:1c2e:b0:3a7:8720:9de5 with SMTP id e9e14a558f8ab-3cffe3d1ccemr89779725ab.1.1738274295347;
        Thu, 30 Jan 2025 13:58:15 -0800 (PST)
Received: from alpha.lab.asterius.io (c-24-118-24-24.hsd1.mn.comcast.net. [24.118.24.24])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4ec746e3e63sm519071173.144.2025.01.30.13.58.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jan 2025 13:58:14 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [oe][meta-python][PATCH 10/23] python3-iso3166: update recipe to use the ptest-python-pytest class
Date: Thu, 30 Jan 2025 21:57:25 +0000
Message-Id: <20250130215738.3280576-10-derek@asterius.io>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250130215738.3280576-1-derek@asterius.io>
References: <20250130215738.3280576-1-derek@asterius.io>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 30 Jan 2025 21:58:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115164

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../python/python3-iso3166/run-ptest             |  3 ---
 .../python/python3-iso3166_2.1.1.bb              | 16 +---------------
 2 files changed, 1 insertion(+), 18 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-iso3166/run-ptest

diff --git a/meta-python/recipes-devtools/python/python3-iso3166/run-ptest b/meta-python/recipes-devtools/python/python3-iso3166/run-ptest
deleted file mode 100644
index 8d2017d39c..0000000000
--- a/meta-python/recipes-devtools/python/python3-iso3166/run-ptest
+++ /dev/null
@@ -1,3 +0,0 @@
-#!/bin/sh
-
-pytest --automake
diff --git a/meta-python/recipes-devtools/python/python3-iso3166_2.1.1.bb b/meta-python/recipes-devtools/python/python3-iso3166_2.1.1.bb
index 3aa084d10a..6b96f5775c 100644
--- a/meta-python/recipes-devtools/python/python3-iso3166_2.1.1.bb
+++ b/meta-python/recipes-devtools/python/python3-iso3166_2.1.1.bb
@@ -5,21 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=5e2f4edc7e7408a82e4a1d05f229b695"
 
 SRC_URI[sha256sum] = "fcd551b8dda66b44e9f9e6d6bbbee3a1145a22447c0a556e5d0fb1ad1e491719"
 
-inherit pypi python_setuptools_build_meta ptest
-
-SRC_URI += " \
-	file://run-ptest \
-"
-
-RDEPENDS:${PN}-ptest += " \
-    python3-pytest \
-    python3-unittest-automake-output \
-"
-
-do_install_ptest() {
-	install -d ${D}${PTEST_PATH}/tests
-	cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
-}
+inherit pypi python_setuptools_build_meta ptest-python-pytest
 
 RDEPENDS:${PN} += "python3-numbers"
 
-- 
2.34.1


