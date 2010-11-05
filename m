Received: from [93.100.16.104] (helo=mate.hex)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rik@mate.hex>) id 1PESWS-000471-6u
	for openembedded-devel@lists.openembedded.org;
	Fri, 05 Nov 2010 21:04:28 +0100
Received: by mate.hex (Postfix, from userid 1000)
	id 1FB923D4F2; Fri,  5 Nov 2010 23:03:33 +0300 (MSK)
From: Roman I Khimov <khimov@altell.ru>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  5 Nov 2010 23:03:31 +0300
Message-Id: <1288987411-14231-1-git-send-email-khimov@altell.ru>
X-Mailer: git-send-email 1.6.4.2
In-Reply-To: <AANLkTi==Pf6K0p48n8cJhMnws6=43qGrX5HAPRgYyJaj@mail.gmail.com>
References: <AANLkTi==Pf6K0p48n8cJhMnws6=43qGrX5HAPRgYyJaj@mail.gmail.com>
X-SA-Exim-Connect-IP: 93.100.16.104
X-SA-Exim-Mail-From: rik@mate.hex
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=AWL, BAYES_00, NO_DNS_FOR_FROM,
	RCVD_IN_PBL,RDNS_NONE autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] openldap: fix ltmain.sh location
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
X-List-Received-Date: Fri, 05 Nov 2010 20:04:28 -0000

Signed-off-by: Roman I Khimov <khimov@altell.ru>
---
 recipes/openldap/openldap_2.4.23.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/recipes/openldap/openldap_2.4.23.bb b/recipes/openldap/openldap_2.4.23.bb
index 3ac15f6..f8f3fb5 100644
--- a/recipes/openldap/openldap_2.4.23.bb
+++ b/recipes/openldap/openldap_2.4.23.bb
@@ -188,7 +188,7 @@ DEPENDS      += "${OPENLDAP_DEPENDS}"
 CPPFLAGS_append = " -D_GNU_SOURCE"
 
 do_configure() {
-	cp ${STAGING_DATADIR}/libtool/config/ltmain.sh ${S}/build
+	cp ${STAGING_DATADIR_NATIVE}/libtool/config/ltmain.sh ${S}/build
 	rm -f ${S}/libtool
 	aclocal
 	libtoolize --force --copy
-- 
1.6.4.2



