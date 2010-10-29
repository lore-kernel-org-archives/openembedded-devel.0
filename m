Received: from smtp.cbnco.com ([207.164.182.72])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <michael@sles10-64.jrz.cbn>) id 1PBqTr-00015M-La
	for openembedded-devel@lists.openembedded.org;
	Fri, 29 Oct 2010 17:03:01 +0200
Received: from localhost (localhost [127.0.0.1])
	by smtp.cbnco.com (Postfix) with ESMTP id EF4068DD1B0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 Oct 2010 11:02:15 -0400 (EDT)
Received: from smtp.cbnco.com ([127.0.0.1])
	by localhost (mail.cbnco.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 13922-05 for <openembedded-devel@lists.openembedded.org>; 
	Fri, 29 Oct 2010 11:02:15 -0400 (EDT)
Received: by smtp.cbnco.com (Postfix, from userid 1003)
	id BC6038DD1BE; Fri, 29 Oct 2010 11:02:15 -0400 (EDT)
Received: from sles10-64.jrz.cbn (auriga-dmzgw.cbnco.com [207.164.182.65])
	by smtp.cbnco.com (Postfix) with ESMTP id A1DFD8DCE80
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 Oct 2010 11:02:12 -0400 (EDT)
Received: by sles10-64.jrz.cbn (Postfix, from userid 1001)
	id 82A6B5000E6; Fri, 29 Oct 2010 11:02:12 -0400 (EDT)
From: Michael Smith <msmith@cbnco.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 29 Oct 2010 11:02:12 -0400
Message-Id: <1288364532-6535-1-git-send-email-msmith@cbnco.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1288286551-4700-1-git-send-email-msmith@cbnco.com>
References: <1288286551-4700-1-git-send-email-msmith@cbnco.com>
X-Virus-Scanned: amavisd-new at cbnco.com
X-SA-Exim-Connect-IP: 207.164.182.72
X-SA-Exim-Mail-From: michael@sles10-64.jrz.cbn
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.6 required=5.0 tests=AWL, BAYES_00, NO_DNS_FOR_FROM,
	SPF_HELO_PASS autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH v2] curl: remove anon python block
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
X-List-Received-Date: Fri, 29 Oct 2010 15:03:01 -0000

Remove the anonymous Python block that was parsing CURL_FEATURES.
Configurability of CURL_FEATURES was removed in bf2f44fc.
Distros or overlays that want control (e.g. to use openssl instead of
gnutls) can override variables in a recipe amend.

Signed-off-by: Michael Smith <msmith@cbnco.com>
---
 recipes/curl/curl-common.inc |   98 +++++++++++++++++++++--------------------
 1 files changed, 50 insertions(+), 48 deletions(-)

diff --git a/recipes/curl/curl-common.inc b/recipes/curl/curl-common.inc
index ddaebb8..fd5638f 100644
--- a/recipes/curl/curl-common.inc
+++ b/recipes/curl/curl-common.inc
@@ -6,58 +6,60 @@ SRC_URI = "http://curl.haxx.se/download/curl-${PV}.tar.bz2;name=tarball \
            file://pkgconfig_fix.patch"
 S = "${WORKDIR}/curl-${PV}"
 
-INC_PR = "r4"
-
-CURL_FEATURES = ${@['zlib,cookies,crypto-auth,dict,file,ftp,http,telnet,tftp','zlib,gnutls,cookies,crypto-auth,dict,file,ftp,http,telnet,tftp']["${BPN}" == "${PN}"]}
-# other allowed features: ipv6, ares, openssl
+INC_PR = "r5"
 
 inherit autotools pkgconfig binconfig
 
