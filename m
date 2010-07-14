Received: from mailgw1.fjfi.cvut.cz ([147.32.9.3])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <zub@linux.fjfi.cvut.cz>) id 1OZ9eO-0003xv-SG
	for openembedded-devel@lists.openembedded.org;
	Wed, 14 Jul 2010 23:37:58 +0200
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mailgw1.fjfi.cvut.cz (Postfix) with ESMTP id 4EEB043D5C
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 14 Jul 2010 23:37:55 +0200 (CEST)
X-DKIM: Sendmail DKIM Filter v2.8.2 mailgw1.fjfi.cvut.cz 4EEB043D5C
DKIM-Signature: v=1; a=rsa-sha1; c=simple/simple; d=fjfi.cvut.cz; s=beta512;
	t=1279143475; i=@fjfi.cvut.cz; bh=QSIGEfrd/2+KYHLFkzgO8TA9Cqc=;
	h=From:Date:Subject:To:Message-Id;
	b=Mvq/1dHedgTF7UOlfh29HlFEnybec4GEj4+/lAbRz4Jgd81XCQADHUAPpKYNOa7rU
	CHGfBXPFleiOelUnwCucQ==
X-CTU-FNSPE-Virus-Scanned: amavisd-new at fjfi.cvut.cz
X-CTU-FNSPE: this_is_mailgw_for_ctu_fnspe_header
X-CTU-FNSPE-Helo: linux.fjfi.cvut.cz
X-CTU-FNSPE-Client-Address: 147.32.5.111
X-CTU-FNSPE-Client-Name: linux.fjfi.cvut.cz
X-CTU-FNSPE-Sender: zub@linux.fjfi.cvut.cz
X-CTU-FNSPE-Recip: openembedded-devel@lists.openembedded.org
Received: from mailgw1.fjfi.cvut.cz ([127.0.0.1])
	by localhost (mailgw1.fjfi.cvut.cz [127.0.0.1]) (amavisd-new,
	port 10026) with ESMTP id VIoLKeiysoQO
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 14 Jul 2010 23:37:50 +0200 (CEST)
Received: from linux.fjfi.cvut.cz (linux.fjfi.cvut.cz [147.32.5.111])
	by mailgw1.fjfi.cvut.cz (Postfix) with ESMTP id 8B1C343D50
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 14 Jul 2010 23:37:50 +0200 (CEST)
X-DKIM: Sendmail DKIM Filter v2.8.2 mailgw1.fjfi.cvut.cz 8B1C343D50
X-DomainKeys: Sendmail DomainKeys Filter v1.0.2 mailgw1.fjfi.cvut.cz 8B1C343D50
Received: by linux.fjfi.cvut.cz (Postfix, from userid 1001)
	id 7A5BE46777; Wed, 14 Jul 2010 23:37:50 +0200 (CEST)
From: David Kozub <zub@linux.fjfi.cvut.cz>
Date: Wed, 14 Jul 2010 22:42:22 +0200
To: openembedded-devel@lists.openembedded.org
Message-Id: <20100714213750.7A5BE46777@linux.fjfi.cvut.cz>
X-SA-Exim-Connect-IP: 147.32.9.3
X-SA-Exim-Mail-From: zub@linux.fjfi.cvut.cz
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-6.6 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_MED,SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 2/4] clutter-1.0: Add recipe for clutter-1.0.
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
X-List-Received-Date: Wed, 14 Jul 2010 21:38:00 -0000

Signed-off-by: David Kozub <zub@linux.fjfi.cvut.cz>
---
 recipes/clutter/clutter-1.0_git.bb |   10 ++++++++++
 1 files changed, 10 insertions(+), 0 deletions(-)
 create mode 100644 recipes/clutter/clutter-1.0_git.bb

diff --git a/recipes/clutter/clutter-1.0_git.bb b/recipes/clutter/clutter-1.0_git.bb
new file mode 100644
index 0000000..b2e721c
--- /dev/null
+++ b/recipes/clutter/clutter-1.0_git.bb
@@ -0,0 +1,10 @@
+require clutter.inc
+
+SRCREV = "839ebef44f49405ac13d8b8c5c62bfea2973dc3d"
+
+PV = "1.2.8"
+PR = "${INC_PR}.0"
+PR_append = "+git${SRCREV}"
+
+SRC_URI = "git://git.clutter-project.org/clutter.git;protocol=git"
+S = "${WORKDIR}/git"
-- 
1.7.1



