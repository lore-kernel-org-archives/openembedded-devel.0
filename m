Return-Path: <me@sephalon.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57809F43826
	for <webhook@archiver.kernel.org>; Wed, 15 Apr 2026 14:22:29 +0000 (UTC)
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.20244.1776262943889564346
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 15 Apr 2026 07:22:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sephalon.net header.s=MBO0001 header.b=f4ICKpua;
 spf=none, err=permanent DNS error (domain: sephalon.net, ip: 80.241.56.151, mailfrom: me@sephalon.net)
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4fwjyh041xz9tcP;
	Wed, 15 Apr 2026 16:22:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sephalon.net;
	s=MBO0001; t=1776262940;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lvl43WQSDN/GFm7GJMQAJJIb/h7IDRLL9WgjTRgqtP8=;
	b=f4ICKpuazSSUi7aU+8JMqqSXPoAJHjLmny97aaSo46zCaeAc8z4vIET4y58vOGS0w+ZHYZ
	0akRuVDx/5EN+q14sHb0bF+rolbRsvIYBul9DJpLiGPZt4SBcefkZlsuir0uQ/CK4dZf2P
	69y0ri6shRq4VV0J72VLSYDoFchV9YcpsSxVESoKewL3NnX4+JdKCyhMm01gHxkCkb9LzP
	s4uqfiZI7khY8CXa1y26c73dN952c9njdkzQIep43VncUT8rQA61MEUL7qAlgJgx3lVWLQ
	AX9mJcVd5qQ/hrDM2yB+5j4xseU7JCr5GaOyR3zrPdsvzJYK/cNUHA162T1iJA==
Message-ID: <13c8553f-9420-47a7-af0d-da9f56b9a98f@sephalon.net>
Date: Wed, 15 Apr 2026 16:22:09 +0200
MIME-Version: 1.0
Subject: Re: [PATCH 10/13] syzkaller: Drop qemu-system-native dependency
To: Michal Sieron <michalwsieron@gmail.com>,
 openembedded-devel@lists.openembedded.org,
 Ovidiu Panait <ovidiu.panait@windriver.com>
References: <20260329-fix-confusing-appends-v1-0-df7e87b8b879@gmail.com>
 <20260329-fix-confusing-appends-v1-10-df7e87b8b879@gmail.com>
Content-Language: en-US
From: Stefan Wiehler <me@sephalon.net>
In-Reply-To: <20260329-fix-confusing-appends-v1-10-df7e87b8b879@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 15 Apr 2026 14:22:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126360

> Either I am missing something or it isn't needed in the build time and
> should maybe be a RRECOMMENDS:${PN}?
> 
> Signed-off-by: Michal Sieron <michalwsieron@gmail.com>
> Cc: Stefan Wiehler <me@sephalon.net>
> ---
>  meta-oe/recipes-test/syzkaller/syzkaller_git.bb | 4 ----
>  1 file changed, 4 deletions(-)
> 
> diff --git a/meta-oe/recipes-test/syzkaller/syzkaller_git.bb b/meta-oe/recipes-test/syzkaller/syzkaller_git.bb
> index e35a8a77be..bdd4cf6a40 100644
> --- a/meta-oe/recipes-test/syzkaller/syzkaller_git.bb
> +++ b/meta-oe/recipes-test/syzkaller/syzkaller_git.bb
> @@ -6,8 +6,6 @@ LICENSE = "Apache-2.0"
>  LIC_FILES_CHKSUM = "file://src/${GO_IMPORT}/LICENSE;md5=5335066555b14d832335aa4660d6c376"
>  require ${BPN}-licenses.inc
>  
> -DEPENDS:class-native += "qemu-system-native"
> -
>  SRC_URI = "git://${GO_IMPORT};protocol=https;destsuffix=${GO_SRCURI_DESTSUFFIX};branch=master"
>  SRCREV = "22ec1469fe8c0ba256de07e8f97fa7b375b522bd"
>  require ${BPN}-go-mods.inc
> @@ -39,8 +37,6 @@ GOBUILDFLAGS:remove = "-buildmode=pie"
>  
>  LDFLAGS:append:class-target = "${@bb.utils.contains_any("TC_CXX_RUNTIME", "llvm android", " -lc++", " -lstdc++", d)}"
>  
> -DEPENDS:class-native += "qemu-system-native"
> -
>  compile_native() {
>      export HOSTOS="${GOHOSTOS}"
>      export HOSTARCH="${GOHOSTARCH}"
> 

I see this has already been merged, but QEMU is actually required for
the syzkaller selftest, which is only documented in the respective
commit message [1].

However, I am not sure if the selftest is still maintained; it has not
seen any changes since its introduction in 2022 and when I did the last
syzkaller update, I was already unable to run it. I am primarily
interested in running syzkaller on real hardware, and if nobody is using
and maintaining the selftest we might as well remove it.

@Ovidiu Panait, as the initial author, are you still interested in the
syzkaller selftest?

Kind regards,

Stefan

[1] https://git.openembedded.org/meta-openembedded/commit/meta-oe/lib/oeqa/selftest/cases/syzkaller.py?id=cfac82c560e514333ebb1de772778554d1aca49c

