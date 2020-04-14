Received: from koncepto.io (koncepto.io [195.154.119.111])
 by mx.groups.io with SMTP id smtpd.web11.14610.1586880858371105854
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Apr 2020 09:14:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@koncepto.io header.s=default header.b=dnzrSVQ1;
 spf=pass (domain: koncepto.io, ip: 195.154.119.111, mailfrom: pjtexier@koncepto.io)
Received: from menoah.home (lfbn-bor-1-1500-88.w193-250.abo.wanadoo.fr [193.250.66.88])
	by koncepto.io (Postfix) with ESMTPSA id 4AD83601C6;
	Tue, 14 Apr 2020 18:14:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=koncepto.io;
	s=default; t=1586880855;
	bh=J2JfkEbBHsBt12ya39fJE6/mV4OPW7Qd4j99Hur9SdA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dnzrSVQ1Ot5ielztYR4cqAsu4v4sEeEIk7cuP0gHsbJJMcSidDKlR709V50kEekac
	 3Wc0ic1yQFhn/YsVOBlAOj/I9ttF64x//JHcb64TbKJGr37IqprHLZbsNUhBtX8CR9
	 G0Gyowh0nOKRMy4TqiuOJsPZULWVr/2bxHFxmQtfoiSKzpfsAg4FLY8Yld9XVUZxfT
	 seJEWiQrdaY/WalsPMe5ma3O5yNh3lcUMTdoCuIHilnsIeA+DN9X8Qw6wonJp7vuk7
	 AAS7HWTh0TmA3vqXPkzN0iIU1ET6Og6SBQ5GQx83OYnFt3oVUxvAB8vbsal0iPFe8Y
	 z6fdLoUjwbVpg==
From: "Pierre-Jean Texier" <pjtexier@koncepto.io>
To: openembedded-devel@lists.openembedded.org
Cc: Pierre-Jean Texier <pjtexier@koncepto.io>
Subject: [meta-oe][PATCH 2/2] libssh: upgrade 0.8.8 -> 0.8.9
Date: Tue, 14 Apr 2020 18:14:12 +0200
Message-Id: <1586880852-19799-2-git-send-email-pjtexier@koncepto.io>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1586880852-19799-1-git-send-email-pjtexier@koncepto.io>
References: <1586880852-19799-1-git-send-email-pjtexier@koncepto.io>

This is a security release.

See changelog https://www.libssh.org/2020/04/09/libssh-0-9-4-and-libssh-0-8-9-security-release/

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
---
 meta-oe/recipes-support/libssh/{libssh_0.8.8.bb => libssh_0.8.9.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/libssh/{libssh_0.8.8.bb => libssh_0.8.9.bb} (94%)

diff --git a/meta-oe/recipes-support/libssh/libssh_0.8.8.bb b/meta-oe/recipes-support/libssh/libssh_0.8.9.bb
similarity index 94%
rename from meta-oe/recipes-support/libssh/libssh_0.8.8.bb
rename to meta-oe/recipes-support/libssh/libssh_0.8.9.bb
index 1952a8f..39ed8a8 100644
--- a/meta-oe/recipes-support/libssh/libssh_0.8.8.bb
+++ b/meta-oe/recipes-support/libssh/libssh_0.8.9.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=dabb4958b830e5df11d2b0ed8ea255a0"
 DEPENDS = "zlib openssl libgcrypt"
 
 SRC_URI = "git://git.libssh.org/projects/libssh.git;branch=stable-0.8"
-SRCREV = "7850307210590a9a1b03ab0273d29b3926a974c5"
+SRCREV = "04685a74df9ce1db1bc116a83a0da78b4f4fa1f8"
 
 S = "${WORKDIR}/git"
 
-- 
2.7.4

