Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 4837D7F2DC
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Sep 2019 22:38:43 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x85Mcijk003300
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 5 Sep 2019 15:38:44 -0700 (PDT)
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.468.0; Thu, 5 Sep 2019 15:38:43 -0700
From: <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 6 Sep 2019 06:38:38 +0800
Message-ID: <20190905223839.33419-2-kai.kang@windriver.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190905223839.33419-1-kai.kang@windriver.com>
References: <20190905223839.33419-1-kai.kang@windriver.com>
MIME-Version: 1.0
Subject: [meta-webserver][Patch 1/2] apache2: fix multilib file conflicts
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
X-List-Received-Date: Thu, 05 Sep 2019 22:38:43 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

There are errors of apache2 about files conflicts when multilib enabled:

| Error: Transaction check error:
|   file /etc/apache2/extra/httpd-ssl.conf conflicts between attempted installs of lib32-apache2-2.4.41-r0.core2_32 and apache2-2.4.41-r0.core2_64
|   file /etc/apache2/httpd.conf conflicts between attempted installs of lib32-apache2-2.4.41-r0.core2_32 and apache2-2.4.41-r0.core2_64
|   file /usr/sbin/envvars conflicts between attempted installs of lib32-apache2-2.4.41-r0.core2_32 and apache2-2.4.41-r0.core2_64
|   file /usr/sbin/envvars-std conflicts between attempted installs of lib32-apache2-2.4.41-r0.core2_32 and apache2-2.4.41-r0.core2_64

It makes libexecdir point to ${libdir}. Reset to ${libexecdir} which could
eliminate file conflicts of the conf files. And remove /usr/sbin/envvars and
/usr/sbin/envvars-std which only used by apachectl. They only add standard
library path ${libdir} to LD_LIBRARY_PATH, so remove them to avoid multilib
file conflicts.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta-webserver/recipes-httpd/apache2/apache2_2.4.41.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-webserver/recipes-httpd/apache2/apache2_2.4.41.bb b/meta-webserver/recipes-httpd/apache2/apache2_2.4.41.bb
index a8da7e227..a34734c20 100644
--- a/meta-webserver/recipes-httpd/apache2/apache2_2.4.41.bb
+++ b/meta-webserver/recipes-httpd/apache2/apache2_2.4.41.bb
@@ -53,7 +53,7 @@ EXTRA_OECONF_class-target = "\
     --sysconfdir=${sysconfdir}/${BPN} \
     --datadir=${datadir}/${BPN} \
     --libdir=${libdir} \
-    --libexecdir=${libdir}/${BPN}/modules \
+    --libexecdir=${libexecdir}/${BPN}/modules \
     --localstatedir=${localstatedir} \
     --enable-ssl \
     --with-dbm=sdbm \
@@ -78,7 +78,7 @@ EXTRA_OECONF_class-native = "\
     "
 
 do_configure_prepend() {
-    sed -i -e 's:$''{prefix}/usr/lib/cgi-bin:$''{libdir}/cgi-bin:g' ${S}/config.layout
+    sed -i -e 's:$''{prefix}/usr/lib/cgi-bin:$''{libexecdir}/cgi-bin:g' ${S}/config.layout
 }
 
 do_install_append_class-target() {
@@ -139,7 +139,7 @@ do_install_append_class-target() {
         install -m 0644 ${WORKDIR}/volatiles.04_apache2 ${D}${sysconfdir}/default/volatiles/04_apache2
     fi
 
-    rm -rf ${D}${localstatedir}
+    rm -rf ${D}${localstatedir} ${D}${sbindir}/envvars*
     chown -R root:root ${D}
 }
 
-- 
2.17.1


