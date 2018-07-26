Return-Path: <lukaszgardon555@gmail.com>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id AB6C478C1C
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Jul 2018 18:34:35 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id e7-v6so2660317wrs.9
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Jul 2018 11:34:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=ojfbMHueaetIIB9ykftpYVyQ5ejr1jcE5UvE+WVLQag=;
	b=N6bnciBlfKn4/uEzamjfPcL9mD67V3OlQsiIAnGDHaY8xcwObYrpO0W5jbqXpvsQLb
	aFKdlTUR+g9uqXz64SELsIis5+p9YJzVA602gQIN+vncqUIxnM/awJ41eMsGvObIvSiJ
	5g6qwn9xh1h6xaeJNJPDV26vON7CAOtNf71cKrm4EN9kys3yjqD6aQ6P7SAq/loKB820
	BoWYaLAWrLOcvgYZuf7sHj5itAqXzyX36Vx6Ixz4VK/T+t5nkNDZuKet02O88dHjJzF6
	/Zi5xq4bnoP+2Jc7fUN6RuBHVjb8znZwVJVhaHa4ZNm0jv1YTD+W2E0QQLxNIad9XMnF
	RbEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=ojfbMHueaetIIB9ykftpYVyQ5ejr1jcE5UvE+WVLQag=;
	b=DO/PTsfbJefmicg0+Vnl4+ahiSZi6LJxqw6gkr3anNlfsTJbK/GKP5nnllpy38Zf5y
	+V0ex3YlXNseTbs9kXZH0RUNL+/64f4w+VAXGXTTT4TIl1xn1Ts9Z3K3NROH/Iarsqkj
	oGs2H5JjePt8pDeKZBltLzL3KlXSx5NtMTOukEHcyx8eKULRMxfu0iLoQS4q4RigIcF7
	a/hlvNmUmqnNLXHgYgoNs3kLUbLSrqJbMZiMANnFjpElOPKiatcaAR7GrXUvqgSWvLDu
	7RbjneRrh0nqG0i1N63rUDbFOZrMpJEFhsv5ZriTOCUPMccIxhDuDqrKqWBV6hLT9Ex3
	xgIQ==
X-Gm-Message-State: AOUpUlFEBiOXyOktrPjfk9I98K0+V5ZAH1Zf/slYbTyKfpJdi0Y6ghHf
	xYCQbhJ0glAVDAipAm/9+HBpqlup
X-Google-Smtp-Source: AAOMgpe+0o42t8cDkVoYgO6sCursBTmPi7N1cmHu8lqE6degEVt6ylpF/TGByTqPcmqKgjKtJmJ1fQ==
X-Received: by 2002:adf:b1d2:: with SMTP id
	r18-v6mr2521409wra.79.1532630075886; 
	Thu, 26 Jul 2018 11:34:35 -0700 (PDT)
Received: from localhost.localdomain (public-gprs181323.centertel.pl.
	[46.134.47.140]) by smtp.gmail.com with ESMTPSA id
	q70-v6sm4044006wmd.39.2018.07.26.11.34.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 26 Jul 2018 11:34:35 -0700 (PDT)
From: lukaszgard <lukaszgardon555@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 26 Jul 2018 20:34:13 +0200
Message-Id: <20180726183413.17793-1-lukaszgardon555@gmail.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Subject: [meta-python][PATCHv4] python-tornado: upgrade to version 5.1.0, added setting PV in recipe to support fetching from pypi.
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
X-List-Received-Date: Thu, 26 Jul 2018 18:34:35 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Łukasz Gardoń <lukaszgardon555@gmail.com>

License-Update: Change license file from setup.py to
LICENSE, based on the same the same license policy Apache 2.0.

Signed-off-by: Łukasz Gardoń <lukaszgardon555@gmail.com>
---
 meta-python/recipes-devtools/python/python-tornado.inc    | 8 +++++---
 .../{python-tornado_4.5.3.bb => python-tornado_5.1.0.bb}  | 0
 ...{python3-tornado_4.5.3.bb => python3-tornado_5.1.0.bb} | 0
 3 files changed, 5 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python-tornado_4.5.3.bb => python-tornado_5.1.0.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-tornado_4.5.3.bb => python3-tornado_5.1.0.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-tornado.inc b/meta-python/recipes-devtools/python/python-tornado.inc
index 29d10da6b..a6a082dec 100644
--- a/meta-python/recipes-devtools/python/python-tornado.inc
+++ b/meta-python/recipes-devtools/python/python-tornado.inc
@@ -4,10 +4,12 @@ By using non-blocking network I/O, Tornado can scale to tens of thousands of ope
 polling, WebSockets, and other applications that require a long-lived connection to each user."
 HOMEPAGE = "http://www.tornadoweb.org/en/stable/"
 LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://setup.py;beginline=3;endline=15;md5=8d463fc66ff8f275354ffe88d1896e12"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-SRC_URI[md5sum] = "a5fc7fd4aea94867609a491ce65786f1"
-SRC_URI[sha256sum] = "6d14e47eab0e15799cf3cdcc86b0b98279da68522caace2bd7ce644287685f0a"
+SRC_URI[md5sum] = "bd264851c409f926d1dae1ad5055d28d"
+SRC_URI[sha256sum] = "4f66a2172cb947387193ca4c2c3e19131f1c70fa8be470ddbbd9317fd0801582"
+
+PV = "5.1"
 
 RDEPENDS_${PN} += "${PYTHON_PN}-compression ${PYTHON_PN}-numbers ${PYTHON_PN}-email \
                    ${PYTHON_PN}-pkgutil ${PYTHON_PN}-html ${PYTHON_PN}-json ${PYTHON_PN}-certifi ${PYTHON_PN}-threading \
diff --git a/meta-python/recipes-devtools/python/python-tornado_4.5.3.bb b/meta-python/recipes-devtools/python/python-tornado_5.1.0.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-tornado_4.5.3.bb
rename to meta-python/recipes-devtools/python/python-tornado_5.1.0.bb
diff --git a/meta-python/recipes-devtools/python/python3-tornado_4.5.3.bb b/meta-python/recipes-devtools/python/python3-tornado_5.1.0.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-tornado_4.5.3.bb
rename to meta-python/recipes-devtools/python/python3-tornado_5.1.0.bb
-- 
2.17.1


