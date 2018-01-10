Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f195.google.com (mail-qk0-f195.google.com
	[209.85.220.195])
	by mail.openembedded.org (Postfix) with ESMTP id E4FA878837
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Jan 2018 20:15:41 +0000 (UTC)
Received: by mail-qk0-f195.google.com with SMTP id j185so635671qkc.5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Jan 2018 12:15:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=J5yZijmr/Eq0TTSpmdRqvQ9729J3VBy/ffeEMikkX9E=;
	b=Uu8lTIizon1cIbhxXtb4gASsW3iCESpBw8a3zFzco9jUZANygFJ2SlHgLAZ3zMU/e0
	wDVgJsn6n2IGOyVgGi1RT21ESN8ijCaW8xbMgrzg1vFB8UhqKzCBWJ87xRp3OJjlZi/G
	4vjBS39NvumDEDHsFUJy/s+H/5THop+RRWjwglmh0OrJLZDy8MiR9ois14kdnntW4k2C
	OZb6x8vsgZ0CG06hzIsQDD+0PDzMKC9XPVks34tYX2C+lz4iX87nfLAQz2HrPu15wKRt
	LYe0wa2pFjmOBLt5OFf+3tJ5ONRZOYwgvxOqax0VuKUc3ehtfv8E+6PbuLZO33Rx/cAl
	4oGQ==
X-Gm-Message-State: AKwxyteap5eSjF1vT/MHu4TDAvBcrEfqwsdXXgaUqSPMswm/cA50Sozj
	MmIF2nibRU8VAODxILVtlS8Dl/zf
X-Google-Smtp-Source: ACJfBosZBpN3FxF13VdfnpCPISwdJnXIOeD+lMgLXU0v0Jjdel9YKQTo5IQCDOLdd4QUxQF8NQWaxQ==
X-Received: by 10.200.46.69 with SMTP id s5mr9319694qta.205.1515615342591;
	Wed, 10 Jan 2018 12:15:42 -0800 (PST)
Received: from sparta.ny.asterius.io ([68.132.72.199])
	by smtp.gmail.com with ESMTPSA id
	c50sm11094174qte.38.2018.01.10.12.15.41
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 10 Jan 2018 12:15:42 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 10 Jan 2018 15:15:32 -0500
Message-Id: <1515615332-9157-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-tornado: update to version 4.5.3
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
X-List-Received-Date: Wed, 10 Jan 2018 20:15:42 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-tornado.inc             | 7 ++++---
 .../python/{python-tornado_4.5.2.bb => python-tornado_4.5.3.bb}    | 0
 .../python/{python3-tornado_4.5.2.bb => python3-tornado_4.5.3.bb}  | 0
 3 files changed, 4 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python-tornado_4.5.2.bb => python-tornado_4.5.3.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-tornado_4.5.2.bb => python3-tornado_4.5.3.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-tornado.inc b/meta-python/recipes-devtools/python/python-tornado.inc
index 2c58655..b9a99c7 100644
--- a/meta-python/recipes-devtools/python/python-tornado.inc
+++ b/meta-python/recipes-devtools/python/python-tornado.inc
@@ -6,11 +6,12 @@ HOMEPAGE = "http://www.tornadoweb.org/en/stable/"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://setup.py;startline=2;endline=15;md5=5ab7571a79ad62d0ca7aea308bac7560"
 
-SRC_URI[md5sum] = "ab41f6765d58089f30ba51e8ec084a7b"
-SRC_URI[sha256sum] = "1fb8e494cd46c674d86fac5885a3ff87b0e283937a47d74eb3c02a48c9e89ad0"
+SRC_URI[md5sum] = "a5fc7fd4aea94867609a491ce65786f1"
+SRC_URI[sha256sum] = "6d14e47eab0e15799cf3cdcc86b0b98279da68522caace2bd7ce644287685f0a"
 
 RDEPENDS_${PN} += "${PYTHON_PN}-compression ${PYTHON_PN}-numbers ${PYTHON_PN}-email ${PYTHON_PN}-subprocess \
-                   ${PYTHON_PN}-pkgutil ${PYTHON_PN}-html ${PYTHON_PN}-json ${PYTHON_PN}-certifi ${PYTHON_PN}-threading"
+                   ${PYTHON_PN}-pkgutil ${PYTHON_PN}-html ${PYTHON_PN}-json ${PYTHON_PN}-certifi ${PYTHON_PN}-threading \
+                   ${PYTHON_PN}-ctypes"
 
 RDEPENDS_${PN}-test += "${PN} ${PYTHON_PN}-unittest"
 
diff --git a/meta-python/recipes-devtools/python/python-tornado_4.5.2.bb b/meta-python/recipes-devtools/python/python-tornado_4.5.3.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-tornado_4.5.2.bb
rename to meta-python/recipes-devtools/python/python-tornado_4.5.3.bb
diff --git a/meta-python/recipes-devtools/python/python3-tornado_4.5.2.bb b/meta-python/recipes-devtools/python/python3-tornado_4.5.3.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-tornado_4.5.2.bb
rename to meta-python/recipes-devtools/python/python3-tornado_4.5.3.bb
-- 
2.7.4


