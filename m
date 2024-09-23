Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2977FCF9C6F
	for <webhook@archiver.kernel.org>; Mon, 23 Sep 2024 08:56:22 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web10.32311.1727081772768988867
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Sep 2024 01:56:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=E0pxOoPf;
 spf=pass (domain: gmail.com, ip: 209.85.221.46, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-37a33e55d01so3031565f8f.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 23 Sep 2024 01:56:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727081771; x=1727686571; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jMD0G2h9xan8l0Hto7JZXne5QZUAKiSieJyOdzNXeXs=;
        b=E0pxOoPfmz/+DLCGXXZ8YJn8y6w6druHPJ/SourBJK1qb2x2TRQmVf8iBJUuBBFQmZ
         3E9+ZrX/38t6AtndHsD82sHTFqUuuTWsdKNI0ssofVVlhKu4y6yPX4DVUHUZz9xSMTL5
         NP7U8NOzOI2JLFdXdr6PH+0k+yUZ8mPG3H1JLe4ojvhN+ZM48aLKJG5MSdBpbkrv7cFr
         WF4rBMrlQqAGA5izNwhaAHL5qLMJuyxrgUhzdrrYo5exWNACiO+D53wwomoCalEpnYlI
         Q8vMRm+SshSBJ602BiedhAW6jlNj2NQTQ5q9XbftGW0kVgoJMjneefDNMAe9ZlXwtMKH
         ib5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727081771; x=1727686571;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jMD0G2h9xan8l0Hto7JZXne5QZUAKiSieJyOdzNXeXs=;
        b=iHsGloF7ZpqytNxjVApRokn+9Y0L//LjRcR9n98IjA/5nqVg4HVQI/Vz32oegtHVYV
         1Hy2EyqSgv/ZVgLW+TsvxiSwSOBWRAAY91un6pmCPAOO10+sKlaFCYjEj8Jd9frP7SWm
         X/jtgJ5UyYvBgtuLliQUpNaaciSVWx/9SFzqiLOKCagUvNIVZLGlEbxdI9A3oVy1zWa0
         ykJ+6jTyQgrL6F57fMR5iK4ZGbb/ldbeBAYgSD6dL4uaaVrq/ZZcHKGKqGPdHKB3oVMh
         oHa5+IGWVoHqMpuIJDkya+90bw2yfrQCTSA+rKbYE7z7VoCeCzDmMqtY22XZIvuUi+/E
         TAEA==
X-Gm-Message-State: AOJu0Ywn/YkPXYUayfYTD2Yste4WEfYm9EivJXpkTXib+tTo7ladY9AD
	1HEd2k0WT6+p8zyGF/X0z35/1KYxO6ZZWj3L3N0ixFslMNCwX6kAjRhbeg==
X-Google-Smtp-Source: AGHT+IGCUXNtUbApfdIYQ9eSSQV8n8kXOwceqBdbdvf2uast7hdTcOEz2FHrp8bzwzr5sxkEfdf4dw==
X-Received: by 2002:a5d:6b0b:0:b0:374:cb30:b9b3 with SMTP id ffacd0b85a97d-37a431475e3mr5199467f8f.2.1727081770449;
        Mon, 23 Sep 2024 01:56:10 -0700 (PDT)
Received: from toster.lan (bl15-243-112.dsl.telepac.pt. [188.80.243.112])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-378e72e49bfsm23870764f8f.21.2024.09.23.01.56.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Sep 2024 01:56:10 -0700 (PDT)
From: Jose Quaresma <quaresma.jose@gmail.com>
X-Google-Original-From: Jose Quaresma <jose.quaresma@foundries.io>
To: openembedded-devel@lists.openembedded.org
Cc: Jose Quaresma <jose.quaresma@foundries.io>
Subject: [oe][meta-oe][PATCH] gpsd: make the meta-python dependency conditionally
Date: Mon, 23 Sep 2024 09:55:55 +0100
Message-ID: <20240923085555.71900-1-jose.quaresma@foundries.io>
X-Mailer: git-send-email 2.46.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 23 Sep 2024 08:56:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112456

The python3-pyserial dependency was introduced in [1].
It is provided by the meta-python layer and so make it conditionally.

Fixes:

| NOTE: Resolving any missing task queue dependencies
| ERROR: Nothing RPROVIDES 'python3-pyserial' (but ../meta-openembedded/meta-oe/recipes-navigation/gpsd/gpsd_3.25.bb RDEPENDS on or otherwise requires it)
| NOTE: Runtime target 'python3-pyserial' is unbuildable, removing...
| Missing or unbuildable dependency chain was: ['python3-pyserial']
| NOTE: Runtime target 'gpsd' is unbuildable, removing...
| Missing or unbuildable dependency chain was: ['gpsd', 'python3-pyserial']

[1] https://git.openembedded.org/meta-openembedded/commit/?id=1266c912afa0abf118eaa5d152a0641c87665fbd

Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
---
 meta-oe/recipes-navigation/gpsd/gpsd_3.25.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-navigation/gpsd/gpsd_3.25.bb b/meta-oe/recipes-navigation/gpsd/gpsd_3.25.bb
index f893ac359..458aedbf8 100644
--- a/meta-oe/recipes-navigation/gpsd/gpsd_3.25.bb
+++ b/meta-oe/recipes-navigation/gpsd/gpsd_3.25.bb
@@ -27,6 +27,7 @@ CLEANBROKEN = "1"
 PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth', 'bluez', '', d)} usb"
 PACKAGECONFIG[bluez] = "bluez='true',bluez='false',bluez5"
 PACKAGECONFIG[qt] = "qt='yes' qt_versioned=5,qt='no',qtbase"
+PACKAGECONFIG[pyserial] = ",,python3-pyserial"
 PACKAGECONFIG[usb] = "usb='true',usb='false',libusb1"
 EXTRA_OESCONS = " \
     sysroot=${STAGING_DIR_TARGET} \
-- 
2.46.1


