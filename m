Return-Path: <erp@movis.dk>
Received: from clobix.com (mail.clobix.com [54.229.118.53])
	by mail.openembedded.org (Postfix) with ESMTP id 102BA6C002
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  3 Sep 2013 15:40:01 +0000 (UTC)
Received: (qmail 25868 invoked by uid 89); 3 Sep 2013 15:39:51 -0000
Received: from unknown (HELO sabrina.webspeed.dk)
	(erp@movis.dk@::ffff:83.93.56.101)
	by 0 with ESMTPA; 3 Sep 2013 15:39:51 -0000
From: Emil Petersen <erp@movis.dk>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  3 Sep 2013 17:39:28 +0200
Message-Id: <1378222768-13941-1-git-send-email-erp@movis.dk>
X-Mailer: git-send-email 1.8.4.rc3
Subject: [meta-perl][PATCH] libencode-perl_2.52: added
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
X-List-Received-Date: Tue, 03 Sep 2013 15:40:02 -0000

Encode recipe added

Signed-off-by: Emil Petersen <erp@movis.dk>
---
 .../libencode-perl/libencode-perl_2.52.bb          | 49 ++++++++++++++++++++++
 1 file changed, 49 insertions(+)
 create mode 100644 meta-perl/recipes-perl/libencode-perl/libencode-perl_2.52.bb

diff --git a/meta-perl/recipes-perl/libencode-perl/libencode-perl_2.52.bb b/meta-perl/recipes-perl/libencode-perl/libencode-perl_2.52.bb
new file mode 100644
index 0000000..b2e261a
--- /dev/null
+++ b/meta-perl/recipes-perl/libencode-perl/libencode-perl_2.52.bb
@@ -0,0 +1,49 @@
+SUMMARY = "Encode - character encodings"
+DESCRIPTION = "The \"Encode\" module provides the interfaces between Perl's strings and the rest of the system.  Perl strings are \
+       sequences of characters. \ 
+       See \"perldoc Encode\" for the rest of the story"
+AUTHOR = "Dan Kogai <dankogai+cpan@gmail.com>"
+HOMEPAGE = "https://metacpan.org/release/Encode"
+SECTION = "lib"
+LICENSE = "Artistic-1.0 | GPL-1.0+"
+LIC_FILES_CHKSUM = "file://META.json;md5=f335275cdfe14e39d59aee6a883b78cd"
+
+RPROVIDES_${PN} += "libencode-perl \
+                    libencode-alias-perl \
+                    libencode-byte-perl \
+                    libencode-cjkconstants-perl \
+                    libencode-cn-perl \
+                    libencode-cn-hz-perl \
+                    libencode-config-perl \
+                    libencode-ebcdic-perl \
+                    libencode-encoder-perl \
+                    libencode-encoding-perl \
+                    libencode-gsm0338-perl \
+                    libencode-guess-perl \
+                    libencode-jp-perl \
+                    libencode-jp-h2z-perl \
+                    libencode-jp-jis7-perl \
+                    libencode-kr-perl \
+                    libencode-kr-2022_kr-perl \
+                    libencode-mime-header-perl \
+                    libencode-mime-name-perl \
+                    libencode-symbol-perl \
+                    libencode-tw-perl \
+                    libencode-unicode--perl \
+                    libencode-unicode-utf7-perl \
+                    libencoding-perl \
+                    libencode-internal-perl \
+                    libencode-mime-header-iso_2022_jp-perl \
+                    libencode-utf8-perl \
+                    libencode-utf_ebcdic-perl \
+                    "
+ 
+SRC_URI = "http://cpan.metacpan.org/authors/id/D/DA/DANKOGAI/Encode-${PV}.tar.gz"
+SRC_URI[md5sum] = "bf26ef62725b1938181d71d1127f22d8"
+SRC_URI[sha256sum] = "2411a2027195b684065339abb1286dd540ca3ca32d546bd682c4964579ad3c60"
+
+S = "${WORKDIR}/Encode-${PV}"
+
+inherit cpan
+
+BBCLASSEXTEND = "native"
-- 
1.8.4.rc3


