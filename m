Received: from [207.164.182.72] (helo=smtp.cbnco.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <edoiron@edoiron.ott.cti.com>) id 1MgKXO-0002tr-34
	for openembedded-devel@lists.openembedded.org;
	Wed, 26 Aug 2009 17:35:50 +0200
Received: from localhost (localhost [127.0.0.1])
	by smtp.cbnco.com (Postfix) with ESMTP id 9EB3B54DA45;
	Wed, 26 Aug 2009 11:17:52 -0400 (EDT)
Received: from smtp.cbnco.com ([127.0.0.1])
	by localhost (mail.cbnco.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 22432-05; Wed, 26 Aug 2009 11:17:52 -0400 (EDT)
Received: from edoiron.ott.cti.com (auriga-dmzgw.cbnco.com [207.164.182.65])
	by smtp.cbnco.com (Postfix) with ESMTPS id 7B0F354AF6A;
	Wed, 26 Aug 2009 11:17:52 -0400 (EDT)
Received: by edoiron.ott.cti.com (Postfix, from userid 1000)
	id C2BA87CE208; Wed, 26 Aug 2009 11:16:35 -0400 (EDT)
From: Evan Doiron <edoiron@cbnco.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 26 Aug 2009 11:16:35 -0400
Message-Id: <1251299795-28168-1-git-send-email-edoiron@cbnco.com>
X-Mailer: git-send-email 1.6.0.2
X-Virus-Scanned: amavisd-new at cbnco.com
Subject: [PATCH v2] openvpn: add v2.0.9+2.1rc19
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
X-List-Received-Date: Wed, 26 Aug 2009 15:35:50 -0000

Signed-off-by: Evan Doiron <edoiron@cbnco.com>
---

Previous Version I forgot to sort checksums, please ignore the first one.


 conf/checksums.ini                       |    4 ++++
 recipes/openvpn/openvpn_2.0.9+2.1rc19.bb |    6 ++++++
 2 files changed, 10 insertions(+), 0 deletions(-)
 create mode 100644 recipes/openvpn/openvpn_2.0.9+2.1rc19.bb

diff --git a/conf/checksums.ini b/conf/checksums.ini
index 1b3e5db..7718e1c 100644
--- a/conf/checksums.ini
+++ b/conf/checksums.ini
@@ -18690,6 +18690,10 @@ sha256=347c551e7c88affc1f4b7a4b715080253c9298dcc512ed29fe8ca5cd26d015d9
 md5=7401faebc6baee9add32608709c54eec
 sha256=063f00d5b889beee910eb113c8cfbb4fc85cd404693494bcaaf79dd09a98335c
 
+[http://openvpn.net/release/openvpn-2.1_rc19.tar.gz]
+md5=ba2ee667a8b7606b125b7d32f47ca578
+sha256=d7f52e2217ed1cf367ca93257b27c8acb29fcae4fcaa31b4a94146a3c7a7de33
+
 [http://downloads.sourceforge.net/gakusei/openwrt-imagetools-svn-rev7641.tar.bz2]
 md5=7f35543286911b827dcbf8d07a7d72be
 sha256=bad49b59646dbea380cc88be13a77d17c70488b8e11e85f7dd474930fa9cf36a
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



