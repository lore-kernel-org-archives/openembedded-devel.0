Return-Path: <kergoth@gmail.com>
Received: from mail-pb0-f48.google.com (mail-pb0-f48.google.com
	[209.85.160.48])
	by mail.openembedded.org (Postfix) with ESMTP id E9D276D88C
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Nov 2013 17:50:28 +0000 (UTC)
Received: by mail-pb0-f48.google.com with SMTP id md12so10871749pbc.35
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Nov 2013 09:50:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=GhViAwygw/+ymH67nFS0BvrZbuY6MRAGOHk5Fdtw1Zg=;
	b=cYPweJWoVfbWBTnqqu+yeAYnt6oXXoasqCnjQ0i0PlIvVqhSDX1QU8LCPJDytmDqal
	PG6reOBFjL+KD3qJ9uUFurevvh83W+uDva4eACQF1JqysyCTxMcA7nKdbV51Mktu+kxR
	APyvrtl9o3veFF5If6wAp8AokMHn6c0jKaxps6YHbNmqwwiXXehi/CgOee2TdElGr1JH
	VKH10mkWhtdA7J7mYZj/O+9NTyM5VWkCckrKSXGBKvAuiF2MIvWeQK8j5Z6eFL5Mo4Hw
	liF/+G0txOqWIqgj8+quY7w/M8PtGlKJynmQH4ifc6BQjDR6f82JKXHmXPwjb0EsoVkB
	yURA==
X-Received: by 10.66.2.66 with SMTP id 2mr43179469pas.72.1385574628190;
	Wed, 27 Nov 2013 09:50:28 -0800 (PST)
Received: from amyr.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by mx.google.com with ESMTPSA id
	sg1sm89415355pbb.16.2013.11.27.09.50.25
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 27 Nov 2013 09:50:26 -0800 (PST)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 27 Nov 2013 10:50:19 -0700
Message-Id: <1385574620-9408-1-git-send-email-kergoth@gmail.com>
X-Mailer: git-send-email 1.8.3.4
Subject: [meta-oe][PATCH 1/2] ruby: find gems relative to its own location
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
X-List-Received-Date: Wed, 27 Nov 2013 17:50:29 -0000

Rather than hardcoding ${datadir}/rubygems, we can let it find the gems
relative to its own location, to make it relocatable.

Signed-off-by: Christopher Larson <kergoth@gmail.com>
---
 meta-ruby/recipes-devtools/ruby/ruby_1.9.3-p429.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-ruby/recipes-devtools/ruby/ruby_1.9.3-p429.bb b/meta-ruby/recipes-devtools/ruby/ruby_1.9.3-p429.bb
index de51f2f..883bb98 100644
--- a/meta-ruby/recipes-devtools/ruby/ruby_1.9.3-p429.bb
+++ b/meta-ruby/recipes-devtools/ruby/ruby_1.9.3-p429.bb
@@ -17,10 +17,10 @@ SRC_URI[sha256sum] = "d192d1afc46a7ef27b9d0a3c7a67b509048984db2c38907aa82641bdf9
 
 EXTRA_OECONF = "\
     --enable-wide-getaddrinfo \
-    --with-rubygemsdir=${datadir}/rubygems \
     --disable-versioned-paths \
     --disable-rpath \
     --enable-shared \
+    --enable-load-relative \
 "
 
 EXTRA_OEMAKE = " \
-- 
1.8.3.4


