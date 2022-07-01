Return-Path: <jpuhlman@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D24FC433EF
	for <webhook@archiver.kernel.org>; Fri,  1 Jul 2022 18:53:01 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com
 [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web08.42162.1656701569527893845
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 01 Jul 2022 11:52:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=jW4b+jjb;
 spf=pass (domain: mvista.com, ip: 209.85.210.182,
 mailfrom: jpuhlman@mvista.com)
Received: by mail-pf1-f182.google.com with SMTP id x138so3236908pfc.3
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 01 Jul 2022 11:52:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lCLuja4QUwfgP67TBYo5nyzdBN2b69pIfu7w8UG8rDU=;
        b=jW4b+jjbjmjsQlW2p70tvYPjhSL2K8SAau86zLc5GoXXlOHfTgxQlH4nM6p//f9l1x
         Q3Pg3o261qrFz6lYM6pKZ1KYV3gZmGSd6ox9RWxJVYiUUYkApu/dcORKZKkl6u+sL3da
         dMEisaRtyL8LgEWK+PrvvxRr8Co2Y3NViUS0U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lCLuja4QUwfgP67TBYo5nyzdBN2b69pIfu7w8UG8rDU=;
        b=D/VuUWYdsE/pKG6Z+TuObJyEvYYV4U5e/ovVHoIlhDZRhEAXLbUvhg9dXsnjg0qmB6
         7DOB6zZS0lH3/616K4sbn3YaiuUecaTdWFQTXRgR0kEFlhb1lECHR4fJbn0QgvfjgTlm
         oNNS0tAC6YYVG/qg2/uYWty2r2UQqxYTvDmad7lNrzg9Wtkcvykw6tGEgvK/OTsQY5BR
         dwlEaZH204t7Luodnu3VUiAqMHr/GQO7PM9LwvPB7h69oBkhOaeCmke8pOc7tXXBZmUY
         3YNgbIbKCL2p5Ktd8XP4paOEF33rzfhjrDtUZZ2EI3gB7kPYSgEo+sDOiGi81oAS4Fx7
         tLpA==
X-Gm-Message-State: AJIora+UncSaaqDrJ6+xehu2+bYeltEZ1Pb3HE83ib3veisWqGiwrCOn
	0+4WFbg+UEUEUVr4jrm/UJLhfM95VTzQuA==
X-Google-Smtp-Source: 
 AGRyM1sQqe2OJcJKDGOUnnh9ZsK1gVW3fgnWnK/JbeLw6UhGsmGBzOJcvk9ASO2dYJp37b0+M4yn4w==
X-Received: by 2002:a63:6a43:0:b0:411:4fd7:c381 with SMTP id
 f64-20020a636a43000000b004114fd7c381mr13530844pgc.46.1656701568570;
        Fri, 01 Jul 2022 11:52:48 -0700 (PDT)
Received: from brown (99-14-97-149.lightspeed.frokca.sbcglobal.net.
 [99.14.97.149])
        by smtp.gmail.com with ESMTPSA id
 f2-20020a170902ff0200b0016a02c55470sm12237981plj.50.2022.07.01.11.52.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Jul 2022 11:52:47 -0700 (PDT)
Received: by brown (sSMTP sendmail emulation); Fri, 01 Jul 2022 11:52:45 -0700
From: "Jeremy A. Puhlman" <jpuhlman@mvista.com>
To: openembedded-devel@lists.openembedded.org
Cc: "Jeremy A. Puhlman" <jpuhlman@mvista.com>
Subject: [meta-networking][master|kirkstone][PATCH] freeradius: mutlilib fixes
Date: Fri,  1 Jul 2022 11:52:44 -0700
Message-Id: <20220701185244.153634-1-jpuhlman@mvista.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 01 Jul 2022 18:53:01 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97673

Define raddbdir based on multilib
Add multilib headers and scripts for conflicting content
---
 .../freeradius/freeradius_3.0.21.bb           | 34 ++++++++++++-------
 1 file changed, 21 insertions(+), 13 deletions(-)

diff --git a/meta-networking/recipes-connectivity/freeradius/freeradius_3.0.21.bb b/meta-networking/recipes-connectivity/freeradius/freeradius_3.0.21.bb
index da7e60419..453e514b6 100644
--- a/meta-networking/recipes-connectivity/freeradius/freeradius_3.0.21.bb
+++ b/meta-networking/recipes-connectivity/freeradius/freeradius_3.0.21.bb
@@ -34,6 +34,8 @@ SRC_URI = "git://github.com/FreeRADIUS/freeradius-server.git;branch=v3.0.x;lfs=0
     file://check-openssl-cmds-in-script-bootstrap.patch \
 "
 
+raddbdir="${sysconfdir}/${MLPREFIX}raddb"
+
 SRCREV = "af428abda249b2279ba0582180985a9f6f4a144a"
 
 PARALLEL_MAKE = ""
@@ -48,6 +50,7 @@ EXTRA_OECONF = " --enable-strict-dependencies \
         --with-docdir=${docdir}/freeradius-${PV} \
         --with-openssl-includes=${STAGING_INCDIR} \
         --with-openssl-libraries=${STAGING_LIBDIR} \
+        --with-raddbdir=${raddbdir} \
         --without-rlm_ippool \
         --without-rlm_cache_memcached \
         --without-rlm_counter \
@@ -98,7 +101,9 @@ PACKAGECONFIG[openssl] = "--with-openssl, --without-openssl"
 PACKAGECONFIG[rlm-eap-fast] = "--with-rlm_eap_fast, --without-rlm_eap_fast"
 PACKAGECONFIG[rlm-eap-pwd] = "--with-rlm_eap_pwd, --without-rlm_eap_pwd"
 
-inherit useradd autotools-brokensep update-rc.d systemd
+inherit useradd autotools-brokensep update-rc.d systemd multilib_script multilib_header
+
+MULTILIB_SCRIPTS = "${PN}:${sbindir}/checkrad"
 
 # This is not a cpan or python based package, but it needs some definitions
 # from cpan-base and python3-dir bbclasses for building rlm_perl and rlm_python
@@ -141,7 +146,7 @@ do_install() {
     oe_runmake install R=${D} INSTALLSTRIP=""
 
     # remove unsupported config files
-    rm -f ${D}/${sysconfdir}/raddb/experimental.conf
+    rm -f ${D}/${raddbdir}/experimental.conf
 
     # remove scripts that required Perl(DBI)
     rm -rf ${D}/${bindir}/radsqlrelay
@@ -153,7 +158,7 @@ do_install() {
     rm -rf ${D}/${localstatedir}/log/
     install -m 0644 ${WORKDIR}/volatiles.58_radiusd  ${D}${sysconfdir}/default/volatiles/58_radiusd
 
-    chown -R radiusd:radiusd ${D}/${sysconfdir}/raddb/
+    chown -R radiusd:radiusd ${D}/${raddbdir}
     chown -R radiusd:radiusd ${D}/${localstatedir}/lib/radiusd
 
     # For systemd
@@ -169,6 +174,9 @@ do_install() {
         install -d ${D}${sysconfdir}/tmpfiles.d/
         install -m 0644 ${WORKDIR}/radiusd-volatiles.conf ${D}${sysconfdir}/tmpfiles.d/radiusd.conf
     fi
+    oe_multilib_header freeradius/autoconf.h 
+    oe_multilib_header freeradius/missing.h
+    oe_multilib_header freeradius/radpaths.h
 }
 
 # This is only needed when we install/update on a running target.
@@ -183,7 +191,7 @@ pkg_postinst:${PN} () {
         fi
 
         # Fix ownership for /etc/raddb/*, /var/lib/radiusd
-        chown -R radiusd:radiusd ${sysconfdir}/raddb
+        chown -R radiusd:radiusd ${raddbdir}
         chown -R radiusd:radiusd ${localstatedir}/lib/radiusd
     fi
 }
@@ -204,30 +212,30 @@ PACKAGES =+ "${PN}-utils ${PN}-ldap ${PN}-krb5 ${PN}-perl \
 FILES:${PN}-utils = "${bindir}/*"
 
 FILES:${PN}-ldap = "${libdir}/rlm_ldap.so* \
-    ${sysconfdir}/raddb/mods-available/ldap \
+    ${raddbdir}/mods-available/ldap \
 "
 
 FILES:${PN}-krb5 = "${libdir}/rlm_krb5.so* \
-    ${sysconfdir}/raddb/mods-available/krb5 \
+    ${raddbdir}/mods-available/krb5 \
 "
 
 FILES:${PN}-perl = "${libdir}/rlm_perl.so* \
-    ${sysconfdir}/raddb/mods-config/perl \
-    ${sysconfdir}/raddb/mods-available/perl \
+    ${raddbdir}/mods-config/perl \
+    ${raddbdir}/mods-available/perl \
 "
 
 FILES:${PN}-python = "${libdir}/rlm_python3.so* \
-    ${sysconfdir}/raddb/mods-config/python3 \
-    ${sysconfdir}/raddb/mods-available/python3 \
+    ${raddbdir}/mods-config/python3 \
+    ${raddbdir}/mods-available/python3 \
 "
 
 FILES:${PN}-mysql = "${libdir}/rlm_sql_mysql.so* \
-    ${sysconfdir}/raddb/mods-config/sql/*/mysql \
-    ${sysconfdir}/raddb/mods-available/sql \
+    ${raddbdir}/mods-config/sql/*/mysql \
+    ${raddbdir}/mods-available/sql \
 "
 
 FILES:${PN}-postgresql = "${libdir}/rlm_sql_postgresql.so* \
-    ${sysconfdir}/raddb/mods-config/sql/*/postgresql \
+    ${raddbdir}/mods-config/sql/*/postgresql \
 "
 
 FILES:${PN}-unixodbc = "${libdir}/rlm_sql_unixodbc.so*"
-- 
2.35.3


