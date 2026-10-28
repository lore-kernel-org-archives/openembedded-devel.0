Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.36084.1793161586404596019
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Oct 2026 21:26:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=PoYSrfUi;
 spf=pass (domain: gmail.com, ip: 209.85.215.174, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-cc4aa0246b7so318691a12.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 27 Oct 2026 21:26:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793161586; x=1793766386; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4BRrJmT57+W6tD4KjOXFDKVPQwPydRPm1M1QGOHUlGI=;
        b=PoYSrfUiViF0enSzBof25XlREptKOOGI724d9Scz99NRZIUJY+rjSbMAweGxRdhbf+
         +xuMfzmTFt4FyNB9KDNjXVoHO3d/fTPfNuQWz+zKosiGpCOZ05ZT0hflG6EESq42sgCl
         n/RNZbJiD0d9y9T5yeTKnKnOfQoF9pJK1v43iR99E3IyypRzmfux5Him+CSN63HNOgDW
         srEKxJFBIwdvn39xZdbQifRkiaYFFcMM69Wx1m4Sq8NllFGDyyhzkiUvj30iP+Iv8Yeb
         JlKpsMhnr6+Fq+AcjILhn+2MkhZkCzTwMXd/KnmEbhGX/V7GL/mVJWcZ/0TsgqvNIfL1
         qlZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793161586; x=1793766386;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4BRrJmT57+W6tD4KjOXFDKVPQwPydRPm1M1QGOHUlGI=;
        b=vilh/mv7UARA4Epp3b/G/uVzPIXy6YMvSekzjE6fJD4U+uHKsAIwEKQdoXMElkt0xC
         pbjM+kpF+d99sC2WV5zP4VMc7V00H6ymxIQm0ILNP/9l1Zk5CdzjAgjgJw+8vkMHjaGM
         Z9O/w/Ok+/aAoEdBNu8Z5ErU+EJCGG4BsvAdOIRTUPBEcBWMD/79X3GINuwHc7+Zrn4c
         okp55LSj6Z3Lw24xPNxQqampLbCo0TM2EoO1XQX16d86sS0uI9N5Vcy0BZPT2lL88UnJ
         F0V3oPlOhXLMmw+UeQ07M6eMrtOIaxpVf0kYRJc57hIooWV+ka0/ojyOSs90ejvD4VXU
         MqWQ==
X-Gm-Message-State: AFq9FYKNAfqozXB86/+xiLG58AY8xUbWtDdqdE0+lXEalq9uNHnGYXkI
	XDmJeU1yFAwI9lDK4K4urQcbmhuJtcI3GyqNDQctF/0mM7/YnYAekMcWa6hz4w==
X-Gm-Gg: AYBFou0Pag7aLQQUsl8BozyTSqFFR+ZS/gXUz5qI2Cxhg7XDVP43XZq5vx3OTUvmpcd
	99cyPgJXqb9Cn9R7E4019k3nlcdaOp6X0qS9B4UI6rDNO/P5IXH72589t+msff8Ci5CojAEpWPt
	T4zc/hkUH5e7wCsMk/SLNEXDoyWQaRbvBZk/LmqPa/du6YYqpApqDh9jfNvevs/lplWUXl3zRwm
	+DyiQWwXydiBG4/eh6aBRwrK8Che7WwyHLZFFpF/UdIoMQrFAiOSXovTExwt5ILt+8slgBStkMN
	8c4gNariSIN86NNoOh5HeB9kUuG3qI85SWJTtL2wWxU/Lu0F2txogkJVtYo55NO/jZdVtJHa9a/
	M9xXRxd/cZu8trUagqavEMlFO7bYZ+KDIyiGY+/gaVnq6MeW8n4cfLJp7dKBaajkBkHiS1mpNpQ
	SFKM89tUefgylq8ZWXvKtdqcsorvQpYR5vBEX6oe0ZeO/5lj/2be8NN2Py0jUQJWv4Wd+QBBmYw
	68k/9geiv0b9P1lRVQ+rvmkgToITMP3u5iMEmXSJXnCor/dt5JDgHbidgdiQIJ0gPgYD011jYLR
	4Ns30W6R01jxBIU8KRCFkQSTaK28OLTRQB8CH6eFEwK5AqjNEStEGJVHQsQhsg==
X-Received: by 2002:a17:90b:570c:b0:3ac:9e76:aa93 with SMTP id 98e67ed59e1d1-3ae57e34b56mr708846a91.7.1793161585762;
        Tue, 27 Oct 2026 21:26:25 -0700 (PDT)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.. ([147.161.217.9])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae5a48c2d3sm1010794a91.5.2026.10.27.21.26.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 21:26:25 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>,
	Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [blacksail][PATCH 55/60] 7zip: upgrade 26.04 -> 26.05
Date: Wed, 28 Oct 2026 17:23:53 +1300
Message-ID: <2a8300a0ef7e2bb86e16deef6dfadaeb84533b1f.1793161233.git.ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1793161233.git.ankur.tyagi85@gmail.com>
References: <cover.1793161233.git.ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 28 Oct 2026 04:26:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131607
Content-Type: text/plain; charset="utf-8"

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://github.com/ip7z/7zip/releases/tag/26.05

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit 533d0a63ac2a38e77746e32458e09461f12737b6)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-oe/recipes-extended/7zip/{7zip_26.04.bb => 7zip_26.05.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/7zip/{7zip_26.04.bb => 7zip_26.05.bb} (98%)

diff --git a/meta-oe/recipes-extended/7zip/7zip_26.04.bb b/meta-oe/recipes-extended/7zip/7zip_26.05.bb
similarity index 98%
rename from meta-oe/recipes-extended/7zip/7zip_26.04.bb
rename to meta-oe/recipes-extended/7zip/7zip_26.05.bb
index 49437b807d..050673f678 100644
--- a/meta-oe/recipes-extended/7zip/7zip_26.04.bb
+++ b/meta-oe/recipes-extended/7zip/7zip_26.05.bb
@@ -12,7 +12,7 @@ SRC_URI = "git://github.com/ip7z/7zip.git;protocol=https;branch=main;tag=${PV} \
            file://0001-Remove-treating-warning-as-errors.patch \
            file://7z_wrapper.sh \
            "
-SRCREV = "9128b80e3a471108678e2b3ec3c985861c8d7b0f"
+SRCREV = "b88c6bc09339de32f7d18bbab900686b244f42ba"
 
 UPSTREAM_CHECK_URI = "https://github.com/ip7z/7zip/releases/latest"
 
