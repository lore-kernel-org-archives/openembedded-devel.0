Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91690CA5FB8
	for <webhook@archiver.kernel.org>; Tue, 29 Sep 2026 22:57:33 +0000 (UTC)
Received: from mail-dy2-f41.google.com (mail-dy2-f41.google.com [74.125.229.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1459.1790722651799822208
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 29 Sep 2026 15:57:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=SOORwkG+;
 spf=pass (domain: gmail.com, ip: 74.125.229.41, mailfrom: raj.khem@gmail.com)
Received: by mail-dy2-f41.google.com with SMTP id 5a478bee46e88-34bcb929cceso652793eec.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 29 Sep 2026 15:57:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790722651; x=1791327451; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Cc+4bewFZFYJxbJpp9pjmrEz4JWSivI3kT5ZIrMQ8Sk=;
        b=SOORwkG+l4e9Bvq0Zi/Q/iShsGv6xSkCP8A1dEl6KvXXAqRye+QjAVU0xf2F4naJBo
         YcuF6R2AJ+p3JcPoDi/p0OlmfeDC3QYx1NF+O6SqmrfFhejHFbC2QO6N0mLBPbN15XDY
         F4yEo6RCC341iTGUksbeVdiJKCrkjljjbgolQW7UdzCqoxxzD1Al/Flsn31BnN5eJb0U
         Poh6Hc/Y9HMdzbk3PWrGUEGyCGkMcShxIoIMtltq+F8agSe1KhfHhC8i4FqDIRscCI3q
         exxUo924m/Lk8/yeyRBtOq3nf5fWr4TyzHG7iDpb+pUD9cGVPWD6W//82LEEaVLvPo7x
         eLDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790722651; x=1791327451;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Cc+4bewFZFYJxbJpp9pjmrEz4JWSivI3kT5ZIrMQ8Sk=;
        b=IHHH4atCdnKlxBA6pu3qT/9FqR8iTGozH8sOOYk17rN5CToSoiybw3/drtbbT6Cp9D
         v7qrdPYFxbU81ZxudK+wqwEvb2UKylIT9CXDiEAPuJYbov2j+5XHBvF1awe+D7RYlWjM
         5gVo97rS9xt1Usat8Ct/W5faKQHk6eJCp9uqR345kLq5b+Sqoe3H7ssAT9xVIbfoQLkB
         76ZETEV8jFp4eZfeGI/+YVKZQkrMAozPWSvarqUE7yrenw517HXZeppI8hJFoedPF0NU
         UoMKA4IPd98/tsApNC3Bjdx0m+qwry0ehnUgA95F3DXBIuQex6u0PaioYqYxOubnjrCQ
         6PGQ==
X-Gm-Message-State: AFq9FYJp3DNKCh7qY0f74DMeRwgi9EejxkADZumUEU1eqWI3z3c5R0g4
	ZIqGEdZD9hwobeJizRFJh7UmwDVGhVPhAKtDUs/QSVc0ouZu4VTBGvQE8kWHSBW10KM=
X-Gm-Gg: AYBFou3BtvBBz7UWc0FHZ85Nf2SP+a3n4oliO12LPQ84xMDNOhO+WLJkiAK5p39QAwn
	RmAdSLuhrDExA8Jn7b1IwTvwD43xvGddaQwf2d/R9SlzRB0L0tn8kk3f4uXbZIX/pXw2YAT3wcV
	vD7jHlR7r3e9AEdDFG9ybyv6BarMfCMBlAhRbwF/OQemyPKiAg/ejZ2fpbm19li8b31w+FJvb1S
	P5tjTpsa5+7njnHWhPRbVpSM+V6PLhmvfi1JO7ooG7lA4WozyqMbd4cN2DstyCded4JzoD0qXmK
	luto18/APIBhZDDtb1d4FQz1P/afFBdHEaaqOvhQ5OvHZghwXJyUsDD+1lJSQ8SV4WDGEgUwITU
	AlzDP0n35f/lONTzu9EmD0VymL6kQMkfTcnFwgr8UFM2tRloosGz57VLdmGOQgqo36RlFBJ729d
	SHAUchWBCo7MLONuSYUsfljdvONOevo4oRgKsAF86zG+jmbGSwQtwproimV5eAK9ECY0orVH6ar
	qbBAqLp+8gyLVSqduQqgerwo1sG0yltcttDizVoHFQmOibzU/cm2MKfByuc5cE01mBp2+Vtbrur
	oOa+fKYGHf1iJm9ezDbHv8CX6o60mwuDsiWHpJb+2ZsqHymhGjt55u7NsQJ/MiuzkKPgM9q6gA8
	C5JcfqUFmfRYPT2kbLKlwi1I/2SoheE8qN0iaFV1wqpGE3Q2fxLyrvtn/zQofB1/HLdBjrJntqm
	oEDEz0G2xtUr0rDgOQlhJY/wQGwXY0N3YeowTjdA==
X-Received: by 2002:a05:7300:ff41:b0:34b:8ebd:e3b with SMTP id 5a478bee46e88-34c63036c71mr832090eec.14.1790722650932;
        Tue, 29 Sep 2026 15:57:30 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34c38bf0948sm1595527eec.25.2026.09.29.15.57.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 15:57:30 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 04/26] smolkit: include <sys/types.h> for uid_t/pid_t on musl
Date: Tue, 29 Sep 2026 15:57:01 -0700
Message-ID: <20260929225723.1046705-4-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260929225723.1046705-1-khem.raj@oss.qualcomm.com>
References: <20260929225723.1046705-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 29 Sep 2026 22:57:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130491

SystemUserLookup.h uses uid_t/pid_t without including <sys/types.h>;
glibc's <string> transitively declares them, musl's doesn't.

AI-Generated: Uses Claude Code

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...p.h-include-sys-types.h-for-uid_t-pi.patch | 30 +++++++++++++++++++
 meta-oe/recipes-extended/smolkit/smolkit.bb   |  1 +
 2 files changed, 31 insertions(+)
 create mode 100644 meta-oe/recipes-extended/smolkit/files/0001-SystemUserLookup.h-include-sys-types.h-for-uid_t-pi.patch

diff --git a/meta-oe/recipes-extended/smolkit/files/0001-SystemUserLookup.h-include-sys-types.h-for-uid_t-pi.patch b/meta-oe/recipes-extended/smolkit/files/0001-SystemUserLookup.h-include-sys-types.h-for-uid_t-pi.patch
new file mode 100644
index 0000000000..d2adf9177b
--- /dev/null
+++ b/meta-oe/recipes-extended/smolkit/files/0001-SystemUserLookup.h-include-sys-types.h-for-uid_t-pi.patch
@@ -0,0 +1,30 @@
+From: Khem Raj <khem.raj@oss.qualcomm.com>
+Date: Tue, 29 Sep 2026 01:54:51 +0000
+Subject: [PATCH] SystemUserLookup.h: include sys/types.h for uid_t/pid_t
+
+SystemUserLookup.h uses uid_t and pid_t but never includes
+<sys/types.h> itself. On glibc, <string> (or other headers pulled in
+transitively by the C++ runtime) end up exposing these POSIX types,
+but that is not guaranteed. musl's libc++ headers do not provide
+this transitive declaration, so the header fails to parse with
+"unknown type name 'uid_t'"/"'pid_t'". Include <sys/types.h>
+directly so the header is self-contained regardless of libc.
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
+---
+ src/SystemUserLookup.h | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/src/SystemUserLookup.h b/src/SystemUserLookup.h
+index 1111111..2222222 100644
+--- a/src/SystemUserLookup.h
++++ b/src/SystemUserLookup.h
+@@ -1,5 +1,7 @@
+ #pragma once
+
++#include <sys/types.h>
++
+ #include <string>
+
+ struct group;
diff --git a/meta-oe/recipes-extended/smolkit/smolkit.bb b/meta-oe/recipes-extended/smolkit/smolkit.bb
index 4ac9ee69f7..6ba338ef05 100644
--- a/meta-oe/recipes-extended/smolkit/smolkit.bb
+++ b/meta-oe/recipes-extended/smolkit/smolkit.bb
@@ -22,5 +22,6 @@ PV = "${VERSION}+git"
 
 SRC_URI = "\
     git://github.com/bmwcarit/${BPN}.git;protocol=https;branch=main;tag=v${VERSION} \
+    file://0001-SystemUserLookup.h-include-sys-types.h-for-uid_t-pi.patch \
 "
 SRCREV = "46bbfd5c922a8d03a534398ee129ded822dfcafe"

