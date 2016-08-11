Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 9820477196
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Aug 2016 10:10:55 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id i5so420694wmg.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Aug 2016 03:10:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=uDog6/4CowFknjmazxHiRFfks6BIbhZHJFvVpc6BRS0=;
	b=YG/y7m2lIAyLILV5c55IQA3ycxQIB55a2gw9NoFYMl8bInkq+Qwvv/GX3EnsEIewqy
	NR7Q8fOBAiTRieTDjQnl6qmgd4quqX4xaNgPhHAbV3h7qPprTfhgypyMwLJzotUaszCK
	AwPS8uoJxjVh1zP9khzszw0xeI0kTt/LdHle1uqkE7rrXf2v2v2gBG/8XW3sJtT7PJ4q
	f2jzjHmmP45vD5CwFEQXcpeWdrQGa3WbGAWdw7wZwnh7mPQHyPccpbXB4Wl9+bY5qtg5
	kHXxdVJ4NvBlSvocIozMX/jD7Mw9CV7Bq1VdC9zyg/L4nX9Fj+fJ647dnaFkI2pzHJik
	c5OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=uDog6/4CowFknjmazxHiRFfks6BIbhZHJFvVpc6BRS0=;
	b=ahEhF3etJcxi0qpTLOl4EwRXraFLDXU0A6+XT9WZGDYMvL6I55H3iXcHMyoQT4agTi
	iDHTcncR8r5hOVHg6DpGg1oPdIa3TRiQM15ZvKtiHUMrAMmfedzeU/fvw/uflWGNQ3GV
	f6g2JdEEXpIHfpuVJrNLrEVinu0nnHyXI2H4e9zOxaXQsFM4MSpnqAgqywwl+v2m1O6F
	zbSbsNzQTuz1/TyJSr4Xsxrt5WAs1Vwt4Axsd0shmvbQGVkcJ9lfl0hJgJYnCVUuxAnR
	o5zV4Gg7CMhVxPvtFEN7fkGowOE3CcJBRC6sBq2FY4J2pbg95/YZiXnNa1THI2QnkWLb
	2NfA==
X-Gm-Message-State: AEkoouv47yo51wPZXZFi8xHpSWNywKjdPx0KBrwrTeHsJOIOvtfp4LvpEokOwqnnXfxc9Q==
X-Received: by 10.25.144.75 with SMTP id s72mr1317028lfd.232.1470910255399;
	Thu, 11 Aug 2016 03:10:55 -0700 (PDT)
Received: from neopili.qtec.com
	(cpe.xe-3-0-1-778.vbrnqe10.dk.customer.tdc.net. [80.197.57.18])
	by smtp.gmail.com with ESMTPSA id a15sm437793lfb.34.2016.08.11.03.10.54
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 11 Aug 2016 03:10:54 -0700 (PDT)
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 11 Aug 2016 12:10:45 +0200
Message-Id: <1470910246-952-1-git-send-email-ricardo.ribalda@gmail.com>
X-Mailer: git-send-email 2.8.1
Subject: [meta-oe][PATCH 1/2] gflags: New recipe
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
X-List-Received-Date: Thu, 11 Aug 2016 10:10:56 -0000

C++ library that implements commandline flags processing. It includes
built-in support for standard types such as string and the ability to
define flags in the source file in which they are used.

Used optionally by glog

Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
---
 meta-oe/recipes-support/gflags/gflags_2.1.2.bb | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)
 create mode 100644 meta-oe/recipes-support/gflags/gflags_2.1.2.bb

diff --git a/meta-oe/recipes-support/gflags/gflags_2.1.2.bb b/meta-oe/recipes-support/gflags/gflags_2.1.2.bb
new file mode 100644
index 000000000000..ac8d2ceeaa8a
--- /dev/null
+++ b/meta-oe/recipes-support/gflags/gflags_2.1.2.bb
@@ -0,0 +1,18 @@
+DESCRIPTION = "The gflags package contains a C++ library that implements commandline flags processing. It includes built-in support for standard types such as string and the ability to define flags in the source file in which they are used"
+
+HOMEPAGE = "https://github.com/gflags/gflags"
+
+RDEPENDS_${PN} += "bash"
+
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://COPYING.txt;md5=c80d1a3b623f72bb85a4c75b556551df"
+
+SRC_URI = "git://github.com/gflags/gflags.git;;nobranch=1"
+SRCREV = "1a02f2851ee3d48d32d2c8f4d8f390a0bc25565c"
+S = "${WORKDIR}/git/"
+
+FILES_${PN}-dev += "${libdir}/cmake"
+
+inherit cmake
+
+EXTRA_OECMAKE="-DBUILD_SHARED_LIBS=ON"
-- 
2.8.1


