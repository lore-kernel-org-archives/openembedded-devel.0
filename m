Received: from mail-pw0-f53.google.com ([209.85.160.53])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <camelguo@gmail.com>) id 1NO10E-0005gm-NR
	for openembedded-devel@lists.openembedded.org;
	Fri, 25 Dec 2009 04:38:13 +0100
Received: by pwi18 with SMTP id 18so5174949pwi.12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Dec 2009 19:36:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=xFDjJZ89ya6eULVvrsvIeRtBAjQNiQcSFhgXSGJb5Po=;
	b=DFYDlScXr3UUX4sT6G2k8kiXnvb5b6XbCl4HSWTm98VpIniSQQSTLRsawecuAuhxvx
	LWnfqolP6j0KlbAEtRLzkCYTPLhXRNoN1BYyjc/uqBbc0TYrpisGGIqEwnbFBxrZ3k6r
	VDjAVrTyinPr9DDB3LhbBXaSCmkm5tZs1cYj0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=OV84YE0NJoggC4voGvCmKVFZGuTQxig36SajQL4guNRB+o0DpOsCmkKYTEdR4AxlKV
	+z+kpNwDuFqaiiCNPe9NwC1xe/G5bRKeupVjsp4i4oaLj+qxLWQPaW6qh64ViYuOj3Hz
	q4bfI6Mj9ywnaMjXwiWjQQsw8ZBX68WT7wyuE=
Received: by 10.142.119.7 with SMTP id r7mr8042622wfc.261.1261712175912;
	Thu, 24 Dec 2009 19:36:15 -0800 (PST)
Received: from localhost ([123.54.105.26])
	by mx.google.com with ESMTPS id 20sm8292540pzk.13.2009.12.24.19.36.13
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 24 Dec 2009 19:36:15 -0800 (PST)
From: Guo Hongruan <camelguo@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 25 Dec 2009 11:36:04 +0800
Message-Id: <1261712164-7584-1-git-send-email-camelguo@gmail.com>
X-Mailer: git-send-email 1.5.4.3
In-Reply-To: <>
References: <>
X-SA-Exim-Connect-IP: 209.85.160.53
X-SA-Exim-Mail-From: camelguo@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [PATCH] Remove the include <linux/ptrace.h> from events.c of ltrace
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
X-List-Received-Date: Fri, 25 Dec 2009 03:38:14 -0000

Previously, I added include <linux/ptrace.h> which lets the ltrace compilation successfully based on glibc-2.6.1. This is not a bug of ltrace but of glibc-2.6.1. This commit revert the previous change.
---
 .../files/ltrace-fix-ptrace-event-macros.patch     |   12 ------------
 recipes/ltrace/ltrace_0.5.3.bb                     |    3 +--
 2 files changed, 1 insertions(+), 14 deletions(-)
 delete mode 100644 recipes/ltrace/files/ltrace-fix-ptrace-event-macros.patch

diff --git a/recipes/ltrace/files/ltrace-fix-ptrace-event-macros.patch b/recipes/ltrace/files/ltrace-fix-ptrace-event-macros.patch
deleted file mode 100644
index 7232ca8..0000000
--- a/recipes/ltrace/files/ltrace-fix-ptrace-event-macros.patch
+++ /dev/null
@@ -1,12 +0,0 @@
-Index: ltrace-0.5.3/sysdeps/linux-gnu/events.c
-===================================================================
---- ltrace-0.5.3.orig/sysdeps/linux-gnu/events.c	2009-12-24 15:58:24.000000000 +0800
-+++ ltrace-0.5.3/sysdeps/linux-gnu/events.c	2009-12-24 15:58:41.000000000 +0800
-@@ -8,6 +8,7 @@
- #include <signal.h>
- #include <string.h>
- #include <sys/ptrace.h>
-+#include <linux/ptrace.h>
- 
- #include "common.h"
- 
diff --git a/recipes/ltrace/ltrace_0.5.3.bb b/recipes/ltrace/ltrace_0.5.3.bb
index 1f70878..ea11b16 100644
--- a/recipes/ltrace/ltrace_0.5.3.bb
+++ b/recipes/ltrace/ltrace_0.5.3.bb
@@ -4,7 +4,7 @@ SECTION = "devel"
 DEPENDS = "libelf"
 LICENSE = "GPLv2"
 
-PR = "r2"
+PR = "r3"
 
 SRC_URI = "\
   ${DEBIAN_MIRROR}/main/l/ltrace/ltrace_${PV}.orig.tar.gz \
@@ -14,7 +14,6 @@ SRC_URI = "\
   file://ltrace-mips-remove-CP.patch;patch=1 \
   file://ltrace-mips.patch;patch=1 \
   file://ltrace-ppc.patch;patch=1 \
-  file://ltrace-fix-ptrace-event-macros.patch;patch=1 \
 "
 
 inherit autotools
-- 
1.5.4.3



