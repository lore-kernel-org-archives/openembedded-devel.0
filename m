Received: from bsmtp5.bon.at ([195.3.86.187] helo=bsmtp.bon.at)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <pgsellmann@portner-elektronik.at>)
	id 1Pz5ky-0000kR-Kh for openembedded-devel@lists.openembedded.org;
	Mon, 14 Mar 2011 12:16:12 +0100
Received: from aspire.localdomain (unknown [88.116.171.82])
	by bsmtp.bon.at (Postfix) with ESMTP id 89A6B130059
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Mar 2011 12:14:26 +0100 (CET)
From: Peter Gsellmann <pgsellmann@portner-elektronik.at>
Organization: PORTNER Elektronik
To: openembedded-devel@lists.openembedded.org
Date: Mon, 14 Mar 2011 12:14:25 +0100
User-Agent: KMail/1.13.5 (Linux/2.6.32.26-175.fc12.x86_64; KDE/4.4.5; x86_64; ;
	)
References: <201103111138.38493.pgsellmann@portner-elektronik.at>
	<1299846315.4137.48.camel@mattotaupa>
In-Reply-To: <1299846315.4137.48.camel@mattotaupa>
MIME-Version: 1.0
Message-Id: <201103141214.25918.pgsellmann@portner-elektronik.at>
Subject: Re: [PATCH] gsoap_2.7.13 build errors, amendment
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
X-List-Received-Date: Mon, 14 Mar 2011 11:16:12 -0000
Content-Type: Text/Plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit

[amendment to d641ae6bfd4303508c86db9285c2dcba28fb5474]
recipes reformatted, removed tab characters

Signed-off-by: Peter Gsellmann <pgsellmann@portner-elektronik.at>
---
 recipes/gsoap/gsoap-native_2.7.13.bb |    3 +--
 recipes/gsoap/gsoap_2.7.13.inc       |    8 ++++----
 2 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/recipes/gsoap/gsoap-native_2.7.13.bb b/recipes/gsoap/gsoap-native_2.7.13.bb
index 83c2329..cc323cb 100644
--- a/recipes/gsoap/gsoap-native_2.7.13.bb
+++ b/recipes/gsoap/gsoap-native_2.7.13.bb
@@ -6,9 +6,8 @@ EXTRA_OEMAKE = ""
 
 inherit native
 
-
 do_install() {
-	install -m 0755 ${S}/gsoap/src/soapcpp2 ${STAGING_BINDIR_NATIVE}/
+    install -m 0755 ${S}/gsoap/src/soapcpp2 ${STAGING_BINDIR_NATIVE}/
 }
 
 
diff --git a/recipes/gsoap/gsoap_2.7.13.inc b/recipes/gsoap/gsoap_2.7.13.inc
index c3ab3c4..3771486 100644
--- a/recipes/gsoap/gsoap_2.7.13.inc
+++ b/recipes/gsoap/gsoap_2.7.13.inc
@@ -3,9 +3,10 @@ for the development of SOAP Web Services and clients."
 SECTION = "devel"
 LICENSE = "GPL"
 
-SRC_URI = "${SOURCEFORGE_MIRROR}/gsoap2/gsoap_${PV}.tar.gz	\
-	file://gsoap-2.7-openssl.patch	\
-	file://unused_args.patch"
+SRC_URI = "${SOURCEFORGE_MIRROR}/gsoap2/gsoap_${PV}.tar.gz \
+        file://gsoap-2.7-openssl.patch \
+        file://unused_args.patch \
+        "
 
 inherit autotools
 
@@ -14,4 +15,3 @@ S = "${WORKDIR}/gsoap-2.7"
 PARALLEL_MAKE = ""
 
 EXTRA_OEMAKE = "SOAP=${STAGING_BINDIR_NATIVE}/soapcpp2"
-
-- 
1.7.2.3



