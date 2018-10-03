Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
	[209.85.215.194])
	by mail.openembedded.org (Postfix) with ESMTP id 3FB52798CC
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  3 Oct 2018 23:10:04 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id v133-v6so2239108pgb.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 03 Oct 2018 16:10:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=UwK5iUzgfFRyau6lfE+uGKVAZkWe70RBJX+PB+mLjjg=;
	b=bhIqRru1qGHCss7l5mYdImv39nu669WLlgX6c6nyGhhEBtb5OwG1SR1DooTS57BoCh
	1wLUsvQnm3IlDrhzSi/a1roG0w5isj0n/8COgJo1AD+9fqTVG94RH4gKyt00dqRlwFVZ
	VB9Nu9K6ZJ+cNETdfxFck0VaxvZ4+I/xuHA/GjQ0cXE7zCyIKTrUJNJKHcCQE06YNbW8
	MIYXfR/S111IY7WgvGvyqAcczcmWqab08Du0Zj6qEou/GfYLWZGF7uMyBkvClHrkNQIK
	F8NBVsNZkn+rgnuh1AA1qbNbrk9CF2BsPY9S7rGjMxepPF9Jovhb0uQqzhsEULKtJ1g2
	oFsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=UwK5iUzgfFRyau6lfE+uGKVAZkWe70RBJX+PB+mLjjg=;
	b=XmnACBmk7g88CPNLxnB8m7O0Es5AY+ZRuxXw9pzbyJsLbt2CXgIZ0EoFU13eO8/aUC
	nhAmimfIWE9tq43AQF5rRhnIP++1BwJ73jsDKvMWmXnbtFHfoFPrMv6RRDazwi3wNOvH
	gV5Dw0q18Z/YmLIB9ogJ0Ii+uO/Ev1FlaLyNLS317hTfJxcwL3rSlKTcYrON7ewNmpYK
	7opg+SPmb5jIDuoX7PR18sHokPM25YnEGaTgVAt85Gk50N10+MXDMJR6j+gNw3cr8E5Y
	hacG16yLgDfq686tjwGGlvRU269Lz97d8XLfG91uw9xzOBKXywQgbEk6CczGvvXdF/Jt
	AxhA==
X-Gm-Message-State: ABuFfoiOiYIgRPKrNg1gh3O9McB9HEMd26c5h2cUqmdvwKjHZZ75F/1y
	3K+YnmvwvZ1H4RvRAKOfgBi/M7Sr
X-Google-Smtp-Source: ACcGV61Gfh50Aai6nzNz6Rg1BxGS3pB1VufJW7VOaaUNsvsnNEtu+Wlz7l22UdejGUovPl4+9ADYEQ==
X-Received: by 2002:a65:609a:: with SMTP id
	t26-v6mr2844626pgu.41.1538608205006; 
	Wed, 03 Oct 2018 16:10:05 -0700 (PDT)
Received: from ?IPv6:2601:202:4180:c33:387c:5729:e2c3:c506?
	([2601:202:4180:c33:387c:5729:e2c3:c506])
	by smtp.gmail.com with ESMTPSA id
	i2-v6sm2711348pgq.35.2018.10.03.16.10.04
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 03 Oct 2018 16:10:04 -0700 (PDT)
To: Ankit Navik <ankit.tarot@gmail.com>,
	openembedded-devel@lists.openembedded.org
References: <1538581223-13647-1-git-send-email-ankit.tarot@gmail.com>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <b0446aaa-3f8a-54c1-539f-887f671b9cb5@gmail.com>
Date: Wed, 3 Oct 2018 16:10:03 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <1538581223-13647-1-git-send-email-ankit.tarot@gmail.com>
Subject: Re: [PATCH] opencl-headers: Initial recipe for OpenCL headers
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
X-List-Received-Date: Wed, 03 Oct 2018 23:10:04 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 10/03/2018 08:40 AM, Ankit Navik wrote:
> Add generic recipe for OpenCL API headers.
>
> Signed-off-by: Ankit Navik <ankit.tarot@gmail.com>
> ---
>  .../recipes-core/opencl-headers/opencl-headers_git.bb | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
>  create mode 100644 meta-oe/recipes-core/opencl-headers/opencl-headers_git.bb
>
> diff --git a/meta-oe/recipes-core/opencl-headers/opencl-headers_git.bb b/meta-oe/recipes-core/opencl-headers/opencl-headers_git.bb
> new file mode 100644
> index 0000000..16bc247
> --- /dev/null
> +++ b/meta-oe/recipes-core/opencl-headers/opencl-headers_git.bb
> @@ -0,0 +1,19 @@
> +SUMMARY  = "OpenCL API Headers"
> +DESCRIPTION = "OpenCL compute API headers from Khronos Group"
> +LICENSE  = "CLOSED"
There is a license file at the repo. Would adding a "Khronos" license be
more appropriate?

https://github.com/KhronosGroup/OpenCL-Headers/blob/master/LICENSE

- armin
> +LIC_FILES_CHKSUM = "file://CL/opencl.h;beginline=1;endline=27;md5=687394644e8c4ec4fd3d77f2f86bc042"
> +SECTION = "base"
> +
> +S = "${WORKDIR}/git"
> +SRCREV = "40c5d226c7c0706f0176884e9b94b3886679c983"
> +SRC_URI = "git://github.com/KhronosGroup/OpenCL-Headers.git"
> +
> +do_configure[noexec] = "1"
> +do_compile[noexec] = "1"
> +
> +do_install () {
> +	install -d ${D}${includedir}/CL/
> +	for f in ${S}/CL/*.h; do
> +		install -m 0644 $f ${D}${includedir}/CL/
> +	done
> +}


