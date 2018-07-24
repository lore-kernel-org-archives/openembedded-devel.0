Return-Path: <lukaszgardon555@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 08BA674765
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Jul 2018 18:33:09 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id h20-v6so3483038wmb.4
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Jul 2018 11:33:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=ySAtl+iqJmeN7quAaIIWQhB0PnjRyNM5P8AwKLIxWQ8=;
	b=ElNMrgpEjP4w5RiO96EbNI9PEMnvf4giERZHu/X0qAiuoPv0mLA0naB0NBLnajbBvt
	1OJf+wQ6BR4lPUewLg61VDZ5jEe7rKYT6IMiV7FdQ12qYCn3hnIjvFOUeuGSRm4S5gBT
	P7R+08POUTN9A7h7Mf9AYPHDW5otvnq3x/LdEGP5Tck8bTcEgml6DluhlSnaf4cmIVh4
	wGA8Rpj1wsZs4ycVZw+jLXuq1RLzWRymGrO25ZZddT4//QE21Jlmt2TOKDig9Bz82+Ds
	UWJtHipR+xgM3cxAGyaGORgc9GCPCFVBmEOQvAyRxq+0BZKTXXgvxLzkARiUZ91q5PP+
	4klA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=ySAtl+iqJmeN7quAaIIWQhB0PnjRyNM5P8AwKLIxWQ8=;
	b=hIFjaFLBqvxLrbpafM8wBtmTkWzEUitGwTFrwjb6XJaiuu285cYajm0EIl4Lotw6Ho
	08RQ5CrWco4xObb2HP67GJFX2SPdAWR5CnPKmvcejOS1kGB7Zmrq7db2jYFzbidRxlWS
	tMbv7WqxSdnzCiJFTcCiAGhLOge4RDwanH1+gEYZYbaeSp/ZXRtNocgcsmTK7cpeMmDm
	9bdfiIGh6jIIfzqOrJ6RCuf7EJ+N4xA5M6JW4Y1B/FEB8LevwtjJX1oyQQoJXaVVzTDJ
	VptLtAvOyV/bW+HGD0ynVYFT7Rf8s0tVgGlxS9KMulBN+SFFhfPwZ0to5BhObFk5E82t
	OIwA==
X-Gm-Message-State: AOUpUlGvP3HA/p3xnvkCDxOYpL/35EIhWRDF0O/k6bqtA+MPhjnKV7oL
	msDJ0FAhhjrFo1gESg4CSzTZGNwMLIo=
X-Google-Smtp-Source: AAOMgpd77QBHNoeEWqNnfgMvztyeLFVsxiPSV+U4n3h26F71k5MtoMjJKZYzUDNfbcM9W75vjAJzqQ==
X-Received: by 2002:a1c:9290:: with SMTP id
	u138-v6mr2823340wmd.52.1532457190322; 
	Tue, 24 Jul 2018 11:33:10 -0700 (PDT)
Received: from localhost.localdomain (public-gprs173416.centertel.pl.
	[46.134.16.169]) by smtp.gmail.com with ESMTPSA id
	a11-v6sm13389833wrr.81.2018.07.24.11.33.09
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 24 Jul 2018 11:33:09 -0700 (PDT)
From: lukaszgard <lukaszgardon555@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 24 Jul 2018 20:33:02 +0200
Message-Id: <20180724183302.21403-1-lukaszgardon555@gmail.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Subject: [meta-python][PATCH] python-tornado: upgrade to version 5.1
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
X-List-Received-Date: Tue, 24 Jul 2018 18:33:10 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Łukasz Gardoń <lukaszgardon555@gmail.com>
---
 meta-python/recipes-devtools/python/python-tornado.inc      | 6 +++---
 .../{python-tornado_4.5.3.bb => python-tornado_5.1.bb}      | 0
 .../{python3-tornado_4.5.3.bb => python3-tornado_5.1.bb}    | 0
 3 files changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python-tornado_4.5.3.bb => python-tornado_5.1.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-tornado_4.5.3.bb => python3-tornado_5.1.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-tornado.inc b/meta-python/recipes-devtools/python/python-tornado.inc
index 29d10da6b..b40d0912f 100644
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
2.17.1


