Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36BE7C43334
	for <webhook@archiver.kernel.org>; Fri,  1 Jul 2022 13:21:58 +0000 (UTC)
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com
 [209.85.222.180])
 by mx.groups.io with SMTP id smtpd.web09.38396.1656681712989004571
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 01 Jul 2022 06:21:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ZUT+ZrBi;
 spf=pass (domain: gmail.com, ip: 209.85.222.180,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f180.google.com with SMTP id z7so1779474qko.8
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 01 Jul 2022 06:21:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0Y1qT2rx/ZT9ru5uQ8OC6fobojFZMR2qxPoIiz8aNs4=;
        b=ZUT+ZrBiAKEO1pmsFPXLTZqbIOKUq/a3lsJwu5v8FCZJ8Hq+fgi6GYWxuEZ5AkrpTI
         dmj2tfscOgmpJuky3L+/3c5xtBaB5H/IE51rZC4G4jmuOqpt0AyHA7muj5/COEov+0bY
         C0iFRiXI6AyOvo8gpMI1DhMfBUlenKEmmB9BbPpoUPeutosX4Hzdiou2hHYksO9U6TZ/
         zNR4zYve/yiThgsbC7XSQIuLPXnoY0o7LIP8t+FWZAAjgpCh9C/dRoBobyykiCTstamr
         FHM5WlrW5X4yQw9ehf9+ZT5qjl3EeAcG5la+pyhRdVMKBgMh7/YQBMO4OYz0iEnzhwRG
         amFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0Y1qT2rx/ZT9ru5uQ8OC6fobojFZMR2qxPoIiz8aNs4=;
        b=owPegRXuqpBlPxhHYXBZQnfnEphA9eJYS+YQWMhIpjSN87SkVLKVOm0qwYWamiPZPE
         GfCAOE7GLXvoGDQrsedULRIrOYdwH3dRtr237QdbxarYhlq4Y0yB4Q1LcQ9bx9MYa1Fo
         AjXcnmr/PcLPjtsMKfyERTsBLLiPYTzgxsqnndIjGkkO+sCpYoTsjqdJIs639cZoIrxy
         YDNHB4cfFPVIvioY5qaH4FwQXbaDJQ3myrgX4AdMDC2VGDIwAjNcpk8dbxONZN2GG3pS
         h/ZstEjbKt9Mus1+nAPQxgeja2f3FWYQU7l8UXfhSyr3/lt8+AeiGIHWlBnW0xE+S3pI
         jSOA==
X-Gm-Message-State: AJIora+0Ok0y61P1UPrPR9iUZGzNBbfz/0DgdFHcX1KDoJLCZtpBDANA
	U0rLZI6fnKvvapnzwt9F56Bn4nfXFqvZS3gaKBnKRnot3jc=
X-Google-Smtp-Source: 
 AGRyM1uPgrtxixGFffZ9wBPrrYpgbogYsYVkleVMkA/AeHBU5FdXqiAtli2aYiWC/cyrRnEF1LaZFtACiYlbo9lIr2k=
X-Received: by 2002:a37:a215:0:b0:6af:cf8:dda7 with SMTP id
 l21-20020a37a215000000b006af0cf8dda7mr10373161qke.180.1656681711931; Fri, 01
 Jul 2022 06:21:51 -0700 (PDT)
MIME-Version: 1.0
References: <20220627133914.14615-1-javier.viguera@digi.com>
 <CAP9ODKqZTpwwUP8QiZiRVFPNT-fUhv8zm6sboChC7U72=X9gYw@mail.gmail.com>
In-Reply-To: 
 <CAP9ODKqZTpwwUP8QiZiRVFPNT-fUhv8zm6sboChC7U72=X9gYw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 1 Jul 2022 09:21:41 -0400
Message-ID: 
 <CAMKF1soAZU07jT0+Py=BKXb=QQQJkUSh4N6tY0GvdqH1Bt4GBA@mail.gmail.com>
Subject: Re: [oe] [meta-networking][kirkstone][PATCH] networkmanager: fix
 build with enabled ppp
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Cc: Javier Viguera <javier.viguera@digi.com>,
	OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>,
	akuster808 <akuster808@gmail.com>
Content-Type: multipart/alternative; boundary="000000000000f2180f05e2be44fc"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 01 Jul 2022 13:21:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97667

--000000000000f2180f05e2be44fc
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 1, 2022 at 7:45 AM Otavio Salvador <
otavio.salvador@ossystems.com.br> wrote:

>
>
> Em seg., 27 de jun. de 2022 =C3=A0s 10:39, Javier Viguera via
> lists.openembedded.org <javier.viguera=3Ddigi.com@lists.openembedded.org>
> escreveu:
>
>> If 'ppp' packageconfig option is enabled, but the build system does NOT
>> have pppd binary installed, the build fails with:
>>
>> | Has header "pppd/pppd.h" : YES
>> | Program pppd /sbin/pppd /usr/sbin/pppd found: NO
>> |
>> | ../NetworkManager-1.36.2/meson.build:570:4: ERROR: Assert failed: pppd
>> required but not found, please provide a valid pppd path or use -Dppp=3D=
false
>> to disable it
>>
>> This is due to meson trying to look for the 'pppd' binary in the build
>> system when it should not. If the build system does not contain pppd,
>> the build fails.
>>
>> Signed-off-by: Javier Viguera <javier.viguera@digi.com>
>>
>
> Please send it against master, first, then we can ask for backports.
>

I have staged it with a bit of editing


> --
> Otavio Salvador                             O.S. Systems
> http://www.ossystems.com.br        http://code.ossystems.com.br
> Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#97663):
> https://lists.openembedded.org/g/openembedded-devel/message/97663
> Mute This Topic: https://lists.openembedded.org/mt/92020681/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000f2180f05e2be44fc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Fri, Jul 1, 2022 at 7:45 AM Otavio Salvador &lt;<a href=
=3D"mailto:otavio.salvador@ossystems.com.br">otavio.salvador@ossystems.com.=
br</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr">=
<div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">Em seg., 27 de jun. de 2022 =C3=A0s 10:39, Javier Vigu=
era via <a href=3D"http://lists.openembedded.org" target=3D"_blank">lists.o=
penembedded.org</a> &lt;javier.viguera=3D<a href=3D"mailto:digi.com@lists.o=
penembedded.org" target=3D"_blank">digi.com@lists.openembedded.org</a>&gt; =
escreveu:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">If &#3=
9;ppp&#39; packageconfig option is enabled, but the build system does NOT<b=
r>
have pppd binary installed, the build fails with:<br>
<br>
| Has header &quot;pppd/pppd.h&quot; : YES<br>
| Program pppd /sbin/pppd /usr/sbin/pppd found: NO<br>
|<br>
| ../NetworkManager-1.36.2/meson.build:570:4: ERROR: Assert failed: pppd re=
quired but not found, please provide a valid pppd path or use -Dppp=3Dfalse=
 to disable it<br>
<br>
This is due to meson trying to look for the &#39;pppd&#39; binary in the bu=
ild<br>
system when it should not. If the build system does not contain pppd,<br>
the build fails.<br>
<br>
Signed-off-by: Javier Viguera &lt;<a href=3D"mailto:javier.viguera@digi.com=
" target=3D"_blank">javier.viguera@digi.com</a>&gt;<br></blockquote><div><b=
r></div><div>Please send it against master, first, then we can ask for back=
ports.</div></div></div></blockquote><div dir=3D"auto"><br></div><div dir=
=3D"auto">I have staged it with a bit of editing=C2=A0</div><div dir=3D"aut=
o"><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;b=
order-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr"><div class=3D"=
gmail_quote"><div dir=3D"auto"></div><div>=C2=A0</div></div>-- <br><div dir=
=3D"ltr">Otavio Salvador =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 O.S. Systems<br><a href=3D=
"http://www.ossystems.com.br" target=3D"_blank">http://www.ossystems.com.br=
</a> =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://code.ossystems.com.br" ta=
rget=3D"_blank">http://code.ossystems.com.br</a><br>Mobile: +55 (53) 9 9981=
-7854 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Mobile: +1 (347) 903-9750</div></di=
v>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#97663): <a href=3D"https://lists.openembedded.org/g/ope=
nembedded-devel/message/97663" rel=3D"noreferrer" target=3D"_blank">https:/=
/lists.openembedded.org/g/openembedded-devel/message/97663</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/92020681/1997=
914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/92020681/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" targ=
et=3D"_blank">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--000000000000f2180f05e2be44fc--

