Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1930.1795113445609774978
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 19 Nov 2026 10:37:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=HGIp7z5k;
 spf=pass (domain: gmail.com, ip: 209.85.210.170, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-8b32bc605d9so65963b3a.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 19 Nov 2026 10:37:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795113445; x=1795718245; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CLdCTqlWM0H0cvWlAnTqePj86xboanTt1ubb22MuLg0=;
        b=HGIp7z5k+MvStdTEgOISJPkd4EwXgHKjTPMvrXPa+UtzeIeXJPqZgqyGbT0nr1yGFJ
         E0vF5bpV9Sc2tMmhh/ZVr61XzBdWVjKQZcOPc6Yc16O9sqKEAKMAEG/yQiuZ4+n4OlTD
         IGS+8lawWhCoDUR6BT/DfxT9I9McALSESz7/Wtnm2Ky6SYE3q3Wj2G/NtL93eB34ssy/
         ubQcq7O3OT0w9pI75PxoZk964FW75UNOUQQpfHBo0hF+4P0Qnk3TgMceezhwixkQmrJj
         IY0NkUqa01jy7CnbclbtMsG+bSxElZI3l6A5kV++P9Jz11M7P4W0IcQuu4LUSLYBjJXD
         2JAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795113445; x=1795718245;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CLdCTqlWM0H0cvWlAnTqePj86xboanTt1ubb22MuLg0=;
        b=rc3+e7HFtxG4BHEf71r/jj8Y97fvELpnt8g8Np9EgJ/3Ocbyrap6XYBQn2+E5IFBnd
         PXQF+MKJp72TXMv4DZ5i8/iMDeBr7wNM4VDPFDKAnZzumQxSOm09gXyptG8Qy6r0F6+P
         E67nzLq92qzWORd+QKZ5pQthBA5Ka0oa60Nn0+Sa0W5vIIX5m1mrKUVeMxdSkCnSW9RF
         qUTN3y1usOm0CVqOnuSxcliVa9fylbF1qymqSSYTyeStsMbjzYc4IIjMF2MmWKDAP1rc
         tux0sNYXDIeQqwwGEmyW5VrE+5Wy8l7eVZd2748rnB6I7ls4DH9PyLXGmzVJ6/YFKsM/
         beTw==
X-Gm-Message-State: APuU4Z80iuyUtliGtfsiYacVO/1tQGpggT7UROqb1ACiamUYaCMq0Zfc
	iktMWqGprxKtRuvdf7qYO9bR0ugMd0UZoyEBHoDz+sERSUE6LxVrbI+6vyP3mQ==
X-Gm-Gg: AYBFou0jD7BMHJ+W+dWRaQKXiL9lSd68Vdf89okd2TRT6qJw5L4Wx7TKrU75VzxKD2p
	YCqHjj5kPXBqfi1IJC0xR9lq9sAGT9v8qP2jslh27hqc3vauanSuJefsLP9ZA1Ip4mlypDOtdCq
	npkbXarCYHyEZI2U46DmHHYOzojdUiPnIxYYmkTtOZCmbR64ksDzCxY7A36b1uOBv2p6C02GR6K
	ghHBWZHHOmkNqcSq6NEZnMxGo6qj1XtGRQpADRD1/IcfkljLbFZBWRSu5/IskaMM1WOff82Y25o
	zUHLX25hHrcQeWbLTC8mA4fWTrHL+yXhdhJKA06imMD1e5YR7z9lY4eAhOUTAEHGz/pAa8KfqCn
	ojdqx7WN12rhE4yXC5p0Fcu1Mhp6RicI2GEmI1laxydxkgpkLZ3TJVqAAZ3ZCVl4eyFkyKNY0MJ
	hC7kuZCwY0sT9D2YMDO31dgrbs5ArY8Ap1zdx9BhRQaOvdsUVXXaUy3/IxHQ+2rw7TiUEoPfNiu
	0jwpR3H2M25cDvhx0GphGBaJ2upHR0Lb4MTMTmsUVfafQqXdKmEcUAVY6RhsppKxP9COGxSUeD9
	1bsKveDXEia342Sq3ncD9FBT+/3LQ6DAfv0VCiZwjxyRwDT38OCAH4MxElgRxA==
X-Received: by 2002:a05:6300:404c:b0:3fb:5869:81f4 with SMTP id adf61e73a8af0-4014b565489mr500551637.36.1795113444849;
        Thu, 19 Nov 2026 10:37:24 -0800 (PST)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.. ([147.161.217.9])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c872e4d7basm294518b3a.21.2026.11.19.10.37.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 10:37:24 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>,
	Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [blacksail][PATCH 35/64] libopenmpt: upgrade 0.8.9 -> 0.8.10
Date: Fri, 20 Nov 2026 07:33:03 +1300
Message-ID: <d8cc96a29f95943586507a59046de4a3b262cb0b.1795112941.git.ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1795112941.git.ankur.tyagi85@gmail.com>
References: <cover.1795112941.git.ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 19 Nov 2026 18:37:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132725
Content-Type: text/plain; charset="utf-8"

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://lib.openmpt.org/libopenmpt/2026/10/31/security-updates-0.8.10-0.7.22-0.6.31/

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit edd7b9726660848cf3785b6b7c07bd543af7f6a3)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../libopenmpt/{libopenmpt_0.8.9.bb => libopenmpt_0.8.10.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-multimedia/recipes-multimedia/libopenmpt/{libopenmpt_0.8.9.bb => libopenmpt_0.8.10.bb} (97%)

diff --git a/meta-multimedia/recipes-multimedia/libopenmpt/libopenmpt_0.8.9.bb b/meta-multimedia/recipes-multimedia/libopenmpt/libopenmpt_0.8.10.bb
similarity index 97%
rename from meta-multimedia/recipes-multimedia/libopenmpt/libopenmpt_0.8.9.bb
rename to meta-multimedia/recipes-multimedia/libopenmpt/libopenmpt_0.8.10.bb
index 3b4be321cc..fd3e05a2d1 100644
--- a/meta-multimedia/recipes-multimedia/libopenmpt/libopenmpt_0.8.9.bb
+++ b/meta-multimedia/recipes-multimedia/libopenmpt/libopenmpt_0.8.10.bb
@@ -14,7 +14,7 @@ DEPENDS = "virtual/libiconv"
 SRC_URI = "https://lib.openmpt.org/files/libopenmpt/src/libopenmpt-${PV}+release.autotools.tar.gz \
            file://run-ptest \
           "
-SRC_URI[sha256sum] = "d7ce84fd05d686c4bcf66af40eae857afa371442db60eeda3f874bd6cf6fc318"
+SRC_URI[sha256sum] = "976d259288c40cd285771f77d09eff3d02514511d5677ecfcfb53be5013317e2"
 
 UPSTREAM_CHECK_REGEX = "${BPN}-(?P<pver>\d+(\.\d+)+)\+release\.autotools\.tar\.gz"
 
