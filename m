Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7C86C4345F
	for <webhook@archiver.kernel.org>; Fri, 12 Apr 2024 00:12:09 +0000 (UTC)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
 by mx.groups.io with SMTP id smtpd.web11.35323.1712880723264795504
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 11 Apr 2024 17:12:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KJ7VST24;
 spf=pass (domain: gmail.com, ip: 209.85.128.181, mailfrom: ticotimo@gmail.com)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-61871ad6cabso3722977b3.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 11 Apr 2024 17:12:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712880722; x=1713485522; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=vPvDrpDmC2jIAP/jDfeB+ikc0ji0rlWoPTXpWnVZYbE=;
        b=KJ7VST24c5j+4x3ZVHjBr0cPEl4PNkwL0CjD6oifqzm4J7wKVWcsobJ0OgM954dJ0U
         T0j7sG+37pobjaqJhJb3uqclPnnKxntMXm6Pgs2WWUg/ObQ1j0FpMTjvSnRIiXb0fuvv
         9W2JnHkYpJUjauvd39B20bHIl9ojxNw9TXLdwpnKakK50JwzJV/i3aISbosB2vcJcZY7
         8pjquM7P8feu8zSqS3TONz+/ORkKyJz4pkhBQewLNmX3ELqYks/XgrtRGIfmiIoYyjRV
         xSGnkiafwrn8rMgOTG85SGYJ4Xr1Zaz2dQORMLrQaXzCAQzbx7jtRCAV9O+pV90lPb4Z
         Eomg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712880722; x=1713485522;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vPvDrpDmC2jIAP/jDfeB+ikc0ji0rlWoPTXpWnVZYbE=;
        b=tmpEWtBd/WwAEQjG5jt1AFKqAElUIfoPI91mwXmf7p5C8EmkQ8hndqQdhYeUHF/VeL
         kCfRNWiLWUCc9F6V8WJg6NirBKgtZs10lve1ZqdCsO305Z7Gm6z5jJbl3NujMGJp4bR3
         1IK4qbzSaem7Pas49++WDb27zsYBzSwor8CpKkWJZHs3zdg+tx5t7u03HOt70UdAEEuo
         wKmp70OncRy/DFb+ATulGf9qgemN4Bvm4U2cxmbRtu36lL/8xtczTSC7SfKxRir4gQsE
         fh2S1P5SJSlvy6QaxkgnT566ErOwZkjIZIeZdiQhboxHkddCTgVJAtn0W9SS2LxJaV9m
         W0NA==
X-Forwarded-Encrypted: i=1; AJvYcCXAdDqmwKNkYll9qI62mPp9L69CXYiIIbi0wK4g9Mlls91ugc7aYG4UUK9mdlikNo/PQjfnmlzAD4uFrqaJvhA+YOi46QUWw4ayDwn7/XZWHVdHMKEut+GlFg==
X-Gm-Message-State: AOJu0YyE7nPPb3N9FIeUSqBcEEibem6SMmuPcoszbq/u8YnCSbwDfwKg
	unIYXKVs7B099W3mv82NdpQOox06FnTlgXG1Q+e6SAYQ1TpDMTJsSFE4b7nJR+AwNtYwgs8AY+B
	XlSwIGlzTpMai8eVEhZ711p6tUok=
X-Google-Smtp-Source: AGHT+IEDbRzSKayiVEC3XWmjxSP6m9bJvGPZzdZPbepoqa/3JJ4Za43kYp+0l0avxeeUqtFKwTAasJ8FfVPZL37/b0c=
X-Received: by 2002:a0d:dd47:0:b0:609:f87b:aad3 with SMTP id
 g68-20020a0ddd47000000b00609f87baad3mr1028498ywe.31.1712880722352; Thu, 11
 Apr 2024 17:12:02 -0700 (PDT)
MIME-Version: 1.0
References: <20240411192456.2974073-1-geoffrey.parker@arthrex.com>
 <20240411192456.2974073-2-geoffrey.parker@arthrex.com> <CANx9H-CyW7d0QPWDeFubU=XOXJ0ca5KZxF1pe=y+88MVEZX6VA@mail.gmail.com>
 <PH7PR11MB69804665686E6CC9FCBC5D48E7042@PH7PR11MB6980.namprd11.prod.outlook.com>
