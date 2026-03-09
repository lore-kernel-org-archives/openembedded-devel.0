Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58031EFCD79
	for <webhook@archiver.kernel.org>; Mon,  9 Mar 2026 10:03:02 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10761.1773050572148813935
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 Mar 2026 03:02:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MXIzweeT;
 spf=pass (domain: gmail.com, ip: 209.85.128.54, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4852a9c6309so20352585e9.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 09 Mar 2026 03:02:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773050570; x=1773655370; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=bKIy2aYlKE2v0xnc14tEDO962ZQLbA0W8zBmYfqonh0=;
        b=MXIzweeT/s8cbu6/w1QZjemhL/WBeeuP7Fm7rINhn82nH0BZrevYKtuz+eGbd1MDsi
         EeVfgaNw5XDozbVd0PSkNa05FCbVNSF+crvw2vvineQ06OhRFVzry5gj1ncsr8F+A/B2
         86XmUeQr8ZdrjVZYuaSr3WQXlvLHkciADvghqo6ZdSnxyh5IUq0wQoOdl03/cPlb6frG
         +0UbPLY4LVe3Py+8A9PibcesgpmqeRZwRCxgdcNrJarZoCRIiBR6C50bYhBnRf7qqVSl
         KD1x/SDXA9gycTvsFzbySA9XYUy4bh1ooegZcQOJN2CTNAM6RKn575feWThVmc2OY6vB
         kDJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773050570; x=1773655370;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bKIy2aYlKE2v0xnc14tEDO962ZQLbA0W8zBmYfqonh0=;
        b=odIYs4GXPvRlpMMilWERgSv+SYZ0PhZiMI0YWBLtOmhchcmvPATsZm/Y4b7z0p8fRb
         sH9C4xm/AjENIxe+tRy+zPiOHSdNB4xSCl0cdtlimceYwyLpM40fpsjdsYqADcTNGjKZ
         GGuo0NylxbItkINws8Y9qLiGK3A1VGnX8MTOiv4aMvclGDxlxiDWTigmm4JzKkreOloL
         1ubBTYiigHsrXD4G9jAx2kNzcBQjOTYBeTV3s5MQx0GPJQwxqGsCq78QskPkkYBmeR/9
         QNc25a+ESxB3pwbkYaN6dyz09f5fBiS1XdwKCfcMXOtalHD3ILj3oiAHfaCidKiLkfoZ
         76dg==
X-Gm-Message-State: AOJu0Yz4NV0ZF2HjWRpmDb6gxPwplV5D4QwQsznDN+yP+mYlMJfQZGMv
	ESTVztOwC8KC+6C5jFPj+zE+RPiw2ahRGg9V55i2gw0ctMuRfbhOQJUZEiJrCQ==
X-Gm-Gg: ATEYQzzRCdGClAdE8sWbz0mC/Q8wk+COkzE562mLIat+a35dRvxm1VyW2BsHtKe8TdO
	56iiYVreqi/HrZYNrvsKeYpqB9C72x+TGqIlUPppmD06WeO/UG7Y12I/x2CcqpEseKTdiAh4aw8
	9vmV1BdYnCC4XvXKtK5Jccu9yLASj7SM/sRi/m0xNFL5OT8FmZjTg+KwRGI2Z6XKxFdEfmpE2kX
	cz3MVRttKuJ7PWuB3yh4ZlWlDarWShqtzPKE+F7kOuABIx/PovHIeAgINHb3JoZ1hmcxTO/QzJg
	ZvMbYto6Jtp9lkAd5+JbMd6xOcFTBTCCxMdZmUm6D0IOOVLHeb0xOl1Br9mQU12BcAs1i7sGg3g
	1Fo+5gPAXNg2qhMgyeNVbywY3i+imFptSWQRM+8qVN7P5wK/Q2dA3QZJ1hmPMp5Q5rsjIn0k5Lg
	ek268SyThJli4DbuPziYjv
X-Received: by 2002:a05:600c:8b01:b0:477:561f:6fc8 with SMTP id 5b1f17b1804b1-485269195afmr179781845e9.5.1773050570247;
        Mon, 09 Mar 2026 03:02:50 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dae3f267sm24067636f8f.31.2026.03.09.03.02.49
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 03:02:49 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-multimedia][kirkstone][PATCH] vlc: ignore CVE-2026-26227 and CVE-2026-26228
Date: Mon,  9 Mar 2026 11:02:49 +0100
Message-ID: <20260309100249.277314-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 09 Mar 2026 10:03:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124972

Details: https://nvd.nist.gov/vuln/detail/CVE-2026-26227
https://nvd.nist.gov/vuln/detail/CVE-2026-26228

Both vulnerabilities affect only the Android version of VLC, not
the other ones. Because of this, ignore these CVEs.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-multimedia/recipes-multimedia/vlc/vlc_3.0.17.4.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-multimedia/recipes-multimedia/vlc/vlc_3.0.17.4.bb b/meta-multimedia/recipes-multimedia/vlc/vlc_3.0.17.4.bb
index dfc838066b..8a49be72fb 100644
--- a/meta-multimedia/recipes-multimedia/vlc/vlc_3.0.17.4.bb
+++ b/meta-multimedia/recipes-multimedia/vlc/vlc_3.0.17.4.bb
@@ -130,3 +130,6 @@ FILES:${PN}-staticdev += "\
 INSANE_SKIP:${PN} = "dev-so"
 
 EXCLUDE_FROM_WORLD = "${@bb.utils.contains("LICENSE_FLAGS_ACCEPTED", "commercial", "0", "1", d)}"
+
+# Android specific CVEs
+CVE_CHECK_IGNORE += "CVE-2026-26227 CVE-2026-26228"

