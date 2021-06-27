Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web09.4840.1624799276830491487
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 27 Jun 2021 06:07:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=E/TKa5lK;
 spf=pass (domain: gmail.com, ip: 209.85.210.176, mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f176.google.com with SMTP id y4so11698461pfi.9
        for <openembedded-devel@lists.openembedded.org>; Sun, 27 Jun 2021 06:07:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=9ErVcDkiGJpkbU4lz+id/Y4nyq0ByYDH5C9Rr3zTcJQ=;
        b=E/TKa5lKGvQLDe2X9EqqR15Qe7hm8z0MN9cY6BOUropL1/GkUzZTPbRbtiytBp0I5c
         NQ4ITc7tou07YvoXE+J2W2zBUhBgRtHdfL7g0CJsBb/u/YbySfxrj+fYhopVo0oXjdD5
         ZA24qbpPV4TxB43DUFPWe06eg7Cp6AlYhW/nsIiE0A8NtSbMbhSU90B8qohG1PDhvNGv
         6w6HAlqbir92BMXR1prPSjh/J8/z0mKY8UaqZqfS2AWpd2GYwwx5Wrkw/wq4oCZ6G2n0
         JSxf/W4FUxmdu+wkUqYdisCSLxdbwOOva+n3g0xENUw8+JVRdpyM6XDnXt2ywkVJd5Cp
         4cxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=9ErVcDkiGJpkbU4lz+id/Y4nyq0ByYDH5C9Rr3zTcJQ=;
        b=sptfI71yVgoZiYixPgKLm8AImfNUTEAyNRQSohsdjTsd6drPqlVzRU+9WVkJXwcqqO
         1v+kl4Q34Ke4gJRqfsXV7fO0b9qpz2h5KOMq/swXY9mtn6jHDCKkIsWrrr2t2sYK+9qQ
         2fm1FQj7TkHUZD954TRCYNMCZbCULZuhcZO8nngX7idTARXfC7xu5IUiT0LvycfEEnCM
         QWxPDe+ybgNfItK9n4bvNbs21AQmTPHheD+XUeIb3iPu2te/MLA9TMFQdouclo+PuZWC
         vPJHgSTAuN6lKu2/KNvh2vXnmGdZwxmZWb3apASCDhupi1qbxsRFgnKQ4UZrf7NWzJsg
         aasg==
X-Gm-Message-State: AOAM533KUBPwQKDWPyLcxUHJptpmeTgMcOukJYm5hJ5KDeCpeCDhJ6VQ
	R3F2azlZzoLKgznZfS8KFHA=
X-Google-Smtp-Source: ABdhPJyod0P/2Pvx9GQ49FG3I82tEsRKwzAgqHKMRp0zaqi4r/bqHLEe08hSjVbatpK3K2WP+R3dlw==
X-Received: by 2002:a63:6e87:: with SMTP id j129mr18795098pgc.45.1624799276354;
        Sun, 27 Jun 2021 06:07:56 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from ?IPv6:2601:202:4180:a5c0:9dc2:bdeb:54e8:4df9? ([2601:202:4180:a5c0:9dc2:bdeb:54e8:4df9])
        by smtp.gmail.com with ESMTPSA id g17sm11469084pgh.61.2021.06.27.06.07.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 27 Jun 2021 06:07:55 -0700 (PDT)
Subject: Re: [oe] [meta-oe][dunfell][PATCH] protobuf: Whitelist CVE-2015-5237
To: RAHUL taya <rahultaya96@gmail.com>,
 openembedded-devel@lists.openembedded.org, raj.khem@gmail.com
Cc: nisha.parrakat@kpit.com, purushottam.choudhary@kpit.com
References: <20210615071950.12684-1-Rahultaya96@gmail.com>
From: "Armin Kuster" <akuster808@gmail.com>
Message-ID: <88c8025b-640c-998b-8f94-ac5624c8bd74@gmail.com>
Date: Sun, 27 Jun 2021 06:07:54 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210615071950.12684-1-Rahultaya96@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US



On 6/15/21 12:19 AM, RAHUL taya wrote:
> As per below reference links this CVE issue seems to be minor and
> harmless and as per upstream this is not a real issue in practice.
>
> And as per red hat this issue is marked as low severity.
>
> 1. https://bugzilla.suse.com/show_bug.cgi?id=CVE-2015-5237
> 2. https://security-tracker.debian.org/tracker/CVE-2015-5237
> 3. https://ubuntu.com/security/CVE-2015-5237
> 4. https://github.com/protocolbuffers/protobuf/issues/760
I believe it is  bad form for a upstream project to not fix Security
issues based on their score. The decision should be left up to the
consumers of sed repo, layer or Project.

BTW, the NVD score is 8.8. IMHO, it should be fixed, not masked out.  If
you want to evaluate it yourself and decide to excluded this issue from
you project or product, you are able to do so in your own layer.

- armin


>
> As per NVD link: https://nvd.nist.gov/vuln/detail/CVE-2015-5237#range-6634983
> it affects version upto 3.1(including)
>
> Signed-off-by: Rahul Taya <Rahultaya96@gmail.com>
> ---
>  meta-oe/recipes-devtools/protobuf/protobuf_3.11.4.bb | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/meta-oe/recipes-devtools/protobuf/protobuf_3.11.4.bb b/meta-oe/recipes-devtools/protobuf/protobuf_3.11.4.bb
> index 4d6c5b255..f845a72a0 100644
> --- a/meta-oe/recipes-devtools/protobuf/protobuf_3.11.4.bb
> +++ b/meta-oe/recipes-devtools/protobuf/protobuf_3.11.4.bb
> @@ -88,3 +88,11 @@ LDFLAGS_append_arm = " -latomic"
>  LDFLAGS_append_mips = " -latomic"
>  LDFLAGS_append_powerpc = " -latomic"
>  LDFLAGS_append_mipsel = " -latomic"
> +
> +# As per below links this issue is minor and harmless and
> +# as per upstream this is not a real issue in practice.
> +# https://bugzilla.suse.com/show_bug.cgi?id=CVE-2015-5237
> +# https://security-tracker.debian.org/tracker/CVE-2015-5237
> +# https://ubuntu.com/security/CVE-2015-5237
> +# https://github.com/protocolbuffers/protobuf/issues/760
> +CVE_CHECK_WHITELIST += "CVE-2015-5237"
>
> 
>

