Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rep.dot.nop@gmail.com>) id 1OgeNr-00077T-02
	for openembedded-devel@lists.openembedded.org;
	Wed, 04 Aug 2010 15:52:26 +0200
Received: by fxm12 with SMTP id 12so2472652fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 04 Aug 2010 06:51:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:received:from:to:cc:subject
	:date:message-id:x-mailer;
	bh=nCirYaFbRmvkX+rgFbb5/I1htO12L6qfXfm90QdqQRQ=;
	b=ms5+dMBd2H7a8JHXIMIXKtjF36kazlkcERxlR/c6ntmocJcvx1VQaD3W4Zs1WWNAEc
	+Crp7ylUGeLm9FBF2Zf8WNEsR9PpyX5wyzf9/9J1Gv7OgS3+3AEF6I5xY9JIx//e/IJg
	zXuXWHtuAV0yosM42bAFLAGXTQzNAYG45fuVM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=HMcLCQS8awnYjFxLA6m9S7XysGt0od3YsMftyN2gMht0UJoMjWzwh7uhWVf9O+z5Dn
	sh5Y0WfjRI8NC38Mjg1kE+N0utuB17rmK3NRFYoKIOGnRgrEiOk31Eo/ynjXSAnbsuIv
	7AZie/sQp2DZY2Vs71IsbSEQ3RcZR9848aQR0=
Received: by 10.223.106.203 with SMTP id y11mr9041016fao.16.1280929906542;
	Wed, 04 Aug 2010 06:51:46 -0700 (PDT)
Received: from s42.loc (85-127-241-5.dynamic.xdsl-line.inode.at [85.127.241.5])
	by mx.google.com with ESMTPS id 14sm2969762fav.26.2010.08.04.06.51.45
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 04 Aug 2010 06:51:45 -0700 (PDT)
Received: from cow by s42.loc with local (Exim 4.72)
	(envelope-from <rep.dot.nop@gmail.com>)
	id 1OgeNg-0006C6-33; Wed, 04 Aug 2010 15:51:40 +0200
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  4 Aug 2010 15:51:38 +0200
Message-Id: <1280929898-23684-1-git-send-email-rep.dot.nop@gmail.com>
X-Mailer: git-send-email 1.7.1
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: rep.dot.nop@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] staging.bbclass: do not fill log with empty .la files
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
X-List-Received-Date: Wed, 04 Aug 2010 13:52:39 -0000

Signed-off-by: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
---
 classes/staging.bbclass |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/classes/staging.bbclass b/classes/staging.bbclass
index e806449..f2046f8 100644
--- a/classes/staging.bbclass
+++ b/classes/staging.bbclass
@@ -47,7 +47,7 @@ sysroot_stage_libdir() {
 	cd $src
 	las=$(find . -name \*.la -type f)
 	cd $olddir
-	echo "Found la files: $las"		 
+	[ -n "${las}" ] && echo "Found la files: $las"
 	for i in $las
 	do
 		sed -e 's/^installed=yes$/installed=no/' \
-- 
1.7.1



