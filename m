Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
 by mx.groups.io with SMTP id smtpd.web11.20544.1599740070754270899
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 10 Sep 2020 05:14:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ossystems-com-br.20150623.gappssmtp.com header.s=20150623 header.b=wSOh7IIM;
 spf=pass (domain: ossystems.com.br, ip: 209.85.208.181, mailfrom: fabio.berton@ossystems.com.br)
Received: by mail-lj1-f181.google.com with SMTP id s205so7842969lja.7
        for <openembedded-devel@lists.openembedded.org>; Thu, 10 Sep 2020 05:14:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=P+CQ6nTrr33Zd6k5GNQ160AD+otWC14kIMmKRJbpQrk=;
        b=wSOh7IIMY1X/2x1wNuSWd/Os0sLik3t031O4sgyrglDDTclzIbS1ErxFYOEFxKlLcL
         Y9sX6zZ0OG8ecjSzr0ocnD5ez1UWhgIjwOhXb1fJdNgR1xhGhpDs/1R1z1tqJEq5517a
         7wTGxCEb72xAdNmw60pQkhT10RuAHcHP7Q3aDskBUnWW7BfSFnLHQJ0uA7KDEPmEeweq
         BwbULhKDoO/R+wIq7LtqquZbfTjJTpX3C3MMOwvbBRbjJvQx1jhe6VB6mbysCPfqMVz+
         /SGKRo7sCxXlpMUncZgjt0jf1hgejEsS74o4TOUgP7sF5aufB6RF8GTvWOsH+6kmqR8N
         D4Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=P+CQ6nTrr33Zd6k5GNQ160AD+otWC14kIMmKRJbpQrk=;
        b=N1/WprM+nGIe90uhnA4X/tg2sxByY9HEsvLityyd881smE/ORUfXB3ZNot008ayXwM
         vlNR719LJT/+epB4ZgFu6phwq8yg4svPrJifRODM55w1yd5ZZP5jT394GCCHAqK04PCZ
         TyUAGM9rFy08vA4DPp95KMWJpqP2SvIfF590XCjH4xdDK52VxYZMGIvpqYm8bcVwMn3Q
         lk0DINLtqYQILgq/An7MnJ1XtbS59/lf0xfBFPk/I9GXD0IcLLINyJioju1UCwWkRxkL
         TXey4NpEU3puGSRCBPdViQwdj/MTEo88TP1/fU7xHU68C+YJhQfMjkh0NFmOYuaLPqK/
         IdQQ==
X-Gm-Message-State: AOAM532Lcd00dok1MszQRR3P3IwxRyPAtuMMSZraiznYJDoo3S8Fw0RA
	J/KQaDhp4K6Y+0H7FhTYAFJ1aqMPv1B86s6Z5dH06g==
X-Google-Smtp-Source: ABdhPJyfjjxI+mvGpIM7zzQqP4fVAmu48CZAIlrJID2wLNVXb92+1nKzJlhJBbXxB6kL5vUWwdjL9kwwxwbKPuMEP98=
X-Received: by 2002:a2e:85a:: with SMTP id g26mr4400711ljd.294.1599740068720;
 Thu, 10 Sep 2020 05:14:28 -0700 (PDT)
MIME-Version: 1.0
References: <20200909122322.12899-1-fabio.berton@ossystems.com.br> <CAMKF1srzvFAy_OkLwvxK=Q1R2+FM7FNVUE2820VBtR=CCUzQrQ@mail.gmail.com>
In-Reply-To: <CAMKF1srzvFAy_OkLwvxK=Q1R2+FM7FNVUE2820VBtR=CCUzQrQ@mail.gmail.com>
From: "Fabio Berton" <fabio.berton@ossystems.com.br>
Date: Thu, 10 Sep 2020 09:14:12 -0300
Message-ID: <CAAPZna2ZYg8WDORJQAK2WkpN9aA8VQzhNB2VWcqXH52iwo5CVg@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH 1/2] modemmanager: Update 1.12.12 -> 1.14.2
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000087872d05aef48292"

