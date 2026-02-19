Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71764E9A03B
	for <webhook@archiver.kernel.org>; Thu, 19 Feb 2026 08:19:13 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9648.1771489147969947568
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 19 Feb 2026 00:19:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=FXcMRO+T;
 spf=pass (domain: smile.fr, ip: 209.85.128.52, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4836e3288cdso4486615e9.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 19 Feb 2026 00:19:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1771489146; x=1772093946; darn=lists.openembedded.org;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OiwGQtWVWQh2MHwIWnQpayjeK/NhnvfDSoIFzSO9ZPA=;
        b=FXcMRO+TaDm+kTmBZCJMgJOPlR23GJyd+ozMv8332hj0gibO7SYhTo5ZieyVvIB4CL
         hcpe/Jc4MP6FOvI4r9CFk2hCxaIJwK7NgFpLOmTxulTqSoK2WDxk4zrexThz7DfR4IJq
         0Jn/ktgo8A6n+7eBFWp4L8ZIuGPOUY7RdkBAM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771489146; x=1772093946;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OiwGQtWVWQh2MHwIWnQpayjeK/NhnvfDSoIFzSO9ZPA=;
        b=j6AT5vdxNDwr7Exttu9A6+BRLkCdXosJZqVmySpidUcNf1VyZboiCz5Vlz16nZa5qe
         Kb+fN8ud11oGxWk6WjNsPhZzq+x7UpirWeEU2IEo9hxK42YUa0VpyiQpPnO2cL3ogfzl
         r0LRM/TI2ICc4s4/2/UyzM9PlrWnbsT90dWrkkZZI5CZGO1SgJDmGl6px4fsQoLO4WQl
         jcnvKM3YQYKh0fewAEqIw32L8Fpvxhpe3ytFZOEKKxDk6UfOsmYWVp3/lPRUSHFIN6ZX
         hevmdz7oqKD7/J+IAaisgAMofSaQ0Y/O10TwcOYgGqu+TNQMhTQMxdNZUFosMWKSz4gX
         vNRg==
X-Gm-Message-State: AOJu0Yxrshl9QmNjg91xDg7+vbdUj6GusqR9z5uMPCHKeRrc11x/Go4s
	d7AF/WtDq/mRiIvGUVNtB/pRE9o3pW7A4a0qTgwiP1lAe0siZUY4WxxWxoLGKm+3T1o=
X-Gm-Gg: AZuq6aKXP9RaxQqDYhABS6wf6ukOxAnxqBuTPEXTcgqkM1xo61oDIGFqTG/sRg7BKHS
	o5BdV3zB38yMj9ae3R5BK7MlRhET7fRzBVsaO8CV9Uykl7iMSNrg+fnO61m4GndxbtACKM/M7x3
	cvGm5IFEvbf8ir5ZyD+7TYgs87du2IDtu2Wpd6VDucF0QsC4FcTA9ZSnFUICKT4lK3HGvFwstu3
	32iVsrgX86UR7sTSZi+MOHMhMdVodgs+cfWaZUl059/6MUiX5K+cb3Tq9Pe98T28MXioSyaqu2Y
	28clmNDBTsJcyQa4Gm5aeaBoSvZzNhC06nd6NqScLbpifU0CN1QwWJDldKjct3iX5dNyZ6L5LjC
	XLIH0vRjujGG+e+aswL35Ljvh6o7oPtM+uDzedH2WomoP6MBu4sPolWrgJQmCnuJujiltHnaKoy
	KY8XTRycufvl1kpXIE8EaJVj30+n0TzAR1xF7WMSGsZroVwZ+EPV1mZlCldAEWpvyBA4MRHpnw6
	uxtynWhZr+AgTQ=
X-Received: by 2002:a05:600c:6d55:b0:483:722c:a3d1 with SMTP id 5b1f17b1804b1-483a00b0a8dmr11988945e9.16.1771489146231;
        Thu, 19 Feb 2026 00:19:06 -0800 (PST)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4839f94fee1sm16225975e9.4.2026.02.19.00.19.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Feb 2026 00:19:05 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 19 Feb 2026 09:19:05 +0100
Message-Id: <DGISHQI5DDPV.2BHEPKY23Q3VH@smile.fr>
Subject: Re: [oe][meta-oe][whinlatter][PATCH 8/8] tomoyo-tools: update
 SRC_URI
From: "Yoann Congal" <yoann.congal@smile.fr>
Cc: <openembedded-devel@lists.openembedded.org>
To: <anuj.mittal@oss.qualcomm.com>, <ankur.tyagi85@gmail.com>
X-Mailer: aerc 0.20.0
References: <20260211120025.4190831-1-ankur.tyagi85@gmail.com>
 <20260211120025.4190831-8-ankur.tyagi85@gmail.com>
 <CA+s=J=zMxXHgnsua6gXT0T6X7ZQPioAH53uu6K=WnkmNtmnhBQ@mail.gmail.com>
In-Reply-To: <CA+s=J=zMxXHgnsua6gXT0T6X7ZQPioAH53uu6K=WnkmNtmnhBQ@mail.gmail.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 19 Feb 2026 08:19:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124500

On Thu Feb 19, 2026 at 4:04 AM CET, Anuj Mittal via lists.openembedded.org =
wrote:
> On Wed, Feb 11, 2026 at 8:01=E2=80=AFPM Ankur Tyagi via lists.openembedde=
d.org
> <ankur.tyagi85=3Dgmail.com@lists.openembedded.org> wrote:
>>
>> From: Ankur Tyagi <ankur.tyagi85@gmail.com>
>>
>> The previous one became inaccessible.
>>
>> Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
>> ---
>>  meta-oe/recipes-security/tomoyo-tools/tomoyo-tools_2.6.1.bb | 3 ++-
>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/meta-oe/recipes-security/tomoyo-tools/tomoyo-tools_2.6.1.bb=
 b/meta-oe/recipes-security/tomoyo-tools/tomoyo-tools_2.6.1.bb
>> index f172168335..a90a33ada4 100644
>> --- a/meta-oe/recipes-security/tomoyo-tools/tomoyo-tools_2.6.1.bb
>> +++ b/meta-oe/recipes-security/tomoyo-tools/tomoyo-tools_2.6.1.bb
>> @@ -5,9 +5,10 @@ being useful purely as a system analysis tool."
>>  HOMEPAGE =3D "http://tomoyo.sourceforge.jp/"
>>  SECTION =3D "System Environment/Kernel"
>>
>> -SRC_URI =3D "http://jaist.dl.sourceforge.jp/tomoyo/70710/${BP}-20210910=
.tar.gz"
>> +SRC_URI =3D "${SOURCEFORGE_MIRROR}/tomoyo/${BP}.tar.gz"
>
> How do we know it's -20210910?

Also, please put add a downloadfilename containing "${PV}". If not, it
will break the mirroring test at the next upgrade.

Thanks!

>
>>  SRC_URI[sha256sum] =3D "47a12cdb1fe7bbd0b2e3486150fe1e754fa9c869aeefd42=
fd311c4022b78010a"
>>
>> +PV .=3D "-20210910"
>>  S =3D "${UNPACKDIR}/${BPN}"
>>
>>  LICENSE =3D "GPL-2.0-only"
>>
>>=20
>>


--=20
Yoann Congal
Smile ECS


