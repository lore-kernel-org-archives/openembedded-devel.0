Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f196.google.com (mail-qk0-f196.google.com
	[209.85.220.196])
	by mail.openembedded.org (Postfix) with ESMTP id DCBFC780FA
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  3 Jan 2018 16:48:55 +0000 (UTC)
Received: by mail-qk0-f196.google.com with SMTP id 143so2250169qki.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 03 Jan 2018 08:48:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=b1U1a+vCc9D48xBqaGNb0ZlRDAbFoUpMuMRLrDlxaI8=;
	b=HGO437Jp686HdFgyCDEuv4ux1pMq+bmPUWbmvJdbwd3qiTtbqnGOnx7e8yoVb4ajKL
	MAl8zgf3+MzlEWuZHBSjDNbaRbOfobx1Sjh/RS4gHZlFbcBplVb7UxwLPzFC0cC9swlo
	MNdobuFPTAztOT2IiVEpzUR7RC+9/TnMhR0QdA2MJHOBuPh4nVZjDxsksx8doXh6MTXn
	CrINP3tQA+V9B7wZQ8N6f0trouxfO06xLsfUoB8Z/zc9z65RQc0/uo8UMx84m8DRqIUN
	EujysaoIZJETLqyDJTdXvZ8BUHj3/w3ZQlPOBJz2MEBb60BhrBpzk27XCduYK2GUVrGQ
	W47g==
X-Gm-Message-State: AKGB3mIRKWZvLXiY7g5oqkDIIJWbskKR85jyiTdRabbFL4ZDRGri+VMb
	EUiFcgPX4kIL5SH0bRWMyL+4JVzr
X-Google-Smtp-Source: ACJfBoteKZHom6uumUpy40uN6ScwfKzvbN/TwBLRssFdzbHxQONQCGZ5ueyUoKf8zQbbcica/HNhXQ==
X-Received: by 10.55.75.19 with SMTP id y19mr2550769qka.45.1514998136659;
	Wed, 03 Jan 2018 08:48:56 -0800 (PST)
Received: from sparta.ny.asterius.io ([68.132.72.199])
	by smtp.gmail.com with ESMTPSA id
	y128sm839356qkb.75.2018.01.03.08.48.55
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 03 Jan 2018 08:48:56 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  3 Jan 2018 11:48:50 -0500
Message-Id: <1514998130-4757-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-werkzeug: update to version 0.14
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
X-List-Received-Date: Wed, 03 Jan 2018 16:48:56 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-werkzeug.inc               | 4 ++--
 .../python/{python-werkzeug_0.13.bb => python-werkzeug_0.14.bb}       | 0
 .../python/{python3-werkzeug_0.13.bb => python3-werkzeug_0.14.bb}     | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-werkzeug_0.13.bb => python-werkzeug_0.14.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-werkzeug_0.13.bb => python3-werkzeug_0.14.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-werkzeug.inc b/meta-python/recipes-devtools/python/python-werkzeug.inc
index 0b99802..e1b3400 100644
--- a/meta-python/recipes-devtools/python/python-werkzeug.inc
+++ b/meta-python/recipes-devtools/python/python-werkzeug.inc
@@ -10,8 +10,8 @@ HOMEPAGE = "http://werkzeug.pocoo.org/"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=ed9a0b7c0254616d72dadb98b293ef1b"
 
-SRC_URI[md5sum] = "abdb978e30101809a0ad255f010b1d3d"
-SRC_URI[sha256sum] = "6246e5fc98a505824113fb6aca993d45ea284a2bcffdc2c65d0c538e53e4abd3"
+SRC_URI[md5sum] = "533da0a836a7923704f35918da3bdc1e"
+SRC_URI[sha256sum] = "4aea27a9513b056346e9c8b49107f4ee7927f7bcf0be63024ecee39d5b87e9ef"
 
 PYPI_PACKAGE = "Werkzeug"
 
diff --git a/meta-python/recipes-devtools/python/python-werkzeug_0.13.bb b/meta-python/recipes-devtools/python/python-werkzeug_0.14.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-werkzeug_0.13.bb
rename to meta-python/recipes-devtools/python/python-werkzeug_0.14.bb
diff --git a/meta-python/recipes-devtools/python/python3-werkzeug_0.13.bb b/meta-python/recipes-devtools/python/python3-werkzeug_0.14.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-werkzeug_0.13.bb
rename to meta-python/recipes-devtools/python/python3-werkzeug_0.14.bb
-- 
2.7.4


