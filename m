Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id 6A44C6E5CB
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Apr 2018 04:55:05 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id u86so7249347pfd.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 09 Apr 2018 21:55:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=zhx8CErpTlexOUWynDTQvFHYbRVUJdQgyQ7EUCW/frg=;
	b=hqU/GzBqX7/vlvMXXZCdEFAbUWa3LcVI4fu1juKnNK9iZ8T0oeqhd1TqoSFXez53zY
	CiiCS2zNfynSopx/vSJtDxjsYAuzeFYflbCs9gbFwN+UihKYBFqtZfqPGqlo2HszGKyx
	o4BAb1GYT5HkEppYG7VIZouXEEfV5KLTYs2V6yzSepXqtKcRTBvwKRf4KSP3OTskiaLU
	70WDg13JCFQfAEd6Qaayl83dtZLfRKcRHTZF1ZLqRXS3CydHIPol2kEOiQWCGarkSUlx
	rSvwbOC57LO1YMc1y0qKRYemvThga3J8q8Vt0Xre7PwuxkWcJhUqkVHqFM+gmdgH2hQU
	qsRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=zhx8CErpTlexOUWynDTQvFHYbRVUJdQgyQ7EUCW/frg=;
	b=Z/BOKZmqSOD9fKpyaCXTWyINBtU3IxMIe87SMv0xMjq6s/F08h8IewkcjMH1karl+E
	eVJphk7M7/4rf7HC1wTX+yqWMIpHV2KW2PgtgzwBC+fdZLYaldH316bgyfz7biNYqSSL
	Xm1VLpHo3tIf1yLqX5qRDOwgi8sNE7DCzkf7aRTRyeGw7mh43+qe3C7HIaSuPO/E6ZVO
	IB8vdiEj+JYifqMua75vtTcg4dk/YSE0KZzBbhlsX+1GuT18l6AMHtlUZFQJ+5LKuspf
	kFizXOtHGT08Uot7W+723gwayfiSyK1tK83yahQo+eXMDppCljNk7oDTY/BWKLcMd1fq
	zzeQ==
X-Gm-Message-State: AElRT7EHA5IVuQuRJ4q2HEmSR8nQ71Xb+bHTc/T9973HpHtBzSpzOmeS
	r9DC+WTlcRUFtSnxjQ1lrA7t72rV
X-Google-Smtp-Source: AIpwx4/5mz6/ZzC9zj5Vkvvn27t83w4WtbnpZeuzRUehD2zEIlNUjn67ktRVzBlsM4Nc3qbMcPEooA==
X-Received: by 10.99.95.214 with SMTP id t205mr27435891pgb.145.1523336106111; 
	Mon, 09 Apr 2018 21:55:06 -0700 (PDT)
Received: from ?IPv6:2601:646:8880:466c:b946:b3:7b1:a98f?
	([2601:646:8880:466c:b946:b3:7b1:a98f])
	by smtp.gmail.com with ESMTPSA id
	q75sm3538564pfj.99.2018.04.09.21.55.05
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 09 Apr 2018 21:55:05 -0700 (PDT)
To: Qi.Chen@windriver.com, openembedded-devel@lists.openembedded.org
References: <1523328413-24714-1-git-send-email-Qi.Chen@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=raj.khem@gmail.com; prefer-encrypt=mutual; keydata=
	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
Message-ID: <a33986dc-bfc0-aead-0a52-c2fbaaa9e61f@gmail.com>
Date: Mon, 9 Apr 2018 21:55:04 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:60.0)
	Gecko/20100101 Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <1523328413-24714-1-git-send-email-Qi.Chen@windriver.com>
Subject: Re: [meta-oe][PATCH] gperftools: add the setting of COMPATIBLE_HOST back
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
X-List-Received-Date: Tue, 10 Apr 2018 04:55:05 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 4/9/18 7:46 PM, Qi.Chen@windriver.com wrote:
> From: Chen Qi <Qi.Chen@windriver.com>
> 
> This setting was deleted, but on mips and glibc, we still have this
> problem. So add this setting back, but limit it to glibc.
> 
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  meta-oe/recipes-support/gperftools/gperftools_2.6.1.bb | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/meta-oe/recipes-support/gperftools/gperftools_2.6.1.bb b/meta-oe/recipes-support/gperftools/gperftools_2.6.1.bb
> index ecac6c5cc..1d562adda 100644
> --- a/meta-oe/recipes-support/gperftools/gperftools_2.6.1.bb
> +++ b/meta-oe/recipes-support/gperftools/gperftools_2.6.1.bb
> @@ -19,6 +19,10 @@ inherit autotools
>  
>  S = "${WORKDIR}/git"
>  
> +# On mips, we have the following error.
> +#   do_page_fault(): sending SIGSEGV to ls for invalid read access from 00000008
> +#   Segmentation fault (core dumped)
> +COMPATIBLE_HOST_libc-glibc = "(i.86|x86_64|powerpc|powerpc64|arm|aarch64).*-linux*"

perhaps setting compatible host to null when its mips is better option
since everything else is there in this regexp

COMPATIBLE_HOST_mipsarch_libc-glibc = "null"

>  # Disable thumb1
>  # {standard input}: Assembler messages:
>  # {standard input}:434: Error: lo register required -- `ldr pc,[sp]'
> 


