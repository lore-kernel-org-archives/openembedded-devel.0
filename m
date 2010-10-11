Received: from mail-ew0-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <koen.kooi@gmail.com>) id 1P5DFk-0006xp-1a
	for openembedded-devel@lists.openembedded.org;
	Mon, 11 Oct 2010 09:57:35 +0200
Received: by ewy1 with SMTP id 1so362759ewy.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Oct 2010 00:56:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=lu8TAu5OBDrRH9zbkbsi9fuaprVe0e2RJ6WaBI/i9nU=;
	b=tkqOHTwup0FgiOoXiZD2Uprtuzi+3X3uZ9iXHKPw98Bk/zYrvOKnJALICoO68jZbBM
	knyPSZ0REHCXqB6LupLliFRm56DsU0QguqOR5yxTpmQxwQ+8CI1jiC+gby9yqaOarHkk
	biSbAg9zs0S0EjnK6/0i2stlg5t0InDpgfj6c=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=u1Tvf1Ew6WqCsTWowZoB/huq3NSVeRSGH0pxf7ChnGTZSr8JkbA9KRcV+9rsq4Wb0q
	gno3CVs0C539LO7EOgRO3BVBOfO0Z1O/L16jidjtihuishH/qR91Su//kndk+Mbm0W/L
	6ydiKlc/4upCk3Qjgu8XNQpt9NneYv74EV4mM=
Received: by 10.14.47.79 with SMTP id s55mr3155129eeb.47.1286783796558;
	Mon, 11 Oct 2010 00:56:36 -0700 (PDT)
Received: from localhost (s55917625.adsl.wanadoo.nl [85.145.118.37])
	by mx.google.com with ESMTPS id p53sm3017831eeh.7.2010.10.11.00.56.13
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 11 Oct 2010 00:56:13 -0700 (PDT)
From: Koen Kooi <koen.kooi@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 11 Oct 2010 09:55:54 +0200
Message-Id: <1286783755-19145-2-git-send-email-koen@openembedded.org>
X-Mailer: git-send-email 1.7.0
In-Reply-To: <1286783755-19145-1-git-send-email-koen@openembedded.org>
References: <1286783755-19145-1-git-send-email-koen@openembedded.org>
X-SA-Exim-Connect-IP: 209.85.215.47
X-SA-Exim-Mail-From: koen.kooi@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Koen Kooi <koen@openembedded.org>
Subject: [PATCHv3 2/3] kernel bbclass: make 'kernel-modules' meta-package use RRECOMMENDS to please insane.bbclass
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
X-List-Received-Date: Mon, 11 Oct 2010 07:58:12 -0000

Signed-off-by: Koen Kooi <koen@openembedded.org>
---
 classes/kernel.bbclass |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/classes/kernel.bbclass b/classes/kernel.bbclass
index 83e3f44..7039d27 100644
--- a/classes/kernel.bbclass
+++ b/classes/kernel.bbclass
@@ -489,12 +489,12 @@ python populate_packages_prepend () {
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



