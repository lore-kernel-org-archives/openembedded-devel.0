Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm0-f54.google.com (mail-wm0-f54.google.com [74.125.82.54])
	by mail.openembedded.org (Postfix) with ESMTP id 58EA0786AE
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  1 Dec 2017 11:08:30 +0000 (UTC)
Received: by mail-wm0-f54.google.com with SMTP id g130so5158955wme.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 01 Dec 2017 03:08:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=fpmIwJd5AdjvKTs/wFec7/SU7g+vPVcznVHa5cdilMY=;
	b=LOyDDRatG6uDxxMT+kOKO3oVGkTMFbcSFfgjGK3fBODoXvrCZcaUEaMXaydrk/+X4H
	mqlh0cKtgXr6CXG+HLnVGGNbfPti0iatvsXaC9gzUcg6cXx37Sj+Yq+CS8Ngtds7JC1N
	oiq8BhBHzEBHC6ADQb6I6Pg1p49r+UcEww6g4Z/JL531wTcGmwzB1ESG4QWT2Q8kHeT4
	upRtYXgP5298RR1x1AXoivmrNeb2qHYWICPWtTfrPn52Fo+/6oRQuwel99oi8LifYih/
	7rHgpFqPR4M+Pb9ghr1uutOQRr+9g3V64YIHsf+pPAIttlWdu61o8bfohWWWSjOGA5Er
	Vk5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=fpmIwJd5AdjvKTs/wFec7/SU7g+vPVcznVHa5cdilMY=;
	b=EkyqfRdPKPeKbmo40GEWEKRvUXmVPdxZ9KdRdUTuQdwvmm+oI8Oeztk4Ax3zfDIZvy
	xQz7tx27FqxGnr4OhSae/8fSlTIWWsXz/Vy6Gxj72dGyUKz9TPVkQGsbhs0Y5tI9CX2g
	SCUUYduO5aRF1wnqiRcL+wLlIjKpMXodDwntvpTAIolYm5Yf53JxWtB/47xJCTEQqvpg
	j0fA10TmmcjdyuGj8peppag08XTYFEe4Q5SbCXIs/BwZ3bpFH+eA303N+WkVaQMuvq78
	wlA0ZNCyKkwX/5zjFEkWfh3Dswk1AcTdIcoyvNDaccGxTt0+f+uPp1jRubvypSlb1wIL
	z5JA==
X-Gm-Message-State: AKGB3mLqggPIwPWpsIPmZ+FYVgyt+rZmNugMItV9b5vyYIPq7Z6MXxdP
	Yh52nmvHj1biapsgdUHJDUD7lQ==
X-Google-Smtp-Source: AGs4zMarIoLg6o4iFcT2l05kC43iYEyhEkXPFZEJIx8C59aRAD4dUdZPN2zO8W1qqeDpNqe7Ae0lWg==
X-Received: by 10.28.29.21 with SMTP id d21mr944110wmd.93.1512126510802;
	Fri, 01 Dec 2017 03:08:30 -0800 (PST)
Received: from mueller-a-nb-linux.zera.local
	(ip-88-152-111-130.hsi03.unitymediagroup.de. [88.152.111.130])
	by smtp.gmail.com with ESMTPSA id
	a126sm791054wma.11.2017.12.01.03.08.29
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 01 Dec 2017 03:08:29 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  1 Dec 2017 12:08:11 +0100
Message-Id: <20171201110816.13519-6-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.9.5
In-Reply-To: <20171201110816.13519-1-schnitzeltony@gmail.com>
References: <20171201110816.13519-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 05/10] glibmm: update 2.50.1 -> 2.54.1
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
X-List-Received-Date: Fri, 01 Dec 2017 11:08:30 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

License checksum changed was caused by FSF address change [1]

[1] https://git.gnome.org/browse/glibmm/commit/COPYING?h=glibmm-2-54&id=93a7c699e0194ab1a8e496ac602d75ab15f33c98

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../recipes-core/glib-2.0/{glibmm_2.50.1.bb => glibmm_2.54.1.bb}    | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-core/glib-2.0/{glibmm_2.50.1.bb => glibmm_2.54.1.bb} (84%)

diff --git a/meta-oe/recipes-core/glib-2.0/glibmm_2.50.1.bb b/meta-oe/recipes-core/glib-2.0/glibmm_2.54.1.bb
similarity index 84%
rename from meta-oe/recipes-core/glib-2.0/glibmm_2.50.1.bb
rename to meta-oe/recipes-core/glib-2.0/glibmm_2.54.1.bb
index 9cc558f..3a69a70 100644
--- a/meta-oe/recipes-core/glib-2.0/glibmm_2.50.1.bb
+++ b/meta-oe/recipes-core/glib-2.0/glibmm_2.54.1.bb
@@ -2,7 +2,7 @@ SUMMARY = "C++ bindings for the glib library"
 HOMEPAGE = "http://www.gtkmm.org/"
 SECTION = "libs"
 LICENSE = "LGPLv2.1 & GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=d8045f3b8f929c1cb29a1e3fd737b499 \
+LIC_FILES_CHKSUM = "file://COPYING;md5=42dfffebc56fec7527aac53b7a89d1d8 \
                     file://COPYING.tools;md5=751419260aa954499f7abaabaa882bbe"
 
 DEPENDS = "mm-common glib-2.0 libsigc++-2.0 glib-2.0-native"
@@ -14,8 +14,8 @@ SRC_URI = " \
     ftp://ftp.gnome.org/pub/GNOME/sources/glibmm/${SHRT_VER}/glibmm-${PV}.tar.xz \
     file://remove-examples.patch \
 "
-SRC_URI[md5sum] = "a5b915dc42fc62983fa78ca8486f4391"
-SRC_URI[sha256sum] = "1fd85051da9cb402cc8348cec72dfe4d79f9345df4a1dbf68703a4ded45846a4"
+SRC_URI[md5sum] = "dee5ebe309f5976c3dacfcf5c43a062b"
+SRC_URI[sha256sum] = "7cc28c732b04d70ed34f0c923543129083cfb90580ea4a2b4be5b38802bf6a4a"
 
 do_install_append() {
     install -d ${D}${datadir}/glibmm-2.4
-- 
2.9.5


