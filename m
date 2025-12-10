Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94A3BD3C913
	for <webhook@archiver.kernel.org>; Wed, 10 Dec 2025 14:17:03 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16658.1765376223353677336
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 Dec 2025 06:17:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HhipXsyr;
 spf=pass (domain: gmail.com, ip: 209.85.210.170, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-7b9215e55e6so4540829b3a.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 10 Dec 2025 06:17:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765376222; x=1765981022; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j+cIWljSgoB3nGA1g8Z3ufHLu4uL9XS6WAIs/ObdnLI=;
        b=HhipXsyr6xOqqfmCfOAPIUbW69mzOI8pVS0NfO5n9ORfuBSAiStL29oGApNrAXwLd3
         f3+3iwbJjZMv4gEX54p3wOa/mki/xbSqKptzhzheCttpwnkAtHeEbgo3d4GeMhOQ5jW6
         sOAGTgKTpdaPL8QhHbmEzVyvht+JIX/jXf2Y2rl1CUV5PNw5DfqxaWz3xTbX7vFuCJZ0
         gvXiV++M7a6CcKTWZNj2FEPS5/cPjcyM4HASli1QpoPwRP8s4TYMMhJoVPkvL8D2UbtS
         +G1GXbzY4EdEAc4xU8ZHwPrzbS/gDJ//nwuRQGbtVU+U5u3AVDz2RwwlWbYlyFbDXBG7
         o7IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765376222; x=1765981022;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=j+cIWljSgoB3nGA1g8Z3ufHLu4uL9XS6WAIs/ObdnLI=;
        b=jFl2FAYmOayT6E4ny9S6cmLX7Ofo/abALFJQwJeIPwEtWfXbO07wvq8zj96zWu0iIV
         VWXC2A5yywrc8E7oxwQo2uZpVmaqA1WP95rU3H6+Cu8yFH1nfOOqcCaFSeWvLa5qQ6w/
         HGfQOWhho878UhZr9rPgefs/m3YuNS5GfRmic+ej2MOzuSjKsyx3d/Ft9xGdcdHlpYak
         ItEFvqb+6LVj48HHzjM5GwKjx5K+28novwYnuAVRPUwRt03qFo+tIu0ifC5OMde44xID
         uTiu068jE8EEuXTNhNWtfDA4a66nlZramC8xnvtEqecfE8k83jipJIdp/XU3nNMid9qY
         V9Uw==
X-Gm-Message-State: AOJu0YxZeLWOv0Y0GA0wS1gNAaPn1xsbGcY8xNKnseeHy9Al2lufu2Iy
	h0FTbq07vbY01p+3tKZfu3lpzyCZqLjv7ynWj0ffLTE/w2RiqX8UpfXZpTGYRE9B
X-Gm-Gg: ASbGnct+LrB6PbYb0xr43dgYSnTbS30QVB5T94ljYGwbxDHA1shRZlw+8Ue5h5c2kbT
	RG+ys7cRw3bAMxw53RmCUCLWd6cvzZtgaprF/S3PvAwr8uS4cHd1v/zKkrypNl26fdQhGFr1aj9
	iEKS7EAAAtwWWj13shF0p1PJ0LNC3axdlUdJtyL/gQ96DVOtyxz4oiQ5XpB1NGSA7g79syEMLXv
	FdTlia6vsgzVvdjgh4ohOhgIp5uNBbmnHdIH0RN3Xw9RziknWZWZv6zEVmxmlie1vV3cULL3AQw
	TF3QV1lQ0Dj92QvXjes27XbHfyRIClbQVGRy238LdGDaM6JchVhJ7XVNspWQ/g2vyaUoGsecnhJ
	UntTBA2yxZQ1g0smSbxJojRQzAzBK+UTyMhTX+AYyIpTX7/xrNSndyQWJS3gy/MibuX4I0w37S9
	Gz4Doyd0bKOziPWDTrG/S1J+w=
X-Google-Smtp-Source: AGHT+IHZebA/fKJNM9fb93DGjFXf4NX4a7JdpszwgnmeLVt2r4WrUWeMb0QeQx7zFoCCebLce23pqg==
X-Received: by 2002:a05:6a20:3ca5:b0:342:1265:158f with SMTP id adf61e73a8af0-366e299a0f7mr2556484637.51.1765376222360;
        Wed, 10 Dec 2025 06:17:02 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([122.161.48.114])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-bfa0ad20207sm15955166a12.11.2025.12.10.06.17.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Dec 2025 06:17:02 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Valeria Petrov <valeria.petrov@spinetix.com>,
	Khem Raj <raj.khem@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-webserver][whinlatter][PATCH 7/7] apache2: upgrade 2.4.65 -> 2.4.66
Date: Wed, 10 Dec 2025 19:46:39 +0530
Message-ID: <20251210141639.1397030-7-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251210141639.1397030-1-ankur.tyagi85@gmail.com>
References: <20251210141639.1397030-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 10 Dec 2025 14:17:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122555

From: Valeria Petrov <valeria.petrov@spinetix.com>

Security fixes:
- CVE-2025-66200
- CVE-2025-65082
- CVE-2025-59775
- CVE-2025-58098
- CVE-2025-55753

See: http://www.apache.org/dist/httpd/CHANGES_2.4.66

Signed-off-by: Valeria Petrov <valeria.petrov@spinetix.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 220835dac9a39dda9112dcd5383aafc9ad552590)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../apache2/{apache2_2.4.65.bb => apache2_2.4.66.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-webserver/recipes-httpd/apache2/{apache2_2.4.65.bb => apache2_2.4.66.bb} (99%)

diff --git a/meta-webserver/recipes-httpd/apache2/apache2_2.4.65.bb b/meta-webserver/recipes-httpd/apache2/apache2_2.4.66.bb
similarity index 99%
rename from meta-webserver/recipes-httpd/apache2/apache2_2.4.65.bb
rename to meta-webserver/recipes-httpd/apache2/apache2_2.4.66.bb
index 58b324795e..630c6f3b1b 100644
--- a/meta-webserver/recipes-httpd/apache2/apache2_2.4.65.bb
+++ b/meta-webserver/recipes-httpd/apache2/apache2_2.4.66.bb
@@ -27,7 +27,7 @@ SRC_URI:append:class-target = " \
            "
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=bddeddfac80b2c9a882241d008bb41c3"
-SRC_URI[sha256sum] = "58b8be97d9940ec17f7656c0c6b9f41b618aac468b894b534148e3296c53b8b3"
+SRC_URI[sha256sum] = "94d7ff2b42acbb828e870ba29e4cbad48e558a79c623ad3596e4116efcfea25a"
 
 S = "${UNPACKDIR}/httpd-${PV}"
 

