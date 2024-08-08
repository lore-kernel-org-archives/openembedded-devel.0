Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60FF3C3DA4A
	for <webhook@archiver.kernel.org>; Thu,  8 Aug 2024 16:45:29 +0000 (UTC)
Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com [209.85.161.42])
 by mx.groups.io with SMTP id smtpd.web11.64828.1723135521494019795
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 08 Aug 2024 09:45:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TBIBxTdB;
 spf=pass (domain: gmail.com, ip: 209.85.161.42, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-5d5b22f97b7so889616eaf.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 08 Aug 2024 09:45:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723135521; x=1723740321; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=etTzGEDGr0SpZlS07wcN7auynr3jwadzLzaIMRuLOZY=;
        b=TBIBxTdBOZhUTRgr3ktE+rq/mYqCy6HpIRVmlQKq+8h/Bbfv4JJMYnkpMd1jdx7D7v
         zwEK5PNA+Xf0BgJdzP9uBi50g93q+48A0gqb7FzkEKUIe7DoPdb7lzqDEPN6rujLKKrj
         YBsrqqrMEvoI8H2enXJnVy4XKX6Lv9cjsenGR11sqUmhEWtAMk1zTGnDbbl0Ot+oyplg
         gCx0Rgc6QFuYowdO8kx1FpGiMSFDac/BX0Fq/ZvbAva+rmclcrPJ70Dr6LbIE5FApdvR
         Vfo+C+JECxzTdmoEUVSsaBA8j+uoT1m2BTSskidJbHuEqFUBmECADicfelui+Q0NBT3J
         38cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723135521; x=1723740321;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=etTzGEDGr0SpZlS07wcN7auynr3jwadzLzaIMRuLOZY=;
        b=G0y4l0qZUiTYjYitnZvHM2um14LXcH0oAhJLsnZz90j+aVFS3XOJW9n3Zms8Rv1VfX
         OcDd/Fl2JeNZUAdtByVPjuKwU+ffjKR6VywO8IT3b+fXX0jT1QcfBnwh5trkiicrCFkZ
         VTV7vYMx+WzjqIUQWu6K8g3YNiYYKzNd55YaDOvMXMDNOrbIs5HHL/tRyAwDoE/EVmYe
         SuwvrfQy8VxzHxVyR5Mux+c45Qqq0UziRbTSgkQijHti51BF5IGZvv+F8n5TRUEdOdn+
         +q/PyOlGNH7UphwfGxknJ77Psmw+B2dEUDgXXLKIjPd0GHCsLOMxZTAJaUCMBgn85WAZ
         yvhQ==
X-Forwarded-Encrypted: i=1; AJvYcCVSZf3ainI5vzP5ktFJUe47PYuDfO7KGFQU1MABGOiyxZyd0bvISGw5GUR50owBAUJVHHUNC1sS2q7ofz5JO3hgnDA=@lists.openembedded.org
X-Gm-Message-State: AOJu0YwfXLBF/2h6+7d01WF3Qesaq3vnfMe4HnOka2OEEp3teZiE8ALP
	ITZmnvPCz0STuQcRC85eOIbIvobr/I57/HM4La/817lCZyMGbkZ8HAMxkV9xITjAEQibgOBfvmT
	r32VbIiSZCL6gfodkPHG7b9Tezks=
X-Google-Smtp-Source: AGHT+IHYbkvJFXHhUm1yYLtE3YldAAvhSeWFP4VUmMSiGympfTRot5Qoqg+JxZmhoIhxau31dYVmBXgBLWcAib4s8PU=
X-Received: by 2002:a05:6820:4d07:b0:5c4:e036:e383 with SMTP id
 006d021491bc7-5d855bebee2mr3233742eaf.8.1723135520729; Thu, 08 Aug 2024
 09:45:20 -0700 (PDT)
MIME-Version: 1.0
References: <4453e069-6679-42ae-b3bb-cdd223bf9da1@gmail.com>
 <547021D2-496C-4944-BCDA-438EBD0B42E0@gmail.com> <CAMKF1srA8cZigcRuK6mecudctEjtv+NJQtBbqpZMirWdMRzujQ@mail.gmail.com>
 <sewubxpvgxzg52shb7erornf3llh7u4zuvpifiqz3hg53ekelw@axibx56xtnae>
In-Reply-To: <sewubxpvgxzg52shb7erornf3llh7u4zuvpifiqz3hg53ekelw@axibx56xtnae>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 8 Aug 2024 09:45:09 -0700
Message-ID: <CAMKF1spUQBUtq3miZ20aCRQFxEsigGSqkBujC61HwvWG6360OQ@mail.gmail.com>
Subject: Re: [oe] [meta-python][scarthgap][PATCH] python3-pydantic-core:
 upgrade 2.16.3 -> 2.18.1
To: Richard Leitner <dev@g0hl1n.net>
Cc: debrabander@gmail.com, akuster808 <akuster808@gmail.com>, 
	openembedded-devel@lists.openembedded.org, tim.orling@konsulko.com
Content-Type: multipart/alternative; boundary="0000000000009cf186061f2ec0a5"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 08 Aug 2024 16:45:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111677

--0000000000009cf186061f2ec0a5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 8, 2024 at 12:44=E2=80=AFAM Richard Leitner <dev@g0hl1n.net> wr=
ote:

> On Tue, Aug 06, 2024 at 01:09:10PM GMT, Khem Raj wrote:
> > On Mon, Aug 5, 2024 at 12:08=E2=80=AFAM Frank de Brabander via
> > lists.openembedded.org <debrabander=3Dgmail.com@lists.openembedded.org>
> > wrote:
> > >
> > >
> > >
> > > > Op 3 aug 2024 om 18:51 heeft akuster808 <akuster808@gmail.com> het
> volgende geschreven:
> > > >
> > > > =EF=BB=BF
> > > >
> > > >> On 7/31/24 4:07 AM, Frank de Brabander wrote:
> > > >> I was unaware of this discussion when I created the fix for master=
.
> > > >> Note that I've silenced the TMPDIR QA message, this still needs a
> > > >> proper fix in master as well.
> > > >>
> > > >> This indeed needs to be fixed in scarthgap as well, since the
> > > >> incompatible versions do break some code. My two cents for the
> available
> > > >> options:
> > > >>
> > > >>  - Revert pydantic upgrade (from 2.7.0 back to 2.6.4)
> > > >>  - Update pydantic-core to 2.18.1
> > > >>  - Use master (pydantic 2.7.3 and pydantic-core 2.18.4)
> > > >>
> > > >> Would only downgrade if this is the *only* allowed option accordin=
g
> to
> > > >> the LTS branch policy. Version 2.7.x includes new features compare=
d
> to
> > > >> 2.6.4. Removing these with a downgrade would violate the LTS patch
> policy
> > > >> of not merging "ABI/API breakage".
> > > >
> > > > We have had this type of situation with a pkg (A) update in master
> and then new lts was branched. We found out other later additional pkgs
> needed to updated to work with pkg (A). pydantic update was in Master
> before scarthgap was branched.
> > > >>
> > > >> Option 2 or 3 are my preferred choices and they fall within the
> > > >> "fixes for bugs" category of the LTS patch policy. Option 2 is the
> smallest
> > > >> change to fix the problem, but option 3 includes some additional
> upstream
> > > >> fixes with the update from 2.7.0 to 2.7.3.
> > > >
> > > > Master should be failing so if Master gets a revert of pydantic bac=
k
> to 2.6.4, then Scarthgap will follow. Is this an option? - Armin
> > >
> > > As far as I know master works now, so a revert would make no sense in
> that case.
> >
> > Hi Armin
> >
> > scarthgap is relatively new and I think I would be in favor of making
> > an exception for this one case.
>
> Hi Khem,
> thanks. Sounds good to me.
>
> Do you prefer going to the same pydantic{,-core} version as master,
> or stick with 2.7.0 and update only pydantic-core to 2.18.1?.
>

Best is to use the one that will work in tandem well if that would be newer
one from master than we might have to bring that too

>
> regards;rl
>

--0000000000009cf186061f2ec0a5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><br></div><div><br><div class=3D"gmail_quote"><div dir=3D=
"ltr" class=3D"gmail_attr">On Thu, Aug 8, 2024 at 12:44=E2=80=AFAM Richard =
Leitner &lt;<a href=3D"mailto:dev@g0hl1n.net">dev@g0hl1n.net</a>&gt; wrote:=
<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bord=
er-left:1px #ccc solid;padding-left:1ex">On Tue, Aug 06, 2024 at 01:09:10PM=
 GMT, Khem Raj wrote:<br>
&gt; On Mon, Aug 5, 2024 at 12:08=E2=80=AFAM Frank de Brabander via<br>
&gt; <a href=3D"http://lists.openembedded.org" rel=3D"noreferrer" target=3D=
"_blank">lists.openembedded.org</a> &lt;debrabander=3D<a href=3D"mailto:gma=
il.com@lists.openembedded.org" target=3D"_blank">gmail.com@lists.openembedd=
ed.org</a>&gt;<br>
&gt; wrote:<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; &gt; Op 3 aug 2024 om 18:51 heeft akuster808 &lt;<a href=3D"mailt=
o:akuster808@gmail.com" target=3D"_blank">akuster808@gmail.com</a>&gt; het =
volgende geschreven:<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; =EF=BB=BF<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;&gt; On 7/31/24 4:07 AM, Frank de Brabander wrote:<br>
&gt; &gt; &gt;&gt; I was unaware of this discussion when I created the fix =
for master.<br>
&gt; &gt; &gt;&gt; Note that I&#39;ve silenced the TMPDIR QA message, this =
still needs a<br>
&gt; &gt; &gt;&gt; proper fix in master as well.<br>
&gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt;&gt; This indeed needs to be fixed in scarthgap as well, sinc=
e the<br>
&gt; &gt; &gt;&gt; incompatible versions do break some code. My two cents f=
or the available<br>
&gt; &gt; &gt;&gt; options:<br>
&gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt;&gt;=C2=A0 - Revert pydantic upgrade (from 2.7.0 back to 2.6.=
4)<br>
&gt; &gt; &gt;&gt;=C2=A0 - Update pydantic-core to 2.18.1<br>
&gt; &gt; &gt;&gt;=C2=A0 - Use master (pydantic 2.7.3 and pydantic-core 2.1=
8.4)<br>
&gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt;&gt; Would only downgrade if this is the *only* allowed optio=
n according to<br>
&gt; &gt; &gt;&gt; the LTS branch policy. Version 2.7.x includes new featur=
es compared to<br>
&gt; &gt; &gt;&gt; 2.6.4. Removing these with a downgrade would violate the=
 LTS patch policy<br>
&gt; &gt; &gt;&gt; of not merging &quot;ABI/API breakage&quot;.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; We have had this type of situation with a pkg (A) update in =
master and then new lts was branched. We found out other later additional p=
kgs needed to updated to work with pkg (A). pydantic update was in Master b=
efore scarthgap was branched.<br>
&gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt;&gt; Option 2 or 3 are my preferred choices and they fall wit=
hin the<br>
&gt; &gt; &gt;&gt; &quot;fixes for bugs&quot; category of the LTS patch pol=
icy. Option 2 is the smallest<br>
&gt; &gt; &gt;&gt; change to fix the problem, but option 3 includes some ad=
ditional upstream<br>
&gt; &gt; &gt;&gt; fixes with the update from 2.7.0 to 2.7.3.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Master should be failing so if Master gets a revert of pydan=
tic back to 2.6.4, then Scarthgap will follow. Is this an option? - Armin<b=
r>
&gt; &gt;<br>
&gt; &gt; As far as I know master works now, so a revert would make no sens=
e in that case.<br>
&gt; <br>
&gt; Hi Armin<br>
&gt; <br>
&gt; scarthgap is relatively new and I think I would be in favor of making<=
br>
&gt; an exception for this one case.<br>
<br>
Hi Khem,<br>
thanks. Sounds good to me.<br>
<br>
Do you prefer going to the same pydantic{,-core} version as master,<br>
or stick with 2.7.0 and update only pydantic-core to 2.18.1?.<br>
</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">Best is to use t=
he one that will work in tandem well if that would be newer one from master=
 than we might have to bring that too=C2=A0</div><blockquote class=3D"gmail=
_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:=
1ex"><br>
regards;rl<br>
</blockquote></div></div>

--0000000000009cf186061f2ec0a5--

