Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 994417704E
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Oct 2015 08:00:16 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id t9L80GES011569
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 21 Oct 2015 01:00:16 -0700 (PDT)
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Wed, 21 Oct 2015 01:00:15 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-devel@lists.openembedded.org>, <martin.jansa@gmail.com>
Date: Wed, 21 Oct 2015 15:47:39 +0800
Message-ID: <1445413660-30085-3-git-send-email-Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1445413660-30085-1-git-send-email-Qi.Chen@windriver.com>
References: <1445413660-30085-1-git-send-email-Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH V2 3/4] rrdtool: add systemd support and fix QA issue
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
X-List-Received-Date: Wed, 21 Oct 2015 08:00:16 -0000
Content-Type: text/plain

When building rrdtool in a building directory where systemd is configured
to be the init system, we would meet the following error.

ERROR: QA Issue: rrdtool: Files/directories were installed but not shipped in any package:
   /lib
   /lib/systemd
   /lib/systemd/system
   /lib/systemd/system/rrdcached.socket
   /lib/systemd/system/rrdcached.service

Fix this problem by adding systemd support to the rrdtool recipe.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta-oe/recipes-extended/rrdtool/rrdtool_1.5.4.bb | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-extended/rrdtool/rrdtool_1.5.4.bb b/meta-oe/recipes-extended/rrdtool/rrdtool_1.5.4.bb
index 14e1966..9b54deb 100644
--- a/meta-oe/recipes-extended/rrdtool/rrdtool_1.5.4.bb
+++ b/meta-oe/recipes-extended/rrdtool/rrdtool_1.5.4.bb
@@ -15,11 +15,13 @@ SRC_URI = "\
 
 S = "${WORKDIR}/git"
 
-inherit autotools-brokensep gettext pythonnative perlnative python-dir cpan-base
+inherit autotools-brokensep gettext pythonnative perlnative python-dir cpan-base systemd
+
+SYSTEMD_SERVICE_${PN} = "rrdcached.socket rrdcached.service"
 
 EXTRA_AUTORECONF = "-I m4"
 
-PACKAGECONFIG ??= "python perl"
+PACKAGECONFIG ??= "python perl ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)}"
 
 PACKAGECONFIG[python] = "--enable-python=yes \
 am_cv_python_pythondir=${STAGING_LIBDIR}/python${PYTHON_BASEVERSION}/site-packages \
@@ -33,6 +35,8 @@ ac_cv_path_PERL_CC='${CC}',  \
 
 PACKAGECONFIG[dbi] = "--enable-libdbi,--disable-libdbi,libdbi"
 
+PACKAGECONFIG[systemd] = "--with-systemdsystemunitdir=${systemd_unitdir}/system/,--without-systemdsystemunitdir,systemd,"
+
 EXTRA_OECONF = " \
     --enable-shared \
     --disable-libwrap \
-- 
1.9.1


