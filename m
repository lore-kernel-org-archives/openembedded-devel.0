Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3795.1794728964752748643
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 14 Nov 2026 23:49:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=feJ5DOQc;
 spf=pass (domain: gmail.com, ip: 74.125.82.181, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso1428544eec.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 14 Nov 2026 23:49:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794728964; x=1795333764; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zLRq3YOSO+R/0/GMZT0rSDG3VNV5/0Xp3yugQmjvYn0=;
        b=feJ5DOQcUkqdzn4wXJOYiXbqEK+FhTabvHPJLMB++lYLsENfocIWl5pMqqN9Mxns50
         NW3gNYfT48//PoabkPRwfYNjzWtlHUbXJK05WJYAPu6jKUc374Ddv18hJC2/yE1i+7lq
         wCDydscvplt1Q5JKGiqkgv40lsboqQ3o3G2Lo3WXXg6MsTA/jg+CH/eFipx5oLvfHuGW
         FHTjNTaKdZ+PGyimacI6ZqzBRfvaw32RhbdlE53wPALTBEIubJuS2sy5iWnRgZYD/ip2
         RGGBYDN/0MrCcxZnbiG+j4VlvPEwVR1ClpsWhkaaWuXzErxL+RNxoYnnfxuWGFZjCw7A
         zhcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794728964; x=1795333764;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zLRq3YOSO+R/0/GMZT0rSDG3VNV5/0Xp3yugQmjvYn0=;
        b=PnGCxBBbLryUahhzLzUwfAeWTUwnD1d7tYRBVTpnWj464dZzhPFnmTaQM4nmyIP1TI
         4ynMr6wrz14SGmO/GKyzssZkBX32BKFB0C1AhrSmKSikvxL6rAbIKB/V2wwl3YOoOqdx
         BcPBUtK0aXZbTGD9XQCTLoe5OekVRxxaxoynysxUWFvndDmwqneVI4eoGj124IDgxOyr
         v4+Slmezo3H3SgiebPk8opxN6TGHQZtItL+7OVEqZQrzBNssamlgFWaFIq8G19CkbXTW
         1tZV6dliWzsXYzHnDMRFdV6ZsyifZa3RO8YnGbKXXHdg+NWbTNn+L8AecoHAJWxxJgNA
         9p9g==
X-Gm-Message-State: APuU4Z/Ky8bx+ibhtSobNGdRTBUmnCK8dS/qpkbthC2c9Wp0u1kK3r6n
	2CK9t0Kg9RxEeqIh1ONljBb75LgqCQVGp7sNTAh/k/TC5Ti10jPCTe1Ka0ONz+fe
X-Gm-Gg: AYBFou3iPBMqajDSxcLVHTJseE6GO6EgXRaZOM+Of0QDT347KGaj4r/RVS5QOhB4oAS
	szvYg+wueR6uWEWKpORiEnkCxlNI9qxj0cU78if/pPyUeITEJFElOR/Mpcfvq7jjqQiO+yJxjqC
	tcCtdbxaA1rZY04itYh7fItLNLaLcT0srueM8WNX/B9DdSxxXo5mB+mtmpc7HnJ84iWjgMtM5oq
	53QP1TbshOffi28C7FmCM6c+HttSBuWG2fEHCBOYnxt7WHoqQ4U8EFV1gZ0Sv4GF0Ibtz7AbSoq
	2ctPpEvdZocvjK3G9Vr2VkQBtC3x7y+hTL8HoL56+yJFhvdKMVpwr9RtGy3S5QRRTHylrHjkG3t
	kj2FX3Nn2XfTVdqp5zRU/G9v5eyEGtO0YcM120vn/CqWRNp4+X7w09Q97CIDwZ9l0iUDNyRXCg5
	77CvvPIxQRyce3UROVsq14SfecH1F/BasMUfMUype3zlO8BeXn5RNYpNJ9G5tTIYnZoR4UzlM+g
	bm1vQqQEPv0jo/kB5Dx6a5a5DX9Vgyj7Z4oY03r3/UOUq+B685+pKH+FJEHx0hkuUxAiJD+Ibta
	GksYng3r9hBZ4IvvTeEzyBA6YKJD6R5WTk3KV4FjB4fk0mJEFBZiMp6ZPGAm1LOB652dNdVjJLN
	NhCoSzDERNVOcMneWE7r4ZgS9+DkIwwqw7iks4d3+r6IvLoJEPMfxPwPSpfjSmvx+P1ijDfmTKP
	DKlTtgjYtIi40uf8chmQ+DcGiIdlfREIB/ReUJbBk2p5RKUK+RZZhoCACeNzWVS25RxzEk2C8kn
	4fiJmwqPB4YE8wCY+wZ9TFIZ0fEjVdXt2qrhYVTCNDNQIQFi20RAJZj04bUw4on5WLcH5UsViqs
	VUXv
X-Received: by 2002:a05:7300:6b28:b0:376:bcc4:774b with SMTP id 5a478bee46e88-3796638ab4emr7639937eec.23.1794728963886;
        Sat, 14 Nov 2026 23:49:23 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3795591f4f8sm23112817eec.13.2026.11.14.23.49.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 23:49:22 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 02/96] ctags: upgrade 6.2.20261101.0 -> 6.2.20261108.0
Date: Sat, 14 Nov 2026 23:47:40 -0800
Message-ID: <20261115074918.2932593-2-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261115074918.2932593-1-khem.raj@oss.qualcomm.com>
References: <20261115074918.2932593-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Sun, 15 Nov 2026 07:49:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132272
Content-Type: text/plain; charset="utf-8"

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../ctags/{ctags_6.2.20261101.0.bb => ctags_6.2.20261108.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/ctags/{ctags_6.2.20261101.0.bb => ctags_6.2.20261108.0.bb} (96%)

diff --git a/meta-oe/recipes-devtools/ctags/ctags_6.2.20261101.0.bb b/meta-oe/recipes-devtools/ctags/ctags_6.2.20261108.0.bb
similarity index 96%
rename from meta-oe/recipes-devtools/ctags/ctags_6.2.20261101.0.bb
rename to meta-oe/recipes-devtools/ctags/ctags_6.2.20261108.0.bb
index db0718748e..f7502f0774 100644
--- a/meta-oe/recipes-devtools/ctags/ctags_6.2.20261101.0.bb
+++ b/meta-oe/recipes-devtools/ctags/ctags_6.2.20261108.0.bb
@@ -14,7 +14,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
 
 inherit autotools-brokensep pkgconfig manpages
 
-SRCREV = "692cde832a9b0bc74ad5bebdbed4768b00435436"
+SRCREV = "394badef3b67abfab30841ec1ecc541b030fff13"
 SRC_URI = "git://github.com/universal-ctags/ctags;branch=master;protocol=https;tag=p${PV}"
 
 
