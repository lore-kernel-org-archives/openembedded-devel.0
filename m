Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44600C5DF6A
	for <webhook@archiver.kernel.org>; Thu, 13 Aug 2026 20:09:49 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.27795.1786651784209876073
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Aug 2026 13:09:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=WJjDKooI;
 spf=pass (domain: gmail.com, ip: 209.85.214.172, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2caced6038eso2840265ad.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 13 Aug 2026 13:09:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786651783; x=1787256583; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QDdBVk4zlsEv+a4TrhCpQV4jTCIGvFUarsch3fJ8gwg=;
        b=WJjDKooIj/YVlnnzTJZ71Qt1YIsykRXjqNa8/cUy7IeBSnrL+WfITdvge7VUNf9K95
         jBnrW7+X2mU3ctXq/7Wrng7m3dyfJ2F+ggqQSBCWVpixVvQYvIwHFOwTw076feJIQpfY
         wkLGzlewMrjg0gty8H1i6vkx2P9y0AJzgMRFzbmm2kA7PyPNcjlsGUvc6oPQ1asbFcJH
         MfoInnMetJxXjk2nNXLIBg5fFw/6J2sGr0HdSdb9TH4xL1MG2V9cxK9URXwYqVeaduVI
         A6pTjIELYctYPnrbSoOt/JIGSYOyBkUk69Ly2SumgGyR3cWODoIovfN5LEkc6jQSPfif
         Bcsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786651783; x=1787256583;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QDdBVk4zlsEv+a4TrhCpQV4jTCIGvFUarsch3fJ8gwg=;
        b=GaWYAvPAVf4Fk/Tfe9Y0Yf3Qx+TrIqtwgRb0OYF9RaOffMhZFFJoP8a9RrB4hhfXO4
         97M88F3qruG0c/ZQfT3gPE1FPQNig+Ob4IzBxlrMTIt8p7RSKRgFmHV/pJg47koBfRYw
         nDZacgCngssBjfl0Ii3SjkPTgLN1jM6rUvkxtoZLQvWdxtNztKZFMnktWV5B0GJPMew3
         DzAUKJ2MZvwNG55oTszbnIDMwFC5b59QUp6IPY3rVZ4QdowbQXJPxBmBjguHrRz7qVU7
         Ha/2Z+zv7Cco/p4/kC+CkC8GENMIzGs1c4u4wkJR0ijC2TOuSfGWrmlaUcYJpV0QRkuk
         5POg==
X-Gm-Message-State: AOJu0YwskiuX77sL+Dv07m1OnbSnbUEfaThl5YhT8xNgWS1kLgzKX3ns
	eSohtqPbwma1XEHkLA2hgQFInNbarIKf/AT9NX7LB7s0BErKemTnC6WJMLiz3txZ
X-Gm-Gg: AR+sD10XOiU0qcINun19CCC91EuIM2mtdqWgsbyp3MhWhhIPR5zLfqtmbbqvzoWgLog
	rXC5Tayl7fZc2zS2qD3869QMhrC0hIf3MzDkl7KrEtUbFH94TYdmr0daNoYWqbOzPLqUZo6XwmX
	YGS2H0Ol87xq2cxjppi6aXUXuhTilevJxIjTUrCitQvF+FrjYR6Dcsy1HW1gBwGIZjQHiWH4onT
	bBdc3xlBQhLExifKmflCA8AFEyKYnIoedgxSw5LclxprsW1os+/ycZmjayF6F8R6WEE/J4KaPGp
	Pv6+a9LQ5rkpzA6NOuGgs5pdUhl468GNhugDRrZ83ArYw4HJRJ6wYTbGawC54bMT5JiojhgqLOP
	x84/SH/CN+e6QH1G1TsBYfxQUM0YYBDB2ZdItQwPU8PzcIu8m0tMQht2vtn1qdRjeoO6MUEl2KA
	8wTvqCDCGjF6NSTdJIfRMej3wghmu4KSirlWWmScmCmGD5qI4eaKuaE90UbNK4jAnxnLkVjdbSD
	5x8MEYPYsn3L1zRIrb7s5ayojRo/kew6Wq5YrAvSf4HL8IZ2dgZfRaPr5Lu1pF2Nc/tB4begNan
	9ajrJLsXapv1zn1Ni8eyEiGDglhodA5huB3Q+/XbUuh5itpNhe5vWXTE4SMVHb86fZ2msRbN0Lz
	ekm5N3flMde01jZXAc9iXUxS9/O7v11rFbhGOCakXLc+CUg==
X-Received: by 2002:a17:903:37c8:b0:2c6:8d95:fd7e with SMTP id d9443c01a7336-2d37f651b22mr97252455ad.6.1786651783463;
        Thu, 13 Aug 2026 13:09:43 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31ebfc37202sm10012289eec.20.2026.08.13.13.09.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 13:09:42 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 36/80] python3-lazy: add python3-wheel-native to DEPENDS
Date: Thu, 13 Aug 2026 13:07:50 -0700
Message-ID: <20260813200834.1302829-36-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260813200834.1302829-1-khem.raj@oss.qualcomm.com>
References: <20260813200834.1302829-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 13 Aug 2026 20:09:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128980

setuptools3.bbclass and python_setuptools_build_meta.bbclass no longer
add python3-wheel-native to DEPENDS by default, following oe-core
commit e546c697b7 ("classes/setuptools3: remove wheel dependency"),
since setuptools >= 70.1.0 no longer needs the external wheel package
to build a wheel.

This recipe's pyproject.toml/setup.py still declares wheel as a build
requirement, so pyproject-build's --no-isolation dependency check now
fails:

  ERROR Unmet dependencies (checked against .../recipe-sysroot-native/usr/bin/nativepython3):
  	wheel
  		wanted: any
  		found: not installed

Add python3-wheel-native to DEPENDS directly to satisfy it.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-python/recipes-devtools/python/python3-lazy_2.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-lazy_2.0.bb b/meta-python/recipes-devtools/python/python3-lazy_2.0.bb
index 940686af72..f8bf9a72f8 100644
--- a/meta-python/recipes-devtools/python/python3-lazy_2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-lazy_2.0.bb
@@ -6,3 +6,5 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=0ba506a1df3b54afc8b01c9964bb6bdb"
 SRC_URI[sha256sum] = "f92ec0d32dd6bd115ddec4e3323473ebc0b682ad58c6aca78ebfd9e6d1aa5777"
 
 inherit pypi python_setuptools_build_meta
+
+DEPENDS += "python3-wheel-native"

