Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SKSRs-0005A6-QC
	for openembedded-devel@lists.openembedded.org;
	Wed, 18 Apr 2012 12:49:20 +0200
Received: by wgbdr12 with SMTP id dr12so6107716wgb.24
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Apr 2012 03:39:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=eyn0l3WJx+lA2D9pOBQFm6Mv9CXrtuGZQ92LhoP9rPs=;
	b=HQyjix3Vv+RFtxVFQ4MDiSHOK0mfriVHvrSuaIxCOu4j0hARr8Cy4nNIuO3ONwp3Fu
	v4B7i03bZzwxDW4CH+OHB6LFQKrfOwIY6GASiGEkKJF7TskdM74YaF/vtul5at9P8J6b
	/M2eJ0r5QdNIWDd3ib6Hwifc/mMDVR+9sffQ73wouZkSfe4wcVCpD8URhOOPypeJX8p9
	Sw/u72Yx+Owbp8J3Jld4z9KrdESnkwfSVcbj7cPdisz2Hw7Gt/RnGEP0GDw0K1ohWa1K
	+NBCfHa3PSsAptGGSN7KFycETHfy13xbxoxtFVV56FQXi0v/v8wwaaUwR6MlcpruFkUp
	wqQw==
Received: by 10.216.135.225 with SMTP id u75mr1041071wei.97.1334745593685;
	Wed, 18 Apr 2012 03:39:53 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id j3sm54010270wiw.1.2012.04.18.03.39.52
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 18 Apr 2012 03:39:53 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 18 Apr 2012 12:39:45 +0200
Message-Id: <1334745585-29731-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.5
Cc: Luca Vaudano <vaudano@gmail.com>
Subject: [meta-oe][PATCH] mime-support: Update to version 3.48
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
X-List-Received-Date: Wed, 18 Apr 2012 10:49:21 -0000

From: Luca Vaudano <vaudano@gmail.com>

Signed-off-by: Luca Vaudano <vaudano@gmail.com>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../{mime-support_3.44.bb => mime-support_3.48.bb} |    5 ++---
 1 files changed, 2 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-support/mime-support/{mime-support_3.44.bb => mime-support_3.48.bb} (93%)

diff --git a/meta-oe/recipes-support/mime-support/mime-support_3.44.bb b/meta-oe/recipes-support/mime-support/mime-support_3.48.bb
similarity index 93%
rename from meta-oe/recipes-support/mime-support/mime-support_3.44.bb
rename to meta-oe/recipes-support/mime-support/mime-support_3.48.bb
index fe84a63..f281f6d 100644
--- a/meta-oe/recipes-support/mime-support/mime-support_3.44.bb
+++ b/meta-oe/recipes-support/mime-support/mime-support_3.48.bb
@@ -5,7 +5,6 @@ LIC_FILES_CHKSUM = "file://debian/README;md5=36bbe2ace0a05c3fb684b73208fbf30b"
 
 DEPENDS = "file"
 RRECOMMENDS_${PN} = "file"
-PR = "r2"
 
 SRC_URI = "${DEBIAN_MIRROR}/main/m/mime-support/mime-support_${PV}-1.tar.gz"
 S = "${WORKDIR}/${PN}"
@@ -55,5 +54,5 @@ do_install () {
 	cd ${D}${mandir}/man1; ln -s run-mailcap.1.gz print.1.gz
 }
 
-SRC_URI[md5sum] = "048aa29c31f067382cd669ee20934b9e"
-SRC_URI[sha256sum] = "4f65183200955540c097b82bfb18f5d21b636ca79f47cd018a4ea8b89cd2998c"
+SRC_URI[md5sum] = "d6e5d715e331147352c50c158dbdec6d"
+SRC_URI[sha256sum] = "a529c7892cb786f514af71f4ca5a4c3ebc58b538a49ff959c0d97592d38f040a"
-- 
1.7.8.5



