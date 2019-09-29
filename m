Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com
	[209.85.210.178])
	by mail.openembedded.org (Postfix) with ESMTP id 05A5F7F26C
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 29 Sep 2019 23:55:16 +0000 (UTC)
Received: by mail-pf1-f178.google.com with SMTP id q12so4493078pff.9
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 29 Sep 2019 16:55:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=LL6hvOTDMFVEK5YudlCx0fSLqeqvalZSVzPy2gerzhU=;
	b=W7OsZpOfK2SuT76k95O/Bf2rAXharypp7gApn20jhUwhtgawXULvUXLPHbIQ7H5W7A
	oEU8FivlKFNkAFEj9Oxc0fjvB5YBgXgR1PeVOjRg0Fz5fLelPozdDd7fj7zkK9W864BM
	2e5fHv+JbJU7taqvXUsboeAYzqSKfEUDhSRQ722qbNvfj2AiTeQSQHk+E80DK6/aM0zw
	2JxS5uA3MyZXV+xzuh1HWPjr85IYe3F1KKl3k07+EnFksxxSZfBpEBlajbR0hN9LbPny
	i8vgmtL5+jvBQMDeaTu8tTA8bbqxN8oa0RuawZU8aMPgEndmvZkm//YMjm+jxgZ6Ibvm
	l6bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=LL6hvOTDMFVEK5YudlCx0fSLqeqvalZSVzPy2gerzhU=;
	b=iJLvzL91k6e3R/ySBBRlkPEeqlTxmZn487g0LKmWVd6obwnulZsj3t7u/mAMZ7JJpn
	NvUn2c5Ht9F3NPcjCN3XrMGAp4Ij9q9cKq0Lpi35r1m7QoxGqRpaY+7UlRDNMugeAB87
	QyErcOT9AJDKinVxd9P9YY3/bZuQ5V6UBreIV9TxriiHUIANp5pOQ30Q2DIvGMAL0Pj7
	WuPUle0zJyCdZvdZ6E6Cnh8qBF0wLsEXyJf7a6/kZSo0jNnOvlIJJ7on+U8TvMtQ4gKF
	FkhSMTGGRQiEwqT1Wt9tewopsyUM1+a5A/dVi1XrRAhJG7KsIElbPWNU679W09yQlVZD
	DR7A==
X-Gm-Message-State: APjAAAU54KlM88/X51fkeuAmQjWykx88tz4uXtbaOrMTN2eDLZ2qMVkd
	JCEo7HEybtY14ee/eMVeVqqkhrEu/3Q=
X-Google-Smtp-Source: APXvYqyY935xvPjNBIFWMxz8AT4E7ITYEOoeCMthZmJJZYQKBtb2vJR1AUNPbVtohiyRZ1azDiz4iQ==
X-Received: by 2002:a62:7646:: with SMTP id r67mr18060835pfc.116.1569801317958;
	Sun, 29 Sep 2019 16:55:17 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:a5c0:edf9:811d:ad92:85c2])
	by smtp.gmail.com with ESMTPSA id
	p190sm14474778pfb.160.2019.09.29.16.55.16
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 29 Sep 2019 16:55:17 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 29 Sep 2019 16:54:59 -0700
Message-Id: <ce9b4cf5c917f85ebb225dd08be96f9caded1083.1569801183.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1569801183.git.akuster808@gmail.com>
References: <cover.1569801183.git.akuster808@gmail.com>
Subject: [warrior-next 01/10] tcpdump: Fix CVE-2017-16808
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
X-List-Received-Date: Sun, 29 Sep 2019 23:55:17 -0000

From: Peiran Hong <peiran.hong@windriver.com>

Backport selected parts of three upstream commits to fix
CVE-2017-16808 where tcpdump 4.9.2 has a heap-based buffer over-read.

Upstream-Status: Backport
[ several ]

Upstream commits fully backported:
46aead6  [CVE-2017-16808/AoE: Add a missing bounds check]

Upstream commits partially backported:
7068209  [Use nd_ types in 802.x and FDDI headers.]
84ef17a  [Replace ND_TTEST2()/ND_TCHECK2() macros by macros using
pointers (1/n)]

46aead6 fixes the vulnerability and requires two macros defined in
7068209 and 84ef17a, which are committed after the release of 4.9.2.
Only the definition of the macros are taken from the two commits
as they impact a wide range of code and are difficult to integrate.

CVE: CVE-2017-16808

