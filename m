Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f173.google.com (mail-wi0-f173.google.com
	[209.85.212.173])
	by mail.openembedded.org (Postfix) with ESMTP id 0B478770B4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 14 Oct 2015 19:17:38 +0000 (UTC)
Received: by wicgb1 with SMTP id gb1so143011903wic.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 14 Oct 2015 12:17:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=kgQIrKC0XcVJqZaqHW7tHQE1438uXAJaeqt0lXIUQ2U=;
	b=hdS+6HObRaYcecrGztJkztO9WchEPYk356KsEfiK42sJ1g9RaJHG4YzuGTnmBIYiJv
	69eQ4eV71bvEqGEJafaf/OMh4OPi6lMwBHZ6r7ip5ZBbtir24hI1mvIj82hj0rggZEIW
	1NDYSD7byzJCwnr6UF5jcv0Wu2FOtLn0zzKAnvVR/XAeGzG7YKvuivf2pz8oW/p6vlSO
	iQ5PDoSM6Oikj+YwLuZybmNz+N/CdmgczMF4FTkbgnAdRR5RqffTZJlNo66WKFYcEwwi
	VNNKPqhs7NSSjntAruob+K0Kb0nGgTWfE4tNJAcH3WyZLTg3N8FxJS1toEGUAwBDPRc+
	aaDQ==
X-Received: by 10.180.37.199 with SMTP id a7mr30399524wik.2.1444850258938;
	Wed, 14 Oct 2015 12:17:38 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	l1sm11797325wjx.13.2015.10.14.12.17.38
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 14 Oct 2015 12:17:38 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 14 Oct 2015 21:17:49 +0200
Message-Id: <1444850269-18516-3-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.6.1
In-Reply-To: <1444850269-18516-1-git-send-email-Martin.Jansa@gmail.com>
References: <1444850269-18516-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [PATCH][meta-oe][fido 3/3] ruby: explicitly disable dtrace support
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
X-List-Received-Date: Wed, 14 Oct 2015 19:17:39 -0000

both 2.2.1 and 2.2.2 are failing on some hosts native builds with:
| linking miniruby
| load.o: In function `rb_f_load':
| load.c:(.text+0x3af): undefined reference to `RUBY_DTRACE_LOAD_ENTRY_ENABLED'
| load.c:(.text+0x428): undefined reference to `RUBY_DTRACE_LOAD_RETURN_ENABLED'
| load.c:(.text+0x452): undefined reference to `RUBY_DTRACE_LOAD_RETURN'
| load.c:(.text+0x492): undefined reference to `RUBY_DTRACE_LOAD_ENTRY'
| load.o: In function `rb_require_internal':

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-ruby/recipes-devtools/ruby/ruby_2.2.1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-ruby/recipes-devtools/ruby/ruby_2.2.1.bb b/meta-ruby/recipes-devtools/ruby/ruby_2.2.1.bb
index 29f2291..080d455 100644
--- a/meta-ruby/recipes-devtools/ruby/ruby_2.2.1.bb
+++ b/meta-ruby/recipes-devtools/ruby/ruby_2.2.1.bb
@@ -16,6 +16,7 @@ EXTRA_OECONF = "\
     --enable-wide-getaddrinfo \
     --disable-versioned-paths \
     --disable-rpath \
+    --disable-dtrace \
     --enable-shared \
     --enable-load-relative \
 "
-- 
2.6.1


