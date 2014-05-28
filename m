Return-Path: <ticotimo@gmail.com>
Received: from mail-pa0-f47.google.com (unknown [209.85.220.47])
	by mail.openembedded.org (Postfix) with ESMTP id EE1C365F11
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 May 2014 03:26:23 +0000 (UTC)
Received: by mail-pa0-f47.google.com with SMTP id lf10so10176221pab.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 May 2014 20:26:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=czjqeel3WlPvHyQUC50mbX1yEUO9y0nkAEmqWnd2Btg=;
	b=FA3rftqZsKIijtgXZaqYPwidhOKwzGEBy00oGbWJRzd3dtnqx99H2W3mxy/dgfmL/T
	lb/iP51dD1hBGOkm3PRWshtLRGI7Ow6uJbdolRDjbaiFQB62XhxInEd0vUATBETGyN/m
	6QXn+7VwUDzwTkU2jMUzfyx4uz2vhKg0vLdRF/FOfHC1ggU9rf6kngtLGZSr6GJ21eLg
	eTIN/tvXvM3IXoQfAWoOny/FzDxRtxue4nvFvZN0Wxu16G3scGDLAbVK15YuxH+eEa/x
	ceOry4wL4ddNHx9ho3zBdyQJaHK5aXBHn4higajQNM0oyiBnuTtnyv6nTQuusPEitpj2
	vrRQ==
X-Received: by 10.68.164.67 with SMTP id yo3mr42208542pbb.104.1401247584899;
	Tue, 27 May 2014 20:26:24 -0700 (PDT)
Received: from gentoo.localdomain (75-128-22-150.dhcp.snlo.ca.charter.com.
	[75.128.22.150]) by mx.google.com with ESMTPSA id
	tg9sm25740806pbc.29.2014.05.27.20.26.23 for <multiple recipients>
	(version=TLSv1.2 cipher=AES128-GCM-SHA256 bits=128/128);
	Tue, 27 May 2014 20:26:24 -0700 (PDT)
From: Tim Orling <ticotimo@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 27 May 2014 20:29:15 -0700
Message-Id: <1401247755-25062-1-git-send-email-ticotimo@gmail.com>
X-Mailer: git-send-email 1.8.3.2
Subject: [meta-oe][PATCH] libsdl-mixer: fix S!=B failure
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 28 May 2014 03:26:24 -0000

From: Tim Orling <TicoTimo@gmail.com>

This package does not like being built out-of-tree.

Fixes:
| configure: error: cannot find install-sh, install.sh, or shtool in
[...]

Signed-off-by: Tim Orling <TicoTimo@gmail.com>
---
 meta-oe/recipes-multimedia/libsdl-mixer/libsdl-mixer_1.2.12.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-multimedia/libsdl-mixer/libsdl-mixer_1.2.12.bb b/meta-oe/recipes-multimedia/libsdl-mixer/libsdl-mixer_1.2.12.bb
index 19b9236..f1a01b9 100644
--- a/meta-oe/recipes-multimedia/libsdl-mixer/libsdl-mixer_1.2.12.bb
+++ b/meta-oe/recipes-multimedia/libsdl-mixer/libsdl-mixer_1.2.12.bb
@@ -13,7 +13,7 @@ SRC_URI[sha256sum] = "1644308279a975799049e4826af2cfc787cad2abb11aa14562e402521f
 
 S = "${WORKDIR}/SDL_mixer-${PV}"
 
-inherit autotools
+inherit autotools-brokensep
 
 EXTRA_AUTORECONF += "--include=acinclude"
 EXTRA_OECONF = "--disable-music-mp3 --enable-music-ogg --enable-music-ogg-tremor LIBS=-L${STAGING_LIBDIR}"
-- 
1.8.3.2


