Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B334CAC587
	for <webhook@archiver.kernel.org>; Sat, 13 Sep 2025 11:40:08 +0000 (UTC)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
 by mx.groups.io with SMTP id smtpd.web11.3446.1757763604599840246
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 13 Sep 2025 04:40:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZifDmkME;
 spf=pass (domain: gmail.com, ip: 209.85.218.42, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-afcb7322da8so520109666b.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 13 Sep 2025 04:40:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757763603; x=1758368403; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Yxu3SPzvTlTt3WNtJNANiOr0Q+p6ERJr/SKxK4iHbZU=;
        b=ZifDmkMEuG3NEUt0KFUBZ2OguwM53/FQ9OX33DIxWGe/jCut8gOA0dZXsuPpKCBndw
         tx7Sp44TBjSN3tp29n6CyQHtheNfyu6ZsaySkkVQXg13jm2PosTf/QGzT7WBTa/rX57M
         gJSEPVGdeF3WnkSc5A9BJpeADlHVgXzx2qJ4Ze02vAxcQrejniyzx31fQ4p0+OGRJ1N1
         o9t7eEh4TbV1kqvETZ8lyml3LMxWDU6Kt4d10GcsQ/Sz1W+0FYgCQWoPF8w8OqaqHRKX
         or7QFbDfj7Zkjh6C5kgLU6ZIGr4NBNomfT4S42sA8rFR+B8RsxJYrOeKVXfrNd9zLTjK
         96zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757763603; x=1758368403;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Yxu3SPzvTlTt3WNtJNANiOr0Q+p6ERJr/SKxK4iHbZU=;
        b=ANwXv94ELORKdUvB5kgXUiBaYZj2F/A+yzQ4U/LFl1wXWjOpPZ1SZgoU4Xx/WNcNmF
         jb/K7TaRG8JyUO4xOBZDMwOHQJ1GNSpeo81ByELxax8GOX4IETz1oDg/lx2DHkhR3GKZ
         VN4jn1mH3mjRMLej/V3S+w7E3Aa3WyrfqR5lOrwgD07gjIU3Y3psxAG+fVtFvZsddov3
         4Q2hV04bj209JEL6k1K7/F3gFA3rzTeg+T/JVfBfkuGNbG/EV6u3z9ZOesPbqM0zUQ+9
         F+Eg5mHAln6569IwvUapZG8rKAYRFmstU/u2ccVmq3WhydOvux3m7OHpxFtjrPQepRTJ
         q0ng==
X-Gm-Message-State: AOJu0YzXFQzKukShLLZLcKMwDiW0d6Xe97Okd660hHuHRLNGhv9YwR1/
	9BSqRP+zrlajn8k4uu8QyBqlYN8seP5C8p8Ke45ys/myELzMb4z3UvLE7iRSYw==
X-Gm-Gg: ASbGncsAtpDScdlQ1YnraqXIUdM5RQEYQU5V6SKEXEbCw3n/CKv5vpnja4ywKIECf66
	MUOrfId2NCTjVZkLCRgx5D5rxMTE/8p92bLXqPsc1VH+b41OFr8flgg9fbFFrHCH0Km7lq+cu4g
	+YdPr3NnE9fErY/LO3xxCRadM9hWGSZ90V/8k4m3Ekp/uzIKA63nfB773Z0dCf+Lp2KJMEQECuO
	WmuzYQRsWc7EyqmWx/EY7zTRkyLNBhYWTIv9Xg3x/bUkVrUAf9D5FzF9ep654ewMhFBw8XZ1EyD
	MEsvm5UdDcSHnN6FOWseXIqiMNWFQx8Tr5VVtI3zSzYhTkDgFcnx9GuRWmvNHPpFOWLTIoRgsgJ
	uXXQqPvvfgLqElGF44vgfwn20AUffqYaNCfXclPSYkA==
X-Google-Smtp-Source: AGHT+IGyCNLzdcPNAyf7gY3ocHzKWrgIf2DxpcJ6B14NumT/v4GAwP1zCP7negRt5ygFWZ7oZDtjng==
X-Received: by 2002:a17:907:6d11:b0:afe:c2e7:3705 with SMTP id a640c23a62f3a-b07c35c109bmr641848166b.22.1757763602591;
        Sat, 13 Sep 2025 04:40:02 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b07b31715fdsm551869666b.49.2025.09.13.04.40.01
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Sep 2025 04:40:02 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH v2] libchamplain: don't compile for 32-bit targets
Date: Sat, 13 Sep 2025 13:40:01 +0200
Message-ID: <20250913114001.3196804-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 13 Sep 2025 11:40:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119386

The recipe can't be compiled for 32-bit targets currently, due to
GTimeVal usage - see bug report in the project[1].

Remove the 32-bit targets from the compatibility list until it is
fixed.

[1]: https://gitlab.gnome.org/GNOME/libchamplain/-/issues/61

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---

v2: Corrected machine override armv7e -> armv7ve (the former is not an
    existing override, so it was a no-op)

 .../libchamplain/libchamplain_0.12.21.bb             | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/libchamplain/libchamplain_0.12.21.bb b/meta-gnome/recipes-gnome/libchamplain/libchamplain_0.12.21.bb
index b7c587d25f..5aaf680e8c 100644
--- a/meta-gnome/recipes-gnome/libchamplain/libchamplain_0.12.21.bb
+++ b/meta-gnome/recipes-gnome/libchamplain/libchamplain_0.12.21.bb
@@ -10,4 +10,14 @@ REQUIRED_DISTRO_FEATURES = "opengl"
 SRCREV = "941560af497148588783db991e8135f52a82574d"
 SRC_URI = "git://github.com/gnome/libchamplain.git;branch=master;protocol=https"
 
-
+# Compilation fails on 32-bit targets, due to GTimeVal usage, which assumes that
+# time_t is always long, which is not always the case. 
+# See bugreport:
+# https://gitlab.gnome.org/GNOME/libchamplain/-/issues/61
+COMPATIBLE_HOST:armv4 = "null"
+COMPATIBLE_HOST:armv5 = "null"
+COMPATIBLE_HOST:armv7 = "null"
+COMPATIBLE_HOST:armv7a = "null"
+COMPATIBLE_HOST:armv7ve = "null"
+COMPATIBLE_HOST:riscv32 = "null"
+COMPATIBLE_HOST:x86 = "null"

