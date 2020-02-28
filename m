Return-Path: <brgl@bgdev.pl>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id 271D160B1C
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Feb 2020 15:04:01 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id f15so3508713wml.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Feb 2020 07:04:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=bd2tueSiuDQouj+dva53PZ7U95u0TAj2S5wXBOKflVs=;
	b=RQjEmWteFIMr4cvX4N2tHzvBd3JOZS9sbpjfBQXOc9nJKXyOizMH4oZKxFbEdDxK+r
	oFxb3NZJATgo1CPiPCPv8QMTE/Slor6NLvdVFQmn2SLagnZ4lAa6FwJbgYSz7fnzAwVd
	0NmaA8yLsdM3NVSGzHLbQRyF8Sf9ffolcOQVPqxFR0woi/0lzaBLbJLfpBqI3H2t0Jqv
	/SX3liaIdo7j11zVc+qLSMwQdMLygM+LuJzPJ2ZJ5X7LsOroSffpJbcT5EmN+Oq2K3pS
	mw3meEzT30MvkyTkKVEnrn+zahjFYuSq4E8ySxpzwvKAdypEdypapNz0k4eVFnN50Phg
	mkzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=bd2tueSiuDQouj+dva53PZ7U95u0TAj2S5wXBOKflVs=;
	b=sdAN7kFA4s7vnkBVDl8Br8Db+NHRQRCu//zbQrE4Un7PiXdklzHDoLGrLVYSE47gmv
	dp78qPRS0aXRTZjKWsx0Ghup3QZZmrDBmmlM+o9oRzQuIKRsSq+Abxuppgd6nBYND8vi
	wGWNi2l/FchnBHSSc11e48Lsec8GnspXyz1rFpSatCIq6CQUjuijjLYFeBHATpzoaKEF
	bJ/Kvpg9lPHog4/n1CHQxbQV9OgP8z1WFJi1ECLeCOxwDuEMXEu10aAoZiYn8BRfage+
	9jRzS8k8EEXQoYKcoaPwXFJHaXpRvSXwU9Rw9S/PO/lmS0gbnbV0nCGbYqxiKZGNV4Qw
	0ieg==
X-Gm-Message-State: APjAAAUW2n0wRIyr0F5c4mrICFjE0owiTgMtnDZlZnu8xdfTIDhEHAMw
	fu7zRHajmDlQZ0B3K7fsC/bwjg==
X-Google-Smtp-Source: APXvYqzTkSSYHsKzJci5NxBUEkUyes3Zm0R9+wjH7SzS7W7kgtSUb/DB4LnvroB9qAqHPQTXjp543A==
X-Received: by 2002:a1c:1b86:: with SMTP id b128mr4959155wmb.64.1582902242541; 
	Fri, 28 Feb 2020 07:04:02 -0800 (PST)
Received: from localhost.localdomain (lfbn-nic-1-188-94.w2-15.abo.wanadoo.fr.
	[2.15.37.94]) by smtp.gmail.com with ESMTPSA id
	b16sm2339853wmj.39.2020.02.28.07.04.01
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 28 Feb 2020 07:04:01 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>, Armin Kuster <akuster808@gmail.com>,
	openembedded-devel@lists.openembedded.org
Date: Fri, 28 Feb 2020 16:03:45 +0100
Message-Id: <20200228150345.11829-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [meta-ota][PATCH] meta-ota: add support for binary-delta images in a new layer
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
X-List-Received-Date: Fri, 28 Feb 2020 15:04:02 -0000
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Over-The-Air updates are a crucial part of IoT systems based on linux.
There are several OTA update frameworks available and many offer some
sort of support in yocto (e.g. meta-mender, meta-rauc). There are certain
operations that are common to all of them such as: generating binary
delta patches, system recovery, creating provisioning images etc.

This patch proposes to add a new layer in meta-openembedded dedicated to
OTA. As the first functionality it adds a bbclass for generating binary
delta images using two popular algorithms - vcdiff and rsync.

Such images can then be easily packaged in update artifacts for different
OTA frameworks.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
Hi,

I've noticed that when launching CE products and implementing OTA support
I find myself implementing the same functionalities over again. I recently
started abstracting them and would like to upstream them in meta-openembedded
so that at least a part of that becomes standardized.

This patch proposes to add a new layer to meta-openembedded and I'll gladly
maintain it. If accepted I intend on extending it with more functionalities
such as creating provisioning (factory) images for updatable systems, recovery
system images etc.

 meta-ota/README                       | 27 +++++++++++
 meta-ota/classes/binary-delta.bbclass | 64 +++++++++++++++++++++++++++
 meta-ota/conf/layer.conf              | 17 +++++++
 3 files changed, 108 insertions(+)
 create mode 100644 meta-ota/README
 create mode 100644 meta-ota/classes/binary-delta.bbclass
 create mode 100644 meta-ota/conf/layer.conf

