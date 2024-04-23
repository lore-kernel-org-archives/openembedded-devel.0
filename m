Return-Path: <u.oelmann@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0B32C4345F
	for <webhook@archiver.kernel.org>; Tue, 23 Apr 2024 10:21:11 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by mx.groups.io with SMTP id smtpd.web11.15121.1713867668736206440
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 23 Apr 2024 03:21:09 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: pengutronix.de, ip: 185.203.201.7, mailfrom: uol@pengutronix.de)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <uol@pengutronix.de>)
	id 1rzDGs-00059Q-Tr; Tue, 23 Apr 2024 12:21:06 +0200
Received: from [2a0a:edc0:0:1101:1d::39] (helo=dude03.red.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <uol@pengutronix.de>)
	id 1rzDGr-00DsQu-VQ; Tue, 23 Apr 2024 12:21:05 +0200
Received: from uol by dude03.red.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <uol@pengutronix.de>)
	id 1rzDGr-00857m-2g;
	Tue, 23 Apr 2024 12:21:05 +0200
From: =?UTF-8?q?Ulrich=20=C3=96lmann?= <u.oelmann@pengutronix.de>
To: openembedded-devel@lists.openembedded.org
Cc: yocto@pengutronix.de,
	Jan Luebbe <jlu@pengutronix.de>,
	Rouven Czerwinski <r.czerwinski@pengutronix.de>,
	Marco Felsch <m.felsch@pengutronix.de>,
	=?UTF-8?q?Ulrich=20=C3=96lmann?= <u.oelmann@pengutronix.de>
Subject: [meta-oe][PATCH] Add class for appending dm-verity hash data to block device images
Date: Tue, 23 Apr 2024 12:21:02 +0200
Message-Id: <20240423102102.1926313-1-u.oelmann@pengutronix.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: uol@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: openembedded-devel@lists.openembedded.org
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 23 Apr 2024 10:21:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110116

From: Jan Luebbe <jlu@pengutronix.de>

Add support to generate a dm-verity image and the parameters required to
assemble the corresponding table for the device-mapper driver. The latter will
be stored in the file ${DEPLOY_DIR_IMAGE}/<IMAGE_LINK_NAME>.verity-params.
Note that in the resulting image the hash tree data is appended to the contents
of the original image without an explicit superblock to keep things simple and
compact.

The above mentioned parameter file can be sourced by a shell to finally create
the desired blockdevice via "dmsetup" (found in meta-oe's recipe
"libdevmapper"), e.g.

  . <IMAGE_LINK_NAME>.verity-params
  dmsetup create <dm_dev_name> --readonly --table "0 $VERITY_DATA_SECTORS verity \
      1 <dev> <hash_dev> \
      $VERITY_DATA_BLOCK_SIZE  $VERITY_HASH_BLOCK_SIZE \
      $VERITY_DATA_BLOCKS  $VERITY_DATA_BLOCKS \
      $VERITY_HASH_ALGORITHM  $VERITY_ROOT_HASH  $VERITY_SALT \
      1 ignore_zero_blocks"

As the hash tree data is found at the end of the image, <dev> and <hash_dev>
should be the same blockdevice in the command shown above while <dm_dev_name> is
the name of the to be created dm-verity-device.

The root hash is calculated using a salt to make attacks more difficult. Thus,
please grant each image recipe its own salt which could be generated e.g. via

  dd if=/dev/random bs=1k count=1 | sha256sum

and assign it to the parameter VERITY_SALT.

Signed-off-by: Jan Luebbe <jlu@pengutronix.de>
Signed-off-by: Rouven Czerwinski <r.czerwinski@pengutronix.de>
Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
Signed-off-by: Ulrich Ölmann <u.oelmann@pengutronix.de>
---
 meta-oe/classes/image_types_verity.bbclass | 137 +++++++++++++++++++++
 1 file changed, 137 insertions(+)
 create mode 100644 meta-oe/classes/image_types_verity.bbclass

