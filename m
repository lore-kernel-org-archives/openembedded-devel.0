Return-Path: <majortomtosourcecontrol@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A052610A88E6
	for <webhook@archiver.kernel.org>; Thu, 26 Mar 2026 17:25:07 +0000 (UTC)
Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com [209.85.161.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.53160.1774545899455572777
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Mar 2026 10:24:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=CYmBX5nv;
 spf=pass (domain: gmail.com, ip: 209.85.161.51, mailfrom: majortomtosourcecontrol@gmail.com)
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-67e02b821cfso750128eaf.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 10:24:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774545898; x=1775150698; darn=lists.openembedded.org;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hkZFKSMMhOR1irNl9Qp4AvjQbmr5uLRAt7K5C4SNC1Q=;
        b=CYmBX5nvFv+WpgExY2JbN/4RAIh6KhDEbwiKIzZLxnZys8dqgtaxhMcuqNF4FYOhS7
         OUZjJ+x3hCBh3eX59iCy2hRQ+ZeASi4k81+gjs7aic6gL9f0EMpB0q9/xS1+pyuqi5/4
         zBdBTMirHtvcjYQrZaYoUpQHeUNVdGKvm1cL60D4XEQc4N8LLqy1jP8XvrympixjIBKO
         LIy1+T5QIMZ82dsdG8tIwABtEsmY+TIuxfqDzA0PSlwVY8RpE07UmG/D1RqwGuZJcJtF
         WDaDTsu62NYX86b5f1FAuAvMw38JPYq815RL6JGvSKK5zBeP6zLgx3UXmGauzenaBv5M
         gqUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774545898; x=1775150698;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hkZFKSMMhOR1irNl9Qp4AvjQbmr5uLRAt7K5C4SNC1Q=;
        b=ajTW+3HmYW2WYZnFr1DytucnSlu7mhw+/4orYpxYe5fLBrgwuvCP2y8kMRcIdx/p3l
         9WnQOfK+v/6urnvbpbcnR7U7aJdecZ6Bc3uW8SU8gbcxkpXPtBrLSTOmfsf6ZM3W4VMe
         aPkWdDM9oIJycPYUlPnnYH909cEixzIifSwjg++MM5vjV0WDGfWoZlc3LcX3G9B6fMqr
         3a1NQFj0sYu9SYIMbaL9byK5v/N0l5xdy3VsJKX9LcYkYrMeRzOc/h4qeoWpxJApbjPV
         gYoQbyNkZ9+/s30MDlgEobjUtK/9XQEKGF5xpjdMqA70+nUdwRnRVEv37J3Fcgw3vof3
         mpVQ==
X-Forwarded-Encrypted: i=1; AJvYcCVGqU2tTb5q5UANjoUEgQtFqPvjzE7ID9/x8gTTpj9H3ZCVzpNNz1SwzWjyzFyKk2BQESICxoEngLv4C/MEdmD+pQ4=@lists.openembedded.org
X-Gm-Message-State: AOJu0YzpEHMzKSyy/mZnecglwIEykPwqDycdP4+sjDU3S0jK7Tv3JERf
	kMZMdKqqyysOVoGSTCiv7oVaL62BzZncfbe9L0/paGQiSdiXBNa8m6bC
X-Gm-Gg: ATEYQzyjHInrJ3CGbYp8+6ycE0BZZJKLesJCFUbxBHW4La7qXi8L1O2NP3ofJiJTQ0f
	5LaoEli5Pw/A02MagTN3yuxSrKKeBLj5rsfJ7y3cH99d8U2O5ajogLsEPxT+DgrcGXijo3TJxbD
	lQwhuJpBQ0SulOjs7n/yI+Q9dUt2CyByZOzDqUJ9+FfpbVwSG/erSt1GSwRteA5fxwhx9pB/3Qw
	4+nMfkuZ9YFdE4UQGdHnCC3mxZXnIrLsTUljy8ZaDqyJw46lWYjOgLjH7Xswzjj/Q0bx2cwFHUG
	PqXawyXejR6BNUn9W+N47ghq4dyynaN4VpNCk6p/2i40w9CrXR0RvImIKF1AXAtD/hHUJ5s5QFv
	4m/vJvU/j5u9+RutoC22Al+SCe2P28TLEsSK6k5rDBgpyzfx4x9DUNoWOkv8Kvhn8YDKBCF2Kdz
	qIw6X/0uIBWLbVT1TVBPxSupbrVVP9ekhXA1XwgcrIrrjcbGjFLf//UwgDkD8GZJMIF8N1BPD2X
	IIpXO7EzoqYygQ=
X-Received: by 2002:a05:6820:2009:b0:67e:f55:707c with SMTP id 006d021491bc7-67e0f55727dmr1342762eaf.42.1774545898580;
        Thu, 26 Mar 2026 10:24:58 -0700 (PDT)
Received: from [172.26.252.3] (97-118-253-141.hlrn.qwest.net. [97.118.253.141])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-41ccb6b1d25sm2127642fac.16.2026.03.26.10.24.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Mar 2026 10:24:58 -0700 (PDT)
Message-ID: <293a5ad3-bf5c-4cec-85d5-4121e01b76b6@gmail.com>
Date: Thu, 26 Mar 2026 11:24:57 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: anuj.mittal@oss.qualcomm.com, openembedded-devel@lists.openembedded.org
Cc: Yi Zhao <yi.zhao@windriver.com>, joe.macdonald@siemens.com,
 Vincent Davis Jr <vince@underview.tech>, raj.khem@gmail.com,
 ecordonnier@snap.com
From: Clayton Casciato <majortomtosourcecontrol@gmail.com>
Subject: [meta-oe][scarthgap][PATCH] uutils-coreutils: drop (filtered)
 "selinux" from PACKAGECONFIG ?=
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 17:25:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125764

"selinux" adds a dependency on clang-native.

clang-native is provided by meta-clang.

If meta-clang is not included, this surfaces parse-time errors such as:
ERROR: Nothing PROVIDES 'clang-native' (but
[...]/uutils-coreutils_0.0.28.bb DEPENDS on or otherwise requires it)

This is an issue in the default case - where uutils-coreutils is not
enabled.

Suggested-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Clayton Casciato <majortomtosourcecontrol@gmail.com>
---
Sponsor: 21SoftWare LLC

OE-C whinlatter and master include clang-native:
https://git.openembedded.org/openembedded-core/commit/meta/recipes-devtools/clang?h=whinlatter&id=d77e398095228b34851762858a76640e3c2cb0ab

Discussion:
https://lists.openembedded.org/g/openembedded-devel/topic/103440861

 .../recipes-core/uutils-coreutils/uutils-coreutils_0.0.28.bb    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-core/uutils-coreutils/uutils-coreutils_0.0.28.bb b/meta-oe/recipes-core/uutils-coreutils/uutils-coreutils_0.0.28.bb
index 76cecac5a6..41e4f1d831 100644
--- a/meta-oe/recipes-core/uutils-coreutils/uutils-coreutils_0.0.28.bb
+++ b/meta-oe/recipes-core/uutils-coreutils/uutils-coreutils_0.0.28.bb
@@ -22,7 +22,7 @@ require ${BPN}-crates.inc
 PROVIDES = "coreutils"
 RPROVIDES:${PN} = "coreutils"
 
-PACKAGECONFIG ?= "${@bb.utils.filter('DISTRO_FEATURES', 'selinux', d)}"
+PACKAGECONFIG ?= ""
 
 PACKAGECONFIG[selinux] = "--with-selinux,--without-selinux,libselinux"
 

