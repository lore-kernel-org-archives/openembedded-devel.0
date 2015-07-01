Return-Path: <net147@gmail.com>
Received: from mail-pa0-f42.google.com (mail-pa0-f42.google.com
	[209.85.220.42])
	by mail.openembedded.org (Postfix) with ESMTP id B9C7665CBF
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  1 Jul 2015 14:08:20 +0000 (UTC)
Received: by pacws9 with SMTP id ws9so24200777pac.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 01 Jul 2015 07:08:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=O2DPOIfEqMW7Qrv7eZa0pcAOOsYlHp8GqmlNUbd1IPc=;
	b=kODakajJ66IAwWZcvNRP0I/JMRq74I13O1SrG8hplkVa2x8NNoJz+UQo3SW3j0QyV9
	4iBCh2XYR2D2G1PXdPDvdUpbehh0IMkQ03lwvuUN5rDLL/NMA6N4DWgP+IMwPkeC6AR0
	/zLKk76C401pZGUCBGTfqhJOwFCvxXVjzgcC9Sy3ZtalhYVw+DMsulfBQBjOFvN7ZV9z
	IbtEo6Gc1sDhnnrVhJiPglfWb1s7m8R5p15p++5cNea93/230Rm0PFaJIxnCwTe7e2fT
	tP7jX2Las01jhyBKzrNvqMQyabE2cuy/Xti680RGxGg+6SnG/5m2cSs1tdkzzt1Z0FAX
	0Wow==
X-Received: by 10.68.229.200 with SMTP id ss8mr56001905pbc.150.1435759700407; 
	Wed, 01 Jul 2015 07:08:20 -0700 (PDT)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by mx.google.com with ESMTPSA id i4sm2451671pdk.74.2015.07.01.07.08.18
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 01 Jul 2015 07:08:19 -0700 (PDT)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  2 Jul 2015 00:08:08 +1000
Message-Id: <1435759688-6179-1-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 2.4.4
Subject: [meta-oe][PATCH v2] qrencode: new recipe
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
X-List-Received-Date: Wed, 01 Jul 2015 14:08:22 -0000

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 meta-oe/recipes-graphics/qrencode/qrencode_git.bb | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/qrencode/qrencode_git.bb

diff --git a/meta-oe/recipes-graphics/qrencode/qrencode_git.bb b/meta-oe/recipes-graphics/qrencode/qrencode_git.bb
new file mode 100644
index 0000000..6a159a7
--- /dev/null
+++ b/meta-oe/recipes-graphics/qrencode/qrencode_git.bb
@@ -0,0 +1,16 @@
+SUMMARY = "C library for encoding data in a QR Code symbol"
+AUTHOR = "Kentaro Fukuchi"
+HOMEPAGE = "http://fukuchi.org/works/qrencode/"
+SECTION = "libs"
+LICENSE = "LGPLv2.1"
+LIC_FILES_CHKSUM = "file://COPYING;md5=2d5025d4aa3495befef8f17206a5b0a1"
+PV = "3.4.4+git${SRCPV}"
+
+SRCREV = "1b565c7b599029818fc596e7da4371a3083da36c"
+SRC_URI = "git://github.com/fukuchi/libqrencode.git"
+
+S = "${WORKDIR}/git"
+
+inherit autotools pkgconfig
+
+EXTRA_OECONF += "--without-tools --without-tests"
-- 
2.4.4


