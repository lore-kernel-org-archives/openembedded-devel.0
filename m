Received: from mail-ea0-f171.google.com ([209.85.215.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TmkoG-0000ue-19
	for openembedded-devel@lists.openembedded.org;
	Sun, 23 Dec 2012 13:37:41 +0100
Received: by mail-ea0-f171.google.com with SMTP id n10so2604189eaa.16
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 23 Dec 2012 04:22:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=xgZroPm2T8pB9RgdENiyoRxER9CfzLjOJa3QGf62y/Y=;
	b=0gLr8Rj0TJU3K2Ng8S478cYs5yqMY4oPSaHPH30JD1c5wtiKkBn6o9qbyLzMWE+IRY
	/cjMh9ClQjKTHmx9ksURerP38v8YRDmOi/U1PI1fBuswHLAE4VMD0/LZyANwsVsNV0if
	Pcqa7LCawmkj8K1AA8amQ2exYMtoKI9AnqTr52yfC+PKwcnNtHLVMtoIWlfEs2fXl4nA
	+dlo8nhq4vlD87ULDBVbC/g5wKodZ5KBGMZfbOiU8++gH3C8DmEUOQlgqvwMnBS+K54N
	nKwbAWL2kAozJ8oJ0vjVvyhqcv/ca5uQNNZIAXYr0I68E98jY/OJTCTGWm/hD4CZv7cg
	Bb8g==
X-Received: by 10.14.225.4 with SMTP id y4mr47446854eep.6.1356265371755;
	Sun, 23 Dec 2012 04:22:51 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id f6sm34548730eeo.7.2012.12.23.04.22.51
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 23 Dec 2012 04:22:51 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 23 Dec 2012 13:21:31 +0100
Message-Id: <065f47980b663d0a4fdc0ded2f9f38b5138bbab8.1356264861.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.0.2
In-Reply-To: <cover.1356264861.git.Martin.Jansa@gmail.com>
References: <cover.1356264861.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1356264861.git.Martin.Jansa@gmail.com>
References: <cover.1356264861.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 06/30] libass: upgrade to 0.10.1
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 23 Dec 2012 12:37:42 -0000

* old version wasn't compatible with libpng-1.5 from oe-core
* COPYING was updated with ISC text old 0.9.11 was GPLv2

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-multimedia/libass/libass.inc       | 3 ++-
 meta-oe/recipes-multimedia/libass/libass_0.10.1.bb | 5 +++++
 meta-oe/recipes-multimedia/libass/libass_0.9.11.bb | 7 -------
 3 files changed, 7 insertions(+), 8 deletions(-)
 create mode 100644 meta-oe/recipes-multimedia/libass/libass_0.10.1.bb
 delete mode 100644 meta-oe/recipes-multimedia/libass/libass_0.9.11.bb

diff --git a/meta-oe/recipes-multimedia/libass/libass.inc b/meta-oe/recipes-multimedia/libass/libass.inc
index fbf4424..f398d49 100644
--- a/meta-oe/recipes-multimedia/libass/libass.inc
+++ b/meta-oe/recipes-multimedia/libass/libass.inc
@@ -3,12 +3,13 @@ HOMEPAGE = "http://code.google.com/p/libass/"
 SECTION = "libs/multimedia"
 
 LICENSE = "ISC"
+LIC_FILES_CHKSUM = "file://COPYING;md5=8ae98663bac55afe5d989919d296f28a"
 
 DEPENDS = "enca fontconfig freetype libpng"
 
 INC_PR = "r1"
 
-SRC_URI = "http://${PN}.googlecode.com/files/${P}.tar.bz2"
+SRC_URI = "http://${PN}.googlecode.com/files/${P}.tar.gz"
 
 inherit autotools pkgconfig
 
diff --git a/meta-oe/recipes-multimedia/libass/libass_0.10.1.bb b/meta-oe/recipes-multimedia/libass/libass_0.10.1.bb
new file mode 100644
index 0000000..0b32276
--- /dev/null
+++ b/meta-oe/recipes-multimedia/libass/libass_0.10.1.bb
@@ -0,0 +1,5 @@
+require ${PN}.inc
+PR = "${INC_PR}.0"
+
+SRC_URI[md5sum] = "6cace482a013a3c4bf3b31a68ac66026"
+SRC_URI[sha256sum] = "629a7e81fff92dea8d0399b818a41fd1b61e381c67a5961b1eaec2efadb14c6c"
diff --git a/meta-oe/recipes-multimedia/libass/libass_0.9.11.bb b/meta-oe/recipes-multimedia/libass/libass_0.9.11.bb
deleted file mode 100644
index 62c7cf8..0000000
--- a/meta-oe/recipes-multimedia/libass/libass_0.9.11.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require ${PN}.inc
-PR = "${INC_PR}.0"
-
-LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
-
-SRC_URI[md5sum] = "f9042884397002ba40aa89dc7d34f59f"
-SRC_URI[sha256sum] = "ffd0a7ccf635c4795edb8f61015b47ff84ec9c5babf502dd2cc8223d4489745c"
-- 
1.8.0.2



