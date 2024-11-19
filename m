Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8D65D6C288
	for <webhook@archiver.kernel.org>; Tue, 19 Nov 2024 18:52:51 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web10.29323.1732042365788257239
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 19 Nov 2024 10:52:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=erYdciTX;
 spf=pass (domain: smile.fr, ip: 209.85.128.47, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4315df7b43fso11829675e9.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 19 Nov 2024 10:52:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1732042364; x=1732647164; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=yTYM+lqb5YzywglkDpen9KcWEXYuL4XSdDrZKqZrw9E=;
        b=erYdciTXgdjJqBfWJDdye+2dimSIBZn8Vn1PL3PqLJy3fk89ei04Jbr4u3NS4Rdl1S
         dySF1ZtOCcXp1EcYJSnBXzX3UkCnnaSF6QS3/KUGiPibezvAmX3NXBUvfZ6XlLtaIYjL
         UTwQlMYvfEzE27WPsNjpYrsruySDny1hESaTU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732042364; x=1732647164;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yTYM+lqb5YzywglkDpen9KcWEXYuL4XSdDrZKqZrw9E=;
        b=sJLIfyinvhY/DLA9CsVM2AbKw7H8+w6w2+qm6Qjq/LvKxh+ycOw1z1UrSz9R0Y2ux5
         rflOBkmP2j6hQcIieZvETFywy5dpeoDsE/sv8jinFimyF/uD0rGOQovydPhEAdi1A7Pw
         Sw1lqDCPJbB1ytfKbuSUrPIcjf1rk8avwLKXFEYVJHGn5vVFKvNkkSYaP2bmJmDe6DLA
         RH9anI/atAxvonZa8hz5BtXSVXW69T7hnrm0akQTWj4gK0C1l5ih96jrtxx9uqd7sG05
         aZbdnmDOp+theiIPVOZLOqad6k1idqGbsiYYdDUQYlbt5XhBKgzPFJSczYcflMDSOzC0
         cGyQ==
X-Gm-Message-State: AOJu0Yx6Yr+acJEezxAqhv6PmiAqTydmE0M4JrZw9xJJL9eGwKsVcgkg
	3i2iHhuP4QkM99E5rEY/t0eoNxPVSSovc4zOWrgufOBkrtr6IioZ2Q7T6zR/QQrUx5bQtyI+70Q
	OuosN5nB8w4frd1NSM4pZD+jd2fcnma1WT8mKeg==
X-Google-Smtp-Source: AGHT+IHIXScdknThNEQcLBt3EK3g+CSZxC7qkcA9mITEED13y5OpBmNV8Th2RjVnZK7Mm/sF+2JJHCtlc0JfDlC/sOA=
X-Received: by 2002:a05:600c:1e20:b0:431:55bf:fe4 with SMTP id
 5b1f17b1804b1-4334f016fd9mr314765e9.24.1732042364271; Tue, 19 Nov 2024
 10:52:44 -0800 (PST)
MIME-Version: 1.0
References: <20241119175446.1889573-1-yoann.congal@smile.fr> <CANNYZj-aJBLNGRcsTGPiRnJKmB+kSCPd-UO9DeHOaOTcBQ1vXQ@mail.gmail.com>
In-Reply-To: <CANNYZj-aJBLNGRcsTGPiRnJKmB+kSCPd-UO9DeHOaOTcBQ1vXQ@mail.gmail.com>
From: Yoann Congal <yoann.congal@smile.fr>
Date: Tue, 19 Nov 2024 19:52:31 +0100
Message-ID: <CAMSfU+4HLvjg5AKuuyG7UVEJD+Zce07N1X0gsj3U26uCv0kmiQ@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] tk: make tk_8.x depend on tcl8
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000dbceff0627488960"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 Nov 2024 18:52:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113913

--000000000000dbceff0627488960
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mar. 19 nov. 2024 =C3=A0 18:59, Alexander Kanavin <alex.kanavin@gmail.co=
m> a
=C3=A9crit :

> This is probably unneeded as there=E2=80=99s an update to tk 9.x in maste=
r-next.
>

Oh you are right! I missed that.

Thanks!


> Alex
>
> On Tue 19. Nov 2024 at 18.54, Yoann Congal via lists.openembedded.org
> <yoann.congal=3Dsmile.fr@lists.openembedded.org> wrote:
>
>> From: Yoann Congal <yoann.congal@smile.fr>
>>
>> tk_8.x depends on tcl8 (tcl is the 9.x version in OE-core)
>>
>> Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
>> ---
>> NB: This patch fixes a do_configure failure but a later do_compile
>> failure is fixed by a patch in OE-Core:
>> https://lists.openembedded.org/g/openembedded-core/message/207399
>>
>> This is kind of a workaround since the proper solution would be to
>> upgrade to tk_9.x. But I would rather fix the build first and upgrade
>> later.
>> ---
>>  meta-oe/recipes-devtools/tcltk/tk_8.6.15.bb | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta-oe/recipes-devtools/tcltk/tk_8.6.15.bb
>> b/meta-oe/recipes-devtools/tcltk/tk_8.6.15.bb
>> index 1438a05625..ddd7043c0a 100644
>> --- a/meta-oe/recipes-devtools/tcltk/tk_8.6.15.bb
>> +++ b/meta-oe/recipes-devtools/tcltk/tk_8.6.15.bb
>> @@ -15,7 +15,7 @@ LIC_FILES_CHKSUM =3D
>> "file://license.terms;md5=3Dc88f99decec11afa967ad33d314f87fe \
>>      file://xlib/license.terms;md5=3Dc88f99decec11afa967ad33d314f87fe \
>>  "
>>
>> -DEPENDS =3D "tcl virtual/libx11 libxt"
>> +DEPENDS =3D "tcl8 virtual/libx11 libxt"
>>
>>  SRC_URI =3D "\
>>      ${SOURCEFORGE_MIRROR}/tcl/${BPN}${PV}-src.tar.gz \
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#113911):
>> https://lists.openembedded.org/g/openembedded-devel/message/113911
>> Mute This Topic: https://lists.openembedded.org/mt/109669370/1686489
>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
>> alex.kanavin@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>
>>

