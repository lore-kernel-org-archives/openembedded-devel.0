Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88A34D116EA
	for <webhook@archiver.kernel.org>; Thu, 27 Nov 2025 02:35:33 +0000 (UTC)
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9972.1764210927392747840
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 26 Nov 2025 18:35:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JprIoN9s;
 spf=pass (domain: gmail.com, ip: 209.85.215.182, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-bc2abdcfc6fso251266a12.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 26 Nov 2025 18:35:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764210926; x=1764815726; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3BDdByChJjiCJI3H9/dy3/mFBL+c0Qn4lhMbZLmh6tc=;
        b=JprIoN9s4tViFsakeq5ZM26beHODADmc2/90Ma9qFO/mmLp/rGB9MHs9FUyi6Vo46f
         /3JdwFLY1Gf9Og8Fk0xRjzFxtnE8wrju7avYcyLQ4nOO95CEzK8AsjFiuiNl23yNWHpl
         ez5ziyDUVjjbXsKJUlR8tnAGTdzfqS+YluA3K54t3y6Ova5aU630yfNPEDKZ/DIFfhPp
         onYpyl52ICwq6gkzG7qhCj0IFeBkKUdvsddzJeh0kbB7cgAOq3Kl19oYPlPkrKizjF9H
         oSHi2DSkpdO6KX9O1Q01Vsh6juZ3BLTcJN8C+Yvz2lPvpR9KU2BP7KirrZHy+pfe6LaY
         adoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764210926; x=1764815726;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3BDdByChJjiCJI3H9/dy3/mFBL+c0Qn4lhMbZLmh6tc=;
        b=Wq8aqYzCWfWctr2CZErRpaT9w7+kP7Pd3j1wJVc1yiM8Gn4gD5fl4FsppQyNVXUg2b
         a9iO8IiWe6L5E/VN1cwnqZMyR/47Is1VwDHxNblMC5attN83dfD7W+GDtsDpqdopDg0C
         OqiDdW5SoYpoAz4EKFhB9qKv1gdbzIcskk05vpJp+8xuQ+fejggt+dkRWYUywZV+pF2G
         CwqvBwdE9/rYBs1cWHW7Hr0k7wISpuj4mzJyOI/N9LnKBw0fTodxWw0Ctg7aQCqdtMcl
         kfyE+3O0WzOakDkopxYF/DA1ifCIg7cYTjCWxEiiXKsw1wfFgu/R1L4ejUUKWZnFH7+Q
         KvOA==
X-Gm-Message-State: AOJu0YydBBO6C0SlPt80Q/vZPk9jWuT23S/4Eo8APJ2V83EQUnX2CTAn
	63tUZo/iwbr2qoQh05asYujErVY3DAsRZr1MY7OgvfrzAhHqFsiOgbVWb6q43/N/
X-Gm-Gg: ASbGnctOK/JludqYuGE/mk9tS5AwAdEHZXbu4668l09dd/3tlK2Yt/UX3uI7n0OIHnH
	4EksaV829+v0LiklkQRRPPfTlu3a+YfgwYuLi8HA+LuLNVoltQMayG41LNQAhTa0m3aELMJkcmc
	zp9FjrkomfEqs/7KUv1ZjfIXhRNiOJN+Wype+qYe0YjodqPfXIndmUp44coIE3y4AhlRRfpBfZp
	A1TXkx9NtvTcegvFruY67nFfIcc9/ZDSqKZ677MXRoxBW7Ud/J5Mp20gJtom6msl0ww8T8p3Lgy
	W3F0VFbKRJ01TbBMzHKoMdnrgBhVneuEoEOAZxZQbnIgssIkFbpjAbmDxgyvmnmNiK0Y5lLFC3h
	MCCXyrnRtQOznp1PaJJbbsM9OzSlGYxcPloWRPqF37LouAQoSBuNqTHDNmv945HOvGcOfdhQ0Hm
	BPU04368BgMVL+BfhdzVDkK7UG+6cfQxLZgHKLIeyauALhgPY90nNkiCyVF+ZpWEWS+8ZSuiUby
	gvRmdJkwaPkUK8jbBnIRYTDhNpB4RvW
X-Google-Smtp-Source: AGHT+IEqpuRsIei7vBTZNEG1riOXwvHQY87NGT4zpsTXAW2XFGUkhep5n1LK5lkvABzQ3PU6CuprKA==
X-Received: by 2002:a05:7300:3c1e:b0:2a4:3593:ddf0 with SMTP id 5a478bee46e88-2a719fbd09bmr14273864eec.29.1764210926001;
        Wed, 26 Nov 2025 18:35:26 -0800 (PST)
Received: from apollo.tail3ccdd3.ts.net ([2601:646:8201:fd20::7c49])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2a965b47caasm1625898eec.6.2025.11.26.18.35.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 18:35:25 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [meta-oe][PATCH 1/2] libplist: Fix buildpaths in ptests
Date: Wed, 26 Nov 2025 18:35:19 -0800
Message-ID: <20251127023522.519364-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 27 Nov 2025 02:35:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122100

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../libimobiledevice/libplist_2.6.0.bb                 | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/meta-oe/recipes-extended/libimobiledevice/libplist_2.6.0.bb b/meta-oe/recipes-extended/libimobiledevice/libplist_2.6.0.bb
index 17b1d7cfd3..5f8d1f8d72 100644
--- a/meta-oe/recipes-extended/libimobiledevice/libplist_2.6.0.bb
+++ b/meta-oe/recipes-extended/libimobiledevice/libplist_2.6.0.bb
@@ -49,10 +49,12 @@ do_install_ptest(){
     for t in $(find ${B}/tools -type f -name 'plist*' \! -name '*.o'); do
         install -m 0755 $t ${D}${PTEST_PATH}/test/tools/
     done
-    sed -i 's@LD_LIBRARY_PATH="[^"]*:@LD_LIBRARY_PATH="@g' \
-        ${D}${PTEST_PATH}/test/test/plist_cmp
-    sed -i 's@LD_LIBRARY_PATH="[^"]*:@LD_LIBRARY_PATH="@g' \
-        ${D}${PTEST_PATH}/test/test/plist_test
+    for f in test/plist_cmp test/plist_test test/plist_test++ test/plist_jtest \
+        test/plist_btest test/plist_otest tools/plistutil; do
+        sed -i 's@LD_LIBRARY_PATH="[^"]*:@LD_LIBRARY_PATH="@g' \
+            ${D}${PTEST_PATH}/test/$f
+    done
+    sed -i '/notinst_deplibs=/d' ${D}${PTEST_PATH}/test/test/plist_test++
 }

 PACKAGES =+ "${PN}-utils \

