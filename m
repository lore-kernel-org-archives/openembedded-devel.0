Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 392B8C4332F
	for <webhook@archiver.kernel.org>; Sun, 12 Nov 2023 17:20:53 +0000 (UTC)
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
 by mx.groups.io with SMTP id smtpd.web10.18945.1699809647611530914
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 12 Nov 2023 09:20:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Ciw/ztoX;
 spf=pass (domain: gmail.com, ip: 209.85.167.179, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f179.google.com with SMTP id 5614622812f47-3b5aee410f2so1580273b6e.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 12 Nov 2023 09:20:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699809647; x=1700414447; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ceJMc5beztAqlPH4AlxJKjQGZiNoPFnbEAMmhxaYuo0=;
        b=Ciw/ztoX0Zv7kXNKy6VfJBREMay+7w29MSzOrUg0VpLQ0RxE01sFodr8rRsbFKsexf
         qY4bPLQ62vpWdtI58t+cPhZiFvHA0oW8gkACLWTiP5Lb+fJFgHuwPX0Lt3MG23O1Y3HN
         r9mgvDL/VjqsUwDzsb9WJE1/ktMRBEbSk1xF6fcwxvLEQEYQZ9SyIa2R7UNqmwDXpKiT
         TcVrkuiEvnmziDsWQuvKbmgYem+hxdcC7bLJJrZFC+BbvXtotAeCBW2A7UmmHutvLVsI
         /XgL4S3M18IrJOZ+nxVOMaU+0iWCjE928wAnjMnxiyYmmf4NE7CIw/ie1zXqH+Uaefmx
         43qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699809647; x=1700414447;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ceJMc5beztAqlPH4AlxJKjQGZiNoPFnbEAMmhxaYuo0=;
        b=bFRTYtFuiuLVJ0w/GgQm5KEwIFo9+SZ2MOGMB9kzUBhgsfbjixcgL6R5FeveprfbSa
         vD9ydBYBtSsRKoj1ZfO4zyX7TZRwpBO8xSEgRZHz1v6wyLCmZHvN5NgSbuUtLq2WDuij
         e9veme2jY5LnT37NI7k0UVqv5w1Sn/du+WbofxuKX8/M8NcJPGgHfTDPBXMcjopRd8dt
         TyABZPUeTZyQQI+5ShjLEHnCj7Z2hhNmaDcZ/urGE/2MalvCSId1dHBzpt7E0BJjPilw
         JqLApSGTC++eardEV9yfQJLuk74qvQQINMOnirsUU9rlZyi113G0rx5qF4j3fxYkTrN4
         3EYQ==
X-Gm-Message-State: AOJu0YxyLQlXlUzKxQf3ZCOxCf5UHEiWv9jKAuLYXAmKrhH6/UCqAHev
	60h85t6MwiC6CZjtuI6yEkrX4oTLOAddpSuwbRA=
X-Google-Smtp-Source: AGHT+IGGs0cBWiXWL8K6f8FBtm4pq8aRnGFkkWl/sWE26NKIFZx2yx1NGV05Jn5hpUM+R/iMp+zzPB3z65BQ9JaU+34=
X-Received: by 2002:a05:6871:a606:b0:1e9:af81:54c2 with SMTP id
 we6-20020a056871a60600b001e9af8154c2mr4055145oab.45.1699809646748; Sun, 12
 Nov 2023 09:20:46 -0800 (PST)
MIME-Version: 1.0
References: <CAMKF1sq718EwKbfEdWgGfZQq+2kRJCPaepp4aY9XsMXKckHQjw@mail.gmail.com>
 <AADC177D-1457-42FA-AEA8-A6850E0FC53E@getmailspring.com>
In-Reply-To: <AADC177D-1457-42FA-AEA8-A6850E0FC53E@getmailspring.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 12 Nov 2023 09:20:20 -0800
Message-ID: <CAMKF1spS52dn3+XxVsh3JhisBo58PN8fj6HGXtjNc+YKXp5fHg@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] recipes-support: Add btop
To: =?UTF-8?B?SmFuIENsYXXDn2Vu?= <jan.claussen10@web.de>
Cc: "openembedded-devel@lists.openembedded.org" <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 12 Nov 2023 17:20:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106594

