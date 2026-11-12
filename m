Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3822.1794510193199317583
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 12 Nov 2026 11:03:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=gy5suKmH;
 spf=pass (domain: gmail.com, ip: 74.125.82.45, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-1b3ada81853so52476c88.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 12 Nov 2026 11:03:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794510192; x=1795114992; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=tXkxQELYg635CFqZE3Vw5usvsv9ttb4ELo6sutXJ9LE=;
        b=gy5suKmHo2kuWl1YKFomd/tefx526TBKjFrC1O26JtuIT3AU+MXyq5xhg5XmNhZIpO
         lu6O36/rfpPd4V72s2Nr38sqtAc0xONETzmLHUPNQNfBoDDq4GVIobwWBFqO1h7rGvNw
         aRNJNGq42eaKXz02jkH+pu5oAHb2xGXGida9U/QCyENIVJV0VNsW28Y4oIO/Xn9a7iga
         5+vv/XYFJuFMEgDHvcXC4uuSWTRQRAyLGYg5edR/0LQ09rJyCU6FRm2n/DC9wl1JhAkn
         TbGHrYvcxOBHswS2bGsTWQz8Z1pcPIMQ5bjEoI8+91lSDFvQ1iQZ1qua6y8W89JNafhd
         LErQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794510192; x=1795114992;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tXkxQELYg635CFqZE3Vw5usvsv9ttb4ELo6sutXJ9LE=;
        b=hjKU2u4GlzdTtb7Y2kt5rKLaaufp9E7HD6GeQETTsQLyE4+Zqn0Ap++fER9OWMj8QD
         bvThfNLf4TM2iBNiRjB2MGw31WRC0h8y00I1XiqugVdSjKrO1/rOo6xm0/bz2ufpvclN
         GmwnS+RLjQIxuxxuUJYrVHZmo2rDLEmW/dxJ3L9kl/000KufpcyJ9OeGBDG6GgGzjVSK
         wYhg72eUACVF9yJWsFzp82pIhUdCb/RYkU9VKVhcwVOwV10Nzhl1HBw8nHWGthqLciT+
         TVNz/ZvDUdEB50PEm/1UfNXk86g4ff6heS5qV9l8gDNlQsHtx3uVZh9LpVCybltXwvfN
         GQzQ==
X-Gm-Message-State: APuU4Z+Ts4Or5D0oeiO7BEg+ffwOKUDL6Ddt+gaRO9yU/yYi4zwgslSZ
	/CdwQcQi9vyc8b9fdDPQx/u9C7WKetVPgox7tF/a4ju9WywiLDoMTHpNmkE+VW+ofa8=
X-Gm-Gg: AYBFou0Pm0aNn3nhtyFe7392Ww4+MwEYP7oDS4JKoi6+09QE2SDIfAXN9wwe5qjrtOz
	TRUiHZUdWMSIl90Xm/QiXGYYMyAn7tfbyCrC5P5ZuIHo4Ib4650DnlTYK3Y9GasgYAhxDVK6OMw
	EAur6AvkZj1mIZfhzr/2aqkefb2n7U8673ouce5MsP5rVYZWZdL+iIotX7aAR5R6aWK06sK7+EA
	HwmQ5QR5Kkqqc4Rx/SDpK0PUpUovNvfoh7jYAmGuSdLRWwVx32J2IpbniZaB2Qtg+yqCwVyDhLf
	G+KZpKArQ4tD0XcLaX4XBOOV+u7FSz5NS7ixSu+ny+Szq9IgGkYuCjiqmgKugaKANB/gYl3E+sg
	Xb+/yLIw5ETMwAdhgDGKXxE/S3sVVgYFjPWPWs3utZ8t5luV38/McKoXbLiqzG8Fs70ht4acySI
	vKbKaLxXcuAD9ZenBHeJH4OVcWiXhNV98j04yi5GjMA3T6E5IWBE9hMot8eJbkpZCKaffV22U1r
	mqzfDdMyUrFmaZBcebpOoTLKAC7Q3gOMEnhzypbczobh8mxAj8bTq/D1wLUM+zhR6H6OREAXrPl
	enimHQN1m3yudU3Yq16s6bCANfRX00WJMnJW+vr4aj14gMtY9/AOk3D4mwlSzKOidONf2fZQ0ze
	8ZIeUeCd9qCj2bfYVOA3d8/tzk1ikmR12he7Ji1ZvHUh5R3W7Q2T13HDnJ+CGqBl1lh534sDFKM
	TbV6OfqhE1HzuPWZX/9VvAvkqqZ3YkmvYVC0+KnxUMsx4So8ZcxgtXgXPjkII1fo+i3aGrGWXJD
	AaMN6lm7VXchOdvce6HBlMxpOeBKDFPvBErXgb9uHdrhIBECEC1GQWdAyGGogbxABiIrAkQNIIn
	YG5Z
X-Received: by 2002:a05:701b:4346:b0:160:a80f:3ed2 with SMTP id a92af1059eb24-1b5030e6ae5mr382800c88.10.1794510192381;
        Thu, 12 Nov 2026 11:03:12 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b50313d990sm1030035c88.4.2026.11.12.11.03.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 11:03:11 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH] libcec: Update LICENSE syntax
Date: Thu, 12 Nov 2026 11:03:08 -0800
Message-ID: <20261112190308.778239-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 12 Nov 2026 19:03:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132213
Content-Type: text/plain; charset="utf-8"

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-oe/recipes-extended/libcec/libcec_8.1.7.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/libcec/libcec_8.1.7.bb b/meta-oe/recipes-extended/libcec/libcec_8.1.7.bb
index fafe647ada..70a9bddd25 100644
--- a/meta-oe/recipes-extended/libcec/libcec_8.1.7.bb
+++ b/meta-oe/recipes-extended/libcec/libcec_8.1.7.bb
@@ -1,7 +1,7 @@
 SUMMARY = "USB CEC Adaptor communication Library"
 HOMEPAGE = "http://libcec.pulse-eight.com/"

-LICENSE = "GPL-2.0-or-later & MIT"
+LICENSE = "GPL-2.0-or-later AND MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.md;md5=7e2296699f9e8b8a60c83540688ae774"

 DEPENDS = "p8platform udev ncurses swig-native python3"
