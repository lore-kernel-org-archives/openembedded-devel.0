Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3823.1794729029951189615
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 14 Nov 2026 23:50:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=UwTtZELZ;
 spf=pass (domain: gmail.com, ip: 74.125.82.173, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-3282db206d3so7236001eec.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 14 Nov 2026 23:50:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794729029; x=1795333829; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cjdAp6lRNZK2n/nA8SIA2YysqfkQ7Ir2kwB3fsj3xpo=;
        b=UwTtZELZJaaB/nPGCvvEaZXWhDSfzS9BhQlUVL9hKAzSlbmNi4gYS499xR1CzxprBk
         AMxQ+0qt0t3Aw2SO/YFtE0PdV+fRYjcwd0vwmzNS6OyiEFRSDujNisZupSxPBk941olX
         BB5Qv42IMxMRGApysoV7x/lNRBYftza6htEFwEzv/xevWe4fmebgSF+E0Ro8+ijLkaRg
         twpJ/tOCK+R923dfLUlptNPBI7sxnxu+20L+UXLBvgXF9Hk9KE478GkgjY34q5ayM4UX
         W5lHXwguxeq9ekQTd2zw0xzUq5bt6Y3mC1xuSmDu0nVzK+LUDeZV6trukd5hRbYwpBdD
         c0PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794729029; x=1795333829;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cjdAp6lRNZK2n/nA8SIA2YysqfkQ7Ir2kwB3fsj3xpo=;
        b=Z9x+1VrtjiikcNpPqAcNxhrXsC7KJssp4QREETI4RY+EaF/3cUBssKGkhplqznIuXr
         U01y5ZWdjXLHoKFLAyTwPFMuP9SErDm7P1A4XGWW8abvGx2oFeZKQfZsHATzxgU8074f
         cx3vSaitGBqDtEQtIOyjni6Y8nyRDs2tFrmci206oQY44c050gBHinwnjopILvpbELFt
         GSPAXobdicSR9XL9rEWtOMoPbKhcml/pfSOpY4wbLDLv5qpbE9jX9zhY1r4NejttmNa7
         gLEm8cjDua3g12o8pZbc1nHu9mT37zdMBS4iTe9Qb4aK0IzAluJiqHyjDwtDJnc6gtBa
         lb4A==
X-Gm-Message-State: APuU4Z/1CjD/J7DzXKyX0CjEhwIAPI/PpQdjvC7yIf8gmDGvCX7GtXS4
	gjl4JAhpJLqtaETkJ4jO/KERKD2C721235PosQCE4FcHs+AbFFCQMhAfs9Frv2J8
X-Gm-Gg: AYBFou2GhiK6+GoZLnrORpSz9V1BzIW1/vuDpJ+geEZPV4No14o3ehjvEYwx4nUlwXX
	CLE0O2aQKH6iFNuEis5Hrl9964WlFSIDAVWVh/87Zws9En5oVhI+3/Pua6aTTv9ASYFYFqPIC+V
	P51NH5PgL03Ql2zZSAXiKVf+X/TbbhEdhmOETJi1wZ8L8ar4bvuHKeFT5cOw+J7SnI217twTYPP
	WJVswoBQjL69d1SpxYamg6vnM4Gr41t4q7uQ0o248hTIGFA84UN9TwOzcmQ0cihj4hMcXGnnjmU
	ErKOTaDJrWLoNMPJ8wJy0vDZU7yK3m6YBCVYHJk2HGm8qUnqlCEhnUoZ4UfEK//rayJgYXQP76P
	IZRc1GAaF/G2hmBswaD69Lhshwgm2hS/2sqogS0XVmGFlybgTx/fAQnG9+j8uRwEefxq4LwH1N/
	fbCQAFO/60HfeAf4FOlXh/vtOnPBAxhLqu1ySpKbL8pp4qg/37N8MCG3ZahCgyuBcbjHDa4y3ky
	XQt8tFVttqIdFxqswin8LZRe5Ay3pDX26JtS9KWTFcqg4It/ds46mFl4PX685ESiZIIZFLxjsen
	Pf73XhH1lx5F52EudLKfi59Y43X7tZN1ofMEFbYbdGLkwWulgCgIhCwgBKeLx4MvgtLX9QWSuGT
	e4Lb5Pkw1UmqSPuXuaa/yCYmTceAT6RKeGImzOPpGPH4Fg+1zC0ZiJzlAM4louDglGYCchapjL1
	1WW0dzX69ItUX+yHkACOOQRrhlyGAJw5BEI3ZtH17AXULfV9PBZcG6RFfoU1GXn33d7rrDKCT8J
	uI/adwFq3hNKx0qbwM1trFfinvrP3SL9OBC1kuKMCcKqDAF4keXGCjsUSn4O8QJpOpfIm2r2Xk0
	shpa
X-Received: by 2002:a05:7300:b099:b0:375:3df0:722a with SMTP id 5a478bee46e88-379676f8cdamr7632905eec.28.1794729029277;
        Sat, 14 Nov 2026 23:50:29 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3795591f4f8sm23112817eec.13.2026.11.14.23.50.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 23:50:28 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 42/96] plocate: upgrade 1.1.24 -> 1.1.25
Date: Sat, 14 Nov 2026 23:48:20 -0800
Message-ID: <20261115074918.2932593-42-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261115074918.2932593-1-khem.raj@oss.qualcomm.com>
References: <20261115074918.2932593-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Sun, 15 Nov 2026 07:50:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132312
Content-Type: text/plain; charset="utf-8"

The release tarball no longer has a top-level directory, unpack it
into ${BP}.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../plocate/{plocate_1.1.24.bb => plocate_1.1.25.bb}          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-extended/plocate/{plocate_1.1.24.bb => plocate_1.1.25.bb} (76%)

diff --git a/meta-oe/recipes-extended/plocate/plocate_1.1.24.bb b/meta-oe/recipes-extended/plocate/plocate_1.1.25.bb
similarity index 76%
rename from meta-oe/recipes-extended/plocate/plocate_1.1.24.bb
rename to meta-oe/recipes-extended/plocate/plocate_1.1.25.bb
index b33c339d14..156ffd4570 100644
--- a/meta-oe/recipes-extended/plocate/plocate_1.1.24.bb
+++ b/meta-oe/recipes-extended/plocate/plocate_1.1.25.bb
@@ -9,7 +9,7 @@ inherit meson pkgconfig
 
 DEPENDS = "zstd liburing"
 
-SRC_URI = "https://plocate.sesse.net/download/${BP}.tar.gz \
+SRC_URI = "https://plocate.sesse.net/download/${BP}.tar.gz;subdir=${BP} \
            file://0001-Include-linux-stat.h-only-when-sys-stat.h-is-not-inc.patch"
 
-SRC_URI[sha256sum] = "e55a757af1d7efb15ea674993224da4f0258479f8f720bd3dae0925d27dc04a2"
+SRC_URI[sha256sum] = "68c1d5fbb11864403ae39c1a5937f13afd80b03e68041368831ef58cb613578e"
