Return-Path: <maryan.pricak@gmail.com>
Received: from mail-lf0-f68.google.com (mail-lf0-f68.google.com
	[209.85.215.68])
	by mail.openembedded.org (Postfix) with ESMTP id 07E4377DB3
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 11 Jun 2017 20:36:15 +0000 (UTC)
Received: by mail-lf0-f68.google.com with SMTP id v20so8325693lfa.2
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 11 Jun 2017 13:36:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=Re3xxyHKSiPN5hD68YcTL5yH2r+mj9KAPZZqUDNg7pI=;
	b=qxaetoMFm2DS9k4j2vWnyqxnVwbYToZMlRCj3nTotX6SCp/1ysatV6cjI/dIZCNAjw
	+tJv6pfD9DCdI8E/kSjQ/pk1O6s77DCnDaLca4h6cqrcfgUOe+XEFDVCBR6w5p+WqN/V
	h7B+zvjL8yQ9Y5vZyeaAvh7zJsTe6BGnRUy9bEy34B6pmANcpIudunK1hJD2O1aLYOqm
	gmPQu29s8t0ZBduBnh1DI2eH0i4jSuuzCCMRlG4VakRgWshGUXDOr3eyODqrleWItuO4
	Czdev4VJ3CCjmxUsh9FY1GPgN1tfbYqQciBzM8QKy6HLn1JhPMPw74IVHU9iLt1NGCso
	zfLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Re3xxyHKSiPN5hD68YcTL5yH2r+mj9KAPZZqUDNg7pI=;
	b=QkfFQHeQm+P42Upl82Z0wVLmReMEtDLYfRt7J5Pn9sepHGtMsIMVumInId361KRg+p
	ny7Gn4XpB/8INZiExyuzDBqtrJtpojr+PgrvHxVPVkt3IzcZeNvmnbycaxZlVdXjtl49
	xST0wHt47JkilfiUiGj40ibXGVMaXuki++ayXc8RJRCqcLRkWBZoOw6/nU8alKXg36X1
	oksNPmzmLwNcpKXw9dXMueiMOfkcLs1ux4wz2gYp/pTv3IC3pUppXDwbgRFDUFg/qMG8
	5tdmqDbDYDDVa5isNhw+qjNQTxiuzeD6tFeHXy8bot7AXXKbdjkF5ZaKyyTnHldGRdUA
	pilw==
X-Gm-Message-State: AODbwcBxFzzWRGFTHnLXjJCR4ktKsXwZjbz+9Ssqcxl0i+puS9S9E0F7
	/t6mRmftSSujuIHkKvQ=
X-Received: by 10.46.77.10 with SMTP id a10mr14269303ljb.73.1497213376227;
	Sun, 11 Jun 2017 13:36:16 -0700 (PDT)
Received: from localhost.localdomain ([77.123.173.169])
	by smtp.gmail.com with ESMTPSA id
	n132sm2116510lfn.61.2017.06.11.13.36.14
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 11 Jun 2017 13:36:15 -0700 (PDT)
From: Marian Pritsak <maryan.pricak@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 11 Jun 2017 23:36:07 +0300
Message-Id: <1497213367-24044-1-git-send-email-maryan.pricak@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [meta-oe][PATCH] hiredis: Add recipe
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
X-List-Received-Date: Sun, 11 Jun 2017 20:36:18 -0000

Hiredis is a C client library for Redis database.
Hiredis does not use autotools, but plane Makefile instead,
so few changes had to be made, including removing hard coded
compiler, setting INSTALL to 'cp -r' to to avoid host user
comtamination QA issue, and setting PREFIX to /usr instead of
default /usr/local.

Signed-off-by: Marian Pritsak <maryan.pricak@gmail.com>
---
 .../0001-Makefile-remove-hardcoding-of-CC.patch    | 32 ++++++++++++++++++++++
 meta-oe/recipes-extended/hiredis/hiredis_0.13.1.bb | 21 ++++++++++++++
 2 files changed, 53 insertions(+)
 create mode 100644 meta-oe/recipes-extended/hiredis/files/0001-Makefile-remove-hardcoding-of-CC.patch
 create mode 100644 meta-oe/recipes-extended/hiredis/hiredis_0.13.1.bb

diff --git a/meta-oe/recipes-extended/hiredis/files/0001-Makefile-remove-hardcoding-of-CC.patch b/meta-oe/recipes-extended/hiredis/files/0001-Makefile-remove-hardcoding-of-CC.patch
new file mode 100644
index 0000000..fef2bc7
--- /dev/null
+++ b/meta-oe/recipes-extended/hiredis/files/0001-Makefile-remove-hardcoding-of-CC.patch
@@ -0,0 +1,32 @@
+From d13b918a3ff8b0ebfd1e7b18b198b4b45841d720 Mon Sep 17 00:00:00 2001
+From: Andrea Galbusera <gizero@gmail.com>
+Date: Fri, 31 Jul 2015 16:42:08 +0200
+Subject: [PATCH] Makefile: remove hardcoding of CC
+
+* upgrade previous patch to avoid wiping CFLAGS. This fixes build on arm
+platforms which previously caused and issue due to -fPIC being lost
+
+Signed-off-by: Andrea Galbusera <gizero@gmail.com>
+---
+ Makefile | 5 -----
+ 1 file changed, 5 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index 8b0f0c2..66a4317 100644
+--- a/Makefile
++++ b/Makefile
+@@ -34,11 +34,6 @@ define REDIS_TEST_CONFIG
+ endef
+ export REDIS_TEST_CONFIG
+ 
+-# Fallback to gcc when $CC is not in $PATH.
+-CC:=$(shell sh -c 'type $(CC) >/dev/null 2>/dev/null && echo $(CC) || echo gcc')
+-OPTIMIZATION?=-O3
+-WARNINGS=-Wall -W -Wstrict-prototypes -Wwrite-strings
+-DEBUG?= -g -ggdb
+ REAL_CFLAGS=$(OPTIMIZATION) -fPIC $(CFLAGS) $(WARNINGS) $(DEBUG) $(ARCH)
+ REAL_LDFLAGS=$(LDFLAGS) $(ARCH)
+ 
+-- 
+1.9.1
+
diff --git a/meta-oe/recipes-extended/hiredis/hiredis_0.13.1.bb b/meta-oe/recipes-extended/hiredis/hiredis_0.13.1.bb
new file mode 100644
index 0000000..b2e8be8
--- /dev/null
+++ b/meta-oe/recipes-extended/hiredis/hiredis_0.13.1.bb
@@ -0,0 +1,21 @@
+DESCRIPTION = "Minimalistic C client library for Redis"
+HOMEPAGE = "http://github.com/redis/hiredis"
+LICENSE = "BSD-3-Clause"
+SECTION = "libs"
+DEPENDS = "redis"
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=d84d659a35c666d23233e54503aaea51"
+SRC_URI = "git://github.com/redis/hiredis;protocol=git;rev=f58dd249d6ed47a7e835463c3b04722972281dbb \
+           file://0001-Makefile-remove-hardcoding-of-CC.patch"
+
+S = "${WORKDIR}/git"
+
+inherit autotools-brokensep pkgconfig
+
+# By default INSTALL variable in Makefile is equal to 'cp -a', which preserves
+# ownership and causes host-user-contamination QA issue.
+# And PREFIX defaults to /usr/local.
+do_install_prepend() {
+  export PREFIX=/usr
+  export INSTALL='cp -r'
+}
-- 
2.7.4


