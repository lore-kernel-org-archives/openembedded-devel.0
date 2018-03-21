Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id 12EEF78978
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Mar 2018 14:49:48 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id d26so2058545pfn.5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Mar 2018 07:49:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding:content-language;
	bh=wJcujeivyaD2TdaRluQobM8cAukt0tFWhmV8LelsKKw=;
	b=W2YmKZElA4ZIwhRLPiZ5eCmDzCoq9YQZf51pHTgy1223OllHxk7ZlpusUFVyxsclm1
	3bfIILTcJLWKBO4EuiXrz0HTeX+GagMahSDRhKJ9R3+qn+DkzgQniylrY/GB0oP7XXih
	7U0Qf96jhIwQwcIOkxDA9kqWI/DfuLVYmXA1MvWzQoPoNT3iicx/Nx/AMqad/gLvqk4k
	o5FMtd3j1430xoTQY88icnEHyy/fhtOY/GaLdqqLjoTkqxZcmcICMtYoouD7z1YaWWxt
	2UvjwcpUGqNv0DkBYvJehLkwwNx3iSH660hBifRUNxpLMKIjoYSEf1LPHl8p5kvKHueP
	JAgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=wJcujeivyaD2TdaRluQobM8cAukt0tFWhmV8LelsKKw=;
	b=gd8E8QSd5UOJSonOLSa6q2fYBUzivSYshGu8gE9dXVVWi0ekvvt5LtvaRfv17Nk9zp
	wcrIah66WMMhwPF8tHg/immNp+LgvlEKpZxGS6ixWDxX6AITX960kH1JN+3a6x/NYBw1
	ONcYwI+4THak3P67sa+M5PKeMQYMH3Gbd51LXlZGurEASxs9z5SaamwfCQitVOHtufww
	GQzZUIjrGxeLTY+mMKepj59lLYeF/jT3G+tlByf59bFRQEjfIDX1gW/s9XVQGZ3g4+jd
	CMH4NpZvScgUEQBTnVEpHftwZX3F80EOS7gu/C+nQz8L78eQcQmhIsNnIQvw+RL5s5OV
	2yww==
X-Gm-Message-State: AElRT7FYlyEfcOPsjcsgb5PF1TNS0G70E3mHjFF7/qIYJyg7sTcriywp
	6BAFmfF/GlWnJyAB+R5jAf4Z2g==
X-Google-Smtp-Source: AG47ELu/qaf7Pkj1Gue9VDrdc/WiBuObi3kXm+stiD65mwbXrjvJaChXwGBX5TlYw0zkok3Ma8oK2Q==
X-Received: by 10.99.99.65 with SMTP id x62mr1094892pgb.157.1521643790149;
	Wed, 21 Mar 2018 07:49:50 -0700 (PDT)
Received: from ?IPv6:2601:202:4000:1184:a1c1:eb3f:f249:aed1?
	([2601:202:4000:1184:a1c1:eb3f:f249:aed1])
	by smtp.gmail.com with ESMTPSA id
	n125sm8766008pfn.41.2018.03.21.07.49.49
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 21 Mar 2018 07:49:49 -0700 (PDT)
To: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>,
	openembedded-devel@lists.openembedded.org
References: <1521603377-34881-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
	<1521603377-34881-10-git-send-email-huangqy.fnst@cn.fujitsu.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <d2a7a72a-1b74-20a9-386b-7c86c4a57653@gmail.com>
Date: Wed, 21 Mar 2018 07:49:48 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <1521603377-34881-10-git-send-email-huangqy.fnst@cn.fujitsu.com>
Subject: Re: [meta-python][PATCH] python-msgpack: 0.5.5 -> 0.5.6
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
X-List-Received-Date: Wed, 21 Mar 2018 14:49:49 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 03/20/2018 08:36 PM, Huang Qiyu wrote:
> Upgrade python-msgpack from 0.5.5 to 0.5.6.
Already have an update in stagging/master-next

>
> Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
> ---
>  meta-python/recipes-devtools/python/python-msgpack.inc                | 4 ++--
>  .../python/{python-msgpack_0.5.5.bb => python-msgpack_0.5.6.bb}       | 0
>  2 files changed, 2 insertions(+), 2 deletions(-)
>  rename meta-python/recipes-devtools/python/{python-msgpack_0.5.5.bb => python-msgpack_0.5.6.bb} (100%)
>
> diff --git a/meta-python/recipes-devtools/python/python-msgpack.inc b/meta-python/recipes-devtools/python/python-msgpack.inc
> index 2e852cc..fdc8926 100644
> --- a/meta-python/recipes-devtools/python/python-msgpack.inc
> +++ b/meta-python/recipes-devtools/python/python-msgpack.inc
> @@ -2,8 +2,8 @@ SUMMARY = "MessagePack (de)serializer"
>  LICENSE = "Apache-2.0"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=cd9523181d9d4fbf7ffca52eaa2a5751"
>  
> -SRC_URI[md5sum] = "62640290ea856420d83b7f9dc1dd789d"
> -SRC_URI[sha256sum] = "7f5d6e59228b65c47cfdae76a4aea71f6902525f18256862cda69888a686b5f9"
> +SRC_URI[md5sum] = "6d644c06a87a5a111bbbf5b34b4be440"
> +SRC_URI[sha256sum] = "378cc8a6d3545b532dfd149da715abae4fda2a3adb6d74e525d0d5e51f46909b"
>  
>  PYPI_PACKAGE = "msgpack-python"
>  inherit pypi
> diff --git a/meta-python/recipes-devtools/python/python-msgpack_0.5.5.bb b/meta-python/recipes-devtools/python/python-msgpack_0.5.6.bb
> similarity index 100%
> rename from meta-python/recipes-devtools/python/python-msgpack_0.5.5.bb
> rename to meta-python/recipes-devtools/python/python-msgpack_0.5.6.bb


