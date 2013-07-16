Return-Path: <Rongqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 601796B1FF
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Jul 2013 05:07:48 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r6G57nNe017433
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Jul 2013 22:07:49 -0700 (PDT)
Received: from lirq-OptiPlex-780.corp.ad.wrs.com (128.224.162.159) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.342.3; Mon, 15 Jul 2013 22:07:48 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 16 Jul 2013 13:07:46 +0800
Message-ID: <1373951266-21073-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Cc: Joe.macdonald@windriver.com
Subject: [PATCH] netcat: intergrat two fixes
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 16 Jul 2013 05:07:49 -0000
Content-Type: text/plain

From: "Roy.Li" <rongqing.li@windriver.com>

1. fix a running issue on PPC, since 'char' type has different range of values
on x86 and on PPC.
2. fix a building issue.

Signed-off-by: Roy.Li <rongqing.li@windriver.com>
---
 .../netcat/make-netcat_flag_count_work.patch       |   34 ++++++++++++++++++++
 .../netcat/netcat/netcat-locale_h.patch            |   25 ++++++++++++++
 .../recipes-support/netcat/netcat_0.7.1.bb         |    2 ++
 3 files changed, 61 insertions(+)
 create mode 100644 meta-networking/recipes-support/netcat/netcat/make-netcat_flag_count_work.patch
 create mode 100644 meta-networking/recipes-support/netcat/netcat/netcat-locale_h.patch

diff --git a/meta-networking/recipes-support/netcat/netcat/make-netcat_flag_count_work.patch b/meta-networking/recipes-support/netcat/netcat/make-netcat_flag_count_work.patch
new file mode 100644
index 0000000..dd1938a
--- /dev/null
+++ b/meta-networking/recipes-support/netcat/netcat/make-netcat_flag_count_work.patch
@@ -0,0 +1,34 @@
+Make netcat_flag_count() return positive value
+
+C language has 3 distinct char types:
+         char
+         unsigned char
+         signed char
+A char has the same range of values as signed char on X86,
+but same as unsigned char on PPC which made netcat_flag_count
+return a negative value, now we force variable c as signed char
+to make netcat_flag_count return positive value.
+
+Upstream-Status: Pending
+
+Signed-off-by: Roy.Li <rongqing.li@windriver.com>
+---
+ src/flagset.c |    2 +-
+ 1 files changed, 1 insertions(+), 1 deletions(-)
+
+diff --git a/src/flagset.c b/src/flagset.c
+index 442b634..54ac898 100644
+--- a/src/flagset.c
++++ b/src/flagset.c
+@@ -134,7 +134,7 @@ unsigned short netcat_flag_next(unsigned short port)
+ 
+ int netcat_flag_count(void)
+ {
+-  register char c;
++  register signed char c;
+   register int i;
+   int ret = 0;
+ 
+-- 
+1.7.5.4
+
diff --git a/meta-networking/recipes-support/netcat/netcat/netcat-locale_h.patch b/meta-networking/recipes-support/netcat/netcat/netcat-locale_h.patch
new file mode 100644
index 0000000..5cbcb08
--- /dev/null
+++ b/meta-networking/recipes-support/netcat/netcat/netcat-locale_h.patch
@@ -0,0 +1,25 @@
+Apparently somewhere along the line HAVE_LOCALE_H was changed to
+HAVE_LC_MESSAGES.  Adjust netcat to match.
+
+Upstream-Status: Pending
+
+Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
+
+Index: netcat-0.7.1/src/intl.h
+===================================================================
+--- netcat-0.7.1.orig/src/intl.h
++++ netcat-0.7.1/src/intl.h
+@@ -25,11 +25,11 @@
+ #ifdef ENABLE_NLS
+ #include <libintl.h>
+ 
+-#ifdef HAVE_LOCALE_H
++#if defined(HAVE_LC_MESSAGES) || defined(HAVE_LOCALE_H)
+ #include <locale.h>
+ #else
+ #error You must have locale.h in your system
+-#endif	/* HAVE_LOCALE_H */
++#endif	/* HAVE_LC_MESSAGES || HAVE_LOCALE_H */
+ 
+ /* Our dear (and very common) gettext macros */
+ #define _(String) gettext(String)
diff --git a/meta-networking/recipes-support/netcat/netcat_0.7.1.bb b/meta-networking/recipes-support/netcat/netcat_0.7.1.bb
index a4805a4..0bb5c87 100644
--- a/meta-networking/recipes-support/netcat/netcat_0.7.1.bb
+++ b/meta-networking/recipes-support/netcat/netcat_0.7.1.bb
@@ -8,6 +8,8 @@ PR = "r3"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/netcat/netcat-${PV}.tar.bz2 \
            file://obsolete_autoconf_macros.patch \
+           file://netcat-locale_h.patch \
+           file://make-netcat_flag_count_work.patch \
 "
 
 SRC_URI[md5sum] = "0a29eff1736ddb5effd0b1ec1f6fe0ef"
-- 
1.7.10.4


