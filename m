Return-Path: <joe@deserted.net>
Received: from mail-ig0-f170.google.com (mail-ig0-f170.google.com
	[209.85.213.170])
	by mail.openembedded.org (Postfix) with ESMTP id 84290609B2
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  8 Jan 2015 02:19:08 +0000 (UTC)
Received: by mail-ig0-f170.google.com with SMTP id r2so657038igi.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 07 Jan 2015 18:19:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
	bh=otv8R7Fnbow6j1GrWqJD8tUeaWiYzSYw8KYHYNAjosA=;
	b=kxtHqnjaExPO+bhoiteHXTIz8zMBndHd3YXz15lubA0EplSB/frIzh1kfJ7RR24J5a
	BAVrA+NzzqZ+8hvM0dEiW5eXmy7/8Reg2sHNFm0b47CBeD8MXR4EWDi7ENNZOHBfNsGT
	uodyIus67snkus/jFLF1hOpW6CHVTxf1l08ILkdaoyrlzJ8xk1ok4K362jK0eO7zCd4I
	EyFQPgYjv3mqAB+DGmfzcFU9jIeh4hQICkqk6iocl5UOcvJSgsOcomTPFfCEd/sNouPP
	6vzMrniq+V6F/02w/51wMxD2VDLMp9tprqddm/hw2eTBQgxFIB/fqMM3xrwNv09ctmLh
	CHeA==
X-Gm-Message-State: ALoCoQknblAups380AdNzeOIcBaA2TxtKkka031WqlKu2nY5FfKl4CUH/66mCyMExNoWuDG9Ik+p
X-Received: by 10.50.43.133 with SMTP id w5mr7292171igl.44.1420683548656;
	Wed, 07 Jan 2015 18:19:08 -0800 (PST)
Received: from mir.deserted.net (24-246-4-250.cable.teksavvy.com.
	[24.246.4.250])
	by mx.google.com with ESMTPSA id b2sm1679597ioe.2.2015.01.07.18.19.07
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 07 Jan 2015 18:19:07 -0800 (PST)
Sender: Joe MacDonald <joe@deserted.net>
From: Joe MacDonald <joe_macdonald@mentor.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  7 Jan 2015 21:19:32 -0500
Message-Id: <1420683572-22387-1-git-send-email-joe_macdonald@mentor.com>
X-Mailer: git-send-email 1.9.1
Subject: [meta-networking][PATCH] GeoIP: change data fetching strategy
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 08 Jan 2015 02:19:13 -0000

Since the GeoIP databases are not versioned and they essentially change
without notice, we cannot reasonably expect the checksums to be consistent
from one build to the next.  Therefore, don't download them using the
usual wget fetcher, but do it manually at the end of the do_fetch stage
and place the uncompressed data files where the remainder of the build
expects they would've been placed.

Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>
---

I considered trying to use the wget fetcher and having it skip over the
checksum operation and, honestly, I'd still prefer to do it that way, but
looking around and at the fetch2 code, it doesn't appear to be able to support
that outside of a BB_STRICT_CHECKSUM="" setting, which we definitely don't want
to do here.

-J.

 .../recipes-support/geoip/geoip_1.6.0.bb           | 36 +++++++++-------------
 1 file changed, 14 insertions(+), 22 deletions(-)

diff --git a/meta-networking/recipes-support/geoip/geoip_1.6.0.bb b/meta-networking/recipes-support/geoip/geoip_1.6.0.bb
index 65e8362..71fda3b 100644
--- a/meta-networking/recipes-support/geoip/geoip_1.6.0.bb
+++ b/meta-networking/recipes-support/geoip/geoip_1.6.0.bb
@@ -8,28 +8,9 @@ using reverse DNS lookups."
 HOMEPAGE = "http://dev.maxmind.com/geoip/"
 SECTION = "Development/Libraries"
 
