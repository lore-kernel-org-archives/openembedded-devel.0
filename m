Return-Path: <geoffrey.vl@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8991C5B555
	for <webhook@archiver.kernel.org>; Fri,  6 Jun 2025 14:42:12 +0000 (UTC)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
 by mx.groups.io with SMTP id smtpd.web10.35213.1749220924817065568
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 06 Jun 2025 07:42:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NzawTzU6;
 spf=pass (domain: gmail.com, ip: 209.85.208.53, mailfrom: geoffrey.vl@gmail.com)
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-60700a745e5so1203879a12.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 06 Jun 2025 07:42:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749220923; x=1749825723; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=w0edCa8caHXrcbFUOSxl9gexdsnABFlfd1DKds1/ujw=;
        b=NzawTzU61d0HYjPf3VgQL7Tzgr27oQVk0Nouw4GhUM3SiMj++NJV5RZK1Fwg4+GWU2
         y98aPn7n71Xas9+/fR0b+VllBvig3TW2MeFoqP4ORetfHaM3OrmGYn+jG0S2QooSMp2B
         mCnrrOmGUv7WhLANmB3oYHNxL9uf3lH+M93GisLj7IPO0cgg+UCJiD4OnNXiLs+dDikg
         +IPzmmG9xdtQKc5eiPlgoQdjsFWUK6mleKE09+gCd/0g47pyND8TbAFc6Fpp3ZKImBPq
         feg/OmVhTXdbTzNK/kxXT3BUYJGB/iuzoQ90eWyXsSGgx0lFI5Lc2cvsbXUDVHrh1Ekl
         k/gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749220923; x=1749825723;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w0edCa8caHXrcbFUOSxl9gexdsnABFlfd1DKds1/ujw=;
        b=PdhjRpVaeEuFvQBafbXBtDmykiErGWTPneklGoUCFbZzbJrDfnl0iPLBvfgRHf3igm
         wlgViJDSXsSoGcTlESpQl1/Fn8uIgKT4PTnTYqt4gg4qYQyXi7VWhS7m0GK4ScwvnmRr
         eSFdVhh1QuGWZS09BblvKtFgepXSSRY1mpW9jlDJO9SOxus1AeGXSoDa/+P1twDus/tl
         8wu7YAVVR2hrWefL9b3RD9wBE/x0rJ66LNArrp5h7r+h4phDQMUvcTrMCGTZ8BEssceJ
         InL0gGzXnL3esl/4QKntYYneafwCCQuEPjDWpt/2RxvNGt5BsxPYHqN+xkIktkYbftKm
         oizw==
X-Gm-Message-State: AOJu0YwSnG3nQbtvnPfxs0F1V6zrHJXFMNQ27UpTjSkqq88TbF0tJ31/
	7DjbZG9aL+OZRpX+WzmDogQzxEwCeuVMV9bfSv1QBDtB+RYakuohjEcDOwmwtd63l2+lKLleoNx
	KYJpIcQXXMReGvfbCPt+LIoZHAPpkqis=
X-Gm-Gg: ASbGncuXOp1jDaVWB731KXQPkl9pFGYI6c7+7G/7jEzaJSbGg8oLvgiCSIQDz3GvRYA
	xhXi/t1tY3D8ErEigxkd3EmgYwZ+X74n3u+ot+xG18r7hoAgqNJOCPH8GrZl4cQ7y/bptvWPymR
	K8fLN82KGuXNyN6qjtH+x8Xj1VO864Mv5JZi22PC1hhNLayQ6AZCr9tFDRHObrFEXmKJCsoyo/e
	RIk
X-Google-Smtp-Source: AGHT+IEav4pXEHO8UhwmFXBTVZM2asV7gqUuFfUTnTrBEYArNYlSSnV66Z4K23fpr73nopHwlA4T+XsJXg3ATsbBk/U=
X-Received: by 2002:a05:6402:2792:b0:601:ad95:ca89 with SMTP id
 4fb4d7f45d1cf-60773ecd39bmr3045319a12.15.1749220922795; Fri, 06 Jun 2025
 07:42:02 -0700 (PDT)
