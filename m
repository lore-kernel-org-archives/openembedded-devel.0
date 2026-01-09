Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42828D277C9
	for <webhook@archiver.kernel.org>; Fri,  9 Jan 2026 23:44:16 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1256.1768002246677372179
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 09 Jan 2026 15:44:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=RofJbs4Y;
 spf=pass (domain: gmail.com, ip: 209.85.214.175, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2a0d52768ccso33382555ad.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 09 Jan 2026 15:44:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768002246; x=1768607046; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZHnEarxl44aXmkh9c1xGh6gfgGR97URgcZKD3lIpKxE=;
        b=RofJbs4YL5kf7z6+VzyxKkwjYw0RMxdiSXZrmEJgAa/hCDK6irJVXjpQ8LUagF40uG
         GeO56ht8xZGbUVD6RFU6LKWjrY6Cti6bnSF0B3UGif6EXalPKwDhuABiMoWDps8NuXDz
         Xi37wo4vFp2F44IlkQo7KifkQhaduMidy4zYgUKBBrCUSX/PVGPu0/Ph/7KEXGMR3Xrv
         NTEooPdDen75LeP64K/NMRewh4B+PryIgSghVi5ryeN1SNoGM8g5K4NLJolP4CkVGSvh
         xN4ywNLFkcaRot9Eiy04CghTUvuKgc/NV4Z6fDYzcJXNFM0eSXEvNf+jtY/8RQqalAO4
         IdYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768002246; x=1768607046;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZHnEarxl44aXmkh9c1xGh6gfgGR97URgcZKD3lIpKxE=;
        b=u0AIlrFuUDdJMqMsPCAQL3cussWr1wG9sihyWbUhShXnqgqKY0ZBYDMY32FgYOYrIS
         FQYI9eUfsX2Rs28aTUqhUb6DzZCtf/CvFX8RptoA+6xV09CYDi1WdfZbWLIWoGwtHDrb
         dzjb2PzdLsJJff5j0hKdyc2OqxQPeDrKthaYb9syluLCLz3ueNZ6hvxHQ//TIv1+If2j
         3+ruBw4AZqlfru5WbTBEbxQFlfiLn2m64WCnHT7DD1NUX5MNZl/ZmXLfasGcLdeTVOGy
         w2V+zHCBnib4Kh371hBGFcGL97S+obNX820Tc78Xn40MlHLHCan5t1fkpx1IJG7rMLHv
         r/nw==
X-Gm-Message-State: AOJu0YzLhuzBrRpkgStfRYOQXc8P0AUPtmJCpLj2QaxWx2mhvI2ppt3U
	UfM8jUk1ORvxn/LDGn1CXuKIVJkhKxN5VBXqJh3UesqdoJHvpgoITQZoqII/Mw==
X-Gm-Gg: AY/fxX5KJLZQ/RFHBRT+0XEWF/AfBsCorIt5i2VPyUi5shce4ufqOO8HTaZEPWS2GJO
	9fS/3fn6mV9Yy5LyDuRQvVCgwE3Xwku29Of/2LSeypQJVqfx9MVleRAKnFFnz8TBoHamtXXTbBE
	1BaUNQYv1bG94i2w0PqmxEcDw4bFTWtlEHZsibb30xpwIuuFM6V+0RmFy9zc78IhgrYMoeL/IV3
	wWKZ/tgVE2UVS21G2sLKAAlIqM3icLImIo+IjhLB3ljdAR6f12F5VphqGgWHdX027KwVTL+O5GW
	XvWNOdiYm8Jm7KIqCEOHrQMMVuUdhWyVy4MQypN1q7XgqmkklMeXiwsYLYfOyB7wrrwmwz13s/q
	GV9TBvaU7ZHQ5+rsm3cjc2yD6LiM/FAzuS6LzYwas6QaUzVFCiNHJQTfBVAW2PFef5CWnbfwqLn
	KG8elS5V+QhLTV7iTypw0qyYk=
X-Google-Smtp-Source: AGHT+IHGXPQuUSp0jxyRCURIS2qd8N+tZgVY0WotcX+zEZMS1/jaisgfekw8cXHmwl39M91tnAfG2g==
X-Received: by 2002:a17:902:ef46:b0:27e:ec72:f67 with SMTP id d9443c01a7336-2a3ee468629mr113975825ad.6.1768002245807;
        Fri, 09 Jan 2026 15:44:05 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([167.103.127.10])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3c3a31dsm113934675ad.9.2026.01.09.15.44.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jan 2026 15:44:05 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-multimedia][scarthgap][PATCH 4/5] vlc: patch CVE-2024-46461
