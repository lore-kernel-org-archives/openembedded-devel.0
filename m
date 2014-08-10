Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f170.google.com (mail-wi0-f170.google.com
	[209.85.212.170])
	by mail.openembedded.org (Postfix) with ESMTP id 45FC465D5E
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Aug 2014 14:01:58 +0000 (UTC)
Received: by mail-wi0-f170.google.com with SMTP id f8so4445699wiw.1
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Aug 2014 07:01:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=6rznwwxo+mFo+SHmJjWHzZI05k81ay9NLr5G1Re7qBI=;
	b=WPpycxNVA8F5alQ7inEOZlAxyKPNI2piAUHIxlM7P+96CipxO78RI/B0hR+DnSfhzw
	hqFu691RoAkxR+ZHvr3xWHmuGWARD0xybdAAOTLmA/fTOIcM14PBnsilaGCi8OX/oI5W
	xAq2pqvPy2rTVZll5EGUik0Ykwyfp36SeVXJcnY70VpEq6BKY824mvnb57LSibBT2h8A
	rvlUHT5fQnGnQl2b0Slfp/yBFvDFKDqtwi1UkNhciUnKraR84wTQmTIFs5wZKdzttAqx
	GLfN33VrwYP7V1HO1Eli5zIeKbTgbPy2N4UhGSzuYp5XC4d1clA7tUos7k8wBBHh1P5z
	RURg==
X-Received: by 10.180.12.38 with SMTP id v6mr12316889wib.31.1407679319283;
	Sun, 10 Aug 2014 07:01:59 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	f6sm32292546wja.25.2014.08.10.07.01.58 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 10 Aug 2014 07:01:58 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 10 Aug 2014 16:02:23 +0200
Message-Id: <1407679345-31695-5-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.0.4
In-Reply-To: <1407679345-31695-1-git-send-email-Martin.Jansa@gmail.com>
References: <1407679345-31695-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 5/7] webmin: explicitly list some packages, drop perl-module-timelocal rdep
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
X-List-Received-Date: Sun, 10 Aug 2014 14:02:02 -0000

* perl-module-time-local is already in RDEPENDS (I guess it's the
  same thing as perl-module-timelocal without the last dash)
* list some packages explicitly so that bitbake finds their
  RDEPENDS correctly
* fixes following warnings:
  webmin-1.620: webmin-module-raid rdepends on mdadm, but it isn't a build dependency? [build-deps]
  webmin-1.620: webmin-module-proc rdepends on procps, but it isn't a build dependency? [build-deps]
  webmin-1.620: webmin rdepends on perl-module-timelocal, but it isn't a build dependency? [build-deps]

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-webserver/recipes-webadmin/webmin/webmin_1.620.bb | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/meta-webserver/recipes-webadmin/webmin/webmin_1.620.bb b/meta-webserver/recipes-webadmin/webmin/webmin_1.620.bb
index 91ec5d7..95540cc 100644
--- a/meta-webserver/recipes-webadmin/webmin/webmin_1.620.bb
+++ b/meta-webserver/recipes-webadmin/webmin/webmin_1.620.bb
@@ -111,16 +111,17 @@ INITSCRIPT_PARAMS = "start 99 5 3 2 . stop 10 0 1 6 ."
 RDEPENDS_${PN} += "perl perl-module-socket perl-module-exporter perl-module-exporter-heavy perl-module-carp perl-module-strict"
 RDEPENDS_${PN} += "perl-module-warnings perl-module-xsloader perl-module-posix perl-module-autoloader"
 RDEPENDS_${PN} += "perl-module-fcntl perl-module-tie-hash perl-module-vars perl-module-time-local perl-module-config perl-module-constant"
-RDEPENDS_${PN} += "perl-module-file-glob perl-module-file-copy perl-module-sdbm perl-module-sdbm-file perl-module-timelocal perl-module-feature"
+RDEPENDS_${PN} += "perl-module-file-glob perl-module-file-copy perl-module-sdbm perl-module-sdbm-file perl-module-feature"
 
 PACKAGES_DYNAMIC += "webmin-module-* webmin-theme-*"
 RRECOMMENDS_${PN} += "webmin-module-system-status"
 
-RDEPENDS_webmin-module-proc = "procps"
-RDEPENDS_webmin-module-raid = "mdadm"
-RDEPENDS_webmin-module-exports = "perl-module-file-basename perl-module-file-path perl-module-cwd perl-module-file-spec perl-module-file-spec-unix"
-RRECOMMENDS_webmin-module-fdisk = "parted"
-RRECOMMENDS_webmin-module-lvm = "lvm2"
+PACKAGES += "${PN}-module-proc ${PN}-module-raid ${PN}-module-exports ${PN}-module-fdisk ${PN}-module-lvm"
+RDEPENDS_${PN}-module-proc = "procps"
+RDEPENDS_${PN}-module-raid = "mdadm"
+RDEPENDS_${PN}-module-exports = "perl-module-file-basename perl-module-file-path perl-module-cwd perl-module-file-spec perl-module-file-spec-unix"
+RRECOMMENDS_${PN}-module-fdisk = "parted"
+RRECOMMENDS_${PN}-module-lvm = "lvm2"
 
 python populate_packages_prepend() {
     import os, os.path
-- 
2.0.4