MIME-Version: 1.0
References: <20250606135700.1689460-1-geoffrey.vanlandeghem@niko.eu> <2578857c-2b6f-45f0-bc7c-55cd80396b22@gmail.com>
In-Reply-To: <2578857c-2b6f-45f0-bc7c-55cd80396b22@gmail.com>
From: Geoffrey Van Landeghem <geoffrey.vl@gmail.com>
Date: Fri, 6 Jun 2025 16:41:51 +0200
X-Gm-Features: AX0GCFvmoZmE9UqLqJowa45msdyDCn3lv4jQ1G9ODSQWwcaeThBwPe1Dq-sohUY
Message-ID: <CABX3Wh4utbVU+sq+ERA874-VZY39tkBHS=YckQ-pjmMXojMxgQ@mail.gmail.com>
Subject: Re: [oe] [meta-oe][kirkstone][PATCH] monit: upgrade 5.32.0 -> 5.35.2
To: Gyorgy Sarvari <skandigraun@gmail.com>
Cc: openembedded-devel@lists.openembedded.org, 
	Geoffrey Van Landeghem <geoffrey.vanlandeghem@niko.eu>
Content-Type: multipart/alternative; boundary="000000000000bca8ba0636e83b26"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 06 Jun 2025 14:42:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117764

--000000000000bca8ba0636e83b26
Content-Type: text/plain; charset="UTF-8"

Thanks for reviewing.
Changes are actually backported from the master branch, hence the checksum
change.
I already assumed that skipping a few versions would be rather hard to get
accepted but I wanted to give it a shot anyway.
Regarding backporting, well we're only targeting kirkstone for a few more
months so that doesn't really pay off for us given the little effort it
takes to get a good working version (this patch).
Do you think we can still bump the monit version for scarthgap?

Op vr 6 jun 2025 om 16:29 schreef Gyorgy Sarvari <skandigraun@gmail.com>:

> On 6/6/25 15:57, Geoffrey Van Landeghem via lists.openembedded.org wrote:
> > Monit 5.32 seems to contain a bug where it runs its poll cycles much
> faster. This can be troublesome when setting up dependencies. See
> https://bitbucket.org/tildeslash/monit/issues/1131/service-with-many-dependencies-hits
> >
> > Signed-off-by: Geoffrey Van Landeghem <geoffrey.vanlandeghem@niko.eu>
> > ---
> >  .../monit/{monit_5.32.0.bb => monit_5.35.2.bb}            | 8 +++++---
> >  1 file changed, 5 insertions(+), 3 deletions(-)
> >  rename meta-oe/recipes-support/monit/{monit_5.32.0.bb =>
> monit_5.35.2.bb} (84%)
> >
> > diff --git a/meta-oe/recipes-support/monit/monit_5.32.0.bb
> b/meta-oe/recipes-support/monit/monit_5.35.2.bb
> > similarity index 84%
> > rename from meta-oe/recipes-support/monit/monit_5.32.0.bb
> > rename to meta-oe/recipes-support/monit/monit_5.35.2.bb
> > index e4ec9d5262..6ff74cf0d8 100644
> > --- a/meta-oe/recipes-support/monit/monit_5.32.0.bb
> > +++ b/meta-oe/recipes-support/monit/monit_5.35.2.bb
> > @@ -6,8 +6,8 @@ causal actions in error situations."
> >  HOMEPAGE = "http://mmonit.com/monit/"
> >
> >  LICENSE = "AGPL-3.0-only"
> > -LIC_FILES_CHKSUM = "file://COPYING;md5=ea116a7defaf0e93b3bb73b2a34a3f51
> \
> > -
> file://libmonit/COPYING;md5=2405f1c59ed1bf3714cebdb40162ce92"
> > +LIC_FILES_CHKSUM = "file://COPYING;md5=79ca9f26f1ecb1e377e90383109ede64
> \
> > +
> file://libmonit/COPYING;md5=44aaa0a664332e9568add09f1ddb01cb"
>
> I got 2 notes:
> 1. When the checksum of the license changes, it is useful to include in
> the commit message some notes why that is. Usually it is some minor
> formatting change, but sometimes the license changes outright between
> versions.
> 2. A bigger thing is, that generally this update is too big for a stable
> branch. Usually only bugfix release updates are allowed, not feature
> ones. Having the bugfix backported to 5.32, and including it as a patch
> would be a better approach.
>
> >
> >  SRC_URI = " \
> >       https://mmonit.com/monit/dist/monit-${PV}.tar.gz \
> > @@ -15,12 +15,14 @@ SRC_URI = " \
> >       file://monitrc \
> >  "
> >
> > -SRC_URI[sha256sum] =
> "1077052d4c4e848ac47d14f9b37754d46419aecbe8c9a07e1f869c914faf3216"
> > +SRC_URI[sha256sum] =
> "4dfef54329e63d9772a9e1c36ac99bc41173b79963dc0d8235f2c32f4b9e078f"
> >
> >  DEPENDS = "zlib bison-native libnsl2 flex-native openssl virtual/crypt"
> >
> >  inherit autotools-brokensep systemd update-rc.d
> >
> > +EXTRA_AUTORECONF += "-I config"
> > +
> >  PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'pam', d)}"
> >  PACKAGECONFIG[pam] = "--with-pam,--without-pam,libpam"
> >
> >
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#117762):
> https://lists.openembedded.org/g/openembedded-devel/message/117762
> > Mute This Topic: https://lists.openembedded.org/mt/113503536/6084445
> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> skandigraun@gmail.com]
> > -=-=-=-=-=-=-=-=-=-=-=-
> >
>
>