--00000000000087872d05aef48292
Content-Type: text/plain; charset="UTF-8"

Hi Khem!

I'll check this.

Thanks!

On Thu, Sep 10, 2020 at 5:24 AM Khem Raj <raj.khem@gmail.com> wrote:

> clang  build ends up erroring out
>
> https://errors.yoctoproject.org/Errors/Details/498792/
>
> It seems --enable-more-warnings is gone in new release but then maybe
> it wont compile with clang.
>
> On Wed, Sep 9, 2020 at 5:23 AM Fabio Berton
> <fabio.berton@ossystems.com.br> wrote:
> >
> > Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
> > ---
> >  .../{modemmanager_1.12.12.bb => modemmanager_1.14.2.bb}         | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >  rename meta-oe/recipes-connectivity/modemmanager/{
> modemmanager_1.12.12.bb => modemmanager_1.14.2.bb} (95%)
> >
> > diff --git a/meta-oe/recipes-connectivity/modemmanager/
> modemmanager_1.12.12.bb b/meta-oe/recipes-connectivity/modemmanager/
> modemmanager_1.14.2.bb
> > similarity index 95%
> > rename from meta-oe/recipes-connectivity/modemmanager/
> modemmanager_1.12.12.bb
> > rename to meta-oe/recipes-connectivity/modemmanager/
> modemmanager_1.14.2.bb
> > index b0ab46f3f..6b5e73ba4 100644
> > --- a/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.12.12.bb
> > +++ b/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.14.2.bb
> > @@ -12,7 +12,7 @@ inherit gnomebase gettext systemd vala
> gobject-introspection bash-completion
> >  DEPENDS = "glib-2.0 libgudev intltool-native libxslt-native"
> >
> >  SRC_URI = "
> http://www.freedesktop.org/software/ModemManager/ModemManager-${PV}.tar.xz
> "
> > -SRC_URI[sha256sum] =
> "a4fc4b33c0e8ae9372885f86fa033f3c1a89a76cd59a3458670eff1824222a3d"
> > +SRC_URI[sha256sum] =
> "5fb5553aecd6eb9d6d8ecd130a24f3461e5f93c5f91a0e4ae0508b5228e8b0be"
> >  S = "${WORKDIR}/ModemManager-${PV}"
> >
> >  PACKAGECONFIG ??= "mbim qmi \
> > --
> > 2.27.0
> >
> > 
>

