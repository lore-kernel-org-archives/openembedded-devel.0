Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1Spc6s-0006VU-MC
	for openembedded-devel@lists.openembedded.org;
	Fri, 13 Jul 2012 11:24:26 +0200
Received: by mail-ey0-f175.google.com with SMTP id l1so885914eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Jul 2012 02:13:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=9jtUR+lM+W4EtFiBnLsYycUf/PYqN9nIC8RZRyU0Fm0=;
	b=pId1Td/+W1V2aHoR1wGf7sMK0OkqguK9MNScrb6eyvdH6aEu3LehWL/n2dj4t46jp0
	1Xls4aaQbLEOrq7MmWMumAD70VE0Xzh2GG69eSHizxK72BWi6IF/HNWDzbbuT6lG/ZLR
	6FjRWMjlTB9F1XbEm8PTwNwRZSySuejraW0UtcIXDteA4adTE0MyXNTqe285zEgBNsek
	meooc9aFKPJ+7X46OFGQk9Jx/zB7Km9S2xrUyi+iRuA4PqLBEo4Kb8wbIhmKwoPKdTmi
	8U9pNct1K5RGjYrMo4+kVWm2tTv+RHCLW7QdpccHdMCECs8WW2tY7p0Rp/z/Fm5YfrJp
	Hjwg==
Received: by 10.14.28.137 with SMTP id g9mr75925eea.99.1342170794773;
	Fri, 13 Jul 2012 02:13:14 -0700 (PDT)
Received: from localhost (cl-267.ams-05.nl.sixxs.net. [2001:610:600:10a::2])
	by mx.google.com with ESMTPS id y54sm23168956eef.10.2012.07.13.02.13.12
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 13 Jul 2012 02:13:13 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 13 Jul 2012 11:12:03 +0200
Message-Id: <1342170730-14982-17-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <1342170730-14982-1-git-send-email-koen@dominion.thruhere.net>
References: <1342170730-14982-1-git-send-email-koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQnR9XTVRSNsbYljKC6K7aVXNj1Da9wTQVTU6yBVCinYr6ny4Dy4XU+QfV4RlwrbZxlPPQPN
Cc: Koen Kooi <koen@dominion.thruhere.net>,
	Martin Jansa <martin.jansa@gmail.com>, eric@eukrea.com
Subject: [for-denzil][meta-oe 17/24] edje: explicitly enable libsndfile for target recipe
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
X-List-Received-Date: Fri, 13 Jul 2012 09:24:26 -0000

From: Martin Jansa <martin.jansa@gmail.com>

* there is no native/nativesdk support in libsndfile so disable it fro native/nativesdk edje
* Thanks to Koen for noticing that it's autodetected and sometimes leaks into feeds

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta-efl/recipes-efl/efl/edje.inc |    7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

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
1.7.10



