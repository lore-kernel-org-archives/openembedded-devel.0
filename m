Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com
	[209.85.210.175])
	by mail.openembedded.org (Postfix) with ESMTP id 698847F8A9
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Oct 2019 16:14:08 +0000 (UTC)
Received: by mail-pf1-f175.google.com with SMTP id a2so13226478pfo.10
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Oct 2019 09:14:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=/LdHcH+SNHax5NXzplqcFrBo4kc34yb833/pcVXE190=;
	b=the9pBfIO2/Nz0sG7IlxwOjZg/5Z/gLO7Wp4GOjACogtlayKYc9eR4Rd/doFyrbUwj
	yqaNl7DzzW4QtqGXVZXe5aD1p0ZZGcVAsH2IhDLmQ70dcC1ZFw2quiOZAH7lgxccMfY7
	vbQuUF9ykB/o0VuWFvq1xnuAEny7Zo9M3saqyzze8vsvjVammSqTwQXMgRlyxST07W91
	ikIMgUlOZPxUa8tI9q241rc9TOT/HpM0BFU7TIhIKW9oZt1PuFwIZrBWJKxSzCsywRUn
	uTd5Szhhu60yQqBhPVNeviJ2JnQrOxAj6CtAUd7R3ZUh335fWEWzxkGHOUX5O+491rFh
	LPSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=/LdHcH+SNHax5NXzplqcFrBo4kc34yb833/pcVXE190=;
	b=UPp21NFLKcPHznKd86+kA8mdlP3R8GrcUdQwIl1Qqp+0cbWrl7c5W/oJggpiADpicH
	87/W3fHWv0VcU9YtUTGiuYdtrNdWHqC5gytbk6Ig3l4ZhwK2eTtJjRtcmMiQKc/SSezY
	FbNPAbMXXfCFeHP3Z0v37DHrbTkkjUqLJ+N2wAeoAgUh9ZpuotF2+TQ6mvFfuDl3w+Sl
	BWKV5Yv8EPcM83DR17xNlkunZuharhk4tVBz1BgtUdAFiU+ITopUKYYFZZKSAFo/kFx3
	KR+TZQnyyBW91bSRG1ccyGmP1PJj2nYHmjSqVlC8vDMVtjAE+Z+lZDmCiXYtN9mLsb2x
	w8Nw==
X-Gm-Message-State: APjAAAWGeZUtAyoModRx9wzJfYDyunfmTxBlz9nhcVTHU8K9ldXWpouC
	5P5hm+1V4U0ZXVOezZHcy0Wpin/9
X-Google-Smtp-Source: APXvYqxUxR31rsg6b8vCkhf6Wbfd5qQjgr5q07GLyg0lIW3+MNAOqdsttvPrHOqRju9jnNqe6YyMmQ==
X-Received: by 2002:a62:68c1:: with SMTP id
	d184mr11817330pfc.195.1571847249365; 
	Wed, 23 Oct 2019 09:14:09 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:d998:942e:6613:6ef4])
	by smtp.gmail.com with ESMTPSA id
	d19sm23179067pjz.5.2019.10.23.09.14.08
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 23 Oct 2019 09:14:08 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 23 Oct 2019 09:13:55 -0700
Message-Id: <a24acf94d48d635eca668ea34598c6e5c857e3f8.1571847041.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1571847041.git.akuster808@gmail.com>
References: <cover.1571847041.git.akuster808@gmail.com>
Subject: [warrior 10/10] tcpdump: Delete unused patch
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
X-List-Received-Date: Wed, 23 Oct 2019 16:14:08 -0000

From: Peiran Hong <peiran.hong@windriver.com>

Delete patch "0001-CVE-2017-16808-AoE-Add-a-missing-bounds-check.patch"
since it is not used in the tcpdump recipe anymore.