On Sun, Nov 12, 2023 at 8:25=E2=80=AFAM Jan Clau=C3=9Fen <jan.claussen10@we=
b.de> wrote:
>
> I am trying with the tarball but it is quite hard, since it doesn't come =
with a CMakeLists.txt.
> There is a recipe here, but it involves a lot of patching which could pot=
entially be painful to maintain
>
> https://github.com/aristocratos/btop/issues/330#issuecomment-1123685779
>

is it because cmake support was added later ? in that case maybe using
git version is ok

> On Nov. 11 2023, at 8:01 pm, Khem Raj <raj.khem@gmail.com> wrote:
>
> On Sat, Nov 11, 2023 at 10:38=E2=80=AFAM Jan Clau=C3=9Fen <jan.claussen10=
@web.de> wrote:
> >
> > It also needs a utf-8 locale to work. Else you have to force utf-8 mode=
 with a flag. I haven't included this as dependency at this point.
>
> you want to express all that is needed to get it running amicably.
> keeping in mind that we have glibc and musl based systems to service
> it will be good to check it on musl too.
>
> >
> > On Nov. 11 2023, at 7:35 pm, Jan Clau=C3=9Fen <jan.claussen10@web.de> w=
rote:
> >
> > Glad that it arrived now! This is a really great resource monitor. It i=
s building from the git repository. Do you think it is better to use the re=
lease instead?
> >
> > On Nov. 11 2023, at 7:30 pm, Khem Raj <raj.khem@gmail.com> wrote:
> >
> > Thanks for your contribution Jan
> >
> > On Sat, Nov 11, 2023 at 10:26=E2=80=AFAM Jan Clau=C3=9Fen <jan.claussen=
10@web.de> wrote:
> > >
> > > ---
> > > meta-oe/recipes-support/btop/btop_1.2.13.bb | 23 ++++++++++++++++++++=
+
> > > 1 file changed, 23 insertions(+)
> > > create mode 100644 meta-oe/recipes-support/btop/btop_1.2.13.bb
> > >
> > > diff --git a/meta-oe/recipes-support/btop/btop_1.2.13.bb b/meta-oe/re=
cipes-support/btop/btop_1.2.13.bb
> > > new file mode 100644
> > > index 000000000..f780a993a
> > > --- /dev/null
> > > +++ b/meta-oe/recipes-support/btop/btop_1.2.13.bb
> > > @@ -0,0 +1,23 @@
> > > +SUMMARY =3D "Resource monitor that shows usage and stats for process=
or, memory, disks, network and processes."
> > > +HOMEPAGE =3D "https://github.com/aristocratos/btop"
> > > +LICENSE =3D "Apache-2.0"
> > > +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D3b83ef96387f14655fc854ddc=
3c6bd57"
> > > +SECTION =3D "console/utils"
> > > +
> > > +SRC_URI =3D "git://github.com/aristocratos/btop.git;protocol=3Dhttps=
;branch=3Dmain"
> > > +SRCREV =3D "2a864f6f2ea60df16b3f015885eb3c18a48b9b78"
> > > +
> > > +S =3D "${WORKDIR}/git"
> > > +
> > > +inherit cmake
> > > +
> > > +FILES:${PN} +=3D " \
> > > + /usr/share/icons \
> >
> > Lets use ${datadir} instead of hardcoded /usr/share
> >
> > > + /usr/share/icons/hicolor \
> > > + /usr/share/icons/hicolor/48x48 \
> > > + /usr/share/icons/hicolor/scalable \
> > > + /usr/share/icons/hicolor/48x48/apps \
> > > + /usr/share/icons/hicolor/48x48/apps/btop.png \
> > > + /usr/share/icons/hicolor/scalable/apps \
> > > + /usr/share/icons/hicolor/scalable/apps/btop.svg \
> > > +"
> > > --
> > > 2.42.0
> > >
> > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > > Links: You receive all messages sent to this group.
> > > View/Reply Online (#106559): https://lists.openembedded.org/g/openemb=
edded-devel/message/106559
> > > Mute This Topic: https://lists.openembedded.org/mt/102530478/1997914
> > > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsu=
b [raj.khem@gmail.com]
> > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > >

