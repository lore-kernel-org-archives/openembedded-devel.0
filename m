Return-Path: <akuster808@gmail.com>
Received: from mail-ig0-f173.google.com (mail-ig0-f173.google.com
	[209.85.213.173])
	by mail.openembedded.org (Postfix) with ESMTP id 82CCB6011C
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Nov 2015 15:14:07 +0000 (UTC)
Received: by igvg19 with SMTP id g19so97296916igv.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Nov 2015 07:14:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=DgOdnFaO4dJNIRtfqnSWprc6xKH4/gneQQqByZL48t4=;
	b=EDiU5nhLPMOQdJF4XHGa4JMBNqMz79G1oKVvx0pDDWKImMX4F3U5x/+Si1cklfr2E9
	LRLPySSG7NSz82JKfN3SFDE+/9ANOYziNns8coJQ606Ldt9o/HjsEBTMis8Xx7ThAade
	xQs4iTxNyMCyiJFZ6Mnnl+3+/SUPV/R2y3+/RI/ogT6uOkU5QUcD/fMxldjIu47gwanE
	J0pN31uCuryCz+PadWwVjCOVXvcJypdQUrW1f4TF8XCSmUhCSlBg63nx5CRThCl2Xpbx
	r8I4WQVmSirWH2TqJAXwZtPKK6Ykz/2cK6Kz2mpo22A2w0vKBokBvGfYiDoG+kMXH221
	0mEQ==
X-Received: by 10.50.50.179 with SMTP id d19mr20588765igo.91.1448378048437;
	Tue, 24 Nov 2015 07:14:08 -0800 (PST)
Received: from localhost.localdomain (75-163-133-159.clsp.qwest.net.
	[75.163.133.159])
	by smtp.gmail.com with ESMTPSA id c92sm7046861iod.0.2015.11.24.07.14.07
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 24 Nov 2015 07:14:07 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org,
	joe_macdonald@mentor.com
Date: Tue, 24 Nov 2015 07:14:05 -0800
Message-Id: <1448378045-23497-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.3.5
Subject: [meta-networking][PATCH] wireshark: update to version 2.0.0
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
X-List-Received-Date: Tue, 24 Nov 2015 15:14:09 -0000

the default gui is now QT so wireshark built with gtk
is wireshark-gtk.

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../wireshark/{wireshark_1.12.8.bb => wireshark_2.0.0.bb}         | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
 rename meta-networking/recipes-support/wireshark/{wireshark_1.12.8.bb => wireshark_2.0.0.bb} (93%)

diff --git a/meta-networking/recipes-support/wireshark/wireshark_1.12.8.bb b/meta-networking/recipes-support/wireshark/wireshark_2.0.0.bb
similarity index 93%
rename from meta-networking/recipes-support/wireshark/wireshark_1.12.8.bb
rename to meta-networking/recipes-support/wireshark/wireshark_2.0.0.bb
index eee9f30..011c6e1 100644
--- a/meta-networking/recipes-support/wireshark/wireshark_1.12.8.bb
+++ b/meta-networking/recipes-support/wireshark/wireshark_2.0.0.bb
@@ -8,10 +8,8 @@ DEPENDS = "perl-native pcre expat glib-2.0 sbc"
 
 SRC_URI = "https://2.na.dl.wireshark.org/src/${BP}.tar.bz2"
 
-PE = "1"
-
-SRC_URI[md5sum] = "988a4595a4a87dafb3c4870ea40e89b5"
-SRC_URI[sha256sum] = "357e0a4e49525d80cdc740bb16539fcdb526ad38cc2ed6cabedafc9bdee5c7e7"
+SRC_URI[md5sum] = "5909af2a09a9a3023ba61bc62e787ad2"
+SRC_URI[sha256sum] = "90026c761a85701d7783c7e2eaa4c1de247dfbadbd53221df355f121e42691dd"
 
 inherit autotools pkgconfig
 
@@ -55,3 +53,5 @@ do_configure_prepend() {
 
 ALLOW_EMPTY_${PN} = "1"
 INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
+
+FILES_${PN} += "${datadir}*"
-- 
2.3.5


