Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com [209.85.128.67])
 by mx.groups.io with SMTP id smtpd.web10.8012.1586522102443151749
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 10 Apr 2020 05:35:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bgdev-pl.20150623.gappssmtp.com header.s=20150623 header.b=DFg9+BZh;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.128.67, mailfrom: brgl@bgdev.pl)
Received: by mail-wm1-f67.google.com with SMTP id a201so2225237wme.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 10 Apr 2020 05:35:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=neklr1aIXeaxLlUJj5oTvLteJ3RjDluZheyPmkF78QQ=;
        b=DFg9+BZhJOlHL2OpdAYRxiDOoDwdO+mrjMvAZfjM+vbrTcBsxLLoQeLZ/nsTqFiMUG
         sGErRLdSuGStW+YB6uuWJGJ1QMlR4YPuSRLCj5n7662Um0R3FjHlJSjNdtDbufBszALw
         7/f6ddmrbwHnnyiayNEad9Z6h9yJjyUqTJJSTkimtsJHBmQzBUGIPtNh/yvIwzDpHtCY
         Qs2CQkhu1vSIpVMfsjkYpMjcF5WoAU51ikNLWRj4ZoIOtTfcTY2tvCCqpzKbj8MYXO7s
         JRyfaXDosSBYu9VMttlxSUFqKTN2jQOUweUxh/Z04uFEdmMn/1K+ALrfwRZRDYI3NF/p
         en9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=neklr1aIXeaxLlUJj5oTvLteJ3RjDluZheyPmkF78QQ=;
        b=ZEy25pExvckMZaIUfpkfbCgHOTOFxIQr8CzcJXApyQqnffH9uyxOpCbJSkSp5HP7wY
         YpKA3y7X+6VSoKwe+PIYfOofsYBAudVqwsiu8TwGszVIlmexirHeuKaeCpWBKnee6+N6
         pIHZ9PEcfJVjz4wB8PFwoc1klVAqSjked+89dv7VaGZyjBKZXf+vzTFuAy0FayebgiFJ
         zFEtcoW8Tt0BkJsrn9/JEBizUAG3+Kp5MpY/eo8n5wvbgRMPCWbsgMe86NW33i+wsNTr
         ZrpaLm8y4bIJyhAyZLWySCCgYaBF7JaL+hCg7a/eQHeguLS3iQ0fIyUC3pZoXTJRrJJ7
         37pg==
X-Gm-Message-State: AGi0PuaJ8SJeg7pLgNZOEi6rp3xQOXLkC9LpxoyugCjW5JTsw3UM3VXN
	Lv80XXFmsYhe7XENsSsAPdsW/g==
X-Google-Smtp-Source: APiQypIj6GoezeinPIcb6c8O79wLKLKxcXK9LwEDlKLNvyum9HgqxxaO1QS4pNLmZep3qS2ChUbLxw==
X-Received: by 2002:a7b:c247:: with SMTP id b7mr4985001wmj.35.1586522101026;
        Fri, 10 Apr 2020 05:35:01 -0700 (PDT)
Return-Path: <brgl@bgdev.pl>
Received: from localhost.localdomain (lfbn-nic-1-65-232.w2-15.abo.wanadoo.fr. [2.15.156.232])
        by smtp.gmail.com with ESMTPSA id d7sm2685062wrr.77.2020.04.10.05.35.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2020 05:35:00 -0700 (PDT)
From: "Bartosz Golaszewski" <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Armin Kuster <akuster808@gmail.com>,
	Jerome Neanne <jneanne@baylibre.com>,
	Quentin Schulz <quentin.schulz@streamunlimited.com>
Cc: openembedded-devel@lists.openembedded.org,
	yocto@lists.yoctoproject.org,
	Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [OE-core][PATCH v2 1/2] classes: provide a class for generating dm-verity meta-data images
Date: Fri, 10 Apr 2020 14:34:48 +0200
Message-Id: <20200410123449.9624-2-brgl@bgdev.pl>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200410123449.9624-1-brgl@bgdev.pl>
References: <20200410123449.9624-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

This adds a class that allows to generate conversions of ext[234] and
btrfs partitions images with dm-verity hash data appended at the end as
well as a corresponding .env file containing the root hash and data
offset that can be stored in a secure location (e.g. signed fitImage)
or signed and verified at run-time on its own.

