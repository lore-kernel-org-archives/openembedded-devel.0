Return-Path: <lukaszgardon555@gmail.com>
Received: from mail-lj1-f195.google.com (mail-lj1-f195.google.com
	[209.85.208.195])
	by mail.openembedded.org (Postfix) with ESMTP id DBAA2605BF
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Jul 2018 06:45:23 +0000 (UTC)
Received: by mail-lj1-f195.google.com with SMTP id 203-v6so5674399ljj.13
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Jul 2018 23:45:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=aYunlwnyDGXmcmUu/AV8kLuMXIML4ao+vxuaMkJHtGQ=;
	b=cIzZtnkRnWyikIMXpF4p7AtOuUs1yYmks7Q2hYZ0BKgr42tD6nI3vBFQddQB22LDWJ
	RRyUeXmlOrrQNiZ7pP8Bx8deOtfDe9tLvDwNE2pgbuBESwB0j66tcKewaXs6Tevw1uK1
	mj85E/6FTChPx4IGAAKByFwqRgfDUoaCyYQn3RUhHrtfGZ+Pph31Ed8ApbYwzlKKs/Q4
	LEmbqj2z4i8RFzkyfuhy+dAoEWs4TQw1rpZYXbHqJc8iTSCoqi5M2kpUeRLUKMDDbeeP
	8R5iV51e8sTS+6wuD457GOQDnLrkxyQVicjWUyQUd3EvFOSkAEunyZ77kkQyG5vJNM1r
	4a0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=aYunlwnyDGXmcmUu/AV8kLuMXIML4ao+vxuaMkJHtGQ=;
	b=Z2hFc/ybNkFmPTkLrgZrooJDfSdnHfWpQcAvVu0G+ms9+magScb6Xx/XU9CFQGoxjP
	lWAiHfHmtrAaJqtGNLrh71vT3l1+Sb0gyoaO3LiswlORtotFfvX9D+qMbhHZ7mb09Fbw
	1P87dLVHDqfJhh1zDAfmJO/2X7/icuJyUo/Ro3GuxNWYU5q6Li/IdIx3TDUQBAy8sosn
	JptJPlxyGxqkK/c1L5zurmQz4XxCx7NznmC8f3EwXIFL2HYeBYCpOdC+Soy/xB7HsClh
	ReJVZar6VivNgnCZ4roMsxlyI9nVy493624SjJKFdZPoifLxAsHGrckvjx2//b1l/79c
	l5cQ==
X-Gm-Message-State: AOUpUlFV9UAJbf7NC93TxkvMHKKRCjq48WprPUXUPSeJ5Fc+QvCFEGQJ
	Wc8hLn8acCe7c+zUUxISzg9gd3g+
X-Google-Smtp-Source: AAOMgpd9a9pz9DBpA4BoGRER1zSZQw2Y4hC1Q0mfyC9oU5JuHd68o6p61ElhD+wmF8NcveLtGmlgfA==
X-Received: by 2002:a2e:29da:: with SMTP id
	p87-v6mr13697007ljp.12.1532501124010; 
	Tue, 24 Jul 2018 23:45:24 -0700 (PDT)
Received: from localhost.localdomain.localdomain
	(apn-31-0-66-183.dynamic.gprs.plus.pl. [31.0.66.183])
	by smtp.gmail.com with ESMTPSA id
	f25-v6sm2623208ljc.97.2018.07.24.23.45.22
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 24 Jul 2018 23:45:23 -0700 (PDT)
From: =?UTF-8?q?=C5=81ukasz=20Gardo=C5=84?= <lukaszgardon555@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 25 Jul 2018 08:45:04 +0200
Message-Id: <1532501104-18601-1-git-send-email-lukaszgardon555@gmail.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Subject: [meta-python][PATCHv2] python-tornado: upgrade to version 5.1
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
X-List-Received-Date: Wed, 25 Jul 2018 06:45:24 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

License-Update: Checksum changed due to updation in documentation. There
are no changes in the license terms.

Signed-off-by: Łukasz Gardoń <lukaszgardon555@gmail.com>
---
 meta-python/recipes-devtools/python/python-tornado.inc              | 6 +++---
 .../python/{python-tornado_4.5.3.bb => python-tornado_5.1.bb}       | 0
 .../python/{python3-tornado_4.5.3.bb => python3-tornado_5.1.bb}     | 0
 3 files changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python-tornado_4.5.3.bb => python-tornado_5.1.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-tornado_4.5.3.bb => python3-tornado_5.1.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-tornado.inc b/meta-python/recipes-devtools/python/python-tornado.inc
index 29d10da..b40d091 100644
--- a/meta-python/recipes-devtools/python/python-tornado.inc
+++ b/meta-python/recipes-devtools/python/python-tornado.inc
@@ -4,10 +4,10 @@ By using non-blocking network I/O, Tornado can scale to tens of thousands of ope
 polling, WebSockets, and other applications that require a long-lived connection to each user."
 HOMEPAGE = "http://www.tornadoweb.org/en/stable/"
 LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://setup.py;beginline=3;endline=15;md5=8d463fc66ff8f275354ffe88d1896e12"
+LIC_FILES_CHKSUM = "file://setup.py;beginline=3;endline=15;md5=aff6d41a5e0da5827d1494624bbd683d"
 
-SRC_URI[md5sum] = "a5fc7fd4aea94867609a491ce65786f1"
-SRC_URI[sha256sum] = "6d14e47eab0e15799cf3cdcc86b0b98279da68522caace2bd7ce644287685f0a"
+SRC_URI[md5sum] = "bd264851c409f926d1dae1ad5055d28d"
+SRC_URI[sha256sum] = "4f66a2172cb947387193ca4c2c3e19131f1c70fa8be470ddbbd9317fd0801582"
 
 RDEPENDS_${PN} += "${PYTHON_PN}-compression ${PYTHON_PN}-numbers ${PYTHON_PN}-email \
                    ${PYTHON_PN}-pkgutil ${PYTHON_PN}-html ${PYTHON_PN}-json ${PYTHON_PN}-certifi ${PYTHON_PN}-threading \
diff --git a/meta-python/recipes-devtools/python/python-tornado_4.5.3.bb b/meta-python/recipes-devtools/python/python-tornado_5.1.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-tornado_4.5.3.bb
rename to meta-python/recipes-devtools/python/python-tornado_5.1.bb
diff --git a/meta-python/recipes-devtools/python/python3-tornado_4.5.3.bb b/meta-python/recipes-devtools/python/python3-tornado_5.1.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-tornado_4.5.3.bb
rename to meta-python/recipes-devtools/python/python3-tornado_5.1.bb
-- 
1.8.3.1


