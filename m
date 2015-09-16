Return-Path: <joshua.lock@collabora.co.uk>
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [93.93.135.160])
	by mail.openembedded.org (Postfix) with ESMTP id 04EE660053
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Sep 2015 15:32:42 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: joshuagl) with ESMTPSA id 8727A3C88791
From: Joshua Lock <joshua.lock@collabora.co.uk>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 16 Sep 2015 16:32:38 +0100
Message-Id: <1442417558-14484-1-git-send-email-joshua.lock@collabora.co.uk>
X-Mailer: git-send-email 2.1.4
Subject: [meta-oe][master][fido][PATCH] gsoap: fix DEPENDS to prevent link failure for gsoap-native
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
X-List-Received-Date: Wed, 16 Sep 2015 15:32:43 -0000

With a fairly high number of threads I can reliably trigger the
following linker failure in gsoap-native:

| /usr/bin/ld: cannot find -ly
| collect2: error: ld returned 1 exit status
| Makefile:402: recipe for target 'soapcpp2' failed

Change the DEPENDS to include bison and let the BBCLASSEXTENDS
machinery fix DEPENDS for -native and -target variants, only
additonally adding gsoap-native to the DEPENDS for the target
recipe.

Signed-off-by: Joshua Lock <joshua.lock@collabora.co.uk>
---
 meta-oe/recipes-support/gsoap/gsoap_2.8.12.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/gsoap/gsoap_2.8.12.bb b/meta-oe/recipes-support/gsoap/gsoap_2.8.12.bb
index b5c3995..6da08ac 100644
--- a/meta-oe/recipes-support/gsoap/gsoap_2.8.12.bb
+++ b/meta-oe/recipes-support/gsoap/gsoap_2.8.12.bb
@@ -20,8 +20,8 @@ PARALLEL_MAKE = ""
 
 EXTRA_OEMAKE_class-target = "SOAP=${STAGING_BINDIR_NATIVE}/soapcpp2"
 
-DEPENDS_class-target = "gsoap-native openssl zlib"
-DEPENDS_class-native = "flex-native"
+DEPENDS = "openssl zlib flex bison"
+DEPENDS_append_class-target = " gsoap-native"
 
 do_install_append() {
     install -d ${D}${libdir}
-- 
2.1.4


