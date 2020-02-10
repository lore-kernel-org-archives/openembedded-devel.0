Return-Path: <straka.derek@gmail.com>
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com
	[209.85.210.45])
	by mail.openembedded.org (Postfix) with ESMTP id E44ED605EA
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Feb 2020 02:12:50 +0000 (UTC)
Received: by mail-ot1-f45.google.com with SMTP id g64so4803199otb.13
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 09 Feb 2020 18:12:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=XRJLiIZRP6hmkpViZpJg2EvI3skMdCDjrh5SLedm7g4=;
	b=NLSkq5lDm+fi527EhjRjmjxkPzuptvYFrPMblCbewn1REmMLaCbMmrCla78yvXJ5CK
	X1U7MqkbCS0ZlOgEL5AwJY/mAaLzYCcgyzwrDqkPc/wT+W4TIPcVioVF6dgYJwN+oXOH
	GNuObIcLpHKWxJQRpRmBnKHXniGBcSXwEiBYRINPxCMxc++7iDLHsDslv+nrw8SVWui+
	xX73lOuKsF/KmVLO5VA+hH1N5iSeBxq8nv2Tsk8nA8FE0ncrEIW+tufDUl9j1NF+ecBG
	KmpImhVj57sH6KZ/E6IOfU37fNLsu336Qm7iUk8yrG3T03u0G39PEqp7Ka6VtYilQDQK
	05dA==
X-Gm-Message-State: APjAAAVFuGUL1qekJRSQgXJoZwMOu32G0Mab+dHDMBcxaDHUdXTpXhVt
	y62jp5z5HrRVTlp+dYsGY00p86Lfq9k=
X-Google-Smtp-Source: APXvYqy76PwKha0sDiW/dpF3GfoBPRnxDKavs2TdvnXkdQL0hMdMnci5GC+fO9a/Ea7jGboc/u6LnQ==
X-Received: by 2002:a9d:7357:: with SMTP id l23mr8262340otk.10.1581300771601; 
	Sun, 09 Feb 2020 18:12:51 -0800 (PST)
Received: from sparta.lan1 (cpe-24-28-77-115.austin.res.rr.com. [24.28.77.115])
	by smtp.gmail.com with ESMTPSA id 5sm4032339otr.13.2020.02.09.18.12.51
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 09 Feb 2020 18:12:51 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  9 Feb 2020 21:12:35 -0500
Message-Id: <20200210021235.20614-2-derek@asterius.io>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200210021235.20614-1-derek@asterius.io>
References: <20200210021235.20614-1-derek@asterius.io>
Subject: [meta-python][PATCH 2/2] python3-backports-functools-lru-cache: update to version 1.6.1
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
X-List-Received-Date: Mon, 10 Feb 2020 02:12:51 -0000

License-Checksum updated to use the actual license file

Signed-off-by: Derek Straka <derek@asterius.io>
---
 ....5.bb => python3-backports-functools-lru-cache_1.6.1.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-backports-functools-lru-cache_1.5.bb => python3-backports-functools-lru-cache_1.6.1.bb} (61%)

diff --git a/meta-python/recipes-devtools/python/python3-backports-functools-lru-cache_1.5.bb b/meta-python/recipes-devtools/python/python3-backports-functools-lru-cache_1.6.1.bb
similarity index 61%
rename from meta-python/recipes-devtools/python/python3-backports-functools-lru-cache_1.5.bb
rename to meta-python/recipes-devtools/python/python3-backports-functools-lru-cache_1.6.1.bb
index 9182792baf..c95a759abf 100644
--- a/meta-python/recipes-devtools/python/python3-backports-functools-lru-cache_1.5.bb
+++ b/meta-python/recipes-devtools/python/python3-backports-functools-lru-cache_1.6.1.bb
@@ -2,12 +2,12 @@ SUMMARY = "Backport of functools.lru_cache from Python 3.3"
 HOMEPAGE = "https://github.com/jaraco/backports.functools_lru_cache"
 SECTION = "devel/python"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://setup.py;beginline=57;endline=57;md5=98fc3658e5970d26f6b2109808c766be"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=a33f38bbf47d48c70fe0d40e5f77498e"
 
 PYPI_PACKAGE = "backports.functools_lru_cache"
 
-SRC_URI[md5sum] = "20f53f54cd3f04b3346ce75a54959754"
-SRC_URI[sha256sum] = "9d98697f088eb1b0fa451391f91afb5e3ebde16bbdb272819fd091151fda4f1a"
+SRC_URI[md5sum] = "103000b21a8e683647e2ce41929f2a9d"
+SRC_URI[sha256sum] = "8fde5f188da2d593bd5bc0be98d9abc46c95bb8a9dde93429570192ee6cc2d4a"
 
 DEPENDS += "${PYTHON_PN}-setuptools-scm-native"
 
-- 
2.17.1


