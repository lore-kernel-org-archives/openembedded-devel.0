Return-Path: <rehsack@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id AC84778F71
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Aug 2018 14:28:00 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id s12-v6so8317388wmc.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Aug 2018 07:28:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=Y/DnOzejNzwvGgxyAqN9LN8RE8SWB4zW3cqocSb5Hp4=;
	b=XTQ11nvcy0OuKlIHlaPESyLRNnpX4+xOY8aYj1jnrtO/vAFgpNePGI5BQ/6Nx4CGXd
	vgQQWVJ2fW6D0or5+T5GWJC7X+Xpiz+GYncOIugt8mQT7loW5+Yyw/xkGroma+eJ7OW9
	DW7iZ9F8AxVYue0GQiHUMdx4M4nnIcz4cKh4iceBpRNVx7CnoUZj5AtCIP/j/CT9SP75
	20HoxLhY1ZaFqB3t2FK6zgU7qa0QS4YzslXP53nH/+uU5Pb3msAEtPtLqqNGpinHbobY
	xo5DUFOtwN36/7SHPIfhsy77N7s35wvKu1LYUaRGu2PCz5/0jBz0T8gC61NhEKyJAAeS
	nyjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references;
	bh=Y/DnOzejNzwvGgxyAqN9LN8RE8SWB4zW3cqocSb5Hp4=;
	b=Ys9w2hlZ3D4jUyLXElxv9wIOXyQfUxdc7MhFsl/mYHzb9PebBoQu1HN2BX+xY6gDj6
	avWolvHXkFU16+ikc/uHRQR9TEA5DWHU5q5kX+GJHqUXRtflbw5SongnmcGCLyZ9MVkt
	paA+5s4y/bBjXKQcm5UZFHYuon0DLUZH1k6GbINTc8yt8M30ImSOIO+lYUSwcE9HtZ/o
	j4dA0F9yYZthemuZVt0VjHlVmWzwr3y68+Cq7ni2bAn6i4gELEaYMYGBBeQEhjJljlPy
	EVn4cH4OjD8cwFhYhob4J47uLgQDMw1spKki0tBcviy4qIF2STtLMvy1MKNYBoah8Lve
	GCOw==
X-Gm-Message-State: APzg51DXWppRuQIbrFOgQY5ecNpHAhwsnMKohldCvWW+q87zkvKIeG11
	CJIVfJb1qcjvkojrg3X0N+oDBhBw
X-Google-Smtp-Source: ANB0VdaxCUsfi5r2VZnPEVPdBbxAji9rVOcC6Yh0mTKOFFfBwB63ymcpECo4d27h1SyDWQoyTQ2wVA==
X-Received: by 2002:a1c:910d:: with SMTP id
	t13-v6mr5463709wmd.15.1535380081273; 
	Mon, 27 Aug 2018 07:28:01 -0700 (PDT)
Received: from beaker.muppets.liwing.de (b2b-78-94-80-58.unitymedia.biz.
	[78.94.80.58]) by smtp.gmail.com with ESMTPSA id
	j44-v6sm25766083wre.40.2018.08.27.07.28.00
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 27 Aug 2018 07:28:00 -0700 (PDT)
Sender: Jens Rehsack <rehsack@gmail.com>
From: Jens Rehsack <sno@netbsd.org>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 27 Aug 2018 16:27:38 +0200
Message-Id: <20180827142738.18615-2-sno@netbsd.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180827142738.18615-1-sno@netbsd.org>
References: <20180827142738.18615-1-sno@netbsd.org>
Cc: Jens Rehsack <sno@netbsd.org>
Subject: [meta-perl][PATCH 2/2] libcrypt-openssl-rsa-perl: Update to 0.30
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
X-List-Received-Date: Mon, 27 Aug 2018 14:28:01 -0000

Update recipe for CPAN hosted Perl5 module Crypt::OpenSSL::RSA
from 0.28 to 0.30 to fix build issues when using openssl 1.1 and
to express our love to the Perl Programming Language.

Changes since 0.28: https://metacpan.org/changes/release/TODDR/Crypt-OpenSSL-RSA-0.30

Signed-off-by: Jens Rehsack <sno@netbsd.org>
---
 ...rsa-perl_0.28.bb => libcrypt-openssl-rsa-perl_0.30.bb} | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
 rename meta-perl/recipes-perl/libcrypt/{libcrypt-openssl-rsa-perl_0.28.bb => libcrypt-openssl-rsa-perl_0.30.bb} (64%)

diff --git a/meta-perl/recipes-perl/libcrypt/libcrypt-openssl-rsa-perl_0.28.bb b/meta-perl/recipes-perl/libcrypt/libcrypt-openssl-rsa-perl_0.30.bb
similarity index 64%
rename from meta-perl/recipes-perl/libcrypt/libcrypt-openssl-rsa-perl_0.28.bb
rename to meta-perl/recipes-perl/libcrypt/libcrypt-openssl-rsa-perl_0.30.bb
index f0c610f3a..0a2ad8aa4 100644
--- a/meta-perl/recipes-perl/libcrypt/libcrypt-openssl-rsa-perl_0.28.bb
+++ b/meta-perl/recipes-perl/libcrypt/libcrypt-openssl-rsa-perl_0.30.bb
@@ -1,14 +1,14 @@
 SUMMARY = "Crypt Openssl RSA cpan module"
 SECTION = "libs"
 LICENSE = "Artistic-1.0 | GPL-1.0+"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=385c55653886acac3821999a3ccd17b3"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=a67ceecc5d9a91a5a0d003ba50c26346"
 
 SRC_URI = "http://www.cpan.org/modules/by-module/Crypt/Crypt-OpenSSL-RSA-${PV}.tar.gz "
 
-SRC_URI[md5sum] = "86217a5036fc63779c30420b5fd84129"
-SRC_URI[sha256sum] = "5357f977464bb3a8184cf2d3341851a10d5515b4b2b0dfb88bf78995c0ded7be"
+SRC_URI[md5sum] = "10bca2fc6d0ba1aa329f227424ae87d5"
+SRC_URI[sha256sum] = "23e13531397af102db4fd24bcf70137add7c85c23cca697c43aa71c2959a29ac"
 
-DEPENDS += "openssl"
+DEPENDS += "libcrypt-openssl-guess-native openssl"
 
 RDEPENDS_${PN}="libcrypt-openssl-random-perl"
 
-- 
2.17.1


