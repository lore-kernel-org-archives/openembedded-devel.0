Return-Path: <erp@movis.dk>
Received: from clobix.com (mail.clobix.com [54.229.118.53])
	by mail.openembedded.org (Postfix) with ESMTP id 76A1C6BF80
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  3 Sep 2013 15:34:09 +0000 (UTC)
Received: (qmail 25761 invoked by uid 89); 3 Sep 2013 15:33:59 -0000
Received: from unknown (HELO sabrina.webspeed.dk)
	(erp@movis.dk@::ffff:83.93.56.101)
	by 0 with ESMTPA; 3 Sep 2013 15:33:59 -0000
From: Emil Petersen <erp@movis.dk>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  3 Sep 2013 17:33:35 +0200
Message-Id: <1378222415-13643-1-git-send-email-erp@movis.dk>
X-Mailer: git-send-email 1.8.4.rc3
Subject: [meta-perl] libwww-perl_5.834: added
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
X-List-Received-Date: Tue, 03 Sep 2013 15:34:10 -0000

libwww which provides most of LWP::* added

Signed-off-by: Emil Petersen <erp@movis.dk>
---
 .../recipes-perl/libwww-perl/libwww-perl_5.834.bb  | 68 ++++++++++++++++++++++
 1 file changed, 68 insertions(+)
 create mode 100644 meta-perl/recipes-perl/libwww-perl/libwww-perl_5.834.bb

diff --git a/meta-perl/recipes-perl/libwww-perl/libwww-perl_5.834.bb b/meta-perl/recipes-perl/libwww-perl/libwww-perl_5.834.bb
new file mode 100644
index 0000000..f1a77d5
--- /dev/null
+++ b/meta-perl/recipes-perl/libwww-perl/libwww-perl_5.834.bb
@@ -0,0 +1,68 @@
+SUMMARY = "libwww-perl provides a simple and consistent API to the World Wide Web"
+AUTHOR = "Gisle Aas <gisle@activestate.com>"
+HOMEPAGE = "https://metacpan.org/release/libwww-perl"
+SECTION = "libs"
+LICENSE = "Artistic-1.0 | GPL-1.0+"
+LIC_FILES_CHKSUM = "file://README;md5=b7d978c7767cb9fb392f80103af8ca0a"
+
+RDEPENDS_${PN} += "libdigest-md5-perl \
+                   libencode-perl \
+                   libencode-locale-perl \
+                   libfile-listing-perl \
+                   libhtml-entities-perl \
+                   libhtml-headparser-perl \
+                   libhttp-date-perl \
+                   libhttp-cookies-perl \
+                   libhttp-daemon-perl \
+                   libhttp-negotiate-perl \
+                   libhttp-request-perl \
+                   libhttp-request-common-perl \
+                   libhttp-response-perl \
+                   libhttp-status-perl \
+                   libio-select-perl \
+                   libio-socket-perl \
+                   liblwp-mediatypes-perl \
+                   libmime-base64-perl \
+                   libnet-ftp-perl \
+                   libnet-http-perl \
+                   liburi-perl \
+                   liburi-escape-perl \
+                   libwww-robotrules-perl \
+                   "
+
+RPROVIDES_${PN} += "liblwp-perl \
+                    liblwp-authen-ntlm-perl \
+                    liblwp-conncache-perl \
+                    liblwp-debug-perl \
+                    liblwp-membermixin-perl \
+                    liblwp-protocol-perl \
+                    liblwp-robotua-perl \
+                    liblwp-simple-perl \
+                    liblwp-useragent-perl \
+                    liblwp-authen-basic-perl \
+                    liblwp-authen-digest-perl \
+                    liblwp-protocol-cpan-perl \
+                    liblwp-protocol-data-perl \
+                    liblwp-protocol-file-perl \
+                    liblwp-protocol-ftp-perl \                    
+                    liblwp-protocol-ghttp-perl \                    
+                    liblwp-protocol-gopher-perl \
+                    liblwp-protocol-http-perl \                    
+                    liblwp-protocol-http-socket-perl \                    
+                    liblwp-protocol-http-socketmethods-perl \                    
+                    liblwp-protocol-loopback-perl \
+                    liblwp-protocol-mailto-perl \
+                    liblwp-protocol-myftp-perl \
+                    liblwp-protocol-nntp-perl \
+                    liblwp-protocol-nogo-perl \
+                    "
+
+SRC_URI = "http://search.cpan.org/CPAN/authors/id/G/GA/GAAS/libwww-perl-${PV}.tar.gz;name=libwww-perl-${PV}"
+SRC_URI[libwww-perl-5.834.md5sum] = "f2ed8a461f76556c9caed9087f47c86c"
+SRC_URI[libwww-perl-5.834.sha256sum] = "1a50eb91d1deeca3be10982e129e786809ad6f0f8049b156e91e889e5a7288ff"
+
+S = "${WORKDIR}/libwww-perl-${PV}"
+
+inherit cpan
+
+BBCLASSEXTEND = "native"
-- 
1.8.4.rc3


