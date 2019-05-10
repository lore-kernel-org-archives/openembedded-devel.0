Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 82E0E7E0A2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 May 2019 11:55:19 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 450pYh4h2fz7k
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 May 2019 13:55:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1557489320;
	bh=HbIRyPDTXwUme8JF8Ea5scXO/ph0qm2/lWfzjASmQ1Q=;
	h=From:To:Subject:Date:From;
	b=jyL+CEdCZBAtXaLt2Gw2y0UTPXS06y5s80rXsyebOxNJEyEfdeAFc2IycNPkbPA0d
	/XPji3hHtrh+qtLcQtyEahwB5lCe9abxuucpqxK+1gu4uQ47CGR9xDuHLQ4BlozW6C
	Z1YUq8uMsqRNbUvpMuRh43CQqWrUrOxP1qToWFtBOQCgvGKRR1uJiGzbpBlDiBjyIf
	EEzHTXgJY24FxReCqRFjmeCRrVSZ9REH2ARJMugGh9wkLOnQAYw8j0ITE5JppkCK/m
	3FWt3ie4ahrcX4i/j7rUERg5+kNOrLYXO77m616+fTTZpjHSJX9VAc8PGAvwzsDI63
	DN3lHwxh50OklNlL4BTEXjlBVqpqmaDnn+D4MUMy4td1GAURcCU6rgx7bmGKnczORR
	1/dlzqbUhw0gV+fYl/hsFACcJdH+vqMwN3A+PZ4W5r7K2IalEpJASzJbSPEwCGSzgx
	kl1JWqMNc79+c4Uhm40xAnhPzV62eUUpoKrRdsD4wl/OsNoWs5WW99z5MIN898rdjY
	xkGEv9MSmznDhPCROOLIpHs/gnIWSkvSqX13/AoKZSwJRgmmnikybS9HB6sOSRDfJp
	yIiY3fA/Z2WXzIa6j+F+957OdOSJmccR5NXIyBR02TQ70eVz7kNdUfyLAIzfW/w+v5
	Y6C15bwnwvj+j4OEjS4u6IRM=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 10 May 2019 14:55:10 +0300
Message-Id: <20190510115515.19491-14-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [meta-oe][PATCH] inotify-tools: Upgrade 3.14 -> 3.20.1
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
X-List-Received-Date: Fri, 10 May 2019 11:55:20 -0000

Remove patch applied upstream.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 ...ifywait-fix-compile-error-with-GCC-6.patch | 45 -------------------
 .../inotify-tools/inotify-tools_git.bb        |  5 +--
 2 files changed, 2 insertions(+), 48 deletions(-)
 delete mode 100644 meta-oe/recipes-support/inotify-tools/inotify-tools/inotifywait-fix-compile-error-with-GCC-6.patch

diff --git a/meta-oe/recipes-support/inotify-tools/inotify-tools/inotifywait-fix-compile-error-with-GCC-6.patch b/meta-oe/recipes-support/inotify-tools/inotify-tools/inotifywait-fix-compile-error-with-GCC-6.patch
deleted file mode 100644
index ba042a24b..000000000
--- a/meta-oe/recipes-support/inotify-tools/inotify-tools/inotifywait-fix-compile-error-with-GCC-6.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-From 7affb288d6c0726e7b1ebc317a878927b6ef0d02 Mon Sep 17 00:00:00 2001
-From: Andrea Galbusera <gizero@gmail.com>
-Date: Tue, 13 Sep 2016 08:10:29 +0200
-Subject: [PATCH] inotifywait: fix compile error with GCC 6
-
-Fails to compile with misleading-indentation error
-
-| src/inotifywait.c: In function 'output_event_csv':
-| src/inotifywait.c:126:5: error: this 'if' clause does not guard... [-Werror=misleading-indentation]
-|      if (filename != NULL)
-|      ^~
-| src/inotifywait.c:129:2: note: ...this statement, but the latter is misleadingly indented as if it is guarded by the 'if'
-|   printf("%s,", csv_escape( inotifytools_event_to_str( event->mask ) ) );
-|   ^~~~~~
-| cc1: all warnings being treated as errors
-
-Fix indentation to resolve.
-
-Upstream-Status: Submitted [https://github.com/rvoicilas/inotify-tools/pull/66]
-
-Signed-off-by: Andrea Galbusera <gizero@gmail.com>
----
- src/inotifywait.c | 6 +++---
- 1 file changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/src/inotifywait.c b/src/inotifywait.c
-index c5ce5e3..404a85b 100644
---- a/src/inotifywait.c
-+++ b/src/inotifywait.c
-@@ -122,9 +122,9 @@ void validate_format( char * fmt ) {
- 
- 
- void output_event_csv( struct inotify_event * event ) {
--    char *filename = csv_escape(inotifytools_filename_from_wd(event->wd));
--    if (filename != NULL)
--        printf("%s,", filename);
-+	char *filename = csv_escape(inotifytools_filename_from_wd(event->wd));
-+	if (filename != NULL)
-+		printf("%s,", filename);
- 
- 	printf("%s,", csv_escape( inotifytools_event_to_str( event->mask ) ) );
- 	if ( event->len > 0 )
--- 
-1.9.1
-
diff --git a/meta-oe/recipes-support/inotify-tools/inotify-tools_git.bb b/meta-oe/recipes-support/inotify-tools/inotify-tools_git.bb
index efc753d5b..05ca4b4ad 100644
--- a/meta-oe/recipes-support/inotify-tools/inotify-tools_git.bb
+++ b/meta-oe/recipes-support/inotify-tools/inotify-tools_git.bb
@@ -5,11 +5,10 @@ SECTION = "console/devel"
 LICENSE = "GPL-2.0"
 LIC_FILES_CHKSUM = "file://COPYING;md5=ac6c26e52aea428ee7f56dc2c56424c6"
 
-SRCREV = "1df9af4d6cd0f4af4b1b19254bcf056aed4ae395"
-PV = "3.14+git${SRCPV}"
+SRCREV = "e203934e46784bb34c213078423ba1678e0c4936"
+PV = "3.20.1"
 
 SRC_URI = "git://github.com/rvoicilas/${BPN} \
-           file://inotifywait-fix-compile-error-with-GCC-6.patch \
            file://inotify-nosys-fix-system-call-number.patch \
           "
 
-- 
2.17.1


