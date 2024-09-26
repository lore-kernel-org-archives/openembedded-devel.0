Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE5CECCF9E9
	for <webhook@archiver.kernel.org>; Thu, 26 Sep 2024 09:38:55 +0000 (UTC)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
 by mx.groups.io with SMTP id smtpd.web11.38828.1727343530393163963
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Sep 2024 02:38:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=vn1YLJg6;
 spf=pass (domain: smile.fr, ip: 209.85.208.181, mailfrom: yoann.congal@smile.fr)
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2f78b28ddb6so8088761fa.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Sep 2024 02:38:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1727343528; x=1727948328; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Ve5Z8VGaG2+D5XWUY/6ZcQfIE8Xk5eZiBHitY25A/O4=;
        b=vn1YLJg6DHu5+/NUENhXdQIFEu7eMDoSuofernF11gYh8JZClVma2wOb3rj10RDCgy
         BC+Bemz031uREaVIjUwXErEZs25rjHFbTCMR2NRdxMSct2V1oIo0SY5N+qTwpWg+5HjS
         G4urAejIRyWcBCfYMgkkbwzAoUyqFINWy7keU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727343528; x=1727948328;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ve5Z8VGaG2+D5XWUY/6ZcQfIE8Xk5eZiBHitY25A/O4=;
        b=EUI4vqddrKtLtDmisMSo42stY08EK+d8qpq2xzUX46idVRqOtpU+J+V9OQ8xp5GACp
         kZZzwuUXnEBEN1PzSU7OxZfAFgk7aTri6+yO7tMe625WAChXtHN+d/kkVXu5LS1MYpWr
         2tJ8Z1uMlt8ilaXBuFC5ogWMPITNDschDiOkG6e3wTcop1yw/q397DxJLdRsixeyp70u
         QMIe6R7sSSAiWCLfscVLcPTIfq7wEpZp2Aja1cK+AjyPFAkl7A3hkSmXZmJYYy37kM8Z
         HzZJlZY3z72Ekp+xnEx6/bjdfjLahp7a32dGFa9FLh4a4M1KPRed7MhghWylSiLF3YUa
         FWuQ==
X-Gm-Message-State: AOJu0Yz/P521dTV6gy2tEuqZRDOgi9OYe3SdsK3eRXxg8+0IvgXTR7eG
	Q0tATuVeLxzoz0voORFwodFbrMshhvStRtKQTYa3nlYjhQsw2RRa5lg6mWJ7g1GxroK+7jQ1TP8
	+Fx8AZ+WuCZMXNkXGWNEXYgAtcxsDdXr3vFkamw==
X-Google-Smtp-Source: AGHT+IHSLylw3cRJtT9RXvJGa1lNcQFb+LtjnDHNwbZFAunVIMI/Lez0B1oeFGlEvfwksehOo4gyFSHDBNrq+YDOUps=
X-Received: by 2002:a2e:9f02:0:b0:2ef:24a0:c176 with SMTP id
 38308e7fff4ca-2f91ca6fb96mr27499921fa.28.1727343528247; Thu, 26 Sep 2024
 02:38:48 -0700 (PDT)
MIME-Version: 1.0
References: <20240926083946.3733569-1-yoann.congal@smile.fr> <CANPvuRnLs5JwnesNmC2MjgC5CT2egFxWpL7Awx4s0ATOPz=gtg@mail.gmail.com>
In-Reply-To: <CANPvuRnLs5JwnesNmC2MjgC5CT2egFxWpL7Awx4s0ATOPz=gtg@mail.gmail.com>
From: Yoann Congal <yoann.congal@smile.fr>
Date: Thu, 26 Sep 2024 11:38:22 +0200
Message-ID: <CAMSfU+50t1zEajJtNYv8pio4fRpLAEWR4mh3s7DRC-SBbV1_zw@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] polkit: Update Upstream-Status of a merged patch
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000068267106230281b4"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 26 Sep 2024 09:38:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112513

--00000000000068267106230281b4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le jeu. 26 sept. 2024 =C3=A0 10:59, Jose Quaresma <quaresma.jose@gmail.com>=
 a
=C3=A9crit :

