Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43E52CAC59A
	for <webhook@archiver.kernel.org>; Thu, 18 Sep 2025 17:43:15 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web10.21523.1758217386750230715
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 18 Sep 2025 10:43:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=qi8A/zEX;
 spf=pass (domain: smile.fr, ip: 209.85.128.41, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4619eb18311so8532575e9.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 18 Sep 2025 10:43:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1758217385; x=1758822185; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ntnAKYpTUlP1/RZJKowx0KxOQGzvoEFAcn04De4zImI=;
        b=qi8A/zEXBNDKKnHC2R8BC3M38u56XdGKlMPrJAsQc9n3IcMIzhqIZbpQ+YDH13OWsW
         94UgNNpLPakgn1IWxm0mOTLQ36eHTfMDi4MhLV8ZfMrMnK+UvBbvIpKSUtzNfQYXedkk
         VO0J+72Y85MlQ9lKbhxR35Wi7Ephvjdy4xQWY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758217385; x=1758822185;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ntnAKYpTUlP1/RZJKowx0KxOQGzvoEFAcn04De4zImI=;
        b=kaeCNtqHyMaQt8NEaupOFrhlSkMwmDXYs0xJOaJH4nTYdbf8x/PAaHm5iv04npSJKV
         eXd2NXalM6A5vL9AkzJuwyW6MHafA7L5OELKWdobyr14VHbcVKM6oVQFXL4VYpLhbGyj
         jkz8E3IQ6o5/dYJoAmF6dnOtYtsgwDYX1P5Jc3ed2h+ahEZwXJZ7rTyMrRUnAU/8XmXI
         pOJxL2hO4DWcDb4RTaXeQnXJf/Yo0z3FFFTgreSChEHf2AWwTFyYfalaZ55vE78M50Cb
         KUZMUBzzJxHFjcBf0zGIyZxaVVPCryreDM4WkKB6v4KCc9gow2TgzorEEnyxVUgJeL2H
         f/8w==
X-Gm-Message-State: AOJu0YwIMVde4xy4AGk2hBuiNWKXk+oEmPMgkWrMRSs9Jaex1KGa1gwR
	kxxlRbxizOtS8qJ+GsLqeuO2Lm6782Ynb1OXCMeo7Pjeeez80cvkkjWzxAQJH1090b9qQaoZiYg
	lmcqNfq9wiPRv2B6o44s/H+w3rxK9Iz2iSXpNhjp0Jw==
X-Gm-Gg: ASbGncvSDL1HkIj0ockQBQ+zi6LFBKY4NQd7MShs9VwdD4xKtRHW2pdTMboKj2qnxuF
	xGfH/V2kVaXW1lyhe8/lEkRKSI0TQZQSnRL9pnrc/4kGcj80OKzNVdsNZ9yRBThBHBIpn6cqVZT
	kSmH3sU9i73o8PS+B4K2dtpJmoZQXn3Csv0Q7gE59wDiHECdrzgSP7VVRBlDtgc3uF8Hah3RTlX
	ziucGBLY3/D/NqiRXOtONzCxmvIb2QNmpUa4GrlmXwMKZbIA1pBnCDy3pef
X-Google-Smtp-Source: AGHT+IG9xzlSXpLcsmrEzvIqLY8YrJdfpftJ4/7BZPtG7t94bQyZZXEvwJjUXrhZCbLzUDt5OVrVvVhqxjsvDcIgKZs=
X-Received: by 2002:a05:600c:4e12:b0:45d:84ca:8a7 with SMTP id
 5b1f17b1804b1-467e78caaaemr1077215e9.14.1758217385092; Thu, 18 Sep 2025
 10:43:05 -0700 (PDT)
MIME-Version: 1.0
References: <20250918102642.487522-1-zboszor@gmail.com> <CAMSfU+6F0GngYjP=07gUWFo4Tvf=hk=rG6CgAnV16BrK8UuBEg@mail.gmail.com>
In-Reply-To: <CAMSfU+6F0GngYjP=07gUWFo4Tvf=hk=rG6CgAnV16BrK8UuBEg@mail.gmail.com>
From: Yoann Congal <yoann.congal@smile.fr>
Date: Thu, 18 Sep 2025 19:42:38 +0200
X-Gm-Features: AS18NWBCRjwhpGHUVX1-XD_KhNJYh5cPgFfd9J72AF0T5KWZqKQRriSTrNEOnDU
Message-ID: <CAMSfU+6tnHY2yyjTRJ9Y+jjCQE8=f-g+V2N_22TK1vBTYZp5GA@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] gutenprint: 5.3.5
To: zboszor@gmail.com
Cc: openembedded-devel@lists.openembedded.org, Khem Raj <raj.khem@gmail.com>
Content-Type: multipart/alternative; boundary="000000000000ad3e56063f16e287"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 18 Sep 2025 17:43:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119579

--000000000000ad3e56063f16e287
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le jeu. 18 sept. 2025 =C3=A0 16:16, Yoann Congal <yoann.congal@smile.fr> a
=C3=A9crit :

