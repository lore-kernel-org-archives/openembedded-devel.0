Received: from gravedo.de ([85.214.79.159])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <morphis@gravedo.de>) id 1P8BbL-0001u0-Ak
	for openembedded-devel@lists.openembedded.org;
	Tue, 19 Oct 2010 14:47:36 +0200
Received: by gravedo.de (Postfix, from userid 5001)
	id 4EC4E275CE22; Tue, 19 Oct 2010 14:47:00 +0200 (CEST)
Received: from localhost (gravedo.de [85.214.79.159])
	by gravedo.de (Postfix) with ESMTPSA id 71E88275CBA2;
	Tue, 19 Oct 2010 14:46:59 +0200 (CEST)
From: Simon Busch <morphis@gravedo.de>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 19 Oct 2010 14:46:41 +0200
Message-Id: <1287492401-26118-1-git-send-email-morphis@gravedo.de>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <4CBD4CE8.3070802@gravedo.de>
References: <4CBD4CE8.3070802@gravedo.de>
X-SA-Exim-Connect-IP: 85.214.79.159
X-SA-Exim-Mail-From: morphis@gravedo.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 15/15] preferred-shr-versions: choose git version of tslib as default
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
X-List-Received-Date: Tue, 19 Oct 2010 12:47:37 -0000

Signed-off-by: Simon Busch <morphis@gravedo.de>
---
 conf/distro/include/preferred-shr-versions.inc |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/conf/distro/include/preferred-shr-versions.inc b/conf/distro/include/preferred-shr-versions.inc
index c7c059f..220c708 100644
--- a/conf/distro/include/preferred-shr-versions.inc
+++ b/conf/distro/include/preferred-shr-versions.inc
@@ -58,6 +58,8 @@ PREFERRED_VERSION_qt4-embedded-gles = "${ANGSTROM_QT_VERSION}"
 PREFERRED_VERSION_qt4-x11-free = "${ANGSTROM_QT_VERSION}"
 PREFERRED_VERSION_qt4-x11-free-gles = "${ANGSTROM_QT_VERSION}"
 
+PREFERRED_VERSION_tslib = "1.0+git%"
+
 # epdf needs > 0.12, but recipes have D_P = -1
 PREFERRED_VERSION_poppler = "0.12.3"
 
-- 
1.7.1



