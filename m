Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com
	[209.85.210.174])
	by mail.openembedded.org (Postfix) with ESMTP id 6E22E7FAAA
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Nov 2019 23:30:03 +0000 (UTC)
Received: by mail-pf1-f174.google.com with SMTP id q13so9982812pff.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Nov 2019 15:30:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=IgI8O8od0hH8X5AiueNMOMgdUh95tvm39NqVNlCxZCc=;
	b=OSZxh2v43kH1iHI/jbK6OO7e4N/aPotHXpe/8Dp5Q3EDvJYFvpgvUolNCotdrKKHwP
	rJmE7bZJSeecCfLlFRCYwvWvnNZZhTKVTnl5Lv8t7d4wlWoaUp5Fgfv9oQZeRzz+RBi4
	NES3b/ZS8ikmB3VQ6GIkXKwiZht6HIndfrFni3JWEu3wBGLaSnHZhyzrSv6871MEVzco
	/t2ZCJq6mMOkT5VxACzJZfQISiCrAYLnolbdViD3OUd6jEN9jjjVgmQs40y3OaV73j9O
	3QnLa5ETYulD/pXNXO4B69Ply5R2FG7zbSaWXKQi4L1+HQRWAA/LVNKwndWauDS9LUxG
	Zi7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=IgI8O8od0hH8X5AiueNMOMgdUh95tvm39NqVNlCxZCc=;
	b=CJ9zSs+LJtPMP+tdqxEwnYEk4v7SoZlYUnWZodgPq6KzezfUyyCpnpUEWQf0gBuCQR
	sLSnV+yOlvymLWr67poetIWcOhq3NcAKXNQ1qRHPqO55pwk8orxgva2CcvyKHzz2iwUx
	NdMB8SRpV4H75UY2y92XdA4mpkduuB6+lJrPjwDqh9sjDV3dblFZnTeNtDYoUaS+ZcUQ
	yUBrRjqyQ7DGr0PmXoghKfwAKo+Vs2Vd+TIxHQj72S2vrUY7V28hwFLm0SvjGnj0bM28
	f0TH+1OE00gAizYBUkB0F8+4G/eNqIpFOW0AimtChOqZ/fU1XMhNqMCcCe3vZMGZ4AYJ
	vauQ==
X-Gm-Message-State: APjAAAW0WOAGNDdtROkJbgBU2FFR+G4zOqaNGGaWodi6dbs0U6Iy3jG8
	H7uzl8qiQ2zokM5KC6zUoKIjN1GmyUI=
X-Google-Smtp-Source: APXvYqy9yc6Naneubb2wVem91rtwFv22cMj4vXcHQpLhx95Ir5JwJetHBWq9ra8ycu2J67JNEgE1SA==
X-Received: by 2002:a63:1013:: with SMTP id f19mr1188954pgl.289.1574811003600; 
	Tue, 26 Nov 2019 15:30:03 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:1c20::e439])
	by smtp.gmail.com with ESMTPSA id
	d38sm13524267pgd.59.2019.11.26.15.30.02
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 26 Nov 2019 15:30:03 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 26 Nov 2019 15:29:52 -0800
Message-Id: <20191126232952.3723066-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Subject: [meta-oe][PATCH v2] mercurial: Upgrade to 5.2 and switch to py3
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
X-List-Received-Date: Tue, 26 Nov 2019 23:30:03 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Fix python path during target build

 .../{mercurial_4.6.1.bb => mercurial_5.2.bb}   | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)
 rename meta-oe/recipes-devtools/mercurial/{mercurial_4.6.1.bb => mercurial_5.2.bb} (56%)

diff --git a/meta-oe/recipes-devtools/mercurial/mercurial_4.6.1.bb b/meta-oe/recipes-devtools/mercurial/mercurial_5.2.bb
similarity index 56%
rename from meta-oe/recipes-devtools/mercurial/mercurial_4.6.1.bb
rename to meta-oe/recipes-devtools/mercurial/mercurial_5.2.bb
index 13710aaea3..713685d0f7 100644
--- a/meta-oe/recipes-devtools/mercurial/mercurial_4.6.1.bb
+++ b/meta-oe/recipes-devtools/mercurial/mercurial_5.2.bb
@@ -3,29 +3,33 @@ HOMEPAGE = "http://mercurial.selenic.com/"
 SECTION = "console/utils"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
-DEPENDS = "python python-native"
-DEPENDS_class-native = "python-native"
-RDEPENDS_${PN} = "python python-modules"
 
-inherit python-dir
+DEPENDS = "python3 python3-native"
+RDEPENDS_${PN} = "python3 python3-modules"
+
+inherit python3native
 
 SRC_URI = "https://www.mercurial-scm.org/release/${BP}.tar.gz"
-SRC_URI[md5sum] = "f9b2e4a3b5901ef744fa3abe4196e97e"
-SRC_URI[sha256sum] = "89fa8ecbc8aa6e48e98f9803a1683ba91367124295dba2407b28c34ca621108d"
+SRC_URI[md5sum] = "9ba9d59157c002db8d8cab680de08eb5"
+SRC_URI[sha256sum] = "ff030e923f03ee15c91191996fcb099bfcfa60c7df263be227f67b6a65d36194"
 
 S = "${WORKDIR}/mercurial-${PV}"
 
 BBCLASSEXTEND = "native"
 
+export LDSHARED="${CCLD} -shared"
+
 EXTRA_OEMAKE = "STAGING_LIBDIR=${STAGING_LIBDIR} STAGING_INCDIR=${STAGING_INCDIR} \
     PREFIX=${prefix}"
 
 do_configure_append () {
-    sed -i -e 's:PYTHON=python:PYTHON=${STAGING_BINDIR_NATIVE}/python-native/python:g' ${S}/Makefile
+    sed -i -e 's:PYTHON?=python:PYTHON?=python3:g' ${S}/Makefile
 }
 
 do_install () {
     oe_runmake -e install-bin DESTDIR=${D} PREFIX=${prefix}
+    sed -i -e 's:${STAGING_BINDIR_NATIVE}/python3-native/python3:${USRBINPATH}/env python3:g' ${D}${bindir}/hg
 }
 
 FILES_${PN} += "${PYTHON_SITEPACKAGES_DIR}"
+
-- 
2.24.0


