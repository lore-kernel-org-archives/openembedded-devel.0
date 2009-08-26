Received: from [207.164.182.72] (helo=smtp.cbnco.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <edoiron@edoiron.ott.cti.com>) id 1MgKPL-0002W6-0e
	for openembedded-devel@lists.openembedded.org;
	Wed, 26 Aug 2009 17:27:31 +0200
Received: from localhost (localhost [127.0.0.1])
	by smtp.cbnco.com (Postfix) with ESMTP id 701C8EE321;
	Wed, 26 Aug 2009 11:09:33 -0400 (EDT)
Received: from smtp.cbnco.com ([127.0.0.1])
	by localhost (mail.cbnco.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 20848-02; Wed, 26 Aug 2009 11:09:33 -0400 (EDT)
Received: from edoiron.ott.cti.com (auriga-dmzgw.cbnco.com [207.164.182.65])
	by smtp.cbnco.com (Postfix) with ESMTPS id 29F782ED1DB;
	Wed, 26 Aug 2009 11:09:33 -0400 (EDT)
Received: by edoiron.ott.cti.com (Postfix, from userid 1000)
	id 732847CE208; Wed, 26 Aug 2009 11:08:16 -0400 (EDT)
From: Evan Doiron <edoiron@cbnco.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 26 Aug 2009 11:08:16 -0400
Message-Id: <1251299296-27784-1-git-send-email-edoiron@cbnco.com>
X-Mailer: git-send-email 1.6.0.2
X-Virus-Scanned: amavisd-new at cbnco.com
Subject: [PATCH] openvpn: add v2.0.9+2.1rc19
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
X-List-Received-Date: Wed, 26 Aug 2009 15:27:31 -0000

Signed-off-by: Evan Doiron <edoiron@cbnco.com>
---
 conf/checksums.ini                       |    4 ++++
 recipes/openvpn/openvpn_2.0.9+2.1rc19.bb |    6 ++++++
 2 files changed, 10 insertions(+), 0 deletions(-)
 create mode 100644 recipes/openvpn/openvpn_2.0.9+2.1rc19.bb

diff --git a/conf/checksums.ini b/conf/checksums.ini
index 1b3e5db..b1cb4fe 100644
--- a/conf/checksums.ini
+++ b/conf/checksums.ini
@@ -1778,6 +1778,10 @@ sha256=d5b93fb8dbfa73e4a542bb8ad7d61c8b48dcf79948da26da9e9ef3b1a49c4221
 md5=c6b1aa28bfecdd0c693a2afc43d7679e
 sha256=d5b93fb8dbfa73e4a542bb8ad7d61c8b48dcf79948da26da9e9ef3b1a49c4221
 
+[http://openvpn.net/release/openvpn-2.1_rc19.tar.gz]
+md5=ba2ee667a8b7606b125b7d32f47ca578
+sha256=d7f52e2217ed1cf367ca93257b27c8acb29fcae4fcaa31b4a94146a3c7a7de33
+
 [http://www.auto.tuwien.ac.at/~mkoegler/eib/argp-standalone-1.3.tar.gz]
 md5=8a336796eeb2a765b76f68e3312adaab
 sha256=8b9067e77812c67c1e1b96ab9d92ab9af3a97e991d3c385b6e241d97f0e3cd28
diff --git a/recipes/openvpn/openvpn_2.0.9+2.1rc19.bb b/recipes/openvpn/openvpn_2.0.9+2.1rc19.bb
new file mode 100644
index 0000000..9375cd6
--- /dev/null
+++ b/recipes/openvpn/openvpn_2.0.9+2.1rc19.bb
@@ -0,0 +1,6 @@
+require openvpn.inc
+
+SRC_URI = "http://openvpn.net/release/openvpn-2.1_rc19.tar.gz \
+	   file://openvpn"
+
+S = "${WORKDIR}/openvpn-2.1_rc19"
-- 
1.6.0.2



