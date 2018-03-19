Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm0-f46.google.com (mail-wm0-f46.google.com [74.125.82.46])
	by mail.openembedded.org (Postfix) with ESMTP id CDFEC789ED
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Mar 2018 20:29:36 +0000 (UTC)
Received: by mail-wm0-f46.google.com with SMTP id r82so7640268wme.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Mar 2018 13:29:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=Gvxj5bYpzG9UsVZ0Zc5cy4JFFv9r7p5o9DTM6X6Pa5Y=;
	b=nw3tmI5SII3Aoy95FOaIkJs2UtKAgvCGolgE3BFRmH++itodJRryOFBKPCuh3qghv/
	NOO2A7ODf1TIwm5+V5PoF1q640iVRUAiZqdQnFJPI6WliTxI2Emi1dB1EP/LDFrG6ceT
	E13mZxbnUK58jRBiktwtUSy5QNBh2+8jtny7gGPpjAJzciNJde+YGVm6yrgBk+yfHZU8
	1XVfbzc7mScIJDvPbu+eFCfHwnzXhu18/zYBIdf003oCrqNMGT9ymE3tMQFpCVQIh0sJ
	Ai4O+X0P+uNayK2ZRvquZscow6UTmODXuLg2+7D0wurxRC/Sc0069y3dYn3zCn2Uq1G2
	6ubw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=Gvxj5bYpzG9UsVZ0Zc5cy4JFFv9r7p5o9DTM6X6Pa5Y=;
	b=Xp5eeBJNgQB3A0xjhIO2FRV+NNds4y/Dk8rcpMHQt2U544wTtux8aV8SjFiIcp8Thk
	FX6GgnMFK113dWIAUbVo/35l79Y6L/jaGYBkKjA3cKoNPaZTPWx2Bdu8hJUTXr0CzQUp
	0XMgoeUnZc/uNOfRlr9hKtjTXPlyqnDzPzo/0KhmZRwJxNC4XnoLj8vp2c7GcRUITryo
	MSTr9fpAYRFc6bTBbK7bWH3+DrKlDeDcoc/OMk1gDz0psdmB15qc8knVLEJvEUGh3eQ8
	IyS2heqn59YacBEjkUYRnea1kg0TwxCD8CYIwOExLRc+/Dz36b1Y3/1h4U7Fy6Vis/3F
	ZXNA==
X-Gm-Message-State: AElRT7Fmm3mVHi6/41Dy78W+1P1OJntCbXoCtj8C8ELHrpT2Dgic1PO4
	cjgBP1i4tyPaOrwonKT1nwhY3g==
X-Google-Smtp-Source: AG47ELvD8LjPlfwMaEImEZJSr0Gsv9BqvTXATKqwgxU99naJkfpb1n0mbJ7HBMb9FHEuWE3fspHLpA==
X-Received: by 10.28.239.8 with SMTP id n8mr85320wmh.120.1521491377326;
	Mon, 19 Mar 2018 13:29:37 -0700 (PDT)
Received: from PC192-168-2-116.speedport.ip
	(p200300F07BC08B501E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:f0:7bc0:8b50:1e6f:65ff:fe3e:7f61])
	by smtp.gmail.com with ESMTPSA id j42sm47589wre.55.2018.03.19.13.29.36
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 19 Mar 2018 13:29:36 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 19 Mar 2018 21:29:07 +0100
Message-Id: <20180319202911.30760-14-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180319202911.30760-1-schnitzeltony@gmail.com>
References: <20180319202911.30760-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 13/17] gnome-mime-data: remove
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
X-List-Received-Date: Mon, 19 Mar 2018 20:29:37 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

project is dead - last release was 2007

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../gnome-mime-data/gnome-mime-data/pkgconfig.patch   | 14 --------------
 .../gnome-mime-data/gnome-mime-data_2.18.0.bb         | 19 -------------------
 2 files changed, 33 deletions(-)
 delete mode 100644 meta-gnome/recipes-gnome/gnome-mime-data/gnome-mime-data/pkgconfig.patch
 delete mode 100644 meta-gnome/recipes-gnome/gnome-mime-data/gnome-mime-data_2.18.0.bb

diff --git a/meta-gnome/recipes-gnome/gnome-mime-data/gnome-mime-data/pkgconfig.patch b/meta-gnome/recipes-gnome/gnome-mime-data/gnome-mime-data/pkgconfig.patch
deleted file mode 100644
index 09034255d..000000000
--- a/meta-gnome/recipes-gnome/gnome-mime-data/gnome-mime-data/pkgconfig.patch
+++ /dev/null
@@ -1,14 +0,0 @@
-Upstream-Status: Inappropriate [configuration]
-
-Index: gnome-mime-data-2.18.0/Makefile.am
-===================================================================
---- gnome-mime-data-2.18.0.orig/Makefile.am	2009-06-11 17:27:48.000000000 +0100
-+++ gnome-mime-data-2.18.0/Makefile.am	2009-06-11 17:27:59.000000000 +0100
-@@ -1,6 +1,6 @@
- SUBDIRS = man po
- 
--pkgconfigdir = $(datadir)/pkgconfig
-+pkgconfigdir = $(libdir)/pkgconfig
- pkgconfig_DATA = gnome-mime-data-2.0.pc
- 
- NULL=
diff --git a/meta-gnome/recipes-gnome/gnome-mime-data/gnome-mime-data_2.18.0.bb b/meta-gnome/recipes-gnome/gnome-mime-data/gnome-mime-data_2.18.0.bb
deleted file mode 100644
index eeac1bb4a..000000000
--- a/meta-gnome/recipes-gnome/gnome-mime-data/gnome-mime-data_2.18.0.bb
+++ /dev/null
@@ -1,19 +0,0 @@
-SUMMARY = "Base MIME and Application database for GNOME"
-HOMEPAGE = "http://www.gnome.org/"
-BUGTRACKER = "https://bugzilla.gnome.org/"
-
-LICENSE = "GPLv2 & GPLv2+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \
-                    file://check-mime.pl;endline=26;md5=a95b63c92c33d4ca1af61a315888f450"
-
-inherit gnomebase mime
-PR = "r4"
-
-SRC_URI += "file://pkgconfig.patch"
-
-SRC_URI[archive.md5sum] = "541858188f80090d12a33b5a7c34d42c"
-SRC_URI[archive.sha256sum] = "37196b5b37085bbcd45c338c36e26898fe35dd5975295f69f48028b1e8436fd7"
-GNOME_COMPRESS_TYPE="bz2"
-
-DEPENDS += "shared-mime-info intltool-native glib-2.0-native"
-RDEPENDS_${PN} = "shared-mime-info"
-- 
2.14.3


