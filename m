Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id E22CB719E5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Nov 2016 09:22:39 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id i88so445044pfk.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Nov 2016 01:22:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=rXoxJPfmGkwQMf9gNqyaHt1IwaguE0qAufqrfRW8WKA=;
	b=wEvGR16YDIn+v2/7EsV6lQg2ZI8nDvUvP66HFTocQL6ELJVwL5ns9mwxKjz58ebnOb
	hyh0GtOGDhSpzgzd5y+0mzZBNGe9yqEazernv3ksUdGhDFC7gosHuysIkTHS8f78AjAa
	GSxJJ2VuFDygASwUGmEFBELcDvG3pMdiOa018Zdbc/kWaSl/Cits3Kn1PV/UXJ7ncBJ0
	mO/SjmbEUhr25GUW+Mx2+hU991m6blzpPBaaF01DDoVckjMUhn8sJC/kMFhXj7wJIeOq
	ZeAtE/08MIgO6PUZGBwBkro8dut1V52ZXoQb02bgLNqWaq3znz8m1A5kuYP3m/WeJQz+
	AtmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=rXoxJPfmGkwQMf9gNqyaHt1IwaguE0qAufqrfRW8WKA=;
	b=Q9YMNR3PGK5b4JorSV9ycs4hBlStYJmCZ4OyuwDQMtpe+3QigyL1ka60x9O2uXmp6r
	wX4MgnWUCyTdV52WUJR7t4le6PIkvaq9IhkNLPcvqmyMzHLKcF4/u9XMPOoS6W4e0g8j
	/x3A5EorFFlFqDldKekmIRLFzApCw8+BVvdckbsiJCWcsvmxmcRzOTFeLL5B1O9FU2Bl
	EOuZSCcnOKDJDhYwKIHpsKdX0VCjeXMKJdhXZ5mTrXhO37TtFlvUoNqwquqjeP+HSF3C
	OorQbPRnB0hciuqPZ2nL7R8R8iXceu8oZE577N0rq9XFu3moBXrNzhD/a/daJu/ltYXv
	EGLw==
X-Gm-Message-State: AKaTC029jIwDnrWQJEgaopX3/Q+G5VgEs3vp9hQA9OzRPlZyjCwkGuImV3FxWC0rhi7aGg==
X-Received: by 10.84.173.4 with SMTP id o4mr4637322plb.123.1479892961255;
	Wed, 23 Nov 2016 01:22:41 -0800 (PST)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	u23sm51056087pfg.86.2016.11.23.01.22.40
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 23 Nov 2016 01:22:40 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 23 Nov 2016 01:21:52 -0800
Message-Id: <20161123092209.23699-32-raj.khem@gmail.com>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <20161123092209.23699-1-raj.khem@gmail.com>
References: <20161123092209.23699-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 32/49] md5deep: Fix build with clang
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 23 Nov 2016 09:22:40 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../files/0001-Fix-errors-found-by-clang.patch     | 32 ++++++++++++++++++++++
 meta-oe/recipes-extended/md5deep/md5deep_4.4.bb    |  1 +
 2 files changed, 33 insertions(+)
 create mode 100644 meta-oe/recipes-extended/md5deep/files/0001-Fix-errors-found-by-clang.patch

diff --git a/meta-oe/recipes-extended/md5deep/files/0001-Fix-errors-found-by-clang.patch b/meta-oe/recipes-extended/md5deep/files/0001-Fix-errors-found-by-clang.patch
new file mode 100644
index 0000000..cc7cdc3
--- /dev/null
+++ b/meta-oe/recipes-extended/md5deep/files/0001-Fix-errors-found-by-clang.patch
@@ -0,0 +1,32 @@
+From 6ef69a26126ee4e69a25392fd456b8a66c51dffd Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 15 Nov 2016 02:46:55 +0000
+Subject: [PATCH] Fix errors found by clang
+
+Fixes errors like
+
+../../git/src/hash.cpp:282:19: error: ordered comparison between pointer and zero ('const unsigned char *' and 'int')
+            if(fdht->base>0){
+               ~~~~~~~~~~^~
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/hash.cpp | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/hash.cpp b/src/hash.cpp
+index 4216157..52f419b 100644
+--- a/src/hash.cpp
++++ b/src/hash.cpp
+@@ -279,7 +279,7 @@ void file_data_hasher_t::hash()
+ 		MAP_FILE|
+ #endif
+ 		MAP_SHARED,fd,0);
+-	    if(fdht->base>0){		
++	    if(fdht->base != (void *) -1){
+ 		/* mmap is successful, so set the bounds.
+ 		 * if it is not successful, we default to reading the fd
+ 		 */
+-- 
+1.9.1
+
diff --git a/meta-oe/recipes-extended/md5deep/md5deep_4.4.bb b/meta-oe/recipes-extended/md5deep/md5deep_4.4.bb
index 960e00f..bb30abe 100644
--- a/meta-oe/recipes-extended/md5deep/md5deep_4.4.bb
+++ b/meta-oe/recipes-extended/md5deep/md5deep_4.4.bb
@@ -9,6 +9,7 @@ SRCREV = "cd2ed7416685a5e83eb10bb659d6e9bec01244ae"
 
 SRC_URI = "git://github.com/jessek/hashdeep.git \
         file://wrong-variable-expansion.patch \
+        file://0001-Fix-errors-found-by-clang.patch \
         "
 
 S = "${WORKDIR}/git"
-- 
2.10.2


