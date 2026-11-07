Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6377.1794046330384286326
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 07 Nov 2026 02:12:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=L+T13UBC;
 spf=pass (domain: gmail.com, ip: 74.125.82.42, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-14394530ec6so2033908c88.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 07 Nov 2026 02:12:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794046330; x=1794651130; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AVOmk8CbeXe1rEac3PitrEtuFE7aQEHcHeOIKVo/4Tc=;
        b=L+T13UBC9dq5YZr2flX64vHWeSB3pPgiCIbB1BACMfzqlK7IKRTO+qNIRWMo6CHe7v
         BY+QDxIXR/VIDW+m+nbXnZ/Q8/Gc5e7WCbCmf8q2s7fKxdBfV4QlxrzUMrr0+MKoY7u+
         UEIDjpnXSBa6OPqrgd6OcztPhIiT2pYSUhL0mHPIxmWPDYw9Ix2trNQrHHors7ljxBwK
         R6WlehdNG3+88Mb8QZ+kzMi/yJx0xuwqXTL9n7a+5aUXwaDsJv2+Vjw6aZE9dTFxsaQ0
         gRwR9jvWextOtjvALAdfy/T1Gz3bQ1In6c2I2HST6sM69JZ5FYucebSLngcmH/VjDM8/
         VFqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794046330; x=1794651130;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AVOmk8CbeXe1rEac3PitrEtuFE7aQEHcHeOIKVo/4Tc=;
        b=mkIkxT6wDofEVS/yN2zm5Kjzat7AwgeOjbwFHviPA8Ompb0I2XYetOZ4vIlNTsvMd5
         ALUAbo6NnwXpdfHBz+cQQrZDsoQtNgIoRL2Am1AK6oLEl47zbwcNtY3s2NybxIrPQRPA
         3VaA5UsP4XN/yicll738g6rV5wUwwUFt4sf6HwiASJRhnS5GcJ4n9WKXxKo4tVm7gz7M
         vHVfJvNwdY1oQZe207tCZHur7A6EORG5gRrr0EDPQczxHbkmK0n6jhfzJZ/a2I5UNE4z
         X+YZPtNKb8Fnh1Vxgm3QTPO2g/+hywyUozjgfobXoYKmiiYiOfJPpLM1ajLeTsKbddlU
         tjgg==
X-Gm-Message-State: APuU4Z94vezKZSOZPI9uY53SKcsTUS3y4vngftEqGfnSTXEXvQBVyQ4y
	eV4uEF6Tq7d+vFYkx7UigPZ5iN+6FlCSpuG95hkhhR+EXh+wnGKU0PNy2cEMcw==
X-Gm-Gg: AYBFou3lJXtAYa9Ny3RD9FjAgTq0V59ueV0OU3eF/I2yAurxCD8/0jjGsnsSOkTbwNl
	jazV5AzHeMOKFm5AfX6J8pRwec+rJtbxC6GTymj/r/ZFeeUoJlA3qp5Z0TXVpddZtYkW4jKmlPR
	PEHUbgkr4gNF7M31t5LpbQITjSCSsoMnD07iYQGLd1jKGPlP0J/byGbnHdmitcsYSKFmjrGF4Yo
	tyOBdFafC/WbfCqH5KO6XJGIk6Xvbwpt4JoUCgOv6Ip4oHV2UhqOf5VENMvG24vX/n+rbKwaT6d
	GsiZwJneEISqBHs99UBKbx7FiFJMQl3LAtNGHUdlSFTMoRuJF9Zl+a6pxuih2C5zbvUg1usITWb
	GRoXTI2gRcIiULs0OuH+H/C8HW4aPPyrSpHp7kTSsTTM0kXBjZDjoEvTZEE6X5vfBfTSdGdR/VT
	Zsks/OYo39CPKwKe0xfjCoDaFE9WCPjkspg6BcjlKo6bkKL2bhTk2KcwjhvKXwAxbiPgzgsJJ5H
	fMydkP+8AbmT211waVaIfWkTbMWuTs/WSnvIR+r5mnybjldHdkX6EAYzDKiRNcmgfwY9OheYzSo
	VeTNV/2OoG13Qn0P7uUap6dNdOj9X+hvW2Xe4M0hmsY+oy+VPDUfYGfaNvdPCA==
X-Received: by 2002:a05:7022:296:20b0:1b2:6bfa:3db7 with SMTP id a92af1059eb24-1b26bfa3deemr1258754c88.0.1794046329630;
        Sat, 07 Nov 2026 02:12:09 -0800 (PST)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.. ([147.161.217.9])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b25e4840f3sm22856467c88.5.2026.11.07.02.12.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 02:12:09 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-multimedia][PATCH 5/11] wireplumber: upgrade 0.5.18 -> 0.5.19
Date: Sat,  7 Nov 2026 23:11:48 +1300
Message-ID: <20261107101154.2992152-5-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261107101154.2992152-1-ankur.tyagi85@gmail.com>
References: <20261107101154.2992152-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Sat, 07 Nov 2026 10:12:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131979
Content-Type: text/plain; charset="utf-8"

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://gitlab.freedesktop.org/pipewire/wireplumber/-/blob/0.5.19/NEWS.rst?ref_type=tags

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../{wireplumber_0.5.18.bb => wireplumber_0.5.19.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-multimedia/recipes-multimedia/wireplumber/{wireplumber_0.5.18.bb => wireplumber_0.5.19.bb} (99%)

diff --git a/meta-multimedia/recipes-multimedia/wireplumber/wireplumber_0.5.18.bb b/meta-multimedia/recipes-multimedia/wireplumber/wireplumber_0.5.19.bb
similarity index 99%
rename from meta-multimedia/recipes-multimedia/wireplumber/wireplumber_0.5.18.bb
rename to meta-multimedia/recipes-multimedia/wireplumber/wireplumber_0.5.19.bb
index 3b8494d124..f925aad8c3 100644
--- a/meta-multimedia/recipes-multimedia/wireplumber/wireplumber_0.5.18.bb
+++ b/meta-multimedia/recipes-multimedia/wireplumber/wireplumber_0.5.19.bb
@@ -10,7 +10,7 @@ DEPENDS = "glib-2.0 glib-2.0-native lua pipewire \
     ${@bb.utils.contains("DISTRO_FEATURES", "gobject-introspection-data", "python3-native python3-lxml-native doxygen-native", "", d)} \
 "
 
-SRCREV = "81606cbb32d29df20147d1b68b662c1082654d81"
+SRCREV = "4ab992fa2931ae2b17ef73508b1370030b7878c3"
 SRC_URI = " \
     git://gitlab.freedesktop.org/pipewire/wireplumber.git;branch=master;protocol=https;tag=${PV} \
     file://run-ptest \