In-Reply-To: <PH7PR11MB69804665686E6CC9FCBC5D48E7042@PH7PR11MB6980.namprd11.prod.outlook.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Thu, 11 Apr 2024 17:11:51 -0700
Message-ID: <CANx9H-AAkUPb6uS2_ZuN-gGptV8=cKi9w5Vz2ZLq3W7-iFTMFw@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH 2/2] python3-pycurl: extend for native
 and nativesdk
To: Geoff Parker <geoffrey.parker@arthrex.com>, Khem Raj <raj.khem@gmail.com>
Cc: Geoff Parker <geoffhp@gmail.com>, 
	"openembedded-devel@lists.openembedded.org" <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000ffa4660615db1ee2"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 12 Apr 2024 00:12:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109931

--000000000000ffa4660615db1ee2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I think your comments in this thread are sufficient, or khem can add them
to the commit messages manually before merging. I leave that up to khem,
since I don't actually do the merge staging.

But thank you for confirming. We've had some churn in this area very
recently and need to make sure things are under control. In scarthgap and
beyond we are all counting on meta-openembedded being (nearly) a first tier
provider.

On Thu, Apr 11, 2024 at 5:05=E2=80=AFPM Geoff Parker <geoffrey.parker@arthr=
ex.com>
wrote:

> Hi Tim,
>
> I have built both the nativesdk-python3-pycurl and python3-pycurl-native
> variants, and also nativesdk-python3-tornado and python3-tornado-native
> packages successfully.  Should I  resubmit this patch series with amended
>  commit messages?
>
>
>
> *From:* Tim Orling <ticotimo@gmail.com>
> *Sent:* Thursday, April 11, 2024 4:39 PM
> *To:* Geoff Parker <geoffhp@gmail.com>
> *Cc:* Geoff Parker <geoffrey.parker@arthrex.com>;
> openembedded-devel@lists.openembedded.org
> *Subject:* Re: [oe] [meta-python][PATCH 2/2] python3-pycurl: extend for
> native and nativesdk
>
>
>
> Same as the other in the series. We need confirmation that you have
> personally built both conditions and all dependencies were met.
>
>
>
> I apologize for being pedantic, but we must have traceability to these
> changes.
>
>
>
> On Thu, Apr 11, 2024 at 12:33=E2=80=AFPM Geoff Parker <geoffhp@gmail.com>=
 wrote:
