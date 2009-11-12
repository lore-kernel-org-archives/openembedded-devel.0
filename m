Received: from [199.185.220.240] (helo=defout.telus.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <dfoley@techsol.ca>) id 1N8WAI-0002XN-3B
	for openembedded-devel@lists.openembedded.org;
	Thu, 12 Nov 2009 10:40:33 +0100
Received: from edmwaa01.telusplanet.net ([75.157.10.192])
	by priv-edmwes50.telusplanet.net
	(InterMail vM.7.08.04.00 201-2186-134-20080326) with ESMTP id
	<20091112061217.TUKP16817.priv-edmwes50.telusplanet.net@edmwaa01.telusplanet.net>
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Nov 2009 23:12:17 -0700
Received: from [192.168.0.40] (d75-157-10-192.bchsia.telus.net [75.157.10.192])
	by edmwaa01.telusplanet.net (BorderWare Security Platform) with ESMTP
	id 384D0264EBB87C71 for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Nov 2009 23:12:17 -0700 (MST)
Message-ID: <4AFBA741.6090207@techsol.ca>
Date: Wed, 11 Nov 2009 22:12:17 -0800
From: Dallas Foley <dfoley@techsol.ca>
User-Agent: Thunderbird 2.0.0.23 (X11/20090817)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 199.185.220.240
X-SA-Exim-Mail-From: dfoley@techsol.ca
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: curl-native doesn't install includes
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
X-List-Received-Date: Thu, 12 Nov 2009 09:40:33 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Pretty sure curl-native doesn't install it's includes, because from a clean 
build opkg-native cant' find curl includes.

$ git show-ref org.openembedded.dev
0462985d8af5e8d2a71f548abe29c6e3bbaa2d2a refs/heads/org.openembedded.dev

I'm not really sure if this patch is correct, but seems to work.

diff --git a/recipes/curl/curl-common.inc b/recipes/curl/curl-common.inc
index 4af85ba..601e620 100644
--- a/recipes/curl/curl-common.inc
+++ b/recipes/curl/curl-common.inc
@@ -6,7 +6,7 @@ SRC_URI = "http://curl.haxx.se/download/curl-${PV}.tar.bz2 \
             file://pkgconfig_fix.patch;patch=1"
  S = "${WORKDIR}/curl-${PV}"

-INC_PR = "r2"
+INC_PR = "r3"

  CURL_FEATURES ?= "zlib,gnutls,cookies,crypto-auth,dict,file,ftp,http,telnet,tftp"
  # other allowed features: ipv6, ares, openssl
diff --git a/recipes/curl/curl-native_7.19.6.bb 
b/recipes/curl/curl-native_7.19.6.bb
index b201530..392476b 100644
--- a/recipes/curl/curl-native_7.19.6.bb
+++ b/recipes/curl/curl-native_7.19.6.bb
@@ -4,11 +4,3 @@ DEPENDS = "zlib-native"
  PR = "${INC_PR}.2"

  CURL_FEATURES = "zlib,cookies,crypto-auth,dict,file,ftp,http,telnet,tftp"
-
-do_stage () {
-       autotools_stage_all
-}
-
-do_install() {
-       :
-}




-- 
~~~~~~~~~~~~~~~~~~~~~~~~
       Dallas Foley
        Engineering

Technical Solutions Inc.
7787 Progress Way
Delta, BC Canada V4G 1A3
http://www.medallionsystem.com
email: dfoley@techsol.ca
Tel: 604 946 TECH (8324)
Fax: 604 946 6445
~~~~~~~~~~~~~~~~~~~~~~~~



