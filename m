Received: from mail-fx0-f51.google.com ([209.85.161.51])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1ORie3-000539-Au
	for openembedded-devel@lists.openembedded.org;
	Thu, 24 Jun 2010 11:26:02 +0200
Received: by fxm13 with SMTP id 13so1877273fxm.10
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Jun 2010 02:18:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=9aEXyxlJ2e4wZLq1ab+hqv4wH+rf7R1CkU8Il53X4UY=;
	b=IEyvdAjhUEiOuJJ/b8jH3flV/UtXA7/7mTGe4MEnpWYjPtBS6Ki5J/SX0uL6FvwBGW
	uu2TGMuH1Y3smllZb/wto57V0tNFDzycYVm64ovfFQ7126sPqVq0DznhTJQN82Ac4ey9
	NUhnT8M6ac2TA335/cwp2fBCErGHqc+2TBUF8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=KcI4xCtDPx8bJyMAmHGulk1+iw9L8tCr9pcA9ylTy85xceKBW6JSqzGOoOtqZyPK08
	A/zdesAINdD9o5KBPI8lPSp8hc4rUosq9riodKSJl/bDB9ySSbw5uegsXAFmxbr5sUga
	3p7Gvse2arHUi75O9+adJeGeUyhe3dg3w0e/o=
Received: by 10.223.46.135 with SMTP id j7mr8958385faf.105.1277371090297;
	Thu, 24 Jun 2010 02:18:10 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id z12sm40335823fah.9.2010.06.24.02.18.09
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 24 Jun 2010 02:18:09 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 24 Jun 2010 11:18:01 +0200
Message-Id: <1277371081-15867-2-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1277371081-15867-1-git-send-email-Martin.Jansa@gmail.com>
References: <1277371081-15867-1-git-send-email-Martin.Jansa@gmail.com>
X-SA-Exim-Connect-IP: 209.85.161.51
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 2/2] pango: drop PACKAGES_DYNAMIC for virtclass-native to hide multiple providers errors
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
X-List-Received-Date: Thu, 24 Jun 2010 09:35:13 -0000

* NOTE: multiple providers are available for runtime pango-module-basic-x (pango, pango-native)
  NOTE: consider defining a PREFERRED_PROVIDER entry to match pango-module-basic-x

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes/pango/pango.inc |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/recipes/pango/pango.inc b/recipes/pango/pango.inc
index 0a01814..ad66c7d 100644
--- a/recipes/pango/pango.inc
+++ b/recipes/pango/pango.inc
@@ -14,6 +14,7 @@ DEPENDS_virtclass-native = "glib-2.0-native cairo-native"
 BBCLASSEXTEND = "native"
 
 PACKAGES_DYNAMIC = "pango-module-*"
+PACKAGES_DYNAMIC_virtclass-native = ""
 
 RRECOMMENDS_${PN} = "pango-module-basic-x pango-module-basic-fc" 
 
-- 
1.7.1



