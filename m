Return-Path: <net147@gmail.com>
Received: from mail-pf0-f176.google.com (mail-pf0-f176.google.com
	[209.85.192.176])
	by mail.openembedded.org (Postfix) with ESMTP id 4FC4F6067D
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Mar 2016 03:30:44 +0000 (UTC)
Received: by mail-pf0-f176.google.com with SMTP id x3so6256045pfb.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Mar 2016 20:30:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=m3RBxdUL7FFFiGta4pI/lJnNd3i6XcNQ43M1gI2o9b0=;
	b=X/ORNr2wZS4T3+JWLhvp9s2ycppKRgvVJny7yVPuHbPCH/rhnVCh109CrcnKTQVXQk
	aY1XHJMFuwUpMICWJLnosjSdjWG5GiF4m6j5CbvV9jXs/jHI5YqFO9kid/qX7BaFnhhX
	M9szaKMaC86CySECZO7lb+jQq5tFkqVBuHjxvkQA4nOJ3gVJGCr19dsQMPH/Tsl397dn
	rJZv9HUWqANFGYaf8UW7jkzifc9S5TUQxLAwsvOxFgdkULsmHiZ/Tfb9/SWK0St2C64p
	R0iwwICssoHKHndIkKe6SR05cOqMZt+5mz+vKrNsxhRtvjvkJNM0NreOMOFVJFNvVoY7
	I48w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=m3RBxdUL7FFFiGta4pI/lJnNd3i6XcNQ43M1gI2o9b0=;
	b=ZxuCwayYSkRZSTNDiuH03Z0p4wlVSSWaVTrnz3b2Ivs5+Psn9svLWpM9QYkdIpdI7T
	4ZRO5Pg1FmJQGsL3/67Gs25+q+ChkeULLDTO+hptL6bDj+0g07J1vHs4vwyFFtpN2wk0
	psEEDc0aaxVMoeHB3uixASR0AWxTG/0V3EetNKUArKPQ7MDmAePxP+ibLgXp3MpDTwbM
	BG+jp45k3pKlKtkLimUPn2SKziWXk8L5EyHtM1o9L3PaHe8yJ+LKdG9J7eZHd6kk9bvu
	Xna7pYTUVrntISN30lRIpY9ifOGWVzlTy61/kDMrTkq8jb2b0QVCaWwu7oTa11Z36qjM
	JuOA==
X-Gm-Message-State: AD7BkJK+J5ZPThFk0VYx9cEah5DJxo8EZ/dSYkSW3U+e266HlN9K1aurw58rOg9icZJ5QQ==
X-Received: by 10.66.248.198 with SMTP id yo6mr872309pac.54.1458703845912;
	Tue, 22 Mar 2016 20:30:45 -0700 (PDT)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by smtp.gmail.com with ESMTPSA id h2sm438131pfd.91.2016.03.22.20.30.44
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 22 Mar 2016 20:30:45 -0700 (PDT)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 23 Mar 2016 14:29:57 +1100
Message-Id: <1458703797-16249-1-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 2.7.3
Subject: [meta-oe][PATCH] nodejs: update to 4.4.1
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 23 Mar 2016 03:30:45 -0000

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 meta-oe/recipes-devtools/nodejs/{nodejs_4.4.0.bb => nodejs_4.4.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-devtools/nodejs/{nodejs_4.4.0.bb => nodejs_4.4.1.bb} (95%)

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_4.4.0.bb b/meta-oe/recipes-devtools/nodejs/nodejs_4.4.1.bb
similarity index 95%
rename from meta-oe/recipes-devtools/nodejs/nodejs_4.4.0.bb
rename to meta-oe/recipes-devtools/nodejs/nodejs_4.4.1.bb
index 4cdb067..0d0136e 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_4.4.0.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_4.4.1.bb
@@ -12,8 +12,8 @@ COMPATIBLE_MACHINE_mips64 = "(!.*mips64).*"
 SRC_URI = "http://nodejs.org/dist/v${PV}/node-v${PV}.tar.xz \
     file://no-registry.patch \
 "
-SRC_URI[md5sum] = "260800bfed6c3cb5dd2146343cb07241"
-SRC_URI[sha256sum] = "6ae44ae9a9cd1f102ca7f3ea09ca6223afe88fab4911f1bf21c9da2a1e795f1d"
+SRC_URI[md5sum] = "0ebf5aeb6f88a68546351e9e703f8a47"
+SRC_URI[sha256sum] = "3a37c89a3ac965688f9e6557579993b73eee44195a5fd53fded03a667d3d6a0a"
 
 S = "${WORKDIR}/node-v${PV}"
 
-- 
2.7.3


