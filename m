Return-Path: <adam.duskett@amarulasolutions.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28385CD4851
	for <webhook@archiver.kernel.org>; Tue, 19 May 2026 11:03:40 +0000 (UTC)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18486.1779188618580558899
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 19 May 2026 04:03:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@amarulasolutions.com header.s=google header.b=qhU8kbzt;
 spf=pass (domain: amarulasolutions.com, ip: 209.85.208.47, mailfrom: adam.duskett@amarulasolutions.com)
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6718025956aso572645a12.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 19 May 2026 04:03:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779188617; cv=none;
        d=google.com; s=arc-20240605;
        b=QbGCnpVzmckh/0rhs+i2d6msyhZuTfrPsEPHpGHwpwCp8i3zEfeU52hOnJFsLUS1cK
         Vz5TAoIW0NA7Q1xEJTGnQj6mWn1tsV/QQOEzS+pj3pyYP69SKC7a6M2Vu+zXQ5bXqqDm
         AC4AiRxOoe4VviLoVzmejd1Hr2baZ4N4IM04r2aUwgP/i5hKgKL7C3uRfT3KbeylZDr3
         E0GQgEi43BQPomtyHqM6m6cxVFKDr1DoLpUwGYUVqWxy8Khsuk7EvBZPsdOb1cLtz3rf
         RR9kiAHNLpvJS5wHy6LeaXvG1eXhl0sLxraDcj3hFcUzSMbH0cGYQ9fGiPyft2AssCwJ
         5p4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=FDcuy7JrOa7PRP6C1oQOmOGUONmU91gYzSGYr5UXtUY=;
        fh=mwfXiz4eaXsgZh59g0nHyKqrzEt8v99HNbERrcfmFfc=;
        b=OT5vmW1obD6tl0Mo0Z20cJm6ns//xb+UVt/cg/Vir5LIUbZ5jPHapvEt2gTKj8QHMK
         PuQTymoIHJpNyGN8+0Dt9DcCPhhu9fNotMmhqNEGwvI3EQcfmt7O1iEiQYr8HXHc6Wuz
         Ru9kXkD3aO64mnRND9f77/iVbVHn9ARAo4Lbh8VoMPZROtgBRbyjImlEbIc961ul0B8p
         b2xU11iJFqkbHtZmVn9OlrEnaNlEj0sTBUlhEYHHpSvmgSRJfCX9bkheJ8Cw2KJWw9Q/
         CxovhuUP5J959ZV8DnmT0ZrsioTroSXb4sJoqXJ7UeD9SuRIpLBM5qbWuxLe54xpo0TN
         idBw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1779188617; x=1779793417; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=FDcuy7JrOa7PRP6C1oQOmOGUONmU91gYzSGYr5UXtUY=;
        b=qhU8kbzt2UoWf0KVPiALN5muTRVyH3286isQIwDjPMGpTgDH+o5kfzjSIRYI5APVrw
         pBcfcucIxOOxkxaYT6fHSgV/xcJvVca+OP2836R0DzaHBz28/t6rJ5bouKR5ZZ69Hmfs
         MUKAh4NhqKi9csMPCiN8ikINO0dTZHMDBZE34=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779188617; x=1779793417;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FDcuy7JrOa7PRP6C1oQOmOGUONmU91gYzSGYr5UXtUY=;
        b=g8zlXxOIfpuDgqMrLZNVeL8bMRDOHatf3QBcZZhDx9y7ZHB6Hff0uKCZjHvXR0NZ1d
         ibc1ZO6VIQDltH/9YkNmwWzcnEN4y0G7V5OW2uTVjc3v4BW+2gAMtF+GaH6QrMLqTnav
         7gzn1LDSJQggtQYh4G0dRGo8Jd+G8mIS1SjBTckVCo4ZW24QNtCZun5KmeU6+hTNZXFW
         w6AUXqBHYhFN1ah/K5XwmHxTINHtnqkEeDBJ/66v5D0RaJvgbcR6sFFFv3pFgWUL8uSE
         9Gxa6UP2ncDYw0ULgr4ve3rWsiwojqHbAsoTKAuuBqHtmQURTi1QymOXQY+8G03YAzMi
         H4bA==
