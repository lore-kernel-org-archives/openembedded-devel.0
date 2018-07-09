Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f195.google.com (mail-qt0-f195.google.com
	[209.85.216.195])
	by mail.openembedded.org (Postfix) with ESMTP id 723FD75402
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  9 Jul 2018 22:09:51 +0000 (UTC)
Received: by mail-qt0-f195.google.com with SMTP id z8-v6so8232190qto.9
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 09 Jul 2018 15:09:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=wxB3g8B94T+LYmEU44woj++fmwvcRF84NF0HARYd1GA=;
	b=cu8xU7klK+3dBAkfFfRVj8nZaTLwA9AmqWzNr9S9SP2s8QqiEkYfx6d5BnZ8Ave1IV
	h+kqo1Rq9RPaUGZ4o7ycSVxiod4e++FdId+aJ86xutdshdbw2uK1pAk4ZYsK7nEW8WNe
	m6zI9BTAqpbqCsJ9q8DZmtyiF8PkDBgjQtuqzLhlT6Jiqe7aOdF8npuEECsOIPG2HIuj
	4OQzcAoZMF+XUtnsWoZk5ObwBwArgij9CqLJ4SH+6UyS2sRVjjmhdYf+WnctnwOCAPWl
	gbqwg6mhq4hYbdtn1PxSsWKEJ1eRe/rCT1zZM+MhDUmBxyyfNWpPtI52+jcZ3Zjr/Ss7
	IFbg==
X-Gm-Message-State: APt69E0zzrQLpqpotRCMnuj+zqM/YvLbgu4GHg/gmWGGWOariMCEZHEV
	CgaVM2N8HM2dw+ymyGc+bw30bVFk
X-Google-Smtp-Source: AAOMgpekDTx/QHFfsyl2F5Fui6JBDsZeECsIiueyN+J+jheaVDyR6G38Pw6J+/njfrb++XClrE3O0g==
X-Received: by 2002:a0c:8797:: with SMTP id
	23-v6mr19239467qvj.202.1531174192014; 
	Mon, 09 Jul 2018 15:09:52 -0700 (PDT)
Received: from sparta.ny.asterius.io ([68.132.61.164])
	by smtp.gmail.com with ESMTPSA id
	o31-v6sm10957295qte.16.2018.07.09.15.09.51
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 09 Jul 2018 15:09:51 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  9 Jul 2018 18:09:43 -0400
Message-Id: <1531174183-25516-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-backports-functools-lru-cache: update to version 1.5
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
X-List-Received-Date: Mon, 09 Jul 2018 22:09:51 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 ...lru-cache_1.4.bb => python-backports-functools-lru-cache_1.5.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python-backports-functools-lru-cache_1.4.bb => python-backports-functools-lru-cache_1.5.bb} (66%)

diff --git a/meta-python/recipes-devtools/python/python-backports-functools-lru-cache_1.4.bb b/meta-python/recipes-devtools/python/python-backports-functools-lru-cache_1.5.bb
similarity index 66%
rename from meta-python/recipes-devtools/python/python-backports-functools-lru-cache_1.4.bb
rename to meta-python/recipes-devtools/python/python-backports-functools-lru-cache_1.5.bb
index 961436f..825444f 100644
--- a/meta-python/recipes-devtools/python/python-backports-functools-lru-cache_1.4.bb
+++ b/meta-python/recipes-devtools/python/python-backports-functools-lru-cache_1.5.bb
@@ -2,12 +2,12 @@ SUMMARY = "Backport of functools.lru_cache from Python 3.3"
 HOMEPAGE = "https://github.com/jaraco/backports.functools_lru_cache"
 SECTION = "devel/python"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://setup.py;beginline=47;endline=47;md5=98fc3658e5970d26f6b2109808c766be"
+LIC_FILES_CHKSUM = "file://setup.py;beginline=57;endline=57;md5=98fc3658e5970d26f6b2109808c766be"
 
 PYPI_PACKAGE = "backports.functools_lru_cache"
 
-SRC_URI[md5sum] = "b954e7d5e2ca0f0f66ad2ed12ba800e5"
-SRC_URI[sha256sum] = "31f235852f88edc1558d428d890663c49eb4514ffec9f3650e7f3c9e4a12e36f"
+SRC_URI[md5sum] = "20f53f54cd3f04b3346ce75a54959754"
+SRC_URI[sha256sum] = "9d98697f088eb1b0fa451391f91afb5e3ebde16bbdb272819fd091151fda4f1a"
 
 DEPENDS += "python-setuptools-scm-native"
 
-- 
2.7.4


