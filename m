Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3865.1794729016401333903
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 14 Nov 2026 23:50:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=PpTSk0be;
 spf=pass (domain: gmail.com, ip: 74.125.82.176, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-37628596783so4144710eec.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 14 Nov 2026 23:50:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794729016; x=1795333816; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O+4aLEnTSt6pULN36bShy01/8fZaiGmg6J/YnvqfuBg=;
        b=PpTSk0beDj+zo6gFffFQfs0tvk2IhT78S133Tdj1w2lYjMv2fCZMoROsP5ljIb3zEV
         +86YdRvI1iXhlqWOw66Sr3gOSWDTHaJ8fK3Kv/aOlIphBj783ulk/qGC7uXR++lPxjQc
         ugM2AneKRwnkYfdm/NSXiEFGbvSNacWPKcAgoEseesxQ3TgUQQE2kIZIU+LqEZ1RQEZB
         cX2uUUH/GRS92cEq+5VkVhosvnLLyDn/t/InFggrDNdLEbT8kGzknkVhn9ObwlcrwvQc
         s2Ot6N4R5sGHlgBIob35Mlm3qWMVIwrhtQLK7LZnOa8LP6pNN46xu8YKRA+6K4YjNM+y
         903A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794729016; x=1795333816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=O+4aLEnTSt6pULN36bShy01/8fZaiGmg6J/YnvqfuBg=;
        b=EA25ZVH8mVN6Ues/QMe7hroBuzJBjmvyWNbdJ+RZc2NEr7ur0cVhQ0TjvJRIxRK2ok
         VsbJvZVeO+G261dL/MiCuvnC3JUuD0hvLZsJdbSoNS/kXwro0dzStwP4d320EY/QRU9e
         s8WX20UAPTIexu3vgfX+w9wIk+/nqOvjw+kUETPTSnAz3+A1qq4FLJ1q8FsVuADIDI85
         0ixrsdM1f6Ca8pdYNKCBaJOy3apJXJtiBlARjulasctEatt/gRN//YaSnB3fvxfmZK4m
         qFhiJ6S7dd7dZv9bnqUtgtonAWT/7mJS3V/ucQ77w3lcTB27qdFLCOL7pcZKN867qgpU
         Ia3g==
X-Gm-Message-State: APuU4Z99ouibphnQurUkgRknKvAp+QtD5su1cFc7iwhgRmy2r5JUfRYo
	r1DSOa/RfhKIjUmMjSjZyLdx70afV/ix3CMesjg1xpZc93NvDyfjOPvPb2AUvAO6
X-Gm-Gg: AYBFou2y+CZYCJN4K/VYlltY8kaOUVKaV8h02nNVkJQGYIJjVK3dYumMSK+oWMsBeUM
	smx/8ICCX1VEuUXuM2mTocmp91fTGmYN2q0JjgWjgTXCE1ROTuk5ctzx7JO0uwz5LolfWWvtgqn
	tLLB9itxiPsQTj8ngTUa8drkNKvAw0KCj/Q5BD0HYlaibP+8sA/Afa5YYzu5J6ch08+HM2lLoEl
	pqNL7kC67BPMaSxrY4t8Qwo3kRZUlmT5PexXuAyIUFrfeM627ld3YjPWygx1rGnxqy6GS/JtpyK
	l8cCh5p7YCYGuWcwIEoajoXMx26Hs1N4hHj2M037T350y4UIp4VTxCUbli+bnBC6YMTE4M3NQ2/
	L/rb6tZEpots2JtFU43zT3a7Xqv+uJxz+jUqeUZpzFqsxNv4AD+gnPbsoJkr9UOZf3caN/neOcW
	Gg1FWB+DLCUwK+0W33Lxzx2b54OuhA+Xyfs6gOtr4RrTu1nCh13Tp6lS9mvPaES/QoyKaMhL+Be
	NH1e7tTIKZa5xpQrCJPpmrMnkGP7o3D9AIXh2ZRdd5Ckb7hpQsM2FlAs146sgkOBg82D2X8X41t
	74H0QD0lqDHhZiVdbIc5ELEApXECibcSztEYqD7WqGT5S/N7TUXF4Y2w9aoxRTJg5Yf6ZdPHnM3
	dL7QtUFPBKkBdWKZibN7wBSQPgwD+NuSHKTDpA/OC8mXNxaNFarZJGukCdJ4GCzZ9LQrGEtYD/Y
	BhJKe3MZl/g5q5SMVN3HGyM6ilkpXAAJqUxx5JKXCYn4ufMdx8nUg3p2wJKxF+RJsxj60BJGUrC
	9jd27FLdeJPdysJRMlSGelk9EWl9UGu58Qowc5P5ToD9jBwDGWLbVvIHhm3kI7YYrgcndEUCnjF
	jufG6Q==
X-Received: by 2002:a05:693c:87d7:20b0:35f:8c5d:5928 with SMTP id 5a478bee46e88-37967125e78mr6462561eec.30.1794729015693;
        Sat, 14 Nov 2026 23:50:15 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3795591f4f8sm23112817eec.13.2026.11.14.23.50.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 23:50:14 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 34/96] libplacebo: upgrade 7.360.1 -> 7.387.0
Date: Sat, 14 Nov 2026 23:48:12 -0800
Message-ID: <20261115074918.2932593-34-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261115074918.2932593-1-khem.raj@oss.qualcomm.com>
References: <20261115074918.2932593-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Sun, 15 Nov 2026 07:50:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132304
Content-Type: text/plain; charset="utf-8"

Required by mpv 0.42.0.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../mplayer/{libplacebo_7.360.1.bb => libplacebo_7.387.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-multimedia/mplayer/{libplacebo_7.360.1.bb => libplacebo_7.387.0.bb} (96%)

diff --git a/meta-oe/recipes-multimedia/mplayer/libplacebo_7.360.1.bb b/meta-oe/recipes-multimedia/mplayer/libplacebo_7.387.0.bb
similarity index 96%
rename from meta-oe/recipes-multimedia/mplayer/libplacebo_7.360.1.bb
rename to meta-oe/recipes-multimedia/mplayer/libplacebo_7.387.0.bb
index 94767730a8..476bc7ae6d 100644
--- a/meta-oe/recipes-multimedia/mplayer/libplacebo_7.360.1.bb
+++ b/meta-oe/recipes-multimedia/mplayer/libplacebo_7.387.0.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=435ed639f84d4585d93824e7da3d85da"
 DEPENDS += "fastfloat glad-native python3-mako-native python3-jinja2-native vulkan-headers"
 
 SRC_URI = "git://code.videolan.org/videolan/libplacebo.git;protocol=https;branch=release;tag=v${PV}"
-SRCREV = "cee9b076f2c63104ccfd497fa79c39a867293ec4"
+SRCREV = "275f7dea27924cdd34ab2e6c20e448b6bc4fab65"
 
 inherit meson pkgconfig
 
