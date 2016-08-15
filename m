Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f193.google.com (mail-qt0-f193.google.com
	[209.85.216.193])
	by mail.openembedded.org (Postfix) with ESMTP id 426AB7713C
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Aug 2016 19:04:56 +0000 (UTC)
Received: by mail-qt0-f193.google.com with SMTP id q11so2417763qtb.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Aug 2016 12:04:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=4EHTBaX+j5/4rT1w81l3Tym2JaxnQIoxQ9+SkQ3rm9M=;
	b=NRin4YfCi2YVwybLwPfxGJz62UmnhUzz+XH+nsjMvrDFrx4Tktr6XhMUfwnAsr2BJ5
	ZQhKAtAkS++91a+NHYZlzZ13EqPVq0/SydLdO26xIvSOjDgQtPLEJAdyW0t+Vo0nx+hn
	xdnuGkXrej2RuQ4xfz6Vomr51zMMXwNO+8caf87KwIdvByWrEC7rn7mwJBBvA4qg5FHv
	N9bdZR4rS8W88vVckxx0lS2HCFZ4DYcqS4li5LuqIVoEixt27dKuRrqODb7B6T5LHxlG
	J8AHeY686Mo6EI1GPrycCdbse9SVfwbSlYtHzM1Yak7A9WM0N/h4mWCnWGEA/m8jYz44
	YAaQ==
X-Gm-Message-State: AEkooutUGwKmOCj1OSR1z/G0/j4MB/thfVqNwVDDpysJqVyLPCq3E8D1xYEbSgfWmsC6Vg==
X-Received: by 10.200.51.173 with SMTP id c42mr32945671qtb.14.1471287897438;
	Mon, 15 Aug 2016 12:04:57 -0700 (PDT)
Received: from localhost.localdomain ([96.91.222.230])
	by smtp.gmail.com with ESMTPSA id
	j38sm13133088qtj.35.2016.08.15.12.04.56
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 15 Aug 2016 12:04:56 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 15 Aug 2016 15:04:31 -0400
Message-Id: <1471287872-24274-2-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1471287872-24274-1-git-send-email-derek@asterius.io>
References: <1471287872-24274-1-git-send-email-derek@asterius.io>
Subject: [meta-oe][PATCHv2 2/3] libp11: update to version 0.4.0
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
X-List-Received-Date: Mon, 15 Aug 2016 19:04:57 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../libp11/{libp11_0.3.0.bb => libp11_0.4.0.bb}               | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/libp11/{libp11_0.3.0.bb => libp11_0.4.0.bb} (57%)

diff --git a/meta-oe/recipes-support/libp11/libp11_0.3.0.bb b/meta-oe/recipes-support/libp11/libp11_0.4.0.bb
similarity index 57%
rename from meta-oe/recipes-support/libp11/libp11_0.3.0.bb
rename to meta-oe/recipes-support/libp11/libp11_0.4.0.bb
index d97bfc6..d88006c 100644
--- a/meta-oe/recipes-support/libp11/libp11_0.3.0.bb
+++ b/meta-oe/recipes-support/libp11/libp11_0.4.0.bb
@@ -8,16 +8,23 @@ LICENSE = "LGPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=fad9b3332be894bab9bc501572864b29"
 DEPENDS = "libtool openssl"
 
-SRC_URI = "git://github.com/OpenSC/libp11.git;protocol=http"
-SRCREV = "6f71240991aa831f6fc2cc5431faf6ebec627ed2"
+SRC_URI = "git://github.com/OpenSC/libp11.git"
+SRCREV = "22de793340ab73cafc92f8238afb51a06d8411c3"
 
 S = "${WORKDIR}/git"
 
 inherit autotools pkgconfig
 
+# Currently, Makefile dependencies are incorrectly defined which causes build errors
+# The number of jobs is high
+# See https://github.com/OpenSC/libp11/issues/94
+PARALLEL_MAKE = ""
 EXTRA_OECONF = "--disable-static"
 
 do_install_append () {
     rm -rf ${D}${libdir}/*.la
     rm -rf ${D}${docdir}/${BPN}
 }
+
+FILES_${PN} += "${libdir}/pkcs11${SOLIBS}"
+FILES_${PN}-dev += "${libdir}/pkcs11${SOLIBSDEV}"
-- 
2.7.4


