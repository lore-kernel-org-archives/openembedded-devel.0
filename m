Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B686107636B
	for <webhook@archiver.kernel.org>; Wed,  1 Apr 2026 05:29:22 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6159.1775021354582180585
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 31 Mar 2026 22:29:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=i1UJ+l5r;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-48558d6ef83so64220095e9.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 31 Mar 2026 22:29:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775021353; x=1775626153; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=VzsTRUSPuDxXmLWXW6OtunpjNlEf5hJnKPtmE3KVPhU=;
        b=i1UJ+l5rBAqXYRoFRlL08+BH+lBNmXBhXtt+Gr5Id1KvDj2Gs6wzc+8BDyEMrkDAx6
         hSAjK4Wty6GoG/V5PiYSX9s4Pk5ss2P5aBeBIJZ98ieKSXsMBuQ1pYWJ/tYD5uUURDI0
         RIOOql5EgnAeNNdTon5lbldLZ+j4vyhD0tsH8LsyNiNy6bjPWMBxLNL5WYQ+ZqpYyd+1
         n8C0Zq2XzyzaO49h5vqEwAe5vzrAqLkuhnfIUqg4k5ecQhhCO/cShJjm3HWZWBwVOu8C
         q723ekPR+MfZU0gPRa/BpItoktYwXCd7iEgaR5vbDN93E6Yrtm0lklKN78vSTLAPa+J+
         XiOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775021353; x=1775626153;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VzsTRUSPuDxXmLWXW6OtunpjNlEf5hJnKPtmE3KVPhU=;
        b=N19XnlY/Y8IqiieNV9HMkHL0t5WPSy0KnJACpIhf6rSU6X5KFH4NteJ89lip4uZtTC
         GZsnrJrX77Ij46r+Kub7xhz7zVxWyUVSXEzib2oLON0UX9C6BGAzrV2rkGnHv5w3bv7k
         gNriDcQxtjl2VB0dqMqxT2WVodrgaSZN84RixLnzRqHEwOqsD4r6M5kFkNLy2wOWNRFl
         QlYr+gbrJXSuqskMZxjQkhdp62UUJM+VVegVSif10Bp2xQpRAwUqjFMR6pelNo3CqFdV
         HCqJF/X/I/NjJP/OyVoObBZx4qF9JZ7HzAwGBdpddNQ3mIwpPB26disz1k781WY9NIEK
         aKlw==
X-Gm-Message-State: AOJu0Yx+tbV+SsKQVmG9DnIbQ+StWKSTzVb/4I7t1gVtyt7JqQ56GlhP
	fdi29WClJeXhVSe9/Lrw2Lj2oAshO+/yMrJSkTjmKwbpCkc9BxaSbLHSVZ0YpA==
X-Gm-Gg: ATEYQzyocoHuOQjEXhA34EfDDChEeGIvs+nIDHdU+GYc1VB+S6D9MM1Zg9GiBDjGa+e
	J2285Se71acYxhmXDENWtjeImCuqscqql7QWnsdam/laXnlsOWgdlJK0oVEnAxdTAspBWg1f9vY
	skkYp/jJqrR9+4aH8rXWZS7eS5KoNVXqJrLQRc1ohV1Ls7csMydw2KCUvCgOB5adBy401df51cN
	YGL+EKCEr4S5M8jA8knv4UWmpykrrJiXEq8trUZTAV2WQk9sCiDqfFhtqP1l5BrOwJerqqpLEf6
	74ydROurxAf/ne9qyIn5ejYrmaZxeBvO3cg6cgBnlroUbOvJwOvq4Zvtvjsep76AkFxL5o45naL
	Ja2gDtj7tBGrRfEiqVpKGdUoZ9i8E+NKalkZNnP2mObc7i3Pmg+lxXxEZgUM3wYo5tonUx50DD+
	n2Lw23UeR2JKDGMVkSU1sW
X-Received: by 2002:a05:600c:4510:b0:485:39d1:b500 with SMTP id 5b1f17b1804b1-4888359d2f7mr32469115e9.16.1775021352554;
        Tue, 31 Mar 2026 22:29:12 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4887e81a20asm89527965e9.7.2026.03.31.22.29.10
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 22:29:11 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] freeipmi: upgrade 1.6.16 -> 1.6.17
Date: Wed,  1 Apr 2026 07:29:10 +0200
Message-ID: <20260401052910.4027376-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 01 Apr 2026 05:29:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125895

Changes:
o Fix exploitable buffer overflows in the following ipmi-oem commands:
  - ipmi-oem dell get-last-post-code
  - ipmi-oem supermicro extra-firmware-info
  - ipmi-oem wistron read-proprietary-string
o Support --proxy in ipmiconsole.
o Fix mem-leak within libfreeipmi locate api.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../freeipmi/{freeipmi_1.6.16.bb => freeipmi_1.6.17.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/freeipmi/{freeipmi_1.6.16.bb => freeipmi_1.6.17.bb} (93%)

diff --git a/meta-oe/recipes-support/freeipmi/freeipmi_1.6.16.bb b/meta-oe/recipes-support/freeipmi/freeipmi_1.6.17.bb
similarity index 93%
rename from meta-oe/recipes-support/freeipmi/freeipmi_1.6.16.bb
rename to meta-oe/recipes-support/freeipmi/freeipmi_1.6.17.bb
index f5be870b1d..50a1877c0e 100644
--- a/meta-oe/recipes-support/freeipmi/freeipmi_1.6.16.bb
+++ b/meta-oe/recipes-support/freeipmi/freeipmi_1.6.17.bb
@@ -14,7 +14,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
                     file://COPYING.sunbmc;md5=c03f21cd76ff5caba6b890d1213cbfbb"
 
 SRC_URI = "${GNU_MIRROR}/freeipmi/freeipmi-${PV}.tar.gz"
-SRC_URI[sha256sum] = "5bcef6bb9eb680e49b4a3623579930ace7899f53925b2045fe9f91ad6904111d"
+SRC_URI[sha256sum] = "16783d10faa28847a795cce0bf86deeaa72b8fbe71d1f0dc1101d13a6b501ec1"
 
 DEPENDS = "libgcrypt"
 DEPENDS:append:libc-musl = " argp-standalone"

