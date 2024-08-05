Return-Path: <mr.scada@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45D6CC3DA4A
	for <webhook@archiver.kernel.org>; Mon,  5 Aug 2024 16:07:48 +0000 (UTC)
Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com [209.85.161.44])
 by mx.groups.io with SMTP id smtpd.web11.11828.1722874065118718251
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 05 Aug 2024 09:07:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=nDJv02UY;
 spf=pass (domain: gmail.com, ip: 209.85.161.44, mailfrom: mr.scada@gmail.com)
Received: by mail-oo1-f44.google.com with SMTP id 006d021491bc7-5d5d0535396so5738642eaf.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 05 Aug 2024 09:07:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722874064; x=1723478864; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N7Mx8K+ibxPBuXIxs5lv8b5vM0upUcrCgyY1roTvgRo=;
        b=nDJv02UY7Fg4tjoGFzWysmDUexb8lSxxP08ZemDBMO122Pw5NuCEC5zpyYE/bZDnQZ
         6AuWiDCJQOJIwNH29s7kr9LjXLqOs3hyFYl3/3kBEZxwU+Ct1M/tlnQZyt4k2lxAAlat
         xp3gZhcdu05jQ99Axz2c/EhmMG/qioiX8J7U64gpDVuzqrxtv6nVQLyScp7ncpCYJ3hU
         HA7xcl7ZxQYIEo2a187f5JVdbWnJ5H8dFC8lejJpfJeq8XCthKBsh5dZpDGcNyDjPEhu
         KdNAuKELq3qbd1V03OoqkJBs8tyha2KrDWe5X5J7byVBfsJzqtHFDnFHNPf0jXPX4x0j
         YaXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722874064; x=1723478864;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N7Mx8K+ibxPBuXIxs5lv8b5vM0upUcrCgyY1roTvgRo=;
        b=Xp+pG0Qc//31PDiYqOak/jEFguNzicnM53RmW0NCQTD4/lecy0r58psu0nCzKNOwAE
         Wvv4p2Wl8RqSAwg+yWZHsrJ1tIG0p3UeRd5n7Xyxjbal3AeQ+rjVFTiZhjsNRARHrJK3
         dpwTbPu0YVM7aqRdjsPU0oG8khxzLdVSuaUlO1Sm+zqx6b2Ql46pHPgSwiRrjs5i5MOQ
         0QBiHgIw38PRGozOeCe0tRag645YeW6o6eNuxvf/7e2565bzQjo4RexUkOP2D8yUPsw8
         m5LqBCUKdBnQikNV0f6NvutI/wtnh3K/6M8ktagdGJ//Y29z4DroftzaqYbpDZD6PJfE
         U2FA==
X-Gm-Message-State: AOJu0YwRp86HscjMxR8BsXY2CYfCfHZW/FOmw1fSp42U0eiXthvqbMAO
	y5hhoz9nPoHmUYdb20KTv/zAb/AOgwiRPfgFEn4OGCFV8gai9ruf0kGLa+5d2ASXPCgwWWkiHE8
	XqQMpWCCVmBEohcz/9tMHvTqO/+M=
X-Google-Smtp-Source: AGHT+IHs9fQnnr3plAzsDsaOFavWUkXo3UGlLpZogrKdT5tdO2YgHE+V4gBQsXO8yESKVMtVuciHfxSXD4wMueI2Pb0=
X-Received: by 2002:a05:6820:1689:b0:5c4:144b:1ff9 with SMTP id
 006d021491bc7-5d663aca306mr12785795eaf.5.1722874064387; Mon, 05 Aug 2024
 09:07:44 -0700 (PDT)
MIME-Version: 1.0
References: <20240730203342.5123-1-mr.scada@gmail.com> <3A5FE38C-91A9-44E0-9D27-3F6D229B26C0@arm.com>
In-Reply-To: <3A5FE38C-91A9-44E0-9D27-3F6D229B26C0@arm.com>
From: Barry G <mr.scada@gmail.com>
Date: Mon, 5 Aug 2024 09:07:33 -0700
Message-ID: <CAFrvcAqqKzxUkbJekTVAdV8T6rryqyBaB7_BoZNOKJPcRtu-1Q@mail.gmail.com>
Subject: Re: [oe] [meta-oe][scarthgap][PATCH] postgresql: Break perl RDEPENDS
To: Ross Burton <Ross.Burton@arm.com>
Cc: "openembedded-devel@lists.openembedded.org" <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 05 Aug 2024 16:07:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111514

On Mon, Aug 5, 2024 at 8:20=E2=80=AFAM Ross Burton <Ross.Burton@arm.com> wr=
ote:
> > On 30 Jul 2024, at 21:33, Barry Grussling via lists.openembedded.org <m=
r.scada=3Dgmail.com@lists.openembedded.org> wrote:
> > -DEPENDS =3D "libnsl2 readline tzcode-native"
> > +DEPENDS =3D "libnsl2 readline tzcode-native perl=E2=80=9D
>
> This is a mandatory dependency on target perl, even if perl isn=E2=80=99t=
 enabled.  Is this actually needed, as there=E2=80=99s a dependency on targ=
et perl in the perl PACKAGECONFIG already.

In my testing the build wasn't successful without the perl hard-depend
(even with perl off via the PACKAGECONFIG). I wrote it off as needed
as I know Postgresql previously had a perl requirement in its build
system.

Previous to this change, we would have had a hard DEPEND requirement
on perl via the cpan-base inherit:
https://git.yoctoproject.org/poky/tree/meta/classes-recipe/cpan-base.bbclas=
s?h=3Dscarthgap#n13
(or perl-native).

I'll do some testing today and see if I can learn more or remove it.

Barry

