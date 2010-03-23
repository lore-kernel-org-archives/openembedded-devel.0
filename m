Received: from office.altell.ru ([80.246.246.162])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rik@build2.altell.local>) id 1Nu5BV-0001Hx-5t
	for openembedded-devel@lists.openembedded.org;
	Tue, 23 Mar 2010 15:34:31 +0100
Received: from build2.altell.local (build2.altell.local [192.168.1.26])
	by mail.altell.local (Postfix) with ESMTPS id 08EE4687EF;
	Tue, 23 Mar 2010 17:31:04 +0300 (MSK)
Received: from rik by build2.altell.local with local (Exim 4.69)
	(envelope-from <rik@build2.altell.local>)
	id 1Nu53Y-0005Re-9Q; Tue, 23 Mar 2010 17:26:08 +0300
From: Roman I Khimov <khimov@altell.ru>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 23 Mar 2010 17:26:05 +0300
Message-Id: <1269354368-20910-1-git-send-email-khimov@altell.ru>
X-Mailer: git-send-email 1.5.6.5
In-Reply-To: <1269346975-842-2-git-send-email-khimov@altell.ru>
References: <1269346975-842-2-git-send-email-khimov@altell.ru>
X-Altell-MailScanner-ID: 08EE4687EF.D6F5F
X-Altell-MailScanner: Found to be clean
X-Altell-MailScanner-From: rik@build2.altell.local
X-SA-Exim-Connect-IP: 80.246.246.162
X-SA-Exim-Mail-From: rik@build2.altell.local
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=AWL, BAYES_00, NO_DNS_FOR_FROM
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] fetchmail: fix fetchmailconf packaging and fetchmail build
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
X-List-Received-Date: Tue, 23 Mar 2010 14:34:31 -0000

python-native needed for python-dir proper working and then fetchmailconf
really wants to have some python in runtime.

Signed-off-by: Roman I Khimov <khimov@altell.ru>
---
 recipes/fetchmail/fetchmail_6.3.14.bb |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes/fetchmail/fetchmail_6.3.14.bb b/recipes/fetchmail/fetchmail_6.3.14.bb
index e3aa408..4daedbb 100644
--- a/recipes/fetchmail/fetchmail_6.3.14.bb
+++ b/recipes/fetchmail/fetchmail_6.3.14.bb
@@ -3,10 +3,10 @@ well-documented remote-mail retrieval and forwarding utility \
 intended to be used over on-demand TCP/IP links \
 (such as SLIP or PPP connections)."
 SECTION = "console/network"
-
 LICENSE = "GPL"
+DEPENDS = "python-native"
 
-PR = "r2"
+PR = "r3"
 
 SRC_URI = "http://download.berlios.de/fetchmail/${PN}-${PV}.tar.bz2;name=src \
 	   "
@@ -19,4 +19,4 @@ inherit autotools gettext python-dir
 FILES_${PN} = "${bindir}/fetchmail"
 PACKAGES += "${PN}conf"
 FILES_${PN}conf = "${PYTHON_SITEPACKAGES_DIR}/fetchmailconf.py* ${bindir}/fetchmailconf"
-rdepends_${PN}conf = "${PN}"
+RDEPENDS_${PN}conf = "${PN} python-core"
-- 
1.5.6.5



