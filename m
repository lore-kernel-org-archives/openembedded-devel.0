Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com
	[209.85.210.181])
	by mail.openembedded.org (Postfix) with ESMTP id F1BA36BCD6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 16 Mar 2019 01:45:03 +0000 (UTC)
Received: by mail-pf1-f181.google.com with SMTP id j5so7523523pfa.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Mar 2019 18:45:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=rDXBEdbVVKtHvo/ZadON+U014CQVGBrlB+My4TatVTE=;
	b=TS9LzdY4R+FlkcWx7xBkco2ID/6NL88GZH4tZCJIs7WE+vqHqQ2VcUSFCljjPV3JkT
	EHSpWtW4blJe6YTJ91YZobru36Zg8q8Agp+gXHreKMGnk/sAov4uk2MJJdQrNWxIAEeX
	8TChwi6ddK7yBQWrvBRpG3c9e+EhsxZZAaZk4Mm7+6ec4LmId33VLArwMBNzsWUESwMf
	0W5hUkNqe/siko1BzPayY2IIgLDRsapCHM5oW+1H2XwNlELnMtpowg0BOxMPgOV9JHPv
	RGETVkXawTWX+AetOUsLclLiposgwD2VX1bQKDy1yW1rmRJgUNV81iQSnmNGEJnL37Bn
	z7nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=rDXBEdbVVKtHvo/ZadON+U014CQVGBrlB+My4TatVTE=;
	b=TcKEgGimxM1UND9NrZ0kfygMcltXwQn7cskjQ5yuUv9CdvBO8jvJ76atNjTuMGr23a
	/D+GnxPIRE9NFKjTHehzPf9Ew/LQpokmUYBIeG5kEL7X7iHstawzJDNV2B4e7xh7Qxf9
	0g6p7zHTvRpHEpA7/9CgwhsauQbBOo/sGyrgrSTg1awzNq31ttrAZ8iFWtUv5t0rwWsn
	W/mpXZt14oHTqwptlHxOAGJwcoLuTXKSu+euZELBeqr6ja261fNR8Ds6KW+MD3vNu3d/
	FPIS3uAZkBj5Z42uP2uNca1wrrhf+r1lWWIQWaTkRfzdiB6RsF318U69p113xFkhPMmy
	Ln3Q==
X-Gm-Message-State: APjAAAXz9wbkRcA/3lv5kP9nw4rn7gHR/EqxHoowzpx7VGcPYpx4zQqL
	1B+47ddS7I8L+rGSTPSyJBev9Yix
X-Google-Smtp-Source: APXvYqynkLUS9nVVG4cSrJ0bq0nhpbG4+Zsl7weBEHk+GhfdMuRvhvq9sj0FgzUEuPJdbz2dxsGo2Q==
X-Received: by 2002:aa7:8516:: with SMTP id v22mr7282772pfn.23.1552700704695; 
	Fri, 15 Mar 2019 18:45:04 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:6bc6::b8f7])
	by smtp.gmail.com with ESMTPSA id
	d26sm4377527pfn.86.2019.03.15.18.45.03
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 15 Mar 2019 18:45:04 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 15 Mar 2019 18:44:46 -0700
Message-Id: <20190316014446.42828-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190316014446.42828-1-raj.khem@gmail.com>
References: <20190316014446.42828-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 2/2] libnice: Drop support for gstreamer-0.10
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
X-List-Received-Date: Sat, 16 Mar 2019 01:45:04 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-support/farsight/libnice_0.1.14.bb | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/meta-oe/recipes-support/farsight/libnice_0.1.14.bb b/meta-oe/recipes-support/farsight/libnice_0.1.14.bb
index 775257f93c..967beeba42 100644
--- a/meta-oe/recipes-support/farsight/libnice_0.1.14.bb
+++ b/meta-oe/recipes-support/farsight/libnice_0.1.14.bb
@@ -15,15 +15,16 @@ DEPENDS = "glib-2.0 gnutls"
 
 PACKAGECONFIG ??= "gstreamer1.0"
 PACKAGECONFIG[gupnp] = "--enable-gupnp,--disable-gupnp,gupnp-igd"
-PACKAGECONFIG[gstreamer0.10] = "--with-gstreamer-0.10,--without-gstreamer-0.10,gstreamer gst-plugins-base"
 PACKAGECONFIG[gstreamer1.0] = "--with-gstreamer,--without-gstreamer,gstreamer1.0 gstreamer1.0-plugins-base"
 
 inherit autotools pkgconfig gtk-doc gobject-introspection
 
-FILES_${PN} += "${libdir}/gstreamer-0.10/*.so ${libdir}/gstreamer-1.0/*.so"
-FILES_${PN}-dev += "${libdir}/gstreamer-0.10/*.la ${libdir}/gstreamer-1.0/*.la"
-FILES_${PN}-staticdev += "${libdir}/gstreamer-0.10/*.a ${libdir}/gstreamer-1.0/*.a"
-FILES_${PN}-dbg += "${libdir}/gstreamer-0.10/.debug ${libdir}/gstreamer-1.0/.debug"
+EXTRA_OECONF += "--without-gstreamer-0.10"
+
+FILES_${PN} += "${libdir}/gstreamer-1.0/*.so"
+FILES_${PN}-dev += "${libdir}/gstreamer-1.0/*.la"
+FILES_${PN}-staticdev += "${libdir}/gstreamer-1.0/*.a"
+FILES_${PN}-dbg += "${libdir}/gstreamer-1.0/.debug"
 
 do_configure_prepend() {
     mkdir ${S}/m4 || true
-- 
2.21.0


