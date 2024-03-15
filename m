Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73FE7C54E58
	for <webhook@archiver.kernel.org>; Fri, 15 Mar 2024 05:11:28 +0000 (UTC)
Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com [209.85.160.53])
 by mx.groups.io with SMTP id smtpd.web11.13621.1710479480032399929
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Mar 2024 22:11:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PI6gq35S;
 spf=pass (domain: gmail.com, ip: 209.85.160.53, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-221e6bf537dso1177726fac.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 14 Mar 2024 22:11:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710479479; x=1711084279; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5qjE0SYrqNWYPlyqpT8bzui6Kztcyg6jAtfO4y3qFJM=;
        b=PI6gq35SxFxZfTiP78UcXc25D9jHvne8hw6GcAY+rkEBATcnoygefXrxCaz5N5uk0a
         mLlJ1h29fpcZKmnk+SGHyLJB85Kqq6bAcIxUX2mdOXixrNwd81lfMHVF0O5HbFsaDylf
         pAlxX9aZ/rXwghkVVFsuuvwByPfE5peDrQ9QDRYo79UR1PKh5x7pYsoo1XWGEuNLNDO+
         kGwoNDIVoFCVFDJzct5/7uvgM8NJOIMkl8FWgRjY1TngEjbA8C/8eWBrITE3T30ywFm3
         0xs5xsUYeSQqkoyRU7TmeW3apY/tWjukUMJSKGTgfU4qJdKjLinxD54eyFzFxw3U3CFr
         eQnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710479479; x=1711084279;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5qjE0SYrqNWYPlyqpT8bzui6Kztcyg6jAtfO4y3qFJM=;
        b=bOVSybUd+vVPNP0j8cMPbFSoBjL+VKlAoVAdv2mla05mI8XCW7CVnQkOo24rPI5/3J
         Ax5AAsA/645z8dGmwWb+2YZGa5OaxhlsX+BpuRXicvvLFqwBrOC/WwmwnFWi/PYxNymq
         VbuFOQPYf0Qp/3To8hGuKnrqpawiE4TOvRVyftCms8b2wcYe75dUBmbopRsjUiS6mTFZ
         2MTC37qTlBTRcN33apJdU5eGXVcScVzOs9t6CBST5oNcch0o9inelW7yYgPzv1NSaQXV
         efleA0f4apFrnrQJHJPzpiv+VkcSsIH5OY0+Urh7ZEj0huJgBETixsbn6vjZS0MsVrD2
         rQ/w==
X-Forwarded-Encrypted: i=1; AJvYcCU+LMkOA0/iNogPc/TawGI4culj8PWvPSknQaCRkF7w49KX9jbJACdpOflsu4uSqOqEESrMN3VP0THb+pCjNW9gBtalnRBpVLVP/k/WnlcDQddSuHWRAPREuw==
X-Gm-Message-State: AOJu0YyUuFJB4dmheU2MeuT+BvCNmF0c6r4uaQX/Fj4ZnFW+/PdipyKA
	zA2T6/hQ0cuXhgSaAChCzAumBDls3Vief+2Wu8MHn+Me/+NwsPyFdvCWUJ4ZUJ3ziPMQrobVJmp
	T0Nphvpn9SYrw6FKnSMkNczSVT/wSXaXO
X-Google-Smtp-Source: AGHT+IFctoEyHpS4VALjSDMzJ5fLK6awgQksFYRLnZu7VCYAiOUIGs7YKo5K7tjy25vFCMx/VBqkZCV/x2xuk1zahIU=
X-Received: by 2002:a05:6870:1489:b0:222:6406:4ce6 with SMTP id
 k9-20020a056870148900b0022264064ce6mr4071218oab.25.1710479479260; Thu, 14 Mar
 2024 22:11:19 -0700 (PDT)
MIME-Version: 1.0
References: <20240314072215.6854-1-changqing.li@windriver.com>
 <CAMKF1srgr=EqeoZXiYLjzvjiQ_fH6csQHDayCQXX2rcED8ZVyA@mail.gmail.com> <b235f78f-1988-4ea3-b183-20cd9f2cc113@windriver.com>
In-Reply-To: <b235f78f-1988-4ea3-b183-20cd9f2cc113@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 14 Mar 2024 22:10:53 -0700
Message-ID: <CAMKF1srgiJHYry=2PQgxFXDug5vrwOYqokOVu=32Qi5NPbKE+w@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] postgresql: fix a runtime error
To: Changqing Li <changqing.li@windriver.com>
Cc: Changqing Li <changqing.li@eng.windriver.com>, 
	openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 15 Mar 2024 05:11:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109327

On Thu, Mar 14, 2024 at 10:01=E2=80=AFPM Changqing Li
<changqing.li@windriver.com> wrote:
>
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

Yes this maybe ok. I would like you to open a discussion upstream as well.

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