X-Gm-Message-State: AOJu0YwMuMuBBPb2aql7DWCDEhEg+OQKCUxI+KK5IvnTYfbsS6nBUyma
	6RM3/5EMM/BkGbBWeLGaWoftnImSlIADB3ORx9E1WIok8yUhrLCU/ljZEa43OrjS2CrL1bqNtac
	mZMkMfcakLEhWiDKt66yqSj1VyQJa0jH9wK0f+L+94A==
X-Gm-Gg: Acq92OEm7ITQltZj/b1OlnQeYDFOjvS9lmi1JzxYlRqHAFVK68ppUvOfbTx+6rLIG85
	j4sdIOhKEtELnINHviypqafpxtuyxtfDQtIqjwcIUKeTphAwY8wFxhYE5WXXrE4eUhsTvE6k8qT
	WlO9RqNrFyTkswXTaLW2uhWX6/aDxz/Cl88fTvnX5FuJYjUThCeygLKlcN8frbVcMFExwlDiwd6
	pUJRRwHbKdepwB2u8b8nS6sxghmdg97kongM1zxRazSIkkDQW4QmwoQmxMe58KYY3DbYkJVDc4B
	1hBR0uWyqFPQC2iZjb8uVZ7dtZl7wycB4JcnjK1RbWXEFmwvDOIieZNeJ9tDQVll18UULRmD
X-Received: by 2002:a05:6402:a547:10b0:670:2678:6815 with SMTP id
 4fb4d7f45d1cf-683bd582861mr3115921a12.7.1779188616661; Tue, 19 May 2026
 04:03:36 -0700 (PDT)
MIME-Version: 1.0
References: <20260518101712.2714997-1-adam.duskett@amarulasolutions.com> <agtOrklE5nDU15te@navimatix.de>
In-Reply-To: <agtOrklE5nDU15te@navimatix.de>
From: Adam Duskett <adam.duskett@amarulasolutions.com>
Date: Tue, 19 May 2026 13:03:25 +0200
X-Gm-Features: AVHnY4KvAOWHGM4CTPKDFogA2CrwCfNJTbMfZfC7Z7ra4HFvx9sU_FomM3Lv3HU
Message-ID: <CAHDQB6MUvC89-ihMWEADKo3-aUnZLfOrBdHm5VV-ReTTozR+xw@mail.gmail.com>
Subject: Re: [oe] [PATCH 1/1] chrony: add group argument to useradd command
To: =?UTF-8?B?SsO2cmcgU29tbWVy?= <joerg.sommer@navimatix.de>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000007c2577065229a13e"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 May 2026 11:03:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127062

--0000000000007c2577065229a13e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi J=C3=B6rg;

On Mon, May 18, 2026 at 7:40=E2=80=AFPM J=C3=B6rg Sommer <joerg.sommer@navi=
matix.de>
wrote:

> Adam Duskett via lists.openembedded.org schrieb am Mo 18. Mai, 12:17
> (+0200):
> > diff --git a/meta-networking/recipes-support/chrony/chrony_4.8.bb
> b/meta-networking/recipes-support/chrony/chrony_4.8.bb
> > index a7fc73e081..837f2e073f 100644
> > --- a/meta-networking/recipes-support/chrony/chrony_4.8.bb
> > +++ b/meta-networking/recipes-support/chrony/chrony_4.8.bb
> > @@ -47,7 +47,7 @@ inherit update-rc.d systemd pkgconfig
> >  # Add chronyd user if privdrop packageconfig is selected
> >  inherit_defer ${@bb.utils.contains('PACKAGECONFIG', 'privdrop',
> 'useradd', '', d)}
> >  USERADD_PACKAGES =3D "${@bb.utils.contains('PACKAGECONFIG', 'privdrop'=
,
> '${PN}', '', d)}"
> > -USERADD_PARAM:${PN} +=3D "${@bb.utils.contains('PACKAGECONFIG',
> 'privdrop', '--system -d / -M --shell /sbin/nologin chronyd;', '', d)}"
> > +USERADD_PARAM:${PN} +=3D "${@bb.utils.contains('PACKAGECONFIG',
> 'privdrop', '--system -d / -M -g chronyd --shell /sbin/nologin chronyd;',
> '', d)}"
>
> Is it possible to use ${sbindir} here?
>
> Yes it is possible, but this patch is about the group and not about
/sbin/nologin.
One patch should do one thing :)

