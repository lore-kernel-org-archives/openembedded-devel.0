Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21937CA0EC4
	for <webhook@archiver.kernel.org>; Tue, 12 Aug 2025 16:03:25 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web10.79047.1755014596786799104
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 Aug 2025 09:03:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Rv/uK13Q;
 spf=pass (domain: gmail.com, ip: 209.85.210.171, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-76bc55f6612so20130b3a.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 12 Aug 2025 09:03:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755014596; x=1755619396; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uWsc/0FRNijnQ8zMKaxKlbEVVHKeiBcbcLTPN4s+idI=;
        b=Rv/uK13QlvPrpVoQ+UUONyDIn+f0MUpgWxRIgnDx5LP6iOGtRd2wyejVcjs/43DhY6
         Qo3ql1+luJb+0fMLkIz+3xg8OK2UikYv8wpAjS4VkVf3lTdry1pRT/s2SlcpumFvoHE9
         SI37QM6Vjyxu/ydzqFJzohPWCaF/qg/vcUY1MvZOdbRMMtPmNGwht3lujsfiggvKaXL0
         4ylIGc6lecJ8gYpoR2QnvMde6Tamf17K57yGDJal1U4vDGiRjq4bxbCKLAgri7ybZm4N
         qf/XqKo0mmV0TghcTZu7d4uZ0h0M8+deuazTEeHQki5boRTyig5S9YKFYWLC5eogu0Ow
         srow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755014596; x=1755619396;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uWsc/0FRNijnQ8zMKaxKlbEVVHKeiBcbcLTPN4s+idI=;
        b=oozN+8jhhbTZcfOrKaAFR8b2p1ISDCULSbA0ofuyryigYZ2y8Ce6kJEVnWZq+zEwwJ
         MsRXjsMpxHqVPiiOiwpI9aLhRgZj6wrn6aX8GMUExxmf7Ik0r63C22kpNONXj6RzXy7G
         mOZ3YG8+Dh6tDNh3y3tmJk1DPEhWPQzQ/+E4xzFatPckbWpg06BUhJNgKoODECXaGxp/
         FLVnbEmGszajvWu/Pdv+jxgHmAlnpCGL+8baTu9HzI860nN7LKc23o0y5xPw7ZDvGbtH
         9Yxp2IqxwqTYaB8C0d9Q//SF+BjcGU3ydfLIUiL3HNBN2CTdhvJV0iitfo2jYhBCAFZI
         kgGg==
X-Gm-Message-State: AOJu0Yzr7I4ADS/0CIUuq3tg6Igu249oNO6BwwjnELzqf2CMso/T95nH
	9qikYBgqjLYwTxQqgDIqrxBnJ4k2m6X0vVlT8n6zXX2UYLIYams5plU/HmaqgtOnxR4=
X-Gm-Gg: ASbGncsrRJMdHhPNdOVs6iGPfjs42cptbEy0B/a1EReO9aTMI2RRa5/wSduxunCFi/k
	FVXXva3Ib0w5DmMo2bT0VSh1xbylc4x4N6Ae0II2NAc/0p/e7BaSYOzQ+cs8oS79ZhCiR3c2xgP
	0xMRMRB0xORjaAaaw3uywPAYPa4SqBGFnyH6KX1B3LtJlm0/FPldL4uGKQXP9xQv6NseD8GMJoK
	zp3F/9hYwJGUE6iCmYfVQ9Z/0ZwBqGqE819jATi/mz8p4yg/cd7HC1tgK0Qg6suxxtiEVr4TCu+
	jkrtq8yGa4alDmHZjfU6OUO8lcol3VMDeuJaYhfFzEP+AG19IP9XnGWHdcBVoz1Ttiq/4EqJRba
	Tap2Hll/Sp1xnpHGeQ1GwAQ==
X-Google-Smtp-Source: AGHT+IHsZWvAPcgKbE923LeTrZrqVYKhEFbBVGTHmInNBi4Krxv7nnQp2Hon1BEYK94AEyo4x7E8ew==
X-Received: by 2002:a05:6a20:729f:b0:23d:48fc:652b with SMTP id adf61e73a8af0-240a7c4e789mr135042637.12.1755014595386;
        Tue, 12 Aug 2025 09:03:15 -0700 (PDT)
Received: from apollo.tail3ccdd3.ts.net ([2601:646:8201:fd20::86a5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76bccfd73a2sm29688961b3a.108.2025.08.12.09.03.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 09:03:14 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] libplacebo: Fix build with latest python 3.14
Date: Tue, 12 Aug 2025 09:03:11 -0700
Message-ID: <20250812160311.711983-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 12 Aug 2025 16:03:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118920

Fixes
 FAILED: [code=1] src/vulkan/utils_gen.c
   /home/kraj200/yoe/build/tmp/work/riscv64imafdc-yoe-linux/libplacebo/7.351.0/recipe-sysroot-native/usr/bin/meson.real --
   ↪ internal exe --unpickle /home/kraj200/yoe/build/tmp/work/riscv64imafdc-yoe-linux/libplacebo/7.351.0/build/meson-private/
   ↪ meson_exe_nativepython3_7e48a7413404982655e79073cf3065c6194271bf.dat
   while executing ['/home/kraj200/yoe/build/tmp/work/riscv64imafdc-yoe-linux/libplacebo/7.351.0/recipe-sysroot-native/usr/bin/
   ↪ nativepython3', '../sources/libplacebo-7.351.0/src/vulkan/utils_gen.py', '/usr/share', '/home/kraj200/yoe/build/tmp/work/
   ↪ riscv64imafdc-yoe-linux/libplacebo/7.351.0/recipe-sysroot/usr/share/vulkan/registry/vk.xml', 'src/vulkan/utils_gen.c']
   --- stdout ---

   --- stderr ---
   Traceback (most recent call last):
     File "/home/kraj200/yoe/build/tmp/work/riscv64imafdc-yoe-linux/libplacebo/7.351.0/build/../sources/libplacebo-7.351.0/src/
     ↪ vulkan/utils_gen.py", line 205, in <module>
       registry = VkXML(ET.parse(xmlfile))
     File "/home/kraj200/yoe/build/tmp/work/riscv64imafdc-yoe-linux/libplacebo/7.351.0/build/../sources/libplacebo-7.351.0/src/
     ↪ vulkan/utils_gen.py", line 50, in __init__
       super().__init__(*args, **kwargs)
       ~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^
     File "/home/kraj200/yoe/build/tmp/work/riscv64imafdc-yoe-linux/libplacebo/7.351.0/recipe-sysroot-native/usr/lib/python3.13/
     ↪ xml/etree/ElementTree.py", line 527, in __init__
       raise TypeError('expected an Element, not %s' %
                       type(element).__name__)
   TypeError: expected an Element, not ElementTree

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...vulkan-utils_gen-fix-for-python-3.14.patch | 30 +++++++++++++++++++
 .../mplayer/libplacebo_7.351.0.bb             |  4 ++-
 2 files changed, 33 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-multimedia/mplayer/libplacebo/0001-vulkan-utils_gen-fix-for-python-3.14.patch

diff --git a/meta-oe/recipes-multimedia/mplayer/libplacebo/0001-vulkan-utils_gen-fix-for-python-3.14.patch b/meta-oe/recipes-multimedia/mplayer/libplacebo/0001-vulkan-utils_gen-fix-for-python-3.14.patch
new file mode 100644
index 0000000000..4e381af340
--- /dev/null
+++ b/meta-oe/recipes-multimedia/mplayer/libplacebo/0001-vulkan-utils_gen-fix-for-python-3.14.patch
@@ -0,0 +1,30 @@
+From ae40237869ae1db4de7f6d86865bc99820852495 Mon Sep 17 00:00:00 2001
+From: Nicolas Chauvet <kwizart@gmail.com>
+Date: Tue, 29 Jul 2025 11:42:35 +0200
+Subject: [PATCH] vulkan/utils_gen: fix for python 3.14
+
+Python 3.14+ has added more type checking. This patch fixes usage
+
+Fixes: https://github.com/haasn/libplacebo/issues/335
+
+Upstream-Status: Backport [https://code.videolan.org/videolan/libplacebo/-/commit/12509c0f1ee8c22ae163017f0a5e7b8a9d983a17]
+Signed-off-by: Nicolas Chauvet <kwizart@gmail.com>
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/vulkan/utils_gen.py | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/src/vulkan/utils_gen.py b/src/vulkan/utils_gen.py
+index 9a97d35f..9b803d82 100644
+--- a/src/vulkan/utils_gen.py
++++ b/src/vulkan/utils_gen.py
+@@ -202,7 +202,8 @@ if __name__ == '__main__':
+     if not xmlfile or xmlfile == '':
+         xmlfile = find_registry_xml(datadir)
+ 
+-    registry = VkXML(ET.parse(xmlfile))
++    tree = ET.parse(xmlfile)
++    registry = VkXML(tree.getroot())
+     with open(outfile, 'w') as f:
+         f.write(TEMPLATE.render(
+             vkresults = get_vkenum(registry, 'VkResult'),
diff --git a/meta-oe/recipes-multimedia/mplayer/libplacebo_7.351.0.bb b/meta-oe/recipes-multimedia/mplayer/libplacebo_7.351.0.bb
index 68a29dde91..3a1096bb57 100644
--- a/meta-oe/recipes-multimedia/mplayer/libplacebo_7.351.0.bb
+++ b/meta-oe/recipes-multimedia/mplayer/libplacebo_7.351.0.bb
@@ -4,7 +4,9 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=435ed639f84d4585d93824e7da3d85da"
 
 DEPENDS += "fastfloat glad-native python3-mako-native python3-jinja2-native vulkan-headers"
 
-SRC_URI = "git://code.videolan.org/videolan/libplacebo.git;protocol=https;branch=v7.351"
+SRC_URI = "git://code.videolan.org/videolan/libplacebo.git;protocol=https;branch=v7.351 \
+           file://0001-vulkan-utils_gen-fix-for-python-3.14.patch \
+          "
 SRCREV = "3188549fba13bbdf3a5a98de2a38c2e71f04e21e"
 
 inherit meson pkgconfig

