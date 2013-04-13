Received: from mail-ea0-f178.google.com ([209.85.215.178])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UR0ne-0007Vz-Fy
	for openembedded-devel@lists.openembedded.org;
	Sat, 13 Apr 2013 15:47:30 +0200
Received: by mail-ea0-f178.google.com with SMTP id o10so1629722eaj.23
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 13 Apr 2013 06:30:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=jcPv1oKV8NVS8EwXAKKF/Ej9BweM+sCRejUVUWaEkoQ=;
	b=cKUQVzkRM3GJEBdNr8ybr0vQT1BihsO6frpIsEWw58AH8f4uT2XL/P6o/vuzKue90T
	m1UU7LJwQ+G8AHHNUe+1AJO+ialIVO+rl16ipYp6u5YvWTb9aoe3iNBsn5zeHCmImdXE
	ntVSp/Aaq2imR8M618/VfR/2f8tsqvKrXNwdeSbsTaCEfWXZEzQM+s3CRLgMadjQcF7F
	vZl2XlcrejqRXMCDvq8RyWZk/Z646e0g+/c5TPSZMK2GEkkyRFWx+EhfdjK52VQqbrCy
	RwElibHFsCmp1PLJ180B0m3srJySohfmUy5w6SNxOVDI69j+ad1+CAkIeARNCp6RVPFE
	7vcA==
X-Received: by 10.14.218.66 with SMTP id j42mr39219082eep.46.1365859800841;
	Sat, 13 Apr 2013 06:30:00 -0700 (PDT)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id cd3sm16463556eeb.6.2013.04.13.06.30.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 13 Apr 2013 06:30:00 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 13 Apr 2013 15:29:26 +0200
Message-Id: <1365859790-20947-9-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.1.5
In-Reply-To: <1365859790-20947-1-git-send-email-Martin.Jansa@gmail.com>
References: <1365859790-20947-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-systemd][PATCH 09/33] autofs: move systemd support from meta-systemd back to meta-networking
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
X-List-Received-Date: Sat, 13 Apr 2013 13:47:46 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-networking/recipes-daemons/autofs/autofs_5.0.7.bb           | 9 +++++++--
 .../meta-networking/recipes-daemons/autofs/autofs_5.0.7.bbappend | 8 --------
 2 files changed, 7 insertions(+), 10 deletions(-)
 delete mode 100644 meta-systemd/meta-networking/recipes-daemons/autofs/autofs_5.0.7.bbappend

diff --git a/meta-networking/recipes-daemons/autofs/autofs_5.0.7.bb b/meta-networking/recipes-daemons/autofs/autofs_5.0.7.bb
index 6751402..8db4378 100644
--- a/meta-networking/recipes-daemons/autofs/autofs_5.0.7.bb
+++ b/meta-networking/recipes-daemons/autofs/autofs_5.0.7.bb
@@ -3,11 +3,11 @@ SECTION = "base"
 LICENSE = "GPL-2.0"
 LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
 
-PR = "r3"
+PR = "r6"
 
 DEPENDS += "libtirpc flex-native bison-native"
 
-inherit autotools
+inherit autotools systemd
 
 SRC_URI = "${KERNELORG_MIRROR}/linux/daemons/autofs/v5/autofs-${PV}.tar.bz2 \
            file://autofs-5.0.7-fix-nobind-sun-escaped-map-entries.patch \
@@ -97,3 +97,8 @@ do_install_append () {
 }
 
 INSANE_SKIP_${PN} = "dev-so"
+
+RPROVIDES_${PN} += "${PN}-systemd"
+RREPLACES_${PN} += "${PN}-systemd"
+RCONFLICTS_${PN} += "${PN}-systemd"
+SYSTEMD_SERVICE_${PN} = "autofs.service"
diff --git a/meta-systemd/meta-networking/recipes-daemons/autofs/autofs_5.0.7.bbappend b/meta-systemd/meta-networking/recipes-daemons/autofs/autofs_5.0.7.bbappend
deleted file mode 100644
index 69ea5d3..0000000
--- a/meta-systemd/meta-networking/recipes-daemons/autofs/autofs_5.0.7.bbappend
+++ /dev/null
@@ -1,8 +0,0 @@
-inherit systemd
-
-PRINC := "${@int(PRINC) + 2}"
-
-RPROVIDES_${PN} += "${PN}-systemd"
-RREPLACES_${PN} += "${PN}-systemd"
-RCONFLICTS_${PN} += "${PN}-systemd"
-SYSTEMD_SERVICE_${PN} = "autofs.service"
-- 
1.8.1.5



