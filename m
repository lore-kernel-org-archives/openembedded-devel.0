Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 42F577474C
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Mar 2018 13:32:38 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id l16so16876409wmh.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Mar 2018 06:32:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=qx0CrJb4OFjqFC5IOYlZavTuhlyT/6jMOKSssd2Ug+0=;
	b=I5eaiB+VVlHvPe8DJ95i3PWkz98ObZeX8WB/Hcwnptv5sg8nlGS1II64bXnfw9uyis
	b40W73DPD0FZJnhHdO56eBq8L8KRcwYFe3vcyCUX1Hn+hds/cHJVWbNlRWGDx0yr8CEc
	x+FRRcDuCtyIuKktgxfsqdvX2vX6V/DfgllEljywXjTk8cKYrvomqmxiwf3UhUVeOgC9
	7/ESwDR+zD6jeD5uypB4pRBG2qLsUQSBDyO911e63+yLDe5v2TK2586NiLCeue7ow41A
	KaiGClI1jYZLtOR8VCXQUoyt7QZq+fSl0yevsqoSfQ/EaFJviOaYY3b6Xk3YYR0440Sr
	TonQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=qx0CrJb4OFjqFC5IOYlZavTuhlyT/6jMOKSssd2Ug+0=;
	b=oqMm/Jv/KgYsmIuzW3aJJTZZ2k/vatG7/p8ypnbcFfHANFA3Qoaj9VBGW6XlnaU/6B
	FdCtUuFTp2ZL2asq4OBuNiSZwyIt/EvR7AVQZNPJU6Gam9+IQFDx8iVhHXWLU6b9OMah
	ztX5vns2GkBEsPR+4fc2DHMvisXAFURnotM0S1M4PrSPerH9kiMlQiZMuA8unwVYD+Eh
	5GikEsk621P8uQ/g/MpfpeXCUjPI5fKfMnFeG2VlUPpuMuN3Lc9jeCNB2Kga06aoG0vs
	F1qailhhnBnPEW7el38urFl4COM7qmHRWKjRyUFb6wz1/HX0iDrBdB9G4lFuaexHpw5e
	/xPg==
X-Gm-Message-State: AElRT7EW+dNXcAuzLMu1+iSKfX8dq+KpiEBVInxnl0h2PpOk0wxLoJHX
	CbOl88hTO5AutgMkKckKKhO7Gw==
X-Google-Smtp-Source: AIpwx48TSQ5NQCfUxdgF33S9q36+J3sh3xIXVLt5CRxNJZlHmpz+aL5/5fhX2WW4EEUHC+Rp1NKXgg==
X-Received: by 10.28.235.5 with SMTP id j5mr2140852wmh.11.1522416758860;
	Fri, 30 Mar 2018 06:32:38 -0700 (PDT)
Received: from PC192-168-2-116.speedport.ip
	(p200300F07BC180221E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:f0:7bc1:8022:1e6f:65ff:fe3e:7f61])
	by smtp.gmail.com with ESMTPSA id
	93sm10468396wrh.46.2018.03.30.06.32.38
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 30 Mar 2018 06:32:38 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 30 Mar 2018 15:31:47 +0200
Message-Id: <20180330133151.25882-36-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180330133151.25882-1-schnitzeltony@gmail.com>
References: <20180330133151.25882-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 35/39] libupnp1.6: remove
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
X-List-Received-Date: Fri, 30 Mar 2018 13:32:39 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

1.6 was kept for mpd only (see commit d56f417498e5b582973117479f53eec458ab911b)

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../libupnp/libupnp1.6/sepbuildfix.patch           | 34 ----------------------
 .../libupnp/libupnp1.6_1.6.21.bb                   | 20 -------------
 2 files changed, 54 deletions(-)
 delete mode 100644 meta-multimedia/recipes-connectivity/libupnp/libupnp1.6/sepbuildfix.patch
 delete mode 100644 meta-multimedia/recipes-connectivity/libupnp/libupnp1.6_1.6.21.bb

diff --git a/meta-multimedia/recipes-connectivity/libupnp/libupnp1.6/sepbuildfix.patch b/meta-multimedia/recipes-connectivity/libupnp/libupnp1.6/sepbuildfix.patch
deleted file mode 100644
index 0493cea0e..000000000
--- a/meta-multimedia/recipes-connectivity/libupnp/libupnp1.6/sepbuildfix.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From e198f0a87660a048164ca0e16d18517d0aee846e Mon Sep 17 00:00:00 2001
-From: Andre McCurdy <armccurdy@gmail.com>
-Date: Tue, 9 Jun 2015 12:20:45 -0700
-Subject: [PATCH] Fix builds when using separate source and build directories.
-
-Upstream-Status: Pending
-
-Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
----
- configure.ac           | 10 +++++-----
- 1 files changed, 5 insertions(+), 5 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index a8731b5..54a3c3d 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -744,9 +744,9 @@ AC_OUTPUT
- #
- # Files copied for windows compilation.
- #
--echo "configure: copying \"autoconfig.h\"          to \"build/inc/autoconfig.h\""
--test -d build/inc || mkdir -p build/inc
--cp autoconfig.h build/inc/autoconfig.h
--echo "configure: copying \"upnp/inc/upnpconfig.h\" to \"build/inc/upnpconfig.h\""
--cp upnp/inc/upnpconfig.h build/inc/upnpconfig.h
-+echo "configure: copying \"autoconfig.h\"          to \"\$srcdir/build/inc/autoconfig.h\""
-+test -d $srcdir/build/inc || mkdir -p $srcdir/build/inc
-+cp autoconfig.h $srcdir/build/inc/autoconfig.h
-+echo "configure: copying \"upnp/inc/upnpconfig.h\" to \"\$srcdir/build/inc/upnpconfig.h\""
-+cp upnp/inc/upnpconfig.h $srcdir/build/inc/upnpconfig.h
- 
--- 
-1.9.1
-
diff --git a/meta-multimedia/recipes-connectivity/libupnp/libupnp1.6_1.6.21.bb b/meta-multimedia/recipes-connectivity/libupnp/libupnp1.6_1.6.21.bb
deleted file mode 100644
index c1b0429bd..000000000
--- a/meta-multimedia/recipes-connectivity/libupnp/libupnp1.6_1.6.21.bb
+++ /dev/null
@@ -1,20 +0,0 @@
-SUMMARY = "Portable SDK for UPnP* Devices"
-DESCRIPTION = "The Portable SDK for UPnP Devices is an SDK for development of \
-UPnP device and control point applications. It consists of the core UPnP \
-protocols along with a UPnP-specific eXtensible Markup Language (XML) parser \
-supporting the Document Object Model (DOM) Level 2 API and an optional, \
-integrated mini web server for serving UPnP related documents."
-HOMEPAGE = "http://pupnp.sourceforge.net/"
-LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=b3190d5244e08e78e4c8ee78544f4863"
-
-SRC_URI = "${SOURCEFORGE_MIRROR}/pupnp/libupnp-${PV}.tar.bz2 \
-           file://sepbuildfix.patch \
-"
-
-SRC_URI[md5sum] = "513adadb07fa039a8aeb0ceb7b7b0f6e"
-SRC_URI[sha256sum] = "af3f3c0846a1d75baeadae4aa5a2bda427567e2a1fb4559bf73ccff0a4f9a39b"
-
-S = "${WORKDIR}/libupnp-${PV}"
-
-inherit autotools
-- 
2.14.3


