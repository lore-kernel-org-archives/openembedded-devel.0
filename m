Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A03F4C77B7E
	for <webhook@archiver.kernel.org>; Sat, 27 May 2023 19:09:12 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web11.16201.1685214549127663181
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 27 May 2023 12:09:09 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bgdev-pl.20221208.gappssmtp.com header.s=20221208 header.b=sSM1fzrt;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.128.49, mailfrom: brgl@bgdev.pl)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-3f6094cb2ebso12683495e9.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 27 May 2023 12:09:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1685214547; x=1687806547;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4Nl+6ajY4mPih0L3csquiS+EhH+Km79W39q7lPhpJzY=;
        b=sSM1fzrtSaL3stoVJq5Nw42P32FP/PrtWe3nJ/7zdEkUvBs3XU7yWwI3t/Hb3u6/U2
         Rq28kACONJDv6mGhYnzuPsfIHn90muGtgovtoOzpqorwlO/k7aniWsxMGXro8bFNnmla
         rwN7YXGaXEdNXLNl6CwN/Va0nRG6vcI1ux950FrCdteg4DQQ+R6HoC39UqAqQp5kR2dT
         aM8FcQ3DE0xnlZ+gXOPhIrK0U9naPBGxUGo5/fkjLn23Fqb+zIJvwyVniLF7494Zz7uU
         bv010nhcuBu0ZLTbGVD9RRsjjUieppCKUM33jeQf98yAyuKhRcOquVUurqdHuGEmbAzG
         zvew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685214547; x=1687806547;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4Nl+6ajY4mPih0L3csquiS+EhH+Km79W39q7lPhpJzY=;
        b=aZKsubqGtwQFgcbnq2MxQ+K4no3bxhpnGX4SH0YUsP+i07uVHlPtm1e+73G6ifKa0E
         Vwm/+O/a4r3qPEAkGKvF6zb6OOn0ysTW8Ma6caC3cfd0sUp0zx6ninO0vFeUAcFkOefa
         bpoX7EG+WvRCk4DNDymqrTLamkWzLwWTwZCB9gg5/Q7nKdSKsYBnsZaJ++MR3AP9zTeC
         jlLnhPactqjfFaqc3PCa/YsIqtjyHOLdw6dv5qhPMBRvNGgQqBrAzGvz69UI2mOlo0Ob
         wWcYyj10m/01ITHxaLlaDfg/9I9/wN1TzaPI896DHEz6PT+lQCISQiyG7AkWi74yK4PX
         OhBQ==
X-Gm-Message-State: AC+VfDy6jMIbI9DykDTOjeut1LtZJ1Kp5iDLivQj0Oem88Nfg9LZEEAJ
	xw5yXPCWs4Iu5T75btuYcZfvAQ==
X-Google-Smtp-Source: ACHHUZ6ZUFyNEjr4DXVi0kTricI3FaFrcexnLmFX2MaIIJ1MYbG8DKZNwNFMpTxvtnoDImyDopUhjg==
X-Received: by 2002:a05:600c:228c:b0:3f5:39:240c with SMTP id 12-20020a05600c228c00b003f50039240cmr4430586wmf.27.1685214547398;
        Sat, 27 May 2023 12:09:07 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:5631:6358:aee0:d616])
        by smtp.gmail.com with ESMTPSA id v26-20020a05600c215a00b003f4e3ed98ffsm9235046wml.35.2023.05.27.12.09.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 May 2023 12:09:06 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [meta-python][PATCH v2] python3-snagboot: new recipe
Date: Sat, 27 May 2023 21:09:02 +0200
Message-Id: <20230527190902.6482-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 27 May 2023 19:09:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102882

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add a recipe that builds snagrecover and snagflash. These tools are
useful for yocto-based distros used to control DUTs in board farms.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
v1 -> v2:
- move recipe to meta-python as it depends on python3-pyusb
- install udev rules

 .../python/python3-snagboot_1.0.bb            | 21 +++++++++++++++++++
 1 file changed, 21 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-snagboot_1.0.bb

diff --git a/meta-python/recipes-devtools/python/python3-snagboot_1.0.bb b/meta-python/recipes-devtools/python/python3-snagboot_1.0.bb
new file mode 100644
index 000000000..1853596b4
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-snagboot_1.0.bb
@@ -0,0 +1,21 @@
+SUMMARY = "Snagboot intends to be an open-source replacement vendor-specific tools used to recover and/or reflash embedded platforms."
+
+LICENSE = "GPL-2.0-only"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=b234ee4d69f5fce4486a80fdaf4a4263"
+
+SRC_URI[sha256sum] = "c2d21cadddecfd97dd62a8b66b6f88bd56272627b9b71272e9dda6f868ee8715"
+
+inherit pypi python_setuptools_build_meta
+
+RDEPENDS:${PN} += " \
+    bash \
+    python3-fcntl \
+    python3-pyusb \
+    python3-pyyaml \
+    python3-setuptools \
+    python3-six \
+"
+
+do_install:append() {
+    install -D -m 0644 ${S}/src/snagrecover/80-snagboot.rules ${D}${sysconfdir}/udev/rules.d/80-snagboot.rules
+}
-- 
2.39.2


