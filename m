Received: from blath.larsmichelsen.com ([78.46.117.178] helo=larsmichelsen.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <lm@larsmichelsen.com>) id 1PeGko-0006LN-Jd
	for openembedded-devel@lists.openembedded.org;
	Sun, 16 Jan 2011 01:45:58 +0100
Received: from localhost (localhost.localdomain [127.0.0.1])
	by larsmichelsen.com (Postfix) with ESMTP id E54209544022
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 16 Jan 2011 01:45:24 +0100 (CET)
Received: from larsmichelsen.com ([127.0.0.1])
	by localhost (blath.larsmichelsen.com [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id kcJmLGBtPhdg; Sun, 16 Jan 2011 01:45:24 +0100 (CET)
Received: from localhost.localdomain (e181145082.adsl.alicedsl.de
	[85.181.145.82])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested) (Authenticated sender: lm)
	by larsmichelsen.com (Postfix) with ESMTPSA id 640E49544016;
	Sun, 16 Jan 2011 01:45:23 +0100 (CET)
From: Lars Michelsen <lm@larsmichelsen.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 16 Jan 2011 01:45:27 +0100
Message-Id: <1295138727-6516-1-git-send-email-lm@larsmichelsen.com>
X-Mailer: git-send-email 1.7.1
Subject: [PATCH] Added Europe/Berlin timezone to tzdata pkg
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
X-List-Received-Date: Sun, 16 Jan 2011 00:45:58 -0000

I was missing the Europe/Berlin timezone in the tzdata package. So I
added it to the package.

Additionally increased the PR. Hope this OK for such a change - must
admit that I am very new to OE.

Signed-off-by: Lars Michelsen <lm@larsmichelsen.com>
---
 recipes/tzdata/tzdata.inc |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/recipes/tzdata/tzdata.inc b/recipes/tzdata/tzdata.inc
index dd5c2c9..5597232 100644
--- a/recipes/tzdata/tzdata.inc
+++ b/recipes/tzdata/tzdata.inc
@@ -3,7 +3,7 @@ SECTION = "base"
 PRIORITY = "optional"
 DEPENDS = "tzcode-native"
 
-INC_PR = "r8"
+INC_PR = "r9"
 
 DEFAULT_TIMEZONE ?= "Europe/London"
 
@@ -132,6 +132,7 @@ FILES_${PN} += "${datadir}/zoneinfo/Pacific/Honolulu     \
                 ${datadir}/zoneinfo/America/Sao_Paulo    \
                 ${datadir}/zoneinfo/Europe/London        \
                 ${datadir}/zoneinfo/Europe/Paris         \
+                ${datadir}/zoneinfo/Europe/Berlin        \
                 ${datadir}/zoneinfo/Africa/Cairo         \
                 ${datadir}/zoneinfo/Europe/Moscow        \
                 ${datadir}/zoneinfo/Asia/Dubai           \
-- 
1.7.1



