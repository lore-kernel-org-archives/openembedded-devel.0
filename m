Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com [209.85.210.196])
 by mx.groups.io with SMTP id smtpd.web11.1332.1604336138583047368
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 02 Nov 2020 08:55:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=hhOlAGql;
 spf=pass (domain: gmail.com, ip: 209.85.210.196, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f196.google.com with SMTP id b3so11639630pfo.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 02 Nov 2020 08:55:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=diliIsQc+0vRkCu73WjEJOwBAvhie6vtylRlYNaQ8Ss=;
        b=hhOlAGql5Iq2e1K1LKvW+yaPJL0bpjzBgGSPpVwmWghPnGtlz8BFKhCoXeXwxuvgJK
         3DdIq/uNj5Xno9WsVuATOiyl8XO4496C37IURFzYvP8HAkmkya+5D6G++ytAlseVBME8
         a2bhBHNbd21c372CcZO7clS98JHwtoi4fWZquKCPe/sBTE7PnGzZjuxJd2RBvzb93TP4
         /uyoqTs0c8oYh/wVJAdBIfAvY8zRtxk23vg9xYoAoZfka+aWoFHZnQocFJ0c6wAGVjh7
         +0cKVs25TrvfXrHpJZQ/+g0CaKgEVW1JcYi1JXhnqL9K7BpMGqHnPqGPWwx8UyKyjVjA
         dzhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=diliIsQc+0vRkCu73WjEJOwBAvhie6vtylRlYNaQ8Ss=;
        b=MMIjGkNjBhGsWXa8seifZn5ULnGPMhxe46Yp8IVr6T5fwjwt0YKmJJ/nJR+41SBtph
         0HuZ3Mdmvv1A4dZRgO33L0hwxLWE06POfDzewSzDnRWItEkdkdLFln/XRX37xzEzXt8M
         hS5/frKnbWV+TXHpcyPdnedomOtwuQsorDgr1xrobA7F0HXvxFesyylVqJCJIHIPDCe8
         MSJMxKe5iyUkbcvonCtvmX5UnI2Zj5ZNKrfSvA+hlnv1MbgShOQImEbikAhpiG470cCS
         9EQDf4X72WGCRp0IcJK/RJ22w3ov47jgqAN6a4oRUU+swAFkhdIGZLeGCma7qe99WP/E
         ERxw==
X-Gm-Message-State: AOAM5330MFYeOwBMNLjs3f1Iu8nbBpHGYABNynfjHiiX8ri7dDymGTcM
	Lcoewye93nDnKTVpmhHnJvZFaeThrQK6zA==
X-Google-Smtp-Source: ABdhPJzGQke3ZTRsovznxXnZYppACQuwf2Vh+e+laHr3S83DcozcStiY9AZ66MG4p1g59A0Z6LjZGg==
X-Received: by 2002:a62:3746:0:b029:164:4326:1e7a with SMTP id e67-20020a6237460000b029016443261e7amr22766460pfa.33.1604336137564;
        Mon, 02 Nov 2020 08:55:37 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:4e0::4b05? ([2601:646:9200:4e0::4b05])
        by smtp.gmail.com with ESMTPSA id k25sm14141269pfi.42.2020.11.02.08.55.36
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2020 08:55:37 -0800 (PST)
Subject: Re: [oe][master][zeus][PATCH] packagegroup-cross-canadian: repackage when multilibs gcc gdb binutils changes
To: openembedded-devel@lists.openembedded.org
References: <20201102062955.73203-1-jiping.ma2@windriver.com>
From: "Khem Raj" <raj.khem@gmail.com>
Message-ID: <d6176089-0bd2-d786-99c4-f76f0acd872a@gmail.com>
Date: Mon, 2 Nov 2020 08:55:36 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201102062955.73203-1-jiping.ma2@windriver.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Please resend it to oe-core mailing list.

On 11/1/20 10:29 PM, Jiping Ma wrote:
> Signed-off-by: Jiping Ma <jiping.ma2@windriver.com>
> ---
>   .../packagegroups/packagegroup-cross-canadian.bb  | 15 ++++++++++-----
>   1 file changed, 10 insertions(+), 5 deletions(-)
> 
> diff --git a/meta/recipes-core/packagegroups/packagegroup-cross-canadian.bb b/meta/recipes-core/packagegroups/packagegroup-cross-canadian.bb
> index 3b430c0814..b6b3e5235f 100644
> --- a/meta/recipes-core/packagegroups/packagegroup-cross-canadian.bb
> +++ b/meta/recipes-core/packagegroups/packagegroup-cross-canadian.bb
> @@ -17,8 +17,13 @@ RDEPENDS_${PN} = "\
>       meta-environment-${MACHINE} \
>       "
>   
> -# When TUNE_ARCH changes but MACHINE does not (for example when a machine definition is updated),
> -# cross-canadian.bbclass prevents variable dependency propagation to TRANSLATED_TARGET_ARCH
> -# This will result in erroneous reuse of previous sstate packages. The following line
> -# establishes a direct dependency instead.
> -do_package[vardeps] += "TUNE_ARCH"
> +# When TUNE_ARCH, GCC, GDB, BINUTILS changes but MACHINE does not (for example when a machine
> +# definition is updated), cross-canadian.bbclass prevents variable dependency propagation to
> +# TRANSLATED_TARGET_ARCH This will result in erroneous reuse of previous sstate packages. The
> +# following line establishes a direct dependency instead.
> +do_package[vardeps] += "\
> +    ${@all_multilib_tune_values(d, 'BINUTILS')} \
> +    ${@all_multilib_tune_values(d, 'GDB')} \
> +    ${@all_multilib_tune_values(d, 'GCC')} \
> +    TUNE_ARCH \
> +    "
> 
> 
> 
> 
> 
