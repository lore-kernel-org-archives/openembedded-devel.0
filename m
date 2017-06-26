Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f179.google.com (mail-pf0-f179.google.com
	[209.85.192.179])
	by mail.openembedded.org (Postfix) with ESMTP id 77EE17780E
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Jun 2017 05:35:01 +0000 (UTC)
Received: by mail-pf0-f179.google.com with SMTP id c73so49939628pfk.2
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 25 Jun 2017 22:35:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=NFdSKz6SlbmUPkkoYPmu1cSH531FngUWiCXXSJ7P53o=;
	b=PtlRx72GIR6/uc+D5SFSnetv/kXUkULnoq/aZ+IUyhupqtH9XDHBMvaCoP6nMuUZIn
	QDFZi/t5ZQvGg3vwu+gLEtBZ3xcTXYP8hJIM25RfwOU67Ry4iPo+SPexcsKpittgE79/
	chflJNOi8+rLQ3ZbMEQrcrJ0rHOUUXBxpsfhtmuFMuOLNMUvhooBi5UwkoZNG4Ba9lW/
	colupuzle1LH2VW8uKfIYljsNJc66HkbdCy7uYKYWZUMlcx/z0JnePea92kwskv6TGkK
	nzywRLdmNPMITvBMVN2lq3SVC9dvsUedaSh/cE5YBWHLLykMNWTnJn7tQxPOL7V0sydK
	tBDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=NFdSKz6SlbmUPkkoYPmu1cSH531FngUWiCXXSJ7P53o=;
	b=beD3F20sXaMMOWrSpY0zhI/QC9fd2EqJoQnRlC85pK60ECAxsIlUAH3ag00mTFLEOi
	Z/LXGjByXhmv+ckgTMdH1eNd/bA5cWMFBaQ9gT/Amt86+R2YbvTYLA/+Hcv5rEeqhR3V
	HXpWehH8IdNwhTmqN9N57WNoM8ULrZX84+Nb74sqt3Cjyqdsy22SN2K+HoXEdJ3123BO
	8EkhYl17IDprMPdW2xYkd8986qvZsbjhYCuQVXKU/R7Ay9zQuKpacamwXaJaWAaJ9vSN
	wdUuPTfyIJjEQA3wdbH44qLP7umYoZjMAsIpI5IbVYhp/4mvR+7dkmuRsTBWSgIUDW99
	Os6w==
X-Gm-Message-State: AKS2vOwiI3yG/IFTQ98mFqRSrU1CK6vtQ4qVSB5hKsx+MsjXRSgTdIwq
	v6L2elbO6mAdSW3R
X-Received: by 10.98.50.196 with SMTP id y187mr19747185pfy.67.1498455301761;
	Sun, 25 Jun 2017 22:35:01 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::3df3])
	by smtp.gmail.com with ESMTPSA id
	x64sm23932432pfk.20.2017.06.25.22.35.00
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 25 Jun 2017 22:35:00 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 25 Jun 2017 22:34:42 -0700
Message-Id: <20170626053446.37959-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.1
In-Reply-To: <20170626053446.37959-1-raj.khem@gmail.com>
References: <20170626053446.37959-1-raj.khem@gmail.com>
Subject: [meta-networking][PATCH 3/7] ruli: FIx build with hardening flags
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
X-List-Received-Date: Mon, 26 Jun 2017 05:35:01 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...src-ruli_addr.c-Add-missing-format-string.patch | 35 ++++++++++++++++++++++
 meta-networking/recipes-support/ruli/ruli_0.36.bb  |  1 +
 2 files changed, 36 insertions(+)
 create mode 100644 meta-networking/recipes-support/ruli/files/0001-src-ruli_addr.c-Add-missing-format-string.patch

diff --git a/meta-networking/recipes-support/ruli/files/0001-src-ruli_addr.c-Add-missing-format-string.patch b/meta-networking/recipes-support/ruli/files/0001-src-ruli_addr.c-Add-missing-format-string.patch
new file mode 100644
index 000000000..9044415ff
--- /dev/null
+++ b/meta-networking/recipes-support/ruli/files/0001-src-ruli_addr.c-Add-missing-format-string.patch
@@ -0,0 +1,35 @@
+From d3fb471f53712e710fb5777b1b0851c46b7be64c Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sun, 25 Jun 2017 01:23:03 -0700
+Subject: [PATCH] src/ruli_addr.c: Add missing format string
+
+fixes
+
+| ruli_addr.c: In function 'ruli_in_snprint':
+| ruli_addr.c:491:5: error: format not a string literal and no format arguments [-Werror=format-security]
+|      return snprintf(buf, size, inet_ntoa(addr->ipv4));
+|      ^~~~~~
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+Upstream-Status: Pending
+
+ src/ruli_addr.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/ruli_addr.c b/src/ruli_addr.c
+index f1eabae..5f1fd4f 100644
+--- a/src/ruli_addr.c
++++ b/src/ruli_addr.c
+@@ -488,7 +488,7 @@ int ruli_in_snprint(char *buf, size_t size, const _ruli_addr *addr, int family)
+ {
+   switch (family) {
+   case PF_INET:
+-    return snprintf(buf, size, inet_ntoa(addr->ipv4));
++    return snprintf(buf, size, "%s", inet_ntoa(addr->ipv4));
+ 
+   case PF_INET6:
+     return ruli_inet6_snprint(buf, size, &addr->ipv6);    
+-- 
+2.13.1
+
diff --git a/meta-networking/recipes-support/ruli/ruli_0.36.bb b/meta-networking/recipes-support/ruli/ruli_0.36.bb
index b41313090..885796d2a 100644
--- a/meta-networking/recipes-support/ruli/ruli_0.36.bb
+++ b/meta-networking/recipes-support/ruli/ruli_0.36.bb
@@ -10,6 +10,7 @@ DEPENDS = "liboop"
 SRC_URI = "http://download.savannah.gnu.org/releases/ruli/ruli_${PV}.orig.tar.gz \
            file://Makefile.patch \
            file://0001-Fix-build-with-format-string-checks.patch \
+           file://0001-src-ruli_addr.c-Add-missing-format-string.patch \
            "
 
 SRC_URI[md5sum] = "e73fbfdeadddb68a703a70cea5271468"
-- 
2.13.1


