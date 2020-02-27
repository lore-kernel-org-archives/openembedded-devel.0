Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
	[209.85.221.48])
	by mail.openembedded.org (Postfix) with ESMTP id 4E64161899
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Feb 2020 22:12:58 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id r17so701549wrj.7
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Feb 2020 14:12:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=crf/1oUBbBeHAezVaQyGuubMxVJfArMBMKHb8ZA0drU=;
	b=dVR3bCwNOuaPRXStRi8rWPligVivSyVx2yq/bMzY0Pc2vQnVdAFfGrCcXeBYtOjzpi
	9YNd07LjMIIMPhVJPRVx4AodJOom4FjidMBE/Q+wJ5PndemzS2NLF2iZ8bjOPbzR7LGp
	CuQGgwbRqqRHpxSD45zqlpfx1FVSvqhLMMgqT1bGv2FQhBSLYZ2McSaMkrNiyGdZM0/b
	fmd1p3z/5rLOxgzfIjGGX1YVNDaUMEsO09ypl/eBnG63/1VCsUmGuKuW18fMildlgeJy
	uV+f8C92PlQOeEFPIwKpH726Zz9pBdC9DicXL51zhrzgSw4tI8JR/8bKaRMzcATB/nWK
	TtRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=crf/1oUBbBeHAezVaQyGuubMxVJfArMBMKHb8ZA0drU=;
	b=WLPowriuVyMApWwwOZSrxmcYdh6yf4iNisetynrAt5BvDQs0pQ2tAQDLKLFN3xvngz
	4z9Al2qA4nqn01f1Vki+mlD5S7RedUgMDofGYHJsx6ZzrmIY66MaFKW8abQKKAEwx/b6
	caSmIsbdR6su70t/PmcyYhPs+bMOggQIe0FTdQILUv4hAGR8KBypMd9BDpZmnRg0gwFh
	ZeqbRrz7SWZV7DYyewn45liqtNlEr1Eb1qkQAOt+bGdx9X5DWz5ZjffhvWLTGT8w8rVP
	4D7VT8kvV2D4lIGBLuMNSnSrFxPEnjfC5zdMAKGdN85PKUXFAxLELRq/4x3E8rnJgSyj
	6L2Q==
X-Gm-Message-State: APjAAAW7LoAKupnqm8rmcuDLecVWVFUWSGU6MXNr3qMdWt09tChFnVZu
	i2JimyuRh8YxsOolIoAGY4lMpdKA
X-Google-Smtp-Source: APXvYqx3dswxTgOvAfwrIGx+ydQjGx1hfi4q8vVSBd9F3hgpLDLgifpI0QU7FW+UI9Hk5wStVpBjfg==
X-Received: by 2002:adf:a411:: with SMTP id d17mr993885wra.126.1582841578998; 
	Thu, 27 Feb 2020 14:12:58 -0800 (PST)
Received: from superandy.speedport.ip
	(p200300F07F102C9262505CD5EB98F253.dip0.t-ipconnect.de.
	[2003:f0:7f10:2c92:6250:5cd5:eb98:f253])
	by smtp.gmail.com with ESMTPSA id y8sm8911422wma.10.2020.02.27.14.12.58
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 27 Feb 2020 14:12:58 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 27 Feb 2020 23:12:40 +0100
Message-Id: <20200227221245.22944-3-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20200227221245.22944-1-schnitzeltony@gmail.com>
References: <20200227221245.22944-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 3/8] gjs: upgrade 1.58.4 -> 1.58.5
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
X-List-Received-Date: Thu, 27 Feb 2020 22:12:59 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta-gnome/recipes-gnome/gjs/{gjs_1.58.4.bb => gjs_1.58.5.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-gnome/recipes-gnome/gjs/{gjs_1.58.4.bb => gjs_1.58.5.bb} (87%)

diff --git a/meta-gnome/recipes-gnome/gjs/gjs_1.58.4.bb b/meta-gnome/recipes-gnome/gjs/gjs_1.58.5.bb
similarity index 87%
rename from meta-gnome/recipes-gnome/gjs/gjs_1.58.4.bb
rename to meta-gnome/recipes-gnome/gjs/gjs_1.58.5.bb
index eb7d323a6..fd74c45c1 100644
--- a/meta-gnome/recipes-gnome/gjs/gjs_1.58.4.bb
+++ b/meta-gnome/recipes-gnome/gjs/gjs_1.58.5.bb
@@ -11,8 +11,8 @@ DEPENDS = "mozjs gtk+3"
 
 inherit gnomebase gsettings gobject-introspection vala gettext features_check upstream-version-is-even
 
-SRC_URI[archive.md5sum] = "385f4baa266991a08d3e425bc69ee962"
-SRC_URI[archive.sha256sum] = "261a3f666c771d7744965fe71b804fc2c3a3d46a8e3e8d4f7ed5ef97967ebd5f"
+SRC_URI[archive.md5sum] = "4e74456ccb16d4cc5004a441f6abbec1"
+SRC_URI[archive.sha256sum] = "e76d99c09f887438b9883e328710b26b3717f6dcdb4097dc7a9bab06ebd7a13a"
 SRC_URI += "file://0001-Disable-tests-on-host.patch"
 
 # gobject-introspection is mandatory and cannot be configured
-- 
2.21.0


