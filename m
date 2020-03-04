Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
	[209.85.215.193])
	by mail.openembedded.org (Postfix) with ESMTP id 9ECC261145
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  4 Mar 2020 05:06:23 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id d9so407514pgu.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 03 Mar 2020 21:06:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:autocrypt:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding:content-language;
	bh=ZN7I8NJyf4wsLpKL/NongCauF8jT/MK9XtnXMzXzuFQ=;
	b=j6rhaWEPRYUjSAHTB2JUCCQqLUNEwypj9Zfnv6ezEKLuba3qyBhK6MwgxEuoqn7fQu
	50M1yfWL7+6zA+PfCiX78n/K4ecMsv05WwbzwAd2hzzpa6iqezWbfqvp+1gW1U17QrCu
	DdIohRMJLBTJlzYryuEAU5j0VQVlPcJLBVVjX8z1CpVaqlyU3at00H9urLJSndP9bceP
	kSb245J3knaU019v4xycKeL4QkDqfGxRlXj6oDVg8b2F9hi+MF0rk2nOGy0c34Ekk1XK
	8LRDHaL5Tn7s8uIgteoiImRP1oyh0vgIfEFEmGG+rWDD73s7rZG94UsVeDlKx1W8+xcZ
	2/eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=ZN7I8NJyf4wsLpKL/NongCauF8jT/MK9XtnXMzXzuFQ=;
	b=bibHTRG9dWOHWRS6L81UZ+oSJV2wtnAsIOfJj4VuWRPFXH2ijN0db0mlAK8QBkber7
	pfElxykClBJZOdf1l49/+7QgHtGRfzHJKy56DLK/krV571w1eUMQmMptOpsPdG6AdL8J
	TeMg+XWpH4Agz1zB+ubKIM7dklPf1JiSvrPkNJLeKSaKiggLnYLafurfRnIsFPjJ7sLw
	14v6hUL/xvCaJvhZcaSUlie1+1vvW25veq3TpqCgUKvFD7h8TDdyvtRAzMjFVEMm1KFJ
	JDdKt4oxEmo0c/kZf62ak+fYQJaYpDNnz8br55vhXBI63e/83eVdZZ05x+bPXaGIyh9R
	wPsA==
X-Gm-Message-State: ANhLgQ2u1YpWwoiAo+7xfUXqyL6XvnFm/3KUqoWyDDJwb9WgsQA4IhN+
	uvqEX2PBZBZ8No8mzCvqikE=
X-Google-Smtp-Source: ADFU+vuxOgZm+bao9ST63VDuKCFiK7VesWqh08wNsuAbdF/fEORvbnW+VoHWnpDfUn86vCmfTp68Pg==
X-Received: by 2002:a63:104a:: with SMTP id 10mr959663pgq.276.1583298384635;
	Tue, 03 Mar 2020 21:06:24 -0800 (PST)
Received: from ?IPv6:2601:202:4180:a5c0:3055:bf8b:bc3b:3d57?
	([2601:202:4180:a5c0:3055:bf8b:bc3b:3d57])
	by smtp.gmail.com with ESMTPSA id
	w65sm22894457pfd.77.2020.03.03.21.06.23
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Tue, 03 Mar 2020 21:06:24 -0800 (PST)
To: Haiqing Bai <Haiqing.Bai@windriver.com>,
	openembedded-devel@lists.openembedded.org
References: <1583292052-256796-1-git-send-email-Haiqing.Bai@windriver.com>
From: akuster808 <akuster808@gmail.com>
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <c9c12515-5552-8054-28a8-e7b72ae9af7e@gmail.com>
Date: Tue, 3 Mar 2020 21:06:23 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <1583292052-256796-1-git-send-email-Haiqing.Bai@windriver.com>
Cc: yue.tao@windriver.com
Subject: Re: [zeus][PATCH] gd: fix CVE-2017-6363
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
X-List-Received-Date: Wed, 04 Mar 2020 05:06:23 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 3/3/20 7:20 PM, Haiqing Bai wrote:
> Backport the CVE patch from the upstream to fix the heap-based buffer
> over-read in tiffWriter.
Did I miss the patch for master?

- armin
>
> Signed-off-by: Haiqing Bai <Haiqing.Bai@windriver.com>
> ---
>  .../recipes-support/gd/gd/CVE-2017-6363.patch | 35 +++++++++++++++++++
>  meta-oe/recipes-support/gd/gd_2.2.5.bb        |  1 +
>  2 files changed, 36 insertions(+)
>  create mode 100644 meta-oe/recipes-support/gd/gd/CVE-2017-6363.patch
>
> diff --git a/meta-oe/recipes-support/gd/gd/CVE-2017-6363.patch b/meta-oe/recipes-support/gd/gd/CVE-2017-6363.patch
> new file mode 100644
> index 000000000..25b5880ff
> --- /dev/null
> +++ b/meta-oe/recipes-support/gd/gd/CVE-2017-6363.patch
> @@ -0,0 +1,35 @@
> +From 8f7b60ea7db87de5df76169e3f3918e401ef8bf7 Mon Sep 17 00:00:00 2001
> +From: Mike Frysinger <vapier@gentoo.org>
> +Date: Wed, 31 Jan 2018 14:50:16 -0500
> +Subject: [PATCH] gd/gd2: make sure transparent palette index is within bounds
> + #383
> +
> +The gd image formats allow for a palette of 256 colors,
> +so if the transparent index is out of range, disable it.
> +
> +Upstream-Status: Backport
> +[https://github.com/libgd/libgd.git commit:0be86e1926939a98afbd2f3a23c673dfc4df2a7c]
> +CVE-2017-6363
> +
> +Signed-off-by: Haiqing Bai <Haiqing.Bai@windriver.com>
> +---
> + src/gd_gd.c | 3 ++-
> + 1 file changed, 2 insertions(+), 1 deletion(-)
> +
> +diff --git a/src/gd_gd.c b/src/gd_gd.c
> +index f8d39cb..5a86fc3 100644
> +--- a/src/gd_gd.c
> ++++ b/src/gd_gd.c
> +@@ -54,7 +54,8 @@ _gdGetColors (gdIOCtx * in, gdImagePtr im, int gd2xFlag)
> + 		if (!gdGetWord (&im->transparent, in)) {
> + 			goto fail1;
> + 		}
> +-		if (im->transparent == 257) {
> ++		/* Make sure transparent index is within bounds of the palette. */
> ++		if (im->transparent >= 256 || im->transparent < 0) {
> + 			im->transparent = (-1);
> + 		}
> + 	}
> +-- 
> +1.9.1
> +
> diff --git a/meta-oe/recipes-support/gd/gd_2.2.5.bb b/meta-oe/recipes-support/gd/gd_2.2.5.bb
> index 35f9bb251..dda2e67d6 100644
> --- a/meta-oe/recipes-support/gd/gd_2.2.5.bb
> +++ b/meta-oe/recipes-support/gd/gd_2.2.5.bb
> @@ -17,6 +17,7 @@ SRC_URI = "git://github.com/libgd/libgd.git;branch=GD-2.2 \
>             file://0001-annotate.c-gdft.c-Replace-strncpy-with-memccpy-to-fi.patch \
>             file://CVE-2018-1000222.patch \
>             file://CVE-2019-6978.patch \
> +           file://CVE-2017-6363.patch \
>            "
>  
>  SRCREV = "8255231b68889597d04d451a72438ab92a405aba"


