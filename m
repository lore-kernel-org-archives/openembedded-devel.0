Received: from ns0.zlo.nu ([85.17.141.90] helo=mzh.zlo.nu)
	by linuxtogo.org with esmtp (Exim 4.69) (envelope-from <zlo@zlo.nu>)
	id 1NAP3m-0007yS-2U for openembedded-devel@lists.openembedded.org;
	Tue, 17 Nov 2009 15:29:37 +0100
Received: from localhost.localdomain (seven.iphion.nl [80.255.245.169])
	by mzh.zlo.nu (Postfix) with ESMTP id E7293140AE
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Nov 2009 15:24:56 +0100 (CET)
From: Marc Olzheim <zlo@zlo.nu>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 17 Nov 2009 15:24:56 +0100
Message-Id: <1258467896-28370-1-git-send-email-zlo@zlo.nu>
X-Mailer: git-send-email 1.6.3.3
X-SA-Exim-Connect-IP: 85.17.141.90
X-SA-Exim-Mail-From: zlo@zlo.nu
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [PATCH] cURL: Add 7.19.7 which supports CRLs.
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
X-List-Received-Date: Tue, 17 Nov 2009 14:29:37 -0000

From: Marc Olzheim <marc@iphion.nl>

Also remove unused curl checksums for older versions.
---
 conf/checksums.ini          |   32 ++++----------------------------
 recipes/curl/curl_7.19.7.bb |    5 +++++
 2 files changed, 9 insertions(+), 28 deletions(-)
 create mode 100644 recipes/curl/curl_7.19.7.bb

diff --git a/conf/checksums.ini b/conf/checksums.ini
index 8252329..a1f7e40 100644
--- a/conf/checksums.ini
+++ b/conf/checksums.ini
@@ -4698,38 +4698,10 @@ sha256=e7485d6b3dcbd338a2361aff66c516f8dfafc1c81ea5b01396f6ee5f365c4eb3
 md5=90ed7449948994ad1b22b0b177ab6ba6
 sha256=d488980f84ad0e6044a67859144306980624cafb654eb0cab071b3e46fee6e1d
 
-[http://curl.haxx.se/download/curl-7.14.0.tar.bz2]
-md5=46ce665e47d37fce1a0bad935cce58a9
-sha256=72987b68c265c262f073f7a0273f3c2f57dfe8b455da0f92f03914418d86f081
-
-[http://curl.haxx.se/download/curl-7.15.1.tar.bz2]
-md5=d330d48580bfade58c82d4f295f171f0
-sha256=8b1ea75a91ef7d1e00086865eba9a4cf8baefcb212ce451a61348e00b8756324
-
-[http://curl.haxx.se/download/curl-7.16.0.tar.bz2]
-md5=5819f56e93d04cde2992fe88b54cbfad
-sha256=fc8dcda5a933c370c15c832bf1e7316a0690f473fdd6000454d233edaa33bc23
-
-[http://curl.haxx.se/download/curl-7.16.2.tar.bz2]
-md5=37a1de15c4300ca9413d39d2bcea9b36
-sha256=2e833e81d43f6294e5bd0d1776d68bd147bdab31e86c7544dc1462e44db9bfa2
-
-[http://curl.haxx.se/download/curl-7.16.4.tar.bz2]
-md5=ffa6d1f4e28ca493a43f9dc17882c4d8
-sha256=45c69529126b6ff50e7ebe2c2b8157a4ecb405174a1349234903021e9ac5c87b
-
-[http://curl.haxx.se/download/curl-7.18.0.tar.bz2]
-md5=3e50dd887d6a354be312d874e1d3426c
-sha256=300561ef53ee5971b304142d8570a91f879228c2016e74a142fa3421dfcd3672
-
 [http://curl.haxx.se/download/curl-7.18.2.tar.bz2]
 md5=c389be5b0525276e58865956b7465562
 sha256=b1f47a0177a5b13d317ab1f6570510502739909ede550e7da08ba814c3c73ae8
 
-[http://curl.haxx.se/download/curl-7.19.0.tar.bz2]
-md5=c299c5e0f20f633791b4c4f7ced4effe
-sha256=a0e28b019f022942650ffa4bdf46e4c09bd8ec18e6ca5f08ad273668115f51f7
-
 [http://curl.haxx.se/download/curl-7.19.5.tar.bz2]
 md5=426d161661dce70c8ea9ad8f553363a3
 sha256=05ad84a9c8d340917370f357ad9fdce5ea595deb11f4cb70f946fa48c7b02cd0
@@ -4738,6 +4710,10 @@ sha256=05ad84a9c8d340917370f357ad9fdce5ea595deb11f4cb70f946fa48c7b02cd0
 md5=8402c1f654c51ad7287aad57c3aa79be
 sha256=ea88f48c8415f7d3af482e4d241277b2bdbfaffaf285e8001c88c1376cbc1021
 
+[http://curl.haxx.se/download/curl-7.19.7.tar.bz2]
+md5=79a8fbb2eed5464b97bdf94bee109380
+sha256=1a15f94ae3401e3bd6208ce64155c2577815019824bceae7fd3221a12bc54a70
+
 [http://downloads.sourceforge.net/curlftpfs/curlftpfs-0.9.2.tar.gz]
 md5=b452123f755114cd4461d56c648d9f12
 sha256=4eb44739c7078ba0edde177bdd266c4cfb7c621075f47f64c85a06b12b3c6958
diff --git a/recipes/curl/curl_7.19.7.bb b/recipes/curl/curl_7.19.7.bb
new file mode 100644
index 0000000..241c7f7
--- /dev/null
+++ b/recipes/curl/curl_7.19.7.bb
@@ -0,0 +1,5 @@
+require curl-common.inc
+require curl-target.inc
+
+SRC_URI += "file://off_t_abi_fix.patch;patch=1;pnum=0"
+PR = "${INC_PR}"
-- 
1.6.3.3



