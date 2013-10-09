Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id D623E6CBAB
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  9 Oct 2013 07:30:40 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r997Ue4l028715
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 9 Oct 2013 00:30:40 -0700 (PDT)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Wed, 9 Oct 2013 00:30:39 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 9 Oct 2013 15:30:34 +0800
Message-ID: <76819dc80763612f9db320c4caa642e4ba68db9d.1381303657.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1381303656.git.hongxu.jia@windriver.com>
References: <cover.1381303656.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Cc: paul.eggleton@linux.intel.com
Subject: [meta-oe][PATCH 1/2] mariadb: update libdir for libtool
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
X-List-Received-Date: Wed, 09 Oct 2013 07:30:42 -0000
Content-Type: text/plain

In mariadb recipe,do_install move all the lib files from usr/lib/mysql
to usr/lib,but didn't change libdir value in *.la libtool file. This
will cause libtool can't get correct lib path of mysql when other
package need mysql lib.So update them to correct value.

Here is a exapmle:
In libmysqlclient.la file: libdir = "/usr/lib/mysq/", but in fact
libmysqclient.so is installed into  "/usr/lib", this will cause
libtool can not find correct lib file with libmysqlclient.la, then
libtool will use rpath option to reference a absolute path, and
this will cause rpath WARING and rpm error.

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta-oe/recipes-support/mysql/mariadb_5.1.67.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-support/mysql/mariadb_5.1.67.inc b/meta-oe/recipes-support/mysql/mariadb_5.1.67.inc
index c535a41..fd9264f 100644
--- a/meta-oe/recipes-support/mysql/mariadb_5.1.67.inc
+++ b/meta-oe/recipes-support/mysql/mariadb_5.1.67.inc
@@ -80,6 +80,7 @@ do_install() {
     oe_runmake 'DESTDIR=${D}' install
     mv -f ${D}${libdir}/mysql/* ${D}${libdir}
     rmdir ${D}${libdir}/mysql
+    find ${D}${libdir} -name '*.la'|xargs sed -i 's#${libdir}/mysql#${libdir}#'
 
     install -d ${D}/etc/init.d
     install -m 0644 ${WORKDIR}/my.cnf ${D}/etc/
-- 
1.8.1.2