--000000000000dbceff0627488960
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><div>Le mar. 19 nov. 2024 =C3=A0 18:59, Alexander Ka=
navin &lt;<a href=3D"mailto:alex.kanavin@gmail.com">alex.kanavin@gmail.com<=
/a>&gt; a =C3=A9crit=C2=A0:</div><div class=3D"gmail_quote"><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex"><div dir=3D"auto">This is probably unnee=
ded as there=E2=80=99s an update to tk 9.x in master-next.</div></blockquot=
e></div></div><div dir=3D"auto"><br></div><div dir=3D"auto">Oh you are righ=
t! I missed that.</div><div dir=3D"auto"><br></div><div dir=3D"auto">Thanks=
!</div><div dir=3D"auto"><br></div><div dir=3D"auto"><div class=3D"gmail_qu=
ote"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"auto"><b=
r></div><div dir=3D"auto">Alex</div><div><br><div class=3D"gmail_quote"><di=
v dir=3D"ltr" class=3D"gmail_attr">On Tue 19. Nov 2024 at 18.54, Yoann Cong=
al via <a href=3D"http://lists.openembedded.org" target=3D"_blank" rel=3D"n=
oreferrer">lists.openembedded.org</a> &lt;yoann.congal=3D<a href=3D"mailto:=
smile.fr@lists.openembedded.org" target=3D"_blank" rel=3D"noreferrer">smile=
.fr@lists.openembedded.org</a>&gt; wrote:<br></div><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex">From: Yoann Congal &lt;<a href=3D"mailto:yoann.co=
ngal@smile.fr" target=3D"_blank" rel=3D"noreferrer">yoann.congal@smile.fr</=
a>&gt;<br>
<br>
tk_8.x depends on tcl8 (tcl is the 9.x version in OE-core)<br>
<br>
Signed-off-by: Yoann Congal &lt;<a href=3D"mailto:yoann.congal@smile.fr" ta=
rget=3D"_blank" rel=3D"noreferrer">yoann.congal@smile.fr</a>&gt;<br>
---<br>
NB: This patch fixes a do_configure failure but a later do_compile<br>
failure is fixed by a patch in OE-Core:<br>
<a href=3D"https://lists.openembedded.org/g/openembedded-core/message/20739=
9" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.openembedd=
ed.org/g/openembedded-core/message/207399</a><br>
<br>
This is kind of a workaround since the proper solution would be to<br>
upgrade to tk_9.x. But I would rather fix the build first and upgrade<br>
later.<br>
---<br>
=C2=A0meta-oe/recipes-devtools/tcltk/<a href=3D"http://tk_8.6.15.bb" rel=3D=
"noreferrer noreferrer" target=3D"_blank">tk_8.6.15.bb</a> | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta-oe/recipes-devtools/tcltk/<a href=3D"http://tk_8.6.15.bb"=
 rel=3D"noreferrer noreferrer" target=3D"_blank">tk_8.6.15.bb</a> b/meta-oe=
/recipes-devtools/tcltk/<a href=3D"http://tk_8.6.15.bb" rel=3D"noreferrer n=
oreferrer" target=3D"_blank">tk_8.6.15.bb</a><br>
index 1438a05625..ddd7043c0a 100644<br>
--- a/meta-oe/recipes-devtools/tcltk/<a href=3D"http://tk_8.6.15.bb" rel=3D=
"noreferrer noreferrer" target=3D"_blank">tk_8.6.15.bb</a><br>
+++ b/meta-oe/recipes-devtools/tcltk/<a href=3D"http://tk_8.6.15.bb" rel=3D=
"noreferrer noreferrer" target=3D"_blank">tk_8.6.15.bb</a><br>
@@ -15,7 +15,7 @@ LIC_FILES_CHKSUM =3D &quot;file://license.terms;md5=3Dc88=
f99decec11afa967ad33d314f87fe \<br>
=C2=A0 =C2=A0 =C2=A0file://xlib/license.terms;md5=3Dc88f99decec11afa967ad33=
d314f87fe \<br>
=C2=A0&quot;<br>
<br>
-DEPENDS =3D &quot;tcl virtual/libx11 libxt&quot;<br>
+DEPENDS =3D &quot;tcl8 virtual/libx11 libxt&quot;<br>
<br>
=C2=A0SRC_URI =3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0${SOURCEFORGE_MIRROR}/tcl/${BPN}${PV}-src.tar.gz \<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#113911): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/113911" rel=3D"noreferrer noreferrer" target=3D"_b=
lank">https://lists.openembedded.org/g/openembedded-devel/message/113911</a=
><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/109669370/168=
6489" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.openemb=
edded.org/mt/109669370/1686489</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank" rel=3D"noreferrer">openembedded-devel+owner@lists.=
openembedded.org</a><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.opene=
mbedded.org/g/openembedded-devel/unsub</a> [<a href=3D"mailto:alex.kanavin@=
gmail.com" target=3D"_blank" rel=3D"noreferrer">alex.kanavin@gmail.com</a>]=
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>
</blockquote></div></div></div>

--000000000000dbceff0627488960--

