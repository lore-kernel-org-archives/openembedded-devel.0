Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id E6BE671467
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Sep 2014 14:47:00 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s8FEl1v2018549
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Sep 2014 07:47:01 -0700 (PDT)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Mon, 15 Sep 2014 07:47:01 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 15 Sep 2014 07:47:01 -0700
Message-ID: <1410792421-34501-1-git-send-email-liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH V2] meta-perl: fix for eglibc-gconvs
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 15 Sep 2014 14:47:02 -0000
Content-Type: text/plain

There is no eglibc-gconvs now, but glibc-gconvs.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../recipes-perl/libnet/libnet-libidn-perl_0.12.bb |    4 ++--
 .../recipes-perl/libtext/libtext-iconv-perl_1.7.bb |    2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-perl/recipes-perl/libnet/libnet-libidn-perl_0.12.bb b/meta-perl/recipes-perl/libnet/libnet-libidn-perl_0.12.bb
index 42b213d..fd3ff8d 100644
--- a/meta-perl/recipes-perl/libnet/libnet-libidn-perl_0.12.bb
+++ b/meta-perl/recipes-perl/libnet/libnet-libidn-perl_0.12.bb
@@ -8,9 +8,9 @@ SECTION = "libs"
 LICENSE = "Artistic-1.0 | GPLv1+"
 HOMEPAGE = "http://search.cpan.org/dist/Net-LibIDN/"
 DEPENDS += "libidn"
-# We must need eglibc-gconvs to enable charset related functions, 
+# We must need glibc-gconvs to enable charset related functions,
 # such as Net::LibIDN::idn_to_ascii().
-RDEPENDS_${PN} += "eglibc-gconvs"
+RDEPENDS_${PN} += "glibc-gconvs"
 
 SRC_URI = "http://search.cpan.org/CPAN/authors/id/T/TH/THOR/Net-LibIDN-${PV}.tar.gz"
 SRC_URI[md5sum] = "c3e4de2065009d67bcb1df0afb473e12"
diff --git a/meta-perl/recipes-perl/libtext/libtext-iconv-perl_1.7.bb b/meta-perl/recipes-perl/libtext/libtext-iconv-perl_1.7.bb
index fb4182d..934be03 100644
--- a/meta-perl/recipes-perl/libtext/libtext-iconv-perl_1.7.bb
+++ b/meta-perl/recipes-perl/libtext/libtext-iconv-perl_1.7.bb
@@ -10,7 +10,7 @@ documentation."
 SECTION = "libs"
 LICENSE = "Artistic-1.0 | GPL-1.0+"
 LIC_FILES_CHKSUM = "file://README;beginline=3;endline=6;md5=fadf2919c7128e887d26b4d905f90649"
-RRECOMMENDS_${PN} += "eglibc-gconvs"
+RRECOMMENDS_${PN} += "glibc-gconvs"
 
 SRC_URI = "http://search.cpan.org/CPAN/authors/id/M/MP/MPIOTR/Text-Iconv-${PV}.tar.gz"
 
-- 
1.7.9.5


