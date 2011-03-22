Received: from familie-heinold.de
	([85.214.48.103] helo=mail.familie-heinold.de ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <heinold@inf.fu-berlin.de>) id 1Q1wj5-0006at-2x
	for openembedded-devel@lists.openembedded.org;
	Tue, 22 Mar 2011 09:14:03 +0100
Received: from mail.familie-heinold.de (h873313.serverkompetenz.net
	[127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 9BDDC11000B2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Mar 2011 09:03:06 +0100 (CET)
Received: from mail.familie-heinold.de (h873313.serverkompetenz.net
	[127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id B9CCE110022E
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Mar 2011 09:03:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	h873313.serverkompetenz.net
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=ham version=3.3.1
Received: from rhein.familie-heinold.de (g225144151.adsl.alicedsl.de
	[92.225.144.151]) by mail.familie-heinold.de (Postfix) with ESMTPA
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Mar 2011 09:02:55 +0100 (CET)
Received: by rhein.familie-heinold.de (Postfix, from userid 1000)
	id 1D0603C0C8; Tue, 22 Mar 2011 09:02:01 +0100 (CET)
From: heinold@inf.fu-berlin.de
To: openembedded-devel@lists.openembedded.org
Date: Tue, 22 Mar 2011 09:01:49 +0100
Message-Id: <1300780910-28866-3-git-send-email-heinold@inf.fu-berlin.de>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <1300780910-28866-1-git-send-email-heinold@inf.fu-berlin.de>
References: <1300780910-28866-1-git-send-email-heinold@inf.fu-berlin.de>
X-Virus-Scanned: ClamAV using ClamSMTP
Subject: [PATCH 2/3] cairo.inc: let arm, mips and ppc depend on libatomic-ops
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
X-List-Received-Date: Tue, 22 Mar 2011 08:14:03 -0000

From: Henning Heinold <heinold@inf.fu-berlin.de>


Signed-off-by: Henning Heinold <heinold@inf.fu-berlin.de>
---
 recipes/cairo/cairo.inc |    9 ++++++++-
 1 files changed, 8 insertions(+), 1 deletions(-)

diff --git a/recipes/cairo/cairo.inc b/recipes/cairo/cairo.inc
index c60d7d9..fad50b3 100644
--- a/recipes/cairo/cairo.inc
+++ b/recipes/cairo/cairo.inc
@@ -1,15 +1,22 @@
 SECTION = "libs"
 PRIORITY = "optional"
-DEPENDS = "virtual/libx11 pixman libsm libpng fontconfig libxrender glib-2.0"
 DESCRIPTION = "Cairo graphics library"
 LICENSE = "MPL LGPL"
 
+DEPENDS = "virtual/libx11 pixman libsm libpng fontconfig libxrender glib-2.0"
+
+DEPENDS_append_arm = " libatomic-ops"
+DEPENDS_append_mips = " libatomic-ops"
+DEPENDS_append_mipsel = " libatomic-ops"
+DEPENDS_append_ppc = " libatomic-ops"
+
 #check for TARGET_FPU=soft and inform configure of the result so it can disable some floating points 
 require cairo-fpu.inc
 EXTRA_OECONF += "${@get_cairo_fpu_setting(bb, d)}"
 
 inherit autotools pkgconfig 
 
+
 PACKAGES =+ "cairo-trace cairo-trace-dev libcairo-script-interpreter libcairo-gobject"
 FILES_libcairo-gobject = "${libdir}/libcairo-gobject.so.*"
 FILES_libcairo-script-interpreter = "${libdir}/libcairo-script-interpreter.so.*"
-- 
1.7.4.1


