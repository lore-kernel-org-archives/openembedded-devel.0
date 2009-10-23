Received: from [207.164.182.72] (helo=smtp.cbnco.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <michael@sles10-64.ott.cti.com>) id 1N1Pal-0004M0-Eq
	for openembedded-devel@lists.openembedded.org;
	Fri, 23 Oct 2009 21:14:30 +0200
Received: from localhost (localhost [127.0.0.1])
	by smtp.cbnco.com (Postfix) with ESMTP id B4DB35A8613;
	Fri, 23 Oct 2009 15:13:25 -0400 (EDT)
Received: from smtp.cbnco.com ([127.0.0.1])
	by localhost (mail.cbnco.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 13671-04; Fri, 23 Oct 2009 15:13:25 -0400 (EDT)
Received: by smtp.cbnco.com (Postfix, from userid 1003)
	id 654985A8611; Fri, 23 Oct 2009 15:13:25 -0400 (EDT)
Received: from sles10-64.ott.cti.com (auriga-dmzgw.cbnco.com [207.164.182.65])
	by smtp.cbnco.com (Postfix) with ESMTP id 8F3ED5A8603;
	Fri, 23 Oct 2009 15:13:23 -0400 (EDT)
Received: by sles10-64.ott.cti.com (Postfix, from userid 1000)
	id 7950C40AA2; Fri, 23 Oct 2009 15:13:23 -0400 (EDT)
From: Michael Smith <msmith@cbnco.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 23 Oct 2009 15:13:21 -0400
Message-Id: <1256325202-8516-1-git-send-email-msmith@cbnco.com>
X-Mailer: git-send-email 1.6.3
X-Virus-Scanned: amavisd-new at cbnco.com
X-SA-Exim-Connect-IP: 207.164.182.72
X-SA-Exim-Mail-From: michael@sles10-64.ott.cti.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [PATCH 1/2] curl, curl-native: add 7.19.6
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
X-List-Received-Date: Fri, 23 Oct 2009 19:14:30 -0000

Signed-off-by: Michael Smith <msmith@cbnco.com>
---

format-patch doesn't recognize the copies with 1-line changes, so:

curl-native 7.18.2 and 7.19.6 recipes are identical other than PR.

curl 7.19.5 and 7.19.6 recipes are identical except .6 no longer needs
curl-add_all_algorithms.patch.

 conf/checksums.ini                 |    4 ++++
 recipes/curl/curl-native_7.19.6.bb |   11 +++++++++++
 recipes/curl/curl_7.19.6.bb        |    4 ++++
 3 files changed, 19 insertions(+), 0 deletions(-)
 create mode 100644 recipes/curl/curl-native_7.19.6.bb
 create mode 100644 recipes/curl/curl_7.19.6.bb

diff --git a/conf/checksums.ini b/conf/checksums.ini
index f91cd4e..14dfd57 100644
--- a/conf/checksums.ini
+++ b/conf/checksums.ini
@@ -4606,6 +4606,10 @@ sha256=a0e28b019f022942650ffa4bdf46e4c09bd8ec18e6ca5f08ad273668115f51f7
 md5=426d161661dce70c8ea9ad8f553363a3
 sha256=05ad84a9c8d340917370f357ad9fdce5ea595deb11f4cb70f946fa48c7b02cd0
 
+[http://curl.haxx.se/download/curl-7.19.6.tar.bz2]
+md5=8402c1f654c51ad7287aad57c3aa79be
+sha256=ea88f48c8415f7d3af482e4d241277b2bdbfaffaf285e8001c88c1376cbc1021
+
 [http://downloads.sourceforge.net/curlftpfs/curlftpfs-0.9.2.tar.gz]
 md5=b452123f755114cd4461d56c648d9f12
 sha256=4eb44739c7078ba0edde177bdd266c4cfb7c621075f47f64c85a06b12b3c6958
diff --git a/recipes/curl/curl-native_7.19.6.bb b/recipes/curl/curl-native_7.19.6.bb
new file mode 100644
index 0000000..2f49ad1
--- /dev/null
+++ b/recipes/curl/curl-native_7.19.6.bb
@@ -0,0 +1,11 @@
+require curl-common.inc
+inherit native
+DEPENDS = "zlib-native"
+
+do_stage () {
+	autotools_stage_all
+}
+
+do_install() {
+	:
+}
diff --git a/recipes/curl/curl_7.19.6.bb b/recipes/curl/curl_7.19.6.bb
new file mode 100644
index 0000000..d5ca1bb
--- /dev/null
+++ b/recipes/curl/curl_7.19.6.bb
@@ -0,0 +1,4 @@
+require curl-common.inc
+require curl-target.inc
+
+SRC_URI += "file://off_t_abi_fix.patch;patch=1;pnum=0"
-- 
1.6.3



