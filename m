Return-Path: <net147@gmail.com>
Received: from mail-pd0-f178.google.com (mail-pd0-f178.google.com
	[209.85.192.178])
	by mail.openembedded.org (Postfix) with ESMTP id D040765CBF
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  1 Jul 2015 14:10:29 +0000 (UTC)
Received: by pdjd13 with SMTP id d13so26602412pdj.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 01 Jul 2015 07:10:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=xHEClIr/2IcorBCFvReaZX1bDG39alPoTDT+j1zq7CQ=;
	b=dNOsc22+IrwF+ClNU7a/bTmWH+s737YJp8Yni8Ow5ngzfbXYC1S68OR4gmf1vbvJ8m
	YXCTPCAXsYx7RXNWGU52pSqnuHqOt0tUvPv8HI8vE11MJ601SdM6qPLjzNAmRNGBE+f4
	hq75DdorUDKJlzQuJ0J3rLzdku+pGykVqmvkhhp5p4vcrLeUtryXc1pOHRGbmfj7o+H+
	NxksbC/d1SecVoea5bjLlLjYx7sKV+PC9B9oyrb70mmAiqz3Ntw8XAqi/BInZl0v+arN
	7i8UIuPDmi/vr8YbaJc4mJ63AbZLWR47RWW39qOSSCXZYP0jK6rEu/gGB1l6MjhbZVAY
	Y/Bw==
X-Received: by 10.66.65.229 with SMTP id a5mr56363256pat.11.1435759830179;
	Wed, 01 Jul 2015 07:10:30 -0700 (PDT)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by mx.google.com with ESMTPSA id ph4sm2468306pdb.43.2015.07.01.07.10.28
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 01 Jul 2015 07:10:28 -0700 (PDT)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  2 Jul 2015 00:10:23 +1000
Message-Id: <1435759823-6448-1-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 2.4.4
Subject: [meta-qt5][PATCH v2] quazip: new recipe
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
X-List-Received-Date: Wed, 01 Jul 2015 14:10:29 -0000

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 recipes-qt/quazip/quazip_0.7.1.bb | 13 +++++++++++++
 1 file changed, 13 insertions(+)
 create mode 100644 recipes-qt/quazip/quazip_0.7.1.bb

diff --git a/recipes-qt/quazip/quazip_0.7.1.bb b/recipes-qt/quazip/quazip_0.7.1.bb
new file mode 100644
index 0000000..4ba4197
--- /dev/null
+++ b/recipes-qt/quazip/quazip_0.7.1.bb
@@ -0,0 +1,13 @@
+SUMMARY = "Qt/C++ wrapper for ZIP/UNZIP package"
+LICENSE = "LGPLv2.1"
+LIC_FILES_CHKSUM = "file://COPYING;md5=27818cd7fd83877a8e3ef82b82798ef4"
+DEPENDS = "qtbase"
+
+SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BP}.tar.gz"
+SRC_URI[md5sum] = "3b99effb2a9417707d463e6f19cf2629"
+SRC_URI[sha256sum] = "78c984103555c51e6f7ef52e3a2128e2beb9896871b2cc4d4dbd4d64bff132de"
+
+inherit qmake5
+
+EXTRA_QMAKEVARS_PRE += "PREFIX=${prefix}"
+EXTRA_QMAKEVARS_POST += "SUBDIRS=${BPN}"
-- 
2.4.4


