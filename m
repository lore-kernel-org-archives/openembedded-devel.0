Received: from [93.100.16.104] (helo=mate.hex)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rik@mate.hex>) id 1OYByw-0002qh-GL
	for openembedded-devel@lists.openembedded.org;
	Mon, 12 Jul 2010 07:55:10 +0200
Received: by mate.hex (Postfix, from userid 1000)
	id 9DD1721B4C; Mon, 12 Jul 2010 09:41:00 +0400 (MSD)
From: Roman I Khimov <khimov@altell.ru>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 12 Jul 2010 09:40:53 +0400
Message-Id: <1278913254-30180-1-git-send-email-khimov@altell.ru>
X-Mailer: git-send-email 1.6.4.2
In-Reply-To: <201007111103.21110.roman@khimov.ru>
References: <201007111103.21110.roman@khimov.ru>
X-SA-Exim-Connect-IP: 93.100.16.104
X-SA-Exim-Mail-From: rik@mate.hex
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=AWL, BAYES_00, NO_DNS_FOR_FROM,
	RCVD_IN_PBL,RDNS_NONE autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 1/2] libdbix-simple-perl: add DBIx::Simple Perl module
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
X-List-Received-Date: Mon, 12 Jul 2010 05:55:11 -0000

Signed-off-by: Roman I Khimov <khimov@altell.ru>
---
 recipes/perl/libdbix-simple-perl_1.32.bb |   19 +++++++++++++++++++
 1 files changed, 19 insertions(+), 0 deletions(-)
 create mode 100644 recipes/perl/libdbix-simple-perl_1.32.bb

diff --git a/recipes/perl/libdbix-simple-perl_1.32.bb b/recipes/perl/libdbix-simple-perl_1.32.bb
new file mode 100644
index 0000000..0fa1b5f
--- /dev/null
+++ b/recipes/perl/libdbix-simple-perl_1.32.bb
@@ -0,0 +1,19 @@
+DESCRIPTION = "Easy-to-use OO interface to DBI"
+SECTION = "libs"
+LICENSE = "Artistic|GPL"
+DEPENDS_${PN} += "libdbi-perl-native"
+RDEPENDS_${PN} += "libdbi-perl \
+         perl-module-file-spec \
+         perl-module-scalar-util \
+         perl-module-test-simple \
+         perl-module-storable \
+"
+PR = "r0"
+
+SRC_URI = "http://search.cpan.org/CPAN/authors/id/J/JU/JUERD/DBIx-Simple-${PV}.tar.gz"
+SRC_URI[md5sum] = "c1d7bf0ab453e7e00715d9d4e71102d8"
+SRC_URI[sha256sum] = "226917bffbe3ad0e88295046ed4d25785bc6175e696fb77f8302226bc947fe36"
+
+S = "${WORKDIR}/DBIx-Simple-${PV}"
+
+inherit cpan
-- 
1.6.4.2



