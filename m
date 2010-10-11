Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1P5GLp-0005Ja-AS
	for openembedded-devel@lists.openembedded.org;
	Mon, 11 Oct 2010 13:15:33 +0200
Received: by bwz9 with SMTP id 9so555729bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Oct 2010 04:15:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=hO3vK2ilwabnmJtln8/CZLJRxopLcdLSVwdQv3sxO18=;
	b=KMd79gwlTTfBUtaNUAJGg2pSpF0DFhNcGU3uEBYJiLuyNLSbmNKOOXhH10OIaVN0Zf
	Pmdwd5phonQfQ9UInPRf5D3fOpHCMi/uVck6pHsADq2UJ3WP+JRoEL/dtvqf3rWT/Thz
	sMcndVj3/praDiJzSaSUIN49qH0sUehd2DiPA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=hS56dCd7fvBRFQVY3Bx4aMGuokGL4yyU5i555jLLEzoOG9LNgUOrxTzCbYqLpjuDLK
	SqGQwtTSyyGOHiIpAfClkt/oPO6iTDfBykWHe7UpY4TLt6t7m6qUqmudqM5azon1GAU8
	t11j0vrfCD9BGlcJgrr+mTfcJMUZ85DZ/gD8Q=
Received: by 10.204.102.72 with SMTP id f8mr4357691bko.57.1286795704822;
	Mon, 11 Oct 2010 04:15:04 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id a25sm3514305bks.8.2010.10.11.04.15.03
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 11 Oct 2010 04:15:04 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 11 Oct 2010 13:14:57 +0200
Message-Id: <1286795697-9335-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.3.1
In-Reply-To: <i8ufbd$27r$1@dough.gmane.org>
References: <i8ufbd$27r$1@dough.gmane.org>
X-SA-Exim-Connect-IP: 209.85.214.47
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] openjade: return oj-native-libosp-fix.patch, lost in BBCLASSEXTEND change fdf02c61607acb5046afaa11c5c682ab99f4d508
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
X-List-Received-Date: Mon, 11 Oct 2010 11:15:33 -0000

---
 recipes/openjade/openjade_1.3.2.bb |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/recipes/openjade/openjade_1.3.2.bb b/recipes/openjade/openjade_1.3.2.bb
index 238586b..9462636 100644
--- a/recipes/openjade/openjade_1.3.2.bb
+++ b/recipes/openjade/openjade_1.3.2.bb
@@ -5,9 +5,10 @@ DESCRIPTION = "OpenJade is a suite of tools for validating, \
 processing, and applying DSSSL (Document Style Semantics and \
 Specification Language) stylesheets to SGML and XML documents."
 LICENSE = "BSD"
-PR = "r2"
+PR = "r3"
 SRC_URI = "${SOURCEFORGE_MIRROR}/openjade/openjade-${PV}.tar.gz \
-	   file://configure.patch \
+           file://oj-native-libosp-fix.patch \
+           file://configure.patch \
           "
 
 inherit autotools
-- 
1.7.3.1



