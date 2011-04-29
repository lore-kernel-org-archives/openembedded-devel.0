Received: from smtp-out06.msg.oleane.net ([62.161.7.4])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <christian.charreyre@cioinfoindus.fr>)
	id 1QFqE6-0001jz-7F for openembedded-devel@lists.openembedded.org;
	Fri, 29 Apr 2011 18:07:30 +0200
Received: from smtp05.msg.oleane.net (smtp05.mail.priv [172.17.20.114]) 
	by smtp-out06.msg.oleane.net with ESMTP id p3TG4xCS000338
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 Apr 2011 18:04:59 +0200
Received: from localhost.localdomain
	(AMarseille-551-1-3-92.w80-9.abo.wanadoo.fr [80.9.74.92]) 
	by smtp05.msg.oleane.net (MTA) with ESMTP id p3TFiC5A021692;
	Fri, 29 Apr 2011 17:44:32 +0200
X-Oleane-Rep: REPA
From: "C. Charreyre" <christian.charreyre@cioinfoindus.fr>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 29 Apr 2011 17:43:58 +0200
Message-Id: <1304091838-23333-3-git-send-email-christian.charreyre@cioinfoindus.fr>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1304091838-23333-1-git-send-email-christian.charreyre@cioinfoindus.fr>
References: <1304091838-23333-1-git-send-email-christian.charreyre@cioinfoindus.fr>
X-Spam-Flag: NO
X-PMX-Spam: Probability=8%
X-PFSI-Info: PMX 5.5.9.395186, Antispam-Engine: 2.7.2.376379,
	Antispam-Data: 2011.4.29.151816 (no antivirus check)
Subject: [PATCH v2] python-numpy: add missing release dependencies
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
X-List-Received-Date: Fri, 29 Apr 2011 16:07:30 -0000

Signed-off-by: C. Charreyre <christian.charreyre@cioinfoindus.fr>
---
 recipes/python/python-numpy_1.1.1.bb |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/recipes/python/python-numpy_1.1.1.bb b/recipes/python/python-numpy_1.1.1.bb
index f5c23e0..9dda508 100644
--- a/recipes/python/python-numpy_1.1.1.bb
+++ b/recipes/python/python-numpy_1.1.1.bb
@@ -4,6 +4,8 @@ PRIORITY = "optional"
 LICENSE = "PSF"
 PR = "ml0"
 
+RDEPENDS_${PN} = "python-compiler python-mmap python-pkgutil python-pydoc python-unittest"
+
 SRC_URI = "${SOURCEFORGE_MIRROR}/numpy/numpy-${PV}.tar.gz \
            file://unbreak-assumptions.diff \
 	   file://trycompile.diff \
-- 
1.7.0.4



