Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f195.google.com (mail-qk0-f195.google.com
	[209.85.220.195])
	by mail.openembedded.org (Postfix) with ESMTP id 3F3B0771DB
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  9 Aug 2016 21:52:38 +0000 (UTC)
Received: by mail-qk0-f195.google.com with SMTP id x67so2029046qke.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 09 Aug 2016 14:52:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=KosiN95/vRlkS7dbctuGt6kmurAAZ6oHV+Lket7dxuQ=;
	b=jCwO4dM8lc/pZa5t5NlAGfJgftWzCgKZG9QcOleNUqGIT9rCckWnTvmEgsM6TTjyxM
	SWRlstQ/5BSS1PHIO0pR6hBQDqINaS04EfZcIz2Cu4BJbW4WAJKi5LGSDYDakXbgomP8
	WJQjz9lt8fctI1/6m6rm5wi4LXjVfHZPgSPgrlXMhXZ7yo1NNlICxzLx0IB+OmkBksgI
	J8K0PeVfs4WGJbNc6j+mXr5Xe8iblbg6Sg3o1Ehiw58VsP3qYlNDt0/PyW48NZCDwAtp
	MmKzmA205fgyyycPWHiI5hopsLKvhlU8lQFrF5ZUSXyd4TUjh9ZQ0VICjN+RW7RZVmzy
	dI9A==
X-Gm-Message-State: AEkooutKXHjxWcjbQvo4/pEuURgaNbHHPRtgC8OCZrEIsskZVYaXka32MjbHc+Nzx0ZOFw==
X-Received: by 10.55.154.22 with SMTP id c22mr752317qke.36.1470779559074;
	Tue, 09 Aug 2016 14:52:39 -0700 (PDT)
Received: from lnx-desktop.star.lab (c-73-172-178-168.hsd1.md.comcast.net.
	[73.172.178.168]) by smtp.gmail.com with ESMTPSA id
	w10sm21543967qtc.28.2016.08.09.14.52.38
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 09 Aug 2016 14:52:38 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  9 Aug 2016 17:52:26 -0400
Message-Id: <1470779546-5584-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 1.9.1
Subject: [meta-oe][PATCH] daemonize: update to version 1.7.7
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
X-List-Received-Date: Tue, 09 Aug 2016 21:52:39 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-oe/recipes-support/daemonize/daemonize_git.bb |  7 ++++---
 .../daemonize/files/fix-ldflags-for-gnuhash.patch  | 23 ++++++++++++++++++++++
 2 files changed, 27 insertions(+), 3 deletions(-)
 create mode 100644 meta-oe/recipes-support/daemonize/files/fix-ldflags-for-gnuhash.patch

diff --git a/meta-oe/recipes-support/daemonize/daemonize_git.bb b/meta-oe/recipes-support/daemonize/daemonize_git.bb
index 8b1591c..4790883 100644
--- a/meta-oe/recipes-support/daemonize/daemonize_git.bb
+++ b/meta-oe/recipes-support/daemonize/daemonize_git.bb
@@ -2,12 +2,13 @@ SUMMARY = "A tool to run a command as a daemon"
 HOMEPAGE = "http://software.clapper.org/daemonize/"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://LICENSE.md;md5=3cf9084faa88bc8554a9139d8d7dd35f"
-PV = "1.7.3+git${SRCPV}"
+PV = "1.7.7+git${SRCPV}"
 
 inherit autotools
 
-SRCREV = "a4ac64a243af91dc434b7a3915f43482d528a2b1"
-SRC_URI = "git://github.com/bmc/daemonize.git"
+SRCREV = "6b10308b13c13e7b911e75e27bf7e65c30d58799"
+SRC_URI = "git://github.com/bmc/daemonize.git \
+           file://fix-ldflags-for-gnuhash.patch"
 
 S = "${WORKDIR}/git"
 
diff --git a/meta-oe/recipes-support/daemonize/files/fix-ldflags-for-gnuhash.patch b/meta-oe/recipes-support/daemonize/files/fix-ldflags-for-gnuhash.patch
new file mode 100644
index 0000000..4fa2ee1
--- /dev/null
+++ b/meta-oe/recipes-support/daemonize/files/fix-ldflags-for-gnuhash.patch
@@ -0,0 +1,23 @@
+Add the LDFLAGS to the final link to avoid errors with missing GNU_HASH
+
+Upstream-Status: Submitted [https://github.com/bmc/daemonize/pull/22]
+
+Signed-off-by: Derek Straka <derek@asterius.io>
+
+diff --git a/Makefile.in b/Makefile.in
+index 8a4d078..40d3dee 100644
+--- a/Makefile.in
++++ b/Makefile.in
+@@ -24,10 +24,10 @@ LDFLAGS		= @LDFLAGS@
+ all: daemonize 
+ 
+ daemonize: daemonize.o getopt.o $(MISSING_OBJECTS)
+-	$(CC) $(CFLAGS) -o $@ $^
++	$(CC) $(CFLAGS) $(LDFLAGS) -o $@ $^
+ 
+ testdaemon: testdaemon.o
+-	$(CC) $(CFLAGS) -o $@ $^
++	$(CC) $(CFLAGS) $(LDFLAGS) -o $@ $^
+  
+ psman: daemonize.ps
+ 
-- 
1.9.1


