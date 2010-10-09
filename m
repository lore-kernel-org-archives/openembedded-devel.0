Received: from mail-ew0-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <koen.kooi@gmail.com>) id 1P4X7e-0000wQ-6x
	for openembedded-devel@lists.openembedded.org;
	Sat, 09 Oct 2010 12:57:57 +0200
Received: by ewy7 with SMTP id 7so999774ewy.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 09 Oct 2010 03:57:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=Ku3WWUnQj1QAJgFyOUVHneiEPWXDteo7C3CqLBfJzL4=;
	b=ozrMh7nMKPqWT65R5CrpSFvnmU67EI5bww0VqAxKki0T6+as2SwnzLWGDkBVkJ3l61
	t9U7Hteve1rxqbxjuTMic5afSn2y5KQfdHt1W2CkWscWFdQEaWDDsx1rjm45ROyin5Og
	ngnPCTI7YVbEP6h5VB5yOgQhVrvSzED4051FI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=fnyPyfMsSNbu+XLs4g3el0RwNkAB0DHeI13oF/RGqbE+7aeyh3ytWe+Vgt14bb/dSH
	EeUIQV75mNiWN3D8B+0BJT5gP48mbFbEAJUR/cAlCr1MUmuJ2FvJEjl5uDjV7UoZfvi5
	CvslCcFEcjxcTOKbvYJYqoIzossOzrVqp1G5g=
Received: by 10.213.6.207 with SMTP id a15mr561404eba.97.1286621845939;
	Sat, 09 Oct 2010 03:57:25 -0700 (PDT)
Received: from localhost (s55917625.adsl.wanadoo.nl [85.145.118.37])
	by mx.google.com with ESMTPS id v59sm7073206eeh.16.2010.10.09.03.57.24
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sat, 09 Oct 2010 03:57:25 -0700 (PDT)
From: Koen Kooi <koen.kooi@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  9 Oct 2010 12:57:06 +0200
Message-Id: <1286621826-9198-2-git-send-email-koen@openembedded.org>
X-Mailer: git-send-email 1.7.0
In-Reply-To: <1286621826-9198-1-git-send-email-koen@openembedded.org>
References: <1286621826-9198-1-git-send-email-koen@openembedded.org>
X-SA-Exim-Connect-IP: 209.85.215.47
X-SA-Exim-Mail-From: koen.kooi@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=unavailable version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Koen Kooi <koen@openembedded.org>
Subject: [PATCH 2/2] kernel bbclass: make 'kernel-modules' meta-package use RRECOMMENDS to please insane.bbclass
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
X-List-Received-Date: Sat, 09 Oct 2010 10:58:23 -0000

Signed-off-by: Koen Kooi <koen@openembedded.org>
---
 classes/kernel.bbclass |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/classes/kernel.bbclass b/classes/kernel.bbclass
index 5d5e93b..e677ddb 100644
--- a/classes/kernel.bbclass
+++ b/classes/kernel.bbclass
@@ -488,12 +488,12 @@ python populate_packages_prepend () {
 		for i in l:
 			pkg = module_pattern % legitimize_package_name(re.match(module_regex, os.path.basename(i)).group(1))
 			blacklist.append(pkg)
-	metapkg_rdepends = []
+	metapkg_rrecommends = []
 	packages = bb.data.getVar('PACKAGES', d, 1).split()
 	for pkg in packages[1:]:
-		if not pkg in blacklist and not pkg in metapkg_rdepends and not any(pkg.endswith(post) for post in depchains):
-			metapkg_rdepends.append(pkg)
-	bb.data.setVar('RDEPENDS_' + metapkg, ' '.join(metapkg_rdepends), d)
+		if not pkg in blacklist and not pkg in metapkg_rrecommends and not any(pkg.endswith(post) for post in depchains):
+			metapkg_rrecommends.append(pkg)
+	bb.data.setVar('RRECOMMENDS_' + metapkg, ' '.join(metapkg_rrecommends), d)
 	bb.data.setVar('DESCRIPTION_' + metapkg, 'Kernel modules meta package', d)
 	packages.append(metapkg)
 	bb.data.setVar('PACKAGES', ' '.join(packages), d)
-- 
1.6.6.1



