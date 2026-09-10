Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5351C79F9F
	for <webhook@archiver.kernel.org>; Thu, 10 Sep 2026 18:34:21 +0000 (UTC)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.22017.1789065255198620088
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 10 Sep 2026 11:34:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=gtpEk0PX;
 spf=pass (domain: gmail.com, ip: 209.85.128.176, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-8706dfdcd4fso12487b3.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 10 Sep 2026 11:34:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789065254; cv=none;
        d=google.com; s=arc-20260327;
        b=Z+Qk1/WbYjz9lqR/SqBK6hKOHduBpgzZV846eTCQcgc3FvczHovxtrJvh+axsCJSd6
         w46zOS36NJxmchM+2wmv9Ag2BI3q43KQumZesHSX7EnaIWF7VxcxRk1ol+EDqfCPNbR4
         g8Vb3ZG5Gk18mEylxMcSXnVsmgzrGzfC7LHSYxILoXwAxtHMP0lYq8+ISo15ArItx/3c
         P4sSlYg8ADNVtejnn0sezyY08T7wKvzB1vyPy9VoulXzQk6ikN3ggaN/ocZHMqYbHokK
         5V+u19M/k8nNCzgd59Akxr+05e9kvcAmFKK8iDP7PvfqWh/3NY51dWCuUk1SsUd96pKO
         jAPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Xb7G64jhBSukPIl1K2XjGlLoK/+lvbQ1ileC9n4Y9h0=;
        fh=u+uIxyf/EGOKf3PZyuMsIiBzvsyN13VjiTrYSSFpJAU=;
        b=BAyo2zt2xBUz2TCC0Btj5q3GFQN0jFvWu9yG2enAELNBqo9T3EAyIx01TkkAvisPlZ
         EMR7rp6FjqMRKe1yX9PQfU2ZNJ5yoxsVgFJn9rglj4P4t8O9elO4P/PQUHRSFMOw6lzi
         DBI7XK8CHA0CtuhEm1C92CTsO5SmZoMH1kvC6Xp/sYCwGNgH96BXbQ+CPtGeZVTiCk4z
         Wpnt+ygNUlOucKELI+z96PPrzBhO65+jVGFjhqyc8uEDAv1HnLXD4pNB4KQduvyGe6gQ
         x1xZIWym2V9BCaygRYLcFHgsXGGjpujZUZAoz8jSAXNEb7lyn1FZOY8iMhA7LUax3tma
         L6Yg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789065254; x=1789670054; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Xb7G64jhBSukPIl1K2XjGlLoK/+lvbQ1ileC9n4Y9h0=;
        b=gtpEk0PXz6SW24/4RiQfnwTrS2RCwBEnVaWe2h7GWOVxo4FIK8p7Fo0/DlHStgDBPk
         7Pzmw465NBCgwP3TzU3Bfb8Pz5Sup7HnAP9OjOJsORotyJAfbugOoIAYYXhj7nGum7VV
         SET+rbADD8GEHHSjfMhCoAb+EfIUQ3FYxXMf6fS/pwOLxdQJKCODDylj/n88gkHs3GKs
         dfbTNfX4QxNZ/gzeraehHG6F8CxbzCT9K1kn3s9NaTChI4NwQ4okH/Y//tzmlC41xCVi
         vXxYSXUssBB/LD4g8EFs4ZmmlHrauCdemBB+M+DsKrJpbUquikQV3lhEO3OVCuJuyMGt
         2M7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789065254; x=1789670054;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Xb7G64jhBSukPIl1K2XjGlLoK/+lvbQ1ileC9n4Y9h0=;
        b=fQJROLjCOigMuMKzdyz26vRG+CM9IQf++KD6/YtwmUM/WOc11HzGlGQqScRi9rb6oA
         zXQSmnwUHZ8dfiha5VS7BgnI+VceDhRf8WngJ9zdVmNpjRfByt9ojwoob3yQr8eqtTEr
         zcEy3J0mCS0nrQ5UPEfuwUGd2vKBcKE9Ws+93ti8qAr0kG7asMfeNfdKQIv8pWwKzv1n
         8uJprk0lR0ygtzNYwVik7IxZi+YAPrX/ZypTv2L4JoY4MGwrQA7vxSkU79goMBWJGPUZ
         lt6qlwErfU632V57zDDjl2amG+4D8Dqni3sUEONmUCfPtnDhpZbOz42MrAX5XVxrZyrb
         pB5A==
X-Gm-Message-State: AFuF++n3Jw8o9ZZMKdeL+qtDu+tU2Tx12XpTi+AsZtmCHhidfntB1NK5
	kf7N75pqrCJY4tvmEQjrhNyzCl47Jo2TZBl5gqZiGrmvc4N76c8kb7q1Lq4jzQdurnDBa45aVrw
	BGO/kEA9K39x58CTXcKKu1CK5Nk4jXe0=
X-Gm-Gg: AYBFou3EdWFU1AP7KWkZmDbQPJNY7Fc+xTss7yeCj9TyQSWKvzCS0tSZ0Dgv23WWyih
	mwN5ev2hJbvCjvB74JArYd+JccHjIiXZ4X2M5nEM04dCqwBrOSXadVnV4gdjCTFXlEmlrwZDNiX
	sHuKishc5T9lC8eZiw4jkhsq/N2YF+BFAwkhUtApX2gnmQLNw0SzshNz4gqy6lV/WutcXasRxer
	9zMnwZHuhjjx5JQirnEJ0w+pYlQssnNyli6K+IQwM/GJAfCx7nIn/A3/rMAeb/PJ8hDjT6WmrL2
	MruWv8vldSAy+bO9Eh143laRSLIDN7VO69W/EkmVle8IFit7JzksxnP0mKLcZlPDc5zZDiNFdfP
	cj4Gl5h8z/a3r0249lkfqSAViDEdKMHJba1s8xHASDkAvsR2dsAwbVNFMr+GhNppO3IddEX0Su0
	KUTHP2ML7P2YrNCB5TRNT8CHcjeN/SlUwz1vJKhbvmefyiDzyDvtideLVIYAPMp8Tf8Lz44EkNt
	98GXJ8V1M9+n8+Mxw2pLSYf
X-Received: by 2002:a05:690c:dc9:b0:873:17c9:afca with SMTP id
 00721157ae682-884af455988mr4438957b3.29.1789065254067; Thu, 10 Sep 2026
 11:34:14 -0700 (PDT)
MIME-Version: 1.0
References: <20260910060106.2214089-1-khem.raj@oss.qualcomm.com> <6D1B8712-5FB2-4145-A053-074DDA3287D8@arm.com>
In-Reply-To: <6D1B8712-5FB2-4145-A053-074DDA3287D8@arm.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 10 Sep 2026 11:33:47 -0700
X-Gm-Features: AcwNN1VIDpibd6fqHsCFbe9DTff1GUuYfh6qi9nIs5M-oVLSjTi9xSFZIScxhfw
Message-ID: <CAMKF1spxTVjzC1rF+aTOX2aEgKtBpKrumkn8wPTnQViD5vujoA@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] spdm-emu: Switch default crypto backend to
 mbedtls and update to latest tip
