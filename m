Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wr0-f194.google.com (mail-wr0-f194.google.com
	[209.85.128.194])
	by mail.openembedded.org (Postfix) with ESMTP id 2C24F72FE2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Feb 2017 23:06:19 +0000 (UTC)
Received: by mail-wr0-f194.google.com with SMTP id 89so10123158wrr.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Feb 2017 15:06:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=EZSvUXZggRJVCw8na1filtuo+MEqVqZL6WS0AzmmlEY=;
	b=bLY/mRK++Qh2PpitARSWTOSyNCcrltGAr+cqr0Dt6J+69Ds+lALql59qxYIM01y9g6
	/zHmnZbTbDszA5fzTafQu+qkli+tG1DXt6QhgDsWoCIgVchSea1gmumcyeGwF3e83kGB
	o37e1cvgP0AGE7BjDp8G1smaA7NwMyFTYjQU6BnlYF7YWIBhDVRHJZkMb5lvhb46Y9jb
	FI5OBnaEa9fxhF9SzPBKeTzIJGxbqUAFmvr1vpbGf9gpM/amck9Ld3OzJbJAaQp68ff5
	D/JFGClhC3LKn9cqOXwzm+f113aTW1POPqAjrzvCF7a/KD+8HxbPIXABCTtY8r7N6nyE
	nLfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=EZSvUXZggRJVCw8na1filtuo+MEqVqZL6WS0AzmmlEY=;
	b=Pa7NuJDVgLiVjVLxQm/JHJcVloIXChyfpF2ek5TzOKSi6297f0B4H9qV5bRF3pPEcW
	Hl/UD3abKRXsPGG/001c9psJrFPj/6WprTdDZEG+rEmw6KFdCQcGFqPirkaExlWt/Mjl
	POhY3m7RSnT/h+saR2ACpXG1DnvrVze5tk+o5WZObc69FljLkJEqiu7sPsRyXpknXAwL
	JxSuF2nBiHQmnFlY3Iuux6ntJxRyq7IhFUDNfJIQd7di5eaypN3qirJhQl7f4qYCqRll
	6m5qUSi7HtbfjYvEgahowKjqPs99fEqix5IwvP+sA0GvQXurj7y3VfrML2Rw6zqkAsHO
	xFtg==
X-Gm-Message-State: AMke39lzRKL+0wluECUYFVMBBAtPt7dPyLmGB9EDnsPTVy7ApYkrQDLWNppglEHQO43ZiQ==
X-Received: by 10.223.129.163 with SMTP id 32mr20610804wra.140.1487718380703; 
	Tue, 21 Feb 2017 15:06:20 -0800 (PST)
Received: from PC192-168-2-116.speedport.ip
	(p20030046E912A1201E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:46:e912:a120:1e6f:65ff:fe3e:7f61])
	by smtp.googlemail.com with ESMTPSA id
	d29sm19284499wmi.19.2017.02.21.15.06.19
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 21 Feb 2017 15:06:20 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 22 Feb 2017 00:05:36 +0100
Message-Id: <20170221230538.21902-2-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <20170221230538.21902-1-schnitzeltony@googlemail.com>
References: <20170221230538.21902-1-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 1/3] libsdl-mixer: add pkgconfig to inherit and unblacklist
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
X-List-Received-Date: Tue, 21 Feb 2017 23:06:24 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-oe/recipes-multimedia/libsdl-mixer/libsdl-mixer_1.2.12.bb | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/meta-oe/recipes-multimedia/libsdl-mixer/libsdl-mixer_1.2.12.bb b/meta-oe/recipes-multimedia/libsdl-mixer/libsdl-mixer_1.2.12.bb
index 06623f8..c83fcc8 100644
--- a/meta-oe/recipes-multimedia/libsdl-mixer/libsdl-mixer_1.2.12.bb
+++ b/meta-oe/recipes-multimedia/libsdl-mixer/libsdl-mixer_1.2.12.bb
@@ -13,7 +13,7 @@ SRC_URI[sha256sum] = "1644308279a975799049e4826af2cfc787cad2abb11aa14562e402521f
 
 S = "${WORKDIR}/SDL_mixer-${PV}"
 
-inherit autotools-brokensep
+inherit autotools-brokensep pkgconfig
 
 EXTRA_AUTORECONF += "--include=acinclude"
 EXTRA_OECONF = "--disable-music-mp3 --enable-music-ogg --enable-music-ogg-tremor LIBS=-L${STAGING_LIBDIR}"
@@ -37,6 +37,3 @@ do_configure () {
         sed -i -e 's:-L/usr/lib:-L${STAGING_LIBDIR}:g' $i
     done
 }
-
-
-PNBLACKLIST[libsdl-mixer] ?= "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/130592/"
-- 
2.9.3


