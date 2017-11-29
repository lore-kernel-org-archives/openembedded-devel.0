Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f196.google.com (mail-qt0-f196.google.com
	[209.85.216.196])
	by mail.openembedded.org (Postfix) with ESMTP id 9C18677E76
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Nov 2017 18:59:55 +0000 (UTC)
Received: by mail-qt0-f196.google.com with SMTP id j5so5658197qth.11
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Nov 2017 10:59:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=E0eshiKYu2mwzxkNGVVAGBzyoBEP4QLbZszh9F2a4Rw=;
	b=EbMf+dtSv09HPnb8KJLffVNjFPI087RKggmwB0aymW6C0DXZnv+Wm9ffL1wTyMp3Cj
	py92j9XzNVL/8DAgeuaJQtX1BJoP6D0wlNcGHe4eVZSLWOdvKHgDIkxajUqQTIUHzHih
	b2sk/CCjXPG+IKEjE0/mrVIdOByK69X3ZYgqfnYP/bTKAmx6nhLLTJDwl/08W9O/3dnq
	0PqX/piORdlZaXrbsC1Ah8zDv7tfbhM8VdpY8ZbFoc+0FTNY73sKCi0g8/UEnACDnMKF
	b62kWq3/4NoxlyJdtHw9oDV/oBXNqzraFOmyR7DDw1gtWbPKwG6T15wZtWidnllPmnS5
	oueQ==
X-Gm-Message-State: AJaThX5enz30XTCoX6jp7/aS5M7Dp2o+qkCg2BcCTH5IGGyijBX5n2Ab
	Dxgnx94WebZH3HggsQiY+FlKxgee
X-Google-Smtp-Source: AGs4zMau1v0Ep6PXpAbdJP6Tsc+ba4vHT9pVc7h1zNSoORneiKd0avZNaM9VZIihY9p6WQINSeh69Q==
X-Received: by 10.237.54.227 with SMTP id f90mr6120995qtb.121.1511981996501;
	Wed, 29 Nov 2017 10:59:56 -0800 (PST)
Received: from sparta.ny.asterius.io ([68.132.72.199])
	by smtp.gmail.com with ESMTPSA id y9sm1655799qkj.85.2017.11.29.10.59.55
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 29 Nov 2017 10:59:55 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 29 Nov 2017 13:59:48 -0500
Message-Id: <1511981988-9478-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-simplejson: add the tests into their own package
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 29 Nov 2017 18:59:55 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-simplejson.inc | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python-simplejson.inc b/meta-python/recipes-devtools/python/python-simplejson.inc
index 7f436f2..50524f3 100644
--- a/meta-python/recipes-devtools/python/python-simplejson.inc
+++ b/meta-python/recipes-devtools/python/python-simplejson.inc
@@ -15,3 +15,10 @@ RDEPENDS_${PN} += "\
     ${PYTHON_PN}-netserver \
     ${PYTHON_PN}-numbers \
 "
+
+PACKAGES =+ "${PN}-tests"
+RDEPENDS_${PN}-tests = "${PN} ${PYTHON_PN}-unittest"
+FILES_${PN}-tests+= " \
+    ${PYTHON_SITEPACKAGES_DIR}/simplejson/tests \
+    ${PYTHON_SITEPACKAGES_DIR}/simplejson/tool.py* \
+"
-- 
2.7.4


