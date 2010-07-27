Received: from mailgw1.fjfi.cvut.cz ([147.32.9.3])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <zub@linux.fjfi.cvut.cz>) id 1OdYe9-0003hf-Hy
	for openembedded-devel@lists.openembedded.org;
	Tue, 27 Jul 2010 03:08:04 +0200
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mailgw1.fjfi.cvut.cz (Postfix) with ESMTP id A411243D0B
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Jul 2010 03:07:38 +0200 (CEST)
X-DKIM: Sendmail DKIM Filter v2.8.2 mailgw1.fjfi.cvut.cz A411243D0B
DKIM-Signature: v=1; a=rsa-sha1; c=simple/simple; d=fjfi.cvut.cz; s=beta512;
	t=1280192858; i=@fjfi.cvut.cz; bh=mPFMLE5q06SqyoGjAxOoiIZDh88=;
	h=From:Date:Subject:To:Message-Id;
	b=A4uifyEeTkUYpHVm746eyKMQWQgaJVqtwpaP+5rDYZWj64FDYBOrnM2tDOFJ/UUU1
	TpYAiaLLRFiv+66z0L13g==
X-CTU-FNSPE-Virus-Scanned: amavisd-new at fjfi.cvut.cz
X-CTU-FNSPE: this_is_mailgw_for_ctu_fnspe_header
X-CTU-FNSPE-Helo: linux.fjfi.cvut.cz
X-CTU-FNSPE-Client-Address: 147.32.5.111
X-CTU-FNSPE-Client-Name: linux.fjfi.cvut.cz
X-CTU-FNSPE-Sender: zub@linux.fjfi.cvut.cz
X-CTU-FNSPE-Recip: openembedded-devel@lists.openembedded.org
Received: from mailgw1.fjfi.cvut.cz ([127.0.0.1])
	by localhost (mailgw1.fjfi.cvut.cz [127.0.0.1]) (amavisd-new,
	port 10026) with ESMTP id SlX+oj75hLB4
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Jul 2010 03:07:33 +0200 (CEST)
Received: from linux.fjfi.cvut.cz (linux.fjfi.cvut.cz [147.32.5.111])
	by mailgw1.fjfi.cvut.cz (Postfix) with ESMTP id 74EDE43D12
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Jul 2010 03:07:33 +0200 (CEST)
X-DKIM: Sendmail DKIM Filter v2.8.2 mailgw1.fjfi.cvut.cz 74EDE43D12
X-DomainKeys: Sendmail DomainKeys Filter v1.0.2 mailgw1.fjfi.cvut.cz 74EDE43D12
Received: by linux.fjfi.cvut.cz (Postfix, from userid 1001)
	id 1B6BB46773; Tue, 27 Jul 2010 03:07:33 +0200 (CEST)
From: David Kozub <zub@linux.fjfi.cvut.cz>
Date: Tue, 27 Jul 2010 02:24:12 +0200
To: openembedded-devel@lists.openembedded.org
Message-Id: <20100727010733.1B6BB46773@linux.fjfi.cvut.cz>
X-SA-Exim-Connect-IP: 147.32.9.3
X-SA-Exim-Mail-From: zub@linux.fjfi.cvut.cz
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-6.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 1/3] cmake-native: add recipe for cmake 2.8.2.
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
X-List-Received-Date: Tue, 27 Jul 2010 01:08:09 -0000

Signed-off-by: David Kozub <zub@linux.fjfi.cvut.cz>
---
 recipes/cmake/cmake-native_2.8.2.bb |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)
 create mode 100644 recipes/cmake/cmake-native_2.8.2.bb

diff --git a/recipes/cmake/cmake-native_2.8.2.bb b/recipes/cmake/cmake-native_2.8.2.bb
new file mode 100644
index 0000000..a623525
--- /dev/null
+++ b/recipes/cmake/cmake-native_2.8.2.bb
@@ -0,0 +1,5 @@
+inherit native
+require cmake.inc
+
+SRC_URI[md5sum] = "8c967d5264657a798f22ee23976ff0d9"
+SRC_URI[sha256sum] = "766ff169af798599d7dd42e41e9f4533d73942a2bb928235115412dce5b81406"
-- 
1.7.1



