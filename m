Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBF48E732E7
	for <webhook@archiver.kernel.org>; Thu, 28 Sep 2023 16:30:38 +0000 (UTC)
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com [209.85.222.52])
 by mx.groups.io with SMTP id smtpd.web11.17970.1695918630239455452
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 28 Sep 2023 09:30:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=aJkiZZ5q;
 spf=pass (domain: gmail.com, ip: 209.85.222.52, mailfrom: raj.khem@gmail.com)
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-7b07719089aso379894241.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 28 Sep 2023 09:30:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695918629; x=1696523429; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GAAVuyxSe+c4jFCl5iiyRrg/QzWFfPiK99MOdeShxUU=;
        b=aJkiZZ5qeFjWhSCVn36y/qmUbzA1v8JK6YUusJ+1LYoIYH+8Hxedugbh1tScbcjLAi
         I9K9mE//oEY5bmW+/Pf5tpUXwEWt1yjO6AI6o0fOr5zzKFyklRLNTDwBUIXWgHXR22TN
         tdF+6HYtWWHzkhN37WoDBxLOZV7G2B7Bf+8jKZkZX6YqnokZa23gJBz4jUc/0oYZUVX/
         /lHivnLeH6XCUbeqIdotRtRlE/P96Z4EYAQvI9e/55rQvaIHkdt06pmgujc9ZjTwrCOx
         Jn1Edhg6SLXLGbgZBZx5YfElBnWxsOilKy9MyQZyIJbzl/vRPSBU+DCSYzAUJAfqikcO
         pM+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695918629; x=1696523429;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GAAVuyxSe+c4jFCl5iiyRrg/QzWFfPiK99MOdeShxUU=;
        b=B8TbTC5tx5IMH5q7eWxYtTeJJY97Rmn6qfq2RNW1YM97/PIElKuMIg4xYrtKkWNzJV
         dStQ+pMnd6rzmQRbXMhdJd8gsuw4BtqkhLqznPoOOMDr1p0T6r+6Y/PT6vkFB2tkWQ/Q
         twG1FShQwofWqRR81dMcdZYxwM8bwMr3QUHr7KrhLMNKZS9qYd4U+1M3jDm1ZJf9LqUb
         4hZMg8HhFVWUvM9rDkyC6MvbFVFiIFMK2NQpNl4dPwQek1ex6ga8J4oIUITLWBQVE2+3
         NNS4omkP56x87KcPfXdR6KVdLUDx4g6flpkh+c4nuKbb5D3iFiR7aw2OTg/NVFEjgJIS
         HrkQ==
X-Gm-Message-State: AOJu0YwRF6EsBklV4dPWLzugdEPe1+cBVlGZGPxco+NqCMaJ0rKJht68
	IvllDNPWlpNyadD34SDjAEsWiO4VldM5HPIUJjc=
X-Google-Smtp-Source: AGHT+IH0quNRLPLnnE8xjH1R9zwb9+fmuf2ui9MKsQNuku+7UQqHEHe0vc2gQ7GX3p3xmR4mc+qo5c2rKsEnBEdNv34=
X-Received: by 2002:a05:6102:570c:b0:44e:ab51:9e0d with SMTP id
 dg12-20020a056102570c00b0044eab519e0dmr784152vsb.16.1695918629066; Thu, 28
 Sep 2023 09:30:29 -0700 (PDT)
MIME-Version: 1.0
References: <20230928093808.545770-1-costamagnagianfranco@yahoo.it>
 <CAMKF1sp82ZNx=+2V-YX=+u_PWOESjmXT2MtfZWrMC5-HhXJYyA@mail.gmail.com> <CAATN8PWJ+jGDA3HpUaw8fVyBDQBZ3ZQ9YTaCMnjUmfMm8XQhug@mail.gmail.com>
In-Reply-To: <CAATN8PWJ+jGDA3HpUaw8fVyBDQBZ3ZQ9YTaCMnjUmfMm8XQhug@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 28 Sep 2023 09:30:02 -0700
Message-ID: <CAMKF1srjuZiF6k21ay919m96eDcvnr+q2YCX+pS+1sbhVhL-5g@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH 1/2] dlt-daemon:
To: Gianfranco Costamagna <costamagna.gianfranco@gmail.com>
Cc: openembedded-devel@lists.openembedded.org, 
	Gianfranco Costamagna <costamagnagianfranco@yahoo.it>, Federico Briata <federicobriata@gmail.com>, 
	Andrea Reali <andrea.reali@cnhind.com>, Gianfranco Costamagna <locutusofborg@debian.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 28 Sep 2023 16:30:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105228

On Thu, Sep 28, 2023 at 8:35=E2=80=AFAM Gianfranco Costamagna
<costamagna.gianfranco@gmail.com> wrote:
>
> hello, sure looks perfect to me!
> btw you will also need this one to build properly on some architecture
> https://patchwork.yoctoproject.org/project/oe/list/?series=3D17190

OK

>
> I'm polishing up the work, testing, and will try to update upstream PR.
>
> But please note, this is a never-tested and highly experimental dlt featu=
re nobody is using right now.
> (and it's a new binary, so won't affect the normal dlt usage)

This does not generate confidence. If you want this to be testing-only
then mark the patches RFC so
we can understand the intentions.

>
> Expect new commits soon :)

sure

