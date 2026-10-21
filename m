Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2931.1792600038913332018
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 Oct 2026 09:27:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mailbox.org header.s=mail20150812 header.b=TPidWCep;
 spf=pass (domain: mailbox.org, ip: 80.241.56.152, mailfrom: marek.vasut@mailbox.org)
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4j8vnb2Xq9zKnCs;
	Wed, 21 Oct 2026 18:27:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1792600035;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HXHqikTTsPFY2L6ZIow1YPOmhWU8EUjk1rxH3c7u5n8=;
	b=TPidWCepU2FcW6+GHRIcLMU/j1qn+ZPI1lKVvGx/md3CysGnqpO8OOagmAfTTy0RX/DTDk
	TtVKaZbpbn5l2iUa1tChfYp8FvtPwQQXaPOb5M0gcET+/Mq2FkqjUu5FTVsJWIrige2YcY
	WPocydSskWMzFpl1K/mXYRe82U1hQ17vaYGu267GoQxl8FDP39V/MLnsR+AxhP+iWu7SrE
	obubvpgvjNfVWiw64ZYF4kxdi0u1/BV0hXYRt0qmZvQ/OaGM60AD20cNjKAQeJYKiyj3Hb
	iI1g+4R1qoIXlIZMt0JH5c1xLje4WTCIOvL3yseaU1y4ZtCHPx0HskqgbJaI1g==
Message-ID: <d1168121-cced-4238-8dee-9c1b1169e484@mailbox.org>
Date: Wed, 21 Oct 2026 18:27:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-filesystems][PATCH] overlayfs-tools: Inhibit tests on
 configure
To: Vyacheslav Yurkov <uvv.mail@gmail.com>,
 openembedded-devel@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>,
 Ankur Tyagi <ankur.tyagi85@gmail.com>, Khem Raj <khem.raj@oss.qualcomm.com>
References: <20261021135357.14928-1-marek.vasut@mailbox.org>
 <6f762fe7-ddf1-49bf-96bb-8e1d75f575c8@gmail.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <6f762fe7-ddf1-49bf-96bb-8e1d75f575c8@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: b903352f905a32c386b
X-MBO-RS-META: ptesn1wsnmpgf3n5anaz8ou7sho5k1ci
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 21 Oct 2026 16:27:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131304

On 10/21/26 5:09 PM, Vyacheslav Yurkov wrote:
> Thanks for the patch Marek.
> 
> Could you please explain how you hit the issue? I can't reproduce it.
> The sudo is required only for tests, which is a custom meson target. 
> It's not supposed to be called during configure.
$ bitbake -c configure overlayfs-tools

on aarch64 (STM32MP25) target (not using the ST layers).

I would also expect the tests to NOT run during configure.

It also happens in OE wrynose builds, but not in OE scarthgap builds.
