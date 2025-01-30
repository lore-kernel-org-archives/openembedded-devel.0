Return-Path: <derek@asterius.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D7F7C02196
	for <webhook@archiver.kernel.org>; Thu, 30 Jan 2025 21:58:16 +0000 (UTC)
Received: from mail-io1-f48.google.com (mail-io1-f48.google.com [209.85.166.48])
 by mx.groups.io with SMTP id smtpd.web11.6222.1738274295525748471
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 Jan 2025 13:58:15 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.166.48, mailfrom: straka.derek@gmail.com)
Received: by mail-io1-f48.google.com with SMTP id ca18e2360f4ac-84cdb6fba9bso103865939f.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 30 Jan 2025 13:58:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738274294; x=1738879094;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y6VPa5YakiggAndKZSlwoqx2BVpuIP31qSo8eKpP+O8=;
        b=ASoyP8Na5mtAxlsNoRUNuwc4BEP3wuYEqaXtqQpWxOD7SqzCd9m9UW7E2Nvs8PhWQX
         PGeBAKkPJhPJbaKbWDJaHHnkIqQz6S/7f6a2SnAZ+jgxuOf+boBv6Z03nBCn1tktbDeb
         8tla9LNhjUSg7e4ewno+3HH7gdeK3DjoyS/KUAiEs9jHTPYBWQWEmyzYEN9UG9FNn/ld
         wJ1JmolzyGtO5UMuRHCVxz6BT3wg1b5JUZIpGEpRH24BgFFiNOUvLu49fDkfXuc2RdCD
         v6p2/IpLqp7cRIAppldc5/hBhc0EWQOhWnfIeBzV7yAA9JpPZz/P0zdW5E78962TOSyw
         74Kw==
X-Gm-Message-State: AOJu0YxyLuGTFruxkUnYidRq3i34quzyFNmObjLlO9JtKBxoklm0YAJq
	Wrf26/Rqf+bqwNZikDfs1Flakf0fnDdtx8dalMJliAMNfpBdbHvYHJ0RsISjPRg=
X-Gm-Gg: ASbGncuLSwqiqXczUrPjeXkanqeVTMj+UKDAWoSjhaH7KctPDD1aFe7DciGmXzDB2sB
	5RNqEICkPzLajMDyX4FaDpU6NAoxsPGH+vadAyp7yWK0oNDxPxwuhPQIjRd+hcEs+1YDpcMVXtj
	cfOK7klU1SWxrnV7VdywSiHQec5RsiL6yfG/3FoHiEQJAL+KGfshjebsgPkg04TLqb+DOK2tGEa
	6+/8kz5EoeF/xne7GnIQ9vPtGlLwK4Z2RAtFVZuXalAgq20Bz8IavEiU1f7z4Z16QUlsDBchdHK
	7UEkQjYl1Q+4n8Bjpd1VRBAf00GoysqMD2X304WOXjO36j0qIFpT0S9rptV9
X-Google-Smtp-Source: AGHT+IHpiz10mIHdb0Jqs5q/PDC7GxsrqB49Lw+kCV+r6q190uzUqo9z+ROBkGFx5uPMJl65CWqzHw==
X-Received: by 2002:a92:c569:0:b0:3d0:11ff:5299 with SMTP id e9e14a558f8ab-3d011ff531amr17483925ab.20.1738274294313;
        Thu, 30 Jan 2025 13:58:14 -0800 (PST)
Received: from alpha.lab.asterius.io (c-24-118-24-24.hsd1.mn.comcast.net. [24.118.24.24])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4ec746e3e63sm519071173.144.2025.01.30.13.58.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jan 2025 13:58:13 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [oe][meta-python][PATCH 09/23] python3-jdcal: update recipe to use the ptest-python-pytest class
Date: Thu, 30 Jan 2025 21:57:24 +0000
Message-Id: <20250130215738.3280576-9-derek@asterius.io>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250130215738.3280576-1-derek@asterius.io>
References: <20250130215738.3280576-1-derek@asterius.io>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 30 Jan 2025 21:58:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115163

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../recipes-devtools/python/python3-jdcal/run-ptest |  3 ---
 .../recipes-devtools/python/python3-jdcal_1.4.1.bb  | 13 ++-----------
 2 files changed, 2 insertions(+), 14 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-jdcal/run-ptest

diff --git a/meta-python/recipes-devtools/python/python3-jdcal/run-ptest b/meta-python/recipes-devtools/python/python3-jdcal/run-ptest
deleted file mode 100644
index 8d2017d39c..0000000000
--- a/meta-python/recipes-devtools/python/python3-jdcal/run-ptest
+++ /dev/null
@@ -1,3 +0,0 @@
-#!/bin/sh
-
-pytest --automake
diff --git a/meta-python/recipes-devtools/python/python3-jdcal_1.4.1.bb b/meta-python/recipes-devtools/python/python3-jdcal_1.4.1.bb
index d20c9ad42f..d947a73cf0 100644
--- a/meta-python/recipes-devtools/python/python3-jdcal_1.4.1.bb
+++ b/meta-python/recipes-devtools/python/python3-jdcal_1.4.1.bb
@@ -7,21 +7,12 @@ HOMEPAGE = "https://github.com/phn/jdcal"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://PKG-INFO;md5=bd236e1f590973467a427bb354be0f46"
 
-inherit pypi setuptools3 ptest
+inherit pypi setuptools3 ptest-python-pytest
 
 SRC_URI[sha256sum] = "472872e096eb8df219c23f2689fc336668bdb43d194094b5cc1707e1640acfc8"
 
 RDEPENDS:${PN} += "python3-compression python3-io python3-pprint python3-shell"
 
-SRC_URI += " \
-	file://run-ptest \
-"
-
-RDEPENDS:${PN}-ptest += " \
-	python3-pytest \
-	python3-unittest-automake-output \
-"
-
-do_install_ptest() {
+do_install_ptest:append () {
 	cp -f ${S}/test_jdcal.py ${D}${PTEST_PATH}/
 }
-- 
2.34.1


