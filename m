Return-Path: <ticotimo@gmail.com>
Received: from mail-yk0-f181.google.com (mail-yk0-f181.google.com
	[209.85.160.181])
	by mail.openembedded.org (Postfix) with ESMTP id B35C2755F8
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  3 Aug 2015 02:28:07 +0000 (UTC)
Received: by ykeo23 with SMTP id o23so3217521yke.3
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 02 Aug 2015 19:28:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=lHtLvG6/ugc0FKwj8dvJ9IhxvXZDXJS1t/wLVgCNuBw=;
	b=XCEFwkZ4ZzsRMvnUp7MPWvCsfYpS24+x1pff1rY54vW+UjuWaWWSyxfGQnteCzy3Mp
	M3EzrDsApfrn935UAlGRcHH15MNnZ32Xlz+HpDdJ6fy4mha72kyJOUhRxf0qnO0FRKzQ
	wt+B5lAPV4O7b79A9yyekXatGbaYQlazYGwTU0ijg5xD1dUxa/Vp5bnaFO6wWw0FJkK+
	A0pOiONOcOmKc2M3lkg2BtyutjPQduKlclZVJMyHNAvGEY/n/AuOyscr8fZ3F7MRvOoz
	q4bUBjFthzVfHND3lX+RhGw/kZraifDh+tNTPRqqmVsszyxUHWyxVGtiFmpLbwMCkLUa
	JAuw==
X-Received: by 10.170.146.7 with SMTP id n7mr17306678ykc.100.1438568887308;
	Sun, 02 Aug 2015 19:28:07 -0700 (PDT)
Received: from localhost.localdomain.localdomain
	(75-128-22-150.dhcp.snlo.ca.charter.com. [75.128.22.150])
	by smtp.gmail.com with ESMTPSA id
	w71sm12437980ywa.15.2015.08.02.19.28.05
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 02 Aug 2015 19:28:06 -0700 (PDT)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <TicoTimo@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  2 Aug 2015 19:27:33 -0700
Message-Id: <1438568853-10554-1-git-send-email-TicoTimo@gmail.com>
X-Mailer: git-send-email 2.1.0
Subject: [meta-oe][meta-python][PATCH] python-pyparted: update to 3.10.5
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
X-List-Received-Date: Mon, 03 Aug 2015 02:28:12 -0000

* Upstream changed from fedorahosted to github

Signed-off-by: Tim Orling <TicoTimo@gmail.com>
---
 .../{python-pyparted_3.9.bb => python-pyparted_3.10.5.bb}   | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)
 rename meta-python/recipes-extended/python-pyparted/{python-pyparted_3.9.bb => python-pyparted_3.10.5.bb} (54%)

diff --git a/meta-python/recipes-extended/python-pyparted/python-pyparted_3.9.bb b/meta-python/recipes-extended/python-pyparted/python-pyparted_3.10.5.bb
similarity index 54%
rename from meta-python/recipes-extended/python-pyparted/python-pyparted_3.9.bb
rename to meta-python/recipes-extended/python-pyparted/python-pyparted_3.10.5.bb
index bfb4f6f..a89c897 100644
--- a/meta-python/recipes-extended/python-pyparted/python-pyparted_3.9.bb
+++ b/meta-python/recipes-extended/python-pyparted/python-pyparted_3.10.5.bb
@@ -2,18 +2,19 @@ DESCRIPTION = "pyparted is a set of Python modules that provide Python programme
 an interface to libparted, the GNU parted library for disk partitioning and \
 filesystem manipulation."
 SUMMARY = "Python bindings for libparted"
-HOMEPAGE = "https://fedorahosted.org/pyparted/"
+HOMEPAGE = "https://github.com/rhinstaller/pyparted/"
 LICENSE = "GPL-2.0+"
 LIC_FILES_CHKSUM = "\
     file://COPYING;md5=8ca43cbc842c2336e835926c2166c28b \
-    file://src/_pedmodule.c;startline=10;endline=22;md5=70c62bd73782a03f56a0571a9f08ea46 \
+    file://src/_pedmodule.c;startline=10;endline=22;md5=ebcb25dde1ac9c46e986dec79b404e7e \
 "
 DEPENDS += "parted"
 
-SRC_URI = "https://fedorahosted.org/releases/p/y/pyparted/pyparted-${PV}.tar.gz"
-SRC_URI[md5sum] = "f16c7ef7f5fa4a43fcb2a4654b487e39"
-SRC_URI[sha256sum] = "a56712e3d058ce3d859c158236dbbf45224018919efd3d880ea80f9e0d0bebbb"
-S = "${WORKDIR}/pyparted-${PV}"
+SRCNAME = "pyparted"
+SRC_URI = "https://github.com/rhinstaller/${SRCNAME}/archive/v${PV}.tar.gz"
+SRC_URI[md5sum] = "b303caf8e907a2541e71aa492494b5e5"
+SRC_URI[sha256sum] = "8cbaf024fbbc73cdceab2eac0937035052da48295970fe9eaa84b19d8e353e19"
+S = "${WORKDIR}/${SRCNAME}-${PV}"
 
 inherit distutils
 
-- 
2.1.0


