Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 380827E099
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 May 2019 11:55:19 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 450pYh2WzKz7P
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 May 2019 13:55:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1557489320;
	bh=+uqaJgmrcTc6hvt+yC8n044AnYTi+FQPdIMz/ySsuuA=;
	h=From:To:Subject:Date:From;
	b=XzlxF+2+k9OMHsP/XbLaEhpxBDERq/CTt62JfYji+0AlQGttbvhtr1MgM2MC8JSS3
	E56cGchlYt0vNqhhLQHveMDfYCDoX0dHGNKpVxsA9xyzYs2kKVjKNXV0oIE4WWB+gR
	a9rQqjj6DgV7xdUEnPZqdDMLqYEkK8mqa8+j3pGsM+geDHNSVeFUS5WbVGMDfvs/pF
	b7v5ra3zExq9kAgaRbWOjfSITLsWHgYzxCSJP5YTKdicSyCApZ3s7vjtVZD6ShXLhg
	f7r1gY1LmwFvCJZEqDVDE+h5a8m2OMIx2w1lRf1gzUsjWzyKBOvFoz7EjFWRX8O0VY
	65yfsVjml9MuWzKTd1xo1ZGGNYqMMiJ0BDAESQ+JZUBKcBJqf58Pf8AdCQepym5APE
	nqGoXsyf7xPsz8aZECH0+/1TtOMS38BzNmBbyk3C7KGl9tzKZhxpw0GEET288wMoCI
	0iYOKL0zCAAkkJ55IOkUo5cWK8WrdhUinYSSKzaElmbt11ExPjlq9jOLY8n1Ssmj9h
	fSPgDYk2NN93ep8jqUxOBXR3q/IMZpBtfX4xyCIJXhTHM8KeYSSa/m1BG8FaiSgafP
	MlzklRSQDScIHdXugxqgPB6dlcWmjmx7tqsEFBh4uHTV6WdyWOzTzw2MMmnbmdpy5B
	ugdIWvUXuAsUTw346KmjRNXE=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 10 May 2019 14:55:09 +0300
Message-Id: <20190510115515.19491-13-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [meta-oe][PATCH] daemonize: Upgrade 1.7.7 -> 1.7.8
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
X-List-Received-Date: Fri, 10 May 2019 11:55:19 -0000

Remova patch applied upstream.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 .../daemonize/daemonize_git.bb                |  6 ++---
 .../files/fix-ldflags-for-gnuhash.patch       | 23 -------------------
 2 files changed, 3 insertions(+), 26 deletions(-)
 delete mode 100644 meta-oe/recipes-support/daemonize/files/fix-ldflags-for-gnuhash.patch

diff --git a/meta-oe/recipes-support/daemonize/daemonize_git.bb b/meta-oe/recipes-support/daemonize/daemonize_git.bb
index 4790883a7..1e49eefcc 100644
--- a/meta-oe/recipes-support/daemonize/daemonize_git.bb
+++ b/meta-oe/recipes-support/daemonize/daemonize_git.bb
@@ -2,13 +2,13 @@ SUMMARY = "A tool to run a command as a daemon"
 HOMEPAGE = "http://software.clapper.org/daemonize/"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://LICENSE.md;md5=3cf9084faa88bc8554a9139d8d7dd35f"
-PV = "1.7.7+git${SRCPV}"
+PV = "1.7.8"
 
 inherit autotools
 
-SRCREV = "6b10308b13c13e7b911e75e27bf7e65c30d58799"
+SRCREV = "18869a797dab12bf1c917ba3b4782fef484c407c"
 SRC_URI = "git://github.com/bmc/daemonize.git \
-           file://fix-ldflags-for-gnuhash.patch"
+"
 
 S = "${WORKDIR}/git"
 
diff --git a/meta-oe/recipes-support/daemonize/files/fix-ldflags-for-gnuhash.patch b/meta-oe/recipes-support/daemonize/files/fix-ldflags-for-gnuhash.patch
deleted file mode 100644
index 4fa2ee1b3..000000000
--- a/meta-oe/recipes-support/daemonize/files/fix-ldflags-for-gnuhash.patch
+++ /dev/null
@@ -1,23 +0,0 @@
-Add the LDFLAGS to the final link to avoid errors with missing GNU_HASH
-
-Upstream-Status: Submitted [https://github.com/bmc/daemonize/pull/22]
-
-Signed-off-by: Derek Straka <derek@asterius.io>
-
-diff --git a/Makefile.in b/Makefile.in
-index 8a4d078..40d3dee 100644
---- a/Makefile.in
-+++ b/Makefile.in
-@@ -24,10 +24,10 @@ LDFLAGS		= @LDFLAGS@
- all: daemonize 
- 
- daemonize: daemonize.o getopt.o $(MISSING_OBJECTS)
--	$(CC) $(CFLAGS) -o $@ $^
-+	$(CC) $(CFLAGS) $(LDFLAGS) -o $@ $^
- 
- testdaemon: testdaemon.o
--	$(CC) $(CFLAGS) -o $@ $^
-+	$(CC) $(CFLAGS) $(LDFLAGS) -o $@ $^
-  
- psman: daemonize.ps
- 
-- 
2.17.1