diff --git a/meta-oe/classes/image_types_verity.bbclass b/meta-oe/classes/image_types_verity.bbclass
new file mode 100644
index 000000000000..b42217c453f2
--- /dev/null
+++ b/meta-oe/classes/image_types_verity.bbclass
@@ -0,0 +1,137 @@
+# SPDX-License-Identifier: MIT
+#
+# Copyright Pengutronix <yocto@pengutronix.de>
+#
+
+# Support generating a dm-verity image and the parameters required to assemble
+# the corresponding table for the device-mapper driver. The latter will be
+# stored in the file ${DEPLOY_DIR_IMAGE}/<IMAGE_LINK_NAME>.verity-params. Note
+# that in the resulting image the hash tree data is appended to the contents of
+# the original image without an explicit superblock to keep things simple and
+# compact.
+#
+# The above mentioned parameter file can be sourced by a shell to finally create
+# the desired blockdevice via "dmsetup" (found in meta-oe's recipe
+# "libdevmapper"), e.g.
+#
+#   . <IMAGE_LINK_NAME>.verity-params
+#   dmsetup create <dm_dev_name> --readonly --table "0 $VERITY_DATA_SECTORS \
+#       verity 1 <dev> <hash_dev> \
+#       $VERITY_DATA_BLOCK_SIZE  $VERITY_HASH_BLOCK_SIZE \
+#       $VERITY_DATA_BLOCKS  $VERITY_DATA_BLOCKS \
+#       $VERITY_HASH_ALGORITHM  $VERITY_ROOT_HASH  $VERITY_SALT \
+#       1 ignore_zero_blocks"
+#
+# As the hash tree data is found at the end of the image, <dev> and <hash_dev>
+# should be the same blockdevice in the command shown above while <dm_dev_name>
+# is the name of the to be created dm-verity-device.
+#
+# The root hash is calculated using a salt to make attacks more difficult. Thus,
+# please grant each image recipe its own salt which could be generated e.g. via
+#
+#   dd if=/dev/random bs=1k count=1 | sha256sum
+#
+# and assign it to the parameter VERITY_SALT.
+
+inherit image-artifact-names
+
+do_image_verity[depends] += "cryptsetup-native:do_populate_sysroot"
+
+CLASS_VERITY_SALT = "4e5f0d9b6ccac5e843598d4e4545046232b48451a399acb2106822b43679b375"
+VERITY_SALT ?= "${CLASS_VERITY_SALT}"
+VERITY_BLOCK_SIZE ?= "4096"
+VERITY_IMAGE_FSTYPE ?= "ext4"
+VERITY_IMAGE_SUFFIX ?= ".verity"
+VERITY_INPUT_IMAGE ?= "${IMGDEPLOYDIR}/${IMAGE_LINK_NAME}.${VERITY_IMAGE_FSTYPE}"
+
+IMAGE_TYPEDEP:verity = "${VERITY_IMAGE_FSTYPE}"
+IMAGE_TYPES_MASKED += "verity"
+
+python __anonymous() {
+    if 'verity' not in d.getVar('IMAGE_FSTYPES'):
+        return
+
+    dep_task = 'do_image_{}'.format(d.getVar('VERITY_IMAGE_FSTYPE').replace('-', '_'))
+    bb.build.addtask('do_image_verity', 'do_image_complete', dep_task, d)
+}
+
+python do_image_verity () {
+    import os
+    import subprocess
+    import shutil
+
+    link = d.getVar('VERITY_INPUT_IMAGE')
+    image = os.path.realpath(link)
+
+    verity_image_suffix = d.getVar('VERITY_IMAGE_SUFFIX')
+    verity = '{}{}'.format(image, verity_image_suffix)
+
+    # For better readability the parameter VERITY_BLOCK_SIZE is specified in
+    # bytes. It must be a multiple of the logical sector size which is 512 bytes
+    # in Linux. Make sure that this is the case as otherwise the resulting
+    # issues would be hard to debug later.
+    block_size = int(d.getVar('VERITY_BLOCK_SIZE'))
+    if block_size % 512 != 0:
+        bb.fatal("VERITY_BLOCK_SIZE must be a multiple of 512!")
+
+    salt = d.getVar('VERITY_SALT')
+    if salt == d.getVar('CLASS_VERITY_SALT'):
+        bb.warn("Please overwrite VERITY_SALT with an image specific one!")
+
+    shutil.copyfile(image, verity)
+
+    data_size_blocks, data_size_rest = divmod(os.stat(verity).st_size, block_size)
+    data_blocks = data_size_blocks + (1 if data_size_rest else 0)
+    data_size = data_blocks * block_size
+
+    bb.debug(1, f"data_size_blocks: {data_size_blocks}, {data_size_rest}")
+    bb.debug(1, f"data_size: {data_size}")
+
+    # Create verity image
+    try:
+        output = subprocess.check_output([
+            'veritysetup', 'format',
+            '--no-superblock',
+            '--salt={}'.format(salt),
+            '--data-blocks={}'.format(data_blocks),
+            '--data-block-size={}'.format(block_size),
+            '--hash-block-size={}'.format(block_size),
+            '--hash-offset={}'.format(data_size),
+            verity, verity,
+            ])
+    except subprocess.CalledProcessError as err:
+        bb.fatal('%s returned with %s (%s)' % (err.cmd, err.returncode, err.output))
+
+    try:
+        with open(image + '.verity-info', 'wb') as f:
+            f.write(output)
+    except Exception as err:
+        bb.fatal('Unexpected error %s' % err)
+
+    # Create verity params
+    params = []
+    for line in output.decode('ASCII').splitlines():
+        if not ':' in line:
+            continue
+        k, v = line.split(':', 1)
+        k = k.strip().upper().replace(' ', '_')
+        v = v.strip()
+        bb.debug(1, f"{k} {v}")
+        params.append('VERITY_{}={}'.format(k, v))
+
+    params.append('VERITY_DATA_SECTORS={}'.format(data_size//512))
+
+    try:
+        with open(image + '.verity-params', 'w') as f:
+            f.write('\n'.join(params))
+    except Exception as err:
+        bb.fatal('Unexpected error %s' % err)
+
+    # Create symlinks
+    for suffix in [ verity_image_suffix, '.verity-info', '.verity-params' ]:
+        try:
+            os.remove(link + suffix)
+        except FileNotFoundError:
+            pass
+        os.symlink(os.path.basename(image) + suffix, link + suffix)
+}
-- 
2.39.2


