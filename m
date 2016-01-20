Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f44.google.com (mail-wm0-f44.google.com [74.125.82.44])
	by mail.openembedded.org (Postfix) with ESMTP id 772A060767
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Jan 2016 09:27:39 +0000 (UTC)
Received: by mail-wm0-f44.google.com with SMTP id l65so170855840wmf.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Jan 2016 01:27:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=CvNsFi6329qvuqVlRk29EWxP9mZ747X/TWgOdwwR+0k=;
	b=Iru6GqfDOlCxuE5il75XHyVvmgCNzjk+m/5bDgCZyM+BMuUfiJSwcuSuvEn/K9lvR2
	aViTSwvtQBPlhHGsw5KlaDpncusqus7cBGN5t0KykUjZyF+M5Z1DF0vzPzbxJUYl5ISz
	KlgMHswfHsk7Q4gX60A9Mm1K2JcHm5IlSvUJ8u5kxaM3u9IHMifpAcWqk+Atix0T3Z0R
	ThPn7Q9rk4tbtZdSSsaLPHdHoEN0F6IvuwULSTCZkMHwkdbYs5ZLnssik45d/dUSi1vi
	5qmObzvW3hmgM8IqR5qFWstx2DI61sGai3/lGKDUMtyClaD8Vcm+YUbgt/w0sOtpZxAA
	2mPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=CvNsFi6329qvuqVlRk29EWxP9mZ747X/TWgOdwwR+0k=;
	b=A/XiMZHjpHSStlKpOc5yz7QaC8DonVO6n3ziydlpsXWspua/QcuKBUfMwqY1bBzO1W
	0khlWVMc5R6ofEdMvf8/A8MoaaCVg4hadzNUsMorUJJlrjzNSm35bvmaqUn4/fRSVQoJ
	4z15L6EaX9cbJqJcGP5D87a8+hQ/F/L5ulkhHEri0PcRZnWIX9w9fyYmD9tBCTtJE51E
	u5uZdVY7zT410SRWIcfFXGOR4qr4l4jPx1JQ3w6x/4ckOYTJB7JmoW+Iuqa1ydKtoYqY
	+WkIeEj0+g0LZoTIrQtr9dbfPO7WpgEfJNP/BJfZM/Z2yIsz5ua571czUWWQRTShrH5Q
	B68w==
X-Gm-Message-State: AG10YOTXDISDPrBE2QNYzwr+s+M0Gunj0Wt6lvWuhN+fcTPUsRiJwNHC0ji4yyJRPcTCl5Kz4ulg1DIXd97gtA==
MIME-Version: 1.0
X-Received: by 10.28.30.210 with SMTP id e201mr2985715wme.42.1453282059438;
	Wed, 20 Jan 2016 01:27:39 -0800 (PST)
Received: by 10.194.2.15 with HTTP; Wed, 20 Jan 2016 01:27:39 -0800 (PST)
In-Reply-To: <569F5292.5010506@windriver.com>
References: <1451304855-1444-1-git-send-email-Martin.Jansa@gmail.com>
	<569F5292.5010506@windriver.com>
Date: Wed, 20 Jan 2016 10:27:39 +0100
Message-ID: <CA+chaQf=NJrHgWNwizXYuZbry9DpGfSadWFRpvvpSFmcrPTZFA@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: Rongqing Li <rongqing.li@windriver.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH][jethro][meta-networking] tcpdump: add PACKAGECONFIG for libcap-ng
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
X-List-Received-Date: Wed, 20 Jan 2016 09:27:39 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Joe is maintainer of meta-networking, ask him.

On Wed, Jan 20, 2016 at 10:25 AM, Rongqing Li <rongqing.li@windriver.com>
wrote:

>
>
> On 2015=E5=B9=B412=E6=9C=8828=E6=97=A5 20:14, Martin Jansa wrote:
>
>> From: Roy Li <rongqing.li@windriver.com>
>>
>> Signed-off-by: Roy Li <rongqing.li@windriver.com>
>> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>>
>
>
> Hi Martin:
>
> Could you cherry-pick this patch to master?
> or merge it from master-next to master, it stay in master-next
> two month.
>
> thanks
>
> -Roy
>
> ---
>>   meta-networking/recipes-support/tcpdump/tcpdump_4.7.4.bb | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/meta-networking/recipes-support/tcpdump/tcpdump_4.7.4.bb
>> b/meta-networking/recipes-support/tcpdump/tcpdump_4.7.4.bb
>> index 0ffe589..150e55f 100644
>> --- a/meta-networking/recipes-support/tcpdump/tcpdump_4.7.4.bb
>> +++ b/meta-networking/recipes-support/tcpdump/tcpdump_4.7.4.bb
>> @@ -23,6 +23,7 @@ PACKAGECONFIG ??=3D "openssl ipv6"
>>   PACKAGECONFIG[openssl] =3D "--with-crypto=3Dyes, --without-openssl
>> --without-crypto, openssl"
>>   PACKAGECONFIG[ipv6] =3D "--enable-ipv6, --disable-ipv6,"
>>   PACKAGECONFIG[smi] =3D "--with-smi, --without-smi,libsmi"
>> +PACKAGECONFIG[libcap-ng] =3D "--with-cap-ng=3Dyes,--with-cap-ng=3Dno,li=
bcap-ng"
>>
>>   EXTRA_AUTORECONF +=3D " -I m4"
>>
>>
>>
> --
> Best Reagrds,
> Roy | RongQing Li
>

