Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr0-f195.google.com (mail-wr0-f195.google.com
	[209.85.128.195])
	by mail.openembedded.org (Postfix) with ESMTP id 766DB78635
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 25 Mar 2018 12:35:48 +0000 (UTC)
Received: by mail-wr0-f195.google.com with SMTP id z8so16216603wrh.7
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 25 Mar 2018 05:35:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=qx0CrJb4OFjqFC5IOYlZavTuhlyT/6jMOKSssd2Ug+0=;
	b=hbogAvpPHErn9wtp2jqO7ocuklMUEJdV+H9CB9aM8tKQmFbGLq9EwHqK2xIpMaFnAW
	i1wz4LrtcfC9PUFlkqUpIvGsRBgbTzrSVVxAi7SRX3jDobqOTDqzUxCyrTsTGz9o7bwp
	wmuyaKbyJn7AREtbNdJg0uSmZdAvuKwvOueLDAoxFxoR6J/1Vq0SrWhiBc0TrQecplvJ
	8Br7822FXXeS69J+AwiqNfkJBwPv0qV8KcIA8gArgA4uiqPD/rcSCfLkT7N3DvykqkMR
	AqjZSoUFCtSHZM8MXCLEeAZ6pyL6oroPNGAuhU09jrfMDgzZa+0ZXmjYYwEtlBiusLfj
	tDXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=qx0CrJb4OFjqFC5IOYlZavTuhlyT/6jMOKSssd2Ug+0=;
	b=PvphjL3yxebC0KKqSTGBcxPbuXuMbWaNnBGyzy3mfYbW1zybYCFyjMpnWuaIXrDRX/
	y99bhCJznoLSTmCcjVFM/dHtBELn8zvPIhKsuzi4Oz6DcIWQmN9Utg9ouf9Qni80p2/T
	2Y3QbqhsgBNPL4ZaMw0cTzP700KlqrjwvgZaNp1QPFnTdyS11zA02DfcfRuRACI3+5/C
	7EjfbQikDAKDvVMwK/GlZKmWmUoF+F2/KU4e2FNYb65g4iIhf7gSasC6lDC6BppKtMk8
	SkwoRso9bjvsN8AahBilTO+LlU/sjrkTPtucdh5gQ4P15g+ysk4BDdvxTrrHZTBwBZO+
	4uTg==
X-Gm-Message-State: AElRT7GqIhDcWx01Cz8hIgUX7MQYYl1yXyJYunELLUsb+j77TI4WwM2e
	e1zaeDgzuoLXz3P+F3P1Ag3mAg==
X-Google-Smtp-Source: AG47ELsj1880zlycdBungA4OgvjXLel7zav1tzhOfcrfNyIEZYTHgc49uvAXz1LW2suFh1ulq/cdYg==
X-Received: by 10.223.150.175 with SMTP id u44mr27095868wrb.104.1521981349288; 
	Sun, 25 Mar 2018 05:35:49 -0700 (PDT)
Received: from PC192-168-2-116.speedport.ip
	(p200300F07BCB3D681E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:f0:7bcb:3d68:1e6f:65ff:fe3e:7f61])
	by smtp.gmail.com with ESMTPSA id
	v23sm11174719wmh.30.2018.03.25.05.35.48
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sun, 25 Mar 2018 05:35:48 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 25 Mar 2018 14:35:19 +0200
Message-Id: <20180325123520.16452-20-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180325123520.16452-1-schnitzeltony@gmail.com>
References: <20180325123520.16452-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 19/20] libupnp1.6: remove
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
X-List-Received-Date: Sun, 25 Mar 2018 12:35:48 -0000
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