>
> G.
>
> On Thu, Sep 28, 2023 at 5:01=E2=80=AFPM Khem Raj <raj.khem@gmail.com> wro=
te:
>>
>> I have staged it with some modified commit msg summary please check
>> master-next and see if it looks ok.
>>
>> On Thu, Sep 28, 2023 at 2:38=E2=80=AFAM Gianfranco
>> <costamagna.gianfranco@gmail.com> wrote:
>> >
>> > Make sure also without systemd enabled as default, the tools can be bu=
ilt and installed,
>> > such as dlt-adaptor, dlt-adaptor-stdin, dlt-adaptor-udp, dlt-examples =
and dlt-console.
>> > They have stub functionalities when systemd is not default, but they c=
an still be used with
>> > limited functionalities
>> >
>> > Reported-By: Federico Briata <federicobriata@gmail.com>
>> > Reported-By: Andrea Reali <andrea.reali@cnhind.com>
>> > Signed-off-by: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
>> > Signed-off-by: Gianfranco Costamagna <locutusofborg@debian.org>
>> > ---
>> >  .../dlt-daemon/dlt-daemon_2.18.10.bb                | 13 +++++++-----=
-
>> >  1 file changed, 7 insertions(+), 6 deletions(-)
>> >
>> > diff --git a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.10.bb=
 b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.10.bb
>> > index 33fae0619..3811772a7 100644
>> > --- a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.10.bb
>> > +++ b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.10.bb
>> > @@ -22,12 +22,13 @@ SRCREV =3D "0f2d4cfffada6f8448a2cb27995b38eb427104=
4f"
>> >
>> >  S =3D "${WORKDIR}/git"
>> >
>> > -PACKAGECONFIG ?=3D "${@bb.utils.contains('DISTRO_FEATURES', 'systemd'=
, ' systemd systemd-watchdog systemd-journal dlt-examples dlt-adaptor dlt-a=
daptor-stdin dlt-adaptor-udp dlt-console ', '', d)} \
>> > +PACKAGECONFIG ?=3D "${@bb.utils.contains('DISTRO_FEATURES', 'systemd'=
, ' systemd systemd-watchdog systemd-journal ', '', d)} \
>> > + dlt-examples dlt-adaptor dlt-adaptor-stdin dlt-adaptor-udp dlt-conso=
le \
>> >   udp-connection dlt-system dlt-filetransfer "
>> >  # dlt-dbus
>> >
>> >  # General options
>> > -PACKAGECONFIG[dlt-examples] =3D "-DWITH_DLT_EXAMPLES=3DON,-DWITH_DLT_=
EXAMPLES=3DOFF,,dlt-daemon-systemd"
>> > +PACKAGECONFIG[dlt-examples] =3D "-DWITH_DLT_EXAMPLES=3DON,-DWITH_DLT_=
EXAMPLES=3DOFF"
>> >
>> >  # Linux options
>> >  PACKAGECONFIG[systemd] =3D "-DWITH_SYSTEMD=3DON,-DWITH_SYSTEMD=3DOFF =
-DWITH_DLT_SYSTEM=3DOFF,systemd"
>> > @@ -38,11 +39,11 @@ PACKAGECONFIG[udp-connection] =3D "-DWITH_UDP_CONN=
ECTION=3DON,-DWITH_UDP_CONNECTION=3D
>> >
>> >  # Command line options
>> >  PACKAGECONFIG[dlt-system] =3D "-DWITH_DLT_SYSTEM=3DON,-DWITH_DLT_SYST=
EM=3DOFF"
>> > -PACKAGECONFIG[dlt-adaptor] =3D "-DWITH_DLT_ADAPTOR=3DON,-DWITH_DLT_AD=
APTOR=3DOFF,,dlt-daemon-systemd"
>> > -PACKAGECONFIG[dlt-adaptor-stdin] =3D "-DWITH_DLT_ADAPTOR_STDIN=3DON,-=
DWITH_DLT_ADAPTOR_STDIN=3DOFF,,dlt-daemon-systemd"
>> > -PACKAGECONFIG[dlt-adaptor-udp] =3D "-DWITH_DLT_ADAPTOR_UDP=3DON,-DWIT=
H_DLT_ADAPTOR_UDP=3DOFF,,dlt-daemon-systemd"
>> > +PACKAGECONFIG[dlt-adaptor] =3D "-DWITH_DLT_ADAPTOR=3DON,-DWITH_DLT_AD=
APTOR=3DOFF"
>> > +PACKAGECONFIG[dlt-adaptor-stdin] =3D "-DWITH_DLT_ADAPTOR_STDIN=3DON,-=
DWITH_DLT_ADAPTOR_STDIN=3DOFF"
>> > +PACKAGECONFIG[dlt-adaptor-udp] =3D "-DWITH_DLT_ADAPTOR_UDP=3DON,-DWIT=
H_DLT_ADAPTOR_UDP=3DOFF"
>> >  PACKAGECONFIG[dlt-filetransfer] =3D "-DWITH_DLT_FILETRANSFER=3DON,-DW=
ITH_DLT_FILETRANSFER=3DOFF"
>> > -PACKAGECONFIG[dlt-console] =3D "-DWITH_DLT_CONSOLE=3DON,-DWITH_DLT_CO=
NSOLE=3DOFF,,dlt-daemon-systemd"
>> > +PACKAGECONFIG[dlt-console] =3D "-DWITH_DLT_CONSOLE=3DON,-DWITH_DLT_CO=
NSOLE=3DOFF"
>> >
>> >  inherit autotools gettext cmake pkgconfig systemd
>> >
>> > --
>> > 2.34.1
>> >
>> >
>> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> > Links: You receive all messages sent to this group.
>> > View/Reply Online (#105219): https://lists.openembedded.org/g/openembe=
dded-devel/message/105219
>> > Mute This Topic: https://lists.openembedded.org/mt/101634559/1997914
>> > Group Owner: openembedded-devel+owner@lists.openembedded.org
>> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub=
 [raj.khem@gmail.com]
>> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> >

