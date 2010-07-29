Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <chasemaupin03@gmail.com>) id 1OeSFb-0007Kp-Gw
	for openembedded-devel@lists.openembedded.org;
	Thu, 29 Jul 2010 14:31:01 +0200
Received: by yxi11 with SMTP id 11so97347yxi.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Jul 2010 05:29:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=VJ9vm3/ESLkBkRBvinh4A6KgL1YBie1AsOwqlvwi7Ic=;
	b=bMppGndIj2Gi0g4vg/wW5zQl3Pmv7mAbTYgtcLbNG2iFCs4NMrQmkdiV8eS3y+XD9l
	8ZSZlOqLWVIuzowTGh6NbFo0TUhOmf4NDSy+lZthZW/9HoqHt+CXtpS8kNMSglsEYTLS
	7+eDx5HNSALPl8Ya3QPSEdPHhDKnZdDEWljIA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=rlkti3dilon2IQlra0wkcChI/qZT5kAO2cPGfx+lHyLE6DuUQRVntRMzEknbsX0GWC
	oNJR2gFQ9wcVY8sP3PEF1/2hYvg2NuIvhze+Jx40Or0gioz90To0GAo07nj37+yVmNU5
	N9rvBx5DS6TsykKOIAD1JzGDR4pcOFkl5SL94=
Received: by 10.150.69.32 with SMTP id r32mr972304yba.107.1280406595226;
	Thu, 29 Jul 2010 05:29:55 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com [192.94.94.33])
	by mx.google.com with ESMTPS id e7sm7379938ybe.16.2010.07.29.05.29.54
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 29 Jul 2010 05:29:54 -0700 (PDT)
From: Chase Maupin <chasemaupin03@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 29 Jul 2010 07:26:17 -0500
Message-Id: <1280406377-23902-2-git-send-email-chase.maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1280406377-23902-1-git-send-email-chase.maupin@ti.com>
References: <1280406377-23902-1-git-send-email-chase.maupin@ti.com>
X-SA-Exim-Connect-IP: 209.85.213.175
X-SA-Exim-Mail-From: chasemaupin03@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=unavailable version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Chase Maupin <chase.maupin@ti.com>
Subject: [PATCH 2/2] x-load: add signGP to sourceipk
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
X-List-Received-Date: Thu, 29 Jul 2010 12:32:45 -0000

* When creating a source ipk for the x-load program copy the
  signGP binary as well as this is needed when rebuilding.
* Bump the PR for x-load-omap3pandora recipe.

Signed-off-by: Chase Maupin <chase.maupin@ti.com>
---
 recipes/x-load/x-load-omap3pandora_git.bb |    2 +-
 recipes/x-load/x-load.inc                 |    5 +++++
 2 files changed, 6 insertions(+), 1 deletions(-)

diff --git a/recipes/x-load/x-load-omap3pandora_git.bb b/recipes/x-load/x-load-omap3pandora_git.bb
index 05dfc20..e9e6e49 100644
--- a/recipes/x-load/x-load-omap3pandora_git.bb
+++ b/recipes/x-load/x-load-omap3pandora_git.bb
@@ -9,7 +9,7 @@ SRCREV = "b3646a83f9e67ec9a2de3182fd254557fd6ad9aa"
 PROVIDES = "x-load"
 
 PV = "1.42+${PR}+gitr${SRCREV}"
-PR ="r2"
+PR ="r3"
 PE = "1"
 
 SRC_URI = "git://git.openpandora.org/pandora-x-loader.git;branch=master;protocol=git"
diff --git a/recipes/x-load/x-load.inc b/recipes/x-load/x-load.inc
index 0699c01..e786ac1 100644
--- a/recipes/x-load/x-load.inc
+++ b/recipes/x-load/x-load.inc
@@ -38,6 +38,11 @@ do_install () {
 
 FILES_${PN} = "/boot"
 
+do_create_srcipk_prepend() {
+    mkdir -p ${WORKDIR}/sourceipk-tmp/psp/x-load/host-tools
+    cp `which signGP` ${WORKDIR}/sourceipk-tmp/psp/x-load/host-tools/
+}
+
 do_deploy () {
 	install -d ${DEPLOY_DIR_IMAGE}
 	install ${S}/x-load.bin.ift ${DEPLOY_DIR_IMAGE}/${XLOAD_IMAGE}
-- 
1.7.0.4