>
> From: Geoff Parker <geoffrey.parker@arthrex.com>
>
> Signed-off-by: Geoff Parker <geoffrey.parker@arthrex.com>
> ---
>  meta-python/recipes-devtools/python/python3-pycurl_7.45.2.bb
> <https://urldefense.com/v3/__http:/python3-pycurl_7.45.2.bb__;!!P192cPdC!=
jeSnczE12LlRo8pRl3C5KjsZd5ocJICxS1ZlJYre9kHauOhS1zcCHp8d4Z14yBqaGgUyim7M7r7=
AI7JEkVFhOUc$>
> | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meta-python/recipes-devtools/python/python3-pycurl_7.45.2.bb
> <https://urldefense.com/v3/__http:/python3-pycurl_7.45.2.bb__;!!P192cPdC!=
jeSnczE12LlRo8pRl3C5KjsZd5ocJICxS1ZlJYre9kHauOhS1zcCHp8d4Z14yBqaGgUyim7M7r7=
AI7JEkVFhOUc$>
> b/meta-python/recipes-devtools/python/python3-pycurl_7.45.2.bb
> <https://urldefense.com/v3/__http:/python3-pycurl_7.45.2.bb__;!!P192cPdC!=
jeSnczE12LlRo8pRl3C5KjsZd5ocJICxS1ZlJYre9kHauOhS1zcCHp8d4Z14yBqaGgUyim7M7r7=
AI7JEkVFhOUc$>
> index fb2a41d26..a6863e21f 100644
> --- a/meta-python/recipes-devtools/python/python3-pycurl_7.45.2.bb
> <https://urldefense.com/v3/__http:/python3-pycurl_7.45.2.bb__;!!P192cPdC!=
jeSnczE12LlRo8pRl3C5KjsZd5ocJICxS1ZlJYre9kHauOhS1zcCHp8d4Z14yBqaGgUyim7M7r7=
AI7JEkVFhOUc$>
> +++ b/meta-python/recipes-devtools/python/python3-pycurl_7.45.2.bb
> <https://urldefense.com/v3/__http:/python3-pycurl_7.45.2.bb__;!!P192cPdC!=
jeSnczE12LlRo8pRl3C5KjsZd5ocJICxS1ZlJYre9kHauOhS1zcCHp8d4Z14yBqaGgUyim7M7r7=
AI7JEkVFhOUc$>
> @@ -17,3 +17,5 @@ SRC_URI[sha256sum] =3D
> "5730590be0271364a5bddd9e245c9cc0fb710c4cbacbdd95264a3122d2
>  DEPENDS =3D "curl"
>
>  inherit pypi setuptools3
> +
> +BBCLASSEXTEND  +=3D "native nativesdk"
> --
> 2.30.2
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#109925):
> https://lists.openembedded.org/g/openembedded-devel/message/109925
> <https://urldefense.com/v3/__https:/lists.openembedded.org/g/openembedded=
-devel/message/109925__;!!P192cPdC!jeSnczE12LlRo8pRl3C5KjsZd5ocJICxS1ZlJYre=
9kHauOhS1zcCHp8d4Z14yBqaGgUyim7M7r7AI7JEUh_1Fx4$>
> Mute This Topic: https://lists.openembedded.org/mt/105470005/924729
> <https://urldefense.com/v3/__https:/lists.openembedded.org/mt/105470005/9=
24729__;!!P192cPdC!jeSnczE12LlRo8pRl3C5KjsZd5ocJICxS1ZlJYre9kHauOhS1zcCHp8d=
4Z14yBqaGgUyim7M7r7AI7JEcwWxCGU$>
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub
> <https://urldefense.com/v3/__https:/lists.openembedded.org/g/openembedded=
-devel/unsub__;!!P192cPdC!jeSnczE12LlRo8pRl3C5KjsZd5ocJICxS1ZlJYre9kHauOhS1=
zcCHp8d4Z14yBqaGgUyim7M7r7AI7JEuz_aTBw$>
> [ticotimo@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
> This e-mail and any files transmitted with it are the property of Arthrex=
,
> Inc. and/or its affiliates, are confidential, and are intended solely for
> the use of the individual or entity to whom this e-mail is addressed. If
> you are not one of the named recipient(s) or otherwise have reason to
> believe that you have received this message in error, please notify the
> sender at 239-643-5553 and delete this message immediately from your
> computer. Any other use, retention, dissemination forwarding, printing or
> copying of this e-mail is strictly prohibited. Please note that any views
> or opinions presented in this email are solely those of the author and do
> not necessarily represent those of the company. Finally, while Arthrex us=
es
> virus protection, the recipient should check this email and any attachmen=
ts
> for the presence of viruses. The company accepts no liability for any
> damage caused by any virus transmitted by this email.
>

--000000000000ffa4660615db1ee2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I think your comments in this thread are sufficient, or kh=
em can add them to the commit messages manually before merging. I leave tha=
t up to khem, since I don&#39;t actually do the merge staging.<div><br></di=
v><div>But thank you for confirming. We&#39;ve had some churn in this area =
very recently and need to make sure things are under control. In scarthgap=
=C2=A0and beyond we are all counting on meta-openembedded being (nearly) a =
first tier provider.</div></div><br><div class=3D"gmail_quote"><div dir=3D"=
ltr" class=3D"gmail_attr">On Thu, Apr 11, 2024 at 5:05=E2=80=AFPM Geoff Par=
ker &lt;<a href=3D"mailto:geoffrey.parker@arthrex.com">geoffrey.parker@arth=
rex.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex"><div class=3D"msg1028580264188453782">





<div lang=3D"EN-US" style=3D"overflow-wrap: break-word;">
<div class=3D"m_1028580264188453782WordSection1">
<p class=3D"MsoNormal">Hi Tim,<br>
<br>
I have built both the nativesdk-python3-pycurl and python3-pycurl-native va=
riants, and also nativesdk-python3-tornado and python3-tornado-native packa=
ges successfully.=C2=A0 Should I =C2=A0resubmit this patch series with amen=
ded =C2=A0commit messages?<u></u><u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<div style=3D"border-right:none;border-bottom:none;border-left:none;border-=
top:1pt solid rgb(225,225,225);padding:3pt 0in 0in">
<p class=3D"MsoNormal"><b>From:</b> Tim Orling &lt;<a href=3D"mailto:ticoti=
mo@gmail.com" target=3D"_blank">ticotimo@gmail.com</a>&gt; <br>
<b>Sent:</b> Thursday, April 11, 2024 4:39 PM<br>
<b>To:</b> Geoff Parker &lt;<a href=3D"mailto:geoffhp@gmail.com" target=3D"=
_blank">geoffhp@gmail.com</a>&gt;<br>
<b>Cc:</b> Geoff Parker &lt;<a href=3D"mailto:geoffrey.parker@arthrex.com" =
target=3D"_blank">geoffrey.parker@arthrex.com</a>&gt;; <a href=3D"mailto:op=
enembedded-devel@lists.openembedded.org" target=3D"_blank">openembedded-dev=
el@lists.openembedded.org</a><br>
<b>Subject:</b> Re: [oe] [meta-python][PATCH 2/2] python3-pycurl: extend fo=
r native and nativesdk<u></u><u></u></p>
</div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<div>
<p class=3D"MsoNormal">Same as the other in the series. We need confirmatio=
n that you have personally built both conditions and all dependencies were =
met.<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">I apologize for being pedantic, but we must have tra=
ceability to these changes.<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<div>
<div>
<p class=3D"MsoNormal">On Thu, Apr 11, 2024 at 12:33=E2=80=AFPM Geoff Parke=
r &lt;<a href=3D"mailto:geoffhp@gmail.com" target=3D"_blank">geoffhp@gmail.=
com</a>&gt; wrote:<u></u><u></u></p>
</div>
<blockquote style=3D"border-top:none;border-right:none;border-bottom:none;b=
order-left:1pt solid rgb(204,204,204);padding:0in 0in 0in 6pt;margin-left:4=
.8pt;margin-right:0in">
<p class=3D"MsoNormal" style=3D"margin-bottom:12pt">From: Geoff Parker &lt;=
<a href=3D"mailto:geoffrey.parker@arthrex.com" target=3D"_blank">geoffrey.p=
arker@arthrex.com</a>&gt;<br>
<br>
Signed-off-by: Geoff Parker &lt;<a href=3D"mailto:geoffrey.parker@arthrex.c=
om" target=3D"_blank">geoffrey.parker@arthrex.com</a>&gt;<br>
---<br>
=C2=A0meta-python/recipes-devtools/python/<a href=3D"https://urldefense.com=
/v3/__http:/python3-pycurl_7.45.2.bb__;!!P192cPdC!jeSnczE12LlRo8pRl3C5KjsZd=
5ocJICxS1ZlJYre9kHauOhS1zcCHp8d4Z14yBqaGgUyim7M7r7AI7JEkVFhOUc$" target=3D"=
_blank">python3-pycurl_7.45.2.bb</a> | 2
 ++<br>
=C2=A01 file changed, 2 insertions(+)<br>
<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"https://urldefe=
nse.com/v3/__http:/python3-pycurl_7.45.2.bb__;!!P192cPdC!jeSnczE12LlRo8pRl3=
C5KjsZd5ocJICxS1ZlJYre9kHauOhS1zcCHp8d4Z14yBqaGgUyim7M7r7AI7JEkVFhOUc$" tar=
get=3D"_blank">python3-pycurl_7.45.2.bb</a>
 b/meta-python/recipes-devtools/python/<a href=3D"https://urldefense.com/v3=
/__http:/python3-pycurl_7.45.2.bb__;!!P192cPdC!jeSnczE12LlRo8pRl3C5KjsZd5oc=
JICxS1ZlJYre9kHauOhS1zcCHp8d4Z14yBqaGgUyim7M7r7AI7JEkVFhOUc$" target=3D"_bl=
ank">python3-pycurl_7.45.2.bb</a><br>
index fb2a41d26..a6863e21f 100644<br>
--- a/meta-python/recipes-devtools/python/<a href=3D"https://urldefense.com=
/v3/__http:/python3-pycurl_7.45.2.bb__;!!P192cPdC!jeSnczE12LlRo8pRl3C5KjsZd=
5ocJICxS1ZlJYre9kHauOhS1zcCHp8d4Z14yBqaGgUyim7M7r7AI7JEkVFhOUc$" target=3D"=
_blank">python3-pycurl_7.45.2.bb</a><br>
+++ b/meta-python/recipes-devtools/python/<a href=3D"https://urldefense.com=
/v3/__http:/python3-pycurl_7.45.2.bb__;!!P192cPdC!jeSnczE12LlRo8pRl3C5KjsZd=
5ocJICxS1ZlJYre9kHauOhS1zcCHp8d4Z14yBqaGgUyim7M7r7AI7JEkVFhOUc$" target=3D"=
_blank">python3-pycurl_7.45.2.bb</a><br>
@@ -17,3 +17,5 @@ SRC_URI[sha256sum] =3D &quot;5730590be0271364a5bddd9e245c=
9cc0fb710c4cbacbdd95264a3122d2<br>
=C2=A0DEPENDS =3D &quot;curl&quot;<br>
<br>
=C2=A0inherit pypi setuptools3<br>
+<br>
+BBCLASSEXTEND=C2=A0 +=3D &quot;native nativesdk&quot;<br>
-- <br>
2.30.2<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#109925): <a href=3D"https://urldefense.com/v3/__https:/=
lists.openembedded.org/g/openembedded-devel/message/109925__;!!P192cPdC!jeS=
nczE12LlRo8pRl3C5KjsZd5ocJICxS1ZlJYre9kHauOhS1zcCHp8d4Z14yBqaGgUyim7M7r7AI7=
JEUh_1Fx4$" target=3D"_blank">
https://lists.openembedded.org/g/openembedded-devel/message/109925</a><br>
Mute This Topic: <a href=3D"https://urldefense.com/v3/__https:/lists.openem=
bedded.org/mt/105470005/924729__;!!P192cPdC!jeSnczE12LlRo8pRl3C5KjsZd5ocJIC=
xS1ZlJYre9kHauOhS1zcCHp8d4Z14yBqaGgUyim7M7r7AI7JEcwWxCGU$" target=3D"_blank=
">
https://lists.openembedded.org/mt/105470005/924729</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">
openembedded-devel+owner@lists.openembedded.org</a><br>
Unsubscribe: <a href=3D"https://urldefense.com/v3/__https:/lists.openembedd=
ed.org/g/openembedded-devel/unsub__;!!P192cPdC!jeSnczE12LlRo8pRl3C5KjsZd5oc=
JICxS1ZlJYre9kHauOhS1zcCHp8d4Z14yBqaGgUyim7M7r7AI7JEuz_aTBw$" target=3D"_bl=
ank">
https://lists.openembedded.org/g/openembedded-devel/unsub</a> [<a href=3D"m=
ailto:ticotimo@gmail.com" target=3D"_blank">ticotimo@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<u></u><u></u></p>
</blockquote>
</div>
</div>
</div>
This e-mail and any files transmitted with it are the property of Arthrex, =
Inc. and/or its affiliates, are confidential, and are intended solely for t=
he use of the individual or entity to whom this e-mail is addressed. If you=
 are not one of the named recipient(s)
 or otherwise have reason to believe that you have received this message in=
 error, please notify the sender at 239-643-5553 and delete this message im=
mediately from your computer. Any other use, retention, dissemination forwa=
rding, printing or copying of this
 e-mail is strictly prohibited. Please note that any views or opinions pres=
ented in this email are solely those of the author and do not necessarily r=
epresent those of the company. Finally, while Arthrex uses virus protection=
, the recipient should check this
 email and any attachments for the presence of viruses. The company accepts=
 no liability for any damage caused by any virus transmitted by this email.
</div>

</div></blockquote></div>

--000000000000ffa4660615db1ee2--

