Received: from mailgw1.fjfi.cvut.cz ([147.32.9.3])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <zub@linux.fjfi.cvut.cz>) id 1OZ8KA-0004yL-03
	for openembedded-devel@lists.openembedded.org;
	Wed, 14 Jul 2010 22:12:58 +0200
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mailgw1.fjfi.cvut.cz (Postfix) with ESMTP id 8DA3543D65
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 14 Jul 2010 22:06:45 +0200 (CEST)
X-DKIM: Sendmail DKIM Filter v2.8.2 mailgw1.fjfi.cvut.cz 8DA3543D65
DKIM-Signature: v=1; a=rsa-sha1; c=simple/simple; d=fjfi.cvut.cz; s=beta512;
	t=1279138005; i=@fjfi.cvut.cz; bh=XQDyYT8v8Xz8AtuHG9U997OdsbQ=;
	h=From:Date:Subject:To:Message-Id;
	b=P2c19wJ+T4kZJKbd+HuG5plqqn0j7LEodxttzA8sZXfl6Nu8SJuzWpdVvFANPxuee
	ZA8x/Bo9Dn54uxWV59UDA==
X-CTU-FNSPE-Virus-Scanned: amavisd-new at fjfi.cvut.cz
X-CTU-FNSPE: this_is_mailgw_for_ctu_fnspe_header
X-CTU-FNSPE-Helo: linux.fjfi.cvut.cz
X-CTU-FNSPE-Client-Address: 147.32.5.111
X-CTU-FNSPE-Client-Name: linux.fjfi.cvut.cz
X-CTU-FNSPE-Sender: zub@linux.fjfi.cvut.cz
X-CTU-FNSPE-Recip: openembedded-devel@lists.openembedded.org
Received: from mailgw1.fjfi.cvut.cz ([127.0.0.1])
	by localhost (mailgw1.fjfi.cvut.cz [127.0.0.1]) (amavisd-new,
	port 10026) with ESMTP id qmmtFCk6Au-9
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 14 Jul 2010 22:06:45 +0200 (CEST)
Received: from linux.fjfi.cvut.cz (linux.fjfi.cvut.cz [147.32.5.111])
	by mailgw1.fjfi.cvut.cz (Postfix) with ESMTP id 2760243D6E
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 14 Jul 2010 22:06:45 +0200 (CEST)
X-DKIM: Sendmail DKIM Filter v2.8.2 mailgw1.fjfi.cvut.cz 2760243D6E
X-DomainKeys: Sendmail DomainKeys Filter v1.0.2 mailgw1.fjfi.cvut.cz 2760243D6E
Received: by linux.fjfi.cvut.cz (Postfix, from userid 1001)
	id D636A46774; Wed, 14 Jul 2010 22:06:44 +0200 (CEST)
From: David Kozub <zub@linux.fjfi.cvut.cz>
Date: Wed, 14 Jul 2010 21:51:56 +0200
To: openembedded-devel@lists.openembedded.org
Message-Id: <20100714200644.D636A46774@linux.fjfi.cvut.cz>
X-SA-Exim-Connect-IP: 147.32.9.3
X-SA-Exim-Mail-From: zub@linux.fjfi.cvut.cz
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-6.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] gdb-common: Fix breakage of gdbserver.
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
X-List-Received-Date: Wed, 14 Jul 2010 20:12:59 -0000

Signed-off-by: David Kozub <zub@linux.fjfi.cvut.cz>
---
 recipes/gdb/gdb-common.inc |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/recipes/gdb/gdb-common.inc b/recipes/gdb/gdb-common.inc
index 1e0d7c2..c3eef69 100644
--- a/recipes/gdb/gdb-common.inc
+++ b/recipes/gdb/gdb-common.inc
@@ -23,7 +23,7 @@ B = "${WORKDIR}/build-${TARGET_SYS}"
 do_install_append() {
 	# these mo files from gdb-cross-sdk clash with files from binutils-cross-sdk
 	# when building sdk archives. Drop them for now as a way to restore toolchains.
-	rm ${D}/${datadir}/locale/*/LC_MESSAGES/{bfd,opcodes}.mo
+	rm -f ${D}/${datadir}/locale/*/LC_MESSAGES/{bfd,opcodes}.mo
 
 	# we don't care about these infos, installed from binutils
 	rm -f ${D}/${infodir}/{configure,standards,bfd}.info
-- 
1.7.1



