Return-Path: <pbarker@toganlabs.com>
Received: from mail-wr0-f195.google.com (mail-wr0-f195.google.com
	[209.85.128.195])
	by mail.openembedded.org (Postfix) with ESMTP id 808C578377
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  5 Nov 2017 22:08:19 +0000 (UTC)
Received: by mail-wr0-f195.google.com with SMTP id k61so1086784wrc.4
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 05 Nov 2017 14:08:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=toganlabs-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=T3p6l+AR/jT6/BW4n7ilu5LcTL9TVHGpct70xVSgM9g=;
	b=vYGAXLAlNd5MMHt0waA0etcRYCWFESr5tpTj2fAW5sfqn6QbTlPMdLJt56szTQbzGq
	JeqjLAUE7kb6G0GlXLBTL2eLfJPXf48A7JO6w+j/ScHMTVDq2YWVyRuGjqtneclbYHsG
	aGDnpVKpfldzoXQNI+fPN3UW8cv4g+8TZdD2LPdoBCgWjY5mZYR50l7RH/WqXSDVyU03
	feZJG+WM24dshLVrX7q8Bq6pfQg62qnPcc5w8r5CtzLTsdmOl5iLZgwRnIBTNCAPVI+z
	FOTheX303Ee1VSQrH2KCL5REUH32xSt2PfXyKCJ+K52Y7zG7bH8Lk/tAme1Bs2ivvgkc
	ebtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=T3p6l+AR/jT6/BW4n7ilu5LcTL9TVHGpct70xVSgM9g=;
	b=KDAqpZQAkjpDjaX1c1kr9DFcKAOO4JstgRiSKF5dGcO00tvvQZuSid9HW2OdU+U/Id
	zkc9JW501S3NfrdUqZxG2FwY9qE++TErm/AaKMO+/n0bvD9bGd25jKoXj0G9zx2RdpTv
	0XD39XWQGaYfzVkh+X4rTJYbNpDK3SpD7bF0T+BzKG/BXhhawnLWPyB1Pz+uJE+OkE8d
	q+EiEJMNlrRJYZ01fRrmtizdBCocmBX3dAbedq3OXe7gpuwtGSppz651dWgshcMRMDly
	4AC6xd5F0yFmf6B3b5/TvGv6dOIvKsTc9UqD8ZBVaiRZ4Nns54MLItKe7ych7RuToU4W
	iXVg==
X-Gm-Message-State: AMCzsaU4SWCkF4zkJ0UzF3P314HA4M02PN09xWNxlIjemq53XPf2ucnj
	+GBYuhDhWhev7SqWWmINjnJDcXpK
X-Google-Smtp-Source: ABhQp+TyIT6KK2N97Yi1HaCyF2GmDaOFWdzfeDEzuXtl/F4F0R+yMHEiubYagWhecV+vDchW5obSCg==
X-Received: by 10.223.188.133 with SMTP id g5mr9852922wrh.204.1509919700927;
	Sun, 05 Nov 2017 14:08:20 -0800 (PST)
Received: from build1.toganlabs.com (build1.toganlabs.com. [88.99.240.167])
	by smtp.gmail.com with ESMTPSA id
	q124sm13845688wmg.18.2017.11.05.14.08.20
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 05 Nov 2017 14:08:20 -0800 (PST)
From: Paul Barker <pbarker@toganlabs.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  5 Nov 2017 22:07:27 +0000
Message-Id: <1509919652-31388-4-git-send-email-pbarker@toganlabs.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1509919652-31388-1-git-send-email-pbarker@toganlabs.com>
References: <1509919652-31388-1-git-send-email-pbarker@toganlabs.com>
Subject: [meta-oe][PATCH 3/8] mercurial: Support building for target
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
X-List-Received-Date: Sun, 05 Nov 2017 22:08:20 -0000

Rather than trying to work out the exact python modules needed, we just add
'python-modules' to the dependencies list. If you can afford to install
mercurial on target then python-modules shouldn't be too much of a burden.

Signed-off-by: Paul Barker <pbarker@toganlabs.com>
---
 .../mercurial/{mercurial-native_4.4.bb => mercurial_4.4.bb}      | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-devtools/mercurial/{mercurial-native_4.4.bb => mercurial_4.4.bb} (78%)

diff --git a/meta-oe/recipes-devtools/mercurial/mercurial-native_4.4.bb b/meta-oe/recipes-devtools/mercurial/mercurial_4.4.bb
similarity index 78%
rename from meta-oe/recipes-devtools/mercurial/mercurial-native_4.4.bb
rename to meta-oe/recipes-devtools/mercurial/mercurial_4.4.bb
index 693d4e4..9052497 100644
--- a/meta-oe/recipes-devtools/mercurial/mercurial-native_4.4.bb
+++ b/meta-oe/recipes-devtools/mercurial/mercurial_4.4.bb
@@ -3,7 +3,11 @@ HOMEPAGE = "http://mercurial.selenic.com/"
 SECTION = "console/utils"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
-DEPENDS = "python-native"
+DEPENDS = "python python-native"
+DEPENDS_class-native = "python-native"
+RDEPENDS_${PN} = "python python-modules"
+
+inherit python-dir
 
 SRC_URI = "https://www.mercurial-scm.org/release/${BP}.tar.gz"
 SRC_URI[md5sum] = "c1d9fad1b7ed7077b0d4ae82e71154db"
@@ -11,7 +15,7 @@ SRC_URI[sha256sum] = "234af4a67565c85923b0a1910c704ab44bcf12f69b8553268720877656
 
 S = "${WORKDIR}/mercurial-${PV}"
 
-inherit native
+BBCLASSEXTEND = "native"
 
 EXTRA_OEMAKE = "STAGING_LIBDIR=${STAGING_LIBDIR} STAGING_INCDIR=${STAGING_INCDIR} \
     PREFIX=${prefix}"
@@ -24,3 +28,4 @@ do_install () {
     oe_runmake -e install-bin DESTDIR=${D} PREFIX=${prefix}
 }
 
+FILES_${PN} += "${PYTHON_SITEPACKAGES_DIR}"
-- 
2.7.4


