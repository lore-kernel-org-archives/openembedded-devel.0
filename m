Received: from mail-oa0-f47.google.com ([209.85.219.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mario.goulart@gmail.com>) id 1TfZfO-0001aL-PZ
	for openembedded-devel@lists.openembedded.org;
	Mon, 03 Dec 2012 18:18:51 +0100
Received: by mail-oa0-f47.google.com with SMTP id h1so2831102oag.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 03 Dec 2012 09:04:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:x-mailer;
	bh=65Ve+spUPZGdAEw+t8DegkPoukL4Xn1faH6b6Si+0Jw=;
	b=hohGDLz8JFlgYxxQPr/gmJHZlYOMCHTXyUVDcwNOnVImtHbB+kv4+J91TWWJIc8sbw
	xRCXSX5AIjtoYeTW5JmD9YCyLiyHkImvTbRhF2DhCW0LExVLZzS7/DoR9ilLMjpUo8/4
	Zi+enS/+ZgTEs+Erf9B0k+c4YrJFbwXHx9Ebb2zcI4aYAKy3jx/xhCAhtfLjwekEWGB/
	dUyM9DNO88dr/4RyA5NyrqURi7rWwt43G19h39E9E6XojCtcTh5T1CzHdLKQzf6Yflg+
	tTfRLAEEpcXQVYvsvuNUtZXttSFPXJTvFsaDhvh8WJSWktowHgcHvr0vOnv+A4cr5Axq
	M8iA==
Received: by 10.60.28.74 with SMTP id z10mr3719236oeg.29.1354554268504;
	Mon, 03 Dec 2012 09:04:28 -0800 (PST)
Received: from localhost.localdomain ([187.23.153.69])
	by mx.google.com with ESMTPS id f7sm12213743oef.8.2012.12.03.09.04.26
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 03 Dec 2012 09:04:27 -0800 (PST)
Sender: Mario Domenech Goulart <mario.goulart@gmail.com>
From: Mario Domenech Goulart <mario@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  3 Dec 2012 15:04:10 -0200
Message-Id: <1354554250-12014-1-git-send-email-mario@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
Cc: Mario Domenech Goulart <mario@ossystems.com.br>
Subject: [PATCH] pulseaudio: explicitly set --with-database=simple
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
X-List-Received-Date: Mon, 03 Dec 2012 17:18:51 -0000

The default value for --with-database is "auto".  So, if some package
installs a database library and pulseaudio auto detects, that library
will be added to the dependencies list, causing a dependency error at
do_rootfs time.  For example, samba installs libtdb, which is one of
the pulseaudio supported databases.

Signed-off-by: Mario Domenech Goulart <mario@ossystems.com.br>
---
 meta/recipes-multimedia/pulseaudio/pulseaudio.inc  |    1 +
 .../pulseaudio/pulseaudio_2.1.bb                   |    2 +-
 2 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
index d9a1b94..6633e38 100644
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
@@ -39,6 +39,7 @@ EXTRA_OECONF = "\
 		--with-access-group=audio \
 		--disable-openssl \
 		--disable-xen \
+		--with-database=simple \
 "
 
 PARALLEL_MAKE = ""
diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio_2.1.bb b/meta/recipes-multimedia/pulseaudio/pulseaudio_2.1.bb
index 811dc0f..a576368 100644
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio_2.1.bb
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio_2.1.bb
@@ -1,6 +1,6 @@
 require pulseaudio.inc
 
-PR = "r14"
+PR = "r15"
 
 DEPENDS += "libjson gdbm speex libxml-parser-perl-native"
 
-- 
1.7.2.5



