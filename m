Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D55AC2A075
	for <webhook@archiver.kernel.org>; Sun,  4 Jan 2026 10:39:02 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.40711.1767523127999141234
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 04 Jan 2026 02:38:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=elplw6Q1;
 spf=pass (domain: gmail.com, ip: 209.85.128.53, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4779adb38d3so85673115e9.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 04 Jan 2026 02:38:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767523126; x=1768127926; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Tj0MGoaXTpPayEA+3oI7cgqIZ1GZdA/bqorl+YSWIaw=;
        b=elplw6Q1SXNisX9bmsU8CcKN/ZEEcZ6F7Snlx8VRE187QEcjs3gWXKqEKs7AgTyz9c
         BYWJoIRp2MHvjtVwDRr+Lih+LPHkNh4oNvqeczsiYw81gdpKL/OCbTZQmqhueMzwbGt9
         O4nhwuDyljypy0GUBuVR6Wf/wSmbu6TryQhpXYYWCcwlKmf4FMWG8mMneCjHXmg4RGXi
         KjN09DXFDxCkKQy0gvWPZt7t9sJ5mv3Gan9vv2TEtW/X1M4+IAactwKrLemY4YXnbqjO
         Pli7rtLVeK84aL9Dgv459cDO+pJsj+DyvyC9dF5gkH2M2v4mfZdNtiyC11sZeNVz2XJS
         0N7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767523126; x=1768127926;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Tj0MGoaXTpPayEA+3oI7cgqIZ1GZdA/bqorl+YSWIaw=;
        b=VOxSJo6ddzFBI3o8I028CZTqeRqj2X1JMxI9iL3HC9oIpwfAgy9OuNSDfSb2gb2BMg
         voieIJPXGYIDYAduZbECuf9gy74+ORSXmTs871wJlg3O+Y4i9s86NvSKWKPRkcTKF46P
         LtSOcp/6dn6p/XKsVrpYQ2TECRDyezNkYDakRy5/5H7vvevsspo3SC++h5iWGqE/nSE8
         hB05hHiLq6nHdYiT3ZXIB2vpGLIC32uQYDYGSOn2EwLyhgdTQiULT6RNjx/U+wi1lNbI
         SJHfzPI+JkTkTOsqtaMMCKMOb74ISR+wQfo+ZHM7oTiZSSvO4sYjc3R5833ZGmo/3Ba+
         fIzg==
X-Gm-Message-State: AOJu0Yx1LzJJwDXfOJF5ADZjersmuD50XxOFa7oe8SbWh76wFyMUWbsT
	BF4507ctB4YjEt1oa628yvfy0N1bz2TsFfCBMcTAR3IRsilq1vxpU4HQ2Axa7A==
X-Gm-Gg: AY/fxX4uwHghdJ+ek3MomI/iX+/vKJKQXnTWNnbOx1YJKqkjoMIHi+LPJC8I8kOUGoe
	wrq/3siUo9AepCNCulM/0blkCSdmAiyGhYnoqC1ZiW0WmqSUFxneK+dDSTRnH+4sb72VbT333OB
	eY4izDWOQWrSrG7yxrpRb7APwl0DRxKtMfFDXBqvORACuNo3H1ClqS93A/kwmKL1LS3hao5XHPz
	fqlbzD7Ue3OuUl3TKHBT6ii81JpjM7Ut9kiIrUZEwkNkL3JZn7YB1EyhOSXnPg2U+gw6Auo+BCY
	f/aSHsf/fOoCvLLXMQYOE8Cl/3SNB/3g9kWlfKycSe2ee+yAtEVVh379/VQ7QbCVdqo6u30VWmH
	POuc+nKx7h6unzCT5BE48bT1A6LVbogBTdd/VLPa5lWQunioMwv1fjZhog+6xqaBz3gdKNacQ74
	r5BD2tsJ9/
X-Google-Smtp-Source: AGHT+IEmbxeVN2RM2GcyFNGl2kFJJTBv2/9MUmuNm6qoSawiEZmDxV+5jIeH1Qw3xvSIQc5vZziviw==
X-Received: by 2002:a05:600c:8116:b0:477:abea:9028 with SMTP id 5b1f17b1804b1-47d1953bc47mr502147255e9.6.1767523126143;
        Sun, 04 Jan 2026 02:38:46 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea1aee5sm95885178f8f.4.2026.01.04.02.38.44
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Jan 2026 02:38:44 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 2/5] usb-modeswitch: upgrade 2.6.0 -> 2.6.2
Date: Sun,  4 Jan 2026 11:38:40 +0100
Message-ID: <20260104103843.3450950-2-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260104103843.3450950-1-skandigraun@gmail.com>
References: <20260104103843.3450950-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 04 Jan 2026 10:39:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123115

Changelog:
2.6.2:
- Bug in C code (with gcc 1.5) fixed

2.6.1:
- Wrapper now handles devices with non-continuous interface numbering:
  www.draisberghof.de/usb_modeswitch/bb/viewtopic.php?f=2&t=2915&p=19605
- catch error with retrieving the active configuration, exit gracefully:
  https://bugs.launchpad.net/bugs/1880191

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../{usb-modeswitch_2.6.0.bb => usb-modeswitch_2.6.2.bb}       | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-oe/recipes-support/usb-modeswitch/{usb-modeswitch_2.6.0.bb => usb-modeswitch_2.6.2.bb} (86%)

diff --git a/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch_2.6.0.bb b/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch_2.6.2.bb
similarity index 86%
rename from meta-oe/recipes-support/usb-modeswitch/usb-modeswitch_2.6.0.bb
rename to meta-oe/recipes-support/usb-modeswitch/usb-modeswitch_2.6.2.bb
index 1474ca615e..3b58722683 100644
--- a/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch_2.6.0.bb
+++ b/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch_2.6.2.bb
@@ -5,8 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=091556bd6d0154cd4c2d17a1bfc7380a"
 DEPENDS = "libusb1"
 
 SRC_URI = "http://www.draisberghof.de/usb_modeswitch/${BP}.tar.bz2"
-SRC_URI[md5sum] = "be73dcc84025794081a1d4d4e5a75e4c"
-SRC_URI[sha256sum] = "c215236e6bada6e659fc195a31d611ea298a4bdb4d57a0d68c553b56585f8ba3"
+SRC_URI[sha256sum] = "f7abd337784a9d1bd39cb8a587518aff6f2a43d916145eafd80b1b8b7146db66"
 
 inherit pkgconfig systemd
 

