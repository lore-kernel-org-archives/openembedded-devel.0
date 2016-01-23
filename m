Return-Path: <brunovern.a@gmail.com>
Received: from mail-wm0-f42.google.com (mail-wm0-f42.google.com [74.125.82.42])
	by mail.openembedded.org (Postfix) with ESMTP id 4984B76809
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 23 Jan 2016 21:31:39 +0000 (UTC)
Received: by mail-wm0-f42.google.com with SMTP id l65so23106576wmf.1
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 23 Jan 2016 13:31:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=086EQBXNZsxyX8fGb6pHLlswdtNA1ppnBAl0osO7mLk=;
	b=uzr8NYzJL9pycZfNlNQYITMbdSPFTrR6UdP2Hzh8Kmv+UsBBLiJh3KvNW3wTcBxhwK
	OPRXzMnNyhe2zSE3PTKtzZHWTFCMF2qX8zt7MvvdCbR60qMYbe9WMN0k4Tv9R8VceJgk
	uUWdeGuttqHv2Nqjbi5n7Sr1vqkK9BbkDFDtlWoOT36iSaaILRKlPpEQbK8ac+uzS5uM
	pLDZUXk3f6SRgSfIUa7NMw6G+H8l6OtFbyVGkoAtT6Vrrk2Ovfpqef+zxzKy+uuStDgl
	MrF3UsOQtGKBwObafIh+pw6Gg0RzpFTCAisZPJvim9FGqItho9nWoPpEww3aKeLVonWa
	C6fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=086EQBXNZsxyX8fGb6pHLlswdtNA1ppnBAl0osO7mLk=;
	b=Bg9iWMx1zKqwtlIjdVxEx6263pWpJ4U3nDfooeBltlnINktF29ozInGjo/Gu7B48dl
	K5seDMSBeVEFsh0mHSzGc5cvFDGk4oASlAhftJWyGNq59QaagEHBfqcryFC20PfSFKha
	6GxqZgYFqj8uAhurQReMEQeKsUbaSZ2AoKrLi/h0Scz0uAYsw/peOOjEQnlxI0J43HdE
	zqQj+iOy9RKu8HG5gqqOC7Itv8gOQd1MvjudAFZnq79cPizLUK4HhgbVdnvCxzRbqgU7
	JiRGyKANG8ft1SGYHMHglZn78VUz/Bkzgb/V72fhC1nNbEAauxhAybKZxU+VN5ZZhq72
	+wGQ==
X-Gm-Message-State: AG10YOQGcwsX4EDRmFfPMihSls8GZpg8lj4m/04RdPdsQQPJC3EBZZfmmnPpnOSD/DgWAQ==
X-Received: by 10.28.1.23 with SMTP id 23mr9762892wmb.37.1453584700274;
	Sat, 23 Jan 2016 13:31:40 -0800 (PST)
Received: from f21frk1432l.eur.gad.schneider-electric.com
	(89-92-135-108.hfc.dyn.abo.bbox.fr. [89.92.135.108])
	by smtp.gmail.com with ESMTPSA id
	xx3sm11869333wjc.32.2016.01.23.13.31.38
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 23 Jan 2016 13:31:38 -0800 (PST)
From: BrunoVernay <brunovern.a@gmail.com>
X-Google-Original-From: BrunoVernay <BrunoVern.a@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 23 Jan 2016 22:31:31 +0100
Message-Id: <1453584691-8550-1-git-send-email-BrunoVern.a@gmail.com>
X-Mailer: git-send-email 2.5.0
Subject: [meta-oe][PATCH] OpenLDAP modules
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
X-List-Received-Date: Sat, 23 Jan 2016 21:31:46 -0000

---
 .../recipes-support/openldap/openldap_2.4.42.bb    | 28 +++++++++++++++++++++-
 1 file changed, 27 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/openldap/openldap_2.4.42.bb b/meta-oe/recipes-support/openldap/openldap_2.4.42.bb
