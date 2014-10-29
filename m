Return-Path: <mike.holmes@linaro.org>
Received: from mail-qc0-f182.google.com (mail-qc0-f182.google.com
	[209.85.216.182])
	by mail.openembedded.org (Postfix) with ESMTP id 54C2865CA0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Oct 2014 14:14:50 +0000 (UTC)
Received: by mail-qc0-f182.google.com with SMTP id m20so2460856qcx.27
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Oct 2014 07:14:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=KafZHdyuQWDQtu+SN4xJZ0pNHt8G1UkPB4aCgWKVNJs=;
	b=WJAYJzRCbgHPFZDDujijU6VccgcN7Cfs8OYYqTpu1UNs6Nag21IbF7uBy+O1fe2YNL
	bLkvUBMUwazkzSafoZLTzkCyT2/OPpnEghQ2F9sqcrvIkTqL4+rAu5H62RxZ/vRxIfdi
	ij859OMOyBxPuycP4XgF0ygr/rtwn2Z/0QyQuvpyOR2QH4D9zEngbvVnUs90Mu/sO+E5
	WI6/87H5iQzkmcDUmA9nm5Sty9uSqmpT1tsqYcsjwR6BhXn4MBNU1C3mAAa7U8qqgBGb
	7wXopaM4Bxpwit3z1YEBkAG5SxluHhUM0+NSQ6yLRvxtPMR3HGRAqrk2wrdsiFMX0HLh
	Axdg==
X-Gm-Message-State: ALoCoQlNMM20nkjtTAJ07p/lsAXTZvtJ/Ju3UjRRmofnk0moAZ75LAkqi9vdSCjdUm5vpHu8DwLi
X-Received: by 10.140.91.201 with SMTP id z67mr15678267qgd.5.1414592091136;
	Wed, 29 Oct 2014 07:14:51 -0700 (PDT)
Received: from fedora1.holmesfamily.ws ([98.221.136.245])
	by mx.google.com with ESMTPSA id s3sm4253523qat.4.2014.10.29.07.14.50
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 29 Oct 2014 07:14:50 -0700 (PDT)
From: Mike Holmes <mike.holmes@linaro.org>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 29 Oct 2014 10:14:44 -0400
Message-Id: <1414592084-49085-1-git-send-email-mike.holmes@linaro.org>
X-Mailer: git-send-email 2.1.0
Subject: [meta-oe][PATCH v2] add CUnit test suite
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 29 Oct 2014 14:14:59 -0000

Signed-off-by: Mike Holmes <mike.holmes@linaro.org>
---

 meta-oe/recipes-devtools/cunit/cunit_2.1-3.bb | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/cunit/cunit_2.1-3.bb

diff --git a/meta-oe/recipes-devtools/cunit/cunit_2.1-3.bb b/meta-oe/recipes-devtools/cunit/cunit_2.1-3.bb
new file mode 100644
index 0000000..ccd0b79
--- /dev/null
+++ b/meta-oe/recipes-devtools/cunit/cunit_2.1-3.bb
@@ -0,0 +1,18 @@
+DESCRIPTION = "CUnit is a C framework for unit testing. Test output supports comandline and GUI reults reporting"
+HOMEPAGE = "http://cunit.sourceforge.net"
+LICENSE = "LGPL-2.0"
+SECTION = "libs"
+LIC_FILES_CHKSUM = "file://COPYING;md5=7734aa853b85d6f935466f081490ddbb"
+
+S = "${WORKDIR}/CUnit-${PV}"
+
+SRC_URI = "http://downloads.sourceforge.net/project/cunit/CUnit/${PV}/CUnit-${PV}.tar.bz2"
+SRC_URI[md5sum] = "b5f1a9f6093869c070c6e4a9450cc10c"
+SRC_URI[sha256sum] = "f5b29137f845bb08b77ec60584fdb728b4e58f1023e6f249a464efa49a40f214"
+
+inherit autotools-brokensep
+
+EXTRA_OECONF = "--enable-debug --enable-memtrace --enable-automated --enable-basic --enable-console"
+
+FILES_${PN}-doc += "${prefix}/doc"
+FILES_${PN}-dev += "${datadir}/CUnit"
-- 
2.1.0


