Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 024CC786E1
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  1 Dec 2017 11:08:34 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id v19so2700055wmh.5
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 01 Dec 2017 03:08:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=e1O07n8u5++vEE71xmWW9h2ieoq3BUn86VwAWK+bBmE=;
	b=byiY2xN723wZDJG9C1/IEclCJkaSzOy1rAEpEASxOsv176nzbkba6DTWcXv+SOyFtu
	qHSuZeSYMOF5SsV1vLyu4LJzvMui/ammmvPGx4LD8rP/7nW+bmwsdB9DuRbyj1Tp2UTM
	h3o/ERHtWKUbBSfwNWpg8ey3YY9F0Z9NpjzNaXx4oqdC+JX2NyUGeRViwR8gPk2cJ7Nk
	QXUMq3LKHGrhC2CMAMIK+Mdb+6hfnm1Uhr+ZxjOed6yLXj/mhgTD/HYe+ev8AWaBK+jU
	7f8LrJE04k2eYgjEs6i4Zo/leP0IBwp9gZh5sGbMv86h6AtgSKPBTE6q21CG/LdCg+cQ
	E9hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=e1O07n8u5++vEE71xmWW9h2ieoq3BUn86VwAWK+bBmE=;
	b=n+PMJcDVCoo8mBprqH+iQs14LwpDahRcZfBK3i4P1fvQU/3u9LaVUdY7aRaRvFMinL
	UZ00A3bsIKHAJXukbjthND9McxMkMUtyZPd5vI40mhAXQO39IXNVslE71bqAfaQs7Fiz
	e1EcdJk9LHeVp2LjsrR2pxyeroTCC1/5mDbetj8GqH55vqp7mOeM/vuSgc+Mbh1YfCj5
	szcPLWHQyggiIAI4aUX8GDN9fl+1ggOtgdsnRP2dQbLT+tzuXZB4+HAiGRpzmEyhRLTa
	7GHKsHYqTCF4vs/z/7YrMD6XsJCFcsVGUuYv4pCK12W1p2P+oTNzhMMV5uucE4x0ZJI8
	1VBw==
X-Gm-Message-State: AJaThX6YMzh+3dLyviAJuOwGDqcGcPIEgtK0oloKbgYGg3OdqbtD+qUp
	QXU0D/PIuYMFsML7JHKqsk+PBA==
X-Google-Smtp-Source: AGs4zMao83i/iKNGnmuh8877M1egQmhq3vKNWW0UaowIE09wNPly1wDjCTrXOPZ4CanxuzId1BlG2A==
X-Received: by 10.28.129.77 with SMTP id c74mr917218wmd.124.1512126515320;
	Fri, 01 Dec 2017 03:08:35 -0800 (PST)
Received: from mueller-a-nb-linux.zera.local
	(ip-88-152-111-130.hsi03.unitymediagroup.de. [88.152.111.130])
	by smtp.gmail.com with ESMTPSA id
	a126sm791054wma.11.2017.12.01.03.08.34
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 01 Dec 2017 03:08:34 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  1 Dec 2017 12:08:15 +0100
Message-Id: <20171201110816.13519-10-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.9.5
In-Reply-To: <20171201110816.13519-1-schnitzeltony@gmail.com>
References: <20171201110816.13519-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 09/10] fftw: update 3.3.6-p1 -> 3.3.7
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
X-List-Received-Date: Fri, 01 Dec 2017 11:08:35 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta-oe/recipes-support/fftw/{fftw_3.3.6.bb => fftw_3.3.7.bb} | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)
 rename meta-oe/recipes-support/fftw/{fftw_3.3.6.bb => fftw_3.3.7.bb} (89%)

diff --git a/meta-oe/recipes-support/fftw/fftw_3.3.6.bb b/meta-oe/recipes-support/fftw/fftw_3.3.7.bb
similarity index 89%
rename from meta-oe/recipes-support/fftw/fftw_3.3.6.bb
rename to meta-oe/recipes-support/fftw/fftw_3.3.7.bb
index ed14e16..310d726 100644
--- a/meta-oe/recipes-support/fftw/fftw_3.3.6.bb
+++ b/meta-oe/recipes-support/fftw/fftw_3.3.7.bb
@@ -4,13 +4,11 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
 
 SRC_URI = " \
-    http://www.fftw.org/fftw-${PV}-pl1.tar.gz \
+    http://www.fftw.org/fftw-${PV}.tar.gz \
     file://0001-NEON-autodetection-segfaults-assume-neon-present.patch \
 "
-SRC_URI[md5sum] = "682a0e78d6966ca37c7446d4ab4cc2a1"
-SRC_URI[sha256sum] = "1ef4aa8427d9785839bc767f3eb6a84fcb5e9a37c31ed77a04e7e047519a183d"
-
-S = "${WORKDIR}/fftw-${PV}-pl1"
+SRC_URI[md5sum] = "0d5915d7d39b3253c1cc05030d79ac47"
+SRC_URI[sha256sum] = "3b609b7feba5230e8f6dd8d245ddbefac324c5a6ae4186947670d9ac2cd25573"
 
 inherit autotools pkgconfig
 
@@ -76,6 +74,7 @@ FILES_fftwl-wisdom = "${bindir}/fftwl-wisdom"
 FILES_fftwf-wisdom = "${bindir}/fftwf-wisdom"
 FILES_fftw-wisdom-to-conf = "${bindir}/fftw-wisdom-to-conf"
 
+FILES_${PN}-dev += "${libdir}/cmake"
 RDEPENDS_${PN}-dev = ""
 
 BBCLASSEXTEND = "native"
-- 
2.9.5