>
>
> Yoann Congal via lists.openembedded.org <yoann.congal=3D
> smile.fr@lists.openembedded.org> escreveu (quinta, 26/09/2024 =C3=A0(s) 0=
9:40):
>
>> From: Yoann Congal <yoann.congal@smile.fr>
>>
>> https://github.com/polkit-org/polkit/pull/497 was merged as
>>
>> https://github.com/polkit-org/polkit/commit/1d4f7f4d9f3d74fb2649c96faa86=
77416c1aefc2
>>
>> Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
>> ---
>>  .../meson-build-Support-openembedded-OS-for-PAM-config.patch    | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git
>> a/meta-oe/recipes-extended/polkit/files/meson-build-Support-openembedded=
-OS-for-PAM-config.patch
>> b/meta-oe/recipes-extended/polkit/files/meson-build-Support-openembedded=
-OS-for-PAM-config.patch
>> index cc396dfa3b..54c0fb040f 100644
>> ---
>> a/meta-oe/recipes-extended/polkit/files/meson-build-Support-openembedded=
-OS-for-PAM-config.patch
>> +++
>> b/meta-oe/recipes-extended/polkit/files/meson-build-Support-openembedded=
-OS-for-PAM-config.patch
>> @@ -14,7 +14,7 @@ NB: This is also the same config as Debian but its not
>> mentioned in the
>>  code.
>>
>>  Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
>> -Upstream-Status: Submitted [
>> https://github.com/polkit-org/polkit/pull/497]
>> +Upstream-Status: Upstream-Status: Backport [
>> https://github.com/polkit-org/polkit/commit/1d4f7f4d9f3d74fb2649c96faa86=
77416c1aefc2
>> ]
>>
>
> nitpick upstream-status duplicated.
>

You're right, will send a v2
Thanks!

>
> Jose
>
>
>>  ---
>>   meson.build       | 2 +-
>>   meson_options.txt | 2 +-
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#112511):
>> https://lists.openembedded.org/g/openembedded-devel/message/112511
>> Mute This Topic: https://lists.openembedded.org/mt/108664105/5052612
>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
>> quaresma.jose@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>
>>
>
> --
> Best regards,
>
> Jos=C3=A9 Quaresma
>


--=20
Yoann Congal
Smile ECS - Tech expert

--00000000000068267106230281b4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0jeu. 26 sept. 2024 =C3=A0=C2=
=A010:59, Jose Quaresma &lt;<a href=3D"mailto:quaresma.jose@gmail.com">quar=
esma.jose@gmail.com</a>&gt; a =C3=A9crit=C2=A0:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr"><br></di=
v><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">Yoan=
n Congal via <a href=3D"http://lists.openembedded.org" target=3D"_blank">li=
sts.openembedded.org</a> &lt;yoann.congal=3D<a href=3D"mailto:smile.fr@list=
s.openembedded.org" target=3D"_blank">smile.fr@lists.openembedded.org</a>&g=
t; escreveu (quinta, 26/09/2024 =C3=A0(s) 09:40):<br></div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex">From: Yoann Congal &lt;<a href=3D"mailto:=
yoann.congal@smile.fr" target=3D"_blank">yoann.congal@smile.fr</a>&gt;<br>
<br>
<a href=3D"https://github.com/polkit-org/polkit/pull/497" rel=3D"noreferrer=
" target=3D"_blank">https://github.com/polkit-org/polkit/pull/497</a> was m=
erged as<br>
<a href=3D"https://github.com/polkit-org/polkit/commit/1d4f7f4d9f3d74fb2649=
c96faa8677416c1aefc2" rel=3D"noreferrer" target=3D"_blank">https://github.c=
om/polkit-org/polkit/commit/1d4f7f4d9f3d74fb2649c96faa8677416c1aefc2</a><br=
>
<br>
Signed-off-by: Yoann Congal &lt;<a href=3D"mailto:yoann.congal@smile.fr" ta=
rget=3D"_blank">yoann.congal@smile.fr</a>&gt;<br>
---<br>
=C2=A0.../meson-build-Support-openembedded-OS-for-PAM-config.patch=C2=A0 =
=C2=A0 | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta-oe/recipes-extended/polkit/files/meson-build-Support-open=
embedded-OS-for-PAM-config.patch b/meta-oe/recipes-extended/polkit/files/me=
son-build-Support-openembedded-OS-for-PAM-config.patch<br>
index cc396dfa3b..54c0fb040f 100644<br>
--- a/meta-oe/recipes-extended/polkit/files/meson-build-Support-openembedde=
d-OS-for-PAM-config.patch<br>
+++ b/meta-oe/recipes-extended/polkit/files/meson-build-Support-openembedde=
d-OS-for-PAM-config.patch<br>
@@ -14,7 +14,7 @@ NB: This is also the same config as Debian but its not me=
ntioned in the<br>
=C2=A0code.<br>
<br>
=C2=A0Signed-off-by: Yoann Congal &lt;<a href=3D"mailto:yoann.congal@smile.=
fr" target=3D"_blank">yoann.congal@smile.fr</a>&gt;<br>
-Upstream-Status: Submitted [<a href=3D"https://github.com/polkit-org/polki=
t/pull/497" rel=3D"noreferrer" target=3D"_blank">https://github.com/polkit-=
org/polkit/pull/497</a>]<br>
+Upstream-Status: Upstream-Status: Backport [<a href=3D"https://github.com/=
polkit-org/polkit/commit/1d4f7f4d9f3d74fb2649c96faa8677416c1aefc2" rel=3D"n=
oreferrer" target=3D"_blank">https://github.com/polkit-org/polkit/commit/1d=
4f7f4d9f3d74fb2649c96faa8677416c1aefc2</a>]<br></blockquote><div><br></div>=
<div>nitpick upstream-status duplicated.<br></div></div></div></blockquote>=
<div><br></div><div>You&#39;re right, will send a v2<br></div><div>Thanks! =
<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr=
"><div class=3D"gmail_quote"><div><br>Jose</div><div>=C2=A0</div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px s=
olid rgb(204,204,204);padding-left:1ex">
=C2=A0---<br>
=C2=A0 meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-<br>
=C2=A0 meson_options.txt | 2 +-<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#112511): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/112511" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/112511</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/108664105/505=
2612" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/108664105/5052612</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:quaresma.jose@gmail.com"=
 target=3D"_blank">quaresma.jose@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr">Best regards,<div><br>Jos=C3=A9 Quaresma</div></div></div></=
div>
</blockquote></div><br clear=3D"all"><br><span class=3D"gmail_signature_pre=
fix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><div dir=3D"l=
tr"><font face=3D"Raleway, regular">Yoann Congal</font><div><font face=3D"R=
aleway, regular">Smile ECS - Tech expert<br></font></div></div></div></div>

--00000000000068267106230281b4--

