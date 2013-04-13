Received: from mail-ee0-f52.google.com ([74.125.83.52])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UR0no-0007Wz-C4
	for openembedded-devel@lists.openembedded.org;
	Sat, 13 Apr 2013 15:47:43 +0200
Received: by mail-ee0-f52.google.com with SMTP id d17so1598918eek.39
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 13 Apr 2013 06:30:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=yvRpoazl+VRnpQ1Mzgsqnza+ipAmWz3lpEIb7Y/MwQ8=;
	b=qy5C3vwfyfwNkU1pOb15L/mhS64k/Gd4CyDCMhCoUctyJm+KXc4ZnBKxXTOafKvQjB
	hBYbYTXev2RItaX3TZOWHd/G/0avSIUr0aKIAHAQSUiT7zTLRGtevhwwBmDClnrwk1uj
	I73RgMSihjpkknrrisAt5JF3FfnFpxbRBkrNHFG9onXC9m4h/kE96As46n2I2ETGmORX
	pOl8pbrUzao8laiENmSUVd6kTuhh9TiJqIdWoH9X8pNNxE62FHeDHDXKkMxmS9Kdm3w+
	BVXJazN/15m1J5dzlFpzfJgWrtYSFrPeM2jLRR5yZkl41cpXkS1Ogs3hQ5ojg+gTxrwP
	J6Pw==
X-Received: by 10.15.32.142 with SMTP id a14mr39838295eev.22.1365859810739;
	Sat, 13 Apr 2013 06:30:10 -0700 (PDT)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id i53sm16473416eeu.5.2013.04.13.06.30.10
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 13 Apr 2013 06:30:10 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 13 Apr 2013 15:29:33 +0200
Message-Id: <1365859790-20947-16-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.1.5
In-Reply-To: <1365859790-20947-1-git-send-email-Martin.Jansa@gmail.com>
References: <1365859790-20947-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-systemd][PATCH 16/33] strongswan: move systemd support from meta-systemd back to meta-oe
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 13 Apr 2013 13:48:57 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-support/strongswan/strongswan_5.0.0.bb      | 13 ++++++++-----
 .../recipes-support/strongswan/strongswan_5.0.0.bbappend    | 10 ----------
 2 files changed, 8 insertions(+), 15 deletions(-)
 delete mode 100644 meta-systemd/meta-oe/recipes-support/strongswan/strongswan_5.0.0.bbappend

diff --git a/meta-oe/recipes-support/strongswan/strongswan_5.0.0.bb b/meta-oe/recipes-support/strongswan/strongswan_5.0.0.bb
index efacc8e..2713f5b 100644
--- a/meta-oe/recipes-support/strongswan/strongswan_5.0.0.bb
+++ b/meta-oe/recipes-support/strongswan/strongswan_5.0.0.bb
@@ -5,7 +5,7 @@ SECTION = "console/network"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 DEPENDS = "gmp openssl flex-native flex bison-native"
-PR = "r2"
+PR = "r5"
 
 SRC_URI = "http://download.strongswan.org/strongswan-${PV}.tar.bz2"
 SRC_URI[md5sum] = "c8b861305def7c0abae04f7bbefec212"
@@ -15,11 +15,9 @@ EXTRA_OECONF = "--disable-curl --disable-soup --disable-ldap \
 		--enable-gmp --disable-mysql --disable-sqlite \
 		--enable-openssl"
 
-SYSTEMD_UNITDIR ??= "no"
+EXTRA_OECONF += "${@base_contains('DISTRO_FEATURES', 'systemd', '--with-systemdsystemunitdir=${systemd_unitdir}/system/', '--without-systemdsystemunitdir', d)}"
 
-EXTRA_OECONF += "--with-systemdsystemunitdir=${SYSTEMD_UNITDIR}"
-
-inherit autotools
+inherit autotools systemd
 
 RRECOMMENDS_${PN} = "kernel-module-ipsec"
 
@@ -31,3 +29,8 @@ FILES_${PN}-dbg += "${libdir}/ipsec/.debug ${libdir}/ipsec/plugins/.debug ${libe
 FILES_${PN}-plugins += "${libdir}/ipsec/plugins/*"
 
 INSANE_SKIP_${PN}-plugins = "staticdev"
+
+RPROVIDES_${PN} += "${PN}-systemd"
+RREPLACES_${PN} += "${PN}-systemd"
+RCONFLICTS_${PN} += "${PN}-systemd"
+SYSTEMD_SERVICE_${PN} = "${PN}.service"
diff --git a/meta-systemd/meta-oe/recipes-support/strongswan/strongswan_5.0.0.bbappend b/meta-systemd/meta-oe/recipes-support/strongswan/strongswan_5.0.0.bbappend
deleted file mode 100644
index 0a474fe..0000000
--- a/meta-systemd/meta-oe/recipes-support/strongswan/strongswan_5.0.0.bbappend
+++ /dev/null
@@ -1,10 +0,0 @@
-inherit systemd
-
-PRINC := "${@int(PRINC) + 2}"
-
-SYSTEMD_UNITDIR = "${systemd_unitdir}/system"
-
-RPROVIDES_${PN} += "${PN}-systemd"
-RREPLACES_${PN} += "${PN}-systemd"
-RCONFLICTS_${PN} += "${PN}-systemd"
-SYSTEMD_SERVICE_${PN} = "${PN}.service"
-- 
1.8.1.5



