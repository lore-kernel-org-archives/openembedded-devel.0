Return-Path: <emailaddress.ashish@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A087EC4451C
	for <webhook@archiver.kernel.org>; Tue, 21 Jul 2026 16:27:27 +0000 (UTC)
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.27180.1784651246498924439
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 21 Jul 2026 09:27:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Kls86Ge1;
 spf=pass (domain: gmail.com, ip: 209.85.215.181, mailfrom: emailaddress.ashish@gmail.com)
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-cb5b8572b70so3236065a12.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 21 Jul 2026 09:27:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784651246; x=1785256046; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=09w0HrM0RHjEld+6t9fqh9hphB2KBcm1kui9AmqLbXg=;
        b=Kls86Ge1TgKbFdFKHvRIMeX27kknKJoqWEvQRumPzpFqTHc0r6u7K9zH4ig0xvYu7a
         REXfQ9iQn8dOqn412WoW7MTt16/a/sOXFi4MxIZBFOT5w4543nVbYgovDrlTftToLlko
         b8dl84uM8uYhi5cRCWggiaHqX01835t/0AbETzQRkMz6rV1dfWJZTCnRZlvilZKfaN8j
         u4LIGZ/ahLcnT7K+/06KiB7s7I+80MhnORrk4GN5NL49twWrSY9aAOpOmgRCe9iqD+iK
         jyXCepOozIdYbvWOTUGwPGeh9OGUB/RAQFHxXIQGSOzeQOFAiZKFtNlu030E8hMTyYMs
         pyzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784651246; x=1785256046;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=09w0HrM0RHjEld+6t9fqh9hphB2KBcm1kui9AmqLbXg=;
        b=OG3FzJk9qGW71CbwlFo9K66zGkT7/kdxlxKY3E4XYsdQ4sz5jIvYZPPiZdd6A5njj1
         KVD3ro9zhawBnJJksdZlpXt3Qgh/HwJGx321euq/3mA7yNGrJzKCo4/QtuREBhycPv1E
         mdUCmp6n1vI6bYgm6DB2Dmv2f34e8MWzcVD6KDGeqRJBPEozbR1ddq5/3dy4IGOc0BQd
         GcbJQ/CD8w/jLjUZYSBOJtok11e4CkYMPd7Df46AwBpFMgn73snXgU6wP26I+DWQ2/wH
         QjbCQem4W0pw9XT6n0lH3zsGA8bRkH96yT/V1xhqQJ/JbdDviM87s1wVne3Aew68lEg5
         pEig==
X-Gm-Message-State: AOJu0YxXJcSw0/X95gzGUXoo8v6XjvF/sawG4MRDM8S3GNaAi6NWLCPT
	iIQx1BxU6YoFqaWpQRDOBoY+23Tjc2/x0ECxPEkTjaCU89hRFqMPnfHVobP7cw==
X-Gm-Gg: AfdE7clTDq/dupd4rKlUkP2WAXcW+Mrm16wIIzTzsxDpfpYPpewB6F1xkMVzkXmEJrO
	1PBILTlM33jGcokK+0ApimuIfTmbzd4UdQTG6HVewkzBsEkDpc5ed5cK4gaFtASGWHy3H2VUpM2
	5+tIqbMX3aktRREclmIoJmdaIeVixNZBIAPHsLXgiaPXZl72VJRmFuqO4iSXacJkF/P+zs3ni5u
	unxyLCHR5qU6ClUstibHfDgaWnuTfZiSTz5UsEXFpsIaRMgWQUx/r9rbFp2cD7Wpe79T5tts2N8
	s31VW1nQ0LTxJlGV25GGpkMTLCV3y7tax1fsCQhxwwmV/3Z6SVgfiTVTXXn+OLtVo4zpDwfO7MT
	OBZgp9HZirPgYz+G0MOSqFI7slIiyZ69LMhhFvpdM/8hhP4wkytFMlYLJwbPNCFDyHh9AmyKOgW
	3K+zEOy+CVqEIXRKw3QA==
X-Received: by 2002:a05:6a20:c98b:b0:3c3:853a:8d15 with SMTP id adf61e73a8af0-3c3ada1831bmr22460127637.72.1784651245487;
        Tue, 21 Jul 2026 09:27:25 -0700 (PDT)
Received: from ashishkumar.. ([2406:7400:12b:e084:b7f2:160:d1f2:65e2])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147dc1b99esm479421eec.3.2026.07.21.09.27.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 09:27:25 -0700 (PDT)
From: AshishKumar Mishra <emailaddress.ashish@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: AshishKumar Mishra <emailaddress.ashish@gmail.com>
Subject: [meta-openembedded][PATCH v3 0/3] image_types_sparse: use ext2simg_android for ext* sparse images
Date: Tue, 21 Jul 2026 21:56:41 +0530
Message-ID: <20260721162645.2056048-1-emailaddress.ashish@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 21 Jul 2026 16:27:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128353

This series switches ext* sparse image generation from the generic
img2simg to ext2simg_android from e2fsprogs contrib/android. 
Unlike img2simg,which scans the raw image for zero-filled blocks, 
ext2simg_android understands the ext* filesystem structure and uses the block 
bitmap to determine sparse areas, which is faster and produces smaller 
sparse images. 
This reduces flashing time for Android RFS/fastboot images and cuts cost in
CI/CD pipelines. img2simg is retained for non-ext types such as f2fs.

  1. e2fsprogs-ext4sparse-native: a standalone native recipe that
     compiles ext2simg.c against android-tools' libsparse.
  2. android-tools: export libsparse/libbase/liblog headers and libs
     to the sysroot (under ${includedir}/sparse) so the recipe above
     can link against them.
  3. image_types_sparse.bbclass: branch CONVERSION_CMD:sparse by
     filesystem type, calling ext2simg_android for ext* and falling
     back to img2simg otherwise.
	
Changes in v3:
  - Android tools has been moved away from selinux dynamic-layers
  - Reworked into a standalone e2fsprogs-ext4sparse recipe in meta-oe
    as per feedback on the RFC
  - Included the previously-missing e2fsprogs-ext4sparse recipe file
    that was absent from the v2 (RFC_V2) attachment.

Changes in v2 (RFC_V2):
  - Split the single cross-layer PoC into a dedicated ext2simg_android
    recipe rather than patching e2fsprogs-native directly.

RFC (v1):
  - Initial cross-layer proof of concept using a manual ${CC} call in
    do_compile:append and LD_LIBRARY_PATH for runtime linking.


AshishKumar Mishra (3):
  e2fsprogs-ext4sparse-native: compiles ext2simg.c using  android-tools-native
  android-tools: export libsparse/libbase/liblog headers and libs to sysroot
  image_types_sparse: switch ext* conversion to ext2simg_android

 meta-oe/classes/image_types_sparse.bbclass    | 16 ++++--
 .../android-tools/android-tools_%.bbappend    | 54 +++++++++++++++++++
 .../e2fsprogs-ext4sparse-native_1.47.4.bb     | 34 ++++++++++++
 3 files changed, 101 insertions(+), 3 deletions(-)
 create mode 100644 meta-oe/recipes-devtools/android-tools/android-tools_%.bbappend
 create mode 100644 meta-oe/recipes-devtools/e2fsprogs-ext4sparse/e2fsprogs-ext4sparse-native_1.47.4.bb

-- 
2.43.0


