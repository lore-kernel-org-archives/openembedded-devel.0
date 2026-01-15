Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E259D4661F
	for <webhook@archiver.kernel.org>; Thu, 15 Jan 2026 20:09:28 +0000 (UTC)
Received: from mail-yx1-f49.google.com (mail-yx1-f49.google.com [74.125.224.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3932.1768507759776346818
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 15 Jan 2026 12:09:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=geOaG38M;
 spf=pass (domain: gmail.com, ip: 74.125.224.49, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f49.google.com with SMTP id 956f58d0204a3-6420c0cf4abso1154620d50.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 15 Jan 2026 12:09:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768507759; x=1769112559; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9DaHRr0Q5S0r0bVcxb19ZInvH1MU77I/KotQeNn00Nw=;
        b=geOaG38MlS56hBJoianakfGZbBguXP0QswcRdItZ1M/lr4s6ofVSdFBdt0AbyYs+jg
         Bd43bBHqIPZ0UeFinvGXqccac2Am35Q0D0WHYuncQWIk2g+dpMitIZn7DCoPF4ldlfKV
         mn/87fNOCdnjYtgNk1YMTpZGJ/YUtqR/QpCYHOJa17fxC7iB0Mu9rLUkIDZp+NbES0AX
         4PM8V9ZlrE3tsMnyw7/+rkcf2iigpiW1PgrIJdSCBGb7zUjPunCaqqtCrBy6FAiwP5KG
         5o/jTwcgGgt7Jvx6tZmwhK3OR98qpaCa12Vm0qMA+P2ZebMzW9o5q81+jBcCWR7OeDkD
         Jr6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768507759; x=1769112559;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9DaHRr0Q5S0r0bVcxb19ZInvH1MU77I/KotQeNn00Nw=;
        b=OG4LQdqTQQ7n2IDwljM2uoEvrX5fxkghn1dEzkDHOE+w78+zStnKiVH8p15L4kOL2Q
         X7OcZtwI01D1S0yfhy0x2ifOLABwngaHKsPrReNso8J6lSLn0Y+RN29qPq2Y5qk3hRkE
         a01PWGPxjEywfK0927uNN432vv7RzIukONLNMfdA1ASP9F7zuCDKC21N8yrW2PnQND7t
         RpNPjMOEYQePsebCJYo8+FY+OBr+FgqYNqFYpiz/dzKtge5g+v6GGeAOkFLEJ6SIx1Vr
         zoMsDYZYtUxk2dQ2nnBYZwY8umKwFSFDMPe9wzufz1d2b1RaUJIGybWMB9g9ra4/cljX
         W/EQ==
X-Forwarded-Encrypted: i=1; AJvYcCU9MS47Cj97bnAdP2nkTYLP1TgARrKh3km3oiYX4ApdjGYYuPYOR4AFuOm15kdN+PqD2jEeRLl1DkQk/reNhENvMdw=@lists.openembedded.org
X-Gm-Message-State: AOJu0YxAGMah3olOJJV/GtnU3gRmQLD0UVpjtGuLjWd23N+qWbCJEhRQ
	UnYEXl4oNbQOTTxkmhPNPObj4FOFJqCTh/vy6D5JX3pjN+e1WLtrqJ9AFV1Hd/T8P4smMq0yRQp
	XBRPZD3UxCCSXLYGFbSs9K7s4K9W8xMc=
X-Gm-Gg: AY/fxX5Xa8dhxuuCM6Lw8MxFEpLJGX/J99n8MChg/UqcBkvP2xEzYRmKlFq25+KznVx
	DQB3zvx8BejP6tnAXwjZ4h+RxNU1I8bi27GtQlYwtqKa7JIejX/pjAMltdRbGUfQ/ifYQSb9tRH
	iGtv01mqDIXuMFLmxTabrpvy/p/QtYu7s743gmCYE8A1em/Mx7ggMWxUmXYBDE/C3sYMtHx1lpn
	RKg02AS/JHr3FcYAVmer8EmX8aIseNM8QjNJt2dsRg1rNWZcpwjcRvv05XcqEEfeyszzONyaNC6
	jamhEGr7wdfM/dFoqSNcu13OE7lLea8fTRe6i9P0KQVhNMKECtQKUUqplzNvMe1NE0vf6hHrMJl
	TURBlZXCnOairKdME/UQL1NE2jsGIPWGCQopZ6e46/A==
X-Received: by 2002:a05:690e:148b:b0:646:ba5e:4cf4 with SMTP id
 956f58d0204a3-649164f5fc5mr799814d50.51.1768507758666; Thu, 15 Jan 2026
 12:09:18 -0800 (PST)
MIME-Version: 1.0
References: <188ADEF99F4A855B.2595076@lists.openembedded.org>
 <X5HW8T.AHLKZAK448352@t-online.de> <c9820ac6-8383-4e03-8964-38e7e2fc3ac3@gmail.com>
 <MS8X8T.JSG4VV82MN7C1@t-online.de>
In-Reply-To: <MS8X8T.JSG4VV82MN7C1@t-online.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 15 Jan 2026 12:08:52 -0800
X-Gm-Features: AZwV_Qgr7C_1jmgF2NEccBUjX_5_aDLYZRDis84n_qOCQpVZcsUFP7drAQPHnmg
Message-ID: <CAMKF1sp1byR6=si8_U9MpJoFOMHo1xJoaPZtvoVON6t9fp0M_A@mail.gmail.com>
Subject: Re: [oe] [RFC][meta-oe][PATCH] libtoml11: build with
 CMAKE_CXX_STANDARD 20
To: Markus Volk <f_l_k@t-online.de>
Cc: Gyorgy Sarvari <skandigraun@gmail.com>, openembedded-devel@lists.openembedded.org, 
	adam.duskett@amarulasolutions.com
Content-Type: multipart/alternative; boundary="000000000000bce870064872cc8b"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 15 Jan 2026 20:09:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123519

--000000000000bce870064872cc8b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 15, 2026 at 11:58=E2=80=AFAM Markus Volk <f_l_k@t-online.de> wr=
ote:

> Maybe we should wait until the transition happend ... or dont do it like
> this at all? ;)
>
> It hurts my brain that the lib is called libtoml11 but then requires c++2=
0.
> Maybe use an .inc file and then libtoml11.bb and libtoml20.bb? For now
> I'll add
> a bbappend file to my layer
>

OK makes sense.


>
> On Thu, Jan 15 2026 at 11:06:49 +01:00:00, Gyorgy Sarvari <
> skandigraun@gmail.com> wrote:
>
> On 1/15/26 11:01, Markus Volk via lists.openembedded.org wrote:
>
> By default, libtoml11 uses the C++11 standard. However, when building
> budgie-desktop-services, I get 'undefined reference to `std::enable_if'
> without having c++20 enabled. I flagged this RFC because I don't know if
> anyone relies on C++11.
>
> I remember that this recipe was moved to oe-core[1], because I reviewed
> some version of it... but apparently it didn't reach the actual repo yet.=
 I
> have nothing against the proposal, but if it is done, it should made
> somehow in a way that it won't be lost when the actual repo transition
> happen. I have added the transition-author on cc. [1]:
> https://lists.openembedded.org/g/openembedded-core/message/227581
>
> On Thu, Jan 15 2026 at 10:55:52 +01:00:00, Markus Volk via
> lists.openembedded.org <f_l_k=3Dt-online.de@lists.openembedded.org> wrote=
:
>
> Signed-off-by: Markus Volk <f_l_k@t-online.de> ---
> meta-oe/recipes-devtools/libtoml11/libtoml11_4.4.0.bb | 1 + 1 file
> changed, 1 insertion(+) diff --git a/meta-oe/recipes-devtools/libtoml11/
> libtoml11_4.4.0.bb b/meta-oe/recipes-devtools/libtoml11/libtoml11_4.4.0.b=
b
> index 38786b79ed..973a39fc21 100644 ---
> a/meta-oe/recipes-devtools/libtoml11/libtoml11_4.4.0.bb +++
> b/meta-oe/recipes-devtools/libtoml11/libtoml11_4.4.0.bb @@ -28,6 +28,7 @@
> inherit cmake ptest EXTRA_OECMAKE +=3D "-DTOML11_PRECOMPILE=3DON \
> -DTOML11_BUILD_TESTS=3D${@bb.utils.contains("DISTRO_FEATURES", "ptest",
> "ON", "OFF", d)} \ + -DCMAKE_CXX_STANDARD=3D20 \ " ALLOW_EMPTY:${PN} =3D =
"1" --
> 2.52.0
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D- Links: You receive all mess=
ages sent to this
> group. View/Reply Online (#123499):
> https://lists.openembedded.org/g/openembedded-devel/message/123499 Mute
> This Topic: https://lists.openembedded.org/mt/117276714/6084445 Group
> Owner: openembedded-devel+owner@lists.openembedded.org Unsubscribe:
> https://lists.openembedded.org/g/openembedded-devel/unsub [
> skandigraun@gmail.com] -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000bce870064872cc8b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Jan 15,=
 2026 at 11:58=E2=80=AFAM Markus Volk &lt;<a href=3D"mailto:f_l_k@t-online.=
