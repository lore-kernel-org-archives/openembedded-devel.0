Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B643C44509
	for <webhook@archiver.kernel.org>; Sun, 28 Jun 2026 16:22:40 +0000 (UTC)
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.20729.1782663759161595007
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 28 Jun 2026 09:22:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=IWUqdmhk;
 spf=pass (domain: gmail.com, ip: 74.125.82.178, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-30eac9abd79so1144312eec.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 28 Jun 2026 09:22:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782663758; x=1783268558; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8DGo4TOu+7lxninrY0DHtdVOZSGQbV9se8VOHiElEHo=;
        b=IWUqdmhkrO5XrADSlzhhtoEG0cVpqVSz/K8/3+dmEHDo9+wsIdUpwkR0u9p/e4izH3
         4BTk6RJIddLWrwG0bqw50ZKEXJ/BBdOcfuvXHdXLg+jfLen1KeyMrgpdzVW/wSgaFjQO
         P92k/jWcDoIXTVPAHeP2pIrtxWTHADb53IhriuAIOKQH0s9Pg0hU50ZE4215sZEEybm2
         hSONhOCbUIeHoDEtjYcftVtxDhb/WdFO2dpZWnAS4sKnegKacqHrWE2R3aiIxhGnbgQC
         R1TTmfFtMSC4taqGx5wGW2CB15OchzNr39nnzgR2x6r8C49lro8x3cqf8z7dXPbReJel
         9NWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782663758; x=1783268558;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8DGo4TOu+7lxninrY0DHtdVOZSGQbV9se8VOHiElEHo=;
        b=AUKn0b3saQUZ6Zl24wKfvVNfaM3BPJEz37nzKumNxMIYXwT/W8ChCVZJvTLzOyl5W7
         gYa1h3vcVnhJYJoIJPYeB+HNY7GEvNd8KNyNLCiRnmsYYGlJQBp7Ed645LwkLiCFv725
         e/0wcfhnenseke9zabuvUBYG5DQ7oX6ijYrox/r9Ia3cBmzPMCYv/QQlMGCd46z60g/K
         DzIf4UQWjvhNNZJCdb5sQSbbo+K2okcr3I9b1s3OZdnEgbsWwlr/mdgDbDmHfgfUalTg
         BQf8m9Af3+AC6MBndeHH+moDesZWLzD8ZAyvLRiNalUV/oZIYdR55zTBBUJQL3Z5RQtM
         u+nQ==
X-Gm-Message-State: AOJu0YxiQ/fU+wpJs888pJJEhTFdihYwJ9Wu/nHef8GUsM91ISmUct+Q
	uv/9gfzA6p4lmT0Ohx/So9uyteB+wyNRax+nzltD2Xt0I4MPr8ZXdcFhxfYR1bHF5km/LQ==
X-Gm-Gg: AfdE7ck1FNDFybObBf14mivroG0C/G0UB5P+jhmng5gjQZZu4sZXttM0jZiDKAomUVM
	+gTWWvGJ6KXLAAAi2lC7iCCGOhlLCNalgCAIo9yCOlIRbIxr6uc8ZcT+v3TndeqMT1KjFLLGjOa
	oHMtkDTO2tjWs1RE+rGZJEf3870cyOeNL5II6523qShwpIjIUoTpHpU4U1a3bj1A48umidII/2V
	9VOHFG9NRv4Aozj/psh+pYwDUY2ZVEXK0vpt1dp9OE1GGxKT/+LmoYYQ1wERgY/1f0YcEuRHNNs
	5FUpdZAYCFj5rtetCa4PX6EB2+AA17+0ncZ9VNoabfmSezchJuj2MmgLCoTYkXED2x3pCjc6NJm
	WUmEScwRxS+H2bfZvEtXrRSM9cy/CJHNsXu+5uI8T4j0v9ynPsvh4croKXxeVfRPTE/d+YdLdCq
	K46YKciyVgPW7pGVoDVzns6XUmIUjRQXT4+PEE6+4vRCKgn9WZe3iGynsQf49zWWCQU7jFj/hK2
	s72le8dptElo64NMEUgobR4Dvx1JssSd+n9KqssrZ2YJrPOFSorhu07dbntCcjzExEy62oRzTqR
	WjewYI++YzsIROSenx7qzZNkDb3RbA==
X-Received: by 2002:a05:7300:7246:b0:30c:6847:c2dc with SMTP id 5a478bee46e88-30cab409549mr7940680eec.31.1782663758491;
        Sun, 28 Jun 2026 09:22:38 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c7c52c591sm49849445eec.7.2026.06.28.09.22.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 09:22:38 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH 113/128] pimd: skip pre-configure make clean via CLEANBROKEN
Date: Sun, 28 Jun 2026 09:22:07 -0700
Message-ID: <20260628162222.4081517-13-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260628162222.4081517-1-khem.raj@oss.qualcomm.com>
References: <20260628162222.4081517-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 28 Jun 2026 16:22:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127923

The shipped Makefile does 'include config.mk' which is only created by
configure, so the 'make clean' run by autotools_preconfigure fails before
configure has run.

Set CLEANBROKEN to skip that pre-configure clean.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-networking/recipes-support/pimd/pimd_2.3.2.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta-networking/recipes-support/pimd/pimd_2.3.2.bb b/meta-networking/recipes-support/pimd/pimd_2.3.2.bb
index 647f9df515..9482c22a0c 100644
--- a/meta-networking/recipes-support/pimd/pimd_2.3.2.bb
+++ b/meta-networking/recipes-support/pimd/pimd_2.3.2.bb
@@ -13,6 +13,11 @@ EXTRA_OECONF:append:libc-musl = " --embedded-libc"
 
 inherit autotools-brokensep update-alternatives
 
+# The shipped Makefile "include config.mk" which is only created by configure,
+# so the "make clean" run by autotools_preconfigure fails before configure has
+# run. Skip that pre-configure clean.
+CLEANBROKEN = "1"
+
 do_configure() {
     oe_runconf
 }

