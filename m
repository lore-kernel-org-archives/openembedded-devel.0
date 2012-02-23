Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1S0Xdf-0004lJ-GM
	for openembedded-devel@lists.openembedded.org;
	Thu, 23 Feb 2012 13:19:11 +0100
Received: by mail-ey0-f175.google.com with SMTP id l10so506551eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Feb 2012 04:10:52 -0800 (PST)
Received-SPF: pass (google.com: domain of schnitzeltony@googlemail.com
	designates 10.213.16.199 as permitted sender)
	client-ip=10.213.16.199; 
Authentication-Results: mr.google.com; spf=pass (google.com: domain of
	schnitzeltony@googlemail.com designates 10.213.16.199 as
	permitted sender) smtp.mail=schnitzeltony@googlemail.com;
	dkim=pass header.i=schnitzeltony@googlemail.com
Received: from mr.google.com ([10.213.16.199])
	by 10.213.16.199 with SMTP id p7mr333392eba.141.1329999052544 (num_hops
	= 1); Thu, 23 Feb 2012 04:10:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=CDoCr/Kem1ANu87q6ylPo3eN32C7ovH1rBpABnF0Cos=;
	b=YA8gF+D1ZCkrqHr75dl9k8QdB4PaarbFrusj8h0FMwH3wnQSNkCWaJV5URLNIimhU0
	46Ihe7490hAJOQ1d5Nb+CqBDvsS3M7IuQdQ3dCNejH2WU5akp4I1BoXKb1WAKHNYqad3
	mtPxzMcy153DF3VvL2ppHM6A0cL+kHs1AJhj8=
Received: by 10.213.16.199 with SMTP id p7mr262667eba.141.1329999052452;
	Thu, 23 Feb 2012 04:10:52 -0800 (PST)
Received: from localhost.localdomain (ip-95-223-250-190.unitymediagroup.de.
	[95.223.250.190])
	by mx.google.com with ESMTPS id n52sm4739136eea.5.2012.02.23.04.10.51
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 23 Feb 2012 04:10:51 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 23 Feb 2012 13:10:35 +0100
Message-Id: <1329999054-23112-5-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <1329999054-23112-1-git-send-email-schnitzeltony@googlemail.com>
References: <1329999054-23112-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-oe V3 04/23] systemd.bbclass: cosmetics
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
X-List-Received-Date: Thu, 23 Feb 2012 12:19:11 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
Acked-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta-oe/classes/systemd.bbclass |   15 +++++++--------
 1 files changed, 7 insertions(+), 8 deletions(-)

diff --git a/meta-oe/classes/systemd.bbclass b/meta-oe/classes/systemd.bbclass
index a99036c..6517357 100644
--- a/meta-oe/classes/systemd.bbclass
+++ b/meta-oe/classes/systemd.bbclass
@@ -72,7 +72,7 @@ python __anonymous() {
 }
 
 python populate_packages_prepend () {
-	def systemd_package(pkg):
+	def systemd_generate_package_scripts(pkg):
 		bb.debug(1, 'adding systemd calls to postinst/postrm for %s' % pkg)
 		localdata = bb.data.createCopy(d)
 		overrides = bb.data.getVar("OVERRIDES", localdata, 1)
@@ -96,10 +96,10 @@ python populate_packages_prepend () {
 		prerm += bb.data.getVar('systemd_prerm', localdata, 1)
 		bb.data.setVar('pkg_prerm_%s' % pkg, prerm, d)
 
-	        postrm = bb.data.getVar('pkg_postrm', localdata, 1)
-	        if not postrm:
-	                postrm = '#!/bin/sh\n'
-                postrm += bb.data.getVar('systemd_postrm', localdata, 1)
+		postrm = bb.data.getVar('pkg_postrm', localdata, 1)
+		if not postrm:
+			postrm = '#!/bin/sh\n'
+		postrm += bb.data.getVar('systemd_postrm', localdata, 1)
 		bb.data.setVar('pkg_postrm_%s' % pkg, postrm, d)
 
 		rdepends = explode_deps(bb.data.getVar('RDEPENDS_' + pkg, d, 0) or bb.data.getVar('RDEPENDS', d, 0) or "")
@@ -107,7 +107,6 @@ python populate_packages_prepend () {
 		bb.data.setVar('RDEPENDS_' + pkg, " " + " ".join(rdepends), d)
 
 
-	pkgs = bb.data.getVar('SYSTEMD_PACKAGES', d, 1)
-	for pkg in pkgs.split():
-		systemd_package(pkg)
+	for pkg_systemd in d.getVar('SYSTEMD_PACKAGES', 1).split():
+		systemd_generate_package_scripts(pkg_systemd)
 }
-- 
1.7.6.4



