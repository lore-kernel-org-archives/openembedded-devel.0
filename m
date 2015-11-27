Return-Path: <akuster808@gmail.com>
Received: from mail-ob0-f175.google.com (mail-ob0-f175.google.com
	[209.85.214.175])
	by mail.openembedded.org (Postfix) with ESMTP id 5E92560620
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Nov 2015 06:03:34 +0000 (UTC)
Received: by obbnk6 with SMTP id nk6so75662761obb.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Nov 2015 22:03:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=ZZOZ1lzAHfBk3dp8iGu+oCS30t5Xl5ijsPEHkXAmtoU=;
	b=C5GzhBqJneSaa987bD16ec1o1S2Z/WFYjeEP6CiBpFaif+kt/9YLgGEV9cpg4dGOrf
	D0nj28rhLqB3zM1tIMPhsxp6AusMPT80gbgheCOCWtAFzajYn4j1TN8l2RlqVhRRGkEo
	Xu1jJunSEsEQWy1aUv3orzUqoP+ugE2lO12r73MrWJz7hV137dcMgUXgdyIJT+wUKvjK
	6Iriyc/uL6uQK8+5LRZz8Pz9EqMuaDX72Zm4yvfAIevx58GvovJAWyWq0wBb6/5053+E
	Q2MeXIbkT9NTCelv1j3KI3bfSB0d12bZU+CgNHUp9cSFsYIcHNUqYkUDjt8b3TOn5wkO
	nc+w==
X-Received: by 10.60.232.42 with SMTP id tl10mr33238576oec.29.1448604215504;
	Thu, 26 Nov 2015 22:03:35 -0800 (PST)
Received: from localhost.localdomain (75-163-220-91.clsp.qwest.net.
	[75.163.220.91])
	by smtp.gmail.com with ESMTPSA id p3sm14561348oei.9.2015.11.26.22.03.33
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 26 Nov 2015 22:03:33 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org,
	joe_macdonald@mentor.com
Date: Thu, 26 Nov 2015 22:03:29 -0800
Message-Id: <1448604209-8638-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.3.5
Subject: [meta-networking][PATCH v2] wireshark: update to version 2.0.0
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
X-List-Received-Date: Fri, 27 Nov 2015 06:03:38 -0000

updated comments:

QT is the new default GUI for the binary 'wireshark'. This mode is currently disabled in the build.  We build with GTK as the default gui so the resulting binary is now wireshark-gtk.

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


