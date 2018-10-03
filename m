Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
	[209.85.128.52])
	by mail.openembedded.org (Postfix) with ESMTP id 6349972EB7
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  3 Oct 2018 19:25:22 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id 143-v6so6773105wmf.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 03 Oct 2018 12:25:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=KGjjt19EAxpG2606jCbBWy+Sjg3DJM8RTUnj/6rHPZY=;
	b=jc7W5cBsTN24b1AnI1ItjIG0PkXns0dA6raI7yT2oHr/kfLfk3Uma+UwIBaKcfIkqC
	03vUnkZwpt4IrjCpjLUPJ/y4GHCZVempdkrzVKTqp/6U8Z3nQJTl/npE/JPN6CS1bs6d
	9SVhFXedAhzJqF6noaO+UUf7IPefzg9XC6zVqCrgucTCMzltvBd06tB3CZVd20qjYZJv
	UbYpyVixFI7FlwA8Ar4+U4lb46e3KOJRQu6Rxho61f9AIhFmOqGWC18k8sbh402dKThS
	oN3WJdcs/pzSdM0u9RQQoaV21hUY79uRjjToXaEuua6ZBMXg2eAwue/tTifEiNxkaSiT
	Loig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=KGjjt19EAxpG2606jCbBWy+Sjg3DJM8RTUnj/6rHPZY=;
	b=V1ebvItgaCQFlBrSOzSVwE+zIrej0r8Jy+AHaEuZ2gitxMpFsdSK99I6PNs2gt36Gy
	o3v/muNB6+KqoFmaDC/cFnnQUraN9+vJfgKSLmF/8gEYAsLQZzjLgvBewuizxMeXKlOt
	5m7EPmwx1NNotrWSipVYCZsc71vFNoBk6MWHdBZa7RM+DLZEpbXfpSEPS+3fZyPPctDn
	P6usfXmHa2eXsDAmrvDkoS1QFhAiuUJAaFnnXb1lsBTDAo4uE61bXFIOcUtfEm+O35W/
	WoHJLXhFtPY2FiQtLmSIkgISn/JnHjpw2z4OgV0qWzstJcWe5CgI3xabTqCKQYVsmyC1
	HAeQ==
X-Gm-Message-State: ABuFfoio7XM7LJGFP2+/EMqS140gZwlzZjYuGh+OP1PGcZhVw/p1pWi+
	zjFl9mWVS7bcCrX1UtDOWsQiaZw8
X-Google-Smtp-Source: ACcGV62GxFTYnQZvEGbV16RqMbwsLvK4N+Jx+Z5D4/v/F24USXjGnUwXhSof4K3Z9JjAxb149E5Zsw==
X-Received: by 2002:a1c:9895:: with SMTP id
	a143-v6mr2449870wme.43.1538594722763; 
	Wed, 03 Oct 2018 12:25:22 -0700 (PDT)
Received: from localhost.localdomain
	(p200300F07BC1EA401E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:f0:7bc1:ea40:1e6f:65ff:fe3e:7f61])
	by smtp.gmail.com with ESMTPSA id
	143-v6sm3533019wmv.6.2018.10.03.12.25.21
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 03 Oct 2018 12:25:21 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  3 Oct 2018 21:24:55 +0200
Message-Id: <20181003192455.24921-8-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.14.4
In-Reply-To: <20181003192455.24921-1-schnitzeltony@gmail.com>
References: <20181003192455.24921-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 8/8] xfce4-appfinder: upgrade 4.13.0 -> 4.13.1
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
X-List-Received-Date: Wed, 03 Oct 2018 19:25:22 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../{xfce4-appfinder_4.13.0.bb => xfce4-appfinder_4.13.1.bb}          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-xfce/xfce4-appfinder/{xfce4-appfinder_4.13.0.bb => xfce4-appfinder_4.13.1.bb} (69%)

diff --git a/meta-xfce/recipes-xfce/xfce4-appfinder/xfce4-appfinder_4.13.0.bb b/meta-xfce/recipes-xfce/xfce4-appfinder/xfce4-appfinder_4.13.1.bb
similarity index 69%
rename from meta-xfce/recipes-xfce/xfce4-appfinder/xfce4-appfinder_4.13.0.bb
rename to meta-xfce/recipes-xfce/xfce4-appfinder/xfce4-appfinder_4.13.1.bb
index 7e7391167..0336f54ba 100644
--- a/meta-xfce/recipes-xfce/xfce4-appfinder/xfce4-appfinder_4.13.0.bb
+++ b/meta-xfce/recipes-xfce/xfce4-appfinder/xfce4-appfinder_4.13.1.bb
@@ -8,7 +8,7 @@ inherit xfce distro_features_check
 
 REQUIRED_DISTRO_FEATURES = "x11"
 
-SRC_URI[md5sum] = "6b6cf080c891f7945953f8084a901552"
-SRC_URI[sha256sum] = "c0eb3b29eba3cfa9175ed35174e83a21faa2a2423ddb79501fe8846cc430e3ae"
+SRC_URI[md5sum] = "9e2a1f9b4ae3183c461b79891224c33f"
+SRC_URI[sha256sum] = "5cabb27bbe0a0864b785e1a38535a91516763e38d6bff41a3915a61d28254b03"
 
 FILES_${PN} += "${datadir}/appdata"
-- 
2.14.4