--000000000000bca8ba0636e83b26
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Thanks for reviewing.</div><div dir=3D"lt=
r">Changes are actually backported from the master branch, hence the checks=
um change.<br><div>I already assumed that skipping a few versions would be =
rather hard to get accepted but I wanted to give it a shot anyway.</div><di=
v>Regarding backporting, well we&#39;re only targeting=C2=A0kirkstone for a=
 few more months so that doesn&#39;t really pay off for us given the little=
 effort it takes to get a good working version (this patch).</div><div>Do y=
ou think we can still bump the monit version for=C2=A0scarthgap?</div></div=
></div><br><div class=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr=
" class=3D"gmail_attr">Op vr 6 jun 2025 om 16:29 schreef Gyorgy Sarvari &lt=
;<a href=3D"mailto:skandigraun@gmail.com">skandigraun@gmail.com</a>&gt;:<br=
></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;=
border-left:1px solid rgb(204,204,204);padding-left:1ex">On 6/6/25 15:57, G=
eoffrey Van Landeghem via <a href=3D"http://lists.openembedded.org" rel=3D"=
noreferrer" target=3D"_blank">lists.openembedded.org</a> wrote:<br>
&gt; Monit 5.32 seems to contain a bug where it runs its poll cycles much f=
aster. This can be troublesome when setting up dependencies. See <a href=3D=
"https://bitbucket.org/tildeslash/monit/issues/1131/service-with-many-depen=
dencies-hits" rel=3D"noreferrer" target=3D"_blank">https://bitbucket.org/ti=
ldeslash/monit/issues/1131/service-with-many-dependencies-hits</a><br>
&gt;<br>
&gt; Signed-off-by: Geoffrey Van Landeghem &lt;<a href=3D"mailto:geoffrey.v=
anlandeghem@niko.eu" target=3D"_blank">geoffrey.vanlandeghem@niko.eu</a>&gt=
;<br>
&gt; ---<br>
&gt;=C2=A0 .../monit/{<a href=3D"http://monit_5.32.0.bb" rel=3D"noreferrer"=
 target=3D"_blank">monit_5.32.0.bb</a> =3D&gt; <a href=3D"http://monit_5.35=
.2.bb" rel=3D"noreferrer" target=3D"_blank">monit_5.35.2.bb</a>}=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 8 +++++---<br>
&gt;=C2=A0 1 file changed, 5 insertions(+), 3 deletions(-)<br>
&gt;=C2=A0 rename meta-oe/recipes-support/monit/{<a href=3D"http://monit_5.=
32.0.bb" rel=3D"noreferrer" target=3D"_blank">monit_5.32.0.bb</a> =3D&gt; <=
a href=3D"http://monit_5.35.2.bb" rel=3D"noreferrer" target=3D"_blank">moni=
t_5.35.2.bb</a>} (84%)<br>
&gt;<br>
&gt; diff --git a/meta-oe/recipes-support/monit/<a href=3D"http://monit_5.3=
2.0.bb" rel=3D"noreferrer" target=3D"_blank">monit_5.32.0.bb</a> b/meta-oe/=
recipes-support/monit/<a href=3D"http://monit_5.35.2.bb" rel=3D"noreferrer"=
 target=3D"_blank">monit_5.35.2.bb</a><br>
&gt; similarity index 84%<br>
&gt; rename from meta-oe/recipes-support/monit/<a href=3D"http://monit_5.32=
.0.bb" rel=3D"noreferrer" target=3D"_blank">monit_5.32.0.bb</a><br>
&gt; rename to meta-oe/recipes-support/monit/<a href=3D"http://monit_5.35.2=
.bb" rel=3D"noreferrer" target=3D"_blank">monit_5.35.2.bb</a><br>
&gt; index e4ec9d5262..6ff74cf0d8 100644<br>
&gt; --- a/meta-oe/recipes-support/monit/<a href=3D"http://monit_5.32.0.bb"=
 rel=3D"noreferrer" target=3D"_blank">monit_5.32.0.bb</a><br>
&gt; +++ b/meta-oe/recipes-support/monit/<a href=3D"http://monit_5.35.2.bb"=
 rel=3D"noreferrer" target=3D"_blank">monit_5.35.2.bb</a><br>
&gt; @@ -6,8 +6,8 @@ causal actions in error situations.&quot;<br>
&gt;=C2=A0 HOMEPAGE =3D &quot;<a href=3D"http://mmonit.com/monit/" rel=3D"n=
oreferrer" target=3D"_blank">http://mmonit.com/monit/</a>&quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 LICENSE =3D &quot;AGPL-3.0-only&quot;<br>
&gt; -LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3Dea116a7defaf0e93b3bb7=
3b2a34a3f51 \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 file://libmonit/COPYING;md5=3D2405f1c59ed1bf3714cebdb40162ce92&quot;<br>
&gt; +LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D79ca9f26f1ecb1e377e90=
383109ede64 \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 file://libmonit/COPYING;md5=3D44aaa0a664332e9568add09f1ddb01cb&quot;<br>
<br>
I got 2 notes:<br>
1. When the checksum of the license changes, it is useful to include in<br>
the commit message some notes why that is. Usually it is some minor<br>
formatting change, but sometimes the license changes outright between<br>
versions.<br>
2. A bigger thing is, that generally this update is too big for a stable<br=
>
branch. Usually only bugfix release updates are allowed, not feature<br>
ones. Having the bugfix backported to 5.32, and including it as a patch<br>
would be a better approach.<br>
<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 SRC_URI =3D &quot; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"https://mmonit.com/monit/dist/mon=
it-$%7BPV%7D.tar.gz" rel=3D"noreferrer" target=3D"_blank">https://mmonit.co=
m/monit/dist/monit-${PV}.tar.gz</a> \<br>
&gt; @@ -15,12 +15,14 @@ SRC_URI =3D &quot; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0file://monitrc \<br>
&gt;=C2=A0 &quot;<br>
&gt;=C2=A0 <br>
&gt; -SRC_URI[sha256sum] =3D &quot;1077052d4c4e848ac47d14f9b37754d46419aecb=
e8c9a07e1f869c914faf3216&quot;<br>
&gt; +SRC_URI[sha256sum] =3D &quot;4dfef54329e63d9772a9e1c36ac99bc41173b799=
63dc0d8235f2c32f4b9e078f&quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 DEPENDS =3D &quot;zlib bison-native libnsl2 flex-native openssl =
virtual/crypt&quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 inherit autotools-brokensep systemd update-rc.d<br>
&gt;=C2=A0 <br>
&gt; +EXTRA_AUTORECONF +=3D &quot;-I config&quot;<br>
&gt; +<br>
&gt;=C2=A0 PACKAGECONFIG ??=3D &quot;${@bb.utils.filter(&#39;DISTRO_FEATURE=
S&#39;, &#39;pam&#39;, d)}&quot;<br>
&gt;=C2=A0 PACKAGECONFIG[pam] =3D &quot;--with-pam,--without-pam,libpam&quo=
t;<br>
&gt;=C2=A0 <br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#117762): <a href=3D"https://lists.openembedded.org=
/g/openembedded-devel/message/117762" rel=3D"noreferrer" target=3D"_blank">=
https://lists.openembedded.org/g/openembedded-devel/message/117762</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/11350353=
6/6084445" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.=
org/mt/113503536/6084445</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openem=
bedded.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.o=
rg</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
devel/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedde=
d.org/g/openembedded-devel/unsub</a> [<a href=3D"mailto:skandigraun@gmail.c=
om" target=3D"_blank">skandigraun@gmail.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;<br>
<br>
</blockquote></div>

--000000000000bca8ba0636e83b26--