To: Ross Burton <Ross.Burton@arm.com>
Cc: "openembedded-devel@lists.openembedded.org" <openembedded-devel@lists.openembedded.org>, 
	Khem Raj <khem.raj@oss.qualcomm.com>
Content-Type: multipart/alternative; boundary="000000000000f2e2ae065b253672"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 10 Sep 2026 18:34:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129918

--000000000000f2e2ae065b253672
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 10, 2026 at 10:03=E2=80=AFAM Ross Burton <Ross.Burton@arm.com> =
wrote:

> On 10 Sep 2026, at 07:01, Khem Raj via lists.openembedded.org <raj.khem=
=3D
> gmail.com@lists.openembedded.org> wrote:
> > make the crypto backend a PACKAGECONFIG choice and default to mbedtls,
> > which builds fine. openssl stays selectable for anyone still on openssl
> > 3.x, and the two options are marked as mutually exclusive.
>
> Has a ticket been filed upstream?  It=E2=80=99s important to note that mb=
edtls
> doesn=E2=80=99t have long-term support unlike OpenSSL, which is why it=E2=
=80=99s actively
> being removed entirely from Fedora and I plan to do the same for OE in th=
e
> next release cycle.
>
>
There is already an issue where I chimed in -
https://github.com/DMTF/libspdm/issues/3752
spdm-emu uses its own copy of mbedtls and links statically with it. So
removing mbedtls recipe wont affect it
I would still like to get this building until openSSL build it fixed when
we can toggle the backend by choosing openssl packageconfig.


> Cheers,
> Ross

--000000000000f2e2ae065b253672
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Sep 10,=
 2026 at 10:03=E2=80=AFAM Ross Burton &lt;<a href=3D"mailto:Ross.Burton@arm=
.com">Ross.Burton@arm.com</a>&gt; wrote:<br></div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex">On 10 Sep 2026, at 07:01, Khem Raj via <a href=3D"=
http://lists.openembedded.org" rel=3D"noreferrer" target=3D"_blank">lists.o=
penembedded.org</a> &lt;raj.khem=3D<a href=3D"mailto:gmail.com@lists.openem=
bedded.org" target=3D"_blank">gmail.com@lists.openembedded.org</a>&gt; wrot=
e:<br>
&gt; make the crypto backend a PACKAGECONFIG choice and default to mbedtls,=
<br>
&gt; which builds fine. openssl stays selectable for anyone still on openss=
l<br>
&gt; 3.x, and the two options are marked as mutually exclusive.<br>
<br>
Has a ticket been filed upstream?=C2=A0 It=E2=80=99s important to note that=
 mbedtls doesn=E2=80=99t have long-term support unlike OpenSSL, which is wh=
y it=E2=80=99s actively being removed entirely from Fedora and I plan to do=
 the same for OE in the next release cycle.<br>
<br></blockquote><div><br></div><div>There is already an issue where I chim=
ed in -=C2=A0<a href=3D"https://github.com/DMTF/libspdm/issues/3752">https:=
//github.com/DMTF/libspdm/issues/3752</a></div><div>spdm-emu uses its own c=
opy of mbedtls and links statically with it. So removing mbedtls recipe won=
t affect it</div><div>I would still like to get this building until openSSL=
 build it fixed when we can toggle the backend by choosing openssl packagec=
onfig.</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex">
Cheers,<br>
Ross</blockquote></div></div>

--000000000000f2e2ae065b253672--

