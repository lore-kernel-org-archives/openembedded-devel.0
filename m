Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lf1-f66.google.com (mail-lf1-f66.google.com
	[209.85.167.66])
	by mail.openembedded.org (Postfix) with ESMTP id 546607D034
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  7 Apr 2019 13:09:38 +0000 (UTC)
Received: by mail-lf1-f66.google.com with SMTP id o19so7478620lfl.4
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 07 Apr 2019 06:09:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=msxb78Km3vvFp93HYYfNLHOKlhp9NSt5N0Ukku6ojzg=;
	b=vVDJf1fRlX6BINQKivyjnVuNOKC5ZmOsxyZDrwYvVVf068rv/7phaP6T2QUiJl4eQI
	yp4WaaKIxySBCaFOLejlOrMK9GxtYGjKF5MvX8kxMAyd8VVJIcq8IytV1MKYfM5JWjQR
	d04af6pmLaZyBIe4jpak+ggNwxsdcbejLkfWWSQm6s5yWKAER9dY03pF+dzEaXWClfJg
	x0kC3N7HTU4h5j0C90pd54Ly9o4sWnU9nl36veKGfnOtN3Xl0ulUZiEa61ndJENkeFVK
	Qfh0Yc1DclloPr6cwnUykUyRuv5RbDT7MdhLwuJD+OY9/vw51DMMc0hseARtoL1fzM5A
	mxbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=msxb78Km3vvFp93HYYfNLHOKlhp9NSt5N0Ukku6ojzg=;
	b=EVj8X8jNEdfA82SmqFWLdIVOOFImOzPxq8P3RXQlK7DS16PcWH2yEengCyE5omPT/R
	e97nchpnWcEouffI4NAPs5bPmaCA4lECV9V1N0a0q4R3yWuzLsJWIqEqRIMe7/RBND/2
	UGbktANDSqJoPf6GeeohaNxtaGq4kDKfVSVqh70zknE/4voYk9mj2BEXJphvLSOiR2xD
	h0hoi6WDxovXb5qvRT8aboIag/cF84TjBHjqXRVyRcQuXyBb2fIaxNW8UFy4867x7lYf
	OkXaCtyDhAbzPlbdrFp3e/3Q6F3WgMARtgfu9Lbu3+41i9pODwuPbF2ZHKvRDCmliqHL
	34qQ==
X-Gm-Message-State: APjAAAWNmyPqp0QvZGFGCrTSQP/L82CSpy8BHgaGkdNQjyKgsdRZ3Tal
	G0742jgbWxENbOQRJQstqxC99uDNDj0=
X-Google-Smtp-Source: APXvYqw6u1EKm+Pwm5L/XUO4PXD6MLpYH8RBx865PbBX5iev7vpYIzTEnzlErnzf6Rfhpwi0zRtVLA==
X-Received: by 2002:ac2:54bc:: with SMTP id w28mr12733446lfk.127.1554642578583;
	Sun, 07 Apr 2019 06:09:38 -0700 (PDT)
Received: from localhost.localdomain (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108]) by smtp.gmail.com with ESMTPSA id
	w19sm5031653lfe.23.2019.04.07.06.09.37
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 07 Apr 2019 06:09:38 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  7 Apr 2019 15:09:35 +0200
Message-Id: <20190407130935.10670-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH][meta-networking] libowfat: update to 0.32
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
X-List-Received-Date: Sun, 07 Apr 2019 13:09:38 -0000

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../ncp/{libowfat_0.31.bb => libowfat_0.32.bb}                | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-support/ncp/{libowfat_0.31.bb => libowfat_0.32.bb} (84%)

diff --git a/meta-networking/recipes-support/ncp/libowfat_0.31.bb b/meta-networking/recipes-support/ncp/libowfat_0.32.bb
similarity index 84%
rename from meta-networking/recipes-support/ncp/libowfat_0.31.bb
rename to meta-networking/recipes-support/ncp/libowfat_0.32.bb
index 4b072f7e7..fba35526d 100644
--- a/meta-networking/recipes-support/ncp/libowfat_0.31.bb
+++ b/meta-networking/recipes-support/ncp/libowfat_0.32.bb
@@ -7,8 +7,8 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=8ca43cbc842c2336e835926c2166c28b"
 
 SRC_URI = "https://www.fefe.de/${BPN}/${BP}.tar.xz"
-SRC_URI[md5sum] = "120798fab86cfd72dc6b12284d248dd0"
-SRC_URI[sha256sum] = "d1e4ac1cfccbb7dc51d77d96398e6302d229ba7538158826c84cb4254c7e8a12"
+SRC_URI[md5sum] = "ee015ccf45cb2bc61c942642038c2bdc"
+SRC_URI[sha256sum] = "f4b9b3d9922dc25bc93adedf9e9ff8ddbebaf623f14c8e7a5f2301bfef7998c1"
 
 EXTRA_OEMAKE = "\
     DIET= \
-- 
2.17.1


