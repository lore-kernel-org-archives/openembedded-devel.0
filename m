Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f196.google.com (mail-qt0-f196.google.com
	[209.85.216.196])
	by mail.openembedded.org (Postfix) with ESMTP id 6A64871A8C
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Nov 2017 23:59:06 +0000 (UTC)
Received: by mail-qt0-f196.google.com with SMTP id g9so6685437qth.9
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Nov 2017 15:59:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=mZb0P+E+XmYnPtENNp1uSq6ZDH/EHSpF4qdtB3YyC0E=;
	b=YBHFIZ1Chlq5a3DZT6KO9ZEFc5zuqT7oSVmRhOXi6ZlEyZRMaOR/MxTdU36l4Fl93g
	QfUvl9p368k9r5GrFkNHKyBCOqu4egtPeGzJ2UthzoouTg2WwMYPgVjS3LFWSHUVKm89
	h+sqR6CjiX/IrBWgVNmXiebbI13lU5pWNRFKcsvNoyCBAbJxS6N+3q2aqajOhx+mAQsH
	rWci6F2/9FZOAxdKxMfR87sAPFYNZbbbb3lG5ppwwtg0UybTiTjXkN+Vzo7U/LPBDuxp
	P6XQAhkPz8lyPrV51PGYv8sivHrZUyKuWwqYz0hguYGDIykjlImLHDFx3J6Zmiw3r4xa
	2Gsg==
X-Gm-Message-State: AKGB3mJ2ndq3VOXJhxpoPhieMJ+HQgrZ6RqtSaBKpdQn+rBq9mf1rtYv
	QrVld8GuMulpEmakNqBhFZ8zOaeV
X-Google-Smtp-Source: AGs4zMZtBTdNqQ/s3/HmSOlEf26isR3+vLHJQlZ4Renub+OL24dx8+en0rZbMh76aU+j/to/ht72Pg==
X-Received: by 10.237.62.169 with SMTP id n38mr532383qtf.42.1511999947186;
	Wed, 29 Nov 2017 15:59:07 -0800 (PST)
Received: from sparta.ny.asterius.io ([68.132.72.199])
	by smtp.gmail.com with ESMTPSA id
	p74sm2083112qkl.22.2017.11.29.15.59.06
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 29 Nov 2017 15:59:06 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 29 Nov 2017 18:58:58 -0500
Message-Id: <1511999938-31029-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-pymongo: correct the RDEPENDS to work on a minimal python install
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
X-List-Received-Date: Wed, 29 Nov 2017 23:59:06 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-pymongo.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python-pymongo.inc b/meta-python/recipes-devtools/python/python-pymongo.inc
index 7f199b4..075bd3d 100644
--- a/meta-python/recipes-devtools/python/python-pymongo.inc
+++ b/meta-python/recipes-devtools/python/python-pymongo.inc
@@ -17,6 +17,7 @@ FILES_${PYTHON_PN}-bson = "${PYTHON_SITEPACKAGES_DIR}/bson/*"
 
 RDEPENDS_${PYTHON_PN}-bson += " \
      ${PYTHON_PN}-datetime \
+     ${PYTHON_PN}-json \
      ${PYTHON_PN}-netclient \
      ${PYTHON_PN}-numbers \
      ${PYTHON_PN}-threading \
@@ -24,4 +25,5 @@ RDEPENDS_${PYTHON_PN}-bson += " \
 
 RDEPENDS_${PN} += " \
     ${PYTHON_PN}-bson \
+    ${PYTHON_PN}-pprint \
 "
-- 
2.7.4


