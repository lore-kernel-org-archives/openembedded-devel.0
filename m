Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <chasemaupin03@gmail.com>) id 1P10oD-0005DS-7e
	for openembedded-devel@lists.openembedded.org;
	Wed, 29 Sep 2010 19:51:13 +0200
Received: by ywe9 with SMTP id 9so381815ywe.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Sep 2010 10:50:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=dWWhYPBHoEYvIfV+1JSZVxortx5tsIIFH2qzCd/ptXE=;
	b=AdvwBJ8Md3Jxp0Fs4FtDD4dy+jauF1sPFTMMAo5GN1eGciqjNxhAr6Kv48uzNMD6Sq
	ldnCn43NEIyPyKFsEgouEF63ECYx8Z3Kq2cMyHobXbKRCZOPXm/OoWODibPcVkGsxnzQ
	H4T9lTD4V2KxnhCAlypdQ+6ZXIFdtT2HRN1hs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=KORd+BsmONxlgs+vqRa67XolsRQqes4CmtoBxKojoPkXkc8ZLf1F/nxshmwZk+YUAF
	EKCX7EnOGhj4TXFMuUfauNHfnwM03kvEiozpNfeLI5AuTdDY4eku2te+BseXgm8DYhKI
	Ft8jbj2KEym4rV3Qe1p5Qmh0unleH6Rod3Vyk=
Received: by 10.150.177.17 with SMTP id z17mr2563298ybe.122.1285782655775;
	Wed, 29 Sep 2010 10:50:55 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com [192.94.94.33])
	by mx.google.com with ESMTPS id q21sm12111202ybk.11.2010.09.29.10.50.54
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 29 Sep 2010 10:50:54 -0700 (PDT)
From: Chase Maupin <chasemaupin03@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 29 Sep 2010 12:37:38 -0500
Message-Id: <1285781858-5299-1-git-send-email-chase.maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
X-SA-Exim-Connect-IP: 209.85.213.47
X-SA-Exim-Mail-From: chasemaupin03@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCHv2] am-benchmarks: update to latest version
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
X-List-Received-Date: Wed, 29 Sep 2010 17:51:14 -0000

* Updated the SRCREV to the latest version of this project
  which includes support for multiple platforms.
* Add COMPATIBLE_MACHINE setting for recipe.

Signed-off-by: Chase Maupin <chase.maupin@ti.com>
---
 recipes/ti/am-benchmarks_svn.bb |   13 ++++++++++---
 1 files changed, 10 insertions(+), 3 deletions(-)

diff --git a/recipes/ti/am-benchmarks_svn.bb b/recipes/ti/am-benchmarks_svn.bb
index 51ac6af..6ab29f5 100644
--- a/recipes/ti/am-benchmarks_svn.bb
+++ b/recipes/ti/am-benchmarks_svn.bb
@@ -4,15 +4,22 @@ LICENSE = "BSD"
 SECTION = "system"
 PRIORITY = "optional"
 
-SRCREV = "33"
-PV = "1.0"
+SRCREV = "56"
+PV = "1.1"
 PR = "r1+svnr${SRCPV}"
 
+COMPATIBLE_MACHINE = "(dm365|omapl138|omap3|ti816x)"
+
+ARCHITECTURE_dm365 = "arm9"
+ARCHITECTURE_omapl138 = "arm9"
+ARCHITECTURE_omap3 = "cortex-a8"
+ARCHITECTURE_ti816x = "cortex-a8"
+
 INSANE_SKIP_${PN} = "True"
 
 SRC_URI = "svn://gforge.ti.com/svn/am_benchmarks/;module=trunk;proto=https;user=anonymous;pswd=''"
 
-S = "${WORKDIR}/trunk"
+S = "${WORKDIR}/trunk/${ARCHITECTURE}"
 
 do_compile() {
 	# don't build debug version
-- 
1.7.0.4



