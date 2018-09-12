Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 362B379717
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Sep 2018 15:43:33 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w8CFgv1N031594
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 12 Sep 2018 08:43:07 -0700
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.408.0;
	Wed, 12 Sep 2018 08:42:40 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <raj.khem@gmail.com>
Date: Wed, 12 Sep 2018 08:42:40 -0700
Message-ID: <20180912154240.15100-1-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <20180912082642.35624-1-hongxu.jia@windriver.com>
References: <20180912082642.35624-1-hongxu.jia@windriver.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: [PATCH V2] cyrus-sasl: fix build out of source tree failed while configuring with `--enable-ldapdb'
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
X-List-Received-Date: Wed, 12 Sep 2018 15:43:33 -0000
Content-Type: text/plain

[snip]
| powerpc-wrs-linux-gcc [snip] -I../common
|../../git/saslauthd/lak.c:58:10: fatal error: crypto-compat.h:
No such file or directory
[snip]

The crypto-compat.h locates in git/common/, it should be                                                                                                                           |
`-I../../git/common'

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 ...uthd-to-be-built-outside-of-source-tree-w.patch | 41 ++++++++++++++++++++++
 .../cyrus-sasl/cyrus-sasl_2.1.27.bb                |  1 +
 2 files changed, 42 insertions(+)
 create mode 100644 meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl/0001-Allow-saslauthd-to-be-built-outside-of-source-tree-w.patch

diff --git a/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl/0001-Allow-saslauthd-to-be-built-outside-of-source-tree-w.patch b/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl/0001-Allow-saslauthd-to-be-built-outside-of-source-tree-w.patch
new file mode 100644
index 0000000..c89822c
--- /dev/null
+++ b/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl/0001-Allow-saslauthd-to-be-built-outside-of-source-tree-w.patch
@@ -0,0 +1,41 @@
+From 6515f3e7656d97d40a6a1cf4eb3ada193a698309 Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Wed, 12 Sep 2018 23:18:12 +0800
+Subject: [PATCH] Allow saslauthd to be built outside of source tree while
+ configuring with `--enable-ldapdb'
+
+[snip]
+| powerpc-wrs-linux-gcc [snip] -I../common
+|../../git/saslauthd/lak.c:58:10: fatal error: crypto-compat.h:
+No such file or directory
+[snip]
+
+The crypto-compat.h locates in git/common/, it should be                                                                                                                           |
+`-I../../git/common'
+
+Remove useless `-I$(top_srcdir)/../include' which was incorrectly
+added by commit `faae590 cleanup misc INCLUDES for different build paths'
+
+Upstream-Status: Submitted [https://github.com/cyrusimap/cyrus-sasl]
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ saslauthd/Makefile.am | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/saslauthd/Makefile.am b/saslauthd/Makefile.am
+index d7244be..864b29b 100644
+--- a/saslauthd/Makefile.am
++++ b/saslauthd/Makefile.am
+@@ -34,7 +34,7 @@ saslcache_SOURCES = saslcache.c
+ 
+ EXTRA_DIST	= saslauthd.8 saslauthd.mdoc include \
+ 		  getnameinfo.c getaddrinfo.c LDAP_SASLAUTHD
+-AM_CPPFLAGS	= -I$(top_srcdir)/include -I$(top_builddir)/include -I$(top_srcdir)/../include -I$(top_builddir)/common
++AM_CPPFLAGS	= -I$(top_srcdir)/include -I$(top_builddir)/include -I$(top_builddir)/common -I$(top_srcdir)/common
+ DEFS            = @DEFS@ -DSASLAUTHD_CONF_FILE_DEFAULT=\"@sysconfdir@/saslauthd.conf\" -I. -I$(srcdir) -I..
+ 
+ 
+-- 
+2.7.4
+
diff --git a/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.27.bb b/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.27.bb
index a03712c..573f822 100644
--- a/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.27.bb
+++ b/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.27.bb
@@ -14,6 +14,7 @@ SRC_URI = "git://github.com/cyrusimap/cyrus-sasl;protocol=https \
            file://saslauthd.service \
            file://saslauthd.conf \
            file://0004-configure.ac-fix-condition-for-suppliment-snprintf-i.patch \
+           file://0001-Allow-saslauthd-to-be-built-outside-of-source-tree-w.patch \
            "
 
 UPSTREAM_CHECK_URI = "https://github.com/cyrusimap/cyrus-sasl/archives"
-- 
2.7.4


