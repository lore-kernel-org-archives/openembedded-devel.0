Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f51.google.com (mail-wg0-f51.google.com [74.125.82.51])
	by mail.openembedded.org (Postfix) with ESMTP id B6ACA73DD9
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  1 May 2015 12:30:26 +0000 (UTC)
Received: by wgin8 with SMTP id n8so89500187wgi.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 01 May 2015 05:30:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=14AyhyXWmv1TSWoq2ucJZS0XuVZijOSVazFaalF90Ss=;
	b=W4UhEzSeMRqNWldcpUP/7NISHiwtyV5ausHDSulN4bBoc1AUFO2hLw5GyVbAJELzKN
	G5szVIMw8hztro/OZhkxSRCDCy1mZrkn/sAC27z0Wrk0aupD8GyWI+rxYCo5+6c8P1sM
	u9Ugo7gq8EpGo+YdbTEGsmPkP3nvWYwcnvHaGRXQeA53OpsrMCx6VarziP9w2IDvyNQH
	F/qTGD+s3h/LxqL38oCaHssUCRejZkO4VyW+pTThTNiuUKQN8/Y6yXe7dyasu8/FkUEh
	kh1AdRSfJwnn0GHKO96s4GZW1DvzK58CE3ULd3P/K/xC3ZXtLan75kcp4uYo0enVJ6ac
	YocQ==
X-Received: by 10.194.62.83 with SMTP id w19mr18092718wjr.40.1430483427371;
	Fri, 01 May 2015 05:30:27 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by mx.google.com with ESMTPSA id e2sm6593828wij.5.2015.05.01.05.30.26
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 01 May 2015 05:30:26 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  1 May 2015 14:30:41 +0200
Message-Id: <1430483441-4566-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.3.5
Subject: [meta-ruby][PATCH] ruby: explicitly disable dtrace support
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
X-List-Received-Date: Fri, 01 May 2015 12:30:26 -0000

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
 meta-ruby/recipes-devtools/ruby/ruby_2.2.2.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-ruby/recipes-devtools/ruby/ruby_2.2.2.bb b/meta-ruby/recipes-devtools/ruby/ruby_2.2.2.bb
index c463525..78c943c 100644
--- a/meta-ruby/recipes-devtools/ruby/ruby_2.2.2.bb
+++ b/meta-ruby/recipes-devtools/ruby/ruby_2.2.2.bb
@@ -18,6 +18,7 @@ PACKAGECONFIG[ipv6] = ",--enable-wide-getaddrinfo,"
 EXTRA_OECONF = "\
     --disable-versioned-paths \
     --disable-rpath \
+    --disable-dtrace \
     --enable-shared \
     --enable-load-relative \
 "
-- 
2.3.5


