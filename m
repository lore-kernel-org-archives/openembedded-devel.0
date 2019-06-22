Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com
	[209.85.167.50])
	by mail.openembedded.org (Postfix) with ESMTP id 6FA436D52B
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 22 Jun 2019 01:47:50 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id u10so6243586lfm.12
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Jun 2019 18:47:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=4PbmNLHO22OZUUpOdQyjDFhInuHC1z4Ffx4pSVWuRm8=;
	b=PD1L1GbkjyDw57ZxMsJc0j4Cnq8TZiPIocp7n7d9F/zlaGzf2tMObm9G6QaPGqgUcs
	zVn9Ho7axEOhICEZfpoUKc5vpO26QIRvTWrmYyG7X9RGhF4h+GEF+z9GFsfonNFJCo6k
	hIUdw/HjhHkHnC5Ct8spXdnLXik7Ci7SFkz89XpwaehFEQQJqkws5elRjYyri5gR6tfK
	aIoG5Y480FDqc6F/LilTNkewjbWMiYpAr1KCfK2M4V4B+5BquluDqjsh4zhU04WKeBdv
	9LFzDlUIxrkS8nWnH9tNLr/e4SFSeFi3P6PqC6dFpqrVkiDsAvEk3OkbIbV5IOiaBNOf
	Z66g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=4PbmNLHO22OZUUpOdQyjDFhInuHC1z4Ffx4pSVWuRm8=;
	b=oggC4v8vHjl/o4gal/XWPGbniTLvhXISqfgCMokSdvtG6DFzJFcoV0gWoZEP1KNyXx
	IflXgGRWgCqJ0Ix0rTn5SdIzLmBPBRv1U6r4zlknDMAbB7gEElYGZv1g1P2L6NaIq5oC
	F+8MDqwb35ed6lYgSNzrwnmUcoRbhl0RKggC9hF1U/08nLpwcprmxpgRT7sl2LeiB2QC
	WT1iKzhsnQXRvaTqAEI8RvxOxROnxy3a7JLEJld1Y0jW0XDNQ6kI6s8Z4Mz1VRF9mg1G
	2nwUDEOEwgBmHAv2SkA9+z9Hdro1MC1yjfcYggkynCKEOobn2pyoO1bpwCDldWfvsM3N
	ssXQ==
X-Gm-Message-State: APjAAAXUsmUFVa7OHk+idsPTSAw4mfdvzyHxm6w2mcAa4bW5jQMyHWO4
	Xveidg/6X+2whpkuFQdCPyLjEEQoGMs=
X-Google-Smtp-Source: APXvYqyqxLInPfeCAh4JkyREXQT1WQ3Yj9OlMUZzOBsBlXkteZKnwUK1w1/LNUrWE3qVzyA5jOPJlw==
X-Received: by 2002:ac2:5310:: with SMTP id c16mr69167399lfh.119.1561168070449;
	Fri, 21 Jun 2019 18:47:50 -0700 (PDT)
Received: from localhost.localdomain (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108])
	by smtp.gmail.com with ESMTPSA id q13sm579793lfk.65.2019.06.21.18.47.49
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Fri, 21 Jun 2019 18:47:49 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 22 Jun 2019 03:47:47 +0200
Message-Id: <20190622014747.8719-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH][meta-networking] dhcpcd: update to 7.2.2
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
X-List-Received-Date: Sat, 22 Jun 2019 01:47:52 -0000

udev is now explicitly requested.

License checksum changed due to modified copyright year.

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../dhcpcd/{dhcpcd_7.0.8.bb => dhcpcd_7.2.2.bb}        | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)
 rename meta-networking/recipes-connectivity/dhcpcd/{dhcpcd_7.0.8.bb => dhcpcd_7.2.2.bb} (70%)

diff --git a/meta-networking/recipes-connectivity/dhcpcd/dhcpcd_7.0.8.bb b/meta-networking/recipes-connectivity/dhcpcd/dhcpcd_7.2.2.bb
similarity index 70%
rename from meta-networking/recipes-connectivity/dhcpcd/dhcpcd_7.0.8.bb
rename to meta-networking/recipes-connectivity/dhcpcd/dhcpcd_7.2.2.bb
index 84c3db7a5..a7f234b37 100644
--- a/meta-networking/recipes-connectivity/dhcpcd/dhcpcd_7.0.8.bb
+++ b/meta-networking/recipes-connectivity/dhcpcd/dhcpcd_7.2.2.bb
@@ -5,18 +5,16 @@ DESCRIPTION = "dhcpcd runs on your machine and silently configures your computer
 HOMEPAGE = "http://roy.marples.name/projects/dhcpcd/"
 
 LICENSE = "BSD-2-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=1e8f17e4edcccc38152ccf60374e0f89"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=0531457992a97ecebc6975914a874a9d"
 
 SRC_URI = "http://roy.marples.name/downloads/${BPN}/${BPN}-${PV}.tar.xz"
-
-SRC_URI[md5sum] = "77bbb1d73b6f30d6ddcc8b0fd3eae266"
-SRC_URI[sha256sum] = "96968e883369ab4afd11eba9dfd9bb109f5dfff65b2814ce6c432f36362dc9b5"
-
 SRC_URI += "file://0001-remove-INCLUDEDIR-to-prevent-build-issues.patch"
+SRC_URI[md5sum] = "2f17034432ea10415ee84a97ef131128"
+SRC_URI[sha256sum] = "3db7ff18cba9274da1d2176fb3c7cbe23926a8e58d5c8e244ad55c62d38ba09e"
 
 inherit autotools-brokensep
 
-PACKAGECONFIG ?= "udev ${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)}"
+PACKAGECONFIG += "udev"
 
 PACKAGECONFIG[udev] = "--with-udev,--without-udev,udev,udev"
 PACKAGECONFIG[ipv6] = "--enable-ipv6,--disable-ipv6"
-- 
2.17.1


