Received: from [93.100.16.104] (helo=mate.hex)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rik@mate.hex>) id 1NuC60-0000Gf-Qr
	for openembedded-devel@lists.openembedded.org;
	Tue, 23 Mar 2010 22:57:09 +0100
Received: by mate.hex (Postfix, from userid 1000)
	id 15F7321432; Wed, 24 Mar 2010 00:51:20 +0300 (MSK)
From: Roman I Khimov <khimov@altell.ru>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 24 Mar 2010 00:51:08 +0300
Message-Id: <1269381068-5518-1-git-send-email-khimov@altell.ru>
X-Mailer: git-send-email 1.6.4.2
In-Reply-To: <201003211505.39554.roman@khimov.ru>
References: <201003211505.39554.roman@khimov.ru>
X-SA-Exim-Connect-IP: 93.100.16.104
X-SA-Exim-Mail-From: rik@mate.hex
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=BAYES_00,NO_DNS_FOR_FROM,
	RCVD_IN_PBL,RDNS_NONE autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 01/44] cpan-base: add perl version to PR
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
X-List-Received-Date: Tue, 23 Mar 2010 21:57:09 -0000

Makes perl modules rebuild on perl version change, since binary compatibility
could be broken with that (although perl itself tries to maintain it  within
patchlevel range, like 5.8.7 -> 5.8.8).

This is conditional on PACKAGE_ARCH, since there is nothing to rebuild for
pure perl modules (and those should use 'PACKAGE_ARCH = "all"') even if they
break with perl version change.

This also should ease transition to perl 5.10.1.

Signed-off-by: Roman I Khimov <khimov@altell.ru>
---
 classes/cpan-base.bbclass |    8 ++++++++
 1 files changed, 8 insertions(+), 0 deletions(-)

diff --git a/classes/cpan-base.bbclass b/classes/cpan-base.bbclass
index 8eb173e..1c77c9b 100644
--- a/classes/cpan-base.bbclass
+++ b/classes/cpan-base.bbclass
@@ -35,6 +35,14 @@ def is_target(d):
         return "yes"
     return "no"
 
+def perl_get_version_suffix(d):
+	if bb.data.expand('${PACKAGE_ARCH}', d) != "all":
+		return '-' + get_perl_version(d)
+	else:
+		return ''
+
+PR .= "${@perl_get_version_suffix(d)}"
+
 PERLLIBDIRS = "${@perl_get_libdirs(d)}"
 
 FILES_${PN}-dbg += "${PERLLIBDIRS}/auto/*/.debug \
-- 
1.6.4.2



