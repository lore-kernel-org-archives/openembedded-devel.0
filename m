Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <chasemaupin03@gmail.com>) id 1Ool22-0004uu-LT
	for openembedded-devel@lists.openembedded.org;
	Fri, 27 Aug 2010 00:34:51 +0200
Received: by yxk30 with SMTP id 30so922515yxk.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Aug 2010 15:34:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=i/kidRWAgYMgApowU7Nx2H2RaeGw1rU9HhbF7mj34JY=;
	b=VSG3FgOogqqNXvPOPzZ4jZUBagC1UD1HiRaUtpJhyPyOovtGSOtuQyNs0wUhIum4eP
	h+n4o1jhWzw+vDh8ufH/X03ZwgnaRjEf75NnhC0NEe8J1gG+e8dizABPl40TnPeGpH8I
	DrHCnrwma+oaYI7cZLZvuS00DZkHhs13SUGww=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=By+CpSQPZa4Q/1ntbiLYh33luWMmvCpSYoiikr2p45Q768l0JUUv9G7HyILbGJYvxq
	RaVc4pX0yJfXVITT0IKi+ufP+9kxNP4kvaY/zM8XYepquIFNcKdX8387B7orDFwd7n4j
	tgG7eYq+RhYQyFUeufQkAWafaxqy13q71XswQ=
Received: by 10.151.99.8 with SMTP id b8mr919421ybm.147.1282855149515;
	Thu, 26 Aug 2010 13:39:09 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com [192.94.94.33])
	by mx.google.com with ESMTPS id c2sm7895189ybi.21.2010.08.26.13.39.06
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 26 Aug 2010 13:39:07 -0700 (PDT)
From: Chase Maupin <chasemaupin03@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 26 Aug 2010 15:31:07 -0500
Message-Id: <1282854668-16940-1-git-send-email-chase.maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
X-SA-Exim-Connect-IP: 209.85.213.175
X-SA-Exim-Mail-From: chasemaupin03@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 1/2] matrix-gui-e: add dependency packages
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
X-List-Received-Date: Thu, 26 Aug 2010 22:34:52 -0000

* Added dependency packages such as qt4-embedded-fonts required
  for the matrix-gui application to run.
* Added dependency on matrix-gui-common.

Signed-off-by: Chase Maupin <chase.maupin@ti.com>
---
 recipes/ti/matrix-gui-e_svn.bb |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/recipes/ti/matrix-gui-e_svn.bb b/recipes/ti/matrix-gui-e_svn.bb
index adb14df..3bb304d 100644
--- a/recipes/ti/matrix-gui-e_svn.bb
+++ b/recipes/ti/matrix-gui-e_svn.bb
@@ -6,7 +6,7 @@ PRIORITY = "optional"
 
 SRCREV = "58"
 PV = "1.0"
-PR = "r14+svnr${SRCPV}"
+PR = "r15+svnr${SRCPV}"
 
 SRC_URI = "svn://gforge.ti.com/svn/matrix_gui/;module=trunk;proto=https;user=anonymous;pswd='' \
 	file://init \
@@ -27,4 +27,5 @@ do_install() {
 	install -c -m 0755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/matrix-gui-e
 }
 
-RRECOMMENDS_${PN} = "qt4-embedded-plugin-mousedriver-tslib"
+RRECOMMENDS_${PN} = "qt4-embedded-plugin-mousedriver-tslib qt4-embedded-fonts"
+RDEPENDS_${PN} += "matrix-gui-common"
-- 
1.7.0.4



