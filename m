Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
	[209.85.210.194])
	by mail.openembedded.org (Postfix) with ESMTP id ED6A27F8A1
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 30 Nov 2019 18:10:50 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id x185so3497801pfc.5
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 30 Nov 2019 10:10:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=HXEeN6wxaInVJf1f0SvuVNKmRtJCMEneRQWtrjwmcZo=;
	b=jfLazKzJQyrU2B5Onai11LkPYpqLxPqDHebMxoTzv9X46EW5XcFZXXlTfHWYqgjBL2
	s2tKPyxeWo4RKlNln75BLx6beEYZBJLjEVOU5bJCA7hRkxNCr8l93PhfTF5aAFT6wemZ
	XVB5vBZRXL2DDPMhOneMOPH+UizD3z1DbRVPS5POboqfOzQuix42/vMegJfizpMIaVjL
	bn2yXpm7SDKsdTZXHL+t7IbR5VjU60nOok74CtliL2FWwjYcTtL9U3kLy1xvKrvCT09S
	76ft+0Pt0M9DiQeZXv97LPUdiPvMFE2U0gL8fQux20ZzWvcbzieG2iVItsYlephiyuOm
	GONA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=HXEeN6wxaInVJf1f0SvuVNKmRtJCMEneRQWtrjwmcZo=;
	b=FyuivBBWW+R3s+X34HtwOQokZXfxCMfOjsYIY8fVsHviDbTMrS5Pi8fBH3GYEFwVvE
	9rOsjd+DrC8sDoD8qmJ+GrKRDhrNhxdISZdRpEv04VBt3zy/0gsSjBXFAPgQWri+Hu3l
	IR2zB0TB+oltCyFxJIzFOdXQ5Dex/sabLW0z3JOhj2Vxb33FzjGxdhCLpx6pUZ2pwLxw
	w3oXGucETfnAA5fKRcbutEQiY2JxPGOmhcneNUl9tqUAUcSboG2s3AeVrffKo3h5MYvR
	rXLcWPBm1VhTivX1FDDN3KXZjEh+57q9ovydw2e07/pmYkOwApmq3dCwqtRDDOb1F/nq
	m82Q==
X-Gm-Message-State: APjAAAXC/UhpTgPxeAlLP0vymzJD8zu9ifJbHsbSv8WSWex6SlWIh4ki
	pXkZ3s/Uhk9YQsMgklaeGlILHpn/
X-Google-Smtp-Source: APXvYqysnbR9ey+UfTPk4JNGmKWs9tzlRZe+3BtgZcPOUvkHjkcWzIp6mQ/nSzwRRopMzveoRhw86g==
X-Received: by 2002:a65:530d:: with SMTP id m13mr22628011pgq.172.1575137451955;
	Sat, 30 Nov 2019 10:10:51 -0800 (PST)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:a5c0:c050:b516:8fc6:8cbf])
	by smtp.gmail.com with ESMTPSA id d6sm490762pju.8.2019.11.30.10.10.51
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 30 Nov 2019 10:10:51 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 30 Nov 2019 10:10:33 -0800
Message-Id: <3eb4c7a0825bd750dfb71fc5ff1e738daf9adcdf.1575137343.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1575137343.git.akuster808@gmail.com>
References: <cover.1575137343.git.akuster808@gmail.com>
Subject: [PATCH 03/15] python-more-itertools.inc: fix python2 package not incorrectly generated
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
X-List-Received-Date: Sat, 30 Nov 2019 18:10:51 -0000

From: Hongxu Jia <hongxu.jia@windriver.com>

The package of python2 is incorrected generated to python3
...
tmp-glibc/work/core2-64-wrs-linux/python-more-itertools/7.2.0-r0$ find image/
image/
image/usr
image/usr/lib64
image/usr/lib64/python3.7
image/usr/lib64/python3.7/site-packages
image/usr/lib64/python3.7/site-packages/more_itertools
image/usr/lib64/python3.7/site-packages/more_itertools/__init__.py
image/usr/lib64/python3.7/site-packages/more_itertools/more.py
image/usr/lib64/python3.7/site-packages/more_itertools/recipes.py
image/usr/lib64/python3.7/site-packages/more_itertools/tests
image/usr/lib64/python3.7/site-packages/more_itertools/tests/__init__.py
image/usr/lib64/python3.7/site-packages/more_itertools/tests/test_more.py
image/usr/lib64/python3.7/site-packages/more_itertools/tests/test_recipes.py
image/usr/lib64/python3.7/site-packages/more_itertools/tests/__pycache__
image/usr/lib64/python3.7/site-packages/more_itertools/tests/__pycache__/__init__.cpython-37.pyc
image/usr/lib64/python3.7/site-packages/more_itertools/tests/__pycache__/test_more.cpython-37.pyc
image/usr/lib64/python3.7/site-packages/more_itertools/tests/__pycache__/test_recipes.cpython-37.pyc
image/usr/lib64/python3.7/site-packages/more_itertools/__pycache__
image/usr/lib64/python3.7/site-packages/more_itertools/__pycache__/__init__.cpython-37.pyc
image/usr/lib64/python3.7/site-packages/more_itertools/__pycache__/more.cpython-37.pyc
image/usr/lib64/python3.7/site-packages/more_itertools/__pycache__/recipes.cpython-37.pyc
image/usr/lib64/python3.7/site-packages/more_itertools-7.2.0-py3.7.egg-info
image/usr/lib64/python3.7/site-packages/more_itertools-7.2.0-py3.7.egg-info/PKG-INFO
image/usr/lib64/python3.7/site-packages/more_itertools-7.2.0-py3.7.egg-info/SOURCES.txt
image/usr/lib64/python3.7/site-packages/more_itertools-7.2.0-py3.7.egg-info/dependency_links.txt
image/usr/lib64/python3.7/site-packages/more_itertools-7.2.0-py3.7.egg-info/top_level.txt
...

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Adrian Bunk <bunk@stusta.de>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-python/recipes-devtools/python/python-more-itertools.inc | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python-more-itertools.inc b/meta-python/recipes-devtools/python/python-more-itertools.inc
index 41c334e..8d814a6 100644
--- a/meta-python/recipes-devtools/python/python-more-itertools.inc
+++ b/meta-python/recipes-devtools/python/python-more-itertools.inc
@@ -5,5 +5,3 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3396ea30f9d21389d7857719816f83b5"
 
 SRC_URI[md5sum] = "f647bfd27243a7bebe53b5ddb6a3b1c4"
 SRC_URI[sha256sum] = "409cd48d4db7052af495b09dec721011634af3753ae1ef92d2b32f73a745f832"
-
-inherit pypi setuptools3
-- 
2.7.4


