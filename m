Return-Path: <brunovern.a@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 10ADC7666E
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 31 Jan 2016 17:19:27 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id l66so5599207wml.2
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 31 Jan 2016 09:19:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=zd4SweHU1gE1wDE+Wn3S/3FXyXpHCvGFLTQf7HXbe3I=;
	b=c41b5ugfY4xuFSvmmQvihqTSJ4mT/3yXetT4TxgbP9qKuSI4UEvKtSEywpLAaqbc2/
	VxT3YYd3ExR8mTuSIO98w6px/oYtcUxVXX8jaCozv0V8JCPHYoKOQvyh/ptU3pBAwh93
	XmPj+wRDRJqMV2FLas3JonOYTCc3G2ZPXRucmyOiT9O84Mjg9k5yb26FykVnQJYsqGEs
	W+8+n6m0JwfXkre6QE1TNfJZGqcHLexHk2QhLqzWcrpJhbXGqU0muyOLIIX1cUn4VC7k
	cVHfWdEvPgoiyJmpCU13liP5cqf88ComUrMDtQ3kAVmyQw0g/KsqUmPUaxSgVCGVNMjT
	lSpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=zd4SweHU1gE1wDE+Wn3S/3FXyXpHCvGFLTQf7HXbe3I=;
	b=F2FzgeQulL4ie8bcMrys/Z4r4O+jlniI0OW7dVwcTNG4axj62iydH8anMAcylNlO2J
	oHrRj6hS9VCR1swJh1cAoB/iEiKkZHBSS+j9rDYVCjgFcivBFM1GWlOUHooVF0jaKXrI
	I7OfsCmQL+5fmdsCeYDPkQq747Q62dH+P3PMB9nrWcPBs7faC0PvJNRtyMx9lghtYKfI
	k0KcUWayjaJniGQlPqgsczUEcNuVtyeRiAJ3dhK7NZ91Y8Iyr+214aqX7G8Pvg6Cz7Ol
	f9VQuuZUUagP0StFEXcnjjdMhucJokwqhROvH0AuKpC2fj1QEA1xA+u93UbX2GAovCWe
	QEPw==
X-Gm-Message-State: AG10YOQ8s2zQc4ux9pJ73Attc/pFPttd9OCGfXBctLwckKN4n1B6jMrMtOhljFId1GIE4A==
X-Received: by 10.28.95.6 with SMTP id t6mr7024014wmb.59.1454260768141;
	Sun, 31 Jan 2016 09:19:28 -0800 (PST)
Received: from f21frk1432l.eur.gad.schneider-electric.com
	(89-92-135-108.hfc.dyn.abo.bbox.fr. [89.92.135.108])
	by smtp.gmail.com with ESMTPSA id
	x2sm25206348wjf.13.2016.01.31.09.19.27
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 31 Jan 2016 09:19:27 -0800 (PST)
From: BrunoVernay <brunovern.a@gmail.com>
X-Google-Original-From: BrunoVernay <BrunoVern.a@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 31 Jan 2016 18:19:03 +0100
Message-Id: <1454260743-18688-3-git-send-email-BrunoVern.a@gmail.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <1454260743-18688-1-git-send-email-BrunoVern.a@gmail.com>
References: <1454260743-18688-1-git-send-email-BrunoVern.a@gmail.com>
Subject: [PATCH 3/3] Creates a coherent and working default configuration
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
X-List-Received-Date: Sun, 31 Jan 2016 17:19:29 -0000

Signed-off-by: BrunoVernay <BrunoVern.a@gmail.com>
---
 meta-oe/recipes-support/openldap/openldap_2.4.42.bb | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/openldap/openldap_2.4.42.bb b/meta-oe/recipes-support/openldap/openldap_2.4.42.bb
index 5f71930..1c59db8 100644
--- a/meta-oe/recipes-support/openldap/openldap_2.4.42.bb
+++ b/meta-oe/recipes-support/openldap/openldap_2.4.42.bb
@@ -168,7 +168,7 @@ LEAD_SONAME = "libldap-${LDAP_VER}.so.*"
 PACKAGES += "${PN}-slapd ${PN}-slurpd ${PN}-bin"
 
 # Package contents - shift most standard contents to -bin
-FILES_${PN} = "${libdir}/lib*.so.* ${sysconfdir}/openldap/ldap.* ${localstatedir}/openldap-data"
+FILES_${PN} = "${libdir}/lib*.so.* ${sysconfdir}/openldap/ldap.* ${localstatedir}/${BPN}/data"
 FILES_${PN}-slapd = "${sysconfdir}/init.d ${libexecdir}/slapd ${sbindir} ${localstatedir}/run ${localstatedir}/volatile/run \
     ${sysconfdir}/openldap/slapd.* ${sysconfdir}/openldap/schema \
     ${sysconfdir}/openldap/DB_CONFIG.example ${systemd_unitdir}/system/*"
@@ -198,10 +198,15 @@ do_install_append() {
     install -m 0644 ${WORKDIR}/slapd.service ${D}${systemd_unitdir}/system/
     sed -i -e 's,@SBINDIR@,${sbindir},g' ${D}${systemd_unitdir}/system/*.service
     
-    # OpenLDAP will search for .so and .la if no extension is specified
+    # Uses mdm as the database
+    #  and localstatedir as data directory ...
     sed -e 's/# modulepath/modulepath/' \
         -e 's/# moduleload\s*back_bdb.*/moduleload    back_mdb/' \
+        -e 's/database\s*bdb/database        mdb/' \
+        -e 's%^directory\s*.*%directory   ${localstatedir}/${BPN}/data/%' \
         -i ${D}${sysconfdir}/openldap/slapd.conf
+
+    mkdir -p ${D}${localstatedir}/${BPN}/data
 }
 
 INITSCRIPT_PACKAGES = "${PN}-slapd"
-- 
2.5.0