de">f_l_k@t-online.de</a>&gt; wrote:<br></div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex"><div id=3D"m_8951516302515162228geary-body" dir=3D"aut=
o"><div>Maybe we should wait until the transition happend ... or dont do it=
 like this at all? ;)</div><div><br></div><div>It hurts my brain that the l=
ib is called libtoml11 but then requires c++20.</div><div>Maybe use an .inc=
 file and then <a href=3D"http://libtoml11.bb" target=3D"_blank">libtoml11.=
bb</a> and <a href=3D"http://libtoml20.bb" target=3D"_blank">libtoml20.bb</=
a>? For now I&#39;ll add</div><div>a bbappend file to my layer=C2=A0</div><=
/div></blockquote><div><br></div><div>OK makes sense.</div><div>=C2=A0</div=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left:1px solid rgb(204,204,204);padding-left:1ex"><div id=3D"m_89515163025=
15162228geary-quote" dir=3D"auto"><br>On Thu, Jan 15 2026 at 11:06:49 +01:0=
0:00, Gyorgy Sarvari &lt;<a href=3D"mailto:skandigraun@gmail.com" target=3D=
"_blank">skandigraun@gmail.com</a>&gt; wrote:<br><blockquote type=3D"cite">=
<div style=3D"white-space:break-spaces">On 1/15/26 11:01, Markus Volk via <=
a href=3D"http://lists.openembedded.org" target=3D"_blank">lists.openembedd=
ed.org</a> wrote:
<blockquote> By default, libtoml11 uses the C++11 standard. However, when b=
uilding
 budgie-desktop-services, I get &#39;undefined reference to
 `std::enable_if&#39; without having c++20 enabled. I flagged this RFC
 because I don&#39;t know if anyone relies on C++11.
</blockquote>
I remember that this recipe was moved to oe-core[1], because I reviewed
some version of it... but apparently it didn&#39;t reach the actual repo ye=
t.
I have nothing against the proposal, but if it is done, it should made
somehow in a way that it won&#39;t be lost when the actual repo transition
happen.
I have added the transition-author on cc.

[1]: <a href=3D"https://lists.openembedded.org/g/openembedded-core/message/=
227581" target=3D"_blank">https://lists.openembedded.org/g/openembedded-cor=
e/message/227581</a>


<blockquote>
 On Thu, Jan 15 2026 at 10:55:52 +01:00:00, Markus Volk via
 <a href=3D"http://lists.openembedded.org" target=3D"_blank">lists.openembe=
dded.org</a> &lt;<a href=3D"mailto:f_l_k=3Dt-online.de@lists.openembedded.o=
rg" target=3D"_blank">f_l_k=3Dt-online.de@lists.openembedded.org</a>&gt; wr=
ote:
<blockquote> Signed-off-by: Markus Volk &lt;<a href=3D"mailto:f_l_k@t-onlin=
e.de" target=3D"_blank">f_l_k@t-online.de</a>&gt; ---
 meta-oe/recipes-devtools/libtoml11/<a href=3D"http://libtoml11_4.4.0.bb" t=
arget=3D"_blank">libtoml11_4.4.0.bb</a> | 1 + 1 file
 changed, 1 insertion(+) diff --git
 a/meta-oe/recipes-devtools/libtoml11/<a href=3D"http://libtoml11_4.4.0.bb"=
 target=3D"_blank">libtoml11_4.4.0.bb</a>
 b/meta-oe/recipes-devtools/libtoml11/<a href=3D"http://libtoml11_4.4.0.bb"=
 target=3D"_blank">libtoml11_4.4.0.bb</a> index
 38786b79ed..973a39fc21 100644 ---
 a/meta-oe/recipes-devtools/libtoml11/<a href=3D"http://libtoml11_4.4.0.bb"=
 target=3D"_blank">libtoml11_4.4.0.bb</a> +++
 b/meta-oe/recipes-devtools/libtoml11/<a href=3D"http://libtoml11_4.4.0.bb"=
 target=3D"_blank">libtoml11_4.4.0.bb</a> @@ -28,6
 +28,7 @@ inherit cmake ptest EXTRA_OECMAKE +=3D &quot;-DTOML11_PRECOMPILE=
=3DON
 \ <a href=3D"mailto:-DTOML11_BUILD_TESTS=3D$%7B@bb.utils.contains" target=
=3D"_blank">-DTOML11_BUILD_TESTS=3D${@bb.utils.contains</a>(&quot;DISTRO_FE=
ATURES&quot;,
 &quot;ptest&quot;, &quot;ON&quot;, &quot;OFF&quot;, d)} \ + -DCMAKE_CXX_ST=
ANDARD=3D20 \ &quot;
 ALLOW_EMPTY:${PN} =3D &quot;1&quot;
 --=20
 2.52.0
</blockquote>
 -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
 Links: You receive all messages sent to this group.
 View/Reply Online (#123499): <a href=3D"https://lists.openembedded.org/g/o=
penembedded-devel/message/123499" target=3D"_blank">https://lists.openembed=
ded.org/g/openembedded-devel/message/123499</a>
 Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/117276714/60=
84445" target=3D"_blank">https://lists.openembedded.org/mt/117276714/608444=
5</a>
 Group Owner: <a href=3D"mailto:openembedded-devel+owner@lists.openembedded=
.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a>
 Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-deve=
l/unsub" target=3D"_blank">https://lists.openembedded.org/g/openembedded-de=
vel/unsub</a> [<a href=3D"mailto:skandigraun@gmail.com" target=3D"_blank">s=
kandigraun@gmail.com</a>]
 -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-

</blockquote>
</div></blockquote></div></blockquote></div></div>

--000000000000bce870064872cc8b--

