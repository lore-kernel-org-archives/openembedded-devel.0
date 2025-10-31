Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4175ECCF9FE
	for <webhook@archiver.kernel.org>; Fri, 31 Oct 2025 13:45:48 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web11.15775.1761918341138801543
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 31 Oct 2025 06:45:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=aCyHa6EI;
 spf=pass (domain: smile.fr, ip: 209.85.221.53, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-429c20ac820so515471f8f.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 31 Oct 2025 06:45:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1761918339; x=1762523139; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=G1MPgnt2a14sB7WoBnlyyf2oHJnz5hfJSfCLiq1OeSQ=;
        b=aCyHa6EI86Q3mr7ZGmEKrEIATkLzgKERKzlJnyXtiBYUpYtXT5LcFie96QIVqpgEL1
         yuy83VV/Hy3aDZb4ie/tVPCO+1lgSi0xMhxsIyTR4OfdXr1Rzl7FLoZU/TMH7QUiCsB3
         ghkLIkDr1tb7wPVz7Ja2sHmsFTsVtnmUJjx8g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761918339; x=1762523139;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G1MPgnt2a14sB7WoBnlyyf2oHJnz5hfJSfCLiq1OeSQ=;
        b=H+vZ7QtxW040+Ka+Is37LBJ3sTKAf2Knu+RgCSnac3xRFIUvdDf7e6RW82Uk/ZtuGG
         9jaDbgeIy0oVgd5H3Eb995fK+P6Kfe9bjF+rQ8K1kWdZYG0WmWdicBBDltHk0WNXA3S/
         gnbGdhYlwFeC2kMDHAJy7oR3nFqH7K7wm4cz9scoZkpqAaUrMAZsFu/XKHTeneae/wIX
         t++KWTJmk1L4g/ORajtgLxbpGUg0gZIV/XuZ8kvFOppV2Jsc8Zai15xse9irfGhDpMUO
         MV+1ZfxeJRODKXyiyUzfmfnETRi0rXDFefTXWDpkKjolTCh9pw9R7oWnEViYPbFk6xhZ
         hy/A==
X-Forwarded-Encrypted: i=1; AJvYcCXofZRIxOHWO3auxhNmNOytOBp2b5EmXndnGIZ5EPSDCpQF+vKjvYbQDP/9/qBDz8ISX0MuTp7qiwX3WRv+yHg2OAM=@lists.openembedded.org
X-Gm-Message-State: AOJu0YwaGE8RMOc5Xr4cDZGdBQuZ9J+sMUhj3PMo4izKYDvI8yABHeln
	aw1l9yhFVLlL+e33zxXfKvBbAjHRUjY7iYAGnQ2V64P15CbkhM+PkoHpia9jmOg1BzZBHOTaPvi
	8OSOxbxr+ltjdvFfVqyACxbERpdsTIqXxMTj7ooVleQ==
X-Gm-Gg: ASbGncsLWAOX0OetuH8BMiHt8IEeYH/8e7h2c2/awsDXlpnE82xwZ4solGfKEzXlRtS
	LBRfTlsTHh5PSJKCk2eDhbU59ELbvvwYBa7vKJXfSeydqz5EwwhkpcuRZizXhXr5rERpNuZfwgT
	7oLiGkz0s8jixJEecA3tQb2Fr3ux9z1txqawxJL2TVDNt0k0mxiONIlpdSdVpSrdT8+RGMhQKez
	7ol+zEXYoRSwfZDMtuUsbr4T+Id5lw9W1CkrCKMCRFi0SOg+7fz0CMqHTlciw+r7ywYk008N0qI
	owAuQYPQ1e07IBEi1uLzOI0=
X-Google-Smtp-Source: AGHT+IH2rrwC3asF2JiF9far+1sEhWCarHWmB1jx/O5ggVC4EAOj5gzEjVW0K9+Q/uEGBj445w6dKJyV3reaE6LBlpA=
X-Received: by 2002:a05:6000:430d:b0:428:3cff:3240 with SMTP id
 ffacd0b85a97d-429bd6832ffmr2473741f8f.1.1761918339194; Fri, 31 Oct 2025
 06:45:39 -0700 (PDT)
MIME-Version: 1.0
References: <20251023144351.264756-1-skandigraun@gmail.com> <4248C252-5AC4-4D04-B9D6-B71509890D3A@arm.com>
In-Reply-To: <4248C252-5AC4-4D04-B9D6-B71509890D3A@arm.com>
From: Yoann Congal <yoann.congal@smile.fr>
Date: Fri, 31 Oct 2025 14:45:24 +0100
X-Gm-Features: AWmQ_bkf3_m63jhKHaVaU4gH1CFGj3fQxvipwGz_zcndG6FM14Z4OSajWl_tiM4
Message-ID: <CAMSfU+5oOg4FyOa6+BEz2ci2+4wVhXXg=9CVB63XQJEN88j2eA@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH 1/2] psqlodbc: upgrade 16.00.0000 -> 17.00.0006
To: Ross Burton <ross.burton@arm.com>
Cc: Gyorgy Sarvari <skandigraun@gmail.com>, 
	OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000bb399a0642749498"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 31 Oct 2025 13:45:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121234

--000000000000bb399a0642749498
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le ven. 31 oct. 2025 =C3=A0 14:35, Ross Burton via lists.openembedded.org
<ross.burton=3Darm.com@lists.openembedded.org> a =C3=A9crit :

