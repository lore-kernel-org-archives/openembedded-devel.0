Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8077.1795739707867848156
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Nov 2026 16:35:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=JRwMcQyt;
 spf=pass (domain: gmail.com, ip: 74.125.82.177, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-386d1859e1cso1899524eec.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Nov 2026 16:35:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795739707; x=1796344507; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FK9jzloFZ4B0wE2FWnKzkOtf5coTizl2UGoUiJXG5dY=;
        b=JRwMcQytknFr++MIyfRg8VTb9jF6xsphuWVUHRAlkQV/WXmKLvDJv4ElHl6oaRQg/e
         G55992kLz7wLCr6zujZbNegOqX0AVRfIH8Kzti0/lsjUwI+vycNq5yp4uB5xCuI6yl5M
         jn68xyQiNnCuZbUB58EexMMvJIyD5iCLUtCTqVQ3X6qYsQ7D6sX4XyaG5bfJBzx+8XAc
         yGA7mgBawV1yMus4j/n0MT1E1eYQpiCcmlSN+IYOsgdRxShbVt0EgsD6BhVH2VAvXat4
         1biAJ6yEfjYVqXL9q2qJMH6YDQg9FVgw856nPessxn3bv3n61gjhWMjXhFXRLsPDH8Fp
         lGow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795739707; x=1796344507;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FK9jzloFZ4B0wE2FWnKzkOtf5coTizl2UGoUiJXG5dY=;
        b=s44zm2he8UUyU3Q9uLHobqRpPbm7EEkeyNo7X4JM54nMMdHtO+YFLF6bjeIOhCm/Cy
         FrN7zePtufiwsk2DM/+E2CcpoP50wPlVTeFJw0StUs3w/TYoQYVi78Oq7Qf6OTDuyTss
         m9xPmj67AtBDUB6NnvaA/Eo25e3VUCaLeHfhzYlNIZBqry4mNYgDVOZvkJRgI/Rxj951
         sDFT7uLwS272a46RlF2qEakU4LaG7vEPaYEXYKyuwxXnXnc2bIsJV7rcVewX/FSupJUQ
         lqtZJ45QL7aBttCYg9clvZRoQ300Sho6yz65lgyQv+ZLqKbebciNQ4cBbGmjmZbiGCzv
         8pVg==
X-Gm-Message-State: APuU4Z9eMx1nBiuxujZvo55BSguNiM3C0XcI0NfRSEmvMxQymDzVij/5
	PDueKYyahrvc+MvHQvXjTwobV8x+TxoTh6833dUs7cdapW+MDV5Pj+TslFjEUcTG
X-Gm-Gg: AZFdTZfcl6IYkcp8Af5eTuBSOszlhJ+1WbIkKKlyxwz9Ty/U97/JmeW7qVye7jfnkyr
	kMi7BbgNeG24HT3Fj0bxWM4QRhc1d5k9HaYMnEDSI5p8ptpawk7g/auhTgrGdFS8k+R1ndhe9vY
	Ff0NPqTsOanwAjgn35ga6M72LW3TvM23xR1YmxkkJqSJmUUUQegLuSvTceJcE167cd6v25RfrCb
	5BjG7jj3TaO8WzxKz7gE3j6ctAka3mi+8gqQhw8ECIqwVagdIx6ynIB1M+uIpMrjoMTXdDEXtUS
	Yg2Dzh7b7+4U2N3vBOLCR6JMD6JaHORNc4VEDSpuHCejugNhPwMAptZqFeKRXGW9H2oH8WA34b+
	4pE4H2p8uCZTE96laHSH/GmFnjEParFIoUgOGbnzCr8r3mk3wZgkIIROMaTUFOsk+UtGAmCkd57
	Ymn5R+Ia991yC2vjfmyYBUYUCxSnnhaBJ/ZurPrTrnNYgMr1CuG5LIoZdB0rSIJc2dF4f0xyl0m
	OwsdCBvZkEj6RfsKCFu7QXyDjXvDaWC9CblNev9lLBGeRlJH3+6c8VA+HIoTQd6nEApTShAAh59
	xkQmVHDcoFcsikQSzloKge0m7Onj271miYooHxZsK/vpgkLmnQkHAPXqLp9yFBCQ9nxteWewqHS
	8z67iAtTBjF5v4GGyoj2RVY4vB9cwB045tfKzDi9t7ydb/lr9av7VN7/S+RP0NDnKLW9OWC2LPA
	8Mp0fF6R51X2mKuC87mpalaBZq+7w1MrYhfQDSxhd4qT0w3PT+aRslknGpkEkVV6DsswYLeSjEy
	x8aSTUQUF54tZHSMlH9kisREZO9od47n20Pq3g4Ff2bRseq2ZZW6R6daBjrMq3ROng4I3qFIPLE
	lfGD
X-Received: by 2002:a05:693c:8084:b0:386:c5d3:72fe with SMTP id 5a478bee46e88-386c5d37550mr8823943eec.0.1795739707218;
        Thu, 26 Nov 2026 16:35:07 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385672ce402sm63029314eec.16.2026.11.26.16.35.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 16:35:06 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 36/69] libsdl-net: Fix upstream version check
Date: Thu, 26 Nov 2026 16:33:52 -0800
Message-ID: <20261127003425.2166632-37-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127003425.2166632-1-khem.raj@oss.qualcomm.com>
References: <20261127003425.2166632-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2026 00:35:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133136
Content-Type: text/plain; charset="utf-8"

The default regex also matched the RPM packages on the release page
(SDL_net-1.2.8-1.src.rpm), reporting a bogus "1.2.8-1" version. Match
only the SDL_net-<version>.tar.gz source tarballs.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-oe/recipes-graphics/libsdl/libsdl-net_1.2.8.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-graphics/libsdl/libsdl-net_1.2.8.bb b/meta-oe/recipes-graphics/libsdl/libsdl-net_1.2.8.bb
index ef4d13ebb6..5669821f2e 100644
--- a/meta-oe/recipes-graphics/libsdl/libsdl-net_1.2.8.bb
+++ b/meta-oe/recipes-graphics/libsdl/libsdl-net_1.2.8.bb
@@ -17,3 +17,5 @@ SRC_URI = " \
 S = "${UNPACKDIR}/SDL_net-${PV}"
 
 SRC_URI[sha256sum] = "5f4a7a8bb884f793c278ac3f3713be41980c5eedccecff0260411347714facb4"
+
+UPSTREAM_CHECK_REGEX = "SDL_net-(?P<pver>\d+(\.\d+)+)\.tar\.gz"
