Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DB9EC83F03
	for <webhook@archiver.kernel.org>; Wed,  2 Jul 2025 19:55:29 +0000 (UTC)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
 by mx.groups.io with SMTP id smtpd.web10.25676.1751467483967491326
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 02 Jul 2025 07:44:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WRQWReqV;
 spf=pass (domain: gmail.com, ip: 209.85.208.52, mailfrom: ernestvanhoecke@gmail.com)
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6097d144923so14234909a12.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 02 Jul 2025 07:44:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751467482; x=1752072282; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=C0FX5HFtIapxR0pH5UFjRCI5oS4ONAYQA+9T5yTK9aU=;
        b=WRQWReqVSW+XcXUwh1F5+J/RkzoC7OWh02XiXBrT4ihAtBzAtjruYq9FAodRM/RSE4
         3xlqOz41E2txAGdtX5NDYeLlblfbK6S3N3bOcErLJrEYOLW//5OiigvJJSQJVMCyt7EF
         RSL1y64gq770EbzHLJiRNY8OBQemJ3ngpvpTZo3+0Yks3xV0WytT9XwWgm0BWzdu0qlo
         IWn2IokCPgf2Pc+gxwNET35H+F8ImbFQ7Q01laDT6VT9mpnGVM4wbC90vn9z+pDe9JK5
         vdgwEsgeyuNeFQlARvKPL/EueRCXgdTQMZVt+WhcMKbWylcHBAfzEWkB1IVoXrvUJ2ju
         AR9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751467482; x=1752072282;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C0FX5HFtIapxR0pH5UFjRCI5oS4ONAYQA+9T5yTK9aU=;
        b=umkWpkuwFsB7J+7KG3t8RyJ5LseHPTnOZwtlSAH+w5BuhXveKvIXQMpE8uKENlnSV1
         Y5vnZSDHJ7WJI1F7GaPMSjtcMkHdXHO5NWjH2uwug9vGfIcrKdW4s/E0+/mezoD8QikT
         jcFKeAiWJAbs5Q4T5HCTLlIKSNuhkGP8qWW4ZfZIGE0eIh1j4f/QxVjOfdnIyG8A/fU2
         OfhKm/chQdI5WBcmQREgMf3SiZBRe9SrzGXbLEnfCcEXejLbwqZEoMN+MPCLDrAqbM9b
         B14yM3q/lBGirw5ISBjpL1Mv80WeoRCueE5q065Bml0T3wROZErkfI+603RbbfILuzUO
         0P9w==
X-Gm-Message-State: AOJu0YzNed+DmM0fxgbRRgf36n4C4T7av5N4ZsqQ4b1AtBJxe1WsZM1l
	0BEZaDjS6BIW7jcS/tiiineBd15h4EsTaEx4GL/m2cIAiusvhMVCudJpSsgXlA==
X-Gm-Gg: ASbGncvJgskfiEtytmXHflZ9WsuNpH4rl4XnsAODcD5WA+5b0L7kgDyZB+S1hLHGf/t
	va7hMznXWXfkIYsL4jtgfDHncvAjx4Xy4LxFhdKHBj2EhZaQtIk3TNVrXwmvE8oLQ+HBaQkIPs6
	ssPpm+he4Lojz45uFCiByPZgel2k1ZO/6UKD4l+lAqPfe/sSanJAShqIyAu55K9cU+6a1ioYh1L
	xVhdEPJgDx/Nz6JbfyxagOacVHW998Y4SmxeSPzCvns7qXn2wfl7jXqOFFT1oXmoQSu5fHC93TF
	u9LQiCW8mzXrS1n/81uOWkgzCIgk6qeroCujV/1KhKNGjr/s2uG5L9l5P/a2i1xNfPKugQskQCi
	NGR+fxxq5W0PaNc3w4/uakaB03Gt/kU9XO+VIm+6hPyEceGSg6tJT9aaAp253j0SgkBBGX7Elk1
	Q=
X-Google-Smtp-Source: AGHT+IGX6yEG3i3v+Bof4qlQ3xlYAX6kBarsG+K06yKq7aeNkLyXonM9UipZWl4irIcLdL+8rkF4mg==
X-Received: by 2002:a05:600c:a40d:b0:441:d228:3a07 with SMTP id 5b1f17b1804b1-454a3c595d3mr20189955e9.13.1751467112970;
        Wed, 02 Jul 2025 07:38:32 -0700 (PDT)
Received: from ernest.corp.toradex.com (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454a9966919sm46775e9.7.2025.07.02.07.38.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 07:38:32 -0700 (PDT)
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
X-Google-Original-From: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
To: openembedded-devel@lists.openembedded.org
Cc: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
Subject: [meta-oe][PATCH] libusbgx: exit with failure code when no UDC is detected
Date: Wed,  2 Jul 2025 16:32:09 +0200
Message-ID: <20250702143209.3345301-1-ernest.vanhoecke@toradex.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 02 Jul 2025 19:55:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118202

The systemd target `usb-gadget.target` is triggered by udev when a UDC
first comes up. It can happen that by the time gadget-start runs, this
UDC has been removed from the system again.

Have the gadget-start script exit with status 1 when `ls /sys/class/udc`
returns nothing.

Causing a service failure when no UDC is detected and no default was
given, allows the service to be restarted by a udev rule calling the
service (and not the target since those are not reentrant) directly. On
its own this patch will not do much.

For example, we saw such a situation using the DWC3 USB controller and
usb-conn-gpio kernel modules as loadables. By the time of the DWC3 init,
udev was active, and during init DWC3 started the USB OTG port in device
mode. If a pen drive was plugged in at boot, it would quickly switch to
host mode right after initialisation, emitting another udev event for
the removal of the UDC. The systemd target as thus reached, but by the
time gadget-start ran, the UDC was gone.

  dwc3 init       usb-conn-gpio role switch
      │                       │
      ▼                       ▼
udev: add UDC─┐         udev: del UDC─────►/sys/class/udc empty
              │                                         │
              │                                         x
              │                                         │
              │                                         ▼
              └────────────►usb-gadget.target─────►gadget-start

Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
---
 meta-oe/recipes-support/libusbgx/libusbgx/gadget-start | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/libusbgx/libusbgx/gadget-start b/meta-oe/recipes-support/libusbgx/libusbgx/gadget-start
index e80cb2c34068..4ef679888ec4 100755
--- a/meta-oe/recipes-support/libusbgx/libusbgx/gadget-start
+++ b/meta-oe/recipes-support/libusbgx/libusbgx/gadget-start
@@ -15,6 +15,10 @@ for i in $ENABLED_SCHEMAS; do
     if [ -n "${configured_udc}" ] && [ -e "/sys/class/udc/${configured_udc}" ]; then
         echo ${configured_udc} > /sys/kernel/config/usb_gadget/"$i"/UDC
     else
-        ls /sys/class/udc/ > /sys/kernel/config/usb_gadget/"$i"/UDC
+        detected_udc=$(ls /sys/class/udc/)
+        if [ -z "${detected_udc}" ]; then
+            exit 1
+        fi
+        echo "${detected_udc}" > /sys/kernel/config/usb_gadget/"$i"/UDC
     fi
 done
-- 
2.43.0


