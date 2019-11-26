Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
	[209.85.215.196])
	by mail.openembedded.org (Postfix) with ESMTP id ABEDE7FC98
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Nov 2019 20:54:47 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id b137so7287941pga.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Nov 2019 12:54:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=ddviRPz3pya9L9QdCOSNoYO712Kfj9ql0Hqmb9XwXlc=;
	b=O32uIhjfx0qISppnHwefopChZbR1YwtAeLrybsrptJs6r2eaZhETthHTDqya/1EI/l
	yG5X9HjZlUMBneELEKl1U3+VtKgxhFEU52HU1QvJEle0gvWUrcPtqsfrGDTWkWBXISyB
	+wvwiNRO7EltDsZhRM6IgbpmJDn3vO7JQbxIM2qCs5COVDnUTsnzQMU1TH7vjWSZLk6q
	CdD2PdZFR3DiahcGBuHbNIshaoDTThIE6MYL5M3nQhWu4nLHfcsH2w5zP/moTPnx7BY7
	kVVefzIiHYUysYERkSS55yALrcAQ+MrJDXc2wSEs8EH2ssrSA4rlLtLo8Df7pKohopt3
	98MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=ddviRPz3pya9L9QdCOSNoYO712Kfj9ql0Hqmb9XwXlc=;
	b=EhH1Fst3VhaI55TC/FajWsiiUZlzNznT4YuUdG9EsfPcsK4KwH6xq6M6q8/Pm+blYS
	TfPpzMJHkin14UErGQouZxlujAxOySEowan6lC0vd/7Bif00bdC4HhBs+rdgayt37kiF
	GzYbXqcwTi8N6MJHXBe4Zqepl+E1s254sevv4KEKn//KRjMQO/2MSETggp/DzwJs1jD3
	RGC6aHWnaGBuZ8fH0ItBEfhBLvMGKC+g/TfDgZfCaQvAVmEU2rxUActkCuyopTc/kXqB
	pjPWaU3/BzFsr9E6pnfF2ZRSG6CUiq4sy1H4Y7ggGWToIPF6w0GPM266Nb3EwIIYVfpE
	jKOw==
X-Gm-Message-State: APjAAAWVNTlZThbYD113T80MIKC0FYIdAFay/2CAJnGFnfXcRquVC7SY
	5+SRBmWLyXRqGn1wHrBRLmj42Vrn4zc=
X-Google-Smtp-Source: APXvYqwLMN7k6yy3wCVQQYn5o8xZ8zULMIAqSPs2w8idtqcl514Ey7kOOD57stV09n3BrtCyeLel4Q==
X-Received: by 2002:a62:501:: with SMTP id 1mr44590827pff.69.1574801688043;
	Tue, 26 Nov 2019 12:54:48 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:1c20::e439])
	by smtp.gmail.com with ESMTPSA id
	i5sm13396603pfo.52.2019.11.26.12.54.47
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 26 Nov 2019 12:54:47 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 26 Nov 2019 12:54:35 -0800
Message-Id: <20191126205435.2039138-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Subject: [meta-oe][PATCH] mercurial: Upgrade to 5.2 and switch to py3
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
X-List-Received-Date: Tue, 26 Nov 2019 20:54:47 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../{mercurial_4.6.1.bb => mercurial_5.2.bb}         | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)
 rename meta-oe/recipes-devtools/mercurial/{mercurial_4.6.1.bb => mercurial_5.2.bb} (67%)

diff --git a/meta-oe/recipes-devtools/mercurial/mercurial_4.6.1.bb b/meta-oe/recipes-devtools/mercurial/mercurial_5.2.bb
similarity index 67%
rename from meta-oe/recipes-devtools/mercurial/mercurial_4.6.1.bb
rename to meta-oe/recipes-devtools/mercurial/mercurial_5.2.bb
index 13710aaea3..3cff508b6a 100644
--- a/meta-oe/recipes-devtools/mercurial/mercurial_4.6.1.bb
+++ b/meta-oe/recipes-devtools/mercurial/mercurial_5.2.bb
@@ -3,15 +3,13 @@ HOMEPAGE = "http://mercurial.selenic.com/"
 SECTION = "console/utils"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
-DEPENDS = "python python-native"
-DEPENDS_class-native = "python-native"
-RDEPENDS_${PN} = "python python-modules"
+RDEPENDS_${PN} = "python3 python3-modules"
 
-inherit python-dir
+inherit python3native
 
 SRC_URI = "https://www.mercurial-scm.org/release/${BP}.tar.gz"
-SRC_URI[md5sum] = "f9b2e4a3b5901ef744fa3abe4196e97e"
-SRC_URI[sha256sum] = "89fa8ecbc8aa6e48e98f9803a1683ba91367124295dba2407b28c34ca621108d"
+SRC_URI[md5sum] = "9ba9d59157c002db8d8cab680de08eb5"
+SRC_URI[sha256sum] = "ff030e923f03ee15c91191996fcb099bfcfa60c7df263be227f67b6a65d36194"
 
 S = "${WORKDIR}/mercurial-${PV}"
 
@@ -21,7 +19,7 @@ EXTRA_OEMAKE = "STAGING_LIBDIR=${STAGING_LIBDIR} STAGING_INCDIR=${STAGING_INCDIR
     PREFIX=${prefix}"
 
 do_configure_append () {
-    sed -i -e 's:PYTHON=python:PYTHON=${STAGING_BINDIR_NATIVE}/python-native/python:g' ${S}/Makefile
+    sed -i -e 's:PYTHON=python:PYTHON=${STAGING_BINDIR_NATIVE}/python-native/python3:g' ${S}/Makefile
 }
 
 do_install () {
-- 
2.24.0


