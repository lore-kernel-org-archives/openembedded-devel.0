Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f196.google.com (mail-qk0-f196.google.com
	[209.85.220.196])
	by mail.openembedded.org (Postfix) with ESMTP id 5C34778255
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Nov 2017 19:53:45 +0000 (UTC)
Received: by mail-qk0-f196.google.com with SMTP id w125so34055516qkb.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Nov 2017 11:53:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=pV/hV8UQbO6s9CF5Mqn1PrwgsZwj89BZW7BbCWLaDTc=;
	b=EyPh4oyKf5GldF1yl5foEgGzEAyovrXSbMmFnGDHtaA+CV2pfUtFW+rQ0Xv4ek1WY8
	Qk4urqaf6CqYVVEKv2w810kxPRfN0by5MQNqETYHRyBwgDkdu/GKwhtcamJFgRNE5UtM
	v5BOdp4luWwn9D8fU7QabW0PcDK+9WF1w5vi6baWajKyiEJ5pFejJ7tyLk2RexIP4V3U
	gLvyeBm7EKvrF9m70KqF+Fd2ua6/MgQGEqZczeaZT4BlU8iX0wc5q8Khtg8MEtOSuz54
	pfGHPZ1rj12CaRhI5sheq78t0wmQ27EZ8BsVsB1Fp9NAQfO+nWMXF2GzjX+24lNKfd0m
	Aobg==
X-Gm-Message-State: AJaThX5xBZvme9MWCI3C7BvdGoK8d3ubXzC4JW+u68k/BE/HvqFzWIok
	F8sGNJ0944CPJkXGsEQfZ6XZhQvB
X-Google-Smtp-Source: AGs4zMZCvdEJOMFhuR2KSYkbOLPHt5NKDfuxS+nwymlR/bAkQ2hdMKv3WSb+vmMS21LLS4bxV83NUw==
X-Received: by 10.55.81.135 with SMTP id f129mr29312283qkb.240.1511812427028; 
	Mon, 27 Nov 2017 11:53:47 -0800 (PST)
Received: from sparta.ny.asterius.io ([68.132.72.199])
	by smtp.gmail.com with ESMTPSA id
	w56sm6453615qta.60.2017.11.27.11.53.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 27 Nov 2017 11:53:46 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 27 Nov 2017 14:53:40 -0500
Message-Id: <1511812420-20928-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-jsonpatch: update to version 1.20
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
X-List-Received-Date: Mon, 27 Nov 2017 19:53:46 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../python/{python-jsonpatch_1.16.bb => python-jsonpatch_1.20.bb}     | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-jsonpatch_1.16.bb => python-jsonpatch_1.20.bb} (71%)

diff --git a/meta-python/recipes-devtools/python/python-jsonpatch_1.16.bb b/meta-python/recipes-devtools/python/python-jsonpatch_1.20.bb
similarity index 71%
rename from meta-python/recipes-devtools/python/python-jsonpatch_1.16.bb
rename to meta-python/recipes-devtools/python/python-jsonpatch_1.20.bb
index bbc61a4..a28294a 100644
--- a/meta-python/recipes-devtools/python/python-jsonpatch_1.16.bb
+++ b/meta-python/recipes-devtools/python/python-jsonpatch_1.20.bb
@@ -5,8 +5,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=32b15c843b7a329130f4e266a281ebb3"
 
 inherit pypi setuptools
 
-SRC_URI[md5sum] = "8ef1ceb00dcf992c9e43611f698f9279"
-SRC_URI[sha256sum] = "f025c28a08ce747429ee746bb21796c3b6417ec82288f8fe6514db7398f2af8a"
+SRC_URI[md5sum] = "b82b9ecad4cdef86bf0b88cbdbf7a8b9"
+SRC_URI[sha256sum] = "b12594a0cfe634bdd2a5c027250af2dd84932d493568e88ae722871edc3eb02d"
 
 RDEPENDS_${PN} += "${PYTHON_PN}-json ${PYTHON_PN}-jsonpointer ${PYTHON_PN}-netclient ${PYTHON_PN}-re ${PYTHON_PN}-stringold"
 
-- 
2.7.4


