Received: from mail.cvg.de ([62.153.82.30])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <enrico.scholz@sigma-chemnitz.de>) id 1OGAW2-00045p-Kl
	for openembedded-devel@lists.openembedded.org;
	Sun, 23 May 2010 14:42:51 +0200
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail.cvg.de (8.14.3/8.14.4) with ESMTP id o4NCc9Ql004310
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Sun, 23 May 2010 14:38:10 +0200
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
	4.71) (envelope-from <ensc@sigma-chemnitz.de>)
	id 1OGARV-0007OL-Be; Sun, 23 May 2010 14:38:09 +0200
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 23 May 2010 14:37:59 +0200
Message-Id: <1274618279-24726-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
X-Mailer: git-send-email 1.7.0.1
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
X-Scanned-By: MIMEDefang 2.68 on 62.153.82.30
X-SA-Exim-Connect-IP: 62.153.82.30
X-SA-Exim-Mail-From: enrico.scholz@sigma-chemnitz.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-6.6 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_MED,SPF_HELO_PASS,SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Subject: [PATCH] packaged-staging.bbclass: added missing space in find call
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
X-List-Received-Date: Sun, 23 May 2010 12:42:51 -0000

Old find statement failed with something like

  $ find . \( -name XXX\)
  find: invalid expression; I was expecting to find a ')' somewhere but did not see one.

Signed-off-by: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
---
 classes/packaged-staging.bbclass |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/classes/packaged-staging.bbclass b/classes/packaged-staging.bbclass
index 62a78e4..83f3578 100644
--- a/classes/packaged-staging.bbclass
+++ b/classes/packaged-staging.bbclass
@@ -19,7 +19,7 @@ PSTAGE_PKGPN      = "${@bb.data.expand('staging-${PN}-${MULTIMACH_ARCH}${TARGET_
 PSTAGE_PKGNAME    = "${PSTAGE_PKGPN}_${PSTAGE_PKGVERSION}_${PSTAGE_PKGARCH}.ipk"
 PSTAGE_PKG        = "${PSTAGE_DIR}/${PSTAGE_PKGPATH}/${PSTAGE_PKGNAME}"
 PSTAGE_WORKDIR   = "${TMPDIR}/pstage"
-PSTAGE_SCAN_CMD ?= "find ${PSTAGE_TMPDIR_STAGE} \( -name "*.la" -o -name "*-config"\) -type f"
+PSTAGE_SCAN_CMD ?= "find ${PSTAGE_TMPDIR_STAGE} \( -name "*.la" -o -name "*-config" \) -type f"
 
 PSTAGE_NATIVEDEPENDS = "\
     shasum-native \
-- 
1.7.0.1