> --
> Navimatix GmbH           T: 03641 - 327 99 0
> Tatzendpromenade 2       F: 03641 - 526 306
> 07745 Jena               www.navimatix.de
>
> Gesch=C3=A4ftsf=C3=BChrer: Steffen Sp=C3=A4the, Jan Rommeley
> Registergericht: Amtsgericht Jena, HRB 501480
>

--0000000000007c2577065229a13e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div>Hi=C2=A0J=C3=B6rg;</div><div><br></d=
iv></div><div class=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" =
class=3D"gmail_attr">On Mon, May 18, 2026 at 7:40=E2=80=AFPM J=C3=B6rg Somm=
er &lt;<a href=3D"mailto:joerg.sommer@navimatix.de">joerg.sommer@navimatix.=
de</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">Adam Duskett via <a href=3D"http://lists.openembedded.org" rel=3D"norefer=
rer" target=3D"_blank">lists.openembedded.org</a> schrieb am Mo 18. Mai, 12=
:17 (+0200):<br>
&gt; diff --git a/meta-networking/recipes-support/chrony/<a href=3D"http://=
chrony_4.8.bb" rel=3D"noreferrer" target=3D"_blank">chrony_4.8.bb</a> b/met=
a-networking/recipes-support/chrony/<a href=3D"http://chrony_4.8.bb" rel=3D=
"noreferrer" target=3D"_blank">chrony_4.8.bb</a><br>
&gt; index a7fc73e081..837f2e073f 100644<br>
&gt; --- a/meta-networking/recipes-support/chrony/<a href=3D"http://chrony_=
4.8.bb" rel=3D"noreferrer" target=3D"_blank">chrony_4.8.bb</a><br>
&gt; +++ b/meta-networking/recipes-support/chrony/<a href=3D"http://chrony_=
4.8.bb" rel=3D"noreferrer" target=3D"_blank">chrony_4.8.bb</a><br>
&gt; @@ -47,7 +47,7 @@ inherit update-rc.d systemd pkgconfig<br>
&gt;=C2=A0 # Add chronyd user if privdrop packageconfig is selected<br>
&gt;=C2=A0 inherit_defer ${@bb.utils.contains(&#39;PACKAGECONFIG&#39;, &#39=
;privdrop&#39;, &#39;useradd&#39;, &#39;&#39;, d)}<br>
&gt;=C2=A0 USERADD_PACKAGES =3D &quot;${@bb.utils.contains(&#39;PACKAGECONF=
IG&#39;, &#39;privdrop&#39;, &#39;${PN}&#39;, &#39;&#39;, d)}&quot;<br>
&gt; -USERADD_PARAM:${PN} +=3D &quot;${@bb.utils.contains(&#39;PACKAGECONFI=
G&#39;, &#39;privdrop&#39;, &#39;--system -d / -M --shell /sbin/nologin chr=
onyd;&#39;, &#39;&#39;, d)}&quot;<br>
&gt; +USERADD_PARAM:${PN} +=3D &quot;${@bb.utils.contains(&#39;PACKAGECONFI=
G&#39;, &#39;privdrop&#39;, &#39;--system -d / -M -g chronyd --shell /sbin/=
nologin chronyd;&#39;, &#39;&#39;, d)}&quot;<br>
<br>
Is it possible to use ${sbindir} here?<br>
<br></blockquote><div>Yes it is possible, but this patch is about the group=
 and not about /sbin/nologin.</div><div>One patch should do one thing :)=C2=
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">
-- <br>
Navimatix GmbH=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0T: 03641 - 327 99 0<=
br>
Tatzendpromenade 2=C2=A0 =C2=A0 =C2=A0 =C2=A0F: 03641 - 526 306<br>
07745 Jena=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D=
"http://www.navimatix.de" rel=3D"noreferrer" target=3D"_blank">www.navimati=
x.de</a><br>
<br>
Gesch=C3=A4ftsf=C3=BChrer: Steffen Sp=C3=A4the, Jan Rommeley<br>
Registergericht: Amtsgericht Jena, HRB 501480<br>
</blockquote></div></div>

--0000000000007c2577065229a13e--

