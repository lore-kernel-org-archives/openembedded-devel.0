Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E03FACAC597
	for <webhook@archiver.kernel.org>; Thu, 18 Sep 2025 19:47:55 +0000 (UTC)
Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com [209.85.160.43])
 by mx.groups.io with SMTP id smtpd.web11.24991.1758224873209831557
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 18 Sep 2025 12:47:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=E5d9kINz;
 spf=pass (domain: gmail.com, ip: 209.85.160.43, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-3318dd36a8fso1744755fac.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 18 Sep 2025 12:47:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758224872; x=1758829672; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w7Wm+ZXLP99sOUh8wh1Zgrxg1ut789xlnArZCgQrrxo=;
        b=E5d9kINzI0mEOwvElI9pC4tdj9rm4LJMROgyF6et1m+wGB5NTX9KcV7bqrqRYb9m6y
         ONQGR9WXSmWDAMItybWE/lwfh7PglsV4/OZG5H/bQ+RHs8tEzdKGkArfQpfyaZ6/YrJ6
         RPvH9UjqHWta2pvLADortoLhaq5PzMjNy98rDsf39qbyRkIrYjTWnN/b29ALkaoENCj0
         p+5gCGuCRZlB2IHINziZfx3aL3nrcK/dNzEG8qdd/My1OWNUJ/eNO1bGZIhE1up1JF5L
         F8BVQK2L6xsGPSSMHWyLuiWrGjYJUVsT3Vtw4uA60Uc0//NYJNqivtf1gPQN/qAeZE0k
         rzeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758224872; x=1758829672;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w7Wm+ZXLP99sOUh8wh1Zgrxg1ut789xlnArZCgQrrxo=;
        b=ddepkL363kFbjZMSnogBi+9gEAP1SI3d+4eUzYmo+LJLGcRJ24hNDKQuvwNYkF1anI
         h0+CEznBELGGON11zot6cxlyD9w3gYjHx5YNwa3M4epSqFQ62SBFPIak36FdEicJCo1W
         +FdsnoEIkFjALF7jY8rLKsWcXPovTlBW9gI3e5eOGMlZjfSJS1iwte5eh0z74GMguipo
         ArG0L2v41bYiCocKl0wm0zVVaQF71x2uQTykqW4684Nikkh/kuW0qw0RlmvbVptW4bO0
         r85F4jxSu0ZIo+ceIOvoHX8gHyOpkEiUq7E44ewy33wCKHRh2fi2WKpIVuzJpG1yZW5H
         FOpg==
X-Forwarded-Encrypted: i=1; AJvYcCXp5SQcheIi8p9xr71Kj+osAv30MVBYtKEqLPttxkHp8qO5+gYnZu5lnmhtK2KmpoHQuRCAFK0O/XTHFc8SoQ+WlqE=@lists.openembedded.org
X-Gm-Message-State: AOJu0YzsBQEb1sKxpqk9BRGhcn0xAHUTEHvHSo89jVg99vGgVz2bsR1i
	UOTLG0BlJ/Q2OlsSdGZyIfAcXlxaVXmo4pMHwsKyWBIOg+jSrGtZTjIMuAyELdDCs12Z/PefKzg
	siRHCZ6jZyLYwmMdDKnGJ6Y+5yIaP7wQ=
X-Gm-Gg: ASbGnctjf2YpBNA510IidQlikOZhNeBhpoBhCv/BEnXYgXjM6InPGJ46OTqkdGcQPgv
	edVBXjoMf8LexuR9Qnt71a1P1N+uknIicHKxat6h5/4Ob0/rIVuoTSc/kyIqyHTLHKSOkUKz8vX
	AjYK+P73zY+/0cWTqyr66e/XH4ieiPO9MuS+z7jwO91cvbdJgY/7JFDC4VBiuRya99UmxD50oDY
	SEiaF5ZaWSBornryqGKAKjjs3TB
X-Google-Smtp-Source: AGHT+IFXEfEjg3F2XQ+pOhxp9uhq30NUzSheASp8CBjdXRnJ9hePXk/N60rSBZh8RyR3lIw6nCNToMDuB9HFqBKoQ8I=
X-Received: by 2002:a05:6870:c988:b0:332:681f:cb2b with SMTP id
 586e51a60fabf-33bb608ba26mr504545fac.36.1758224872322; Thu, 18 Sep 2025
 12:47:52 -0700 (PDT)
MIME-Version: 1.0
References: <20250918102642.487522-1-zboszor@gmail.com> <CAMSfU+6F0GngYjP=07gUWFo4Tvf=hk=rG6CgAnV16BrK8UuBEg@mail.gmail.com>
 <CAMSfU+6tnHY2yyjTRJ9Y+jjCQE8=f-g+V2N_22TK1vBTYZp5GA@mail.gmail.com>
 <f7ce8c19-fb1e-4a4f-80eb-c41c79aef706@gmail.com> <CAMSfU+5b8ARRgzOtbzP+-VpL2U1eHtngOJVUDnU+Oxq-_AvzOA@mail.gmail.com>
In-Reply-To: <CAMSfU+5b8ARRgzOtbzP+-VpL2U1eHtngOJVUDnU+Oxq-_AvzOA@mail.gmail.com>
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Fri, 19 Sep 2025 07:47:40 +1200
X-Gm-Features: AS18NWDblQfo7USSML-tccJFKDYAN4X5SPlDtqn7cZA8Bg2l2rOEeV7ZkK1jDFA
Message-ID: <CADySD0G6Nwsc=+VJ6PRPGHTyzUfiBKSo_xby0DN1LB03w=CQLg@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] gutenprint: 5.3.5
To: yoann.congal@smile.fr
Cc: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>, 
	openembedded-devel@lists.openembedded.org, Khem Raj <raj.khem@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 18 Sep 2025 19:47:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119584

