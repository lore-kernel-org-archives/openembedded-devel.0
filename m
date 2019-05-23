Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id 6E9CE7E407
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 May 2019 06:49:17 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id w8so4883157wrl.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 May 2019 23:49:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=zumusrZgP+16KJktpVoJYuIKUOd0pm3Ff/w0zgLthaY=;
	b=coXVIM/bCp7LFNEFOUChBBA8smtrU262ULRxiQQRMhxKsefg/HJL9OE2asRXIOP/gz
	kiSAUPJW1vCI4tSjN53axUd5zqnL3AbGQlUjYdDB24Ig0EyDR0QZl0UhyXHIArX2jqrG
	HN/N0H94l287GeYjw+dnmxPBBSageOY9cgBVS1f95NNu4isaLueLPeoXPakz0Cf6O1WO
	oV+JZ+UWqzVhNWnu2Bz822Yyuv5uSfOYrGB7Vb7dn7CDq1h80FLMCu3w356+kiJCLXnN
	6hDskSyKfDRVUDDiTAAm0nCWCaKD5RD2I8Yr+06dfkhvEZs7/l2l9aNpRXf7Pz9pXulj
	+AWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=zumusrZgP+16KJktpVoJYuIKUOd0pm3Ff/w0zgLthaY=;
	b=K1Y8/veNBF86qwWlK5ckQjJisCgvv/RxD1P4oINkjkEHBt9PYRxmtiPBAhl784Xbzt
	9/xvSw67aUfejJXPNfKGdy2/ZYCOxYDOEpkm2DdcG9WabYkrirvJ/B1xponJtf8tqVBr
	7x1F6h17o2X04Pcp3NARyj95vjBGnPL/9j6CAKvSrXMI0TCnesVVbm5Nk1jYQ3QjaPg5
	FZYbB3HTiBKgtN7ZhcnprO01+/PIGFtLlS0rYZQsDlDW7iHjCUgQS9PV8KCR0MUex+51
	FoOqv6wfKz4tHOT3pquYnm1a733ex9HGfyyujYsGCYwfZVzlcp84H8wzErcbSrQyYUMO
	5KMw==
X-Gm-Message-State: APjAAAXCG29n3+PL7jvAp13mSNJJjqeiGTrnAVpdW8wSmMzhUTFN1MWT
	bff+LcBo7pdKvHac4LrBkdaPmw5JXf0=
X-Google-Smtp-Source: APXvYqyk6uua/+dvM50yuKMTDztbLkQgfEXK5d7C1hkpGXOBxzo7frEyV2xo5LqNBgvteHWlqzLACA==
X-Received: by 2002:adf:f7c8:: with SMTP id a8mr229789wrq.148.1558594158049;
	Wed, 22 May 2019 23:49:18 -0700 (PDT)
Received: from mueller-a-nb-linux.speedport.ip
	(p200300F07F04E634002574DE25662558.dip0.t-ipconnect.de.
	[2003:f0:7f04:e634:25:74de:2566:2558])
	by smtp.gmail.com with ESMTPSA id
	d9sm33827524wro.26.2019.05.22.23.49.16
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 22 May 2019 23:49:17 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 23 May 2019 08:48:29 +0200
Message-Id: <20190523064859.24336-12-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190523064859.24336-1-schnitzeltony@gmail.com>
References: <20190523064859.24336-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 11/41] glade3: upgrade 3.8.5 -> 3.8.6
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
X-List-Received-Date: Thu, 23 May 2019 06:49:17 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* online help support was added - ship it optionally
* prettify recipe a bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../{glade3_3.8.5.bb => glade3_3.8.6.bb}      | 21 +++++++------------
 1 file changed, 8 insertions(+), 13 deletions(-)
 rename meta-xfce/recipes-devtools/glade/{glade3_3.8.5.bb => glade3_3.8.6.bb} (42%)

diff --git a/meta-xfce/recipes-devtools/glade/glade3_3.8.5.bb b/meta-xfce/recipes-devtools/glade/glade3_3.8.6.bb
similarity index 42%
rename from meta-xfce/recipes-devtools/glade/glade3_3.8.5.bb
rename to meta-xfce/recipes-devtools/glade/glade3_3.8.6.bb
index c3da3e9b9..8ed30944b 100644
--- a/meta-xfce/recipes-devtools/glade/glade3_3.8.5.bb
+++ b/meta-xfce/recipes-devtools/glade/glade3_3.8.6.bb
@@ -4,20 +4,15 @@ LICENSE = "GPLv2 & LGPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=aabe87591cb8ae0f3c68be6977bb5522 \
                     file://COPYING.GPL;md5=9ac2e7cff1ddaf48b6eab6028f23ef88 \
                     file://COPYING.LGPL;md5=252890d9eee26aab7b432e8b8a616475"
-DEPENDS = "gtk+ gnome-doc-utils gnome-common libxml2 intltool-native"
+DEPENDS = "gtk+ gnome-doc-utils gnome-common libxml2 intltool-native yelp-tools-native"
 
-inherit distro_features_check autotools pkgconfig pythonnative gtk-icon-cache
+inherit gnomebase gnome-help distro_features_check pythonnative gtk-icon-cache
 
 REQUIRED_DISTRO_FEATURES = "x11"
 
-SRC_URI = "http://ftp.gnome.org/pub/GNOME/sources/glade3/3.8/glade3-${PV}.tar.xz \
-           file://0001-gnome-doc-utils.make-sysrooted-pkg-config.patch \
-           file://0002-fix-gcc-6-build.patch \
-           file://0001-Add-G_GNUC_PRINTF-on-functions-with-format-strings.patch \
-           "
-SRC_URI[md5sum] = "4e4b4f5ee34a03e017e4cef97d796c1f"
-SRC_URI[sha256sum] = "58a5f6e4df4028230ddecc74c564808b7ec4471b1925058e29304f778b6b2735"
-
-EXTRA_OECONF += "--disable-scrollkeeper"
-
-FILES_${PN} += "${datadir}/icons"
+SRC_URI += " \
+    file://0002-fix-gcc-6-build.patch \
+    file://0001-Add-G_GNUC_PRINTF-on-functions-with-format-strings.patch \
+"
+SRC_URI[archive.md5sum] = "c16756952967f7316d64593124761027"
+SRC_URI[archive.sha256sum] = "aaeeebffaeb3068fb23757a2eede46adeb4c7cecc740feed7654e065491f5449"
-- 
2.20.1


