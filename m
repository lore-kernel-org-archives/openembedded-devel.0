Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40D1DC2A076
	for <webhook@archiver.kernel.org>; Sun,  4 Jan 2026 09:13:02 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.40226.1767517976961064861
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 04 Jan 2026 01:12:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PhGqYzFF;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-477a219dbcaso105801025e9.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 04 Jan 2026 01:12:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767517975; x=1768122775; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Tj0MGoaXTpPayEA+3oI7cgqIZ1GZdA/bqorl+YSWIaw=;
        b=PhGqYzFF48OmL4MXr4I8U4zXAQSytjwyVCJKK4YCbO2c9/q7L/hBxXPXSkiC4XvLhy
         5/amUJ4xEaM58QNNCmXbVyr26rDc/w8cWflPlX10Xjh22jJVcL1QYHxViQNz4T8/fImN
         ZBlpPVdTkCWyU1f09/lltwIGd5cllLDzA2jRcQWKSHXdhroynLc1WjcnGAidycVBrOIZ
         vKz+iITgwQfalgbItR4jYJbVQB+3oeIW08fIWBjiC3c6QO1atgSJCabvsqHsudyju6aI
         P91tFarzRXt0yGWYKAQmVm6G/UbJlYzhioV/RIyzRAFhJv3DmLikM8G1kcbr/B0Rmo27
         e9ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767517975; x=1768122775;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Tj0MGoaXTpPayEA+3oI7cgqIZ1GZdA/bqorl+YSWIaw=;
        b=jzJjzc3cLInfOx9+vIyDjANGewnU2Og7kvcyyYnpo7TsCKv/8M86CIWIm8dY9viZWl
         XNqedzeFKDSROx9tRKN+ckSkFfEsN/H75PZuL1Mmb2yqCP0eMiideHV+9HpKkJabkcVK
         T/osgxkL8ndR3jBJb/LFiiOsF/aXMT8/AJj/pgzDc6oPeT96YuAVwmoM/+WfpVPsQfMV
         q5mFWyVMj4Kuw5Vn1+IW7NKSoejbdldymB/jKPvap/VFy8Zo1VvKzSuDd8HqZZiFsClI
         Wuu4+DN48jTkpHUEqs/XP1PLudtptJJ5nZ6hXybTgE378njYkxYwMZ15zAHtFz+gWRDV
         Yf8Q==
X-Gm-Message-State: AOJu0Yw/g39d4iEZKi07WC5ib8FL6z0bK3+/u/PMFYBU0txy417nV7t3
	R+S4l1nTgECLzX1m5yjwrSVLLrPQHM/J9BxGbTOECKOqpnu9cwtlyzKrN1RIQA==
X-Gm-Gg: AY/fxX7882LW40Q6TQ7og9V+NRmB4tvvRLxZjBhKtlXUmG4DpWoW6pvKuxtd1xvayEI
	u7NMfucKVHxCVQBviFGMlvmTUkQmgT0qOBhU9pBMNeb6z3I6TT9H2062RtoYkaoUcHG4XZlJy5d
	isiElrpoC7mEkNGkrGJJgjKkxzYwMIHWeLjsYVbSqWHWlQKbUWi6sVVPGXPCOQCD4cHF2T9a7JS
	ZsKezc+Y4se29VX0eJEdrUu0ceadJ5A6GpIqkXAbM65aV9/RjjPuMakYRKzhHH+QF3UqwCWJmJk
	+acQOK8fdvH2QxKauS6iqQCwixhUL9yk8OXZzLfIQLkBk0juNFaOQJpSJv/QBY5QOzTJboa0cMm
	Ec8SFu2Y0AkUGILHEdkcu6uWsO36V89uxIgESyA914/xDklfx4hhBT9hum2AqLQl6LK1x1ehgtj
	EJK0FDKV4OfjPZuVJBxT8=
X-Google-Smtp-Source: AGHT+IGrSeGbNgtPlyWqvGkze7H0rDUvpvLxqI9P2v8gIeJuOTtdYSTVZsflGNbAnqRCulSOyzE7WA==
X-Received: by 2002:a05:600c:1f13:b0:47d:6856:9bd9 with SMTP id 5b1f17b1804b1-47d68569c53mr113298945e9.23.1767517974954;
        Sun, 04 Jan 2026 01:12:54 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d6d13e2bdsm84483275e9.3.2026.01.04.01.12.54
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Jan 2026 01:12:54 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 2/5] usb-modeswitch: upgrade 2.6.0 -> 2.6.2
Date: Sun,  4 Jan 2026 10:12:48 +0100
Message-ID: <20260104091251.2696384-2-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260104091251.2696384-1-skandigraun@gmail.com>
References: <20260104091251.2696384-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 04 Jan 2026 09:13:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123110

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
 

