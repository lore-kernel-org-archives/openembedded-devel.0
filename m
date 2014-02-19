Return-Path: <Rongqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 88ECA6E7FE
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Feb 2014 07:37:05 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s1J7b6rO023814
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Feb 2014 23:37:06 -0800 (PST)
Received: from lirq-OptiPlex-780.corp.ad.wrs.com (128.224.162.168) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Tue, 18 Feb 2014 23:37:05 -0800
From: <rongqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 19 Feb 2014 15:38:03 +0800
Message-ID: <1392795483-17050-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Subject: [PATCH][meta-networking] quagga: close the stdout/stderr as in other daemons
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
X-List-Received-Date: Wed, 19 Feb 2014 07:37:05 -0000
Content-Type: text/plain

From: Roy Li <rongqing.li@windriver.com>

Once babald becomes a background daemon, it should not output information to
stdout, so need to close stdout.

In fact, other daemons close their stdout when they run into background, like
ospfd, isisd and bgpd, by calling daemon() which is in lib/daemon.c

Closing the stdout can fix a tee hang issue { #/usr/sbin/babeld -d |tee tmp }

Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 ...ose-the-stdout-stderr-as-in-other-daemons.patch |   50 ++++++++++++++++++++
 .../recipes-protocols/quagga/quagga_0.99.21.bb     |    1 +
 2 files changed, 51 insertions(+)
 create mode 100644 meta-networking/recipes-protocols/quagga/files/babel-close-the-stdout-stderr-as-in-other-daemons.patch

diff --git a/meta-networking/recipes-protocols/quagga/files/babel-close-the-stdout-stderr-as-in-other-daemons.patch b/meta-networking/recipes-protocols/quagga/files/babel-close-the-stdout-stderr-as-in-other-daemons.patch
new file mode 100644
index 0000000..c2757a2
--- /dev/null
+++ b/meta-networking/recipes-protocols/quagga/files/babel-close-the-stdout-stderr-as-in-other-daemons.patch
@@ -0,0 +1,50 @@
+From ba71f768e6dbb1f2ac72ed3bd880bff75a48d345 Mon Sep 17 00:00:00 2001
+From: Roy Li <rongqing.li@windriver.com>
+Date: Wed, 19 Feb 2014 14:13:40 +0800
+Subject: [PATCH] babeld: close stdout once the background daemon is created
+
+Upstream-Status: pending
+
+Once babald becomes a background daemon, it should not output information to
+stdout, so need to close stdout.
+
+In fact, other daemons close their stdout when they run into background, like
+ospfd, isisd and bgpd, by calling daemon() which is in lib/daemon.c
+
+Closing the stdout can fix a tee hang issue { #/usr/sbin/babeld -d |tee tmp }
+
+Signed-off-by: Roy Li <rongqing.li@windriver.com>
+---
+ babeld/util.c |   10 +++++++++-
+ 1 file changed, 9 insertions(+), 1 deletion(-)
+
+diff --git a/babeld/util.c b/babeld/util.c
+index 011f382..76203bc 100644
+--- a/babeld/util.c
++++ b/babeld/util.c
+@@ -425,7 +425,7 @@ uchar_to_in6addr(struct in6_addr *dest, const unsigned char *src)
+ int
+ daemonise()
+ {
+-    int rc;
++    int rc, fd;
+ 
+     fflush(stdout);
+     fflush(stderr);
+@@ -441,5 +441,13 @@ daemonise()
+     if(rc < 0)
+         return -1;
+ 
++    fd = open("/dev/null", O_RDWR, 0);
++    if (fd != -1)
++    {
++        dup2(fd, STDOUT_FILENO);
++        if (fd > 2)
++            close(fd);
++    }
++
+     return 1;
+ }
+-- 
+1.7.10.4
+
diff --git a/meta-networking/recipes-protocols/quagga/quagga_0.99.21.bb b/meta-networking/recipes-protocols/quagga/quagga_0.99.21.bb
index ae93952..db2a67b 100644
--- a/meta-networking/recipes-protocols/quagga/quagga_0.99.21.bb
+++ b/meta-networking/recipes-protocols/quagga/quagga_0.99.21.bb
@@ -5,6 +5,7 @@ PR = "${INC_PR}.0"
 SRC_URI += "file://0001-doc-fix-makeinfo-errors-and-one-warning.patch \
             file://lingering-IP-address-after-deletion-BZ-486.patch \
             file://build-fix-extract.pl-for-cross-compilation.patch \
+            file://babel-close-the-stdout-stderr-as-in-other-daemons.patch \
 "
 
 SRC_URI[quagga-0.99.21.md5sum] = "99840adbe57047c90dfba6b6ed9aec7f"
-- 
1.7.10.4


