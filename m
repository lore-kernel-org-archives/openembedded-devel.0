Return-Path: <andreas.zdziarstek@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19525CD98C5
	for <webhook@archiver.kernel.org>; Sun, 14 Jun 2026 20:05:43 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.115887.1781467535583214185
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 14 Jun 2026 13:05:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=bf1cF6jq;
 spf=pass (domain: gmail.com, ip: 209.85.128.51, mailfrom: andreas.zdziarstek@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4908b92904fso31892845e9.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 14 Jun 2026 13:05:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781467534; x=1782072334; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/h9dPi2BqZuuVH+srwcVFbecMpZPNpYCWnHGQdUKN1U=;
        b=bf1cF6jqfSu075Bk0Z5UVlBAmZM1o/fU5ztnKzBxD8BsQomOnWEK9HDlSMMtqOCeDy
         37Bx6cqN6agRZA0LP44RpUEpUGD3vMQbUMy2j39VXgE4Ect0ZWc6O2vWQg1E0gAv6694
         FvLG2wV6c7oh1GD6476FMj/Mwpu8k6bJDkFo3ONnHBDozTYs/23EI58ggb4BOKCundzP
         RmGB4FURuutMZJDfI0qRIVD6rUJ2CL4nf4clXlUkXm2MUT+xLVJTDTaYzdfBUgM8VJPg
         s5DMxHgUU+igjV9tiYywI99CkeuDuUuajCBSKs02v0+Fde1ITWdNrpcyEcuf1SBCJiPd
         D7OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781467534; x=1782072334;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/h9dPi2BqZuuVH+srwcVFbecMpZPNpYCWnHGQdUKN1U=;
        b=GZzZFJNc3gEvjCq+yrfocKTnD/cor/A7zeKxQ8UF4meRnh3Vk5WK6zpChU9nYt/EbV
         Q6OR2eBXMVhN4jWQtAbqjnsldg3S+OlwV7WUa8IS6woTevAAUFduAkzbi9m2/hFJJScQ
         43e/Rgpa5TPSVaRa/aUP6Eyhfxc1fCS/ccQnGkcJuJlC1F4dPUETf0TNXwNA3RXz1nZQ
         tq2zHrJb6kvwQbOLoz/QZvwUSMAWPCPvIx+/kO91amBb8XkFi60WHOis8Ilr2ggvTMxJ
         Z8ZqQMgcPUvsyE6fJ2qLw2Fsc8yKFWBzr596DAJaahddELcuavT6YYiwdUiWTymQxYSW
         9QJg==
X-Gm-Message-State: AOJu0YxCGVpRCIZxT+R2Hbr5RmQ+TqIXFvbG33wxziB8C5MEOkjsfowN
	GqdBhuYm5NtxxKRbhQTO64XrAnAhy70T3wm8ajlKOP1zon/I5+AARNzrFk7yiIEF
X-Gm-Gg: Acq92OGrVjhQiUNGz9oXKiiqe5ql4/TWaCXzWnrGJhIdNtqByWqxztuR1XyXJQ60Myk
	kTOzoXSZbYM8whttvKb83yzoYZ8t782pPl+BuvSmnaUXMiC59jp0WoITruqy74/KXXdWUj0oI5U
	x4sTMAmUSKybSAlswEOE5iIfy6kE6NJKxfet3bLknVQ11671SrDmgvk2uubZNY75QluDq6EKDFM
	KobIbZG/IY7p5izjCSRDfzxCVlWNl+ssGxz538Ooi4WOtjuokATy0A2zt14j4dRHJ1twcxMmUDz
	ZT3zm/1RnMRUpn19GC9iCxoaT9b5nZvc8ygcu3J3MCBFgbxQ/ABMt/sm0r9wLcCDfLgcqjK58yj
	Rb+JREf3NumWXmn4l1UYfVc0QxxhF60HvAo9pikd4vVuX2NFbv/1f0+5xr6voGk5uFXlsv4+Bbp
	VmExmLAFfq/8xUcSURi9v8CZln/7RlriYI0FDBg1f3N3yZLk+Nnv6ziAp9SSw5cdtmSfs4C94=
X-Received: by 2002:a05:600c:8b86:b0:491:91cc:d12d with SMTP id 5b1f17b1804b1-49191ccd322mr123450085e9.25.1781467533477;
        Sun, 14 Jun 2026 13:05:33 -0700 (PDT)
Received: from turbine.fritz.box (p5784210f.dip0.t-ipconnect.de. [87.132.33.15])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-492203d05d1sm254411535e9.12.2026.06.14.13.05.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jun 2026 13:05:32 -0700 (PDT)
From: Andreas Zdziarstek <andreas.zdziarstek@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Erik Schumacher <erik.schumacher@iris-sensing.com>,
	Khem Raj <raj.khem@gmail.com>,
	Jan Luebbe <jlu@pengutronix.de>,
	Bastian Krause <bst@pengutronix.de>,
	Andreas Zdziarstek <andreas.zdziarstek@gmail.com>
Subject: [meta-oe][PATCH] image_types_verity.bbclass: add FEC support
Date: Sun, 14 Jun 2026 22:05:24 +0200
Message-ID: <20260614200524.195495-1-andreas.zdziarstek@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 14 Jun 2026 20:05:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127578

dm-verity can use Reed-Solomon forward error correction (FEC) data
to transparently recover a limited number of corrupted blocks instead
of only detecting them. This can be useful for mitigating error-prone
storage.

We generate this FEC data as an option, controlled by VERITY_FEC
(default off, same behavior as before) and VERITY_FEC_ROOTS (number of
Reed-Solomon roots, default 2). The FEC data is appended to the hash
tree by default. If VERITY_IMAGE_FECDEV_SUFFIX is set, a separate file
with the given suffix will be used.

When enabled, the parameter file gains additional variables necessary
for correct DM table generation.

Recipes that do not set VERITY_FEC = "1" behave the same as before.

Signed-off-by: Andreas Zdziarstek <andreas.zdziarstek@gmail.com>
---

While testing this across the possible device layouts, I noticed that
the class uses --no-superblock when there is no separate hash device
(the default case). But the option is dropped and the superblock
created if VERITY_IMAGE_HASHDEV_SUFFIX is set. As the HASHDEV addition
was a separate patch, I wondered if this was intentional?
As an idea: It would also be possible to make it fully configurable
via a VERITY_SUPERBLOCK setting.
 meta-oe/classes/image_types_verity.bbclass | 95 ++++++++++++++++++++++
 1 file changed, 95 insertions(+)

diff --git a/meta-oe/classes/image_types_verity.bbclass b/meta-oe/classes/image_types_verity.bbclass
index 24462277af..efe94a2987 100644
--- a/meta-oe/classes/image_types_verity.bbclass
+++ b/meta-oe/classes/image_types_verity.bbclass
@@ -36,6 +36,60 @@
 #   dd if=/dev/random bs=1k count=1 | sha256sum
 #
 # and assign it to the parameter VERITY_SALT.
+#
+# Forward Error Correction (FEC) can optionally be generated by setting
+# VERITY_FEC to "1". dm-verity then transparently recovers a limited number of
+# corrupted blocks instead of only detecting them.
+#
+# The number of Reed-Solomon roots is set via VERITY_FEC_ROOTS (default 2, max
+# 24). Higher number of roots means higher error resilience but also more
+# overhead in terms of space.
+#
+# The FEC data is either appended after the hash tree or put in its own file,
+# using VERITY_IMAGE_FECDEV_SUFFIX.
+#
+# When FEC is enabled, additional values are appended to the parameter file:
+#
+#   VERITY_FEC_RS_ROOTS - number of Reed-Solomon roots
+#   VERITY_FEC_BLOCKS   - number of parity blocks generated on the FEC device.
+#                         This is the FEC overhead and is NOT the kernel table's
+#                         "fec_blocks" argument (see the example below).
+#   VERITY_FEC_START    - offset (in VERITY_DATA_BLOCK_SIZE blocks) of the FEC
+#                         data on the FEC device.
+#
+# extending the dmsetup example above (with <fec_dev> as the FEC blockdevice) to
+#
+#   . <IMAGE_LINK_NAME>.verity-params
+#   dmsetup create <dm_dev_name> --readonly --table "0 $VERITY_DATA_SECTORS \
+#       verity 1 <dev> <hash_dev> \
+#       $VERITY_DATA_BLOCK_SIZE  $VERITY_HASH_BLOCK_SIZE \
+#       $VERITY_DATA_BLOCKS  $VERITY_DATA_BLOCKS \
+#       $VERITY_HASH_ALGORITHM  $VERITY_ROOT_HASH  $VERITY_SALT \
+#       9 ignore_zero_blocks use_fec_from_device <fec_dev> \
+#       fec_roots $VERITY_FEC_RS_ROOTS \
+#       fec_blocks $((VERITY_DATA_BLOCKS + VERITY_HASH_BLOCKS)) \
+#       fec_start $VERITY_FEC_START"
+#
+# Note that the kernel's "fec_blocks" is the number of blocks covered by FEC,
+# i.e. the data and hash blocks together (VERITY_DATA_BLOCKS +
+# VERITY_HASH_BLOCKS), and differs from VERITY_FEC_BLOCKS, which counts the
+# generated parity blocks.
+#
+# The same device as above can be configured with veritysetup, using
+#
+#   . <IMAGE_LINK_NAME>.verity-params
+#   veritysetup open --no-superblock <dev> <dm_dev_name> <dev> $VERITY_ROOT_HASH \
+#       --data-block-size=$VERITY_DATA_BLOCK_SIZE \
+#       --hash-block-size=$VERITY_HASH_BLOCK_SIZE \
+#       --data-blocks=$VERITY_DATA_BLOCKS \
+#       --hash-offset=$((VERITY_DATA_BLOCKS * VERITY_DATA_BLOCK_SIZE)) \
+#       --salt=$VERITY_SALT \
+#       --fec-device=<dev> \
+#       --fec-offset=$((VERITY_FEC_START * VERITY_DATA_BLOCK_SIZE)) \
+#       --fec-roots=$VERITY_FEC_RS_ROOTS
+#
+# NOTE: To be able to use dm-verity with FEC, your kernel must have
+#       CONFIG_DM_VERITY_FEC enabled.
 
 inherit image-artifact-names
 
@@ -48,6 +102,9 @@ VERITY_IMAGE_FSTYPE ?= "ext4"
 VERITY_IMAGE_SUFFIX ?= ".verity"
 VERITY_IMAGE_HASHDEV_SUFFIX ?= "${VERITY_IMAGE_SUFFIX}"
 VERITY_INPUT_IMAGE ?= "${IMGDEPLOYDIR}/${IMAGE_LINK_NAME}.${VERITY_IMAGE_FSTYPE}"
+VERITY_FEC ?= ""
+VERITY_FEC_ROOTS ?= "2"
+VERITY_IMAGE_FECDEV_SUFFIX ?= "${VERITY_IMAGE_HASHDEV_SUFFIX}"
 
 IMAGE_TYPEDEP:verity = "${VERITY_IMAGE_FSTYPE}"
 IMAGE_TYPES_MASKED += "verity"
@@ -75,6 +132,10 @@ python do_image_verity () {
     verity_image_hashdev_suffix = d.getVar('VERITY_IMAGE_HASHDEV_SUFFIX')
     verity_hashdev = '{}{}'.format(image, verity_image_hashdev_suffix)
 
+    fec = bb.utils.to_boolean(d.getVar('VERITY_FEC'))
+    verity_image_fecdev_suffix = d.getVar('VERITY_IMAGE_FECDEV_SUFFIX')
+    verity_fecdev = '{}{}'.format(image, verity_image_fecdev_suffix)
+
     # For better readability the parameter VERITY_BLOCK_SIZE is specified in
     # bytes. It must be a multiple of the logical sector size which is 512 bytes
     # in Linux. Make sure that this is the case as otherwise the resulting
@@ -87,6 +148,11 @@ python do_image_verity () {
     if salt == d.getVar('CLASS_VERITY_SALT'):
         bb.warn("Please overwrite VERITY_SALT with an image specific one!")
 
+    if fec:
+        fec_roots = int(d.getVar('VERITY_FEC_ROOTS'))
+        if not 2 <= fec_roots <= 24:
+            bb.fatal("VERITY_FEC_ROOTS must be between 2 and 24 (got %d)!" % fec_roots)
+
     shutil.copyfile(image, verity)
 
     data_size_blocks, data_size_rest = divmod(os.stat(verity).st_size, block_size)
@@ -125,6 +191,26 @@ python do_image_verity () {
                 verityfile.seek(0, io.SEEK_END)
                 verityfile.write(b'\x00' * (block_size - data_size_rest))
 
+    # Optionally generate Reed-Solomon FEC data. If the FEC data shares a file
+    # with the hash tree, it must start past it. Do a first veritysetup pass to
+    # get the size of the hash tree and calculate the offset. With a dedicated
+    # FEC file the FEC data starts at offset 0 and a single pass suffices.
+    fec_offset = 0
+    if fec:
+        if verity_fecdev == verity_hashdev:
+            try:
+                subprocess.check_output(veritysetup_command)
+            except subprocess.CalledProcessError as err:
+                bb.fatal('%s returned with %s (%s)' % (err.cmd, err.returncode, err.output))
+            fec_offset = os.stat(verity_hashdev).st_size
+            if fec_offset % block_size != 0:
+                bb.fatal("hash tree end (%d) is not a multiple of the block size" % fec_offset)
+            veritysetup_command.append('--fec-offset={}'.format(fec_offset))
+        veritysetup_command += [
+            '--fec-device={}'.format(verity_fecdev),
+            '--fec-roots={}'.format(fec_roots),
+        ]
+
     # Create verity image
     try:
         output = subprocess.check_output(veritysetup_command)
@@ -151,6 +237,13 @@ python do_image_verity () {
 
     params.append('VERITY_DATA_SECTORS={}'.format(data_size//512))
 
+    if fec:
+        # Where the FEC data starts on its device, in blocks. It's not part
+        # of veritysetup's output, so emit it for `dmsetup create ...`.
+        # A byte offset, if needed (e.g. for `veritysetup open ...`), is
+        # VERITY_FEC_START * VERITY_DATA_BLOCK_SIZE.
+        params.append('VERITY_FEC_START={}'.format(fec_offset//block_size))
+
     try:
         with open(image + '.verity-params', 'w') as f:
             f.write('\n'.join(params))
@@ -161,6 +254,8 @@ python do_image_verity () {
     suffix_list = [ verity_image_suffix, '.verity-info', '.verity-params' ]
     if verity != verity_hashdev:
         suffix_list.append(verity_image_hashdev_suffix)
+    if fec and verity_fecdev not in (verity, verity_hashdev):
+        suffix_list.append(verity_image_fecdev_suffix)
 
     for suffix in suffix_list:
         try:
-- 
2.53.0


