Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TBRV7-0006ot-K1
	for openembedded-devel@lists.openembedded.org;
	Tue, 11 Sep 2012 16:31:41 +0200
Received: by mail-ee0-f47.google.com with SMTP id b57so429158eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Sep 2012 07:19:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=8t5owcImvO0HcMRE5ny284cIETuit+N8YXigRmgE2+o=;
	b=hQH64IMT8dFz+q8OUUeFH0rhBxvo8Xo3GoC5KaRDT/49F4Bpka7Bd2ojZ5tn5BmRP6
	rxj+CA8OlHC1JTsupYPNMD3iFxQzUsrocoOPHvEhw6nPLOff5dPTTJPEkxo6h6Y23Fl9
	Vkows3WWvTS8SEyOIV86TWpCbeBXYlgIvlF01+oacfLTb3ETqo+VOYt4P7DAbpyN0JrW
	VjSsfY4D+sXEHMxFKtbMZ6lXJi7qaDGRF6xErkCY0qdGowlZLDaAVTLkbh9iuVwiMZJT
	HIlvUGQI2wczyal7UET2drJB6ynAFfTRiunXgfg2v6b+0FQTU6+4uSiYE3winsB9srS4
	RkJA==
Received: by 10.204.128.202 with SMTP id l10mr4794788bks.127.1347373152966;
	Tue, 11 Sep 2012 07:19:12 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id n5sm9795534bkv.14.2012.09.11.07.19.11
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 11 Sep 2012 07:19:12 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 11 Sep 2012 16:18:59 +0200
Message-Id: <c38f5cba0b540d6387fb2b1bc13ba3b2b972d70c.1347363666.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.12
In-Reply-To: <cover.1347363666.git.Martin.Jansa@gmail.com>
References: <cover.1347363666.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1347363666.git.Martin.Jansa@gmail.com>
References: <cover.1347363666.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][meta-efl][PATCH 1/5] evas: move EVAS_CPU_TWEAKS to target EXTRA_OECONF
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
X-List-Received-Date: Tue, 11 Sep 2012 14:31:41 -0000

* it was causing different sstate checksum for evas-native
  $ bitbake-diffsigs
    stamps.1347348593/nokia900/x86_64-linux/evas-native-2_1.7.0-r0.0.do_configure.sigdata.cc8b80e938b87ad1bb8d6ded52ef941f
    stamps.1347348593/om-gta02/x86_64-linux/evas-native-2_1.7.0-r0.0.do_configure.sigdata.e6143417eb7ea0ebd0ab299ce5a024ea
      basehash changed from f453b3bdd276ffd49445d1c81e2962e8 to 3a244a9f14657439d5b4a8c7d609b087
      Variable EVAS_CPU_TWEAKS value changed from --disable-cpu-neon to

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/recipes-efl/efl/evas.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-efl/recipes-efl/efl/evas.inc b/meta-efl/recipes-efl/efl/evas.inc
index 89ae1a4..b0ec0cf 100644
--- a/meta-efl/recipes-efl/efl/evas.inc
+++ b/meta-efl/recipes-efl/efl/evas.inc
@@ -8,7 +8,7 @@ DEPENDS_virtclass-native = "freetype-native libxext-native libpng-native jpeg-na
 inherit efl
 
 BBCLASSEXTEND = "native"
-INC_PR = "r0"
+INC_PR = "r1"
 FILESPATHPKG =. "${BPN}-${PV}:${BPN}:"
 
 python populate_packages_prepend () {
@@ -112,7 +112,6 @@ EVAS_OECONF = " \
                 --enable-convert-16-rgb-rot-90 \
                 --disable-convert-16-rgb-rot-180 \
                 --enable-convert-16-rgb-rot-270 \
-                ${EVAS_CPU_TWEAKS} \
 "
 
 # either sgx or 6410 atm
@@ -124,6 +123,7 @@ GLES ?= "sgx"
 # If the above sentence confuse you: everything is built and configured as before if you don't have the SDK
 
 EXTRA_OECONF = "${EVAS_OECONF} \
+                ${EVAS_CPU_TWEAKS} \
                 --enable-pthreads \
                 --enable-async-events \
                 --enable-async-preload \
-- 
1.7.12



