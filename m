Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F91CC5DF74
	for <webhook@archiver.kernel.org>; Fri, 14 Aug 2026 22:47:42 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.24552.1786747652336863855
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 Aug 2026 15:47:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=gWIenl3X;
 spf=pass (domain: gmail.com, ip: 209.85.216.49, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-38fdeaed181so2258689a91.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 14 Aug 2026 15:47:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786747652; x=1787352452; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mqmakARCPS+vg49uQjb2kyUSBF1Y4uyUwiYMq57KIFA=;
        b=gWIenl3XHSZe55IpC0uBdQFA3SBBFAQj052x8JKmhusWkxMtt/BvztCwl5bgunyITm
         q7sQ4RJht5vrOrnxEQUSiDHp0zU0JO7GdrJ14LxbwYShegkrkff90fqRTuE7x5cv3G9J
         M8t57I/skG+cTVfxdkWX4ZMw0PWl4Zf+RS4e4J63SoooyRnxagqSwnZSkLauMTKGu23L
         iCKQLjpy2CHC69mwhY+51PG7uNRLbAThXe7FOs9Gbzru4fOvuB/NK+k4kwQghk21HjIZ
         2q+gWKjaYh9E2BdRwyORKhcM0GXVfUi8UaBnXA1cRKcjN8WVGDxSPGQjh+MnydY1kPSz
         wv/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786747652; x=1787352452;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mqmakARCPS+vg49uQjb2kyUSBF1Y4uyUwiYMq57KIFA=;
        b=faPLHGWpofnjAtAP5gcSoTKiChcfAjj0ht/cMRtDRHDcNv3KeSDQc5QIO06n0FPKto
         2Hk5siC5xkG3XpfEEFvrcqlom0fQ3X5GGrNMrqgXkdWfTenwP7TPbXstldj4v1Dg56JM
         CZqdBB6pJFWaonWxXCfRTiQHcg0Y+Ho9EB9pC9t6u0pce9t1iJvngCfbk9kniVXiSsOd
         W7Nt+FE9/KFTjT+O6d64nOw/b+Eml75Z4yKh7neZ7QqWvEQqt4kU99Aj8qW7d9YnEEFB
         dd4tdz3MCI4zY0bQehM2L7T4OzbP75NA9bGlk5npS33Jt51+oqsGCnJscEEzbKdfdOwM
         emDA==
X-Gm-Message-State: AOJu0YylnDwMkDt45sGvG7b2Fif3L1rVhR6NMXpfVfMCnJeeBdMqTMKV
	mTWZYGEZxkx6FgiEFYxu9GErpTkwZSsAzoTluo0XxK71h1uYtUhrTeg1P2Bdhg==
X-Gm-Gg: AR+sD13u2X/IO/0idd725xJkWWEawPAtZicF9BbB56U26/4UayGULQWdAcb1vBL0c2l
	ZnyPrwXT1UVBzrE5HWZcuog9kvPhO/t68MdeYrpHwuXBkGQ45yAZmVL++PC+zPVDZoAnmL9GlNu
	ad9eB6pObrxRWdS4LbLQeVFBiUaT1FfBLkU+8tF4iw8zzjfFbl6tkkmDyV1Q6jQ443rkT8H85G+
	03VXYXju4qF3+T6/MNpujF+5h/of1c0eyw0zyZNEy7Dp2DVh/ypBFzm84PKvXzUVOaap7kmpV05
	3j3E6ro9b/33OF5mOaMzIvg3ut5h23jv8x3feUZLWTV5d346gugJs17gE7I/gOt46JwkusLhW1H
	WjW6R6a/4r3Ekir/KDgtYEbCTlAxtWW5e4ESv5v3wLfcS1DoX3kSwpXAD28TOVUEw4JHxrHYkQ/
	gBoG4uGkvu62BhBQ8KoKjAqABhVS1DFRMkjmqnG9KTvFVynRb72aX4vPiCcFF0lPWiBtkM1akB8
	NbWxMraA6P5Bml7kBqTn/j3RsguRZZbSze3VbYFPMWlLbEQzRNP6+FeIIoraGPcAkDXVyZDyjF3
	gPRP41LRWXEjrFgRUNVbtfdrk0uXqP5Iog3Bk0RsEs6rw2HYN8QOmLFuWz8wvT3vxtLrO1sCvef
	SYX+IjaAD6ASfZ3mC2Td/kf+8jEXZ5H9lN4Ahw7oeesgK8iRsDR3P5P/0
X-Received: by 2002:a17:90b:3d8b:b0:38e:1497:af5b with SMTP id 98e67ed59e1d1-3933b77ece8mr11182709a91.1.1786747651614;
        Fri, 14 Aug 2026 15:47:31 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141387ac9b1sm14541588c88.2.2026.08.14.15.47.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 15:47:31 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-networking][PATCH 092/109] weechat: upgrade 4.9.3 -> 4.10.0
Date: Fri, 14 Aug 2026 15:45:18 -0700
Message-ID: <20260814224539.1523174-92-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260814224539.1523174-1-khem.raj@oss.qualcomm.com>
References: <20260814224539.1523174-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 14 Aug 2026 22:47:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129156

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../recipes-irc/weechat/{weechat_4.9.3.bb => weechat_4.10.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-irc/weechat/{weechat_4.9.3.bb => weechat_4.10.0.bb} (95%)

diff --git a/meta-networking/recipes-irc/weechat/weechat_4.9.3.bb b/meta-networking/recipes-irc/weechat/weechat_4.10.0.bb
similarity index 95%
rename from meta-networking/recipes-irc/weechat/weechat_4.9.3.bb
rename to meta-networking/recipes-irc/weechat/weechat_4.10.0.bb
index 7c797ed5ce..286d474c83 100644
--- a/meta-networking/recipes-irc/weechat/weechat_4.9.3.bb
+++ b/meta-networking/recipes-irc/weechat/weechat_4.10.0.bb
@@ -8,7 +8,7 @@ DEPENDS = "zlib libgcrypt gnutls curl aspell zstd cjson gettext-native"
 
 SRC_URI = "https://weechat.org/files/src/weechat-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "5c7d9539fa86c99ea76a551a889a92bac21eab7bb2790dbd346452d00b10c37c"
+SRC_URI[sha256sum] = "c3a7e7c6a5401dde9a46d0264fa44aa3032ca98aa86410c454d3de5c69505c54"
 
 inherit cmake pkgconfig python3targetconfig
 