> On 23 Oct 2025, at 15:43, Gyorgy Sarvari via lists.openembedded.org
> <skandigraun=3Dgmail.com@lists.openembedded.org> wrote:
> >
> > -SRC_URI =3D "
> http://ftp.postgresql.org/pub/odbc/versions.old/src/${BPN}-${PV}.tar.gz \
> > +PV_WITH_USCORE =3D "${@d.getVar('PV').replace('.', '_')}"
> > +SRC_URI =3D "git://
> github.com/postgresql-interfaces/psqlodbc.git;protocol=3Dhttps;branch=3Dm=
ain;tag=3DREL-${PV_WITH_USCORE}
> <http://github.com/postgresql-interfaces/psqlodbc.git;protocol=3Dhttps;br=
anch=3Dmain;tag=3DREL-$%7BPV_WITH_USCORE%7D>
> \
>
> Note that this recipe doesn=E2=80=99t set SRCREV, so this is now doing a =
remote
> tag lookup on every parse.
>

Nice catch, this is most likely what did break the meta-oe-mirror test :
https://autobuilder.yoctoproject.org/valkyrie/#/builders/82/builds/494/step=
s/17/logs/errors

Maybe we need to add a recipe qa warning about this...


> Ross
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#121232):
> https://lists.openembedded.org/g/openembedded-devel/message/121232
> Mute This Topic: https://lists.openembedded.org/mt/115911777/4316185
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> yoann.congal@smile.fr]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000bb399a0642749498
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><br><div class=3D"gmail_quote gmail_quote_co=
ntainer"><div dir=3D"ltr" class=3D"gmail_attr">Le ven. 31 oct. 2025 =C3=A0 =
14:35, Ross Burton via <a href=3D"http://lists.openembedded.org">lists.open=
embedded.org</a> &lt;ross.burton=3D<a href=3D"mailto:arm.com@lists.openembe=
dded.org">arm.com@lists.openembedded.org</a>&gt; a =C3=A9crit=C2=A0:<br></d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left:1px solid rgb(204,204,204);padding-left:1ex">On 23 Oct 2025, at 15:=
43, Gyorgy Sarvari via <a href=3D"http://lists.openembedded.org" rel=3D"nor=
eferrer noreferrer" target=3D"_blank">lists.openembedded.org</a> &lt;skandi=
graun=3D<a href=3D"mailto:gmail.com@lists.openembedded.org" target=3D"_blan=
k" rel=3D"noreferrer">gmail.com@lists.openembedded.org</a>&gt; wrote:<br>
&gt; <br>
&gt; -SRC_URI =3D &quot;<a href=3D"http://ftp.postgresql.org/pub/odbc/versi=
ons.old/src/$%7BBPN%7D-$%7BPV%7D.tar.gz" rel=3D"noreferrer noreferrer" targ=
et=3D"_blank">http://ftp.postgresql.org/pub/odbc/versions.old/src/${BPN}-${=
PV}.tar.gz</a> \<br>
&gt; +PV_WITH_USCORE =3D &quot;${@d.getVar(&#39;PV&#39;).replace(&#39;.&#39=
;, &#39;_&#39;)}&quot;<br>
&gt; +SRC_URI =3D &quot;git://<a href=3D"http://github.com/postgresql-inter=
faces/psqlodbc.git;protocol=3Dhttps;branch=3Dmain;tag=3DREL-$%7BPV_WITH_USC=
ORE%7D" rel=3D"noreferrer noreferrer" target=3D"_blank">github.com/postgres=
ql-interfaces/psqlodbc.git;protocol=3Dhttps;branch=3Dmain;tag=3DREL-${PV_WI=
TH_USCORE}</a> \<br>
<br>
Note that this recipe doesn=E2=80=99t set SRCREV, so this is now doing a re=
mote tag lookup on every parse.<br></blockquote></div></div><div dir=3D"aut=
o"><br></div><div dir=3D"auto">Nice catch, this is most likely what did bre=
ak the meta-oe-mirror test : <a href=3D"https://autobuilder.yoctoproject.or=
g/valkyrie/#/builders/82/builds/494/steps/17/logs/errors">https://autobuild=
er.yoctoproject.org/valkyrie/#/builders/82/builds/494/steps/17/logs/errors<=
/a></div><div dir=3D"auto"><br></div><div dir=3D"auto">Maybe we need to add=
 a recipe qa warning about this...</div><div dir=3D"auto"><br></div><div di=
r=3D"auto"><div class=3D"gmail_quote gmail_quote_container"><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex">
<br>
Ross<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#121232): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/121232" rel=3D"noreferrer noreferrer" target=3D"_b=
lank">https://lists.openembedded.org/g/openembedded-devel/message/121232</a=
><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/115911777/431=
6185" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.openemb=
edded.org/mt/115911777/4316185</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank" rel=3D"noreferrer">openembedded-devel+owner@lists.=
openembedded.org</a><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.opene=
mbedded.org/g/openembedded-devel/unsub</a> [<a href=3D"mailto:yoann.congal@=
smile.fr" target=3D"_blank" rel=3D"noreferrer">yoann.congal@smile.fr</a>]<b=
r>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div></div>

--000000000000bb399a0642749498--