--00000000000087872d05aef48292
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-family:monospac=
e,monospace;font-size:small">Hi Khem!</div><div class=3D"gmail_default" sty=
le=3D"font-family:monospace,monospace;font-size:small"><br></div><div class=
=
=3D"gmail_default" style=3D"font-family:monospace,monospace;font-size:smal=
l">I&#39;ll check this.</div><div class=3D"gmail_default" style=3D"font-fam=
ily:monospace,monospace;font-size:small"><br></div><div class=3D"gmail_defa=
ult" style=3D"font-family:monospace,monospace;font-size:small">Thanks!</div=
></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr"=
>On Thu, Sep 10, 2020 at 5:24 AM Khem Raj &lt;<a href=3D"mailto:raj.khem@gm=
ail.com">raj.khem@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gm=
ail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,=
204,204);padding-left:1ex">clang=C2=A0 build ends up erroring out<br>
<br>
<a href=3D"https://errors.yoctoproject.org/Errors/Details/498792/" rel=3D"=
noreferrer" target=3D"_blank">https://errors.yoctoproject.org/Errors/Detail=
s/498792/</a><br>
<br>
It seems --enable-more-warnings is gone in new release but then maybe<br>
it wont compile with clang.<br>
<br>
On Wed, Sep 9, 2020 at 5:23 AM Fabio Berton<br>
&lt;<a href=3D"mailto:fabio.berton@ossystems.com.br" target=3D"_blank">fab=
io.berton@ossystems.com.br</a>&gt; wrote:<br>
&gt;<br>
&gt; Signed-off-by: Fabio Berton &lt;<a href=3D"mailto:fabio.berton@ossyst=
ems.com.br" target=3D"_blank">fabio.berton@ossystems.com.br</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 .../{<a href=3D"http://modemmanager_1.12.12.bb" rel=3D"noreferr=
er" target=3D"_blank">modemmanager_1.12.12.bb</a> =3D&gt; <a href=3D"http:/=
/modemmanager_1.14.2.bb" rel=3D"noreferrer" target=3D"_blank">modemmanager_=
1.14.2.bb</a>}=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-<br>
&gt;=C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt;=C2=A0 rename meta-oe/recipes-connectivity/modemmanager/{<a href=3D"ht=
tp://modemmanager_1.12.12.bb" rel=3D"noreferrer" target=3D"_blank">modemman=
ager_1.12.12.bb</a> =3D&gt; <a href=3D"http://modemmanager_1.14.2.bb" rel=
=3D"noreferrer" target=3D"_blank">modemmanager_1.14.2.bb</a>} (95%)<br>
&gt;<br>
&gt; diff --git a/meta-oe/recipes-connectivity/modemmanager/<a href=3D"htt=
p://modemmanager_1.12.12.bb" rel=3D"noreferrer" target=3D"_blank">modemmana=
ger_1.12.12.bb</a> b/meta-oe/recipes-connectivity/modemmanager/<a href=3D"h=
ttp://modemmanager_1.14.2.bb" rel=3D"noreferrer" target=3D"_blank">modemman=
ager_1.14.2.bb</a><br>
&gt; similarity index 95%<br>
&gt; rename from meta-oe/recipes-connectivity/modemmanager/<a href=3D"http=
://modemmanager_1.12.12.bb" rel=3D"noreferrer" target=3D"_blank">modemmanag=
er_1.12.12.bb</a><br>
&gt; rename to meta-oe/recipes-connectivity/modemmanager/<a href=3D"http:/=
/modemmanager_1.14.2.bb" rel=3D"noreferrer" target=3D"_blank">modemmanager_=
1.14.2.bb</a><br>
&gt; index b0ab46f3f..6b5e73ba4 100644<br>
&gt; --- a/meta-oe/recipes-connectivity/modemmanager/<a href=3D"http://mod=
emmanager_1.12.12.bb" rel=3D"noreferrer" target=3D"_blank">modemmanager_1.1=
2.12.bb</a><br>
&gt; +++ b/meta-oe/recipes-connectivity/modemmanager/<a href=3D"http://mod=
emmanager_1.14.2.bb" rel=3D"noreferrer" target=3D"_blank">modemmanager_1.14=
.2.bb</a><br>
&gt; @@ -12,7 +12,7 @@ inherit gnomebase gettext systemd vala gobject-intr=
ospection bash-completion<br>
&gt;=C2=A0 DEPENDS =3D &quot;glib-2.0 libgudev intltool-native libxslt-nat=
ive&quot;<br>
&gt;<br>
&gt;=C2=A0 SRC_URI =3D &quot;<a href=3D"http://www.freedesktop.org/softwar=
e/ModemManager/ModemManager-$%7BPV%7D.tar.xz" rel=3D"noreferrer" target=3D"=
_blank">http://www.freedesktop.org/software/ModemManager/ModemManager-${PV}=
.tar.xz</a>&quot;<br>
&gt; -SRC_URI[sha256sum] =3D &quot;a4fc4b33c0e8ae9372885f86fa033f3c1a89a76=
cd59a3458670eff1824222a3d&quot;<br>
&gt; +SRC_URI[sha256sum] =3D &quot;5fb5553aecd6eb9d6d8ecd130a24f3461e5f93c=
5f91a0e4ae0508b5228e8b0be&quot;<br>
&gt;=C2=A0 S =3D &quot;${WORKDIR}/ModemManager-${PV}&quot;<br>
&gt;<br>
&gt;=C2=A0 PACKAGECONFIG ??=3D &quot;mbim qmi \<br>
&gt; --<br>
&gt; 2.27.0<br>
&gt;<br>
&gt; <br>
</blockquote></div>

--00000000000087872d05aef48292--
