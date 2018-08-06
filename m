Return-Path: <kai.kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id CB18075258
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  6 Aug 2018 10:39:12 +0000 (UTC)
Received: from ala-blade48.wrs.com (ala-blade48.wrs.com [147.11.105.68])
	by mail.windriver.com (8.15.2/8.15.1) with SMTP id w76AdDIM028706
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 6 Aug 2018 03:39:13 -0700 (PDT)
Received: by ala-blade48.wrs.com (sSMTP sendmail emulation);
	Mon, 06 Aug 2018 03:39:13 -0700
From: Kai Kang <kai.kang@windriver.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  6 Aug 2018 03:39:04 -0700
Message-Id: <20180806103907.37227-3-kai.kang@windriver.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20180806103907.37227-1-kai.kang@windriver.com>
References: <20180806103907.37227-1-kai.kang@windriver.com>
Subject: [meta-perl][PATCH 2/5] libnet-dns-perl: 1.14 -> 1.17
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 06 Aug 2018 10:39:13 -0000

Upgrade libnet-dns-perl from 1.14 to 1.17.

* correct LICENSE which should be MIT

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../libnet/{libnet-dns-perl_1.14.bb => libnet-dns-perl_1.17.bb}   | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
 rename meta-perl/recipes-perl/libnet/{libnet-dns-perl_1.14.bb => libnet-dns-perl_1.17.bb} (68%)

diff --git a/meta-perl/recipes-perl/libnet/libnet-dns-perl_1.14.bb b/meta-perl/recipes-perl/libnet/libnet-dns-perl_1.17.bb
similarity index 68%
rename from meta-perl/recipes-perl/libnet/libnet-dns-perl_1.14.bb
rename to meta-perl/recipes-perl/libnet/libnet-dns-perl_1.17.bb
index efaa7f7b1..79583551f 100644
--- a/meta-perl/recipes-perl/libnet/libnet-dns-perl_1.14.bb
+++ b/meta-perl/recipes-perl/libnet/libnet-dns-perl_1.17.bb
@@ -1,16 +1,16 @@
 DESCRIPTION = "This package contains the DNS.pm module with friends."
 HOMEPAGE = "http://www.net-dns.org/"
 SECTION = "libs"
-LICENSE = "Artistic-1.0 | GPL-1.0+"
+LICENSE = "MIT"
 
-LIC_FILES_CHKSUM = "file://README;md5=92d93d8c5bf22de77578531e283dd219"
+LIC_FILES_CHKSUM = "file://README;beginline=252;endline=269;md5=27db37b42cd1a5173a53922d67072bcb"
 
 DEPENDS += "perl"
 
 SRC_URI = "http://search.cpan.org/CPAN/authors/id/N/NL/NLNETLABS/Net-DNS-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "0da1099c0a3548d36ea9e31d5bb9e122"
-SRC_URI[sha256sum] = "83c38a594eeb2c85d66e60047a0f5b403f34bd92a5d13606f02e828d450299fc"
+SRC_URI[md5sum] = "28fcbcbf4483a9f23f75be4b9e3e45c8"
+SRC_URI[sha256sum] = "9a79fd8fea1a708726c18d193ae4437479206ccb20ffa7f0971371e172e2c2e0"
 
 S = "${WORKDIR}/Net-DNS-${PV}"
 
-- 
2.11.0