The class depends on two variables:
  DM_VERITY_IMAGE:      defines the name of the main image (normally the
                        one that is used with the bitbake command to
                        build the main image)
  DM_VERITY_IMAGE_TYPE: defines exactly one type for which to generate
                        the protected image.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 classes/dm-verity-img.bbclass | 88 +++++++++++++++++++++++++++++++++++
 1 file changed, 88 insertions(+)
 create mode 100644 classes/dm-verity-img.bbclass

diff --git a/classes/dm-verity-img.bbclass b/classes/dm-verity-img.bbclass
new file mode 100644
index 0000000..1c0e29b
--- /dev/null
+++ b/classes/dm-verity-img.bbclass
@@ -0,0 +1,88 @@
+# SPDX-License-Identifier: MIT
+#
+# Copyright (C) 2020 BayLibre SAS
+# Author: Bartosz Golaszewski <bgolaszewski@baylibre.com>
+#
+# This bbclass allows creating of dm-verity protected partition images. It
+# generates a device image file with dm-verity hash data appended at the end
+# plus the corresponding .env file containing additional information needed
+# to mount the image such as the root hash in the form of ell variables. To
+# assure data integrity, the root hash must be stored in a trusted location
+# or cryptographically signed and verified.
+#
+# Usage:
+#     DM_VERITY_IMAGE = "core-image-full-cmdline" # or other image
+#     DM_VERITY_IMAGE_TYPE = "ext4" # or ext2, ext3 & btrfs
+#     IMAGE_CLASSES += "dm-verity-img"
+#
+# The resulting image can then be used to implement the device mapper block
+# integrity checking on the target device.
+
+# Process the output from veritysetup and generate the corresponding .env
+# file. The output from veritysetup is not very machine-friendly so we need to
+# convert it to some better format. Let's drop the first line (doesn't contain
+# any useful info) and feed the rest to a script.
+process_verity() {
+    local ENV="$OUTPUT.env"
+
+    # Each line contains a key and a value string delimited by ':'. Read the
+    # two parts into separate variables and process them separately. For the
+    # key part: convert the names to upper case and replace spaces with
+    # underscores to create correct shell variable names. For the value part:
+    # just trim all white-spaces.
+    IFS=":"
+    while read KEY VAL; do
+        echo -ne "$KEY" | tr '[:lower:]' '[:upper:]' | sed 's/ /_/g' >> $ENV
+        echo -ne "=" >> $ENV
+        echo "$VAL" | tr -d " \t" >> $ENV
+    done
+
+    # Add partition size
+    echo "DATA_SIZE=$SIZE" >> $ENV
+
+    ln -sf $ENV ${IMAGE_BASENAME}-${MACHINE}.$TYPE.verity.env
+}
+
+verity_setup() {
+    local TYPE=$1
+    local INPUT=${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.$TYPE
+    local SIZE=$(stat --printf="%s" $INPUT)
+    local OUTPUT=$INPUT.verity
+
+    cp -a $INPUT $OUTPUT
+
+    # Let's drop the first line of output (doesn't contain any useful info)
+    # and feed the rest to another function.
+    veritysetup --data-block-size=1024 --hash-offset=$SIZE format $OUTPUT $OUTPUT | tail -n +2 | process_verity
+}
+
+VERITY_TYPES = "ext2.verity ext3.verity ext4.verity btrfs.verity"
+IMAGE_TYPES += "${VERITY_TYPES}"
+CONVERSIONTYPES += "verity"
+CONVERSION_CMD_verity = "verity_setup ${type}"
+CONVERSION_DEPENDS_verity = "cryptsetup-native"
+
+python __anonymous() {
+    verity_image = d.getVar('DM_VERITY_IMAGE')
+    verity_type = d.getVar('DM_VERITY_IMAGE_TYPE')
+    image_fstypes = d.getVar('IMAGE_FSTYPES')
+    pn = d.getVar('PN')
+
+    if verity_image != pn:
+        return # This doesn't concern this image
+
+    if not verity_image or not verity_type:
+        bb.warn('dm-verity-img class inherited but not used')
+        return
+
+    if len(verity_type.split()) is not 1:
+        bb.fatal('DM_VERITY_IMAGE_TYPE must contain exactly one type')
+
+    d.appendVar('IMAGE_FSTYPES', ' %s.verity' % verity_type)
+
+    # If we're using wic: we'll have to use partition images and not the rootfs
+    # source plugin so add the appropriate dependency.
+    if 'wic' in image_fstypes:
+        dep = ' %s:do_image_%s' % (pn, verity_type)
+        d.appendVarFlag('do_image_wic', 'depends', dep)
+}
-- 
2.25.0

