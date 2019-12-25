Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com
	[209.85.214.193])
	by mail.openembedded.org (Postfix) with ESMTP id BFC2B7F7C9
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Dec 2019 16:57:17 +0000 (UTC)
Received: by mail-pl1-f193.google.com with SMTP id b22so9583973pls.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Dec 2019 08:57:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=mYMO/oF2EpPom3cZicRsqxO+BueouJ9+AS47VjSCke0=;
	b=p14dPsd4pBq+yRr9a62H/iXEE33UMVxO6ecPDl6WtnwpNTaHp2QFa6fC36Etb6v70r
	niaOVDxZDWr3yFU1sRyRvaQH+eUAGzRe/uLQArEhzOd4QZ+k2c6r0Sr6PUImW3ZNMyQ5
	Fiei2dSe0nXVpo3uW3T/ZPKzENKnRfCWRoPaUNz62HLAPHKMN5SviucAl5pr9MuKQbIG
	GmESSB1fG6ZiWsvFkTpdaOOozRjsZX+jYMoq/h/CKapUtQ9ukkQGxtC0A/ihYIPH9Kpi
	shfW48WnPiwurEOsRVat/zHibtEDTcIXofNKWeWeb7e+BUh523r2yoCY5NzX7BdVFnBC
	iDAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=mYMO/oF2EpPom3cZicRsqxO+BueouJ9+AS47VjSCke0=;
	b=c5TRz/+tpWC0FclTfyYnd81EhCI4bHpSb26HMxDuyBuKikpYjBJy011WCtlWpdsqdy
	cB6Wt5gDky5sc4l3VCSB8IYHFR7of8pccF1M8dpCNoG2CSLYIAelkrKcpSv3vD5IMr1T
	SgjcsbztfBQ5WqtiVYQfprzirp/B7nSeNVoNu6PFT+1yCoS5pvKAhOhkcSCywE9Alvtg
	Eoq6p0UQrExoU8oiQhWJvGWnmcBLViOZ++heiPDaGiMKJ4t3ksXieHlzFxZKAOIuNT01
	ozX22OAK+D8BecZ5Sd+7O/kGoeih1rSmvS93cyOytYFj1JC3xN8/zk4QP/JqYhKD+m7K
	GAfw==
X-Gm-Message-State: APjAAAX+YM6zqwW8OML1Yqsux+UDcM47ce5nIptp19GnesLlBZM6izDF
	YeWSJD4VDhx3pTHXLmgxQ6bUHH72va8=
X-Google-Smtp-Source: APXvYqw0o3hreAmH0eI00fTItXhU60QYZXl8ACSn8lyPJuhBQSXW8SzEvfHbP+YehmJDSGfmg99Ezg==
X-Received: by 2002:a17:90a:8545:: with SMTP id
	a5mr13521144pjw.3.1577293038466; 
	Wed, 25 Dec 2019 08:57:18 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::36e9])
	by smtp.gmail.com with ESMTPSA id
	p23sm30380829pgh.83.2019.12.25.08.57.17
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 25 Dec 2019 08:57:18 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 25 Dec 2019 08:57:09 -0800
Message-Id: <20191225165709.2123137-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20191225165709.2123137-1-raj.khem@gmail.com>
References: <20191225165709.2123137-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 3/3] ltrace: Fix build with gcc10
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
X-List-Received-Date: Wed, 25 Dec 2019 16:57:18 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...-struct-pointers-are-null-initilized.patch | 46 +++++++++++++++++++
 ...hook-Do-not-append-int-to-std-string.patch |  2 +-
 meta-oe/recipes-devtools/ltrace/ltrace_git.bb |  1 +
 3 files changed, 48 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-devtools/ltrace/ltrace/0001-ensure-the-struct-pointers-are-null-initilized.patch

