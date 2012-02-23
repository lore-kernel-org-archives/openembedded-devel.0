Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1S0Xdl-0004lK-R7
	for openembedded-devel@lists.openembedded.org;
	Thu, 23 Feb 2012 13:19:17 +0100
Received: by mail-ey0-f175.google.com with SMTP id l10so506553eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Feb 2012 04:10:58 -0800 (PST)
Received-SPF: pass (google.com: domain of schnitzeltony@googlemail.com
	designates 10.14.124.69 as permitted sender)
	client-ip=10.14.124.69; 
Authentication-Results: mr.google.com; spf=pass (google.com: domain of
	schnitzeltony@googlemail.com designates 10.14.124.69 as
	permitted sender) smtp.mail=schnitzeltony@googlemail.com;
	dkim=pass header.i=schnitzeltony@googlemail.com
Received: from mr.google.com ([10.14.124.69])
	by 10.14.124.69 with SMTP id w45mr764150eeh.6.1329999058878 (num_hops =
	1); Thu, 23 Feb 2012 04:10:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=3bSC/kB5+6JSL6K0wh6P1DB/qW1LHYthTMyuInMnkgQ=;
	b=fIuTDMcNG/7rxazTGgCZ9Aw0sDqxGzr7kohi6lVrST+NZgT/t3FV3kd8YhVX4SkLjt
	auf+d3J4ZdZ3+WuoDpvJ4gPw9jpQ1FecKeekaUn3nuHr86BurzWs1CPiU1tqMbvlIxmE
	kl+Lp6Dd0Hrpjp8sQzktGwptEUlK6utDHibQM=
Received: by 10.14.124.69 with SMTP id w45mr604120eeh.6.1329999058767;
	Thu, 23 Feb 2012 04:10:58 -0800 (PST)
Received: from localhost.localdomain (ip-95-223-250-190.unitymediagroup.de.
	[95.223.250.190])
	by mx.google.com with ESMTPS id n52sm4739136eea.5.2012.02.23.04.10.57
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 23 Feb 2012 04:10:58 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 23 Feb 2012 13:10:42 +0100
Message-Id: <1329999054-23112-12-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <1329999054-23112-1-git-send-email-schnitzeltony@googlemail.com>
References: <1329999054-23112-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-oe V3 11/23] dropbear: remove unneeded systemd code / use ${systemd_unitdir}
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
X-List-Received-Date: Thu, 23 Feb 2012 12:19:18 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../dropbear/dropbear_2011.54.bbappend             |   13 ++-----------
 1 files changed, 2 insertions(+), 11 deletions(-)

diff --git a/meta-oe/recipes-core/dropbear/dropbear_2011.54.bbappend b/meta-oe/recipes-core/dropbear/dropbear_2011.54.bbappend
index 899e1fc..fc5d047 100644
--- a/meta-oe/recipes-core/dropbear/dropbear_2011.54.bbappend
+++ b/meta-oe/recipes-core/dropbear/dropbear_2011.54.bbappend
@@ -1,6 +1,6 @@
 inherit systemd
 
-PRINC := "${@int(PRINC) + 1}"
+PRINC := "${@int(PRINC) + 2}"
 
 # look for files in the layer first
 FILESEXTRAPATHS := "${THISDIR}/${PN}"
@@ -13,14 +13,5 @@ SYSTEMD_PACKAGES = "${PN}-systemd"
 SYSTEMD_SERVICE_${PN}-systemd = "dropbear.socket"
 
 do_install_append() {
-	install -d ${D}${base_libdir}/systemd/system
-	install -m 0644 ${WORKDIR}/dropbearkey.service ${D}${base_libdir}/systemd/system/
-	install -m 0644 ${WORKDIR}/dropbear@.service ${D}${base_libdir}/systemd/system/
-	install -m 0644 ${WORKDIR}/dropbear.socket ${D}${base_libdir}/systemd/system/
-	ln -sf /dev/null ${D}${base_libdir}/systemd/system/dropbear.service
+	ln -sf /dev/null ${D}${systemd_unitdir}/system/dropbear.service
 }
-
-PACKAGES += "${PN}-systemd"
-
-RDEPENDS_${PN}-systemd += "dropbear"
-FILES_${PN}-systemd = "${base_libdir}/systemd"
-- 
1.7.6.4