-EXTRA_OECONF = " \
-                --without-libssh2 \
-		--with-random=/dev/urandom \
-		--without-libidn \
-		"
-
-python __anonymous() {
-	f = bb.data.getVar("CURL_FEATURES", d, True).split(",")
-        oeconf = bb.data.getVar("EXTRA_OECONF", d, False)
-        deps = bb.data.getVar("DEPENDS", d, False).split()
-        pn = bb.data.getVar("PN", d, True)
-        if "native" in pn:
-                native = "-native"
-        else:
-                native = ""
-        for x in [ 'cookies', 'crypto-auth', 'dict', 'file', 'ftp', 'http', 'telnet', 'tftp', 'ipv6' ]:
-                if x in f:
-                        oeconf += " --enable-%s" % x
-                else:
-                        oeconf += " --disable-%s" % x
-        if 'zlib' in f:
-                oeconf += " --with-zlib=${STAGING_LIBDIR}/../"
-                deps.append("zlib" + native)
-        else:
-                oeconf += " --without-zlib"
-        if 'gnutls' in f:
-                oeconf += " --with-gnutls=${STAGING_BINDIR_CROSS}"
-                deps.append("gnutls" + native)
-        else:
-                oeconf += " --without-gnutls"
-        if 'openssl' in f:
-                oeconf += " --with-ssl=${STAGING_LIBDIR}/../"
-                deps.append("openssl" + native)
-        else:
-                oeconf += " --without-ssl"
-        if 'ares' in f:
-                oeconf += " --enable-ares"
-                deps.append("c-ares" + native)
-        else:
-                oeconf += " --disable-ares"
-        bb.data.setVar('EXTRA_OECONF', oeconf, d)
-        bb.data.setVar('DEPENDS', " ".join(deps), d)
-}
+# Historically the curl recipe had configurable CURL_FEATURES. Distros
+# that want to control features may override the CURL_DEPENDS_* and
+# CURL_CONF_* variables in an amend.inc.
+
+CURL_DEPENDS_TLS_GNUTLS = "gnutls"
+CURL_DEPENDS_TLS_OPENSSL = "openssl"
+CURL_DEPENDS_TLS = "${CURL_DEPENDS_TLS_GNUTLS}"
+
+CURL_DEPENDS_ARES_YES = "c-ares"
+CURL_DEPENDS_ARES = ""
+
+CURL_DEPENDS_BASE = "zlib ${CURL_DEPENDS_ARES}"
+
+# Don't use gnutls in native build
+DEPENDS = "${CURL_DEPENDS_BASE} ${CURL_DEPENDS_TLS}"
+DEPENDS_virtclass-native = "${CURL_DEPENDS_BASE}"
+
+
+CURL_CONF_FEATURES_BASE = "--enable-cookies --enable-crypto-auth --enable-ftp"
+CURL_CONF_FEATURES_BLOAT = "--enable-dict --enable-telnet --enable-tftp"
+
+CURL_CONF_ZLIB = "--with-zlib=${STAGING_LIBDIR}/../"
+
+CURL_CONF_TLS_GNUTLS = "--without-ssl --with-gnutls=${STAGING_BINDIR_CROSS}"
+CURL_CONF_TLS_OPENSSL = "--without-gnutls --with-ssl=${STAGING_LIBDIR}/../"
+CURL_CONF_TLS = "${CURL_CONF_TLS_GNUTLS}"
+
+CURL_CONF_IPV6 = "${@base_contains('DISTRO_FEATURES', 'ipv6', \
+			'--enable-ipv6', '--disable-ipv6', d)}"
+
+CURL_CONF_ARES = "--disable-ares"
+
+CURL_CONF_BASE = " \
+	--without-libssh2 \
+	--with-random=/dev/urandom \
+	--without-libidn \
+	--enable-file \
+	--enable-http \
+	${CURL_CONF_FEATURES_BASE} \
+	${CURL_CONF_FEATURES_BLOAT} \
+	${CURL_CONF_ZLIB} \
+	${CURL_CONF_IPV6} \
+	${CURL_CONF_ARES} \
+"
+
+EXTRA_OECONF = "${CURL_CONF_BASE} ${CURL_CONF_TLS}"
+EXTRA_OECONF_virtclass-native = " \
+	${CURL_CONF_BASE} --without-gnutls --without-ssl \
+"
 
 do_configure_prepend() {
 	sed -i s:OPT_GNUTLS/bin:OPT_GNUTLS:g configure.ac
 }
-
-- 
1.7.0.4



