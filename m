Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f49.google.com (mail-ee0-f49.google.com [74.125.83.49])
	by mail.openembedded.org (Postfix) with ESMTP id 12B706DB52
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Nov 2013 22:21:16 +0000 (UTC)
Received: by mail-ee0-f49.google.com with SMTP id b47so1112607eek.8
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Nov 2013 14:21:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=iGvnSn9rjHYM/iKZW2OeffFm0J4DfqxXVpHVLn/1Lf8=;
	b=qekWGhFhAQ0iryfuMtT9Aj7kz2MzKh09gHkyhowO8VfbueJmi/7Xsh+TCBWtlR/Fxn
	6jR7cIIJyeMLntWalJeLxGQtm1PMBxnjMvM16FhWFCoIKdVgQLNnfRcMNhu4AulIDWtJ
	mTk16wW5kbdBMMpIfDy/qEwaiDMwHB3o3uoqYVwGYcvofsWqsnTEVbLc9Q89GBd8ocVq
	lW+n+J3iPjlEbgF9tJoL5WCZRImEmfPIWR89CZKztiiIQ+XPl1nXv6NKQb3S3Vf76AyR
	jhNKXssGMNeSZYL2aV3dzpFog1NENXaO9sPuKJi1xBDdV77rHK3tS2MhU7w9D1q0MPIN
	etVg==
X-Received: by 10.15.34.5 with SMTP id d5mr15990982eev.20.1384813278538;
	Mon, 18 Nov 2013 14:21:18 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id a51sm42080322eeh.8.2013.11.18.14.21.18
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 18 Nov 2013 14:21:18 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 18 Nov 2013 23:21:13 +0100
Message-Id: <1384813274-7231-5-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.4.3
In-Reply-To: <1384813274-7231-1-git-send-email-Martin.Jansa@gmail.com>
References: <1384813274-7231-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 5/6] mime-support: Drop allarch
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 18 Nov 2013 22:21:17 -0000

* depends on TUNE_PKGARCH 'file'

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-support/mime-support/mime-support_3.48.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-oe/recipes-support/mime-support/mime-support_3.48.bb b/meta-oe/recipes-support/mime-support/mime-support_3.48.bb
index e730102..db481e3 100644
--- a/meta-oe/recipes-support/mime-support/mime-support_3.48.bb
+++ b/meta-oe/recipes-support/mime-support/mime-support_3.48.bb
@@ -10,7 +10,6 @@ SRC_URI = "${DEBIAN_MIRROR}/main/m/mime-support/mime-support_${PV}-1.tar.gz"
 S = "${WORKDIR}/${PN}"
 
 FILES_${PN} += " ${libdir}/mime"
-inherit allarch
 
 docdir_append = "/${PN}"
 
-- 
1.8.4.3


