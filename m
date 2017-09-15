Return-Path: <Dengke.Du@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id D68C277E4D
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Sep 2017 03:18:26 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v8F3IOdq013904
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 14 Sep 2017 20:18:25 -0700 (PDT)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.361.1;
	Thu, 14 Sep 2017 20:18:24 -0700
From: Dengke Du <dengke.du@windriver.com>
To: <peter.kjellerstedt@axis.com>
Date: Thu, 14 Sep 2017 23:18:21 -0400
Message-ID: <1505445501-202185-2-git-send-email-dengke.du@windriver.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <1505445501-202185-1-git-send-email-dengke.du@windriver.com>
References: <1505445501-202185-1-git-send-email-dengke.du@windriver.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: [meta-webserver][PATCH V2 2/2] apache2: change files layout to debian style
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
X-List-Received-Date: Fri, 15 Sep 2017 03:18:27 -0000
Content-Type: text/plain

The default layout installs log files and pid files into /var/apache2/logs.
This is odd and also will cause security issues because selinux does not know
how to label the security contexts for the files.

Signed-off-by: Xin Ouyang <Xin.Ouyang@windriver.com>
Signed-off-by: Dengke Du <dengke.du@windriver.com>
---
 meta-webserver/recipes-httpd/apache2/apache2_2.4.27.bb | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/meta-webserver/recipes-httpd/apache2/apache2_2.4.27.bb b/meta-webserver/recipes-httpd/apache2/apache2_2.4.27.bb
index c7e7b54..1880867 100644
--- a/meta-webserver/recipes-httpd/apache2/apache2_2.4.27.bb
+++ b/meta-webserver/recipes-httpd/apache2/apache2_2.4.27.bb
@@ -59,9 +59,13 @@ EXTRA_OECONF = "--enable-ssl \
     ac_cv_have_threadsafe_pollset=no"
 
 PACKAGECONFIG ?= "${@bb.utils.filter('DISTRO_FEATURES', 'selinux', d)}"
-PACKAGECONFIG[selinux] = "--enable-selinux,--disable-selinux,libselinux,libselinux"
+PACKAGECONFIG[selinux] = "--enable-selinux --enable-layout=Debian --prefix=${base_prefix}/,--disable-selinux,libselinux,libselinux"
 PACKAGECONFIG[openldap] = "--enable-ldap --enable-authnz-ldap,--disable-ldap --disable-authnz-ldap,openldap"
 
+do_configure_prepend() {
+        sed -i -e 's:$''{prefix}/usr/lib/cgi-bin:$''{libdir}/cgi-bin:g' ${S}/config.layout
+}
+
 do_install_append() {
     install -d ${D}/${sysconfdir}/init.d
     cat ${WORKDIR}/init | \
@@ -111,6 +115,7 @@ do_install_append_class-target() {
 
     sed -i -e 's,${STAGING_DIR_HOST},,g' \
            -e 's,".*/configure","configure",g' ${D}${datadir}/apache2/build/config.nice
+    rm -rf ${D}${localstatedir}/run
 }
 
 SYSROOT_PREPROCESS_FUNCS += "apache_sysroot_preprocess"
@@ -184,3 +189,6 @@ FILES_${PN}-dbg += "${libdir}/${BPN}/modules/.debug"
 RDEPENDS_${PN} += "openssl libgcc"
 RDEPENDS_${PN}-scripts += "perl ${PN}"
 RDEPENDS_${PN}-dev = "perl"
+
+FILES_${PN} += "${libdir}/cgi-bin"
+FILES_${PN} += "${datadir}/${BPN}/"
-- 
2.8.1


