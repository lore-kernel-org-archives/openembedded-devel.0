Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DFE4109319D
	for <webhook@archiver.kernel.org>; Fri, 20 Mar 2026 09:21:17 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8803.1773998468511404973
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 20 Mar 2026 02:21:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PsQYQdeK;
 spf=pass (domain: gmail.com, ip: 209.85.221.49, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-439b7c2788dso215615f8f.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 20 Mar 2026 02:21:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773998467; x=1774603267; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jPZBZqqFmLBlgQ7IViOdR1MFV2IhJWKvZj0GKMk7/Wk=;
        b=PsQYQdeK4goKEC6I/am3ZHqXYIZWEfLh6j5giA8azGUqGS0oaQ1wNOJawAPN3PSzV4
         nvLZkiKgkBeGrTMs41Xan3bCx8qmPRiRcA7iPHeNyMI/9xEn3LfD5yMV1v46xlHflstY
         wN7x6Wpg/MEhTHoMbVlIL70dq5pS1S0Hf+cBxYduFcXt5cLM0VXLCTNuCinNHTSvWh8R
         WWYCw2WtydnqxHLg7ZD7k+KMbamJdNYVH3tgVsyHGzLzFqG4IoBkjLMlmLM8o8sYgB2y
         AmjNNJNPYglxqz7soNK4NDIZhvajhvfnIXB2bldyaZIHg8v64LGetblXP7XGdVgwhUw1
         yHzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773998467; x=1774603267;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jPZBZqqFmLBlgQ7IViOdR1MFV2IhJWKvZj0GKMk7/Wk=;
        b=dMUBGSi/CuHnH+ps5ZyWDLFtphRuHPU5dqHrhV5STfq4x31AsnfrO3c9GIq5V7Et3H
         VqNAmLgRu/bhdH/1k7xzL2/jSv6TWEDXaGIQAr1IsHaqD3P66dg4fG5e+Srlo1+tM3P9
         YPHxGqcdUZkqFN5KIR8jqc2ThErBXm8YnwUmDeBuIORcgkCzvIvOLD8GP4Mq7XG7DNhf
         NljqYn7rMNgeOJC3rT/UmZ/bAJC5RqBehaka807KAVYuad7ciCqDUlfWHTk37hXFGPxY
         6oywi6yB1/SQ9FkBpK4kDML7OnqNtfgEqwWVV5cngOA5VcLlRC8wQbucDFmglgL4dWBV
         V8aw==
X-Gm-Message-State: AOJu0YwvwFARInNsmlFV5Yd388YBsBv9K29vk0gGMFakBQHChGcB9P5a
	IbO8aazcoG9YWbRsQYJLSVCwuWk0fy4uSmidnLMTRIyu1JYB4teceAm1DKTLbA==
X-Gm-Gg: ATEYQzxlUWd0oYQ0G0y+jFb+cZWgXnO1YOMu1EC0570C4T07SQ4JGmuMivuLZn0CYyi
	zQxh1b9sWPvC0MVUdlR/8OXNFe39UEViRXF5gurK+B8Vd5H2PCfiRsSyA2bF/eUgEDg+fHvVTPY
	A/p73LIv/GLag5MI5AfTOWHUX3VLr9qe/czZW5OUEp0M6stI5z/Zmi5JgpO57iIibrGhdRHvqo/
	4PFo5FzMuLguJVYGchay7BO8S2sQfA3O9fx5csYfErT9IJXumzIiE9Wpq2an4Jo2mgWlZA0YrGY
	dqSDZ+m/VQJMeFnUIizZMHbq71TxNzMIQnAWoBTdg4s3AdzRMHmbC+onK73fv15S+XoXTLDPZKK
	1XhAQUxNDSrqaGBGVcHBAQbk9qsJpseuEJj4XQWlDQFScxws20a+qHyDFh3fFv6oFyTuvG8aw37
	hGO4ONdYdznCJ9YoSHU3ez1+rdxxyFzMQ=
X-Received: by 2002:a05:6000:2f84:b0:439:c018:60ec with SMTP id ffacd0b85a97d-43b6427d205mr3557464f8f.30.1773998466530;
        Fri, 20 Mar 2026 02:21:06 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b64717e97sm5089343f8f.35.2026.03.20.02.21.05
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Mar 2026 02:21:06 -0700 (PDT)
Message-ID: <125149ab-11fd-4ff1-9315-1d41f1173334@gmail.com>
Date: Fri, 20 Mar 2026 10:21:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-networking][PATCH v2] samba: upgrade 4.19.9 -> 4.23.5
To: openembedded-devel@lists.openembedded.org
References: <189E7F7391B50DB9.1811804@lists.openembedded.org>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <189E7F7391B50DB9.1811804@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 20 Mar 2026 09:21:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125426

On 3/20/26 09:30, Gyorgy Sarvari via lists.openembedded.org wrote:
> @@ -24,11 +28,11 @@ SRC_URI = "${SAMBA_MIRROR}/stable/samba-${PV}.tar.gz \
>             file://0005-Fix-pyext_PATTERN-for-cross-compilation.patch \
>             file://0006-smbtorture-skip-test-case-tfork_cmd_send.patch \
>             file://0007-Deleted-settiong-of-python-to-fix-the-install-confli.patch \
> -           file://9aa5c43315d83c19514251a11c4fba5a137f2821.patch \
>             file://0001-lib-replace-Implement-memset_explicit.patch \
>             file://0002-lib-replace-Add-test-for-memset_explicit.patch \
>             file://0003-Replace-memset_s-with-memset_explicit.patch \
>             file://0004-lib-replace-Remove-memset_s.patch \
> +           file://use-xslt-replace-function-when-available.patch;rev=need-to-be-applied-manually \
>             "

Wanted to mention this - this is admittedly an abuse of the "rev" tag.
The idea is that this patch shouldn't be applied in ${S}, but in the
native-sysroot (probably the patch should be in oe-core) - however
during do_patch the sysroot may not be fully populated yet, so this tag
makes do_patch to skip this. Then patching happens separately, in
do_configure, when the sysroot is complete.

If anyone has a better idea, please let me know.

