Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 732A1F42105
	for <webhook@archiver.kernel.org>; Wed, 15 Apr 2026 18:03:19 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.21872.1776266717115892629
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 15 Apr 2026 08:25:18 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=NzgwZR3i;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: joaomarcos.costa@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 1C1DC1A32C2;
	Wed, 15 Apr 2026 15:25:15 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E224360420;
	Wed, 15 Apr 2026 15:25:14 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id CE8031045A03B;
	Wed, 15 Apr 2026 17:25:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1776266714; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=knfVYWplZqoVC5lu+FLntHVZ/5UeTF56yqFkiO64jx4=;
	b=NzgwZR3i4+6fOfHd0eWQ7h1gKYu5QFnI68cZXi+COekqCt85+CEKqDcJ3YZQOtVlzU/0G5
	CSdsrhmRRmfVIn4Hph1kwiPldKltDqJFtdS7Eadtq25qmChrVVBjPKNdOJe8TmaaJEgMuf
	tnetcrx3A102qGmMJPPOqJ+7QYZLn+oYy4F6ZESUPqq2yOe0ALZiW23MJy+z1vbQvmZn1V
	coOh7aJ752hh16D2wbn0hyOhoe7+0k6+ObOSB/hi8a09/Y7V1Ub0XkbxusZqcoZs6eQZHA
	JG7akQJZvEn2lUKQHvD4G0kfvXWMwmIejSVKf61+asIwmU7HIiRYzE2S+Lx2zw==
Message-ID: <f827c128-0f6a-45d4-8497-6deb4c9cd943@bootlin.com>
Date: Wed, 15 Apr 2026 17:25:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-oe][PATCH] libhugetlbfs: add RISC-V to COMPATIBLE_HOSTS
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org, thomas.petazzoni@bootlin.com,
 thomas.perrot@bootlin.com, nylon.chen@sifive.com
References: <20260415090507.819848-1-joaomarcos.costa@bootlin.com>
 <CAMKF1spT35ddfWAyZAEmA_kQuRSE7boNSeGdM8nV5c1HLpuzkw@mail.gmail.com>
From: "Joao Marcos Costa" <joaomarcos.costa@bootlin.com>
Organization: Bootlin
In-Reply-To: <CAMKF1spT35ddfWAyZAEmA_kQuRSE7boNSeGdM8nV5c1HLpuzkw@mail.gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
Content-Language: en-US, fr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 15 Apr 2026 18:03:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126366

Hello, Khem

On 4/15/26 17:01, Khem Raj wrote:
>=20
>=20
> On Wed, Apr 15, 2026 at 2:05=E2=80=AFAM Jo=C3=A3o Marcos Costa=20
> <joaomarcos.costa@bootlin.com <mailto:joaomarcos.costa@bootlin.com>> wr=
ote:
>=20
>     A preliminar effort to support RISC-V was added in v2.23:
>=20
>     a529598 Introduce basic riscv64 support [1]
>=20
>     Following the guidelines in libhugetlbfs's HOWTO, here are the outp=
uts
>     of some commands in qemuriscv64:
>=20
>     root@qemuriscv64:~# grep -i huge /proc/filesystems
>     nodev=C2=A0 =C2=A0hugetlbfs
>     root@qemuriscv64:~# hugeadm --pool-list
>      =C2=A0 =C2=A0 =C2=A0 Size=C2=A0 Minimum=C2=A0 Current=C2=A0 Maximu=
m=C2=A0 Default
>      =C2=A0 =C2=A0 =C2=A065536=C2=A0 =C2=A0 =C2=A0 =C2=A0 0=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 0=C2=A0 =C2=A0 =C2=A0 =C2=A0 0
>      =C2=A0 =C2=A02097152=C2=A0 =C2=A0 =C2=A0 =C2=A0 0=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 0=C2=A0 =C2=A0 =C2=A0 =C2=A0 0=C2=A0 =C2=A0 =C2=A0 =C2=A0 *
>     root@qemuriscv64:~# hugeadm --pool-pages-min 2MB:10 --add-temp-swap
>     root@qemuriscv64:~# hugeadm --pool-list
>      =C2=A0 =C2=A0 =C2=A0 Size=C2=A0 Minimum=C2=A0 Current=C2=A0 Maximu=
m=C2=A0 Default
>      =C2=A0 =C2=A0 =C2=A065536=C2=A0 =C2=A0 =C2=A0 =C2=A0 0=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 0=C2=A0 =C2=A0 =C2=A0 =C2=A0 0
>      =C2=A0 =C2=A02097152=C2=A0 =C2=A0 =C2=A0 =C2=A010=C2=A0 =C2=A0 =C2=
=A0 =C2=A010=C2=A0 =C2=A0 =C2=A0 =C2=A010=C2=A0 =C2=A0 =C2=A0 =C2=A0 *
>     root@qemuriscv64:~# hugeadm --pool-pages-min 2MB:-5
>     root@qemuriscv64:~# hugeadm --pool-list
>      =C2=A0 =C2=A0 =C2=A0 Size=C2=A0 Minimum=C2=A0 Current=C2=A0 Maximu=
m=C2=A0 Default
>      =C2=A0 =C2=A0 =C2=A065536=C2=A0 =C2=A0 =C2=A0 =C2=A0 0=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 0=C2=A0 =C2=A0 =C2=A0 =C2=A0 0
>      =C2=A0 =C2=A02097152=C2=A0 =C2=A0 =C2=A0 =C2=A0 5=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 5=C2=A0 =C2=A0 =C2=A0 =C2=A010=C2=A0 =C2=A0 =C2=A0 =C2=A0 *
>=20
>     Regarding toolchains, libhugetlbfs for RISC-V builds fine with both
>     clang and gcc.
>=20
>     [1]:
>     https://github.com/libhugetlbfs/libhugetlbfs/commit/a529598dd256c79=
799d5e43e6d79146ca15f1c16 <https://github.com/libhugetlbfs/libhugetlbfs/c=
ommit/a529598dd256c79799d5e43e6d79146ca15f1c16>
>=20
>=20
> Neat. now memcached and vm in kernel-selftest can be enabled for RV64,=20
> can you check?

Sure, I'm on it.

--=20
Best regards,
Jo=C3=A3o Marcos Costa

