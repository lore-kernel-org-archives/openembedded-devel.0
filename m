Return-Path: <Jackie.Huang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 3764877BCD
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Apr 2017 08:22:17 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v3Q8MIU6026708
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Apr 2017 01:22:18 -0700 (PDT)
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Wed, 26 Apr 2017 01:22:16 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 26 Apr 2017 16:22:02 +0800
Message-ID: <3349b8dda9edb8cbcf3d716e146b724f4e2c6a79.1493194374.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1493194374.git.jackie.huang@windriver.com>
References: <cover.1493194374.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Subject: [meta-perl][PATCH 3/8 v2] libnet-ldap-perl: add new recipe
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
X-List-Received-Date: Wed, 26 Apr 2017 08:22:17 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

Net::LDAP is a collection of modules that implements
a LDAP services API for Perl programs.

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 .../recipes-perl/libnet/libnet-ldap-perl_0.65.bb   | 29 ++++++++++++++++++++++
 1 file changed, 29 insertions(+)
 create mode 100644 meta-perl/recipes-perl/libnet/libnet-ldap-perl_0.65.bb

diff --git a/meta-perl/recipes-perl/libnet/libnet-ldap-perl_0.65.bb b/meta-perl/recipes-perl/libnet/libnet-ldap-perl_0.65.bb
new file mode 100644
index 000000000..f2b1f1634
--- /dev/null
+++ b/meta-perl/recipes-perl/libnet/libnet-ldap-perl_0.65.bb
@@ -0,0 +1,29 @@
+SUMMARY = "LDAP Perl module"
+DESCRIPTION = "Net::LDAP is a collection of modules that implements \
+a LDAP services API for Perl programs. The module may be used to \
+search directories or perform maintenance functions such as adding, \
+deleting or modifying entries."
+
+SECTION = "libs"
+
+LICENSE = "Artistic-1.0|GPLv1+"
+LIC_FILES_CHKSUM = "file://README;beginline=3;endline=5;md5=4d6588c2fa0d38ae162f6314d201d89e"
+
+SRC_URI = "http://search.cpan.org/CPAN/authors/id/M/MA/MARSCHAP/perl-ldap-${PV}.tar.gz"
+
+SRC_URI[md5sum] = "d057c8db76913d95c0e460c7bdd98b27"
+SRC_URI[sha256sum] = "5f57dd261dc16ebf942a272ddafe69526598df71151a51916edc37a4f2f23834"
+
+S = "${WORKDIR}/perl-ldap-${PV}"
+
+inherit cpan
+
+do_configure_prepend() {
+    perl -pi -e 's/auto_install_now.*//g' Makefile.PL
+}
+
+RDEPENDS_${PN} = "perl \
+    libconvert-asn1-perl \
+    libio-socket-ssl-perl \
+    libauthen-sasl-perl \
+"
-- 
2.11.0


