Return-Path: <stefan@datenfreihafen.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54BD1C38A06
	for <webhook@archiver.kernel.org>; Thu,  7 Apr 2022 20:36:09 +0000 (UTC)
Received: from proxima.lasnet.de (proxima.lasnet.de [78.47.171.185])
 by mx.groups.io with SMTP id smtpd.web12.2972.1649359721852542658
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 07 Apr 2022 12:28:43 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@datenfreihafen.org
 header.s=2021 header.b=jFIEjO9U;
 spf=pass (domain: datenfreihafen.org, ip: 78.47.171.185,
 mailfrom: stefan@datenfreihafen.org)
Received: from [IPV6:2003:e9:d723:f1e7:895e:5a8b:8fb3:9d19]
 (p200300e9d723f1e7895e5a8b8fb39d19.dip0.t-ipconnect.de
 [IPv6:2003:e9:d723:f1e7:895e:5a8b:8fb3:9d19])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	(Authenticated sender: stefan@datenfreihafen.org)
	by proxima.lasnet.de (Postfix) with ESMTPSA id 3EB7FC0516;
	Thu,  7 Apr 2022 21:28:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=datenfreihafen.org;
	s=2021; t=1649359719;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pHfofES4fRaPs2oDRXP3VtJU0IFjPkJgKXzKVuFuLvw=;
	b=jFIEjO9U2zKMMExZHNRsbXLnruB4DD8hWa9bV8JExWe5welMhwbTLjXomVNMofjFaUVs3B
	kVNv+1Y5PWd3dqWy4spBqartz/L4jSGrGyJpCyr+cchHz3RvjavfNvSgrVwPFxOJ7ZCnua
	iBSRhvfH9TSZxDcLyHkjlMaR6BuctsfMQX0v7ITfpjG/njtSKAkQWi4mgsGi3Udu0DCpyK
	YF8/Sw3qwSEhreP6Iz+9H3bxs6TGBSleE1BxXnmyYREAbrCLpN7yXn7HSKFJeyi9BQcPYy
	VhgVke4GoV5l/EIwvG3ZCkfZVGNAjAEQHQFBv3yDd6CXOhT+35/m7O93t/X9ug==
Message-ID: <435051a8-ece0-2072-0504-0387ed282b93@datenfreihafen.org>
Date: Thu, 7 Apr 2022 21:28:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [oe] [meta-networking][PATCH 2/4] ot-daemon: add recipe for
 OpenThread daemon
Content-Language: en-US
To: Khem Raj <raj.khem@gmail.com>
Cc: Stefan Schmidt <stefan.schmidt@huawei.com>,
 openembeded-devel <openembedded-devel@lists.openembedded.org>
References: <20220404130354.2131131-1-stefan@datenfreihafen.org>
 <20220404130354.2131131-2-stefan@datenfreihafen.org>
 <CAMKF1soas80msGDvw7zB7S=8rXuz2ni4L2FwbffXw=BJ1xNygA@mail.gmail.com>
 <0dffc397-22be-a6b1-0fb2-8792c6c93dd8@datenfreihafen.org>
 <CAMKF1spYaFswwHyzmQ+FoqU1AWmgDWqiaywpm6THWOcT8-k52A@mail.gmail.com>
From: Stefan Schmidt <stefan@datenfreihafen.org>
In-Reply-To: 
 <CAMKF1spYaFswwHyzmQ+FoqU1AWmgDWqiaywpm6THWOcT8-k52A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 07 Apr 2022 20:36:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96459


Hello Khem.

On 05.04.22 20:08, Khem Raj wrote:
>=20
>=20
> On Tue, Apr 5, 2022 at 4:39 AM Stefan Schmidt <stefan@datenfreihafen.or=
g=20
> <mailto:stefan@datenfreihafen.org>> wrote:
>=20
>=20
>     Hello Khem.
>=20
>     On 05.04.22 05:16, Khem Raj wrote:
>      > fails on x86_64/glibc see
>      >
>     https://autobuilder.yoctoproject.org/typhoon/#/builders/88/builds/1=
610
>     <https://autobuilder.yoctoproject.org/typhoon/#/builders/88/builds/=
1610>
>=20
>     Ah, its not x86_64/glibc (I tested this) but the fact that the
>     autobuilder uses poky and I tested here without DISTRO in
>     openembedded core.
>=20
>     Seems the code base it not happy about the gcc changes to warn on t=
he
>     combination of _FORTIFY_SOURCE and non-optimized code:
>=20
>     error: #warning _FORTIFY_SOURCE requires compiling with optimizatio=
n
>     (-O) [-Werror=3Dcpp]
>=20
>=20
> Hmm so you are not using security flags ?

You mean Oniro is not using them? Not sure I can follow you train of=20
thoughts here. :-)

> That=E2=80=99s not good :) you should inherit good defaults

The problem above was from the autobuilder error you pointed me to,=20
building with Poky not Oniro.

-O2 -D_FORTIFY_SOURCE=3D2 itself works on the upstream code base, but it=20
needs optimization enabled (as the error message states). No idea why=20
that went wrong on the autobuilder.

regards
Stefan Schmidt

