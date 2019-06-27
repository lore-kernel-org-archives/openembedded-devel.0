Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com
	[209.85.222.194])
	by mail.openembedded.org (Postfix) with ESMTP id 039CD7E98C
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Jun 2019 15:12:40 +0000 (UTC)
Received: by mail-qk1-f194.google.com with SMTP id g18so2026213qkl.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Jun 2019 08:12:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=Akjz4oGXFYcKeRq/7RQ2ItFAdVi19e+jAyHYTglKHkA=;
	b=X8qs9+N2buaGM4lnNKwoVTANAOLAoK2QQhgDqeHBhI5/8f2FE8bEWyiJ2FnhGq30SF
	Wfa9YWpI4WIPIEZlPB16Ff5nGUjeSTH7h8AZKKCP+aNdvaWkDN0TFeShbkTrNta1KSVA
	rzD3kbSRBVD+5yxxa25M7wXuSgY9wjeHSVnJNraG6yu7WmCoGCACVx6SmgeK5eq2KkPr
	ZhJzcjWAOQWQxrLgFF/mgtaqjs5FIGQ0YJdbC7KYqTyJvqEtMm6wlZsmuJ9rGHQJ+zNi
	MsPEcdQYL4na3UcEkPqZOuOhVLbFpLrdE0BydtwWOYZXf7ClPSUDQIPJyYWQmc63ojKv
	e1fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Akjz4oGXFYcKeRq/7RQ2ItFAdVi19e+jAyHYTglKHkA=;
	b=dIrFE+DDgLOleUyumUxgyOBKLz4znV9lAwP+0F3bV3yhgT3A8Ak9BXfrB/YabfKYYn
	Um/99pKiuZ2LYXWcNZ8yXJO7ixZXdwIyAwEb9VjXWa9kJMhrTJ8nU5D70gHDounciHDQ
	hufdxM4vi9WlNakvnWbbAuZkuLz1XfnXKeB+gleU8+U7195QkgSaEuviTM1FNvGEqfFy
	OLuJykVHnhxyKaq/RO70AvHghZTKlQLL6ltOSPUW6DU16mfXEPtYVDwFom3oeBBNKOlO
	Al9boroG0wb5owg+urhRsbm/IRQXKmJf4bBZdLR8xyLhwHwwVIxsFoqAOOhjPurRPysm
	L6Sg==
X-Gm-Message-State: APjAAAX9D4dyplLFKjgEAjDFB4Yqdxr1qnfLF97tL8xwU/csndSPVXVR
	45VI65YCUiiPSDhW/nmGYxsgHHz7iolLHldpxzk=
X-Google-Smtp-Source: APXvYqwxwqw3Ii3vlIdxsO7yMj78t16vrI6ehzx2mSp9f1KH2a1PaNbp6/V02MhMMTg5RYHESTpdLEfncHTH5iKYMVY=
X-Received: by 2002:ae9:f101:: with SMTP id k1mr3883530qkg.337.1561648361570; 
	Thu, 27 Jun 2019 08:12:41 -0700 (PDT)
MIME-Version: 1.0
References: <1561479240-36337-1-git-send-email-hongxu.jia@windriver.com>
	<CAMKF1sqp5DgFKxh3N+GyP8xmv8KFZs4vLfs2TBNd-T5NiNfwMw@mail.gmail.com>
	<6fe55a0a-54a5-23cd-c3d2-2784ab214cb7@windriver.com>
In-Reply-To: <6fe55a0a-54a5-23cd-c3d2-2784ab214cb7@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 27 Jun 2019 11:12:29 -0400
Message-ID: <CAMKF1srT_KigW-pxDXDoigV8HeEJq3+HNdg0cH4t_W0vE5bv+A@mail.gmail.com>
To: Hongxu Jia <hongxu.jia@windriver.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-multimedia][PATCH 1/4] meta-multimedia: add layer depends on meta-oe
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
X-List-Received-Date: Thu, 27 Jun 2019 15:12:41 -0000
Content-Type: text/plain; charset="UTF-8"

I think it would be useful to avoid a layer dependency for just one recipe
but if there are
 More dependencies then we can add this here and be done with it

On Wed, Jun 26, 2019 at 9:31 PM Hongxu Jia <hongxu.jia@windriver.com> wrote:

> On 6/26/19 2:58 AM, Khem Raj wrote:
>
> Do we have a way to not use gitpkg dependency
>
> I am not sure, our Wind River Linux does not support recipe tvheadend,
>
> the issue is reported by `yocto-check-layer-wrapper meta-multimedia'
>
> and I try to resolve it without taking too much time
>
>
> //Hongxu
>
> On Tue, Jun 25, 2019 at 9:14 AM Hongxu Jia <hongxu.jia@windriver.com>
> wrote:
>
>> Since tvheadend of meta-multimedia inherit gitpkgv bbclass
>> which comes from meta-oe, add missing layer depends back
>>
>> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
>> ---
>>  meta-multimedia/conf/layer.conf | 5 ++++-
>>  1 file changed, 4 insertions(+), 1 deletion(-)
>>
>> diff --git a/meta-multimedia/conf/layer.conf
>> b/meta-multimedia/conf/layer.conf
>> index e05a652..89ed163 100644
>> --- a/meta-multimedia/conf/layer.conf
>> +++ b/meta-multimedia/conf/layer.conf
>> @@ -29,6 +29,9 @@ BBFILE_PRIORITY_multimedia-layer = "6"
>>  # cause compatibility issues with other layers
>>  LAYERVERSION_multimedia-layer = "1"
>>
>> -LAYERDEPENDS_multimedia-layer = "core"
>> +LAYERDEPENDS_multimedia-layer = " \
>> +    core \
>> +    openembedded-layer \
>> +"
>>
>>  LAYERSERIES_COMPAT_multimedia-layer = "thud warrior"
>> --
>> 2.7.4
>>
>>
>

