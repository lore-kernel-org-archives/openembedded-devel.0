Return-Path: <raj.khem@gmail.com>
Received: from mail-it0-f52.google.com (mail-it0-f52.google.com
	[209.85.214.52])
	by mail.openembedded.org (Postfix) with ESMTP id A432A71D97
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Apr 2017 05:21:19 +0000 (UTC)
Received: by mail-it0-f52.google.com with SMTP id e132so40194352ite.1
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 23 Apr 2017 22:21:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=KTo1dIvFc5axF0rT/Gl9/Fok+2Y/37IyvvEGACBRnGM=;
	b=M3cJHFpAZsqBJPLNRojXooYhS3cXtkFvhpedAUKl6+mUOPspb59pcYSxZesUJH4XAW
	QI2HeTG3bifjqPpoaESitUCJ1mdMtWyC7RwKIo2Hwod3AcyNTh7kfXSIeI7wWlQoxq3v
	QI5/PK1/ir3DnzNgphJyKGjW7051ZjrEHsAbPjrA3JqVyWSmtmVx4dULAiyDlcurY1vr
	q25uj9GcG9lpaTM25hYyWHb7PgfsbL8t2cJSYSbQCKDWvtrR1BMaUNEed4WZR5LqrbLS
	dmQs+kWn42oGx4QCDSSyRbYUTJzUpGP8TithgAq9sI4Ep+W/veRPizM4c2qc03NMy7t6
	d0gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=KTo1dIvFc5axF0rT/Gl9/Fok+2Y/37IyvvEGACBRnGM=;
	b=HjF3J+AlSq+8yxxkduAS5gMcmaXkrv3gwnpQDfQF0H5pAzUnxr4/l6/n5OHhfIwWJT
	fLaBF/8t+k3kGJxgqg2VBZ+Ph2y3/Uv7gcHqNN2U3AHlMMWMa183KkhKINQnx87X3hop
	4J7kWrbVt4ZrfGwgK4ya0WW25TNqYs7ghIJ+PPhYFZedV77CcGzqKl6v9+cQA4phezlr
	okkipzUg+SPpMQMsFvRB1IsXUFNiGOY3he8I553r7d/gRVosb549zhN2eifi9DPsHDkI
	YDWj18F/Rlvt14aLcNQXNTiYMV5PT1n9rM+bLK7cpkZsjfjhx8V5/LEU3BknsPGWsXPj
	8BFg==
X-Gm-Message-State: AN3rC/5uE6XFRnTucbRXMb3QhbM4ch0HoQW75Kk/SxUPo8N7t8JWaczf
	qwqNd3aDJ1Tytc15
X-Received: by 10.98.223.200 with SMTP id d69mr23371883pfl.100.1493011280123; 
	Sun, 23 Apr 2017 22:21:20 -0700 (PDT)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	v13sm24001176pgo.44.2017.04.23.22.21.18
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 23 Apr 2017 22:21:18 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 23 Apr 2017 22:20:46 -0700
Message-Id: <20170424052058.4952-5-raj.khem@gmail.com>
X-Mailer: git-send-email 2.12.2
In-Reply-To: <20170424052058.4952-1-raj.khem@gmail.com>
References: <20170424052058.4952-1-raj.khem@gmail.com>
Subject: [meta-networking][PATCH 05/17] ipsec-tools: Fix build with gcc7
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
X-List-Received-Date: Mon, 24 Apr 2017 05:21:19 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...parse-clear-memory-equal-to-size-of-array.patch | 30 ++++++++++++++++++++++
 .../ipsec-tools/ipsec-tools_0.8.2.bb               |  1 +
 2 files changed, 31 insertions(+)
 create mode 100644 meta-networking/recipes-support/ipsec-tools/ipsec-tools/0002-cfparse-clear-memory-equal-to-size-of-array.patch

diff --git a/meta-networking/recipes-support/ipsec-tools/ipsec-tools/0002-cfparse-clear-memory-equal-to-size-of-array.patch b/meta-networking/recipes-support/ipsec-tools/ipsec-tools/0002-cfparse-clear-memory-equal-to-size-of-array.patch
new file mode 100644
index 000000000..e9dd84aaa
--- /dev/null
+++ b/meta-networking/recipes-support/ipsec-tools/ipsec-tools/0002-cfparse-clear-memory-equal-to-size-of-array.patch
@@ -0,0 +1,30 @@
+From a5c59f6a1479947d33dba5191724cc5fc88a614b Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 22 Apr 2017 10:39:57 -0700
+Subject: [PATCH 2/2] cfparse: clear memory equal to size of array
+
+Fixes compiler error
+cfparse.y: In function 'set_isakmp_proposal':
+cfparse.y:2567:3: error: 'memset' used with length equal to number of elements without multiplication by element size [-Werror=memset-elt-size]
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/racoon/cfparse.y | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/racoon/cfparse.y b/src/racoon/cfparse.y
+index 0d9bd67..5d9c67b 100644
+--- a/src/racoon/cfparse.y
++++ b/src/racoon/cfparse.y
+@@ -2564,7 +2564,7 @@ set_isakmp_proposal(rmconf)
+ 		plog(LLV_DEBUG2, LOCATION, NULL,
+ 			"encklen=%d\n", s->encklen);
+ 
+-		memset(types, 0, ARRAYLEN(types));
++		memset(types, 0, sizeof(types));
+ 		types[algclass_isakmp_enc] = s->algclass[algclass_isakmp_enc];
+ 		types[algclass_isakmp_hash] = s->algclass[algclass_isakmp_hash];
+ 		types[algclass_isakmp_dh] = s->algclass[algclass_isakmp_dh];
+-- 
+2.12.2
+
diff --git a/meta-networking/recipes-support/ipsec-tools/ipsec-tools_0.8.2.bb b/meta-networking/recipes-support/ipsec-tools/ipsec-tools_0.8.2.bb
index 8f98b6c5c..d7e8b2596 100644
--- a/meta-networking/recipes-support/ipsec-tools/ipsec-tools_0.8.2.bb
+++ b/meta-networking/recipes-support/ipsec-tools/ipsec-tools_0.8.2.bb
@@ -23,6 +23,7 @@ SRC_URI = "http://ftp.netbsd.org/pub/NetBSD/misc/ipsec-tools/0.8/ipsec-tools-${P
            file://fix-CVE-2015-4047.patch \
            file://0001-Fix-build-with-clang.patch \
            file://0001-Fix-header-issues-found-with-musl-libc.patch \
+           file://0002-cfparse-clear-memory-equal-to-size-of-array.patch \
            "
 SRC_URI[md5sum] = "d53ec14a0a3ece64e09e5e34b3350b41"
 SRC_URI[sha256sum] = "8eb6b38716e2f3a8a72f1f549c9444c2bc28d52c9536792690564c74fe722f2d"
-- 
2.12.2


