Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
	[209.85.221.49])
	by mail.openembedded.org (Postfix) with ESMTP id A65497FCEA
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 25 Jan 2020 20:24:06 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id b6so6196414wrq.0
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 25 Jan 2020 12:24:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=m/XCdwgdXFV7hkdSiPusI/xKVYm69zY/YembIn1B9f4=;
	b=Q3f7BXw7+BhGo3v9eQ1yyZSDTnPbXkAI1UbHcZJ+TNxMcfuSxcrikZwrvEAVCtcRV9
	y0BO5nXmfZIdU/h6EeUfAGr5sxqlRV3nVRwIeuXXhtqKda4dIy06VGr9WfJKjqK+/Fr4
	eQnb4BLd9j2/VZ6tEzAG1e/O2+IICBDYr1gcKcTJHWmHjdmIfclYt9HUc/ilCwv3MLnz
	NqGDooBmtowHymC+WuC1Ugy+OOn+gMmDngQ3qYGf5nHAhB1hTzFlGkjnljRb4+qiQpPr
	qtDj4CnPP5P7nJnUo8Z9kDID0JfPPMZcTa8Vq0ZvbVa2QL/vzS0qYBFXOOD3+WwBzp4g
	nvjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=m/XCdwgdXFV7hkdSiPusI/xKVYm69zY/YembIn1B9f4=;
	b=FZSE+XTUJvPcKYVqdQ1VoqrUgGtNrY1KcGKomTPCiGmvS2fqKPmE06x79UmDWyBw48
	CWteHon6faxtrzR7cDp5J1MwLpdaOn4VOfrMPKTlbPuNj2sXz7njzOBr9PujUwcncxG5
	7BMN32f7ZRyxM6KoMv9A9RzYlgPdLlY2uXjcmZptUmA6+VyyBsJDVPoczVc9yzEXtlXb
	N8dUsw1D+wp/VZ0YP22qD5EJB5SmX/0DaAHTJWKYxatVexjd54nacFFS8V7jNcHvanbU
	LQ/irNhDuSdhWI9/GZbrdYv89RQuFUflDzryJOuCz/SHFLqN6Lb87P+EHOMQzv3hurQo
	I7Vw==
X-Gm-Message-State: APjAAAUwt58dbiBg1fHwn8acHeyGFgNoeG5trAoO4ZdU+j/0yFvdCEli
	2ZnPhMRjwtNhPyQ7j66Dmn60mp1h
X-Google-Smtp-Source: APXvYqyRHsnO8ytdTIM/YESV3WajFuxWY/3py8W1OsGzQSkDiMFzEUFxNHaLWwJrMdbpmK/5gtPTvQ==
X-Received: by 2002:a5d:49cc:: with SMTP id t12mr12484080wrs.363.1579983846929;
	Sat, 25 Jan 2020 12:24:06 -0800 (PST)
Received: from localhost ([109.238.218.228]) by smtp.gmail.com with ESMTPSA id
	v14sm13193335wrm.28.2020.01.25.12.24.05
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 25 Jan 2020 12:24:06 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 25 Jan 2020 21:23:57 +0100
Message-Id: <20200125202357.4766-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [meta-oe][PATCH] packagegrop-meta-oe: remove blacklisted mpv
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
X-List-Received-Date: Sat, 25 Jan 2020 20:24:06 -0000
Content-Transfer-Encoding: 8bit

* it's blacklisted with:
  mpv_0.26.0.bb:PNBLACKLIST[mpv] = "Needs forward porting to use python3"

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
index 865cbb0bfc..d5789a758d 100644
--- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
+++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
@@ -207,7 +207,7 @@ RDEPENDS_packagegroup-meta-oe-multimedia ="\
     sound-theme-freedesktop v4l-utils yavta wavpack libvpx \
     ${@bb.utils.contains("DISTRO_FEATURES", "x11", "xpext pavucontrol xsp", "", d)} \
     libmikmod \
-    ${@bb.utils.contains("LICENSE_FLAGS_WHITELIST", "commercial", "libmad faad2 mpv", "", d)} \
+    ${@bb.utils.contains("LICENSE_FLAGS_WHITELIST", "commercial", "libmad faad2", "", d)} \
     "
 RDEPENDS_packagegroup-meta-oe-multimedia_remove_libc-musl = "alsa-oss"
 
-- 
2.20.1


