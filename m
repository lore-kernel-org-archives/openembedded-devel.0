Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3DC4D25032
	for <webhook@archiver.kernel.org>; Sun, 11 Jan 2026 01:27:52 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2979.1768094863006774072
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 10 Jan 2026 17:27:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Eq/Le6rB;
 spf=pass (domain: gmail.com, ip: 209.85.214.178, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2a0d06ffa2aso39892975ad.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 10 Jan 2026 17:27:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768094862; x=1768699662; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oybA7khQQ+ooSJ9dJsJe+zh+Maed6a9DoDOV9F/Qzf0=;
        b=Eq/Le6rBg6DCBxMMuPZ/G5H52AE0t5mnxXrevs4pxOiCGWM4P6IfSNITE2v+HdIiy4
         wM3WKU2+mIXRntv2a0objjm4202XgbKgYTODvN+dL8G3YVvWEcPEW/mNT0EAkeZMtoD3
         SRcVf0laxLCspVwV+5x9UmVlbIXqaEnObvbzoySlUV+2sZmtvkBJC2336mFHhQ7oCFdK
         KeHCLsHmCYYb4RkYb0kYQOBv5Qeih56gyphBYO7GjRu3f6px5umrm1JehzpHDPmEjf/D
         V+jXXOn25qxKHst6K+YDmz4Mt/xAjTTa1iZJ3j9MC2Yt7QRdMAGp9azs5NMcklzzdg9H
         /zxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768094862; x=1768699662;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=oybA7khQQ+ooSJ9dJsJe+zh+Maed6a9DoDOV9F/Qzf0=;
        b=Tuj823fe3XFUpoNAdpHUTcKbn2Gc8Uap1bM6RQZjFMw2tLEPY34D54d5XBc9G97ViX
         acC3/zGBW4GGJ4Lh7l2LBP/qwcOcVRNDhMz/T7MfcxatjukOwGoopvSFcTAa0WjihErD
         uJjeUO+SnjAElcZ6VUtFGUP3qobilBlsuzZR1ndfUIS5ssRO+D5IbRnOH5N4xrX/hdiS
         XFTHBvjPPoDBbFB+M0In4usuKLl+oKr+GKydr+1L5zfAIbVismycclItm4htw3NnyXtO
         lOITzE+hwWR5OqfsPxPQxWMtrN/sFthzfNO/S5GJQiS1iWPmno8Irh9iVnym2N1YtqbZ
         XDcw==
X-Gm-Message-State: AOJu0YzLSmtutXBAE3/EJHpUdEfsjCbFGwTwd+/om+TzM9PUeVibQ1yW
	F8YHcansjYDyQlC3VHguCj5Mz2/eDxIIDJwYrULlybNYTvkmNWxUsEeBfgpi8A==
X-Gm-Gg: AY/fxX428nZ/6cgs8PpqUTyQFxv+3a/0gzvdd4RVmsMjh0BaulDp4m8yJtUs8RGN82p
	CexXoYkrE14kWdcmLG9rcfGcO/nyCqpgZuNFygWGB3AzhzDFTZ5KudjTj5fuCujrBxfdGBzxFgU
	OD1IYfnTTyMAcaaLtFDwgQypuU0DYq8brzFbssJI1c/mDB57+om+N1dTRmaqH7fPd+jQ1fV7NLy
	QCOy5PN4+pT/7bU1g0d448vwMiTWtgLmlj2so4onQKTZaJxqtRE/UqBHyimB8PWuC0k9BlZ4pmm
	V65Ydbnq0EmEAledDGzHpzL0vSSXXFNEoUHZQGoKHYJmxoDGeLZK3ZUseBE72iB4uoEqzezH90p
	xoBf8NGBZ+gE+JjT2DK+BgMK4aECLN+j3AjwN+z4evANJmLz6KcnL7slL1mckxQ9+QWpyWeubUd
	Fc2yxhO+xQZCkr+oSqqlLn/2YP3bYcKcE7ng==
X-Google-Smtp-Source: AGHT+IEYFP0dTMaBqNk/+mnwoqdP4zXE3D+N8KaMHsZcGx4qVZ+im+7o9QgCIiFFv+X9Lp9oq/U36g==
X-Received: by 2002:a17:902:f54e:b0:2a0:9ecc:694a with SMTP id d9443c01a7336-2a3ee484c6emr136521465ad.37.1768094862202;
        Sat, 10 Jan 2026 17:27:42 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([167.103.127.10])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3c3a303sm137185265ad.5.2026.01.10.17.27.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Jan 2026 17:27:41 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][scarthgap][PATCH 2/2] usb-modeswitch-data: upgrade 20191128 -> 20251207
Date: Sun, 11 Jan 2026 14:27:31 +1300
Message-ID: <20260111012731.247895-2-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260111012731.247895-1-ankur.tyagi85@gmail.com>
References: <20260111012731.247895-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 11 Jan 2026 01:27:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123339

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

20251207:
- Added device: [0bda:a192] MERCURY MW310UH (Wifi, based on RTL8192FU),
  thanks to Zenm Chen for the report

https://www.draisberghof.de/usb_modeswitch/ChangeLogData

Also drop unnecessary SRC_URI md5sum

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 ...switch-data_20191128.bb => usb-modeswitch-data_20251207.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-oe/recipes-support/usb-modeswitch/{usb-modeswitch-data_20191128.bb => usb-modeswitch-data_20251207.bb} (77%)

diff --git a/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch-data_20191128.bb b/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch-data_20251207.bb
similarity index 77%
rename from meta-oe/recipes-support/usb-modeswitch/usb-modeswitch-data_20191128.bb
rename to meta-oe/recipes-support/usb-modeswitch/usb-modeswitch-data_20251207.bb
index 351fe44d70..3bced56f44 100644
--- a/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch-data_20191128.bb
+++ b/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch-data_20251207.bb
@@ -7,8 +7,7 @@ inherit allarch
 DEPENDS += "tcl-native"
 
 SRC_URI = "http://www.draisberghof.de/usb_modeswitch/${BP}.tar.bz2"
-SRC_URI[md5sum] = "e8fce7eb949cbe16c61fb71bade4cc17"
-SRC_URI[sha256sum] = "3f039b60791c21c7cb15c7986cac89650f076dc274798fa242231b910785eaf9"
+SRC_URI[sha256sum] = "0bb12d64aee5e467c31af61a53fb828ff7aa59c54a82ca85eeede4c5690bfa66"
 
 do_install() {
     oe_runmake install DESTDIR=${D} RULESDIR=${D}/${nonarch_base_libdir}/udev/rules.d