diff --git a/meta-ota/README b/meta-ota/README
new file mode 100644
index 000000000..07a1debdd
--- /dev/null
+++ b/meta-ota/README
@@ -0,0 +1,27 @@
+meta-ota
+========
+
+This layer provides support for creating Over-The-Air update images.
+
+Dependencies
+------------
+
+This layer depends on:
+
+URI: git://github.com/openembedded/oe-core.git
+subdirectory: meta
+branch: master
+revision: HEAD
+
+URI: git://github.com/openembedded/meta-oe.git
+subdirectory: meta-oe
+branch: master
+revision: HEAD
+
+Maintenance
+-----------
+
+Send patches / pull requests to openembedded-devel@lists.openembedded.org
+with '[meta-ota]' in the subject.
+
+Layer maintainer: Bartosz Golaszewski <bgolaszewski@baylibre.com>
diff --git a/meta-ota/classes/binary-delta.bbclass b/meta-ota/classes/binary-delta.bbclass
new file mode 100644
index 000000000..24fb20b1b
--- /dev/null
+++ b/meta-ota/classes/binary-delta.bbclass
@@ -0,0 +1,64 @@
+# SPDX-License-Identifier: MIT
+#
+# Copyright (C) 2020 BayLibre SAS
+# Author: Bartosz Golaszewski <bgolaszewski@baylibre.com>
+#
+# This class provides image conversions which - given a baseline partition
+# image - can generate a binary delta patch. Such patch can be applied on top
+# of a deployed baseline partition to generate an updated image.
+#
+# For now the supported algorithms are rsync and vcdiff (supplied by rdiff and
+# xdelta3 respectively). We also provide several compression methods.
+#
+# We only support binary delta on ext[2-4] and btrfs images as it doesn't make
+# much sense on high-entropy, compressed filesystems.
+
+BINARY_DELTA_BASELINE ?= ""
+
+verify_baseline() {
+    if [ -z ${BINARY_DELTA_BASELINE} ] ; then
+        bbfatal "variable BINARY_DELTA_BASELINE cannot be empty."
+    fi
+
+    if ! [ -f ${BINARY_DELTA_BASELINE} ] ; then
+        bbfatal "${BINARY_DELTA_BASELINE} doesn't exist"
+    fi
+}
+
+gen_rdiff() {
+    local IMAGE=$1
+    local SIGNATURE=$1.sig
+    local PATCH=$1.rdiff
+
+    verify_baseline
+
+    rdiff signature ${BINARY_DELTA_BASELINE} $SIGNATURE
+    rdiff delta $SIGNATURE $IMAGE $PATCH
+    rm $SIGNATURE
+}
+
+gen_vcdiff() {
+    local IMAGE=$1
+    local PATCH=$1.vcdiff
+
+    verify_baseline
+
+    xdelta3 -e -s ${BINARY_DELTA_BASELINE} $IMAGE $PATCH
+}
+
+IMAGE_TYPES += " \
+    ext2.rdiff ext3.rdiff ext4.rdiff btrfs.rdiff \
+    ext2.rdiff.gz ext3.rdiff.gz ext4.rdiff.gz btrfs.rdiff.gz \
+    ext2.rdiff.bz2 ext3.rdiff.bz2 ext4.rdiff.bz2 btrfs.rdiff.bz2 \
+    ext2.rdiff.xz ext3.rdiff.xz ext4.rdiff.xz btrfs.rdiff.xz \
+    ext2.vcdiff ext3.vcdiff ext4.vcdiff brtfs.vcdiff \
+    ext2.vcdiff.gz ext3.vcdiff.gz ext4.vcdiff.gz brtfs.vcdiff.gz \
+    ext2.vcdiff.bz2 ext3.vcdiff.bz2 ext4.vcdiff.bz2 brtfs.vcdiff.bz2 \
+    ext2.vcdiff.xz ext3.vcdiff.xz ext4.vcdiff.xz brtfs.vcdiff.xz \
+"
+
+CONVERSIONTYPES += "rdiff vcdiff"
+CONVERSION_CMD_rdiff = "gen_rdiff ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}"
+CONVERSION_CMD_vcdiff = "gen_vcdiff ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}"
+CONVERSION_DEPENDS_rdiff = "librsync-native"
+CONVERSION_DEPENDS_vcdiff = "xdelta3-native"
diff --git a/meta-ota/conf/layer.conf b/meta-ota/conf/layer.conf
new file mode 100644
index 000000000..05c6b0f96
--- /dev/null
+++ b/meta-ota/conf/layer.conf
@@ -0,0 +1,17 @@
+# Layer configuration for meta-ota layer
+# Copyright (C) 2020 BayLibre SAS
+
+# We have a conf and classes directory, add to BBPATH
+BBPATH .= ":${LAYERDIR}"
+
+BBFILE_COLLECTIONS += "ota"
+BBFILE_PATTERN_ota := "^${LAYERDIR}/"
+BBFILE_PRIORITY_ota = "6"
+
+# This should only be incremented on significant changes that will
+# cause compatibility issues with other layers
+LAYERVERSION_ota = "1"
+
+LAYERDEPENDS_ota = "core openembedded-layer"
+
+LAYERSERIES_COMPAT_ota = "zeus"
-- 
2.19.1


