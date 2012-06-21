Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1ShcmA-0000Ks-Rx
	for openembedded-devel@lists.openembedded.org;
	Thu, 21 Jun 2012 10:30:02 +0200
Received: by mail-we0-f175.google.com with SMTP id g55so210783wer.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Jun 2012 01:19:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=OsnJeLvNd7QK+LvMc0s5R9hmwtDM2ajEIDeFCmt3sHw=;
	b=ojWZvtZifk6NA/iJd6DB9IwxDlnrzWnp2O3qYOcX8dnA0vgU7mj7tXXF3nLh8rBbK1
	E5iNHGz4MY95m0xRtQw7KM/rGDnGfejzPBB/8jlD+xWqRoxP8+EHfqScEHMgCwaf71wK
	80+/uFIdsMVwHhw1huZQfMI7Vn6wwAht0xpxd4b+B5/URMMbcypxpzFAimNWpLUl4aZb
	4m6DE7d/A5YsW7tqDoHDZ9TfwHJDd7v/Z+qeNOdMByX/UmZ9R5hlxvNxJnhukb1HHgOz
	QcblThg7V2WDCI0N08cRvf9tOGFHkKY2Zg9eyY2HLpBhhzH2weHWXN66bR4l243pRYKm
	qG5A==
Received: by 10.216.196.90 with SMTP id q68mr15686951wen.130.1340266759502;
	Thu, 21 Jun 2012 01:19:19 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id fo7sm44579865wib.9.2012.06.21.01.19.18
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 21 Jun 2012 01:19:18 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 21 Jun 2012 10:18:47 +0200
Message-Id: <e025b4a12cb47310b7b7053121785fd993183013.1340266416.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.6
In-Reply-To: <cover.1340266416.git.Martin.Jansa@gmail.com>
References: <cover.1340266416.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1340266416.git.Martin.Jansa@gmail.com>
References: <cover.1340266416.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][meta-efl][PATCH 3/5] edje: explicitly enable libsndfile for target recipe
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
X-List-Received-Date: Thu, 21 Jun 2012 08:30:02 -0000

* there is no native/nativesdk support in libsndfile so disable it fro native/nativesdk edje
* Thanks to Koen for noticing that it's autodetected and sometimes leaks into feeds

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/recipes-efl/efl/edje.inc |    7 ++++++-
 1 files changed, 6 insertions(+), 1 deletions(-)

diff --git a/meta-efl/recipes-efl/efl/edje.inc b/meta-efl/recipes-efl/efl/edje.inc
index 41f04b0..311fb52 100644
--- a/meta-efl/recipes-efl/efl/edje.inc
+++ b/meta-efl/recipes-efl/efl/edje.inc
@@ -1,5 +1,5 @@
 DESCRIPTION = "Edje is the Enlightenment graphical design & layout library"
-DEPENDS = "lua5.1 eet evas ecore embryo edje-native eina"
+DEPENDS = "lua5.1 eet evas ecore embryo edje-native eina libsndfile1"
 DEPENDS_virtclass-native = "lua5.1-native evas-native ecore-native eet-native embryo-native eina-native"
 DEPENDS_virtclass-nativesdk = "evas-native ecore-native eet-native embryo-native eina-native"
 # GPLv2 because of epp in PN-utils
@@ -35,6 +35,11 @@ do_compile_append() {
 require edje-fpu.inc
 EXTRA_OECONF += "${@get_edje_fpu_setting(bb, d)}"
 
+SNDFILE = "--enable-sndfile"
+SNDFILE_virtclass-native = "--disable-sndfile"
+SNDFILE_virtclass-nativesdk = "--disable-sndfile"
+EXTRA_OECONF += "${SNDFILE}"
+
 PACKAGES =+ "${PN}-utils"
 RDEPENDS_${PN}-utils = "cpp cpp-symlinks embryo-tests"
 
-- 
1.7.8.6



