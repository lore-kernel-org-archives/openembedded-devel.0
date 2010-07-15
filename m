Received: from mailgw1.fjfi.cvut.cz ([147.32.9.3])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <zub@linux.fjfi.cvut.cz>) id 1OZJnd-0006og-72
	for openembedded-devel@lists.openembedded.org;
	Thu, 15 Jul 2010 10:28:11 +0200
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mailgw1.fjfi.cvut.cz (Postfix) with ESMTP id 13B1143D75
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Jul 2010 10:28:07 +0200 (CEST)
X-DKIM: Sendmail DKIM Filter v2.8.2 mailgw1.fjfi.cvut.cz 13B1143D75
DKIM-Signature: v=1; a=rsa-sha1; c=simple/simple; d=fjfi.cvut.cz; s=beta512;
	t=1279182487; i=@fjfi.cvut.cz; bh=8rZ9xTQxSm6trr9HhMLVPFBH29k=;
	h=From:Date:Subject:To:Message-Id;
	b=olqkD4jN1X8hNLtrE4AZr3hWvYcSth7Tyeu+8+w58OZM9SGZwJidEmUX+Sz3FvDmt
	Vu5HpddHENgEjQzkXghDQ==
X-CTU-FNSPE-Virus-Scanned: amavisd-new at fjfi.cvut.cz
X-CTU-FNSPE: this_is_mailgw_for_ctu_fnspe_header
X-CTU-FNSPE-Helo: linux.fjfi.cvut.cz
X-CTU-FNSPE-Client-Address: 147.32.5.111
X-CTU-FNSPE-Client-Name: linux.fjfi.cvut.cz
X-CTU-FNSPE-Sender: zub@linux.fjfi.cvut.cz
X-CTU-FNSPE-Recip: openembedded-devel@lists.openembedded.org
Received: from mailgw1.fjfi.cvut.cz ([127.0.0.1])
	by localhost (mailgw1.fjfi.cvut.cz [127.0.0.1]) (amavisd-new,
	port 10026) with ESMTP id ZZMoTPdM7wDJ
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Jul 2010 10:28:04 +0200 (CEST)
Received: from linux.fjfi.cvut.cz (linux.fjfi.cvut.cz [147.32.5.111])
	by mailgw1.fjfi.cvut.cz (Postfix) with ESMTP id 4EABD43D6A
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Jul 2010 10:28:04 +0200 (CEST)
X-DKIM: Sendmail DKIM Filter v2.8.2 mailgw1.fjfi.cvut.cz 4EABD43D6A
X-DomainKeys: Sendmail DomainKeys Filter v1.0.2 mailgw1.fjfi.cvut.cz 4EABD43D6A
Received: by linux.fjfi.cvut.cz (Postfix, from userid 1001)
	id 2025346774; Thu, 15 Jul 2010 10:28:04 +0200 (CEST)
From: David Kozub <zub@linux.fjfi.cvut.cz>
Date: Thu, 15 Jul 2010 10:23:13 +0200
To: openembedded-devel@lists.openembedded.org
Message-Id: <20100715082804.2025346774@linux.fjfi.cvut.cz>
X-SA-Exim-Connect-IP: 147.32.9.3
X-SA-Exim-Mail-From: zub@linux.fjfi.cvut.cz
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-6.6 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_MED,SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] gdb-common.inc: Fix build of gdb-cross-sdk on 64bit.
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
X-List-Received-Date: Thu, 15 Jul 2010 08:28:12 -0000

Part of the issue was already tackled in
10fabfa670e4e49a9c9a025d94a87ef0d9c86cc0. Building on x86_64 produces
libiberty.a in lib64/ though.

Signed-off-by: David Kozub <zub@linux.fjfi.cvut.cz>
---
 recipes/gdb/gdb-common.inc |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/recipes/gdb/gdb-common.inc b/recipes/gdb/gdb-common.inc
index c3eef69..62df498 100644
--- a/recipes/gdb/gdb-common.inc
+++ b/recipes/gdb/gdb-common.inc
@@ -32,6 +32,6 @@ do_install_append() {
 	# We use libiberty from binutils
 	rm -f ${D}${prefix}/${TARGET_SYS}/lib/libiberty.a
 	rm -f ${D}${libdir}/libiberty.a
-
+	rm -f ${D}${libdir}64/libiberty.a
 }
 
-- 
1.7.1



