Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 864DCC54E66
	for <webhook@archiver.kernel.org>; Fri, 15 Mar 2024 05:32:28 +0000 (UTC)
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
 by mx.groups.io with SMTP id smtpd.web11.13822.1710480744143838147
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Mar 2024 22:32:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NjvI/fiS;
 spf=pass (domain: gmail.com, ip: 209.85.210.53, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-6e67d989542so28539a34.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 14 Mar 2024 22:32:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710480743; x=1711085543; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H9lpUnzNTKHYBgsfSdc2tDPSPtAmvBAkedYBYZkHja0=;
        b=NjvI/fiS4doTsEMJxOYFFZPd3Tw27G+UtB6bLceXIwaHrT2e1LxITQASznfff3MTrN
         sUwnLnXx388pXzkfhw5fTWBePbAPEwhLWmpSdXPEw3Si6N/MZQId3w52oKvZBISvozLZ
         1LMztzyw0CAmJOjPcfO25hOiqshkeWUUE6Jh6oTY7ZBvazCR9hQnQFHUQktKVUJLx+Ku
         LU3wZRLvorLP4xShRSFdaU9OtepfreN91RYwsdgHVQYHPZ6vQeuQt+QC9FhmKfSpPrhn
         a3Cpf/8/rNWQd/K3LBAajZR5GAHn4yqqZexrXnJHJu11driLHO5ae8rFzm9BCpbd7ic/
         k4cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710480743; x=1711085543;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H9lpUnzNTKHYBgsfSdc2tDPSPtAmvBAkedYBYZkHja0=;
        b=e7hg2qtVPxhbftMLr7oL1lhwnYkyTkorwJvTKXgjWUGIhwu6ycFu06+khBy+nXoDlJ
         MmesscKjt6XCFqyAf6DigjhG/uLDjfADaSK3K9K0/04xjub4CY3Npz42FtYgDpveua7n
         RwbtXilcSOmG4qZO1OFypO4poyD8vt5q7WZ7his4LV0WM6QRk9wO3d3stzpC0zuzLXfB
         HP9bh0PIkutHuGO8zpnGbVyVct+zLMa9YfyOmDT7DYUlJbCAG+dHoUru46xonxf+8mDE
         8hyktkAMEmCrflUnUOgG7evB9nhFyGUYePrUXtTykkpVhd/tWhIgFtwYveuyMZo4giHw
         /dzA==
X-Forwarded-Encrypted: i=1; AJvYcCUwRvDYWcNpvNc1SkBicubR82f5ZI/UWWamJivF9bQUWm4kNGvzRyuFBt5+7oiPgsiqG77ubyFcl0v5E2WbCW4Wgf0O6YzW9uFWafbaL4RmTCKpgTZGfCuOVw==
X-Gm-Message-State: AOJu0YwYHpT+0+no/z9ZNc/ysk7U0nUcNnB57dd9x+9Bp43kCbENivHA
	QGdk2jDGtvpOezG1lab87JLLxEv+gxEsVC8Teb9t0jlfdPylun7Lzknt/2GPHeyRgfLR8eBHh/b
	ROqkjyE46P7DVl9cF6Bk+mEoj4oo=
X-Google-Smtp-Source: AGHT+IEL3xUItG+9C9VVs9nPBX6GL4HTE4o2QyiUGT4I8E6cjrA+0GRqbyqgerD2jJH55s+W72HW6nn9qPczNpCUhH8=
X-Received: by 2002:a05:6870:75c9:b0:221:3ef1:6886 with SMTP id
 de9-20020a05687075c900b002213ef16886mr3333179oab.48.1710480743354; Thu, 14
 Mar 2024 22:32:23 -0700 (PDT)
MIME-Version: 1.0
References: <20240314072215.6854-1-changqing.li@windriver.com>
 <CAMKF1srgr=EqeoZXiYLjzvjiQ_fH6csQHDayCQXX2rcED8ZVyA@mail.gmail.com>
 <b235f78f-1988-4ea3-b183-20cd9f2cc113@windriver.com> <CAMKF1srgiJHYry=2PQgxFXDug5vrwOYqokOVu=32Qi5NPbKE+w@mail.gmail.com>
 <c36ec560-b59d-4c55-aa0b-a0be5e58cd6d@windriver.com>
In-Reply-To: <c36ec560-b59d-4c55-aa0b-a0be5e58cd6d@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 14 Mar 2024 22:31:57 -0700
Message-ID: <CAMKF1srKxBx1P+Q+nyni0SyqC8iZRXagxmFROY=HQ6b1e6LK9A@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] postgresql: fix a runtime error
To: Changqing Li <changqing.li@windriver.com>
Cc: Changqing Li <changqing.li@eng.windriver.com>, 
	openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 15 Mar 2024 05:32:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109332

On Thu, Mar 14, 2024 at 10:25=E2=80=AFPM Changqing Li
<changqing.li@windriver.com> wrote:
>
>
> On 3/15/24 13:10, Khem Raj wrote:
>
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender an=
d know the content is safe.
>
> On Thu, Mar 14, 2024 at 10:01=E2=80=AFPM Changqing Li
> <changqing.li@windriver.com> wrote:
>
> On 3/15/24 01:12, Khem Raj wrote:
>
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender an=
d know the content is safe.
>
> On Thu, Mar 14, 2024 at 12:22=E2=80=AFAM Changqing Li
> <changqing.li@eng.windriver.com> wrote:
>
> From: Changqing Li <changqing.li@windriver.com>
>
> initdb on target will fail with below error:
> 2024-03-13 08:40:23.253 UTC [4410] FATAL:  could not load library "/usr/l=
ib64/postgresql/dict_snowball.so": /usr/lib64/postgresql/dict_snowball.so: =
undefined symbol: CurrentMemoryContext
>
> Refer [1][2], for cross compile, --export-dynamic is assumed as not
> supported, and cause above error. For oe, both gcc and clang support
> --export-dynamic, fixed by set LDFLAGS_EX_BE directly
>
> [1] https://www.postgresql.org/message-id/79e63515-0f5e-30f4-136d-96e23b1=
a817d%40posteo.de
> [2] https://github.com/postgres/postgres/commit/9db49fc5bfdc0126be03f4b89=
86013e59d93b91d#diff-49473dca262eeab3b4a43002adb08b4db31020d190caaad1594b47=
f1d5daa810
>
> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ---
>  meta-oe/recipes-dbs/postgresql/postgresql.inc | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta-oe/recipes-dbs/postgresql/postgresql.inc b/meta-oe/reci=
pes-dbs/postgresql/postgresql.inc
> index 868a2e443..e29a5bef7 100644
> --- a/meta-oe/recipes-dbs/postgresql/postgresql.inc
> +++ b/meta-oe/recipes-dbs/postgresql/postgresql.inc
> @@ -35,6 +35,7 @@ LEAD_SONAME =3D "libpq.so"
>
>  # LDFLAGS for shared libraries
>  export LDFLAGS_SL =3D "${LDFLAGS}"
> +export LDFLAGS_EX_BE =3D "-Wl,--export-dynamic"
>
> this will add all the symbols into dynamic symbol table which may not
> be best scenario, can we just export the ones needed ?
> perhaps look into using --dynamic-list.
>
> Hi, Khem
>
> I tried to use --dynamic-list as you recommended and test command "postgr=
esql_setup initdb",
>
> after I added all the symbols in dict_snowball.so, it will report undefin=
ed symbols for another lib. I know I can try to
>
> add all the symbols for all the libs. but there are nearly 80+ libs gener=
ated by postgresql. There will be many symbols.
>
> And I also worried that, we may missing some symbols since I may cannot c=
over all the runtime cases.
>
> From [2], we can know that postgresql use "-Wl,--export-dynamic" before.
>
> So maybe it is better to still use "-Wl,--export-dynamic" like before? wh=
at is your opinion?
>
> Yes this maybe ok. I would like you to open a discussion upstream as well=
.
>
> Do you mean open an discussion about what symbols should in the symbol fi=
les?  About the the original issue
>
> "undefined symbol: CurrentMemoryContext",  Upstream said that  "Cross-com=
piling isn't really a supported thing".

hmmm I guess this ends that then

>
>
> //Changqing
>
> Thanks
>
> Changqing
>
>  inherit autotools pkgconfig perlnative python3native python3targetconfig=
 useradd update-rc.d systemd gettext cpan-base multilib_header
>
> --
> 2.25.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#109311): https://lists.openembedded.org/g/openembedde=
d-devel/message/109311
> Mute This Topic: https://lists.openembedded.org/mt/104922226/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

