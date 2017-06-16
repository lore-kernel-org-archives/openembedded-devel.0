Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f180.google.com (mail-qt0-f180.google.com
	[209.85.216.180])
	by mail.openembedded.org (Postfix) with ESMTP id 175FB71BA1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Jun 2017 17:15:46 +0000 (UTC)
Received: by mail-qt0-f180.google.com with SMTP id w1so71074008qtg.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Jun 2017 10:15:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=cA02woQ33uQY7cYlH/xkEzl4pLZlcRscaRtnmXiKOPk=;
	b=TDbPaokMACL0WAedRIPR1GcjHAetYLp9TS9UJKu4GB5sE7eGVJ/tdefymlU3Z7xC5U
	BIIFBTSFlhqTfipewFJpelHoHRMWP1GI5iEIvOVXh26T58kdFaFyJSB7cB0n48v88wE8
	1setIS0ieciaEQZPqyfJZqDMLlgiYHzocNiLPVIPVZsEA+TWsXEc6kfx5Oj0W2OY5gEG
	BCZ1Msv4rLvcY2QNgQIMfnAU3C6QdRw6cPGRhA7eRX7uEiFVkYyjpJNXE2BJEuDT0hOi
	df9FYYEXYAZ263ZPXuw9cGWXzh4BiNQcbImgLsRcZtXH7bQqDYIUJfhNplKsTZ+3ve2A
	F+og==
X-Gm-Message-State: AKS2vOwTb4uwIlL2Jzlm/u0WYMuUKuBO8p0XIxx2gM/WTHDg4MB68Swp
	iifh/j63ZOjgnRnbfMQ=
X-Received: by 10.55.203.10 with SMTP id d10mr13142489qkj.167.1497633347219;
	Fri, 16 Jun 2017 10:15:47 -0700 (PDT)
Received: from sparta.ny.asterius.io (ool-43556204.dyn.optonline.net.
	[67.85.98.4]) by smtp.gmail.com with ESMTPSA id
	q37sm2047931qtb.13.2017.06.16.10.15.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 16 Jun 2017 10:15:46 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 16 Jun 2017 13:15:39 -0400
Message-Id: <1497633339-32314-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-gevent: update to version 1.2.2
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
X-List-Received-Date: Fri, 16 Jun 2017 17:15:55 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-gevent.inc               | 6 +++---
 .../python/{python-gevent_1.2.1.bb => python-gevent_1.2.2.bb}       | 0
 .../python/{python3-gevent_1.2.1.bb => python3-gevent_1.2.2.bb}     | 0
 3 files changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python-gevent_1.2.1.bb => python-gevent_1.2.2.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-gevent_1.2.1.bb => python3-gevent_1.2.2.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-gevent.inc b/meta-python/recipes-devtools/python/python-gevent.inc
index deeceae..8889cfb 100644
--- a/meta-python/recipes-devtools/python/python-gevent.inc
+++ b/meta-python/recipes-devtools/python/python-gevent.inc
@@ -3,7 +3,7 @@ DESCRIPTION = "gevent is a coroutine-based Python networking library that uses g
 a high-level synchronous API on top of the libevent event loop."
 HOMEPAGE = "http://www.gevent.org"
 LICENSE = "MIT & Python-2.0 & BSD"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=2dbb33d00e1fd31c7041460a81ac0bd2 \
+LIC_FILES_CHKSUM = "file://LICENSE;md5=4de99aac27b470c29c6c309e0c279b65 \
                     file://NOTICE;md5=5966cd2c6582656d28ab3c33da3860f8 \
                     file://deps/libev/LICENSE;md5=d6ad416afd040c90698edcdf1cbee347"
 DEPENDS += "libevent"
@@ -20,8 +20,8 @@ SRC_URI_append = " \
     file://libev-conf.patch;patch=1;pnum=1 \
 "
 
-SRC_URI[md5sum] = "6700a2433c8e0635425e6798760efc81"
-SRC_URI[sha256sum] = "3de300d0e32c31311e426e4d5d73b36777ed99c2bac3f8fbad939eeb2c29fa7c"
+SRC_URI[md5sum] = "7f0baf355384fe5ff2ecf66853422554"
+SRC_URI[sha256sum] = "4791c8ae9c57d6f153354736e1ccab1e2baf6c8d9ae5a77a9ac90f41e2966b2d"
 
 # The python-gevent has no autoreconf ability
 # and the logic for detecting a cross compile is flawed
diff --git a/meta-python/recipes-devtools/python/python-gevent_1.2.1.bb b/meta-python/recipes-devtools/python/python-gevent_1.2.2.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-gevent_1.2.1.bb
rename to meta-python/recipes-devtools/python/python-gevent_1.2.2.bb
diff --git a/meta-python/recipes-devtools/python/python3-gevent_1.2.1.bb b/meta-python/recipes-devtools/python/python3-gevent_1.2.2.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-gevent_1.2.1.bb
rename to meta-python/recipes-devtools/python/python3-gevent_1.2.2.bb
-- 
2.7.4


