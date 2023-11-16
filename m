Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28C96C197A0
	for <webhook@archiver.kernel.org>; Thu, 16 Nov 2023 09:57:37 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.web10.3683.1700128650508711996
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Nov 2023 01:57:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QB5oXegR;
 spf=pass (domain: gmail.com, ip: 209.85.218.54, mailfrom: alperyasinak1@gmail.com)
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-9e62f903e88so78676466b.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 16 Nov 2023 01:57:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700128648; x=1700733448; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ir0YRZlTgNVFr7XTaQf8e07ru1lNTi1NIeMPxM+TYCM=;
        b=QB5oXegRsRmAcmeDuFhP1feiUGIQrKQ09FIvG1wUqLb2Q02OAg5Baxb4dEhcpxcofG
         7yT2H5iLA0MSwgQLw1OzC3rvTMYZ63Fl8PMIpcs+wl/VpEfeSIsZzKCz8zMtqpeQmZ7+
         qtV/Kcxh5lOhrxJufsZCyDw8IqJlcn+j/CvyA0geOPbZ28deFjd64BE8TfX+UtPd2uDR
         RKT8u9FwOD4cdiJG67kzmzxbtD9Y2OBx5kN6v849WABHdNmITTk+kZ723us6x6BR2ZSU
         TldrWZ4a3X9eBdyd2nqjEuvhuV4RtjaWdNLwyittWFeopcybkAMLki/2Tto7r5304dNw
         S53Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700128648; x=1700733448;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ir0YRZlTgNVFr7XTaQf8e07ru1lNTi1NIeMPxM+TYCM=;
        b=eHVn/TTOSjqxhbSgJvbwxeu557gWizfZR0WgYHaIP/KTBRJRO72wABBKARFTtYIFU7
         g2h1QRYN6nVTl3XkeZm8UCnuOuj4mVfaDuniXX20w0W+cYPRzdpXKPeCrRTWDrk27if9
         NBnt5lmfnOkcJwjgW2Kl7Trxiy4A8nbpl5EE1Z+O+YhFgyrpWfRXpTt75GvgOveGSz3+
         LmRFabG50gB08Jmh4YOJ2iwpBE/jxg9xLiGt3vHV4qNcQXWGZzj8GfMYpC0c0s/ANAaZ
         j+bdsgLcjVO0RPXoyL954hFEjjUjX0aaPFNebzpHO4WkXRTRkMwznMtNgD8FOULdtQjT
         NKEg==
X-Gm-Message-State: AOJu0YyaCJf9m/ej5qh4EYxL62TcGNYgZPegkRjvRnWRBPg/rwq3DKGK
	4jcotJtR8dcwaJi/pk8f38sXcVWtMfVbeQ==
X-Google-Smtp-Source: AGHT+IH1iocYxbWOHr2ucuirBuYEB3VEG4WUugxyuU/5z3d1q9z275eDqbvh8NPrvAx4rN1h7vxmUw==
X-Received: by 2002:a17:906:2e8f:b0:9df:bc8d:fbc8 with SMTP id o15-20020a1709062e8f00b009dfbc8dfbc8mr11386881eji.37.1700128648129;
        Thu, 16 Nov 2023 01:57:28 -0800 (PST)
Received: from localhost.localdomain ([176.33.65.238])
        by smtp.gmail.com with ESMTPSA id fy15-20020a170906b7cf00b009e5e1710ae7sm8247470ejb.191.2023.11.16.01.57.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Nov 2023 01:57:27 -0800 (PST)
From: alperak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: alperak <alperyasinak1@gmail.com>
Subject: [meta-oe][PATCH] libmtp: upgrade 1.1.20 -> 1.1.21
Date: Thu, 16 Nov 2023 12:57:16 +0300
Message-Id: <20231116095716.181552-1-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 16 Nov 2023 09:57:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106810

Changelog:

Bugs fixed:

- Fix LIBMTP_STORAGE_SORTBY_MAXSPACE not working (copy-paste mistake)
- fix warnings regarding mismatched parameter docs
- fix comment above sort_storage_bysort_storage_by
- Revert "ptp_pack_string: check string length for no iconv situation"
- remove dependency on ptp.h
- fixed paste error vendor/product id
- libusb-glue: check return value of ptp_init_send_memory_handler
- ptp_pack_string: check string length for no iconv situation
- ptp-pack: fix ucs2str overflow

Features:

- add a LIBMTP_FreeMemory function that wraps free()
- added functions to get device by serial number
- added serial number of device to output of 'mtp-files'
- added optional serial number parameter to 'mtp-getfile'
- added optional serial number parameter to 'mtp-delfile'
- feat: Add LIBMTP_Get_Children() to read the list of raw IDs of a folder.
- merge a patch from google https://source.chromium.org/chromiumos/chromiumos/codesearch/+/main:src/third_party/chromiumos-overlay/media-libs/libmtp/files/libmtp-1.1.20-10_remove_nexus_s_from_device_list.patch

New devices:

- add Garmin Forerunner 955 + mtp-detect log
- added SHARP S7-SH https://sourceforge.net/p/libmtp/bugs/1914/
- added another Lenovo Tab TB-X306F id fixes #116
- added tolino vsiion 6 reader https://sourceforge.net/p/libmtp/bugs/1921/
- added FLIR C5 camera
- added iBasso DX170 DAP, fixes #125
- added Lenovo Tab P11 fixes #127
- aded Sony NW-A105 fixes //github.com//issues/130
- added Honor Any-NX1 #135
- added gopro hero11 black #136
- removed a dup of a Mediatek MT65xx devices https://sourceforge.net/p/libmtp/bugs/1922/
- rename some LG devices to match reality better
- rename 3 blackberry to correct vendor/product names
- added realme Phone
- updated some mediatek id names, removed some duplicates
- adjusted various id names https://sourceforge.net/p/libmtp/bugs/1926/
- fixed order, https://sourceforge.net/p/libmtp/bugs/1931/
- some more brand renames. https://sourceforge.net/p/libmtp/bugs/1930/
- adjust some device naming https://sourceforge.net/p/libmtp/bugs/1932/
- added Vivo V19 (fixes #143)
- added Garmin Forerunner 255S Music
- rename and merge, also reshuffle to sorting ... fixes https://sourceforge.net/p/libmtp/bugs/1933/
- added Garmin Forerunner 255M smartwatch, fixes #150

Signed-off-by: alperak <alperyasinak1@gmail.com>
---
 .../libmtp/{libmtp_1.1.20.bb => libmtp_1.1.21.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-connectivity/libmtp/{libmtp_1.1.20.bb => libmtp_1.1.21.bb} (95%)

diff --git a/meta-oe/recipes-connectivity/libmtp/libmtp_1.1.20.bb b/meta-oe/recipes-connectivity/libmtp/libmtp_1.1.21.bb
similarity index 95%
rename from meta-oe/recipes-connectivity/libmtp/libmtp_1.1.20.bb
rename to meta-oe/recipes-connectivity/libmtp/libmtp_1.1.21.bb
index 41fc46c31..94cbef8fc 100644
--- a/meta-oe/recipes-connectivity/libmtp/libmtp_1.1.20.bb
+++ b/meta-oe/recipes-connectivity/libmtp/libmtp_1.1.21.bb
@@ -19,7 +19,7 @@ DEPENDS:append:class-target = " ${BPN}-native"
 
 SRC_URI = "https://github.com/${BPN}/${BPN}/releases/download/v${PV}/${BP}.tar.gz"
 SRC_URI:append:class-target = " file://0001-Use-native-mtp-hotplug.patch"
-SRC_URI[sha256sum] = "c9191dac2f5744cf402e08641610b271f73ac21a3c802734ec2cedb2c6bc56d0"
+SRC_URI[sha256sum] = "f4c1ceb3df020a6cb851110f620c14fe399518c494ed252039cbfb4e34335135"
 
 inherit autotools pkgconfig lib_package
 
-- 
2.25.1


