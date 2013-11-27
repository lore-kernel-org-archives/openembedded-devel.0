Return-Path: <nickdademo@gmail.com>
Received: from mail-pd0-f174.google.com (mail-pd0-f174.google.com
	[209.85.192.174])
	by mail.openembedded.org (Postfix) with ESMTP id 70BB76D586
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Nov 2013 10:30:27 +0000 (UTC)
Received: by mail-pd0-f174.google.com with SMTP id y13so9639070pdi.19
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Nov 2013 02:30:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=mGQ8VyW3dq9CzQr+NNIErpEnV1a2J7mwgvcvLe2l8bA=;
	b=af57Sd/+JqgiSBMe3AwRJbfdnXXG2xUGQlhlKVCZnjikSpOsiB+oK3kaiNky3ty6tR
	TAfpMU6KUyc5p4cE+kOXUSoCE1WHScnedVkas9IMzM6JcsHFLoIjvVN5EtsGH0r4vErM
	PF8fx41ODp5jixvlTzLWFZPRL6KPgCUR8I5RK4NIOqkHqwSl2LVA23t1o+vUmuUcOQu2
	feidizVKUX4bpcjsy6EQMbbFY05ef8FAkPADtuUPb5ma7uGaolAIUqAWkel6QD0Qw8OK
	l5XkhXraDu0DCBjtHOnDCz188NX5HhWeft8iGahfJAEI4gCLiTWcmO7DNK9cQncWAKyM
	yiMg==
X-Received: by 10.66.162.195 with SMTP id yc3mr40332073pab.64.1385548227217;
	Wed, 27 Nov 2013 02:30:27 -0800 (PST)
Received: from localhost.localdomain
	(d110-32-96-161.meb801.vic.optusnet.com.au. [110.32.96.161])
	by mx.google.com with ESMTPSA id xe9sm98437295pab.0.2013.11.27.02.30.25
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 27 Nov 2013 02:30:26 -0800 (PST)
From: Nick D'Ademo <nickdademo@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 27 Nov 2013 21:29:42 +1100
Message-Id: <1385548182-6355-1-git-send-email-nickdademo@gmail.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [meta-oe][PATCH] tk: make multilib build compatible and fix library install
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
X-List-Received-Date: Wed, 27 Nov 2013 10:30:27 -0000

Pass libdir to EXTRA_OECONF so that recipe generates the correct library folder in a multilib build.

Install shared library symbolic link to image.

Signed-off-by: Nick D'Ademo <nickdademo@gmail.com>
---
 meta-oe/recipes-devtools/tcltk/tk_8.6.0.bb |   17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-devtools/tcltk/tk_8.6.0.bb b/meta-oe/recipes-devtools/tcltk/tk_8.6.0.bb
index b76f58f..e999522 100644
--- a/meta-oe/recipes-devtools/tcltk/tk_8.6.0.bb
+++ b/meta-oe/recipes-devtools/tcltk/tk_8.6.0.bb
@@ -24,18 +24,31 @@ EXTRA_OECONF = "\
     --enable-threads \
     --with-x \
     --with-tcl=${STAGING_BINDIR_CROSS} \
+    --libdir=${libdir} \
 "
 
 do_install_append() {
-    mv libtk8.6.so libtk8.6.so.0
+    ln -sf libtk8.6.so ${D}${libdir}/libtk8.6.so.0
     oe_libinstall -so libtk8.6 ${D}${libdir}
     ln -sf wish8.6 ${D}${bindir}/wish
+	
+    # Even after passing libdir=${libdir} at config, some incorrect dirs are still generated for the multilib build
+    if [ "$libdir" != "/usr/lib" ]; then
+        # Move files to correct library directory
+        mv ${D}/usr/lib/tk8.6/* ${D}/${libdir}/tk8.6/
+        # Remove unneeded/incorrect dir ('usr/lib/')
+        rm -rf ${D}/usr/lib
+    fi
 }
 
 PACKAGES =+ "${PN}-lib"
 
-FILES_${PN}-lib = "${libdir}/libtk8.6.so.*"
+FILES_${PN}-lib = "${libdir}/libtk8.6.so*"
 FILES_${PN} += "${libdir}/tk*"
 
+# isn't getting picked up by shlibs code
+RDEPENDS_${PN} += "tk-lib"
+RDEPENDS_${PN}_class-native = ""
+
 BINCONFIG_GLOB = "*Config.sh"
 BBCLASSEXTEND = "native"
-- 
1.7.9.5


