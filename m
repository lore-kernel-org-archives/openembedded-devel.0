Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.48527.1795411854036472559
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 22 Nov 2026 21:30:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=0mPtDplf;
 spf=pass (domain: gmail.com, ip: 74.125.82.173, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-3712b6d9843so2375089eec.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 22 Nov 2026 21:30:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795411853; x=1796016653; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ciw76jdW1zoKeI+aOdTNptj5qY9wYMeLBJpfFMlgae4=;
        b=0mPtDplf4HKZkfElV2BN250Nhm08peYCpLIvXp0zZKhl2sUBgqXENS/SKZMF4veA0F
         NbbFcmMu25UgYuHiqMgJW47j/HFMlbWc79+EL0GFH0MWvlXMF5khtdqfergNhJTxUPxP
         Y9lJxJtVgSzsjHAt8pISRW+9niVbJWIKxAJ1d080hRGrN9xyhWTNRkKNsbYm3ol7MbQ+
         1JKn/r7DYgmxTmeNQ8AZ9mAtlFc72ligsm9J4IWRS97jM7ZQCRCV3Am0iY5pVya1kuAi
         fUgkfLOi5xuZT0DX/zIvgI+4ipiboAYanPy1nO06WMIebL8mJM32XTCw5dciHMPQwImg
         aO/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795411853; x=1796016653;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ciw76jdW1zoKeI+aOdTNptj5qY9wYMeLBJpfFMlgae4=;
        b=x855E1wGfE9C0G2YU90FOdc9QOv3Obl/3VeutpWt7P/Nh3+ixhsMOxXQztIqNMoZfU
         oEDCwXL+cuzreGMWZLKUSQdTE+CYI+fGICtzvT61qhpFbyV9lOocwzvBCoxg8QQcRtCk
         vxxs8u1SOjSfBRWAs/af576vsfDLxguqt9+w7o3IXKp/dwJAfTx+Eb++BElWqCZLcP/o
         5d2MwC9/h9kkLfBxEZqbcT0N/MQwSAU+ZOvUCOePT+ptugpijKkkuA9y9xd4UM3gjRIm
         Ryo0kz3XeACnlpfH7t8Cn6CYz3jW8K+0X56d/xGXlfO3G3jS22Toqe5mHazk1m93GbtI
         OAog==
X-Gm-Message-State: APuU4Z9K7oCJ9tjIwpI7oeXewGu30r/IteDnh2sTHD20cfwSnLKT5z7i
	aa+NU41we4BFezgNOvkque3GO43MtunkS4+w0vfF135PLPTZh/MI76wpjvS4Q/RwbX8=
X-Gm-Gg: AZFdTZcNdFx2UpPLs9CpZsjkKi1uafQRTgZkKzkhXZNf7jbqrsYQIvfFRjGdox/LnlA
	OEE2xC5wZkWLZdEHxX4wYJJudmUNlZo6WdXupfj9VZfitxQ0nLS2w3N8/x8yFi4UROUnYdoRaZa
	+cTofB5yN/G12Q+j5YFi8Nb8brg0oRxvym7yjrM6xKP6aL4uGiQ2gvDm7zd+fD4xjybFlnNwA09
	02sIF7bA+iLGt9x/WNVIw+8NV0cLadmL/nescC6qrforEx4phY9OBpnuhWARICfA76sCucP0SCN
	iPPLrprdBicb4E8c7hs+lSCx0lFfMklZk6VYpiyYIDf4al2ceevFMfKOovqbv5Nfm8B299ON2LL
	OgQJTvEL11+r9D9C5wat857AILPEF+GXQN0jksqN54Gw5C74hV77f2f8AJCB9jA0YjoNNE1mknp
	IS4MIRgIqJ0xbJt3yQcMnHSYY3s9/ECIWiXo2xEErJTvlllx4qjRM+xUc9J/eUoPsIl83mp8mf/
	b7wSSHeavKU6tdOhQ3s8kF5klmtbbaIJbIKjZrB9REY2sW7WBG8lcmdxyX8lsBxeGtGJWmFlp2z
	FdHW7WncphKKxJIQSMJJ9s9dAwRQjc9k4/rg8MVbCFojcPIwfEnlNyI4am9GXip1lGR9jQxm6TE
	Pbb8yZk99yy65o838iL/FlyuC1R5aEbBd4QlH0i+mJLDymDjYE+0ioDlrKFiG9wHSTAIvkcG1Es
	3wlYRiptDEveRDMsO7gKzeH5wzd8BESrikbd/aOTfcHHU9cXI/OWKMSoMQPeNA2YK3mf3G3fBMP
	gcUJ+87Gp9i7ApYdfQERne0NFnWwIA430U2ZHgBCNpChj87Rc6hV94gIg/AunQivMep3iC51x3C
	MWVV
X-Received: by 2002:a05:7300:ff48:b0:385:3595:5e87 with SMTP id 5a478bee46e88-3856fd5b5damr10095827eec.16.1795411853328;
        Sun, 22 Nov 2026 21:30:53 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567cafec4sm36573136eec.26.2026.11.22.21.30.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 21:30:52 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 19/42] kmscon: upgrade 10.1.1 -> 10.1.2
Date: Sun, 22 Nov 2026 21:29:03 -0800
Message-ID: <20261123052953.3658549-47-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261123052953.3658549-1-khem.raj@oss.qualcomm.com>
References: <20261123052953.3658549-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 23 Nov 2026 05:31:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132834
Content-Type: text/plain; charset="utf-8"

- Fix heap corruption from per-font fontconfig setup in the freetype
  font backend
- Handle VTs 13-24 and add Alt/Logo+Left/Right VT switching, aligned
  with fbcon shortcuts
- Share the XKB state between all keyboard devices

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../kmscon/{kmscon_10.1.1.bb => kmscon_10.1.2.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-graphics/kmscon/{kmscon_10.1.1.bb => kmscon_10.1.2.bb} (98%)

diff --git a/meta-oe/recipes-graphics/kmscon/kmscon_10.1.1.bb b/meta-oe/recipes-graphics/kmscon/kmscon_10.1.2.bb
similarity index 98%
rename from meta-oe/recipes-graphics/kmscon/kmscon_10.1.1.bb
rename to meta-oe/recipes-graphics/kmscon/kmscon_10.1.2.bb
index 3aa5e6b4da..8bb54d1c7a 100644
--- a/meta-oe/recipes-graphics/kmscon/kmscon_10.1.1.bb
+++ b/meta-oe/recipes-graphics/kmscon/kmscon_10.1.2.bb
@@ -21,7 +21,7 @@ DEPENDS = "\
 "
 
 SRC_URI = "git://github.com/kmscon/kmscon;protocol=https;branch=main;tag=v${PV}"
-SRCREV = "55e7127eff12608f1ea52eb456cd982c94bcd5ce"
+SRCREV = "bd3efdf5c33e2a7049621fb4973e25f72f83cfe8"
 
 SRC_URI += " \
 "
