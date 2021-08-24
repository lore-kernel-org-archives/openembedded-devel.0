Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web10.4450.1629836813578238141
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 Aug 2021 13:26:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=HV9/UOu2;
 spf=pass (domain: axis.com, ip: 195.60.68.18, mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1629836815;
  x=1661372815;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=bSRPMaPpb2PG9HFEYtxfP07k7L+sDRSVSd8Nhg06pqQ=;
  b=HV9/UOu2yjuyISoc/sQ9DLGT3sUl/xx3To/BJe1Ke7+1NGIaDx9T6vYC
   T/LhgtXFDeGLQxx+KVX2r/PVRy63aRX9BskMDgSoZ94Ah24s5wAUIdZfd
   rbk3X3hwb3LPEKibmvAayviYKsA1XTM1hOIYcc55ONSwI+6+u7Yk8nWaW
   fWshlBjyo1BDyEzpboWAeqszp4ivJrRhqF84UtcvcZuJywab7n4bo+9JL
   MUZf5ozSH+BS/ZQOrw0dekVDnygoAaAsp7sM7n6WkFjUQQqRXrDyEkdp/
   uE78xSaxJP2X5AGKILO4YLvvLCkW21YXHpHNdoYoBcFKlHYiudD1CH9b9
   g==;
From: "Peter Kjellerstedt" <peter.kjellerstedt@axis.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH 2/2] gpsd: Move /usr/share/gpsd/doc to the gpsd-doc package
Date: Tue, 24 Aug 2021 22:26:48 +0200
Message-ID: <20210824202648.22554-2-pkj@axis.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20210824202648.22554-1-pkj@axis.com>
References: <20210824202648.22554-1-pkj@axis.com>
MIME-Version: 1.0
Return-Path: pkj@axis.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta-oe/recipes-navigation/gpsd/gpsd_3.23.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-navigation/gpsd/gpsd_3.23.bb b/meta-oe/recipes-navigation/gpsd/gpsd_3.23.bb
index 350eaaf12..bf5e0efed 100644
--- a/meta-oe/recipes-navigation/gpsd/gpsd_3.23.bb
+++ b/meta-oe/recipes-navigation/gpsd/gpsd_3.23.bb
@@ -87,6 +87,8 @@ RPROVIDES:${PN}-dbg += "python-pygps-dbg"
 FILES:${PN}-dev += "${libdir}/pkgconfdir/libgpsd.pc ${libdir}/pkgconfdir/libgps.pc \
                     ${libdir}/libQgpsmm.prl"
 
+FILES:${PN}-doc += "${datadir}/${BPN}/doc"
+
 RDEPENDS:${PN} = "gpsd-gpsctl"
 RRECOMMENDS:${PN} = "gpsd-conf gpsd-udev gpsd-machine-conf"
 
