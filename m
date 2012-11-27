Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TdS6G-0005cR-Pb
	for openembedded-devel@lists.openembedded.org;
	Tue, 27 Nov 2012 21:49:49 +0100
Received: by mail-ee0-f47.google.com with SMTP id l10so6973088eei.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Nov 2012 12:35:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=9Q+Zhc/khw7P/Ctx+xMxJxsTkvQwDtzgM6Q6CpLIhpc=;
	b=nBUY1DEcXDhnLjbfmEUZ5hxpDoqZQEurc2m4O/OQ/Kh2n/80z9xGQFcKv2u1+OERNQ
	BcFss8ICG5tHrjU++z9HrxuPZnk04zzbmUtb0F+WBEKHz0XGTx9a2mK3++LivzeuCn1a
	xm4wionxOnKVtyHaweFMYaxCLbx3eSNxxX6+wkFjE3WIByjxQJGYpUBhQfxSfqvqVnz0
	w7XnNp6tBrgFm9K0DMKSs0xIwfE5UusYOVr6LwuwQLYnBMgYqJ93zKKLumem9h8DRwXU
	f1xnd4BVxHvs1C9DL79rSwVokC45j5lK/Jgupjbi3ShGbmbFFDNRSMF6ujDPjeIH4y3I
	myQA==
Received: by 10.14.209.193 with SMTP id s41mr24523154eeo.9.1354048537656;
	Tue, 27 Nov 2012 12:35:37 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id u45sm36700310eep.0.2012.11.27.12.35.36
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 27 Nov 2012 12:35:37 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 27 Nov 2012 21:33:51 +0100
Message-Id: <869f78facd3194d2986ce81ca3d03c8f6dfc347b.1354034591.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.0
In-Reply-To: <cover.1354034591.git.Martin.Jansa@gmail.com>
References: <cover.1354034591.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1354034591.git.Martin.Jansa@gmail.com>
References: <cover.1354034591.git.Martin.Jansa@gmail.com>
Subject: [PATCH 14/21] e-base.bbclass: bump EFL_SRCREV for E17 alpha4
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
X-List-Received-Date: Tue, 27 Nov 2012 20:49:49 -0000

* be aware that this rev is slightly newer then alpha4, because we
  need backported patch to edje-1.7
  r79484 | raster | 2012-11-21 00:58:03 +0100 (Wed, 21 Nov 2012) | 3 lines
  backport cedrics fix... not backported when done! :-P
  and also this works only with conf/distro/include/efl-from-svn-recipes.inc
  otherwise edje_cc segfaults when building default e-wm theme

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/classes/e-base.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-efl/classes/e-base.bbclass b/meta-efl/classes/e-base.bbclass
index 3e7499f..933ad76 100644
--- a/meta-efl/classes/e-base.bbclass
+++ b/meta-efl/classes/e-base.bbclass
@@ -2,7 +2,7 @@ HOMEPAGE = "http://www.enlightenment.org"
 SRCNAME ?= "${BPN}"
 SRCVER ?= "${PV}"
 
-EFL_SRCREV ?= "79400"
+EFL_SRCREV ?= "79502"
 
 ARM_INSTRUCTION_SET = "arm"
 
-- 
1.8.0



