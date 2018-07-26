Return-Path: <lukaszgardon555@gmail.com>
Received: from mail-lf1-f67.google.com (mail-lf1-f67.google.com
	[209.85.167.67])
	by mail.openembedded.org (Postfix) with ESMTP id 3EBD278B70
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Jul 2018 05:58:28 +0000 (UTC)
Received: by mail-lf1-f67.google.com with SMTP id v22-v6so351261lfe.8
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Jul 2018 22:58:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=HNJYoWSB2SOQDTAieGljzVXZ5go0ayLAlfmW2Pr1ZGQ=;
	b=RV5dwKdH8CMbJEDs57KS8Y91fEuBjm6Sh1XC176psyAq3bJ+dr6xeWa64vKL9GdsGR
	CgPtGY2dlOCJSNyPXiHyQVkvyQQtNHjCizorHWTcY6Xbxq/+CVMt283XaQf8LDsLgFPx
	hOGyv8nXJJEsXuTbTOJcqbYIiGalCakr4M1kaYNbgVbC5E8Aqe+yL3tJ5ckc4ujMEKG9
	4TLEPxllnL5zI3SS66I20uJnL4nBEo/r0gDrztVjq2fypObdDM8A8v2m/OFMcTKoLCCB
	qx3L04VCAcW0pcRKgITslpw3DnQgSMZX9NirW8MaJDO+Stz1JtXE2bN+iYaCNIdwli7k
	3zqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=HNJYoWSB2SOQDTAieGljzVXZ5go0ayLAlfmW2Pr1ZGQ=;
	b=s7gkuu7tF8LcKS0etatr0VnNUexTmYS8SR1emw5amY+tNVazjL74vAHp70psmayizd
	t3kk00/HLr+MHkopVXW5JP2ey/1T7vWFvHEI3hjU0cpDNZgyGvUis2I3E+5T/2q2C0KF
	MBO/LjKQw4R5SulUw2GlXYVC93r6oBiUQAdbrYx0tbvS0cdoxnuvFHd4f3BtyfPrfMLg
	xa82ngFl6HuVvQVWY0BsQhGNa+8bZDj6wVGgHYo9S0uAmMnIAoGx5V8z++EzhS99Oa/m
	JRcU1iMsjRCfhqwWSP9+zrSqoDbIhZjnJMHb+w7Ml98Zzx8l3I+nkPuicn13EThLyQj8
	YNUw==
X-Gm-Message-State: AOUpUlE2XYIcB6fWBuF1+rCNfpcPmOdEqUdcpSQhIldtxXciiKZTJOpF
	pKlMW1SrfhlwKLsK1CwKDitoD4/e
X-Google-Smtp-Source: AAOMgpe6bcXCIMglOC2AjEAtQFARGWgwYGyvDr8hQgLQURz1HpSVLySBkFQyfWpVrThyFUXYSOTQKQ==
X-Received: by 2002:a19:238d:: with SMTP id
	j135-v6mr350564lfj.58.1532584708664; 
	Wed, 25 Jul 2018 22:58:28 -0700 (PDT)
Received: from localhost.localdomain.localdomain
	(apn-31-0-66-183.dynamic.gprs.plus.pl. [31.0.66.183])
	by smtp.gmail.com with ESMTPSA id
	j15-v6sm71656ljg.52.2018.07.25.22.58.27
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 25 Jul 2018 22:58:28 -0700 (PDT)
From: =?UTF-8?q?=C5=81ukasz=20Gardo=C5=84?= <lukaszgardon555@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 26 Jul 2018 07:58:13 +0200
Message-Id: <1532584693-20420-1-git-send-email-lukaszgardon555@gmail.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Subject: [meta-python][PATCHv3] python-tornado: upgrade to version 5.1
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
X-List-Received-Date: Thu, 26 Jul 2018 05:58:28 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

License-Update: Changed begin and end line range, due to
removed shebang line from licence file (setup.py) - no
changes in the license terms.

Signed-off-by: Łukasz Gardoń <lukaszgardon555@gmail.com>
---
 meta-python/recipes-devtools/python/python-tornado.inc              | 6 +++---
 .../python/{python-tornado_4.5.3.bb => python-tornado_5.1.bb}       | 0
 .../python/{python3-tornado_4.5.3.bb => python3-tornado_5.1.bb}     | 0
 3 files changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python-tornado_4.5.3.bb => python-tornado_5.1.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-tornado_4.5.3.bb => python3-tornado_5.1.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-tornado.inc b/meta-python/recipes-devtools/python/python-tornado.inc
index 29d10da..8acb432 100644
--- a/meta-python/recipes-devtools/python/python-tornado.inc
+++ b/meta-python/recipes-devtools/python/python-tornado.inc
@@ -4,10 +4,10 @@ By using non-blocking network I/O, Tornado can scale to tens of thousands of ope
 polling, WebSockets, and other applications that require a long-lived connection to each user."
 HOMEPAGE = "http://www.tornadoweb.org/en/stable/"
 LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://setup.py;beginline=3;endline=15;md5=8d463fc66ff8f275354ffe88d1896e12"
+LIC_FILES_CHKSUM = "file://setup.py;beginline=2;endline=14;md5=8d463fc66ff8f275354ffe88d1896e12"
 
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
1.8.3.1


