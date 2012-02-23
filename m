Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1S0Xdo-0004lM-MR
	for openembedded-devel@lists.openembedded.org;
	Thu, 23 Feb 2012 13:19:20 +0100
Received: by mail-ee0-f47.google.com with SMTP id d41so492439eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Feb 2012 04:11:01 -0800 (PST)
Received-SPF: pass (google.com: domain of schnitzeltony@googlemail.com
	designates 10.14.37.203 as permitted sender)
	client-ip=10.14.37.203; 
Authentication-Results: mr.google.com; spf=pass (google.com: domain of
	schnitzeltony@googlemail.com designates 10.14.37.203 as
	permitted sender) smtp.mail=schnitzeltony@googlemail.com;
	dkim=pass header.i=schnitzeltony@googlemail.com
Received: from mr.google.com ([10.14.37.203])
	by 10.14.37.203 with SMTP id y51mr718138eea.61.1329999061734 (num_hops
	= 1); Thu, 23 Feb 2012 04:11:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=3/RnrzipsZBFDuO3bDc3ukcMHZRQ6KuLr5ph6vNVujk=;
	b=JWYJuq0auR3egfdC6W8iJ2UZnAymVT/qFsOqNc048b11RAUq9pd+iUz1FrTdp0ZXoT
	/aFogzvoSSDQX/WT6DH5vwZHa3h7dziVx/xVB9Ac1/aDwZH++Fo+o+oH9rACYetRBCxu
	0zKoCA6VInvkCwlA6kn6wTWfgS1jIAcbZ+SlE=
Received: by 10.14.37.203 with SMTP id y51mr568211eea.61.1329999061638;
	Thu, 23 Feb 2012 04:11:01 -0800 (PST)
Received: from localhost.localdomain (ip-95-223-250-190.unitymediagroup.de.
	[95.223.250.190])
	by mx.google.com with ESMTPS id n52sm4739136eea.5.2012.02.23.04.11.00
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 23 Feb 2012 04:11:01 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 23 Feb 2012 13:10:45 +0100
Message-Id: <1329999054-23112-15-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <1329999054-23112-1-git-send-email-schnitzeltony@googlemail.com>
References: <1329999054-23112-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-oe V3 14/23] cronie: remove unneeded systemd code
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
X-List-Received-Date: Thu, 23 Feb 2012 12:19:20 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
Acked-by: Otavio Salvador <otavio@ossystems.com.br>
---
 .../recipes-extended/cronie/cronie_1.4.8.bbappend  |   12 +-----------
 1 files changed, 1 insertions(+), 11 deletions(-)

diff --git a/meta-oe/recipes-extended/cronie/cronie_1.4.8.bbappend b/meta-oe/recipes-extended/cronie/cronie_1.4.8.bbappend
index e0b9fb9..5aedb21 100644
--- a/meta-oe/recipes-extended/cronie/cronie_1.4.8.bbappend
+++ b/meta-oe/recipes-extended/cronie/cronie_1.4.8.bbappend
@@ -1,7 +1,7 @@
 # look for files in the layer first
 FILESEXTRAPATHS := "${THISDIR}/${PN}"
 
-PRINC = "1"
+PRINC = "2"
 
 inherit systemd
 
@@ -9,13 +9,3 @@ SYSTEMD_PACKAGES = "${PN}-systemd"
 SYSTEMD_SERVICE_${PN}-systemd = "crond.service"
 
 SRC_URI += "file://crond.service"
-
-do_install_append() {
-    install -d ${D}${base_libdir}/systemd/system
-    install -m 644 ${WORKDIR}/crond.service ${D}${base_libdir}/systemd/system
-}
-
-PACKAGES =+ "${PN}-systemd"
-
-FILES_${PN}-systemd += "${base_libdir}/systemd"
-RDEPENDS_${PN}-systemd = "${PN}"
-- 
1.7.6.4



