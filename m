Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 8046C71D90
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Feb 2017 23:03:04 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id 134so2212296wmj.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Feb 2017 15:03:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=EZSvUXZggRJVCw8na1filtuo+MEqVqZL6WS0AzmmlEY=;
	b=oxZr4rKqnqldDvhHSFezyXt+6X/xWun/YWzQqGHbD1FV22b2m261SG74GXHd+ilAeM
	d+Knhu48EJKwht8uNfbTwInYNNFCDfhKrx+aYZhdXwssYOy4Qbzy26SLLgCeffQzhI4K
	XcvTcwlltvOIIFQZjk7HEqY30UZnD/4IAmOARFURJkt1HYOQbPn3T+0Ko6E5JR0BbUAY
	bI9gA8CLpBiZRbziThikLAbW+4I/diF514M1OycgPcU4GH00GrYbpUxLQBrBIlAMm2fY
	RHQlXXEr4rUKMuTRtH3wzjgDvXltPD5dKhLW0sTz3tQNlGvrL0Y9Cu1QFXXkUCPJZfKB
	07Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=EZSvUXZggRJVCw8na1filtuo+MEqVqZL6WS0AzmmlEY=;
	b=Pqk4IQx4RqSSJFzICpOvnJeHQ+XJFwh1NtVdX+GE++nYu6v9PWD/UMpUN8mKq+V9ka
	/3u5Qd1RTIKVwaBi6JyntOC/C2me654f6JKa07tKfPsveIe8aMGBAWH8Q5N/uAuXsh3G
	TmNzP3kqLe485QCKAbGwB7Sp14k9tlc8hcXQsFg0fXhrJ/qGnQpbYGIDUWw0SeV1QG8I
	0GO85QMojPSowpJBZ4yF9H78CA6ZLbSa3K3vCKpEUgtHXRhfd6AzfCU7PWc37Y9YPmxU
	00XX9SthBjEswhGNThg6IfFKiO7h/HdFYNzhogTDPsNGaooCGR7e2T0+MoboT1r4Xf9i
	40cw==
X-Gm-Message-State: AMke39lT8bJTLIVBWRr3vIzkWDTS1V89VO/jKvqNNWH7i43r39LtF6b3UZ1aNUo2WvnNCA==
X-Received: by 10.28.15.2 with SMTP id 2mr766128wmp.66.1487804585026;
	Wed, 22 Feb 2017 15:03:05 -0800 (PST)
Received: from PC192-168-2-116.speedport.ip
	(p20030046E912A1041E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:46:e912:a104:1e6f:65ff:fe3e:7f61])
	by smtp.googlemail.com with ESMTPSA id
	q4sm3479696wrc.35.2017.02.22.15.03.03
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 22 Feb 2017 15:03:04 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 23 Feb 2017 00:02:40 +0100
Message-Id: <20170222230250.30288-2-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <20170222230250.30288-1-schnitzeltony@googlemail.com>
References: <20170222230250.30288-1-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 01/11] libsdl-mixer: add pkgconfig to inherit and unblacklist
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
X-List-Received-Date: Wed, 22 Feb 2017 23:03:04 -0000
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