On Fri, Sep 19, 2025 at 6:42=E2=80=AFAM Yoann Congal via
lists.openembedded.org <yoann.congal=3Dsmile.fr@lists.openembedded.org>
wrote:
>
>
>
> Le jeu. 18 sept. 2025 =C3=A0 20:22, B=C3=B6sz=C3=B6rm=C3=A9nyi Zolt=C3=A1=
n <zboszor@gmail.com> a =C3=A9crit :
>>
>> 2025. 09. 18. 19:42 keltez=C3=A9ssel, Yoann Congal =C3=ADrta:
>> >
>> >
>> > Le jeu. 18 sept. 2025 =C3=A0 16:16, Yoann Congal <yoann.congal@smile.f=
r> a =C3=A9crit :
>> >
>> >     Hello,
>> >
>> >     Le jeu. 18 sept. 2025 =C3=A0 12:26, Zoltan Boszormenyi via lists.o=
penembedded.org
>> >     <http://lists.openembedded.org> <zboszor=3Dgmail.com@lists.openemb=
edded.org> a =C3=A9crit :
>> >
>> >         This fixes an installation error:
>> >
>> >         | make[5]: Entering directory
>> >         '.../tmp/work/corei7-64-oe-linux/gutenprint/5.3.4/build/src/cu=
ps'
>> >         | chmod 700
>> >         .../tmp/work/corei7-64-oe-linux/gutenprint/5.3.4/image/usr/lib=
exec/cups/backend/backend_gutenprint
>> >         | chmod: cannot access
>> >         '.../tmp/work/corei7-64-oe-linux/gutenprint/5.3.4/image/usr/li=
bexec/cups/backend/backend_gutenprint':
>> >         No such file or directory
>> >
>> >
>> >     What makes you say that the 5.3.4->5.3.5 upgrade fix this bug?
>> >
>>
>> I got the error with 5.3.4 and it has gone away with 5.3.5.
>> I admit that I only tried the build once. I will retry tomorrow.
>
>
> This error is a rare intermittent failure. You will most likely not see i=
t but that does not mean it's fixed (sadly).
>
> Did the 5.3.4 version on which you saw the problem had my patch?
>

Tried building current recipe version 5.3.4 and couldn't reproduce the prob=
lem.