> Hello,
>
> Le jeu. 18 sept. 2025 =C3=A0 12:26, Zoltan Boszormenyi via
> lists.openembedded.org <zboszor=3Dgmail.com@lists.openembedded.org> a
> =C3=A9crit :
>
>> This fixes an installation error:
>>
>> | make[5]: Entering directory
>> '.../tmp/work/corei7-64-oe-linux/gutenprint/5.3.4/build/src/cups'
>> | chmod 700
>> .../tmp/work/corei7-64-oe-linux/gutenprint/5.3.4/image/usr/libexec/cups/=
backend/backend_gutenprint
>> | chmod: cannot access
>> '.../tmp/work/corei7-64-oe-linux/gutenprint/5.3.4/image/usr/libexec/cups=
/backend/backend_gutenprint':
>> No such file or directory
>>
>
> What makes you say that the 5.3.4->5.3.5 upgrade fix this bug?
> The above error is the one I fixed with the patch
> "0001-cups-fix-a-build-race-condition-around-empty-directo.patch" and thi=
s
> patch has not been merged upstream nor the code I touched changed. I did
> not see anything related by quickly reading the NEWS.
> I'd be happy to see this fixed upstream but I'd rather have upstream
> confirmation that they saw/fixed it (a commit, a changelog, ...).
> If that is fixed upstream, then we can drop my patch.
>

To be clear, I'm not against upgrading. I just don't think the commit
message is correct (but could be convinced otherwise).



> Thanks!
>
>
>> Signed-off-by: Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi <zboszor@gmail.com=
>
>> ---
>>  .../gutenprint/{gutenprint_5.3.4.bb =3D> gutenprint_5.3.5.bb}     | 2 +=
-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>  rename meta-oe/recipes-printing/gutenprint/{gutenprint_5.3.4.bb =3D>
>> gutenprint_5.3.5.bb} (96%)
>>
>> diff --git a/meta-oe/recipes-printing/gutenprint/gutenprint_5.3.4.bb
>> b/meta-oe/recipes-printing/gutenprint/gutenprint_5.3.5.bb
>> similarity index 96%
>> rename from meta-oe/recipes-printing/gutenprint/gutenprint_5.3.4.bb
>> rename to meta-oe/recipes-printing/gutenprint/gutenprint_5.3.5.bb
>> index f90a123293..82953b798c 100644
>> --- a/meta-oe/recipes-printing/gutenprint/gutenprint_5.3.4.bb
>> +++ b/meta-oe/recipes-printing/gutenprint/gutenprint_5.3.5.bb
>> @@ -17,7 +17,7 @@ LIC_FILES_CHKSUM =3D
>> "file://COPYING;md5=3D59530bdf33659b29e73d4adb9f9f6552"
>>  SRC_URI =3D "https://downloads.sourceforge.net/gimp-print/${BP}.tar.xz =
\
>>
>> file://0001-cups-fix-a-build-race-condition-around-empty-directo.patch \
>>             "
>> -SRC_URI[sha256sum] =3D
>> "db44a701d2b8e6a8931c83cec06c91226be266d23e5c189d20a39dd175f2023b"
>> +SRC_URI[sha256sum] =3D
>> "f5a9f47de28530b1ae2069cfbc647a9a641baeeabe809bb0ef2b3ec5b9668d70"
>>
>>  inherit autotools gettext pkgconfig
>>
>> --
>> 2.51.0
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#119552):
>> https://lists.openembedded.org/g/openembedded-devel/message/119552
>> Mute This Topic: https://lists.openembedded.org/mt/115307539/4316185
>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
>> yoann.congal@smile.fr]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>
>>
>
> --
> Yoann Congal
> Smile ECS
>


--=20
Yoann Congal
Smile ECS

--000000000000ad3e56063f16e287
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0jeu. 18=
 sept. 2025 =C3=A0=C2=A016:16, Yoann Congal &lt;<a href=3D"mailto:yoann.con=
gal@smile.fr">yoann.congal@smile.fr</a>&gt; a =C3=A9crit=C2=A0:<br></div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div>Hello=
,</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr"=
>Le=C2=A0jeu. 18 sept. 2025 =C3=A0=C2=A012:26, Zoltan Boszormenyi via <a hr=
ef=3D"http://lists.openembedded.org" target=3D"_blank">lists.openembedded.o=
rg</a> &lt;zboszor=3D<a href=3D"mailto:gmail.com@lists.openembedded.org" ta=
rget=3D"_blank">gmail.com@lists.openembedded.org</a>&gt; a =C3=A9crit=C2=A0=
:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">This fixes an =
installation error:<br>
<br>
| make[5]: Entering directory &#39;.../tmp/work/corei7-64-oe-linux/gutenpri=
nt/5.3.4/build/src/cups&#39;<br>
| chmod 700 .../tmp/work/corei7-64-oe-linux/gutenprint/5.3.4/image/usr/libe=
xec/cups/backend/backend_gutenprint<br>
| chmod: cannot access &#39;.../tmp/work/corei7-64-oe-linux/gutenprint/5.3.=
4/image/usr/libexec/cups/backend/backend_gutenprint&#39;: No such file or d=
irectory<br></blockquote><div><br></div><div>What makes you say that the 5.=
3.4-&gt;5.3.5 upgrade fix this bug?</div><div>The above error is the one I =
fixed with the patch &quot;0001-cups-fix-a-build-race-condition-around-empt=
y-directo.patch&quot; and this patch has not been merged upstream nor the c=
ode I touched changed. I did not see anything related by quickly reading th=
e NEWS.</div><div></div><div>I&#39;d be happy to see this fixed upstream bu=
t I&#39;d rather have upstream confirmation that they saw/fixed it (a commi=
t, a changelog, ...).</div><div>If that is fixed upstream, then we can drop=
 my patch.</div></div></div></blockquote><div><br></div><div>To be clear, I=
