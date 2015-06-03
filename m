Return-Path: <Rongqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 4A60275713
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  3 Jun 2015 09:45:43 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.1/8.15.1) with ESMTPS id t539jiEp020920
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 3 Jun 2015 02:45:44 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.224.2; Wed, 3 Jun 2015 02:45:44 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 3 Jun 2015 17:39:36 +0800
Message-ID: <1433324376-3374-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH][meta-oe] php: add a vardeps for configure on sysconfdir
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
X-List-Received-Date: Wed, 03 Jun 2015 09:45:44 -0000
Content-Type: text/plain

From: Roy Li <rongqing.li@windriver.com>

building php will fail when sstatus is used, since some hardcode paths
in php-native will make the wrong path, and try to fix it like below:
    do_install_append_virtclass-native() {
           create_wrapper ${D}${bindir}/php \
               PHP_PEAR_SYSCONF_DIR=${sysconfdir}/ \
    }
but php-native does not work for a 64bit target(qemuarm64) and if sstat is
from a 32bit(qemuppc) on the host same machine.

Consider no too much package depends on php-native, so add a vardeps for
configure on sysconfdir to force php-native to build always.

Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 meta-oe/recipes-devtools/php/php_5.5.24.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-devtools/php/php_5.5.24.bb b/meta-oe/recipes-devtools/php/php_5.5.24.bb
index 3e656af..9c0dd7f 100644
--- a/meta-oe/recipes-devtools/php/php_5.5.24.bb
+++ b/meta-oe/recipes-devtools/php/php_5.5.24.bb
@@ -106,6 +106,8 @@ EXTRA_OEMAKE = "INSTALL_ROOT=${D}"
 
 acpaths = ""
 
+do_configure[vardeps] += "${sysconfdir}"
+
 do_configure_prepend () {
     rm -f ${S}/build/libtool.m4 ${S}/ltmain.sh ${S}/aclocal.m4
     find ${S} -name config.m4 | xargs -n1 sed -i 's!APXS_HTTPD=.*!APXS_HTTPD=${STAGING_BINDIR_NATIVE}/httpd!'
-- 
1.9.1


