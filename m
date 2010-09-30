Received: from mail-ew0-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <chasemaupin03@gmail.com>) id 1P1Ok2-0002wx-PM
	for openembedded-devel@lists.openembedded.org;
	Thu, 30 Sep 2010 21:24:40 +0200
Received: by ewy7 with SMTP id 7so1016866ewy.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 Sep 2010 12:24:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=4fqEqLaX49w8S3KoajbArMCKWLzUSjbn+fAwFl1+sxA=;
	b=cRKpfWA86fHrUzCGdcN4+lr3TU6hKv6xK+JxNDB+4hj254uJdaNry3qawzW7pzwhm/
	cw17ZLIcfP0Uq48t1hrFneX6NxjieGpM3fOXmuHZxAcQ3UDnic/KYtf0iQx4Kon05wpt
	pmLbmLernsonGlZFMOTysvZy4CIBm2wYV7iN8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=P5tJV11gmy8cuSHeFUWIAtmskf19/9x1T4CLEarpOdefLoClxkBVVOCsHW9ncyx9Tg
	E0Igb3XvSYF7CtAM4q74mZiAhVQRU6yTCk2hhf2yeTOosM6jVOzYFSoNto8j3l9sh322
	KDYmoX0FhufJluBP83eRYldbJLCGgl5EqPUQE=
Received: by 10.213.104.141 with SMTP id p13mr3443623ebo.64.1285874656295;
	Thu, 30 Sep 2010 12:24:16 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com [192.94.94.33])
	by mx.google.com with ESMTPS id y11sm164583vcf.25.2010.09.30.12.24.13
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 30 Sep 2010 12:24:14 -0700 (PDT)
From: Chase Maupin <chasemaupin03@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 30 Sep 2010 14:10:48 -0500
Message-Id: <1285873848-21619-1-git-send-email-chase.maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
X-SA-Exim-Connect-IP: 209.85.215.47
X-SA-Exim-Mail-From: chasemaupin03@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCHv3] am-benchmarks: update to latest version
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
X-List-Received-Date: Thu, 30 Sep 2010 19:24:41 -0000

* Updated the SRCREV to the latest version of this project
  which includes support for multiple platforms.
* Add COMPATIBLE_MACHINE setting for recipe.

Signed-off-by: Chase Maupin <chase.maupin@ti.com>
---
Added in version 3
    * Added a note to explain that this recipe is currently only
      supported for the Angstrom distribution.

---
 recipes/ti/am-benchmarks_svn.bb |   17 ++++++++++++++---
 1 files changed, 14 insertions(+), 3 deletions(-)

diff --git a/recipes/ti/am-benchmarks_svn.bb b/recipes/ti/am-benchmarks_svn.bb
index 51ac6af..63c122f 100644
--- a/recipes/ti/am-benchmarks_svn.bb
+++ b/recipes/ti/am-benchmarks_svn.bb
@@ -1,18 +1,29 @@
+#NOTE: This package is currently only supported for the Angstrom
+#      distribution.  Other distributions and toolchains may or
+#      may not work.
+
 DESCRIPTION = "AM Benchmarks"
 HOMEPAGE = "https://gforge.ti.com/gf/project/am_benchmarks/"
 LICENSE = "BSD"
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



