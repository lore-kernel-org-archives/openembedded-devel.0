Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
	[209.85.214.196])
	by mail.openembedded.org (Postfix) with ESMTP id 379EB7FC36
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  3 Nov 2019 00:38:00 +0000 (UTC)
Received: by mail-pl1-f196.google.com with SMTP id w8so6005607plq.5
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 02 Nov 2019 17:38:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=1sypRWdd1JI30HmE0/aYQQcirp++j2EkypewvfsINAQ=;
	b=WhIbptqZb43qUhp16vqXeW78CD6rQ9nfXHADJd8226lz5NB+EWZ2ByMh+JznD9ch6L
	HZVrragiEM0xQArdwV3Vq8oWVBnMKn/2SzJFhGV1H6ShXW0fckEeJlL1L5CRXF6mlcAY
	aB+h16UPfp4lcsih/rH1VAVySWmpP3uUL9ktKth6cGrQaWa5LcyD37QaeO8WSScYeBMF
	bf4Be2Db09V28+cX4qGkDAHL9yFhjd0/WoalLzI3nWHFgtRV1Fn8T5zQoGF3NO7QQrqh
	EOtptylizS51YO4YLh5KeJhaLYT4LRahV1WMA0jsOubgpUf8CDVkI/6m+lNH02pwArb3
	q0AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=1sypRWdd1JI30HmE0/aYQQcirp++j2EkypewvfsINAQ=;
	b=KA1f0z1ROJTFOM4xUYT5LxByb/pnQm/81p0L6GBayQvCFLOiZK8htkFJ5z/fQGEjz0
	cOhV9o/vRKIU246B8EZrxEf2QEE0oyxGLzyvg9Z0kfddcL7ifk/acLk6HzMopE6VFKdc
	fTpZtwK6MhySkJa9xrGlO9mc+0xxGWyZn2QsJ6QedmSbxA49nUiBmQ92UfjKGRezlSrl
	W/vhPC5AsJueYgkPG0ktVzUkoBC4GFrbyoQ3BpoHvHFsTCss6/0ENMGbFOZ9xN5tu3q1
	fIMfVDaqUfSqMAKdi/dgWq/wpsGOKIPWIi4SE3BC4Yxu56TWDLWGhN161uVRKioyB9EF
	MSjg==
X-Gm-Message-State: APjAAAUwyrcDB7h2YhDEvWBCN1oDbnskFtERrU4hHEaFhF1cl0bE18hY
	E4MvdqhNTQzpXezci7bIJv6iA9fPU18=
X-Google-Smtp-Source: APXvYqyW+52Omg91HvHbOOWO5gx1VGw94kDtywL4bGLHfYTeXw5SNb8zF+nqO3sJDHq76jXzmSww4A==
X-Received: by 2002:a17:902:8218:: with SMTP id
	x24mr20086611pln.139.1572741480736; 
	Sat, 02 Nov 2019 17:38:00 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:1c20::5caf])
	by smtp.gmail.com with ESMTPSA id
	129sm11256685pfg.38.2019.11.02.17.37.59
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 02 Nov 2019 17:38:00 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  2 Nov 2019 17:37:42 -0700
Message-Id: <20191103003742.1595-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191103003742.1595-1-raj.khem@gmail.com>
References: <20191103003742.1595-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 2/2] iwd: Use python3 variant of docutils during build
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
X-List-Received-Date: Sun, 03 Nov 2019 00:38:00 -0000
Content-Transfer-Encoding: 8bit

python2 is on its way out

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-connectivity/iwd/iwd_0.23.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-connectivity/iwd/iwd_0.23.bb b/meta-oe/recipes-connectivity/iwd/iwd_0.23.bb
index d48fb84504..20c6d04f7a 100644
--- a/meta-oe/recipes-connectivity/iwd/iwd_0.23.bb
+++ b/meta-oe/recipes-connectivity/iwd/iwd_0.23.bb
@@ -2,9 +2,9 @@ DESCRIPTION = "Wireless daemon for Linux"
 LICENSE = "LGPL-2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=fb504b67c50331fc78734fed90fb0e09"
 
-inherit autotools pkgconfig systemd pythonnative
+inherit autotools pkgconfig systemd python3native
 
-DEPENDS = "ell readline dbus python-docutils-native"
+DEPENDS = "ell readline dbus python3-docutils-native"
 
 SRC_URI = "git://git.kernel.org/pub/scm/network/wireless/iwd.git"
 SRCREV = "77f16ae26fc013477f6362a0c33f0e52e82863e0"
-- 
2.23.0


