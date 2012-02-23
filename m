Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1S0bBp-0004iV-CO
	for openembedded-devel@lists.openembedded.org;
	Thu, 23 Feb 2012 17:06:41 +0100
Received: by eekd41 with SMTP id d41so626258eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Feb 2012 07:58:20 -0800 (PST)
Received-SPF: pass (google.com: domain of martin.jansa@gmail.com designates
	10.14.99.1 as permitted sender) client-ip=10.14.99.1; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of martin.jansa@gmail.com
	designates 10.14.99.1 as permitted sender)
	smtp.mail=martin.jansa@gmail.com;
	dkim=pass header.i=martin.jansa@gmail.com
Received: from mr.google.com ([10.14.99.1])
	by 10.14.99.1 with SMTP id w1mr1241504eef.49.1330012700153 (num_hops =
	1); Thu, 23 Feb 2012 07:58:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=0vukM5ouaPMp0aTrx1a0QvKiq0t86Ogc91cSLo1NfoY=;
	b=dmMVIs4MXZds7sfmDFr2rD8A8hB5HQsgz625tihD3PiuZyEX/evI6dNnQLrQsRzgBr
	ouo5aFDEL3gP5D+ulxjnaho0dhYqbfRjIthTk3BYzt0jRdplXRW3RxKXWQvJwdkbq/8j
	TYd+VWcBc41qPpUZEdZIqVIqLu9lxOtTEGaow=
Received: by 10.14.99.1 with SMTP id w1mr979874eef.49.1330012700064;
	Thu, 23 Feb 2012 07:58:20 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id q49sm6503201eeh.1.2012.02.23.07.58.18
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 23 Feb 2012 07:58:19 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 23 Feb 2012 16:58:01 +0100
Message-Id: <bcb0cc65d599ffd9ad2c505838caf64d0c1a5bde.1330012507.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.4
In-Reply-To: <93f56c062e7a5103f15551808826f76c94779005.1330012507.git.Martin.Jansa@gmail.com>
References: <93f56c062e7a5103f15551808826f76c94779005.1330012507.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1330012507.git.Martin.Jansa@gmail.com>
References: <cover.1330012507.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 4/7] gateone: use systemd_unitdir variable
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
X-List-Received-Date: Thu, 23 Feb 2012 16:06:41 -0000

* maybe we should move systemd_unitdir definition outside systemd.bbclass
  because it's used in few more recipes which doesn't inherit systemd

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../recipes-connectivity/gateone/gateone_git.bb    |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-connectivity/gateone/gateone_git.bb b/meta-oe/recipes-connectivity/gateone/gateone_git.bb
index 4f9684c..aee88f3 100644
--- a/meta-oe/recipes-connectivity/gateone/gateone_git.bb
+++ b/meta-oe/recipes-connectivity/gateone/gateone_git.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "HTML5 (plugin-free) web-based terminal emulator and SSH client"
 LICENSE = "AGPLv3"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=07d5a2790569bd3e3b422b69ccd43bec"
 
-PR = "r15"
+PR = "r16"
 
 PV = "0.9"
 SRCREV = "a68444610efa2892842893dae828a28527e64a6e"
@@ -20,8 +20,8 @@ export prefix = "${localstatedir}/lib"
 do_install_append() {
 	install -d ${D}${localstatedir}/log/${BPN}
 
-	install -m 0755 -d ${D}${base_libdir}/systemd/system
-	install -m 0644 ${WORKDIR}/gateone.service ${D}${base_libdir}/systemd/system/
+	install -m 0755 -d ${D}${systemd_unitdir}/system
+	install -m 0644 ${WORKDIR}/gateone.service ${D}${systemd_unitdir}/system/
 
 	install -m 0755 -d ${D}${sysconfdir}/avahi/services/
 	install -m 0644 ${WORKDIR}/gateone-avahi.service ${D}${sysconfdir}/avahi/services/
-- 
1.7.8.4



