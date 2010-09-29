Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <chasemaupin03@gmail.com>) id 1P0zMQ-0002pD-PA
	for openembedded-devel@lists.openembedded.org;
	Wed, 29 Sep 2010 18:18:28 +0200
Received: by gyg8 with SMTP id 8so352936gyg.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Sep 2010 09:18:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=0Gqc1LOln8r/i85IbZTm82yQk3eVeobe0baO7SpzEqg=;
	b=SAiK+74thuruc1vrIA18g15X2TPgPWolgrV8WCqLua2lXeoZHpVvdGCChECbFgscZr
	rNyaG/9t+3ggIEAlJixpO8dLhCvrc3pVTWwcy3MCLPbMfAuIOkcobPZpdsE4enzuHtkx
	W883dCuVJPXcpZvnXYrG+18SwE1T17WIxaPig=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=RECS2zFaON3htq0LKbqzNHuq2sGPi54gGk+jFupxNtTyPo5ZQbuSEKOUaup8+Qo1vx
	AOT00ivJrUsn1VzCD6iNOAHW8O1KvkpN5sKrhn9J2VVkY/A6p9jimg1GsXY1O7h1z9m9
	MBhenRxm3YCc5LzX+ooflwT/yaXgCdysCYAhg=
Received: by 10.101.8.8 with SMTP id l8mr2191917ani.84.1285777090309;
	Wed, 29 Sep 2010 09:18:10 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com [192.94.94.33])
	by mx.google.com with ESMTPS id w1sm10475100ana.16.2010.09.29.09.18.08
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 29 Sep 2010 09:18:09 -0700 (PDT)
From: Chase Maupin <chasemaupin03@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 29 Sep 2010 11:04:54 -0500
Message-Id: <1285776294-15073-1-git-send-email-chase.maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
X-SA-Exim-Connect-IP: 209.85.160.175
X-SA-Exim-Mail-From: chasemaupin03@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] am-benchmarks: update to latest version
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
X-List-Received-Date: Wed, 29 Sep 2010 16:18:28 -0000

* Updated the SRCREV to the latest version of this project
  which includes support for multiple platforms.

Signed-off-by: Chase Maupin <chase.maupin@ti.com>
---
 recipes/ti/am-benchmarks_svn.bb |   12 +++++++++---
 1 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/recipes/ti/am-benchmarks_svn.bb b/recipes/ti/am-benchmarks_svn.bb
index 51ac6af..1160503 100644
--- a/recipes/ti/am-benchmarks_svn.bb
+++ b/recipes/ti/am-benchmarks_svn.bb
@@ -4,15 +4,21 @@ LICENSE = "BSD"
 SECTION = "system"
 PRIORITY = "optional"
 
-SRCREV = "33"
-PV = "1.0"
+SRCREV = "56"
+PV = "1.1"
 PR = "r1+svnr${SRCPV}"
 
+ARCHITECTURE_dm365 = "arm9"
+ARCHITECTURE_da850-omapl138-evm = "arm9"
+ARCHITECTURE_omap3 = "cortex-a8"
+ARCHITECTURE_ti816x = "cortex-a8"
+ARCHITECTURE ?= "<UNDEFINED>"
+
 INSANE_SKIP_${PN} = "True"
 
 SRC_URI = "svn://gforge.ti.com/svn/am_benchmarks/;module=trunk;proto=https;user=anonymous;pswd=''"
 
-S = "${WORKDIR}/trunk"
+S = "${WORKDIR}/trunk/${ARCHITECTURE}"
 
 do_compile() {
 	# don't build debug version
-- 
1.7.0.4