>>
>> >     The above error is the one I fixed with the patch
>> >     "0001-cups-fix-a-build-race-condition-around-empty-directo.patch" =
and this patch has
>> >     not been merged upstream nor the code I touched changed. I did not=
 see anything
>> >     related by quickly reading the NEWS.
>> >     I'd be happy to see this fixed upstream but I'd rather have upstre=
am confirmation
>> >     that they saw/fixed it (a commit, a changelog, ...).
>> >     If that is fixed upstream, then we can drop my patch.
>> >
>> >
>> > To be clear, I'm not against upgrading. I just don't think the commit =
message is correct
>> > (but could be convinced otherwise).
>> >
>> >     Thanks!
>> >
>> >         Signed-off-by: Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi <zboszor=
@gmail.com>
>> >         ---
>> >          .../gutenprint/{gutenprint_5.3.4.bb <http://gutenprint_5.3.4.=
bb> =3D>
>> >         gutenprint_5.3.5.bb <http://gutenprint_5.3.5.bb>}    | 2 +-
>> >          1 file changed, 1 insertion(+), 1 deletion(-)
>> >          rename meta-oe/recipes-printing/gutenprint/{gutenprint_5.3.4.=
bb
>> >         <http://gutenprint_5.3.4.bb> =3D> gutenprint_5.3.5.bb
>> >         <http://gutenprint_5.3.5.bb>} (96%)
>> >
>> >         diff --git a/meta-oe/recipes-printing/gutenprint/gutenprint_5.=
3.4.bb
>> >         <http://gutenprint_5.3.4.bb>
>> >         b/meta-oe/recipes-printing/gutenprint/gutenprint_5.3.5.bb
>> >         <http://gutenprint_5.3.5.bb>
>> >         similarity index 96%
>> >         rename from meta-oe/recipes-printing/gutenprint/gutenprint_5.3=
.4.bb
>> >         <http://gutenprint_5.3.4.bb>
>> >         rename to meta-oe/recipes-printing/gutenprint/gutenprint_5.3.5=
.bb
>> >         <http://gutenprint_5.3.5.bb>
>> >         index f90a123293..82953b798c 100644
>> >         --- a/meta-oe/recipes-printing/gutenprint/gutenprint_5.3.4.bb
>> >         <http://gutenprint_5.3.4.bb>
>> >         +++ b/meta-oe/recipes-printing/gutenprint/gutenprint_5.3.5.bb
>> >         <http://gutenprint_5.3.5.bb>
>> >         @@ -17,7 +17,7 @@ LIC_FILES_CHKSUM =3D
>> >         "file://COPYING;md5=3D59530bdf33659b29e73d4adb9f9f6552"
>> >          SRC_URI =3D "https://downloads.sourceforge.net/gimp-print/${B=
P}.tar.xz
>> >         <https://downloads.sourceforge.net/gimp-print/$%7BBP%7D.tar.xz=
> \
>> >         file://0001-cups-fix-a-build-race-condition-around-empty-direc=
to.patch \
>> >                     "
>> >         -SRC_URI[sha256sum] =3D
>> >         "db44a701d2b8e6a8931c83cec06c91226be266d23e5c189d20a39dd175f20=
23b"
>> >         +SRC_URI[sha256sum] =3D
>> >         "f5a9f47de28530b1ae2069cfbc647a9a641baeeabe809bb0ef2b3ec5b9668=
d70"
>> >
>> >          inherit autotools gettext pkgconfig
>> >
>> >         --
>> >         2.51.0
>> >
>> >
>> >
>> >
>> >
>> >
>> >     --
>> >     Yoann Congal
>> >     Smile ECS
>> >
>> >
>> >
>> > --
>> > Yoann Congal
>> > Smile ECS
>>
>
>
> --
> Yoann Congal
> Smile ECS
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#119581): https://lists.openembedded.org/g/openembedde=
d-devel/message/119581
> Mute This Topic: https://lists.openembedded.org/mt/115307539/3619737
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [a=
nkur.tyagi85@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

