Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id 5BABA719A8
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Jul 2017 18:58:35 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id y25so8736725pfk.4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Jul 2017 11:58:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=tA5xf36b7eZU93oJfKaJJOpCpI5oNeopVpJx3tmJU40=;
	b=bN7v10Aa/c2Wh8Dt2/HVSsTjD8CWCxIOjcRBt84k1VkcvVZ1Bg/3fNI9dRPy1pnoXd
	QMtH1de+4Uk5VwzZjotUYrTIH4gRnkZxGh9redeqRvR5wAzIUEN97vkDIDQeVmVaLxqZ
	+J99yHBlvr2QOR7RhI2mTvrVvTCn3RS5Ru8wcGbDQYP0fzzEpbTbyC6JnR6uX+KE11KG
	Xi3uMiQbkQzDzCwoWDtVBig7w1ndDhUmW+NoDJ6a8Ijdvrk+ua2VhJxTSolH5dGCs8lA
	NqrsIJzmKNg3xi1cZtLS8WKNzAK2NLlv7QPg3RgLk1XjGKHSOb5ultA3iYJi53OlHvTM
	cFHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=tA5xf36b7eZU93oJfKaJJOpCpI5oNeopVpJx3tmJU40=;
	b=Veq3TalyjMjrn9GuNDxlEd3BdSq+MCIGvxsWX9cCX3bTJ6s7nIbFYjj8JqNWO6WWdx
	N8hYDwtTGhfG5xzlyFxVLKzfQlgbuWQF6JkP58KpFZFZRVCAEV03nHbzpXtZZYT0jsgN
	XGj8sSgrOaKC/fXXwW5ZpZrBAof+0jEOfyT3s1BGX44u58Y+dqfopuowAUswe1q2yyaI
	QcrI9fuc1kgAS2leOJsFb4QKl+spcheY3xuVBsNJLV6nU548d56YKmIiZ7u1FMUA14aA
	i/hpstD0cgxIUbsFmxppho6tnZeN3dq5vXq8hX7SUlXm60SpAG9xMC72tby8qnK5XdpS
	n2gA==
X-Gm-Message-State: AIVw110KBE4rnKF+Zjtoi5tJwZvrPUuzNXK6WUmE78+XSam1X58465oQ
	e4WhJGiRfTGGizTq
X-Received: by 10.98.206.194 with SMTP id y185mr1776179pfg.312.1501095517074; 
	Wed, 26 Jul 2017 11:58:37 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::9b53])
	by smtp.gmail.com with ESMTPSA id
	s15sm33245864pfk.42.2017.07.26.11.58.35
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 26 Jul 2017 11:58:35 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 26 Jul 2017 11:58:14 -0700
Message-Id: <20170726185815.8898-6-raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.3
In-Reply-To: <20170726185815.8898-1-raj.khem@gmail.com>
References: <20170726185815.8898-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 6/7] ssiapi: Fix build errors found with clang
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
X-List-Received-Date: Wed, 26 Jul 2017 18:58:36 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...itor-ordered-comparison-between-pointers-.patch | 39 ++++++++++++++++++++++
 meta-oe/recipes-support/ssiapi/ssiapi_1.0.1.bb     |  3 +-
 2 files changed, 41 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-support/ssiapi/ssiapi/0001-ssieventmonitor-ordered-comparison-between-pointers-.patch

diff --git a/meta-oe/recipes-support/ssiapi/ssiapi/0001-ssieventmonitor-ordered-comparison-between-pointers-.patch b/meta-oe/recipes-support/ssiapi/ssiapi/0001-ssieventmonitor-ordered-comparison-between-pointers-.patch
new file mode 100644
index 000000000..27df9b5de
--- /dev/null
+++ b/meta-oe/recipes-support/ssiapi/ssiapi/0001-ssieventmonitor-ordered-comparison-between-pointers-.patch
@@ -0,0 +1,39 @@
+From ea9ecf4bf305f9509d5822b3823658a40162f43c Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 25 Jul 2017 19:08:21 -0700
+Subject: [PATCH] ssieventmonitor: ordered comparison between pointers and
+ zero, actually with NULL
+
+Comparing which is large or small between a pointer and NULL
+however, looks completely illogical. Ordered comparison of
+two valid pointers is legit, but no pointer will be smaller
+than NULL , so comparing if a pointer is larger than NULL
+simply means if the pointer is not NULL.
+
+Fixes errors found with clang e.g.
+
+| ssieventmonitor.cpp:339:53: error: ordered comparison between pointer and zero ('char *' and 'int')
+|                 if (fgets(nextline, sizeof(nextline) - 1, mdstat) < 0) {
+|                     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ^ ~
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ tools/ssieventmonitor.cpp | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/tools/ssieventmonitor.cpp b/tools/ssieventmonitor.cpp
+index f04b8f0..7a00122 100644
+--- a/tools/ssieventmonitor.cpp
++++ b/tools/ssieventmonitor.cpp
+@@ -336,7 +336,7 @@ static int _read_mdstat(int fd)
+ 	if (!strncmp(line, "md", 2)) {
+ 	    if (strstr(line, INACTIVE_STR)) { /* possibly container */
+ 		char nextline[1024];
+-		if (fgets(nextline, sizeof(nextline) - 1, mdstat) < 0) {
++		if (fgets(nextline, sizeof(nextline) - 1, mdstat) != (char *) NULL) {
+ 		    fclose(mdstat);
+ 		    return 1;
+ 		}
+-- 
+2.13.3
+
diff --git a/meta-oe/recipes-support/ssiapi/ssiapi_1.0.1.bb b/meta-oe/recipes-support/ssiapi/ssiapi_1.0.1.bb
index 339637087..5eb4696b5 100644
--- a/meta-oe/recipes-support/ssiapi/ssiapi_1.0.1.bb
+++ b/meta-oe/recipes-support/ssiapi/ssiapi_1.0.1.bb
@@ -18,7 +18,8 @@ SRC_URI = "http://sourceforge.net/projects/irstessi/files/${BPN}.${PV}.tgz \
            file://0005-engine-Define-SENTINEL.patch \
            file://0006-tools-Add-missing-includes-and-use-realpath-instead-.patch \
            file://configure-cflags.patch \
-"
+           file://0001-ssieventmonitor-ordered-comparison-between-pointers-.patch \
+           "
 SRC_URI[md5sum] = "02f16d7cbd30d28034093212906591f5"
 SRC_URI[sha256sum] = "e10d283b0f211afb8ebd0bde87c097769613d30a052cdf164753e35e803264c7"
 
-- 
2.13.3


