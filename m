Received: from mailout-de.gmx.net ([213.165.64.22])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <schnitzeltony@gmx.de>) id 1RLOFq-0002YK-5f
	for openembedded-devel@lists.openembedded.org;
	Wed, 02 Nov 2011 01:00:30 +0100
Received: (qmail invoked by alias); 01 Nov 2011 23:54:23 -0000
Received: from p5B0A3AE4.dip.t-dialin.net (EHLO localhost.localdomain)
	[91.10.58.228]
	by mail.gmx.net (mp006) with SMTP; 02 Nov 2011 00:54:23 +0100
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX18uGMBImuUuMDg+f5gCcmkqquhHqplu5EIArD9mXf
	7Ohhd6q3n9Jkwj
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmx.de>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  2 Nov 2011 00:58:53 +0100
Message-Id: <1320191933-28392-3-git-send-email-schnitzeltony@gmx.de>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1320191933-28392-1-git-send-email-schnitzeltony@gmx.de>
References: <1320191933-28392-1-git-send-email-schnitzeltony@gmx.de>
MIME-Version: 1.0
X-Y-GMX-Trusted: 0
Subject: [meta-oe][V2 2/2] mime.bbclass: Add --disable-update-mimedb to EXTRA_OECONF
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
X-List-Received-Date: Wed, 02 Nov 2011 00:00:30 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

keep recipes from building files not intended to pack and causing QA warnings [1]

[1] http://lists.linuxtogo.org/pipermail/openembedded-devel/2011-November/035954.html

Signed-off-by: Andreas Müller <schnitzeltony@gmx.de>
---
 meta-oe/classes/mime.bbclass |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/meta-oe/classes/mime.bbclass b/meta-oe/classes/mime.bbclass
index b9cdd7b..d73c2cb 100644
--- a/meta-oe/classes/mime.bbclass
+++ b/meta-oe/classes/mime.bbclass
@@ -1,5 +1,7 @@
 DEPENDS += "shared-mime-info-native shared-mime-info"
 
+EXTRA_OECONF += "--disable-update-mimedb"
+
 mime_postinst() {
 if [ "$1" = configure ]; then
 	if [ -x ${bindir}/update-mime-database ] ; then
-- 
1.7.4.4