-SRC_URI = "http://www.maxmind.com/download/geoip/api/c/GeoIP-1.6.0.tar.gz;name=tarball \
-           http://geolite.maxmind.com/download/geoip/database/GeoLiteCountry/GeoIP.dat.gz;apply=no;name=GeoIP-dat \
-           http://geolite.maxmind.com/download/geoip/database/GeoIPv6.dat.gz;apply=no;name=GeoIPv6-dat \
-           http://geolite.maxmind.com/download/geoip/database/GeoLiteCity.dat.gz;apply=no;name=GeoLiteCity-dat \
-           http://geolite.maxmind.com/download/geoip/database/GeoLiteCityv6-beta/GeoLiteCityv6.dat.gz;apply=no;name=GeoLiteCityv6-dat \
-"
-
-SRC_URI[tarball.md5sum] = "89f4cdfdab43f1d67364cd7c85bbe8ca"
-SRC_URI[tarball.sha256sum] = "075a0c2815cd099e9ec35c9569db716a3fefcdbb6a10dbfa1ce7c6cd48d4a635"
-
-SRC_URI[GeoIP-dat.md5sum] = "4bc1e8280fe2db0adc3fe48663b8926e"
-SRC_URI[GeoIP-dat.sha256sum] = "7fd7e4829aaaae2677a7975eeecd170134195e5b7e6fc7d30bf3caf34db41bcd"
-
-SRC_URI[GeoIPv6-dat.md5sum] = "aac7e6e9b141de80934ecee52daf7f56"
-SRC_URI[GeoIPv6-dat.sha256sum] = "126fd2953eb193e60538e30b4465610530383f7a782745cacdca5ba6825f471c"
-
-SRC_URI[GeoLiteCity-dat.md5sum] = "15a42c684c53d2309e6632a6d6e02531"
-SRC_URI[GeoLiteCity-dat.sha256sum] = "5ec02a6d39d545c77ec12cc30c6a8856883d8f55522fc5cd4f25af80163c6b3c"
-
-SRC_URI[GeoLiteCityv6-dat.md5sum] = "49d6ec946fa0a2575b5112a68d71f933"
-SRC_URI[GeoLiteCityv6-dat.sha256sum] = "7a345e6cf0e59f8ab589ff15020241f0b03342dd04cc584f814c4f4700d49405"
-
+SRC_URI = "http://www.maxmind.com/download/geoip/api/c/GeoIP-1.6.0.tar.gz"
+SRC_URI[md5sum] = "89f4cdfdab43f1d67364cd7c85bbe8ca"
+SRC_URI[sha256sum] = "075a0c2815cd099e9ec35c9569db716a3fefcdbb6a10dbfa1ce7c6cd48d4a635"
 
 LICENSE = "LGPL-2.1"
 
@@ -43,6 +24,17 @@ inherit autotools
 EXTRA_OECONF = "--disable-static               \
                 --disable-dependency-tracking  "
 
+do_fetch_append() {
+    os.system("${FETCHCMD_wget} http://geolite.maxmind.com/download/geoip/database/GeoLiteCountry/GeoIP.dat.gz");
+    os.system("gunzip -c ${DL_DIR}/GeoIP.dat.gz > ${WORKDIR}/GeoIP.dat");
+    os.system("${FETCHCMD_wget} http://geolite.maxmind.com/download/geoip/database/GeoIPv6.dat.gz");
+    os.system("gunzip -c ${DL_DIR}/GeoIPv6.dat.gz > ${WORKDIR}/GeoIPv6.dat");
+    os.system("${FETCHCMD_wget} http://geolite.maxmind.com/download/geoip/database/GeoLiteCity.dat.gz");
+    os.system("gunzip -c ${DL_DIR}/GeoLiteCity.dat.gz > ${WORKDIR}/GeoLiteCity.dat");
+    os.system("${FETCHCMD_wget} http://geolite.maxmind.com/download/geoip/database/GeoLiteCityv6.dat.gz");
+    os.system("gunzip -c ${DL_DIR}/GeoLiteCityv6.dat.gz > ${WORKDIR}/GeoLiteCityv6.dat");
+}
+
 do_install() {
     make DESTDIR=${D} install
     install -d ${D}/${datadir}/GeoIP
-- 
1.9.1