Date: Sat, 10 Jan 2026 12:43:45 +1300
Message-ID: <20260109234346.3098858-4-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260109234346.3098858-1-ankur.tyagi85@gmail.com>
References: <20260109234346.3098858-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 09 Jan 2026 23:44:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123316

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details: https://nvd.nist.gov/vuln/detail/CVE-2024-46461

Backport the patch mentioned in the news[1] that fixes this vulnerabililty.

https://code.videolan.org/videolan/vlc/-/blob/3.0.21/NEWS?ref_type=tags#L44

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../vlc/vlc/CVE-2024-46461.patch              | 44 +++++++++++++++++++
 .../recipes-multimedia/vlc/vlc_3.0.20.bb      |  1 +
 2 files changed, 45 insertions(+)
 create mode 100644 meta-multimedia/recipes-multimedia/vlc/vlc/CVE-2024-46461.patch

diff --git a/meta-multimedia/recipes-multimedia/vlc/vlc/CVE-2024-46461.patch b/meta-multimedia/recipes-multimedia/vlc/vlc/CVE-2024-46461.patch
new file mode 100644
index 0000000000..868eb89cac
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/vlc/vlc/CVE-2024-46461.patch
@@ -0,0 +1,44 @@
+From aafb226321a525169fd68bf4708e7c6f15e4307a Mon Sep 17 00:00:00 2001
+From: Thomas Guillem <thomas@gllm.fr>
+Date: Tue, 9 Jan 2024 06:58:39 +0100
+Subject: [PATCH] mms: fix potential integer overflow
+
+That could lead to a heap buffer overflow.
+
+Thanks Andreas Fobian for the security report.
+
+(cherry picked from commit 467b24dd0f9b0b3d8ba11dd813b393892f7f1ed2)
+Signed-off-by: Jean-Baptiste Kempf <jb@videolan.org>
+
+CVE: CVE-2024-46461
+Upstream-Status: Backport [https://code.videolan.org/videolan/vlc/-/commit/e7f98f3632d793c3921bfe72595721af191e670e]
+(cherry picked from commit e7f98f3632d793c3921bfe72595721af191e670e)
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ modules/access/mms/mmstu.c | 8 +++++---
+ 1 file changed, 5 insertions(+), 3 deletions(-)
+
+diff --git a/modules/access/mms/mmstu.c b/modules/access/mms/mmstu.c
+index f795b0bd43..f10e38cd43 100644
+--- a/modules/access/mms/mmstu.c
++++ b/modules/access/mms/mmstu.c
+@@ -1316,14 +1316,16 @@ static int  mms_ParsePacket( stream_t *p_access,
+ 
+     if( i_packet_id == p_sys->i_header_packet_id_type )
+     {
+-        uint8_t *p_reaced = realloc( p_sys->p_header,
+-                                     p_sys->i_header + i_packet_length - 8 );
++        size_t new_header_size;
++        if( add_overflow( p_sys->i_header, i_packet_length, &new_header_size ) )
++            return -1;
++        uint8_t *p_reaced = realloc( p_sys->p_header, new_header_size );
+         if( !p_reaced )
+             return VLC_ENOMEM;
+ 
+         memcpy( &p_reaced[p_sys->i_header], p_data + 8, i_packet_length - 8 );
+         p_sys->p_header = p_reaced;
+-        p_sys->i_header += i_packet_length - 8;
++        p_sys->i_header = new_header_size;
+ 
+ /*        msg_Dbg( p_access,
+                  "receive header packet (%d bytes)",
diff --git a/meta-multimedia/recipes-multimedia/vlc/vlc_3.0.20.bb b/meta-multimedia/recipes-multimedia/vlc/vlc_3.0.20.bb
index 21bc408f6d..bf34146e0a 100644
--- a/meta-multimedia/recipes-multimedia/vlc/vlc_3.0.20.bb
+++ b/meta-multimedia/recipes-multimedia/vlc/vlc_3.0.20.bb
@@ -25,6 +25,7 @@ SRC_URI = "https://get.videolan.org/${BPN}/${PV}/${BP}.tar.xz \
            file://0006-configure-Disable-incompatible-function-pointer-type.patch \
            file://taglib-2.patch \
            file://0001-taglib-Fix-build-on-x86-32-bit.patch \
+           file://CVE-2024-46461.patch \
 "
 SRC_URI[sha256sum] = "adc7285b4d2721cddf40eb5270cada2aaa10a334cb546fd55a06353447ba29b5"
 

