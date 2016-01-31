Return-Path: <brunovern.a@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id DFB7D7666E
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 31 Jan 2016 17:19:26 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id p63so5602405wmp.1
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 31 Jan 2016 09:19:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=fC0aXBG+5D1uODEtsYH0JRTXOo/vWgjaB36DKtaTW3I=;
	b=vKuB2BBRzEndpGsHKvgs1RshhcyZBBT6WykU0/kCHCfbwagl4L98XAX/20tQ0KHG5C
	Ni6EaJCColAWLx8WF+xp8MVEG6Yt6Rzb61iSntU/KqeM0p8Rp9/Qa9CaDaq0RlcvPUAR
	jscdWvna9o0vDP6SejAdwesAXauW4LQAhjcW1dL5PEhRxOJJ0stIpI1EBb/1XQVJKc1K
	r5zSK/KK/Cy0W7n83MiPMeZ5HKayd58vjFlnJfUdIyfU2bo5jdVRDcb4eGOlGsRzMjJE
	rVyobdjNID2olr0taUQkDWhzm7c3kFzEbWQxLaEKNZxiWav5GPXW2c/vh38+M2H8QdIu
	B6Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=fC0aXBG+5D1uODEtsYH0JRTXOo/vWgjaB36DKtaTW3I=;
	b=Bqd03pfRasZgIT46PAkuxLAHB3WmQCqOBw6tHYO5hdPkNJzrf+zeHqxeIaJhODEWfD
	jE5c7UK++5cj/tAvQ9uHqTDczcZkXmGx4JRISguRQbCsqwOCTJe3+eunYVhQSUvqK6Hy
	zNSFdEUwEv3CIphJRmLo/dbLitu4zwdGOGFzuEukU+/bFW5q2ZzA+niqitoLXSO6CRLK
	uSabtVTgHXE0GYpvk3xFUOFBFl3hXFJAVWTwTTpcb1uJ0wyv5ETF/2Fbnyri25TIqR5e
	9W+TwGeE1LhebtKb1rpB4AqdWbOIB0P67o9gTEb+E7QJ+mD4yXBGil6VM8875U1ONR/4
	VzZQ==
X-Gm-Message-State: AG10YOS6CHZA+RBN4q1O4us/YVXJNf8cQcWMdqoBJclO+3jk2WTP/PKrHIT+5un/Xg/7mQ==
X-Received: by 10.194.103.131 with SMTP id fw3mr21366620wjb.55.1454260767232; 
	Sun, 31 Jan 2016 09:19:27 -0800 (PST)
Received: from f21frk1432l.eur.gad.schneider-electric.com
	(89-92-135-108.hfc.dyn.abo.bbox.fr. [89.92.135.108])
	by smtp.gmail.com with ESMTPSA id
	x2sm25206348wjf.13.2016.01.31.09.19.26
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 31 Jan 2016 09:19:26 -0800 (PST)
From: BrunoVernay <brunovern.a@gmail.com>
X-Google-Original-From: BrunoVernay <BrunoVern.a@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 31 Jan 2016 18:19:02 +0100
Message-Id: <1454260743-18688-2-git-send-email-BrunoVern.a@gmail.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <1454260743-18688-1-git-send-email-BrunoVern.a@gmail.com>
References: <1454260743-18688-1-git-send-email-BrunoVern.a@gmail.com>
Subject: [PATCH 2/3] Modules require .so libraries to be present
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
X-List-Received-Date: Sun, 31 Jan 2016 17:19:27 -0000

Signed-off-by: BrunoVernay <BrunoVern.a@gmail.com>
---
 meta-oe/recipes-support/openldap/openldap_2.4.42.bb | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/meta-oe/recipes-support/openldap/openldap_2.4.42.bb b/meta-oe/recipes-support/openldap/openldap_2.4.42.bb
index caca16b..5f71930 100644
--- a/meta-oe/recipes-support/openldap/openldap_2.4.42.bb
+++ b/meta-oe/recipes-support/openldap/openldap_2.4.42.bb
@@ -197,6 +197,11 @@ do_install_append() {
     install -d ${D}${systemd_unitdir}/system/
     install -m 0644 ${WORKDIR}/slapd.service ${D}${systemd_unitdir}/system/
     sed -i -e 's,@SBINDIR@,${sbindir},g' ${D}${systemd_unitdir}/system/*.service
+    
+    # OpenLDAP will search for .so and .la if no extension is specified
+    sed -e 's/# modulepath/modulepath/' \
+        -e 's/# moduleload\s*back_bdb.*/moduleload    back_mdb/' \
+        -i ${D}${sysconfdir}/openldap/slapd.conf
 }
 
 INITSCRIPT_PACKAGES = "${PN}-slapd"
@@ -208,8 +213,19 @@ SYSTEMD_AUTO_ENABLE_${PN}-slapd ?= "disable"
 
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
 python populate_packages_prepend () {
     backend_dir    = d.expand('${libexecdir}/openldap')
+    do_split_packages(d, backend_dir, 'back_([a-z]*)\.so$', 'openldap-backend-%s', 'OpenLDAP %s backend', prepend=True, extra_depends='', allow_links=True)
     do_split_packages(d, backend_dir, 'back_([a-z]*)\-.*\.so\..*$', 'openldap-backend-%s', 'OpenLDAP %s backend', extra_depends='', allow_links=True)
 
     metapkg = "${PN}-backends"
-- 
2.5.0


