Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 258EDCFD376
	for <webhook@archiver.kernel.org>; Tue,  2 Dec 2025 07:25:18 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2664.1764660308531554409
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Dec 2025 23:25:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=C9SMZ479;
 spf=pass (domain: gmail.com, ip: 209.85.128.52, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-477a219dbcaso45735705e9.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 01 Dec 2025 23:25:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764660307; x=1765265107; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wWVsqWgjlYK0TZyatOCwsecLHtlaXer4WuGzZj3Qrhg=;
        b=C9SMZ479j2Co4vsUTwRb6aiXZVabzCqkAsXU6KUWZaKjb3cSoP3CX5+s3aWm7IlhBt
         O2ihf3sSdppycUHkiEbPm73nNP6WzE/Dp8E+XZSW/5B0UKYE6gyDKdVP79Tg01EqSUzJ
         7ytfr+Qhq4tEBbeyTyAhwizkLY6n0QsQjFsYHGELRCnZrnSwdSb/bEx9CmIW/GmgecCM
         uUqgkZl23UA1FZTTkrznJEsTb5/UZ6JfRkG51BA0cMq/eII/mnNw5MCul85OpcJ38yyR
         mz5VcEzXVKz9Q28DDTbLiO1CKiI2QeB88xHau4OHBNdLtIK2JLsHUbmBwp9t8UF5qHO5
         TmXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764660307; x=1765265107;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wWVsqWgjlYK0TZyatOCwsecLHtlaXer4WuGzZj3Qrhg=;
        b=vB8xtN6NNDX5AP5YJmBMVYjCSmpRvLWcvJ/ONHLErzM7auGe+N9x/2I3GvYgCQAEtE
         5xR/WWegfu1Y1FElWKYXVJ8l2WNBDoh/PSU+AivI0lrUiez3EDXRxzLaLN+jYh0f0KK4
         qIuqu0eQoe4grkL0gzKLhckTQDljSGi1a36r9vxPEtucdG0lOsq93AWX8GSiNXlMNpA8
         D7RQSersEM14ER07kkjMRMLngj29TBfcYjEIig0s2RLb+lZpNQkpVeGd5KMmjpnT2pGb
         cEx50fmT7c6x0NsNjPxh19N+d/KTd/wkE4Bu0ndgIOHJrysAUcvZiYy1wZhl6fxwp9J9
         Tk0w==
X-Forwarded-Encrypted: i=1; AJvYcCVUcCJK6kAFgm8+NMvfy0nUGrm4fNhz+KKZVbmGlMqn7QcutYNkIZlgbBS1mfqsfJh8VO7WnCXZBtYUDio80E/y/AM=@lists.openembedded.org
X-Gm-Message-State: AOJu0YzyouAq3tFaof6YbYYoyYRKUa9AbzPlm22h7/fArP+++CqbpaO7
	mTbg1n/4DSHWQqp5jLsoCBKdR4CO4Vgj8Fl8v53tZyaZFqU9ZNv0Xjo2N/ovyg==
X-Gm-Gg: ASbGncv6Ccz8jMAQTJpcCIRQuX70AbD6QsWJEG8MBuyjfK1KkNyrq2cdSu3mU16HLZK
	JUUuyF5nhSkW6vdJkt8OaAtTL2/LbvTu4TYgwXLzq3/d3O/5cVDr0oA+12KloH9gVHTBSg/Iny6
	o47/RpCSNOhDQ8+Ab2V+m0EsiKHoSf0fws5C+/F2hRgBMUS7T07sTJiExUbPVEZdh80bzPvm+O2
	zcUMBzgExz/0V++S8SGkkVduH/FteQ4avT4rgQukey1MzuwrJPM7GOMtMHCPuxEhkDX/Tsok6O/
	jXX/4NIfYa6cmULfxKcEAzOhcRnpq9+zUcNdRnmcPXyvKNHmjiL3ekp/fvJ4xWiBzSqe/nGOo87
	ZV5bLbJm20C4trEpGCntSMdqLzYPmfni5O9TgC/Hatp7FhJtxRY9b5tiP22OQupFlqp4/4dsfnl
	BIBvdTq5/Vz/3rDpCdkHU=
X-Google-Smtp-Source: AGHT+IE3koRfm3DLK4JBI7jzdCEaZACp3qKMUo18ZrusVBHy4hlE3mHwgYLOM723Bw845D2GfPM6Jw==
X-Received: by 2002:a05:600c:3595:b0:477:755b:5587 with SMTP id 5b1f17b1804b1-477c0184b34mr441276445e9.8.1764660306588;
        Mon, 01 Dec 2025 23:25:06 -0800 (PST)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42e1c5c30c4sm31606738f8f.9.2025.12.01.23.25.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Dec 2025 23:25:06 -0800 (PST)
Message-ID: <b134cf3a-ba61-4946-9d95-546e665e8ed3@gmail.com>
Date: Tue, 2 Dec 2025 08:25:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][PATCH] bpftool-native: Empty
 DEBUG_PREFIX_MAP_EXTRA
To: mingli.yu@eng.windriver.com, openembedded-devel@lists.openembedded.org
References: <20251202051354.3815601-1-mingli.yu@windriver.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <20251202051354.3815601-1-mingli.yu@windriver.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 02 Dec 2025 07:25:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122232

Hmmm... this doesn't sound right. DEBUG_PREFIX_MAP_EXTRA supposed to be
set only for class-target. This sounds like a possible bug in oe-core:
maybe it should get a weak-default value in gcc.bbclass, and a strong
(empty) assignment in gcc-native.bbclass?


On 12/2/25 06:13, Yu, Mingli via lists.openembedded.org wrote:
> From: Mingli Yu <mingli.yu@windriver.com>
>
> Most host gcc doesn't support -fcanon-prefix-map right now, so
> empty DEBUG_PREFIX_MAP_EXTRA to fix the below build error.
>  | gcc: error: unrecognized command-line option ‘-fcanon-prefix-map’; did you mean ‘-fmacro-prefix-map=’?
>
> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> ---
>  meta-oe/recipes-kernel/bpftool/bpftool-native_6.16.bb | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meta-oe/recipes-kernel/bpftool/bpftool-native_6.16.bb b/meta-oe/recipes-kernel/bpftool/bpftool-native_6.16.bb
> index bc7712ce4d..fe3ad6138e 100644
> --- a/meta-oe/recipes-kernel/bpftool/bpftool-native_6.16.bb
> +++ b/meta-oe/recipes-kernel/bpftool/bpftool-native_6.16.bb
> @@ -14,6 +14,8 @@ SRC_URI[sha256sum] = "1a4be2fe6b5246aa4ac8987a8a4af34c42a8dd7d08b46ab48516bcc1be
>  
>  S = "${UNPACKDIR}/linux-${PV}"
>  
> +DEBUG_PREFIX_MAP_EXTRA:toolchain-gcc = ""
> +
>  EXTRA_OEMAKE = "\
>      V=1 \
>      -C ${S}/tools/bpf/bpftool \
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#122230): https://lists.openembedded.org/g/openembedded-devel/message/122230
> Mute This Topic: https://lists.openembedded.org/mt/116572173/6084445
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [skandigraun@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


