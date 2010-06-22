Received: from mail-yw0-f202.google.com ([209.85.211.202])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <chasemaupin03@gmail.com>) id 1OR4Hd-0000BM-Fg
	for openembedded-devel@lists.openembedded.org;
	Tue, 22 Jun 2010 16:17:03 +0200
Received: by ywh40 with SMTP id 40so3782148ywh.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Jun 2010 07:12:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=Rwa5pudVwlZCd5iJDeh272hsw1lgwuUgxkv8Uf52+8Y=;
	b=cv5rubUKTvoK+5ZPzZEv9999Y4XowtpmyOPaw3vu0a1NcVEy8OmzLSD6qmz2j2TMjz
	cBBKtxfiwrkg2WJ0bDpZPjBvBFZhuOhAB5SymI+1UBBWaXC1GUgJX2daXbDmJzvtPb53
	TgL+VjP9qCpgF4nnjafbMvwiatrfY1TZM20/Y=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=jIFT35YlZHkX2cozd4b1SMxk7ow4wM8RRD4vz2FJlAopko0DItVaYyLMbHC4seq5To
	TzNiJRb5gmBuwl0FbvP/8VswMavJDNlLxeMvbIgyPPD3hMbZkqliuCFNuKz216lcbbsV
	TkQuux/WytnHIuyJkYuJhQUoeMlInfcR6OHZ8=
Received: by 10.150.250.17 with SMTP id x17mr5916276ybh.264.1277215940367;
	Tue, 22 Jun 2010 07:12:20 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com [192.94.94.33])
	by mx.google.com with ESMTPS id t1sm6813518ybi.34.2010.06.22.07.12.18
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 22 Jun 2010 07:12:19 -0700 (PDT)
From: Chase Maupin <chasemaupin03@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 22 Jun 2010 09:05:52 -0500
Message-Id: <1277215552-10039-1-git-send-email-chase.maupin@ti.com>
X-Mailer: git-send-email 1.6.0.4
X-SA-Exim-Connect-IP: 209.85.211.202
X-SA-Exim-Mail-From: chasemaupin03@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Chase Maupin <chase.maupin@ti.com>
Subject: [PATCH 1/1] matrix-gui-e: add dependency on common files
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
X-List-Received-Date: Tue, 22 Jun 2010 14:17:03 -0000

* Added runtime dependency on matrix-gui-common package
  which contains the runtime scripts that the matrix-gui
  application requires.

Signed-off-by: Chase Maupin <chase.maupin@ti.com>
---
 recipes/ti/matrix-gui-e_svn.bb |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/recipes/ti/matrix-gui-e_svn.bb b/recipes/ti/matrix-gui-e_svn.bb
index 78ef003..1cda40f 100644
--- a/recipes/ti/matrix-gui-e_svn.bb
+++ b/recipes/ti/matrix-gui-e_svn.bb
@@ -6,7 +6,7 @@ PRIORITY = "optional"
 
 SRCREV = "58"
 PV = "1.0"
-PR = "r13+svnr${SRCPV}"
+PR = "r14+svnr${SRCPV}"
 
 SRC_URI = "svn://gforge.ti.com/svn/matrix_gui/;module=trunk;proto=https;user=anonymous;pswd='' \
 	file://init \
@@ -28,3 +28,5 @@ do_install() {
 }
 
 RRECOMMENDS_${PN} = "qt4-embedded-plugin-mousedriver-tslib"
+
+RDEPENDS_${PN} += "matrix-gui-common"
-- 
1.7.0.4



