Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TjHhR-0006ug-Et
	for openembedded-devel@lists.openembedded.org;
	Thu, 13 Dec 2012 23:56:17 +0100
Received: by mail-ee0-f47.google.com with SMTP id e51so1522341eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Dec 2012 14:41:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=xtKyBKOMCHg3QmzwOkJEK5FYJ2k6GtrIJqKjRDe3t78=;
	b=ejtRJIP9G+CdF79IT+cnjFr2slI4ThZ1JLMDcikQBLxl20/B2HRa/IKBuP2Iy/KJ/p
	jspKKfwfMd+L44Be+5SQv0bnVcb+KtLtAPacCGjYGAMrnH49xSSp5QOdUNS/8fQb8aDG
	SpV5Nr6UD/CAUYk0imcevY9F5H5Imtzm4V+ohTEsZkzJD8Ki1SrroCz9Rs01yX5IHFGg
	Ss6eeNxim47hCc+4yHy5u/rCl2nLy1sk0LqGRfP5SX8bkuUl7YxUiNmu2IHOt90xfGYD
	gflvozZzyCWUtAMnEcy/wnEpHSQnzIiTpyvxnnzg/sdbUcH3tBA7+vVZhszR44tf0G4/
	hBhA==
Received: by 10.14.178.196 with SMTP id f44mr9282348eem.14.1355438502319;
	Thu, 13 Dec 2012 14:41:42 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id e2sm5677990eeo.8.2012.12.13.14.41.39
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 13 Dec 2012 14:41:41 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 13 Dec 2012 23:41:41 +0100
Message-Id: <48a62d1a72190420205c4d7e015c3df092ae66c8.1355438402.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.0.2
In-Reply-To: <cover.1355438401.git.Martin.Jansa@gmail.com>
References: <cover.1355438401.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1355438401.git.Martin.Jansa@gmail.com>
References: <cover.1355438401.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 01/11] strongswam: disable systemd support in meta-oe and reenable it in meta-systemd
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
X-List-Received-Date: Thu, 13 Dec 2012 22:56:17 -0000

* fixes:
strongswan-5.0.0: strongswan: Files/directories were installed but not shipped
  /lib
  /lib/systemd
  /lib/systemd/system
  /lib/systemd/system/strongswan.service

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-support/strongswan/strongswan_5.0.0.bb            | 6 +++++-
 .../meta-oe/recipes-support/strongswan/strongswan_5.0.0.bbappend  | 8 ++++++++
 2 files changed, 13 insertions(+), 1 deletion(-)
 create mode 100644 meta-systemd/meta-oe/recipes-support/strongswan/strongswan_5.0.0.bbappend

diff --git a/meta-oe/recipes-support/strongswan/strongswan_5.0.0.bb b/meta-oe/recipes-support/strongswan/strongswan_5.0.0.bb
index 52c8bec..efacc8e 100644
--- a/meta-oe/recipes-support/strongswan/strongswan_5.0.0.bb
+++ b/meta-oe/recipes-support/strongswan/strongswan_5.0.0.bb
@@ -5,7 +5,7 @@ SECTION = "console/network"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 DEPENDS = "gmp openssl flex-native flex bison-native"
-PR = "r1"
+PR = "r2"
 
 SRC_URI = "http://download.strongswan.org/strongswan-${PV}.tar.bz2"
 SRC_URI[md5sum] = "c8b861305def7c0abae04f7bbefec212"
@@ -15,6 +15,10 @@ EXTRA_OECONF = "--disable-curl --disable-soup --disable-ldap \
 		--enable-gmp --disable-mysql --disable-sqlite \
 		--enable-openssl"
 
+SYSTEMD_UNITDIR ??= "no"
+
+EXTRA_OECONF += "--with-systemdsystemunitdir=${SYSTEMD_UNITDIR}"
+
 inherit autotools
 
 RRECOMMENDS_${PN} = "kernel-module-ipsec"
diff --git a/meta-systemd/meta-oe/recipes-support/strongswan/strongswan_5.0.0.bbappend b/meta-systemd/meta-oe/recipes-support/strongswan/strongswan_5.0.0.bbappend
new file mode 100644
index 0000000..a60a109
--- /dev/null
+++ b/meta-systemd/meta-oe/recipes-support/strongswan/strongswan_5.0.0.bbappend
@@ -0,0 +1,8 @@
+inherit systemd
+
+PRINC := "${@int(PRINC) + 1}"
+
+SYSTEMD_UNITDIR = "${systemd_unitdir}/system"
+
+SYSTEMD_PACKAGES = "${PN}-systemd"
+SYSTEMD_SERVICE = "${PN}.service"
-- 
1.8.0.2