diff --git a/meta-oe/recipes-devtools/ltrace/ltrace/0001-ensure-the-struct-pointers-are-null-initilized.patch b/meta-oe/recipes-devtools/ltrace/ltrace/0001-ensure-the-struct-pointers-are-null-initilized.patch
new file mode 100644
index 0000000000..9def41ca60
--- /dev/null
+++ b/meta-oe/recipes-devtools/ltrace/ltrace/0001-ensure-the-struct-pointers-are-null-initilized.patch
@@ -0,0 +1,46 @@
+From 67a8fa478a4484bc4dbfb3ac74e11be1dd5af594 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 23 Dec 2019 19:35:48 -0800
+Subject: [PATCH] ensure the struct pointers are null initilized
+
+Do not delete if pointer is already null
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ expr.c | 10 +++++-----
+ 1 file changed, 5 insertions(+), 5 deletions(-)
+
+diff --git a/expr.c b/expr.c
+index 4059a32..5ffd0ad 100644
+--- a/expr.c
++++ b/expr.c
+@@ -189,10 +189,8 @@ int
+ expr_clone(struct expr_node *retp, const struct expr_node *node)
+ {
+ 	*retp = *node;
+-
++	struct expr_node *nlhs = 0, *nrhs = 0;
+ 	switch (node->kind) {
+-		struct expr_node *nlhs;
+-		struct expr_node *nrhs;
+ 
+ 	case EXPR_OP_ARGNO:
+ 	case EXPR_OP_SELF:
+@@ -236,8 +234,10 @@ expr_clone(struct expr_node *retp, const struct expr_node *node)
+ 		if (expr_alloc_and_clone(&nlhs, node->lhs, node->own_lhs) < 0) {
+ 			if (node->kind == EXPR_OP_CALL2
+ 			    && node->u.call.own_rhs) {
+-				expr_destroy(nrhs);
+-				free(nrhs);
++				if (nrhs) {
++					expr_destroy(nrhs);
++					free(nrhs);
++				}
+ 				return -1;
+ 			}
+ 		}
+-- 
+2.24.1
+
diff --git a/meta-oe/recipes-devtools/ltrace/ltrace/0001-hook-Do-not-append-int-to-std-string.patch b/meta-oe/recipes-devtools/ltrace/ltrace/0001-hook-Do-not-append-int-to-std-string.patch
index 8f1c4b9b9b..2890373821 100644
--- a/meta-oe/recipes-devtools/ltrace/ltrace/0001-hook-Do-not-append-int-to-std-string.patch
+++ b/meta-oe/recipes-devtools/ltrace/ltrace/0001-hook-Do-not-append-int-to-std-string.patch
@@ -23,7 +23,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  	if (sysconfdir != NULL && *sysconfdir != '\0') {
  		/* No +1, we skip the initial period.  */
 -		syspath = malloc(strlen(sysconfdir) + sizeof FN);
-+		syspath = malloc(strlen(sysconfdir) + sizeof FN + 1);
++		syspath = malloc(strlen(sysconfdir) + sizeof FN + 2);
 +		syspath[strlen(sysconfdir) + sizeof FN + 1] = '\0';
  		if (syspath == NULL
 -		    || sprintf(syspath, "%s/%s", sysconfdir, FN + 1) < 0)
diff --git a/meta-oe/recipes-devtools/ltrace/ltrace_git.bb b/meta-oe/recipes-devtools/ltrace/ltrace_git.bb
index bb21cbca8a..6b66c25297 100644
--- a/meta-oe/recipes-devtools/ltrace/ltrace_git.bb
+++ b/meta-oe/recipes-devtools/ltrace/ltrace_git.bb
@@ -28,6 +28,7 @@ SRC_URI = "git://github.com/sparkleholic/ltrace.git;branch=master;protocol=http
            file://0001-hook-Do-not-append-int-to-std-string.patch \
            file://include_unistd_nr.patch \
            file://0001-Bug-fix-for-data-type-length-judgment.patch \
+           file://0001-ensure-the-struct-pointers-are-null-initilized.patch \
            "
 S = "${WORKDIR}/git"
 
-- 
2.24.1


