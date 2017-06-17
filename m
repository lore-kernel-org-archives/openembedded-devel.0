Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f179.google.com (mail-pf0-f179.google.com
	[209.85.192.179])
	by mail.openembedded.org (Postfix) with ESMTP id D150C78372
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 17 Jun 2017 17:22:03 +0000 (UTC)
Received: by mail-pf0-f179.google.com with SMTP id s66so35717578pfs.1
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 17 Jun 2017 10:22:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=+hPzj89FeTbqabNRH2myY/YsmLug1ZqLn34XFqBPdsQ=;
	b=UbA91ahRcnYwU1h03pcfjvq+nXz1B6JF4yuex2iHfvLbpIKi5XOGzG/pRNdYX0PLek
	gS/0q9qc8dDBWNgKwOG+i34SgBm+LHBO1QsYsJRvHdxksfl4CgcGUXAbFFzcIDFnnk53
	67Db3fb+bl6xuzMX5qmYMTwWIh5ZyWcTpL+6sTUa/h0cQugGARCC643I4iZWEyZZsN04
	YrBXalRPIYKBzU4XMbyhhpiJBFi231PUL0t0u12yXeEKjR85fokwowokR6r9SA6QOAzV
	79GeXlHLHuWkcft88uYHcZKTu2ZydEyDI5x5SvizM6EIKkYN1TuRw0Zu3tdtivCXRaq5
	bEDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=+hPzj89FeTbqabNRH2myY/YsmLug1ZqLn34XFqBPdsQ=;
	b=m4QPBsLmaGqwGoybHCG9SAl38IlhS9/crxnmfLPJH9G5S4f9T6APmAWqL2pz4MXiYK
	8GGYu+ujjUtp7C+G9dOSjXk8tL20Ia3NhCGzM7ZVqykVh3kQYy43FicTJ6pYXNkNihYG
	LqzJhn8oH0l/XtYDSAFYAx9v5nvTz2mV4ihPXKOM9RyXWftDaNVztK6MJ7d+ceciH762
	26OUCmA1P2B/GwxQHqdaIt0Agg89bx3hT8i1nFUZQRU8SA3pbO4s0Clft+hbty8EA6iB
	wvtA7USSrtQKk8OvLk0V5lGyqjRHZ/wTJQxM0dBBL/nHLva8nPf9SPdiWTELvDUlwMxP
	Uh3w==
X-Gm-Message-State: AKS2vOzxwdazrSN6sHP8S7Vwo45+pUn/B0Zlz+Dhb0sxlb3N72lNDIgi
	FAB7AHQdzIGsuqCq
X-Received: by 10.84.178.101 with SMTP id y92mr19807228plb.116.1497720124289; 
	Sat, 17 Jun 2017 10:22:04 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::36d3])
	by smtp.gmail.com with ESMTPSA id
	o12sm12201226pfi.9.2017.06.17.10.22.02
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 17 Jun 2017 10:22:03 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 17 Jun 2017 10:21:42 -0700
Message-Id: <20170617172142.1311-9-raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.1
In-Reply-To: <20170617172142.1311-1-raj.khem@gmail.com>
References: <20170617172142.1311-1-raj.khem@gmail.com>
Subject: [meta-networking][PATCH 9/9] ruli: Fix build with hardening flags
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
X-List-Received-Date: Sat, 17 Jun 2017 17:22:04 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-Fix-build-with-format-string-checks.patch | 33 ++++++++++++++++++++++
 meta-networking/recipes-support/ruli/ruli_0.36.bb  |  6 ++--
 2 files changed, 37 insertions(+), 2 deletions(-)
 create mode 100644 meta-networking/recipes-support/ruli/files/0001-Fix-build-with-format-string-checks.patch

diff --git a/meta-networking/recipes-support/ruli/files/0001-Fix-build-with-format-string-checks.patch b/meta-networking/recipes-support/ruli/files/0001-Fix-build-with-format-string-checks.patch
new file mode 100644
index 000000000..f8eb3ae67
--- /dev/null
+++ b/meta-networking/recipes-support/ruli/files/0001-Fix-build-with-format-string-checks.patch
@@ -0,0 +1,33 @@
+From 40848547abf592c8d29b85ef1346001514944435 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 17 Jun 2017 10:14:20 -0700
+Subject: [PATCH] Fix build with format string checks
+
+Fixes
+| ruli_addr.c:418:5: error: format not a string literal and no format arguments [-Werror=format-security]
+|      return fprintf(out, inet_ntoa(addr->ipv4));
+|      ^~~~~~
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/ruli_addr.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/ruli_addr.c b/src/ruli_addr.c
+index 00d5d0d..f1eabae 100644
+--- a/src/ruli_addr.c
++++ b/src/ruli_addr.c
+@@ -415,7 +415,7 @@ int ruli_in_print(FILE *out, const _ruli_addr *addr, int family)
+ {
+   switch (family) {
+   case PF_INET:
+-    return fprintf(out, inet_ntoa(addr->ipv4));
++    return fprintf(out, "%s", inet_ntoa(addr->ipv4));
+ 
+   case PF_INET6:
+     return ruli_inet6_print(out, &addr->ipv6);
+-- 
+2.13.1
+
diff --git a/meta-networking/recipes-support/ruli/ruli_0.36.bb b/meta-networking/recipes-support/ruli/ruli_0.36.bb
index a455e1f9b..b41313090 100644
--- a/meta-networking/recipes-support/ruli/ruli_0.36.bb
+++ b/meta-networking/recipes-support/ruli/ruli_0.36.bb
@@ -7,8 +7,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
 
 DEPENDS = "liboop"
 
-SRC_URI += "http://download.savannah.gnu.org/releases/ruli/ruli_${PV}.orig.tar.gz \
-            file://Makefile.patch"
+SRC_URI = "http://download.savannah.gnu.org/releases/ruli/ruli_${PV}.orig.tar.gz \
+           file://Makefile.patch \
+           file://0001-Fix-build-with-format-string-checks.patch \
+           "
 
 SRC_URI[md5sum] = "e73fbfdeadddb68a703a70cea5271468"
 SRC_URI[sha256sum] = "11d32def5b514748fbd9ea8c88049ae99e1bb358efc74eb91a4d268a3999dbfa"
-- 
2.13.1


