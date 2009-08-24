Received: from [207.164.182.72] (helo=smtp.cbnco.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <edoiron@edoiron.ott.cti.com>) id 1Mfg6P-0005it-Fv
	for openembedded-devel@lists.openembedded.org;
	Mon, 24 Aug 2009 22:25:17 +0200
Received: from localhost (localhost [127.0.0.1])
	by smtp.cbnco.com (Postfix) with ESMTP id E3BB65476B2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Aug 2009 16:07:31 -0400 (EDT)
Received: from smtp.cbnco.com ([127.0.0.1])
	by localhost (mail.cbnco.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 16499-03 for <openembedded-devel@lists.openembedded.org>; 
	Mon, 24 Aug 2009 16:07:31 -0400 (EDT)
Received: from edoiron.ott.cti.com (auriga-dmzgw.cbnco.com [207.164.182.65])
	by smtp.cbnco.com (Postfix) with ESMTPS id 5341F548F63
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Aug 2009 16:07:31 -0400 (EDT)
Received: by edoiron.ott.cti.com (Postfix, from userid 1000)
	id BBF4C7CE239; Mon, 24 Aug 2009 11:00:24 -0400 (EDT)
From: Evan Doiron <edoiron@cbnco.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 24 Aug 2009 11:00:24 -0400
Message-Id: <1251126024-5516-1-git-send-email-edoiron@cbnco.com>
X-Mailer: git-send-email 1.6.0.2
X-Virus-Scanned: amavisd-new at cbnco.com
Cc: Evan Doiron <edoiron@cbnco.com>
Subject: [PATCH] dmidecode: add v2.10
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
X-List-Received-Date: Mon, 24 Aug 2009 20:25:20 -0000

Signed-off-by: Evan Doiron <edoiron@cbnco.com>
---
 conf/checksums.ini                                 |    4 ++++
 .../{dmidecode_2.9.bb => dmidecode_2.10.bb}        |    9 +--------
 2 files changed, 5 insertions(+), 8 deletions(-)
 copy recipes/dmidecode/{dmidecode_2.9.bb => dmidecode_2.10.bb} (61%)

diff --git a/conf/checksums.ini b/conf/checksums.ini
index 85de9c2..2c85594 100644
--- a/conf/checksums.ini
+++ b/conf/checksums.ini
@@ -4982,6 +4982,10 @@ sha256=f1a6dea51be9798903a0543fb50f463b0594b1f11b897bc50e40825fb7527c61
 md5=f92e5606c23a8092f3d5694e8d1c932e
 sha256=d3be5c6eec24950cb3bd67dbfbcdf036f1278fae5fd78655ef8cdf9e911e428a
 
+[http://savannah.nongnu.org/download/dmidecode/dmidecode-2.10.tar.bz2]
+md5=3c9c4d55a40b78600f3b43bfa64616f9
+sha256=4d74a3e93353320317a424816f9a045df06d9ed4b5b80881e16fdfcc74c9e2c0
+
 [http://savannah.nongnu.org/download/dmidecode/dmidecode-2.9.tar.bz2]
 md5=3dac4b1817012ffebd78671473d8f56c
 sha256=888eb2c25bdcef5ee34c38cd5cb0f491d7dd82029dc0f4ae96183a0088a5e015
diff --git a/recipes/dmidecode/dmidecode_2.9.bb b/recipes/dmidecode/dmidecode_2.10.bb
similarity index 61%
copy from recipes/dmidecode/dmidecode_2.9.bb
copy to recipes/dmidecode/dmidecode_2.10.bb
index 2186120..d3a646d 100644
--- a/recipes/dmidecode/dmidecode_2.9.bb
+++ b/recipes/dmidecode/dmidecode_2.10.bb
@@ -5,14 +5,7 @@ PR = "r0"
 
 SRC_URI = "http://savannah.nongnu.org/download/dmidecode/${P}.tar.bz2"
 
-COMPATIBLE_HOST = "i.86.*-linux"
-
-do_unpack_extra() {
-	sed -i \
-	    -e '/^prefix/s:/usr/local:/usr:' \
-	    Makefile
-}
-addtask unpack_extra after do_unpack before do_patch
+COMPATIBLE_HOST = "(i.86|x86_64).*-linux"
 
 do_install() {
 	oe_runmake DESTDIR="${D}" install
-- 
1.6.0.2



