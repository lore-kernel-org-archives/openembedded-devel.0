Received: from smtp.cbnco.com ([207.164.182.72])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <michael@sles10-64.jrz.cbn>) id 1PBWC5-0005yP-Po
	for openembedded-devel@lists.openembedded.org;
	Thu, 28 Oct 2010 19:23:19 +0200
Received: from localhost (localhost [127.0.0.1])
	by smtp.cbnco.com (Postfix) with ESMTP id B67138CF1A3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Oct 2010 13:22:34 -0400 (EDT)
Received: from smtp.cbnco.com ([127.0.0.1])
	by localhost (mail.cbnco.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 31332-02 for <openembedded-devel@lists.openembedded.org>; 
	Thu, 28 Oct 2010 13:22:34 -0400 (EDT)
Received: by smtp.cbnco.com (Postfix, from userid 1003)
	id 8510375FAE7; Thu, 28 Oct 2010 13:22:34 -0400 (EDT)
Received: from sles10-64.jrz.cbn (auriga-dmzgw.cbnco.com [207.164.182.65])
	by smtp.cbnco.com (Postfix) with ESMTP id B8E698CA1BA
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Oct 2010 13:22:31 -0400 (EDT)
Received: by sles10-64.jrz.cbn (Postfix, from userid 1001)
	id 98BED5000E6; Thu, 28 Oct 2010 13:22:31 -0400 (EDT)
From: Michael Smith <msmith@cbnco.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 28 Oct 2010 13:22:31 -0400
Message-Id: <1288286551-4700-1-git-send-email-msmith@cbnco.com>
X-Mailer: git-send-email 1.7.0.4
X-Virus-Scanned: amavisd-new at cbnco.com
X-SA-Exim-Connect-IP: 207.164.182.72
X-SA-Exim-Mail-From: michael@sles10-64.jrz.cbn
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.6 required=5.0 tests=AWL, BAYES_00, NO_DNS_FOR_FROM,
	SPF_HELO_PASS autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] curl: make CURL_FEATURES configurable again
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
X-List-Received-Date: Thu, 28 Oct 2010 17:23:20 -0000

Lock down CURL_FEATURES for virtclass-native, but make CURL_FEATURES
for target a weak assignment.

Signed-off-by: Michael Smith <msmith@cbnco.com>
---
 recipes/curl/curl-common.inc |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/recipes/curl/curl-common.inc b/recipes/curl/curl-common.inc
index ddaebb8..8ffefeb 100644
--- a/recipes/curl/curl-common.inc
+++ b/recipes/curl/curl-common.inc
@@ -6,9 +6,10 @@ SRC_URI = "http://curl.haxx.se/download/curl-${PV}.tar.bz2;name=tarball \
            file://pkgconfig_fix.patch"
 S = "${WORKDIR}/curl-${PV}"
 
-INC_PR = "r4"
+INC_PR = "r5"
 
-CURL_FEATURES = ${@['zlib,cookies,crypto-auth,dict,file,ftp,http,telnet,tftp','zlib,gnutls,cookies,crypto-auth,dict,file,ftp,http,telnet,tftp']["${BPN}" == "${PN}"]}
+CURL_FEATURES ?= "zlib,gnutls,cookies,crypto-auth,dict,file,ftp,http,telnet,tftp"
+CURL_FEATURES_virtclass-native = "zlib,cookies,crypto-auth,dict,file,ftp,http,telnet,tftp"
 # other allowed features: ipv6, ares, openssl
 
 inherit autotools pkgconfig binconfig
-- 
1.7.0.4



