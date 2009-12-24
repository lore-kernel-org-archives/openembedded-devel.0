Received: from mail-pz0-f192.google.com ([209.85.222.192])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <camelguo@gmail.com>) id 1NNiua-0008Dh-QS
	for openembedded-devel@lists.openembedded.org;
	Thu, 24 Dec 2009 09:19:12 +0100
Received: by pzk30 with SMTP id 30so5504096pzk.24
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Dec 2009 00:17:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=3eEOWrZ2OdLrP7ycIw5ktRXrsCvuoSWQSplavMch2Ko=;
	b=ODpv+D+7+taGw9dzROfWcPZY8P5jB8ltxO2VKJ1Dc8TS19ghAF3vDsy8XtIgi8YUwq
	/OeB0WQ2DBovVAYeEcFupi8UqujjSGkxAEXX/RL+13eP+J8kaokHnPtcQEN1ts9tsDys
	Ie0G7bmIs3STYCWnRv+A2IcaPfmPTwDXfpQXQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=NM4ZWrUuc2BjfeIOLMrhWfBZLwfTxxErPYWd0+zhPUItED5gnNwVcGNmlIieL+jTmm
	K3z/6uxJ9VP4kZVPgooUZLeo8zD0uCnvfn8xG0Zm3LjQcOd2kocgr0wWvL5y/JF8guQS
	9jkzWQUQJZ4oObEc9NNhdxUVAytprnh8z0gZU=
Received: by 10.114.55.34 with SMTP id d34mr5696303waa.225.1261642634642;
	Thu, 24 Dec 2009 00:17:14 -0800 (PST)
Received: from localhost ([123.162.69.101])
	by mx.google.com with ESMTPS id 23sm7598672pzk.8.2009.12.24.00.17.11
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 24 Dec 2009 00:17:14 -0800 (PST)
From: Guo Hongruan <camelguo@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 24 Dec 2009 16:17:00 +0800
Message-Id: <1261642620-16347-1-git-send-email-camelguo@gmail.com>
X-Mailer: git-send-email 1.5.4.3
In-Reply-To: <>
References: <>
X-SA-Exim-Connect-IP: 209.85.222.192
X-SA-Exim-Mail-From: camelguo@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [PATCH] Fix compilation error of events.c in ltrace on i386 target
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
X-List-Received-Date: Thu, 24 Dec 2009 08:19:12 -0000

on qemux86/minimal, the compilation of ltrace error reporting lack of some macro started with PTRACE_EVENT, this patch fixes this problem.
---
 .../files/ltrace-fix-ptrace-event-macros.patch     |   12 ++++++++++++
 recipes/ltrace/ltrace_0.5.3.bb                     |    4 ++++
 2 files changed, 16 insertions(+), 0 deletions(-)
 create mode 100644 recipes/ltrace/files/ltrace-fix-ptrace-event-macros.patch

diff --git a/recipes/ltrace/files/ltrace-fix-ptrace-event-macros.patch b/recipes/ltrace/files/ltrace-fix-ptrace-event-macros.patch
new file mode 100644
index 0000000..7232ca8
--- /dev/null
+++ b/recipes/ltrace/files/ltrace-fix-ptrace-event-macros.patch
@@ -0,0 +1,12 @@
+Index: ltrace-0.5.3/sysdeps/linux-gnu/events.c
+===================================================================
+--- ltrace-0.5.3.orig/sysdeps/linux-gnu/events.c	2009-12-24 15:58:24.000000000 +0800
++++ ltrace-0.5.3/sysdeps/linux-gnu/events.c	2009-12-24 15:58:41.000000000 +0800
+@@ -8,6 +8,7 @@
+ #include <signal.h>
+ #include <string.h>
+ #include <sys/ptrace.h>
++#include <linux/ptrace.h>
+ 
+ #include "common.h"
+ 
diff --git a/recipes/ltrace/ltrace_0.5.3.bb b/recipes/ltrace/ltrace_0.5.3.bb
index 4130c29..1f70878 100644
--- a/recipes/ltrace/ltrace_0.5.3.bb
+++ b/recipes/ltrace/ltrace_0.5.3.bb
@@ -4,6 +4,8 @@ SECTION = "devel"
 DEPENDS = "libelf"
 LICENSE = "GPLv2"
 
+PR = "r2"
+
 SRC_URI = "\
   ${DEBIAN_MIRROR}/main/l/ltrace/ltrace_${PV}.orig.tar.gz \
   ${DEBIAN_MIRROR}/main/l/ltrace/ltrace_${PV}-2.diff.gz;patch=1 \
@@ -12,7 +14,9 @@ SRC_URI = "\
   file://ltrace-mips-remove-CP.patch;patch=1 \
   file://ltrace-mips.patch;patch=1 \
   file://ltrace-ppc.patch;patch=1 \
+  file://ltrace-fix-ptrace-event-macros.patch;patch=1 \
 "
+
 inherit autotools
 
 export TARGET_CFLAGS = "${SELECTED_OPTIMIZATION} -isystem ${STAGING_INCDIR}"
-- 
1.5.4.3