Signed-off-by: Peiran Hong <peiran.hong@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 62fc26075afc2d56a73777aad753a643fbdafbfa)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 ...2017-16808-AoE-Add-a-missing-bounds-check.patch | 61 ++++++++++++++++++++++
 .../recipes-support/tcpdump/tcpdump_4.9.2.bb       |  1 +
 2 files changed, 62 insertions(+)
 create mode 100644 meta-networking/recipes-support/tcpdump/tcpdump/0001-CVE-2017-16808-AoE-Add-a-missing-bounds-check.patch

diff --git a/meta-networking/recipes-support/tcpdump/tcpdump/0001-CVE-2017-16808-AoE-Add-a-missing-bounds-check.patch b/meta-networking/recipes-support/tcpdump/tcpdump/0001-CVE-2017-16808-AoE-Add-a-missing-bounds-check.patch
new file mode 100644
index 0000000..919f2b0
--- /dev/null
+++ b/meta-networking/recipes-support/tcpdump/tcpdump/0001-CVE-2017-16808-AoE-Add-a-missing-bounds-check.patch
@@ -0,0 +1,61 @@
+From c45443a0d3e16b92622bea6b589e5930e8f0d815 Mon Sep 17 00:00:00 2001
+From: Peiran Hong <peiran.hong@windriver.com>
+Date: Fri, 13 Sep 2019 17:02:57 -0400
+Subject: [PATCH] CVE-2017-16808/AoE: Add a missing bounds check.
+
+---
+ netdissect.h | 12 ++++++++++++
+ print-aoe.c  |  1 +
+ 2 files changed, 13 insertions(+)
+
+diff --git a/netdissect.h b/netdissect.h
+index 089b0406..cd05fdb9 100644
+--- a/netdissect.h
++++ b/netdissect.h
+@@ -69,6 +69,11 @@ typedef struct {
+ typedef unsigned char nd_uint8_t;
+ typedef signed char nd_int8_t;
+ 
++/*
++ * Use this for MAC addresses.
++ */
++#define MAC_ADDR_LEN    6               /* length of MAC addresses */
++
+ /* snprintf et al */
+ 
+ #include <stdarg.h>
+@@ -309,12 +314,19 @@ struct netdissect_options {
+ 	((uintptr_t)ndo->ndo_snapend - (l) <= (uintptr_t)ndo->ndo_snapend && \
+          (uintptr_t)&(var) <= (uintptr_t)ndo->ndo_snapend - (l)))
+ 
++#define ND_TTEST_LEN(p, l) \
++  (IS_NOT_NEGATIVE(l) && \
++        ((uintptr_t)ndo->ndo_snapend - (l) <= (uintptr_t)ndo->ndo_snapend && \
++         (uintptr_t)(p) <= (uintptr_t)ndo->ndo_snapend - (l)))
++
+ /* True if "var" was captured */
+ #define ND_TTEST(var) ND_TTEST2(var, sizeof(var))
+ 
+ /* Bail if "l" bytes of "var" were not captured */
+ #define ND_TCHECK2(var, l) if (!ND_TTEST2(var, l)) goto trunc
+ 
++#define ND_TCHECK_LEN(p, l) if (!ND_TTEST_LEN(p, l)) goto trunc
++
+ /* Bail if "var" was not captured */
+ #define ND_TCHECK(var) ND_TCHECK2(var, sizeof(var))
+ 
+diff --git a/print-aoe.c b/print-aoe.c
+index 97e93df2..ac097a04 100644
+--- a/print-aoe.c
++++ b/print-aoe.c
+@@ -325,6 +325,7 @@ aoev1_reserve_print(netdissect_options *ndo,
+ 		goto invalid;
+ 	/* addresses */
+ 	for (i = 0; i < nmacs; i++) {
++		ND_TCHECK_LEN(cp, MAC_ADDR_LEN);
+ 		ND_PRINT((ndo, "\n\tEthernet Address %u: %s", i, etheraddr_string(ndo, cp)));
+ 		cp += ETHER_ADDR_LEN;
+ 	}
+-- 
+2.21.0
+
diff --git a/meta-networking/recipes-support/tcpdump/tcpdump_4.9.2.bb b/meta-networking/recipes-support/tcpdump/tcpdump_4.9.2.bb
index 038c161..9bd861c 100644
--- a/meta-networking/recipes-support/tcpdump/tcpdump_4.9.2.bb
+++ b/meta-networking/recipes-support/tcpdump/tcpdump_4.9.2.bb
@@ -12,6 +12,7 @@ SRC_URI = " \
     file://avoid-absolute-path-when-searching-for-libdlpi.patch \
     file://add-ptest.patch \
     file://run-ptest \
+    file://0001-CVE-2017-16808-AoE-Add-a-missing-bounds-check.patch \
 "
 
 SRC_URI[md5sum] = "9bbc1ee33dab61302411b02dd0515576"
-- 
2.7.4


