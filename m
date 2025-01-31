Return-Path: <derek@asterius.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8378C02194
	for <webhook@archiver.kernel.org>; Fri, 31 Jan 2025 01:40:07 +0000 (UTC)
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
 by mx.groups.io with SMTP id smtpd.web11.10325.1738287601706389222
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 Jan 2025 17:40:01 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.210.52, mailfrom: straka.derek@gmail.com)
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-724a5d042c0so832332a34.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 30 Jan 2025 17:40:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738287600; x=1738892400;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OIc0f+d0Z4vEwiCJ7wUnyToAxqSKJ2JE7Mru5/lKnjc=;
        b=BAp2YD9GLRC5VWaBd+UsxrON9FNYQg6DTQXZXn5Rok3GfBT/kPwnYArDL82O1ChPQI
         M7ihA7GgD20yzQ7d3Eydz+XZQHs3Pa7Q3gjSxp6rWcxNM7TKE3LKSMcwQwvaloRgqi9/
         EjVFoALZWaFABbjuZkl+UxiDMBZZxh1JbSZx+2q576bVR/9+nVPwQySuSbAJO3KOPvZU
         rG18astq99o4HY6LI2HCRI+JkJEQ6niA/Lqd835U8P6cD7TA3G254M7wlO+IPTUf8f8f
         NAIE0EPsNHpkLvkcSQ5sjyYs2+kjTIvAXUlZNjXPo/LdVSO7qnJHoUWOW1gr7ln6WeoY
         jjVA==
X-Gm-Message-State: AOJu0Ywmx5HG7uXrh1c8/ZqUelPmHQ68Jo2e2qMphc4s13lNbo06+Pv7
	BdhfhHQNpaw01zbEQOKoIuaiDo8PDN0h9RM0XlI9fjI5He2NmqlsFuuuygFf
X-Gm-Gg: ASbGncuoCdbbTWB3BYxxGMxZ6N+uP/7RFkIspiy2nh3kIkErFv8xIsXd3X41KmUOl+1
	sM4dupvD3R36xYrBRmMZNdHSGvBrHhKm4RarjkgNpk1kw6YIDkPMgIchJnF4iV+gOkVwW3LEySf
	TjI3oU/mbxZkD8pNh7nSzJPyYPASwcATApoM7oRQUbWnCCcXfvo/e047MgffflYJQRsK0aid3yr
	nGEq91dnHKoyC3Qw3tjrMsTjZRbHmbSRNef3oBU8i1Y4z8+ffQtPw2oGojdi7MGYE2F8r90j5TW
	VBtA23oz/SvvRUN742lh3andsUP7p73zBT+IsKjgs/aRtqCiPhz3WaS3CdVN
X-Google-Smtp-Source: AGHT+IESEuvPbTOcVLv6+zgJX9hoXxiga1OUeBABJzfYbBo3wuopq0/YUJ/DoqLSXJcroEFmvtl5rQ==
X-Received: by 2002:a05:6830:2907:b0:71d:f239:c091 with SMTP id 46e09a7af769-726567593bcmr5938416a34.6.1738287600150;
        Thu, 30 Jan 2025 17:40:00 -0800 (PST)
Received: from alpha.lab.asterius.io (c-24-118-24-24.hsd1.mn.comcast.net. [24.118.24.24])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-726618b9f49sm659875a34.54.2025.01.30.17.39.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jan 2025 17:39:58 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [oe][meta-python][PATCH 05/11] python3-configobj: update recipe to use the ptest-python-pytest class
Date: Fri, 31 Jan 2025 01:39:29 +0000
Message-Id: <20250131013935.3714521-5-derek@asterius.io>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250131013935.3714521-1-derek@asterius.io>
References: <20250131013935.3714521-1-derek@asterius.io>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 31 Jan 2025 01:40:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115182

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../python/python3-configobj/run-ptest           |  3 ---
 .../python/python3-configobj_5.0.9.bb            | 16 ++--------------
 2 files changed, 2 insertions(+), 17 deletions(-)
 delete mode 100755 meta-python/recipes-devtools/python/python3-configobj/run-ptest

diff --git a/meta-python/recipes-devtools/python/python3-configobj/run-ptest b/meta-python/recipes-devtools/python/python3-configobj/run-ptest
deleted file mode 100755
index 8d2017d39c..0000000000
--- a/meta-python/recipes-devtools/python/python3-configobj/run-ptest
+++ /dev/null
@@ -1,3 +0,0 @@
-#!/bin/sh
-
-pytest --automake
diff --git a/meta-python/recipes-devtools/python/python3-configobj_5.0.9.bb b/meta-python/recipes-devtools/python/python3-configobj_5.0.9.bb
index d41d71a4ea..bd4764f4de 100644
--- a/meta-python/recipes-devtools/python/python3-configobj_5.0.9.bb
+++ b/meta-python/recipes-devtools/python/python3-configobj_5.0.9.bb
@@ -5,23 +5,11 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=e2df3cb285297a24cd1097dfe6e96f95"
 
 SRC_URI[sha256sum] = "03c881bbf23aa07bccf1b837005975993c4ab4427ba57f959afdd9d1a2386848"
 
-inherit pypi python_setuptools_build_meta ptest
+inherit pypi python_setuptools_build_meta ptest-python-pytest
 
-SRC_URI += " \
-	file://run-ptest \
-"
+PTEST_PYTEST_DIR = "src/tests"
 
 RDEPENDS:${PN} += " \
 	python3-pprint \
 	python3-six \
 "
-
-RDEPENDS:${PN}-ptest += " \
-	python3-pytest \
-	python3-unittest-automake-output \
-"
-
-do_install_ptest() {
-	install -d ${D}${PTEST_PATH}/tests
-	cp -rf ${S}/src/tests/* ${D}${PTEST_PATH}/tests/
-}
-- 
2.34.1


