Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com
	[209.85.215.170])
	by mail.openembedded.org (Postfix) with ESMTP id 80F8460635
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  3 Feb 2020 23:54:51 +0000 (UTC)
Received: by mail-pg1-f170.google.com with SMTP id l3so4605335pgi.8
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 03 Feb 2020 15:54:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=9XkCHiYi2MwiXdZWQmdsedryFZCPEWq4nnJyQu8eIWo=;
	b=dmT9B54NX5RuYg6Au/RIk7xM0T/9B51W+TmEozBescfWlL81/hvihqo/smuijoeu0U
	EsLH9BItVoWQO1jfK5tbb8Xe+Ff5sLx9Y+zwSVlD5RjcqKzEEBeVZzM5Scb5oDDAJMrV
	iXKcdevhTuUXwGkvSjLGvu8uKW1mepcS7Z2iGMEPOzNv7zZ5XG6HhxsUmjEdQsCUG1Wb
	UJN5GPCFQ3pxssoCCndJgqrJbh/6mACAcVW3ZPfyBt+DwV5Z28cN+zOY63yYIISBmSCk
	cgJ4pR1Vx5hgzXYQb16DGpdSq2VtD14/e2G7VOxU7stjxTqznlHSlUrpscGz0T9POHNx
	Sy1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=9XkCHiYi2MwiXdZWQmdsedryFZCPEWq4nnJyQu8eIWo=;
	b=PDP33ZZv5t0DJiPjiX50GnlYr8YGSrQFdbeGqvsxR7P1cW6I946UNrNflFdKGMVwO8
	zWYxSd0Rwourd1tXdcinssBHRMKccyaKl3Z35qZabeDJoZrwJ7UR4uEscO/u34jSSOeZ
	8UZHuwtFYJvIdr1x55qdKklBFPnEFRJtvaBZYZIyVJa4f+Bb8dRxC9kCsb8ZWKKiq1l4
	I0b8GJ4mVgd9varf0DkD+qHikQvhWBpoGzBS7auQF6WdO2TgjWdcd01jT3i43tmZuzVL
	6QLw2eMsCEf/1nAKv9nwOWtSCsKCoKDFrNFm7NHxWzDFI8vU40JTGlgcmju04OQ6x77R
	Gu5A==
X-Gm-Message-State: APjAAAXBD6GzNneLnghvr4lYHnreTWrORI4LDNIHd9rGV5/SuR/ti/KP
	ftQq5/NBK7pSbEK/plUitvyP43YWiIU=
X-Google-Smtp-Source: APXvYqwjZIRJjVShOVMTim6EWDLWDinvPvXHRePS+xiy833rdWzrt3QhCvqoJ3K0NWkQpoPh/nNfVg==
X-Received: by 2002:a63:5826:: with SMTP id m38mr9418308pgb.191.1580774092206; 
	Mon, 03 Feb 2020 15:54:52 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::1852])
	by smtp.gmail.com with ESMTPSA id
	17sm21494640pfv.142.2020.02.03.15.54.51
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 03 Feb 2020 15:54:51 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  3 Feb 2020 15:54:52 -0800
Message-Id: <20200203235452.320970-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Subject: [meta-multimedia][PATCH] vlc: Link with libatomic on rv64
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
X-List-Received-Date: Mon, 03 Feb 2020 23:54:52 -0000
Content-Transfer-Encoding: 8bit

Fixes
vlc-3.0.8/src/misc/picture_pool.c:200: undefined reference to `__atomic_fetch_add_2'
vlc-3.0.8/src/audio_output/dec.c:201: undefined reference to `__atomic_exchange_1'

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-multimedia/recipes-multimedia/vlc/vlc_3.0.8.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-multimedia/recipes-multimedia/vlc/vlc_3.0.8.bb b/meta-multimedia/recipes-multimedia/vlc/vlc_3.0.8.bb
index e29ade65c4..7fadca4399 100644
--- a/meta-multimedia/recipes-multimedia/vlc/vlc_3.0.8.bb
+++ b/meta-multimedia/recipes-multimedia/vlc/vlc_3.0.8.bb
@@ -13,6 +13,8 @@ DEPENDS = "coreutils-native fribidi libtool libgcrypt libgcrypt-native \
    libmtp libopus orc libsamplerate0 libusb1 schroedinger taglib \
    tiff"
 
+LDFLAGS_append_riscv64 = " -latomic"
+
 # While this item does not require it, it depends on ffmpeg which does
 LICENSE_FLAGS = "commercial"
 
-- 
2.25.0


