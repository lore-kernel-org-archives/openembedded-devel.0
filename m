Received: from mail-px0-f175.google.com ([209.85.212.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <graham.gower@gmail.com>) id 1PNcyT-0005Eg-6K
	for openembedded-devel@lists.openembedded.org;
	Wed, 01 Dec 2010 04:03:18 +0100
Received: by pxi17 with SMTP id 17so1037219pxi.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Nov 2010 19:01:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from
	:user-agent:mime-version:to:subject:content-type
	:content-transfer-encoding;
	bh=OI5fpYEofGMYzgEiz//+ELNmFtG5nwNLTlaZx55uWrY=;
	b=RXKWNQy07a1tNl9gO7k8WD9qG+nYoNoDggDdWKZyhFZFQuA+TxXQsfbXoD7Thme48T
	58KVglZ8yOl5tP6xDIQO3amXnvrXexlfC0Fb+bctIGW8sEoF2u3NT+WpEF+huHtJXrUp
	c4bNRW2hdzHk1cZ0g+2qK1aQr/+TuXep2CtGY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject
	:content-type:content-transfer-encoding;
	b=ATxJ4YTdiVmcdKc22Bb+V3Nvi7WpjhmflKoA5scqXGsqP0ZH8jkZY4EpmqA9NIJpNM
	sm8ktvfIFycyf0cf2d254YpM0t9d4dTBZgWX6W84dTqIs7p81bo8jRUfIKsd0g+j5c7z
	HYMLiuJ+mpf36nevHQwD47NCRzMS5QldsdqdY=
Received: by 10.142.221.17 with SMTP id t17mr8115589wfg.138.1291172515309;
	Tue, 30 Nov 2010 19:01:55 -0800 (PST)
Received: from [10.0.0.5] (eth7090.sa.adsl.internode.on.net [150.101.58.177])
	by mx.google.com with ESMTPS id p8sm9814787wff.4.2010.11.30.19.01.48
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 30 Nov 2010 19:01:53 -0800 (PST)
Message-ID: <4CF5BA94.1020007@gmail.com>
Date: Wed, 01 Dec 2010 13:31:40 +1030
From: Graham Gower <graham.gower@gmail.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.15) Gecko/20101113 Thunderbird/3.0.10
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.212.175
X-SA-Exim-Mail-From: graham.gower@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_LOW,SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] e2fsprogs_1.41.9.bb: Fix build for uclibc when DISTRO_FEATURES lacks largefile.
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
X-List-Received-Date: Wed, 01 Dec 2010 03:03:18 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

	CC llseek.c
llseek.c:65:22: error: expected declaration specifiers or '...' before '_llseek'
llseek.c:65:43: error: expected declaration specifiers or '...' before 'fd'
llseek.c:65:60: error: expected declaration specifiers or '...' before 'offset_high'
llseek.c:66:19: error: expected declaration specifiers or '...' before 'offset_low'
llseek.c:66:44: error: expected declaration specifiers or '...' before 'result'
llseek.c:67:18: error: expected declaration specifiers or '...' before 'origin'
llseek.c: In function '_syscall5':
llseek.c:71:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
llseek.c:91:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
llseek.c:65:1: error: parameter name omitted
llseek.c:65:22: error: parameter name omitted
llseek.c:65:43: error: parameter name omitted
llseek.c:66:4: error: parameter name omitted
llseek.c:66:19: error: parameter name omitted
llseek.c:67:4: error: parameter name omitted
llseek.c:114:1: error: expected '{' at end of input
make[2]: *** [llseek.o] Error 1

Signed-off-by: Graham Gower <graham.gower@gmail.com>
---
 .../e2fsprogs/e2fsprogs-1.41.9/llseek-uclibc.patch |   24 ++++++++++++++++++++
 recipes/e2fsprogs/e2fsprogs_1.41.9.bb              |    4 ++-
 2 files changed, 27 insertions(+), 1 deletions(-)
 create mode 100644 recipes/e2fsprogs/e2fsprogs-1.41.9/llseek-uclibc.patch

diff --git a/recipes/e2fsprogs/e2fsprogs-1.41.9/llseek-uclibc.patch b/recipes/e2fsprogs/e2fsprogs-1.41.9/llseek-uclibc.patch
new file mode 100644
index 0000000..026db2a
--- /dev/null
+++ b/recipes/e2fsprogs/e2fsprogs-1.41.9/llseek-uclibc.patch
@@ -0,0 +1,24 @@
+diff -ur e2fsprogs-1.41.9.orig/lib/blkid/llseek.c e2fsprogs-1.41.9/lib/blkid/llseek.c
+--- e2fsprogs-1.41.9.orig/lib/blkid/llseek.c	2009-08-13 11:09:57.000000000 +0930
++++ e2fsprogs-1.41.9/lib/blkid/llseek.c	2010-12-01 13:23:48.000000000 +1030
+@@ -28,7 +28,7 @@
+ 
+ #include "blkidP.h"
+ 
+-#ifdef __linux__
++#if defined(__linux__) && !(defined(__UCLIBC__) && !defined(__USE_FILE_OFFSET64))
+ 
+ #if defined(HAVE_LSEEK64) && defined(HAVE_LSEEK64_PROTOTYPE)
+ 
+diff -ur e2fsprogs-1.41.9.orig/lib/ext2fs/llseek.c e2fsprogs-1.41.9/lib/ext2fs/llseek.c
+--- e2fsprogs-1.41.9.orig/lib/ext2fs/llseek.c	2009-08-13 11:09:57.000000000 +0930
++++ e2fsprogs-1.41.9/lib/ext2fs/llseek.c	2010-12-01 13:18:26.000000000 +1030
+@@ -28,7 +28,7 @@
+ #include "et/com_err.h"
+ #include "ext2fs/ext2_io.h"
+ 
+-#ifdef __linux__
++#if defined(__linux__) && !(defined(__UCLIBC__) && !defined(__USE_FILE_OFFSET64))
+ 
+ #if defined(HAVE_LSEEK64) && defined(HAVE_LSEEK64_PROTOTYPE)
+ 
diff --git a/recipes/e2fsprogs/e2fsprogs_1.41.9.bb b/recipes/e2fsprogs/e2fsprogs_1.41.9.bb
index 6a8c113..026e35a 100644
--- a/recipes/e2fsprogs/e2fsprogs_1.41.9.bb
+++ b/recipes/e2fsprogs/e2fsprogs_1.41.9.bb
@@ -1,6 +1,8 @@
 require e2fsprogs.inc
 
-PR = "${INC_PR}"
+PR = "${INC_PR}.1"
+
+SRC_URI += "file://llseek-uclibc.patch"
 
 do_configure() {
         oe_runconf
-- 
1.7.1



