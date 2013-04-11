Received: from mail.planet-school.de ([194.116.187.5]
	helo=turboconrad.planet-school.de)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <lists@philipp-wagner.com>) id 1UQO9i-0005Ju-8q
	for openembedded-devel@lists.openembedded.org;
	Thu, 11 Apr 2013 22:31:38 +0200
Received: from turboconrad.planet-school.de (srv004.service.ps-server.net
	[194.116.186.79])
	by turboconrad.planet-school.de (Postfix) with ESMTP id 7B0E6B6A04C;
	Thu, 11 Apr 2013 22:04:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	srv004.service.ps-server.net
X-Spam-Level: 
X-Spam-Status: No, score=-101.4 required=5.0 tests=ALL_TRUSTED,AWL,
	LOCAL_USER_RULE autolearn=unavailable version=3.3.2
Received: from poweramy.fritz.box (ppp-188-174-13-152.dynamic.mnet-online.de
	[188.174.13.152])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: lists@philipp-wagner.com)
	by turboconrad.planet-school.de (Postfix) with ESMTPSA id 37A90B6A045; 
	Thu, 11 Apr 2013 22:04:42 +0200 (CEST)
From: lists@philipp-wagner.com
To: openembedded-devel@lists.openembedded.org
Date: Thu, 11 Apr 2013 22:04:14 +0200
Message-Id: <1365710654-22327-1-git-send-email-lists@philipp-wagner.com>
X-Mailer: git-send-email 1.8.1.4
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: Philipp Wagner <mail@philipp-wagner.com>
Subject: [meta-oe][PATCH] Add dependencies on Perl and Bash to NTP recipe
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
X-List-Received-Date: Thu, 11 Apr 2013 20:31:38 -0000

From: Philipp Wagner <mail@philipp-wagner.com>

do_rootfs gave errors about bash and perl not being found.
This patch adds the two packages to the runtime dependencies
to fix this problem.

Signed-off-by: Philipp Wagner <mail@philipp-wagner.com>
---
 meta-networking/recipes-support/ntp/ntp.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-support/ntp/ntp.inc b/meta-networking/recipes-support/ntp/ntp.inc
index d93f22d..a563a08 100644
--- a/meta-networking/recipes-support/ntp/ntp.inc
+++ b/meta-networking/recipes-support/ntp/ntp.inc
@@ -59,7 +59,7 @@ PACKAGES += "ntpdate ${PN}-tickadj ${PN}-utils"
 
 # ntp originally includes tickadj. It's split off for inclusion in small firmware images on platforms
 # with wonky clocks (e.g. OpenSlug)
-RDEPENDS_${PN} = "${PN}-tickadj"
+RDEPENDS_${PN} = "${PN}-tickadj perl bash"
 # Handle move from bin to utils package
 RPROVIDES_${PN}-utils = "${PN}-bin"
 RREPLACES_${PN}-utils = "${PN}-bin"
-- 
1.8.1.4


