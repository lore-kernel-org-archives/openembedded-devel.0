Received: from [209.85.216.196] (helo=mail-px0-f196.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1Mk7jr-0007Jp-I8
	for openembedded-devel@lists.openembedded.org;
	Sun, 06 Sep 2009 04:44:23 +0200
Received: by pxi34 with SMTP id 34so1576719pxi.4
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 05 Sep 2009 19:25:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=QX6otTAQbiZUdq1/FlXeCODGKK+4kb8E/1+m/UZAZ8o=;
	b=EDiySoLIWteu5iKiy3bH4iABYLVoVG5R/Cxng6FCWV0GVMhJFwX+SK5B7oiT719XiO
	fpXoAS7rvdWiHZ+3SFFMf9RMJPQr2UCTGUrZm4CVCYwBLW0cd/wcy4ORzeGU841EH35p
	knFLUrSUq4B4DPp3L/YZFx91Tq4dmv0pM2Scw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=iYWJryYyQMdk4ELU+WTawGk6Pd5p9cNQ0fhbETYlKFHfsrue4WtbijZ8RWdGzYJ/e/
	wborUL7kAZE1ljhoX6KUuYrUGM3f97qXiFf53jlJ61v/I0ruK9dWsztNLZbwLNAhxgHJ
	4p1UBNv4GDfYfkeeSuSo8V71XJeeJaIeyn0Uw=
Received: by 10.114.242.5 with SMTP id p5mr304153wah.66.1252203913938;
	Sat, 05 Sep 2009 19:25:13 -0700 (PDT)
Received: from localhost (adsl-71-146-28-171.dsl.pltn13.sbcglobal.net
	[71.146.28.171])
	by mx.google.com with ESMTPS id 20sm661940pzk.13.2009.09.05.19.25.12
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sat, 05 Sep 2009 19:25:13 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  5 Sep 2009 19:25:06 -0700
Message-Id: <1252203906-4659-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.6.3.3
Subject: [PATCH] uclibc_0.9.30.1: Disable STDIO_GETC|PUTC MACROs
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
X-List-Received-Date: Sun, 06 Sep 2009 02:44:23 -0000

* There is a problem with threads enabled and hiding
  __fgetc_unlocked and __fputc_unlocked which gets pulled
  in with the macros. This patch disables the macros
  and it will use the functions to perform these functions

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 recipes/uclibc/uclibc-0.9.30.1/uClibc.distro |    4 ++--
 recipes/uclibc/uclibc_0.9.30.1.bb            |    2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes/uclibc/uclibc-0.9.30.1/uClibc.distro b/recipes/uclibc/uclibc-0.9.30.1/uClibc.distro
index 31029a3..042ea4c 100644
--- a/recipes/uclibc/uclibc-0.9.30.1/uClibc.distro
+++ b/recipes/uclibc/uclibc-0.9.30.1/uClibc.distro
@@ -83,8 +83,8 @@ UCLIBC_HAS_STDIO_BUILTIN_BUFFER_NONE=y
 # UCLIBC_HAS_STDIO_BUILTIN_BUFFER_4 is not set
 # UCLIBC_HAS_STDIO_BUILTIN_BUFFER_8 is not set
 # UCLIBC_HAS_STDIO_SHUTDOWN_ON_ABORT is not set
-UCLIBC_HAS_STDIO_GETC_MACRO=y
-UCLIBC_HAS_STDIO_PUTC_MACRO=y
+# UCLIBC_HAS_STDIO_GETC_MACRO is not set
+# UCLIBC_HAS_STDIO_PUTC_MACRO is not set
 UCLIBC_HAS_STDIO_AUTO_RW_TRANSITION=y
 # UCLIBC_HAS_FOPEN_LARGEFILE_MODE is not set
 UCLIBC_HAS_FOPEN_EXCLUSIVE_MODE=y
diff --git a/recipes/uclibc/uclibc_0.9.30.1.bb b/recipes/uclibc/uclibc_0.9.30.1.bb
index 821e06e..ae558e0 100644
--- a/recipes/uclibc/uclibc_0.9.30.1.bb
+++ b/recipes/uclibc/uclibc_0.9.30.1.bb
@@ -9,7 +9,7 @@
 UCLIBC_BASE ?= "0.9.30.1"
 
 require uclibc.inc
-PR = "${INC_PR}.0"
+PR = "${INC_PR}.1"
 
 PROVIDES += "virtual/${TARGET_PREFIX}libc-for-gcc"
 
-- 
1.6.3.3