index 49fcb56..23586b7 100644
--- a/meta-oe/recipes-support/openldap/openldap_2.4.42.bb
+++ b/meta-oe/recipes-support/openldap/openldap_2.4.42.bb
@@ -148,6 +148,8 @@ PACKAGES += "${PN}-overlay-proxycache"
 # it was disabled for cross-compiling.
 CPPFLAGS_append = " -D_GNU_SOURCE -DURANDOM_DEVICE=\'/dev/urandom\'"
 
+LDFLAGS += "-pthread"
+
 do_configure() {
     cp ${STAGING_DATADIR_NATIVE}/libtool/build-aux/ltmain.sh ${S}/build
     rm -f ${S}/libtool
@@ -166,7 +168,7 @@ LEAD_SONAME = "libldap-${LDAP_VER}.so.*"
 PACKAGES += "${PN}-slapd ${PN}-slurpd ${PN}-bin"
 
 # Package contents - shift most standard contents to -bin
-FILES_${PN} = "${libdir}/lib*.so.* ${sysconfdir}/openldap/ldap.* ${localstatedir}/openldap-data"
+FILES_${PN} = "${libdir}/lib*.so.* ${sysconfdir}/openldap/ldap.* ${localstatedir}/${BPN}/data"
 FILES_${PN}-slapd = "${sysconfdir}/init.d ${libexecdir}/slapd ${sbindir} ${localstatedir}/run ${localstatedir}/volatile/run \
     ${sysconfdir}/openldap/slapd.* ${sysconfdir}/openldap/schema \
     ${sysconfdir}/openldap/DB_CONFIG.example ${systemd_unitdir}/system/*"
@@ -195,6 +197,18 @@ do_install_append() {
     install -d ${D}${systemd_unitdir}/system/
     install -m 0644 ${WORKDIR}/slapd.service ${D}${systemd_unitdir}/system/
     sed -i -e 's,@SBINDIR@,${sbindir},g' ${D}${systemd_unitdir}/system/*.service
+
+    # Uses mdm as the database
+    #  and localstatedir as data directory ...
+    sed -e 's/# modulepath/modulepath/' \
+        -e 's/# moduleload\s*back_bdb.*/moduleload    back_mdb/' \
+        -e 's/database\s*bdb/database        mdb/' \
+        -e 's%^directory\s*.*%directory   ${localstatedir}/${BPN}/data/%' \
+        -i ${D}${sysconfdir}/openldap/slapd.conf
+
+    mkdir -p ${D}${localstatedir}/${BPN}/data
+
+
 }
 
 INITSCRIPT_PACKAGES = "${PN}-slapd"
@@ -206,8 +220,20 @@ SYSTEMD_AUTO_ENABLE_${PN}-slapd ?= "disable"
 
 PACKAGES_DYNAMIC += "^${PN}-backends.* ^${PN}-backend-.*"
 
+# The modules require their .so to be dynamicaly loaded
+INSANE_SKIP_${PN}-backend-dnssrv  += "dev-so"
+INSANE_SKIP_${PN}-backend-ldap    += "dev-so"
+INSANE_SKIP_${PN}-backend-meta    += "dev-so"
+INSANE_SKIP_${PN}-backend-mdb     += "dev-so"
+INSANE_SKIP_${PN}-backend-monitor += "dev-so"
+INSANE_SKIP_${PN}-backend-null    += "dev-so"
+INSANE_SKIP_${PN}-backend-passwd  += "dev-so"
+INSANE_SKIP_${PN}-backend-shell   += "dev-so"
+
+
 python populate_packages_prepend () {
     backend_dir    = d.expand('${libexecdir}/openldap')
+    do_split_packages(d, backend_dir, 'back_([a-z]*)\.so$', 'openldap-backend-%s', 'OpenLDAP %s backend', prepend=True, extra_depends='', allow_links=True)
     do_split_packages(d, backend_dir, 'back_([a-z]*)\-.*\.so\..*$', 'openldap-backend-%s', 'OpenLDAP %s backend', extra_depends='', allow_links=True)
 
     metapkg = "${PN}-backends"
-- 
2.5.0