&#39;m not against upgrading. I just don&#39;t think the commit message is =
correct (but could be convinced otherwise).</div><div><br></div><div>=C2=A0=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><d=
iv class=3D"gmail_quote"><div>Thanks!</div><div>=C2=A0</div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex">
Signed-off-by: Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi &lt;<a href=3D"mailto=
:zboszor@gmail.com" target=3D"_blank">zboszor@gmail.com</a>&gt;<br>
---<br>
=C2=A0.../gutenprint/{<a href=3D"http://gutenprint_5.3.4.bb" rel=3D"norefer=
rer" target=3D"_blank">gutenprint_5.3.4.bb</a> =3D&gt; <a href=3D"http://gu=
tenprint_5.3.5.bb" rel=3D"noreferrer" target=3D"_blank">gutenprint_5.3.5.bb=
</a>}=C2=A0 =C2=A0 =C2=A0| 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
=C2=A0rename meta-oe/recipes-printing/gutenprint/{<a href=3D"http://gutenpr=
int_5.3.4.bb" rel=3D"noreferrer" target=3D"_blank">gutenprint_5.3.4.bb</a> =
=3D&gt; <a href=3D"http://gutenprint_5.3.5.bb" rel=3D"noreferrer" target=3D=
"_blank">gutenprint_5.3.5.bb</a>} (96%)<br>
<br>
diff --git a/meta-oe/recipes-printing/gutenprint/<a href=3D"http://gutenpri=
nt_5.3.4.bb" rel=3D"noreferrer" target=3D"_blank">gutenprint_5.3.4.bb</a> b=
/meta-oe/recipes-printing/gutenprint/<a href=3D"http://gutenprint_5.3.5.bb"=
 rel=3D"noreferrer" target=3D"_blank">gutenprint_5.3.5.bb</a><br>
similarity index 96%<br>
rename from meta-oe/recipes-printing/gutenprint/<a href=3D"http://gutenprin=
t_5.3.4.bb" rel=3D"noreferrer" target=3D"_blank">gutenprint_5.3.4.bb</a><br=
>
rename to meta-oe/recipes-printing/gutenprint/<a href=3D"http://gutenprint_=
5.3.5.bb" rel=3D"noreferrer" target=3D"_blank">gutenprint_5.3.5.bb</a><br>
index f90a123293..82953b798c 100644<br>
--- a/meta-oe/recipes-printing/gutenprint/<a href=3D"http://gutenprint_5.3.=
4.bb" rel=3D"noreferrer" target=3D"_blank">gutenprint_5.3.4.bb</a><br>
+++ b/meta-oe/recipes-printing/gutenprint/<a href=3D"http://gutenprint_5.3.=
5.bb" rel=3D"noreferrer" target=3D"_blank">gutenprint_5.3.5.bb</a><br>
@@ -17,7 +17,7 @@ LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D59530bdf3=
3659b29e73d4adb9f9f6552&quot;<br>
=C2=A0SRC_URI =3D &quot;<a href=3D"https://downloads.sourceforge.net/gimp-p=
rint/$%7BBP%7D.tar.xz" rel=3D"noreferrer" target=3D"_blank">https://downloa=
ds.sourceforge.net/gimp-print/${BP}.tar.xz</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-cups-fix-a-build-race=
-condition-around-empty-directo.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
-SRC_URI[sha256sum] =3D &quot;db44a701d2b8e6a8931c83cec06c91226be266d23e5c1=
89d20a39dd175f2023b&quot;<br>
+SRC_URI[sha256sum] =3D &quot;f5a9f47de28530b1ae2069cfbc647a9a641baeeabe809=
bb0ef2b3ec5b9668d70&quot;<br>
<br>
=C2=A0inherit autotools gettext pkgconfig<br>
<br>
-- <br>
2.51.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#119552): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/119552" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/119552</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/115307539/431=
6185" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/115307539/4316185</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:yoann.congal@smile.fr" t=
arget=3D"_blank">yoann.congal@smile.fr</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><div><br clear=3D"all"></div><br><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr"><font face=3D"Raleway, regular">Yoann Congal</font><div><fon=
t face=3D"Raleway, regular">Smile ECS</font></div></div></div></div>
</blockquote></div><div><br clear=3D"all"></div><br><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr"><font face=3D"Raleway, regular">Yoann Congal</font><div><fon=
t face=3D"Raleway, regular">Smile ECS</font></div></div></div></div>

--000000000000ad3e56063f16e287--

