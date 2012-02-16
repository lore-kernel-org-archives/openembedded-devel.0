Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1Rxqlv-00063w-6C
	for openembedded-devel@lists.openembedded.org;
	Thu, 16 Feb 2012 03:08:35 +0100
Received: by eekd41 with SMTP id d41so504564eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Feb 2012 18:00:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=HJQ2RVQRagCAMCo6w53doGPF3/dZDZGFu77PfXFpYi4=;
	b=Ld7BgzTpwNAI+nP2rUVPRZ2m6oF5B2F0MXWDWz6o0UbnMGs1ONN3e8+GdYTU6ZqNni
	fEs6JoUBhzxVGBxJDRCKg4aMq+9eHwhpBk3PwkacHlMQPviLWN/99lyMfQ2otFYDwi7W
	NWZMTmhFt5CFwgnIw5tpR5xeqchuTZFESO1Kk=
Received: by 10.14.39.148 with SMTP id d20mr331940eeb.90.1329357622940;
	Wed, 15 Feb 2012 18:00:22 -0800 (PST)
Received: from localhost.localdomain (p5B0A2E3F.dip.t-dialin.net.
	[91.10.46.63])
	by mx.google.com with ESMTPS id n58sm17552669een.10.2012.02.15.18.00.22
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 15 Feb 2012 18:00:22 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 16 Feb 2012 03:02:57 +0100
Message-Id: <1329357796-27398-4-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1329357796-27398-1-git-send-email-schnitzeltony@googlemail.com>
References: <1329357796-27398-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-oe][v2] 03/22] systemd.bbclass: cosmetics
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
X-List-Received-Date: Thu, 16 Feb 2012 02:08:35 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

V1 -> V2: rename systemd_package to systemd_generate_package_scripts

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-oe/classes/systemd.bbclass |   15 +++++++--------
 1 files changed, 7 insertions(+), 8 deletions(-)

diff --git a/meta-oe/classes/systemd.bbclass b/meta-oe/classes/systemd.bbclass
index 1dcf27e..45f3e7f 100644
--- a/meta-oe/classes/systemd.bbclass
+++ b/meta-oe/classes/systemd.bbclass
@@ -70,7 +70,7 @@ python __anonymous() {
 }
 
 python populate_packages_prepend () {
-	def systemd_package(pkg):
+	def systemd_generate_package_scripts(pkg):
 		bb.debug(1, 'adding systemd calls to postinst/postrm for %s' % pkg)
 		localdata = bb.data.createCopy(d)
 		overrides = bb.data.getVar("OVERRIDES", localdata, 1)
@@ -94,10 +94,10 @@ python populate_packages_prepend () {
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
@@ -105,7 +105,6 @@ python populate_packages_prepend () {
 		bb.data.setVar('RDEPENDS_' + pkg, " " + " ".join(rdepends), d)
 
 
-	pkgs = bb.data.getVar('SYSTEMD_PACKAGES', d, 1)
-	for pkg in pkgs.split():
-		systemd_package(pkg)
+	for pkg_systemd in d.getVar('SYSTEMD_PACKAGES', 1).split():
+		systemd_generate_package_scripts(pkg_systemd)
 }
-- 
1.7.4.4