Signed-off-by: Peiran Hong <peiran.hong@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 01b55a8a552d460acbe3673268733a78b47c5c03)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 ...2017-16808-AoE-Add-a-missing-bounds-check.patch | 61 ----------------------
 1 file changed, 61 deletions(-)
 delete mode 100644 meta-networking/recipes-support/tcpdump/tcpdump/0001-CVE-2017-16808-AoE-Add-a-missing-bounds-check.patch

diff --git a/meta-networking/recipes-support/tcpdump/tcpdump/0001-CVE-2017-16808-AoE-Add-a-missing-bounds-check.patch b/meta-networking/recipes-support/tcpdump/tcpdump/0001-CVE-2017-16808-AoE-Add-a-missing-bounds-check.patch
deleted file mode 100644
index 919f2b0..0000000
--- a/meta-networking/recipes-support/tcpdump/tcpdump/0001-CVE-2017-16808-AoE-Add-a-missing-bounds-check.patch
+++ /dev/null
@@ -1,61 +0,0 @@
-From c45443a0d3e16b92622bea6b589e5930e8f0d815 Mon Sep 17 00:00:00 2001
-From: Peiran Hong <peiran.hong@windriver.com>
-Date: Fri, 13 Sep 2019 17:02:57 -0400
-Subject: [PATCH] CVE-2017-16808/AoE: Add a missing bounds check.
-
----
- netdissect.h | 12 ++++++++++++
- print-aoe.c  |  1 +
- 2 files changed, 13 insertions(+)
-
-diff --git a/netdissect.h b/netdissect.h
-index 089b0406..cd05fdb9 100644
---- a/netdissect.h
-+++ b/netdissect.h
-@@ -69,6 +69,11 @@ typedef struct {
- typedef unsigned char nd_uint8_t;
- typedef signed char nd_int8_t;
- 
-+/*
-+ * Use this for MAC addresses.
-+ */
-+#define MAC_ADDR_LEN    6               /* length of MAC addresses */
-+
- /* snprintf et al */
- 
- #include <stdarg.h>
-@@ -309,12 +314,19 @@ struct netdissect_options {
- 	((uintptr_t)ndo->ndo_snapend - (l) <= (uintptr_t)ndo->ndo_snapend && \
-          (uintptr_t)&(var) <= (uintptr_t)ndo->ndo_snapend - (l)))
- 
-+#define ND_TTEST_LEN(p, l) \
-+  (IS_NOT_NEGATIVE(l) && \
-+        ((uintptr_t)ndo->ndo_snapend - (l) <= (uintptr_t)ndo->ndo_snapend && \
-+         (uintptr_t)(p) <= (uintptr_t)ndo->ndo_snapend - (l)))
-+
- /* True if "var" was captured */
- #define ND_TTEST(var) ND_TTEST2(var, sizeof(var))
- 
- /* Bail if "l" bytes of "var" were not captured */
- #define ND_TCHECK2(var, l) if (!ND_TTEST2(var, l)) goto trunc
- 
-+#define ND_TCHECK_LEN(p, l) if (!ND_TTEST_LEN(p, l)) goto trunc
-+
- /* Bail if "var" was not captured */
- #define ND_TCHECK(var) ND_TCHECK2(var, sizeof(var))
- 
-diff --git a/print-aoe.c b/print-aoe.c
-index 97e93df2..ac097a04 100644
---- a/print-aoe.c
-+++ b/print-aoe.c
-@@ -325,6 +325,7 @@ aoev1_reserve_print(netdissect_options *ndo,
- 		goto invalid;
- 	/* addresses */
- 	for (i = 0; i < nmacs; i++) {
-+		ND_TCHECK_LEN(cp, MAC_ADDR_LEN);
- 		ND_PRINT((ndo, "\n\tEthernet Address %u: %s", i, etheraddr_string(ndo, cp)));
- 		cp += ETHER_ADDR_LEN;
- 	}
--- 
-2.21.0
-
-- 
2.7.4


