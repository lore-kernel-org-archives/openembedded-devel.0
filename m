Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.web08.5536.1617669578212444743
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 05 Apr 2021 17:39:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=SLtPrhTC;
 spf=pass (domain: gmail.com, ip: 209.85.216.44, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f44.google.com with SMTP id kk2-20020a17090b4a02b02900c777aa746fso6724661pjb.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 05 Apr 2021 17:39:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:autocrypt:cc:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=FVcnPr8Nb6UVhi+67kxGGjGRTr4J8ikWRvgofGyJ82I=;
        b=SLtPrhTCmjOXoFZdOVM4u5Ajr4ng8LfiRlpP2i+c9aWujVXAWCJYndZy04+MyT5mkJ
         rJ7r5AOMX7LH9io1Hf3hfSOap3rEajRZAUb8BTvpGSfxhQ33FkmQuneHM8jNI4bKbq29
         FlihmIc6Y3iK9ettT9XU0mr5vsypS7TiYZWp1BcUCsVZto8Y7xmhs1cpoQEAakBoRwkE
         dYqcB2Qt8WNrWygEekWqvAI6AmO7IjqG78U01ir62GTcePHn7j/zMZTl79BgiyXJ6U1T
         anNfI3KclOsQJuhQrWbFBK9sF/juTSKtf5Ot8LauLN/DKKUMWUszDqXliFZ8Rmj7Pn92
         71aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:autocrypt:cc
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-transfer-encoding:content-language;
        bh=FVcnPr8Nb6UVhi+67kxGGjGRTr4J8ikWRvgofGyJ82I=;
        b=K5YiclkPsbjopvMeCNAJFHgMfEyDr8zJxk6KahAFn8Lftp3IfwtmpxXDvhb+D+8X3v
         G/Dx5xHJspun5rKG6016Tjda+4Q4DFKO9kjcKoSKcFvBmHbtxqxJQENdhxu+5/twEl9m
         WnOfaBoKBVDSrqp7/FyHOrBnuOhby4CSbErkZhASXoZvfwsv9gTLG9i8oeSsAmTrsReP
         k15AtAf+SHyyoNpc5tdvJxRqEnW54Zx3JkUkDGg/O7POGHdOUHdqKRvXTX7yddPIG4HG
         tGdu4jQzWyCR3F3T2jJJtclijx+mKRZUskFZepeHL73PNL2nmxIJpJkK/Ja5qSxVuXsg
         0//g==
X-Gm-Message-State: AOAM5312mW8AaABkiGqWfwQIUQLxLPR81hJo1sQE7zHjmQt1tXg4zfiv
	M2jPqDK7mmr3OYRTH7rpm9+DIRClDTA=
X-Google-Smtp-Source: ABdhPJxb8VTXmHmU2WroL9gMLbYOz9zZv1tGyqKPVuH1bmR4O98VNULuLRHn52QJydaervoKNYG5Dg==
X-Received: by 2002:a17:902:6546:b029:e9:1e31:3351 with SMTP id d6-20020a1709026546b02900e91e313351mr5302971pln.26.1617669577271;
        Mon, 05 Apr 2021 17:39:37 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from ?IPv6:2601:202:4180:a5c0:cb2:3225:c999:3d47? ([2601:202:4180:a5c0:cb2:3225:c999:3d47])
        by smtp.gmail.com with ESMTPSA id c26sm17053098pfo.97.2021.04.05.17.39.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Apr 2021 17:39:36 -0700 (PDT)
Subject: Re: [oe] [meta-oe][dunfell][PATCH] wireguard: fix build issue with updated 5.4 kernel
To: Khem Raj <raj.khem@gmail.com>
References: <20210404032455.22904-1-akuster808@gmail.com>
 <7c939a73-4d16-66c3-bcda-e2789c8d4173@gmail.com>
From: "akuster" <akuster808@gmail.com>
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
 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
 8CS2NxU=
Cc: openembedded-devel@lists.openembedded.org
Message-ID: <a3b5c4ca-bfa4-10bb-0ea5-53e9672a5126@gmail.com>
Date: Mon, 5 Apr 2021 17:39:36 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <7c939a73-4d16-66c3-bcda-e2789c8d4173@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US



On 4/4/21 8:43 PM, Khem Raj wrote:
> are we already past this patch in master ?
Nope. Its the last commit in the repo.=C2=A0 We need to update to
v1.0.20210219
<https://git.zx2c4.com/wireguard-linux-compat/tag/?h=3Dv1.0.20210219> then
one commit beyond.

hardknott and Gatesgarth will need this to but are excluded from world
builds so it didn't register as an issue. I will send patches/update

I was wondering if this would work

RDEPENDS_${PN} =3D "KERNEL_VERSION (< 5.6 )"

-armin
>
> On 4/3/21 8:24 PM, akuster wrote:
>> =C2=A0 error: static declaration of 'icmp_ndo_send' follows non-static
>> declaration
>> =C2=A0 |=C2=A0=C2=A0 959 | static inline void icmp_ndo_send(struct sk_b=
uff *skb_in,
>> int type, int code, __be32 info)
>> =C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 ^~~~~~~~~~~~~
>>
>> Signed-off-by: Armin Kuster <akuster808@gmail.com>
>> ---
>> =C2=A0 ...send-functions-were-backported-exten.patch | 32 +++++++++++++=
++++++
>> =C2=A0 .../wireguard-module_1.0.20200401.bb=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 3 +-
>> =C2=A0 2 files changed, 34 insertions(+), 1 deletion(-)
>> =C2=A0 create mode 100644
>> meta-networking/recipes-kernel/wireguard/files/0001-compat-icmp_ndo_sen=
d-functions-were-backported-exten.patch
>>
>> diff --git
>> a/meta-networking/recipes-kernel/wireguard/files/0001-compat-icmp_ndo_s=
end-functions-were-backported-exten.patch
>> b/meta-networking/recipes-kernel/wireguard/files/0001-compat-icmp_ndo_s=
end-functions-were-backported-exten.patch
>>
>> new file mode 100644
>> index 00000000000..f01cfe4e1c5
>> --- /dev/null
>> +++
>> b/meta-networking/recipes-kernel/wireguard/files/0001-compat-icmp_ndo_s=
end-functions-were-backported-exten.patch
>> @@ -0,0 +1,32 @@
>> +From 122f06bfd8fc7b06a0899fa9adc4ce8e06900d98 Mon Sep 17 00:00:00 2001
>> +From: "Jason A. Donenfeld" <Jason@zx2c4.com>
>> +Date: Sun, 7 Mar 2021 08:14:33 -0700
>> +Subject: [PATCH] compat: icmp_ndo_send functions were backported
>> extensively
>> +
>> +Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
>> +
>> +Upstream-Status: Backport
>> +
>> +Fixes build with 5.4.103 update.
>> +/include/linux/icmpv6.h:56:6: note: previous declaration of
>> 'icmpv6_ndo_send' was here
>> +|=C2=A0=C2=A0=C2=A0 56 | void icmpv6_ndo_send(struct sk_buff *skb_in, =
u8 type, u8
>> code, __u32 info);
>> +
>> +Signed-of-by: Armin Kuster <akuster808@gmail.com>
>> +
>> +---
>> + src/compat/compat.h | 2 +-
>> + 1 file changed, 1 insertion(+), 1 deletion(-)
>> +
>> +Index: src/compat/compat.h
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> +--- src.orig/compat/compat.h
>> ++++ src/compat/compat.h
>> +@@ -946,7 +946,7 @@ static inline int skb_ensure_writable(st
>> + }
>> + #endif
>> +
>> +-#if LINUX_VERSION_CODE < KERNEL_VERSION(5, 6, 0)
>> ++#if (LINUX_VERSION_CODE < KERNEL_VERSION(5, 6, 0) &&
>> LINUX_VERSION_CODE >=3D KERNEL_VERSION(5, 5, 0)) || (LINUX_VERSION_CODE
>> < KERNEL_VERSION(5, 4, 102) && LINUX_VERSION_CODE >=3D
>> KERNEL_VERSION(4, 20, 0)) || (LINUX_VERSION_CODE < KERNEL_VERSION(4,
>> 19, 178) && LINUX_VERSION_CODE >=3D KERNEL_VERSION(4, 15, 0)) ||
>> (LINUX_VERSION_CODE < KERNEL_VERSION(4, 14, 223) &&
>> LINUX_VERSION_CODE > KERNEL_VERSION(4, 10, 0)) || LINUX_VERSION_CODE
>> < KERNEL_VERSION(4, 9, 259) || defined(ISRHEL8) || defined(ISUBUNTU1804=
)
>> + #if IS_ENABLED(CONFIG_NF_NAT)
>> + #include <linux/ip.h>
>> + #include <linux/icmpv6.h>
>> diff --git
>> a/meta-networking/recipes-kernel/wireguard/wireguard-module_1.0.2020040=
1.bb
>> b/meta-networking/recipes-kernel/wireguard/wireguard-module_1.0.2020040=
1.bb
>>
>> index e8891c4428a..6ed988bafa2 100644
>> ---
>> a/meta-networking/recipes-kernel/wireguard/wireguard-module_1.0.2020040=
1.bb
>> +++
>> b/meta-networking/recipes-kernel/wireguard/wireguard-module_1.0.2020040=
1.bb
>> @@ -3,7 +3,8 @@ require wireguard.inc
>> =C2=A0 SRCREV =3D "43f57dac7b8305024f83addc533c9eede6509129"
>> =C2=A0 =C2=A0 SRC_URI =3D "git://git.zx2c4.com/wireguard-linux-compat \
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
>> file://0001-compat-SYM_FUNC_-START-END-were-backported-to-5.4.patch"
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
>> file://0001-compat-SYM_FUNC_-START-END-were-backported-to-5.4.patch \
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
>> file://0001-compat-icmp_ndo_send-functions-were-backported-exten.patch =
"
>> =C2=A0 =C2=A0 inherit module kernel-module-split
>> =C2=A0
>>
>>
>>
>>
>
>=20
>


