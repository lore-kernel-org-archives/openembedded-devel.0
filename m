Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1Rw2L7-0002Ga-Nh
	for openembedded-devel@lists.openembedded.org;
	Sat, 11 Feb 2012 03:05:30 +0100
Received: by eaal10 with SMTP id l10so900144eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 Feb 2012 17:57:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=oEFEWKYp4soo4KEbfBu+qhZ2fAQqdmTCUoJT+X+fiXo=;
	b=c7Sv32ZgcQHNeOgu4TNBBudYmNxYqD3axgvHeC87A4+XvTsDU7ps09Tig02Coe7FxH
	udDOCVfds0If+fTjl/lXZgDhatwQI0du3eQiOtklmqytIrrxwvlp7Q2Eo4Hd80Y66PC7
	8YpRPbP80w1rFAtaj/vA1YlZtchGajZUX+ebU=
Received: by 10.213.13.84 with SMTP id b20mr1435974eba.76.1328925435270;
	Fri, 10 Feb 2012 17:57:15 -0800 (PST)
Received: from localhost.localdomain (p5B0A16A6.dip.t-dialin.net.
	[91.10.22.166])
	by mx.google.com with ESMTPS id n17sm29065006eei.3.2012.02.10.17.57.14
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 10 Feb 2012 17:57:14 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 11 Feb 2012 02:59:59 +0100
Message-Id: <1328925603-2967-3-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1328925603-2967-1-git-send-email-schnitzeltony@googlemail.com>
References: <1328925603-2967-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-oe 3/7] systemd.bbclass: cosmetics
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
X-List-Received-Date: Sat, 11 Feb 2012 02:05:32 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-oe/classes/systemd.bbclass |   15 +++++++--------
 1 files changed, 7 insertions(+), 8 deletions(-)

diff --git a/meta-oe/classes/systemd.bbclass b/meta-oe/classes/systemd.bbclass
index bc83908..7ec4ca4 100644
--- a/meta-oe/classes/systemd.bbclass
+++ b/meta-oe/classes/systemd.bbclass
@@ -66,7 +66,7 @@ python __anonymous() {
 }
 
 python populate_packages_prepend () {
-	def systemd_package(pkg):
+	def systemd_prepost_instrm(pkg):
 		bb.debug(1, 'adding systemd calls to postinst/postrm for %s' % pkg)
 		localdata = bb.data.createCopy(d)
 		overrides = bb.data.getVar("OVERRIDES", localdata, 1)
@@ -90,10 +90,10 @@ python populate_packages_prepend () {
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
@@ -101,7 +101,6 @@ python populate_packages_prepend () {
 		bb.data.setVar('RDEPENDS_' + pkg, " " + " ".join(rdepends), d)
 
 
-	pkgs = bb.data.getVar('SYSTEMD_PACKAGES', d, 1)
-	for pkg in pkgs.split():
-		systemd_package(pkg)
+	for pkg_systemd in d.getVar('SYSTEMD_PACKAGES', 1).split():
+		systemd_prepost_instrm(pkg_systemd)
 }
-- 
1.7.4.4



