Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7A63B70031
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  8 Jun 2016 05:59:10 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u585xAie010690
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Tue, 7 Jun 2016 22:59:10 -0700
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.248.2;
	Tue, 7 Jun 2016 22:59:09 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 8 Jun 2016 01:59:07 -0400
Message-ID: <1465365547-149524-1-git-send-email-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Subject: [PATCH][meta-perl] libcgi-perl: add version 4.28 to provide perl-module-cgi
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
X-List-Received-Date: Wed, 08 Jun 2016 05:59:12 -0000
Content-Type: text/plain

Since perl 5.22 has removed perl-module-cgi,
(http://perl5.git.perl.org/perl.git/commitdiff/e9fa5a80)
we should add it back.
(http://search.cpan.org/~leejo/CGI-4.28/lib/CGI.pod)

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta-perl/recipes-perl/libcgi/libcgi-perl_4.28.bb | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)
 create mode 100644 meta-perl/recipes-perl/libcgi/libcgi-perl_4.28.bb

diff --git a/meta-perl/recipes-perl/libcgi/libcgi-perl_4.28.bb b/meta-perl/recipes-perl/libcgi/libcgi-perl_4.28.bb
new file mode 100644
index 0000000..20626d2
--- /dev/null
+++ b/meta-perl/recipes-perl/libcgi/libcgi-perl_4.28.bb
@@ -0,0 +1,20 @@
+DESCRIPTION = "CGI.pm is a stable, complete and mature solution for processing and preparing \
+HTTP requests and responses. Major features including processing form \
+submissions, file uploads, reading and writing cookies, query string generation \
+and manipulation, and processing and preparing HTTP headers."
+HOMEPAGE = "http://search.cpan.org/~leejo/CGI-4.28/lib/CGI.pod"
+SECTION = "libs"
+LICENSE = "Artistic-2.0 | GPL-2.0"
+
+LIC_FILES_CHKSUM = "file://LICENSE;md5=2e9769f0a2613a98bc7fce15dee0c533"
+
+SRC_URI = "http://search.cpan.org/CPAN/authors/id/L/LE/LEEJO/CGI-${PV}.tar.gz"
+
+SRC_URI[md5sum] = "28efb391377f6e98c19c23292d5fcc8c"
+SRC_URI[sha256sum] = "1297d3ed6616cacb4eb57860e3e743f3890111e7a63ca08849930f42f1360532"
+
+S = "${WORKDIR}/CGI-${PV}"
+
+inherit cpan
+
+RPROVIDES_${PN} += "perl-module-cgi"
-- 
2.8.1


