Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.21788.1792671874422569471
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 22 Oct 2026 05:24:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=lAas4B6Y;
 spf=pass (domain: gmail.com, ip: 209.85.218.44, mailfrom: uvv.mail@gmail.com)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c40e30c26a4so126349266b.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 22 Oct 2026 05:24:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792671872; x=1793276672; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=v14vLcaeLeJt0bN4zv6UeZi0kCI+VmMeanWzbDpqRnc=;
        b=lAas4B6Ykb+bwuZJKo3qWUMdiym5IP8FwCnxB31CwfqyXzhBmWp9dh7RAK1DYq2slT
         8JAs5yZ9lsW3qiqhRrnfbhOw4U1lfpJvT2WsGS6LhgkfLFPs4FqCcqZAM01o1FiNcvHU
         1Yj8RDwGxtP+t9Zt1uATIQlO4iI3LCTrsX/7IPN+2F/+95L6KZVbdHgdHG3sbYs7VccV
         jxReXlnW2zOEezGQUVPzHUPEPJ+gZkrhDOzzEloZBsPUeMNvX9ZcKgSaAiezRbM533lv
         sYf13aCUkPUtMGKl7zuGF9XR+G4r3CQ5NIoIkvxAKzSWZ8v0ZdGcbwlos/TsY3HUz/gr
         Wgug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792671872; x=1793276672;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=v14vLcaeLeJt0bN4zv6UeZi0kCI+VmMeanWzbDpqRnc=;
        b=FeCx534OVwNxtsfsyJgpdcBaqnmBVyDmpxJVBJBgXElmVP7xiEbo8/49abeKi3GUcH
         2hg1fAENVMkx9Ah7S6E2CfIHAbX/Oey9ZX/73FVNLiWBGLUIMV5RS8GE+9pMMMcJ/OsP
         NEdfduAUMYLZlTapYklgDKuMsDO6rTBhB4+VJUhTAS+crMz94YHIJQKo3oL7HoD6lN2F
         IzXuQqKVXA+FT2GqS9NT1ApdIsQ91kQQpEkNHHLCe1hqHP6YWx8PvTikLlKj/FG6S+kT
         EPy6KH8KVpAt2uz6ZNCBRyEluesUuNBKRlke1I68YttzlLUrgSzCrs5ht1SkhRT51j51
         5x9w==
X-Forwarded-Encrypted: i=1; AKwUvBwNNV4RCdg3zdPZOJ6+rlX0N9gH/KeEmY0UHBTCIgZHjRTF2Hc44vYHrakldb6p53DQhJh7/sh02QJVe8+yGdFe4j8=@lists.openembedded.org
X-Gm-Message-State: AFq9FYJCanY1/o5ZSwjcUuL4hmaWQh5RzqSrXL/kXj8FvjdhwYKESh04
	n20dmWow4d0wKlG1AxpV83aPIUamTxiplZoJpsvahI6JdbNjy9Th8kwF
X-Gm-Gg: AYBFou0LXzievl/RBUbprXT7s35zJ1vB5OuT/lJsuxTXeaB4yAySqWe03R7s9pcKP2R
	BalTkZFZMp1jPvYaEU4pK6d0D798PlwqrVWYz9ixrxO6h3+bIkYbaeUd4cwYTp983dDgLiFtjb9
	WtUDY3a8DsoyLJseT5cRa3Qz9YwRLf2TZgA2jAfX5cXqMpZ/bulN1nCOn82Zc6cKOmPuAm2ANce
	SARzw8tX+3gJOlBG63sQ+xaR5YKPtrfuE3EADu3T8xrca/u7A5D1IbQ0JP0+gv+ASxqU7fJiA9Y
	0BCjavOScwBS0AM9d9IDbXQ8+IVrhvGh3s3/hzXah9B6/icxKMeF2Nm+fQnHfEsyqp+N76Gvknm
	AXtrj0wMt28akeOxNqW2rNgJY9XJtenqlH0rRD5nUqBr9uocc5vAXvq7QIj8tNRk5H9xnPpfExu
	0cImoUYA8CaQ6CZ6tkBK4Su4vpS0sLu0JvtXgfaCSP2/XX6pOTeTPyV5FtAhIkb0smckvIRJ6oe
	FESkaL5xJzkvDSkBd4hL5F15DKn+pPsnFdqaqynFxdxgOTI/nx2CM6JenePWp154dcgZAc=
X-Received: by 2002:a17:906:9c8a:b0:c2d:d4dd:8b5 with SMTP id a640c23a62f3a-c468d807ac5mr266373166b.19.1792671872269;
        Thu, 22 Oct 2026 05:24:32 -0700 (PDT)
Return-Path: <uvv.mail@gmail.com>
Received: from [10.54.10.247] ([154.47.27.146])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c468a55cc99sm96935366b.37.2026.10.22.05.24.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 05:24:27 -0700 (PDT)
Message-ID: <5a50bdd9-6d29-4066-82f0-c13811810760@gmail.com>
Date: Thu, 22 Oct 2026 14:24:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-filesystems][PATCH] overlayfs-tools: Inhibit tests on
 configure
To: Marek Vasut <marek.vasut@mailbox.org>,
 openembedded-devel@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>,
 Ankur Tyagi <ankur.tyagi85@gmail.com>, Khem Raj <khem.raj@oss.qualcomm.com>
References: <20261021135357.14928-1-marek.vasut@mailbox.org>
 <6f762fe7-ddf1-49bf-96bb-8e1d75f575c8@gmail.com>
 <d1168121-cced-4238-8dee-9c1b1169e484@mailbox.org>
Content-Language: en-US
From: Vyacheslav Yurkov <uvv.mail@gmail.com>
In-Reply-To: <d1168121-cced-4238-8dee-9c1b1169e484@mailbox.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 22 Oct 2026 12:24:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131313

On 21.10.2026 18:27, Marek Vasut wrote:
> On 10/21/26 5:09 PM, Vyacheslav Yurkov wrote:
>> Thanks for the patch Marek.
>>
>> Could you please explain how you hit the issue? I can't reproduce it.
>> The sudo is required only for tests, which is a custom meson target. 
>> It's not supposed to be called during configure.
> $ bitbake -c configure overlayfs-tools
>
> on aarch64 (STM32MP25) target (not using the ST layers).
>
> I would also expect the tests to NOT run during configure.
>
> It also happens in OE wrynose builds, but not in OE scarthgap builds.

I was not able to reproduce it either on wrynose or on master. Although 
I usually build x86_64 / arm32, but I don't think that makes a difference.

Any chance your BSP adds a "meson test" call at any point?
