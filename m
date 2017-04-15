Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f45.google.com (mail-wm0-f45.google.com [74.125.82.45])
	by mail.openembedded.org (Postfix) with ESMTP id 0F7C671DEE
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 15 Apr 2017 14:49:46 +0000 (UTC)
Received: by mail-wm0-f45.google.com with SMTP id t189so9747712wmt.1
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 15 Apr 2017 07:49:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=oWd9fdfo4cwAWzJhnz/QyzK8I9bFIyFreidYbg81Uxw=;
	b=Zoxs271z8x/TX/nvGZn0LjrQeyJ+WF3uiRk6B4BSAJ6mdap/RyVPA88PFatI6NtUZ1
	T4qlrCYSaDjo3ZktfzttXx/8StgVsMo5wiJPVTenRmXf7ENCoKpwRcDns/ljgQ3JAPIs
	2kF2qLpoapvcjVaBvHuMSNYZAqFWjs8Tyr05FZ8Y7/LzNo+qL1XgcG4QIfrKTFs01xpB
	WGvha+fZRVuf4bSCQNTJ6MlPKtoHEqtaZoM5Pr1Lzct3kMj4pdwIoBQTjqDnbF8QFOJn
	BIs8LT0JJLxTEH7ss/3f2XgwS2ItSlc6buXuAsV8VSYAzv8s661opQYHsP5iLvEurTM5
	gjUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=oWd9fdfo4cwAWzJhnz/QyzK8I9bFIyFreidYbg81Uxw=;
	b=O1Of3hBt8AXBuT6mIToh+VmQMDcR0DO/XKnq+JKpQ5g81NFL7HWhdMZjK28WLUbynO
	4m/ZQiazcgvK0sIhuUW925KlpNLRXUpjabJ/6e54XkWtl2XO8onBoachOyVFQmRpCMuS
	J8THYSGm7wdlhb1j6QiAdjtr2Ee4xqf2eEpBayqdOOukcBvAVFr1ZdE1p9FeS9hpfphG
	KMvQ7gxl6iGKcoxCtTNv8XJcSjOZedW6+lPdSOcQGPjcoroR6yZRYWOVeHkPaPrKG1Cd
	CVIj21YTxBTmBMsslzXSoohG8GqtJhpzIdKRky7fj164CLa6w4NMhq9TUwuo3kNJSqp/
	KQ6Q==
X-Gm-Message-State: AN3rC/5n8Md43jyewSsVeRd7id/a3QjkDADVef6hk7y0CVf1UFl0YqNs
	VpbnLrzI1YgiNKw0
X-Received: by 10.28.157.84 with SMTP id g81mr2526860wme.120.1492267787143;
	Sat, 15 Apr 2017 07:49:47 -0700 (PDT)
Received: from PC192-168-2-116.speedport.ip
	(p20030046E91387451E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:46:e913:8745:1e6f:65ff:fe3e:7f61])
	by smtp.googlemail.com with ESMTPSA id
	v14sm6615281wra.65.2017.04.15.07.49.46
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 15 Apr 2017 07:49:46 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 15 Apr 2017 16:49:28 +0200
Message-Id: <20170415144929.24871-1-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.9.3
MIME-Version: 1.0
Subject: [PATCH 1/2] hunspell: update 1.3.3 -> 1.6.1
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
X-List-Received-Date: Sat, 15 Apr 2017 14:49:48 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

hunspell moved to github and changed licence

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-oe/recipes-support/hunspell/hunspell_1.3.3.bb | 18 ------------------
 meta-oe/recipes-support/hunspell/hunspell_1.6.1.bb | 17 +++++++++++++++++
 2 files changed, 17 insertions(+), 18 deletions(-)
 delete mode 100644 meta-oe/recipes-support/hunspell/hunspell_1.3.3.bb
 create mode 100644 meta-oe/recipes-support/hunspell/hunspell_1.6.1.bb

diff --git a/meta-oe/recipes-support/hunspell/hunspell_1.3.3.bb b/meta-oe/recipes-support/hunspell/hunspell_1.3.3.bb
deleted file mode 100644
index 9e6f774..0000000
--- a/meta-oe/recipes-support/hunspell/hunspell_1.3.3.bb
+++ /dev/null
@@ -1,18 +0,0 @@
-SUMMARY = "A spell checker and morphological analyzer library"
-HOMEPAGE = "http://hunspell.sourceforge.net/"
-LICENSE = "LGPLv2.1 | GPLv2 | MPLv1.1"
-LIC_FILES_CHKSUM = " \
-    file://COPYING;md5=ed3a37b3ba6d6be3e08ab45987cf1b88 \
-    file://COPYING.LGPL;md5=d8045f3b8f929c1cb29a1e3fd737b499 \
-    file://COPYING.MPL;md5=bfe1f75d606912a4111c90743d6c7325 \
-"
-
-SRC_URI = "${SOURCEFORGE_MIRROR}/project/${BPN}/Hunspell/${PV}/${BPN}-${PV}.tar.gz"
-SRC_URI[md5sum] = "4967da60b23413604c9e563beacc63b4"
-SRC_URI[sha256sum] = "a7b2c0de0e2ce17426821dc1ac8eb115029959b3ada9d80a81739fa19373246c"
-
-inherit autotools pkgconfig gettext
-
-RDEPENDS_${PN} = "perl"
-
-BBCLASSEXTEND = "native"
diff --git a/meta-oe/recipes-support/hunspell/hunspell_1.6.1.bb b/meta-oe/recipes-support/hunspell/hunspell_1.6.1.bb
new file mode 100644
index 0000000..125729f
--- /dev/null
+++ b/meta-oe/recipes-support/hunspell/hunspell_1.6.1.bb
@@ -0,0 +1,17 @@
+SUMMARY = "A spell checker and morphological analyzer library"
+HOMEPAGE = "http://hunspell.github.io/"
+LICENSE = "GPLv3 | LGPLv3"
+LIC_FILES_CHKSUM = " \
+    file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
+    file://COPYING.LESSER;md5=e6a600fd5e1d9cbde2d983680233ad02 \
+"
+
+SRC_URI = "https://github.com/${BPN}/${BPN}/archive/v${PV}.tar.gz"
+SRC_URI[md5sum] = "0df1c18c1284f8625af5ae5a8d5c4cef"
+SRC_URI[sha256sum] = "30f593733c50b794016bb03d31fd2a2071e4610c6fa4708e33edad2335102c49"
+
+inherit autotools pkgconfig gettext
+
+RDEPENDS_${PN} = "perl"
+
+BBCLASSEXTEND = "native"
-- 
2.9.3


