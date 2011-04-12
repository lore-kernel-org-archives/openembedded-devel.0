Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eyalreizer@googlemail.com>) id 1Q9lao-0006Az-NQ
	for openembedded-devel@lists.openembedded.org;
	Tue, 12 Apr 2011 23:58:02 +0200
Received: by gyf1 with SMTP id 1so7107gyf.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Apr 2011 14:55:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=6Ly+iRJvZe6npVoPN07KM0QTs4Hfw7ybRxqQWLitKhQ=;
	b=I8Wu2wK9FtoLRq50ITqkI6P5xKVfFqBOwr2DE2mYvtdqbKTQRmJ0ErKg9AlngjAa3O
	Pr944JTFfpiI7UcQBUx45DSFWgFLre4b9T++kemA1Q7DJD7NVltqavr6V46xoI9xag33
	iIdGVyn4+4FYLjxWbxojVWC1XgOeh8PVZzZ70=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=googlemail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=xcz6QaOnGwutAVi3bSRKR1/wD9i5Vy7d1odjb5VGylTZicEWJWJ+ZzkOa44QXEGCiV
	C8LCXgpwyVvu3k9hGhsvfQjdM6BUK8f5NQjee/jd+r6c9MUfrUuFSlzQvvZ/KSuk+sad
	nTNt8vUsxbqkmQtRqUbpBBWcoEz/cFUjAcooQ=
Received: by 10.236.170.35 with SMTP id o23mr8724240yhl.522.1302645335996;
	Tue, 12 Apr 2011 14:55:35 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com [192.94.94.33])
	by mx.google.com with ESMTPS id g69sm3215606yhc.88.2011.04.12.14.55.35
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 12 Apr 2011 14:55:35 -0700 (PDT)
From: Eyal Reizer <eyalreizer@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 13 Apr 2011 00:55:15 +0300
Message-Id: <1302645315-24883-1-git-send-email-eyalr@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <y>
References: <y>
Cc: Eyal Reizer <eyalr@ti.com>
Subject: [PATCH] ti-wifi-utils: update to a newer git commit
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
X-List-Received-Date: Tue, 12 Apr 2011 21:58:07 -0000

Signed-off-by: Eyal Reizer <eyalr@ti.com>
---
 recipes/ti/ti-wifi-utils_git.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/recipes/ti/ti-wifi-utils_git.bb b/recipes/ti/ti-wifi-utils_git.bb
index 92edb7f..600e21f 100644
--- a/recipes/ti/ti-wifi-utils_git.bb
+++ b/recipes/ti/ti-wifi-utils_git.bb
@@ -6,7 +6,7 @@ DEPENDS = "libnl"
 PV ="0.0"
 PR_append = "+gitr${SRCPV}"
 
-SRCREV = "6de17deb67a1313b5cc8"
+SRCREV = "7f63af54eb66e5b2515f92c59fcc19a8065ce481"
 SRC_URI = "git://github.com/gxk/ti-utils.git;protocol=git"
 
 S = "${WORKDIR}/git"
-- 
1.7.0.4



