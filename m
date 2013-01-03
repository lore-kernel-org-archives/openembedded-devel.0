Received: from mail-la0-f52.google.com ([209.85.215.52])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cazfi74@gmail.com>) id 1TqqAQ-0006Wd-Eh
	for openembedded-devel@lists.openembedded.org;
	Thu, 03 Jan 2013 20:09:49 +0100
Received: by mail-la0-f52.google.com with SMTP id fq12so8502401lab.11
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 03 Jan 2013 10:54:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=+NUvBoLp0j2YYNtZ+iorC7KreWRctfKxuUv5dTzMOMM=;
	b=fC2Xcy7xwp8AW6kzsIjx1XWHTSvXyYBbjvoFYwuP0pMCwmSRBrIHz1nVZqlQuJTgmw
	1V1FJfM+JJL2SOEOyjuJW1DAgu9OXXkKeh5tPB8ooNGKerMjNs05NmxhpXhbjenn5UOT
	cpua+aKTaV1Mlgwt8t2YKfauH1zpyVxvAOrtyia+8P5fg7a1BxdPEPCZJ5WWcUIA1Rrt
	ULhi5xzBGQi19FMP32HF27spwKnjTNhyDhkh6eq9iHtPzdpz8Q5bcLwoKFqNPFiQ/7ba
	ue3HdE7vmPnVdBfWtfspx3LzHfIUG92r0EaJVMtUzmzQUHdvPPGT6Hu/IXbzK+IKCZtd
	HkDQ==
X-Received: by 10.152.111.41 with SMTP id if9mr47080413lab.23.1357239262468;
	Thu, 03 Jan 2013 10:54:22 -0800 (PST)
Received: from prime (a91-153-5-18.elisa-laajakaista.fi. [91.153.5.18])
	by mx.google.com with ESMTPS id fh4sm17267244lbb.7.2013.01.03.10.54.20
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 03 Jan 2013 10:54:21 -0800 (PST)
Received: from cazfi by prime with local (Exim 4.80)
	(envelope-from <cazfi74@gmail.com>)
	id 1Tqpvn-0005WC-4U; Thu, 03 Jan 2013 20:54:19 +0200
From: Marko Lindqvist <cazfi74@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  3 Jan 2013 20:54:14 +0200
Message-Id: <1357239255-20959-3-git-send-email-cazfi74@gmail.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1357239255-20959-2-git-send-email-cazfi74@gmail.com>
References: <1357239255-20959-1-git-send-email-cazfi74@gmail.com>
	<1357239255-20959-2-git-send-email-cazfi74@gmail.com>
Subject: [meta-oe][PATCH 2/3] libmikmod: replace obsolete automake macros with working ones
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
X-List-Received-Date: Thu, 03 Jan 2013 19:09:51 -0000

Add obsolete-automake-macros.patch that replaces automake macros
no longer supported by automake-1.13 with modern constructs.

Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
---
 .../mikmod/libmikmod/obsolete_automake_macros.patch     |   15 +++++++++++++++
 meta-oe/recipes-multimedia/mikmod/libmikmod_3.1.12.bb   |    1 +
 2 files changed, 16 insertions(+)
 create mode 100644 meta-oe/recipes-multimedia/mikmod/libmikmod/obsolete_automake_macros.patch

diff --git a/meta-oe/recipes-multimedia/mikmod/libmikmod/obsolete_automake_macros.patch b/meta-oe/recipes-multimedia/mikmod/libmikmod/obsolete_automake_macros.patch
new file mode 100644
index 0000000..082bb04
--- /dev/null
+++ b/meta-oe/recipes-multimedia/mikmod/libmikmod/obsolete_automake_macros.patch
@@ -0,0 +1,15 @@
+Upstream-Status: Submitted (https://sourceforge.net/tracker/?func=detail&aid=3599281&group_id=40531&atid=428227)
+
+Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
+diff -Nurd libmikmod-3.1.12/configure.in libmikmod-3.1.12/configure.in
+--- libmikmod-3.1.12/configure.in	2007-12-15 11:22:57.000000000 +0200
++++ libmikmod-3.1.12/configure.in	2013-01-03 07:26:10.662775603 +0200
+@@ -13,7 +13,7 @@
+ LIBMIKMOD_VERSION=$LIBMIKMOD_MAJOR_VERSION.$LIBMIKMOD_MINOR_VERSION.$LIBMIKMOD_MICRO_VERSION$BETA
+
+ AM_INIT_AUTOMAKE(libmikmod,$LIBMIKMOD_VERSION)
+-AM_CONFIG_HEADER(config.h)
++AC_CONFIG_HEADERS(config.h)
+ AM_MAINTAINER_MODE
+
+ # ==============================================================
diff --git a/meta-oe/recipes-multimedia/mikmod/libmikmod_3.1.12.bb b/meta-oe/recipes-multimedia/mikmod/libmikmod_3.1.12.bb
index cd80a6f..af5b5ff 100644
--- a/meta-oe/recipes-multimedia/mikmod/libmikmod_3.1.12.bb
+++ b/meta-oe/recipes-multimedia/mikmod/libmikmod_3.1.12.bb
@@ -11,6 +11,7 @@ SRC_URI = "\
   file://autofoo.patch \
   file://ldflags.patch \
   file://CVE-2010-2971.patch \
+  file://obsolete_automake_macros.patch \
 "
 
 SRC_URI[md5sum] = "9f3c740298260d5f88981fc0d51f6f16"
-- 
1.7.10.4



