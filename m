Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46F45C77B61
	for <webhook@archiver.kernel.org>; Mon, 27 Mar 2023 18:48:31 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web10.44582.1679942910406642382
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Mar 2023 11:48:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bgdev-pl.20210112.gappssmtp.com header.s=20210112 header.b=UegZJcRD;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.128.49, mailfrom: brgl@bgdev.pl)
Received: by mail-wm1-f49.google.com with SMTP id q7-20020a05600c46c700b003ef6e809574so2681005wmo.4
        for <openembedded-devel@lists.openembedded.org>; Mon, 27 Mar 2023 11:48:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112; t=1679942909;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7A2eUG5/Okc4vL3rdXn2+xH4GXuoMDhXVxDDc4zyhfI=;
        b=UegZJcRDiYHmGrsERoSQM0pVRMRn6KIk37kSpTuQyWoWnj3JVOzNOlqHVFtK/7cQBe
         CiSM9YXsbIGWVf02LrWhk2aOyKsvpvp9Op5anNt+IuPn74ASucUTGS1ZoOOjUur6WZG6
         hBQM4cxi8dX6987BX4PlKnMnsfCWZrIYS6hD0EZBOyEAGzA/vPjTGjVv+6Hb45i8PWKc
         78CDZu9iMOAfmBRoj+8cgE00PwgYkRgQCE2NnDtcVXYuz+QFha5BTb24W6ZJS47d3SP6
         L62UkNNUmt1rwkyL2zPMNvsP4M/ohcxBb/uQvoglxnil3DTAztvG+H4gUAAuosEovuhs
         UYcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679942909;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7A2eUG5/Okc4vL3rdXn2+xH4GXuoMDhXVxDDc4zyhfI=;
        b=eH66+3oHyzf1hUm2P8jKmFAd1sQO2bwc4nRhczMzkKc/M0ut2nSDXsvwKgECD07qwm
         1RTwbHOAt3LsZnqHm/AYGHYLimb3msZm8VHcm8PGrv5FqsyAQ7yvuBTX+GlJPcYf/ES8
         PmWVr+BRRa63zjUlp9BprRnt2/rhAJmKm1EKPIpu0v2wkgAx55/CZsYVuz37NAE+XKVw
         4CYtMyf8Wh1ge/1tuZZOHZohFSM4dq24/e4hiudkDApJRxF7L776R+f/m6Z+sVUvod8h
         bgnRvdi6MdwtsIljq4aurRJMkm7TZd+l6TT+IOVoF0AeHzOuceZD35bfjBzV1oCCixT/
         aWjg==
X-Gm-Message-State: AO0yUKV/9I3wx/ba/cF57OgwLi798uxJcYRBXc88iM4bUULwgiB7lr13
	Voza1qISYppL3H2sAByKw/VrPg==
X-Google-Smtp-Source: AK7set8LZgKiLOnUQoypMd5v6YUSZa5EvLQXl0q17OG6HsUOtOrtZuAlT0zQUtB+/kXx8r4xuSjXPg==
X-Received: by 2002:a7b:c392:0:b0:3ed:5d41:f998 with SMTP id s18-20020a7bc392000000b003ed5d41f998mr10439226wmj.15.1679942908782;
        Mon, 27 Mar 2023 11:48:28 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:313d:a304:2790:a949])
        by smtp.gmail.com with ESMTPSA id p20-20020a7bcc94000000b003edd1c44b57sm14475704wma.27.2023.03.27.11.48.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Mar 2023 11:48:28 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH] reboot-mode: new package
Date: Mon, 27 Mar 2023 20:48:26 +0200
Message-Id: <20230327184826.344189-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 27 Mar 2023 18:48:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101791

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add a recipe for the simple program that allows to replicate android
reboot's behavior on linux (e.g. reboot bootloader, reboot recovery) as
well as test reboot mode drivers in the linux kernel.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 .../reboot-mode/reboot-mode_git.bb             | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)
 create mode 100644 meta-oe/recipes-support/reboot-mode/reboot-mode_git.bb

diff --git a/meta-oe/recipes-support/reboot-mode/reboot-mode_git.bb b/meta-oe/recipes-support/reboot-mode/reboot-mode_git.bb
new file mode 100644
index 000000000..20e77c63d
--- /dev/null
+++ b/meta-oe/recipes-support/reboot-mode/reboot-mode_git.bb
@@ -0,0 +1,18 @@
+SUMMARY = "Reboot the device to a specific mode."
+AUTHOR = "Daniele Debernardi <drebrez@gmail.com>"
+
+LICENSE = "GPL-3.0-or-later"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=84dcc94da3adb52b53ae4fa38fe49e5d"
+
+SRC_URI = "git://gitlab.com/postmarketOS/reboot-mode.git;protocol=http;branch=master"
+SRCREV = "84831b20512abd9033414ca5f5a023f333525335"
+
+S = "${WORKDIR}/git"
+
+do_compile() {
+    ${CC} ${CFLAGS} ${LDFLAGS} reboot-mode.c -o reboot-mode
+}
+
+do_install() {
+    install -D -m 0755 ${S}/reboot-mode ${D}${bindir}/reboot-mode
+}
-- 
2.37.2


