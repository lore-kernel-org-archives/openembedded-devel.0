Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 756A0CFD313
	for <webhook@archiver.kernel.org>; Mon, 24 Nov 2025 17:43:29 +0000 (UTC)
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.22873.1764006201733013210
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 24 Nov 2025 09:43:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gJXZGH1C;
 spf=pass (domain: gmail.com, ip: 209.85.128.179, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-78ab039ddb4so7702807b3.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 24 Nov 2025 09:43:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764006201; x=1764611001; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=nvVgaRAa9CNMh1DPWwYc2kmwH/8RfY9a6wgkdN6Ip0Y=;
        b=gJXZGH1Cfvgm0xS3Pbef2LM7TtKot/T1Fch4Ae71ax40cKlRhxNOpiTz1A4s8G/bxC
         Wl0L8+OIm7aOgQSE7tSZTQ8rG9enDVkTB9T9bLkObNQRCOoN+P6Cg8Q6iSk/nVOttoYH
         2Fijgwc2/cTC9QTc2iBXS6d3iL/0YY0DyTRIWgTIHjipohaTZjwuL7nu7yBbp69WnRIJ
         ulTRpzaOjA7yEq8gu6fLnuhRHz/SdZKSp4cN8LIYg4UuuUmp/lvzIMWDolXCwttn5WV8
         SvlQXAI1YJ0I6EVI9ewUj3dBK322BVGALDbEArqy8NO/4R9y5uhGS7W8DKGjskreEknw
         edsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764006201; x=1764611001;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nvVgaRAa9CNMh1DPWwYc2kmwH/8RfY9a6wgkdN6Ip0Y=;
        b=d1/IV7RKdSLcny3cSTsJdONQM0D0o6a1W81ytVRkvsprflBd/w2N4QFXiR/MZtDkkW
         g2GRAVf0WKB906bRTM4LDEbt5pQ8RLJ3OYMgYt3BdovTfeCA2wb4F94zXJe38MzrvCWD
         UQOYaaecWw7lWek8JH48t3TAaY1/dLPZLZNyJdw/8UwxB0BBnM2y9IustJ9DyA1y9ICY
         ZlNQKLUrUmTBu67On0F5jz2/JbXWYAol3myCZFxJNgsJf7nrbY/xv1Q+9AiNo7KYzXiF
         pJkBqTsd/FgaWgXqBJWmgt4+lkpJel27OPIwZbszKZmAsbZZjE0Pz9P4qacyaC0Pr047
         ya/w==
X-Gm-Message-State: AOJu0Ywxy66rIJnhoc7ozT77OyL38poUHbSf5CV4aPC0YisYuxim2LLa
	zm78IP4xRaS0uFKwvGk7pqFhOZmThgv8IjoFY+HBIoYAY+zDYKt+JEMAUVkMC4bMVJj4iizkojd
	8IzIyTRr6EhVU65lBNy5+Q2oGpBvXMJ8=
X-Gm-Gg: ASbGncsWXXbRdN2U6s7T4xtXvwsyVcySKFUajtg2+zTwUSdom6+Wa8Tz9MIMwQA0e6A
	8GunePnG2ICVGZ8rRdSV7bC+v0lRMk1ZClN63nXryCWWWb2iRQd09L3YhuTI4jwAg13V+Zvt3Yc
	d3CBLA/ByYScph6hLzSWUtAw1LOj8BP7xs5k525/bGNoYCcFLICAoD1B8s7zhMHQgXyqxQwW4op
	sZ7kVE/q7EF8O0T1hkI6M9JxYU6rHp+LSPhWxPzG43jcOmEtBZ+bvVJ22n1noKuRQ53rgb0j2k1
	+vHswRS79qmlXdRrlCzbySbG805wFEdF01zCroYodC2XdHdOZD7Go7d3QNM6rTbSFUaytILt+u/
	IYpVB3nupLloCTmoknoIGcBZNaLndkbpVMfMb0NbtYP+JWg==
X-Google-Smtp-Source: AGHT+IEE6T7rcZxFU/WubKJtj9GkH+/6U6ofwUJrFTWm3GgdnycofLiYvCr1beO+uiL5EeZ/M33sEnuO6zp81M1M+w4=
X-Received: by 2002:a05:690c:6ac2:b0:786:57f5:b498 with SMTP id
 00721157ae682-78a8b567291mr90600367b3.61.1764006200842; Mon, 24 Nov 2025
 09:43:20 -0800 (PST)
MIME-Version: 1.0
References: <187AF2C630F5DA19.66502@lists.openembedded.org> <c3163020-30df-49fe-b0ef-0492c6babe39@gmail.com>
In-Reply-To: <c3163020-30df-49fe-b0ef-0492c6babe39@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 24 Nov 2025 09:42:54 -0800
X-Gm-Features: AWmQ_bnmHMv88swCkziTsYLfvYVlHXSnuYn5_OwAl4nA8-306X1fjsl028fhNjc
Message-ID: <CAMKF1sruQ5153nXHrk3ADaUjYkthyN1=R6v3OaL9oTHczciqxg@mail.gmail.com>
Subject: Re: [oe] CVE report - whinlatter - 2025-11-24
To: skandigraun@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000fb9f5906445ab274"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 24 Nov 2025 17:43:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122018

--000000000000fb9f5906445ab274
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 24, 2025 at 5:09=E2=80=AFAM Gyorgy Sarvari via lists.openembedd=
ed.org
<skandigraun=3Dgmail.com@lists.openembedded.org> wrote:

> On 11/24/25 13:58, Gyorgy Sarvari via lists.openembedded.org wrote:
> > List of all open CVEs (76, out of which new this week: 29):
> >
> >
>
> Hi all,
>
> I would like to add a couple of random notes to this week's reports.
>
> 1. Whinlatter is now part of this report. The base for new/removed
> comparison for the first report is the last week's result from master
> branch.
>
> 2. There are some new CVEs which were missing in previous reports. This
> is because until now I ran the checks with vanilla config, but these
> reports were generated with a config that had more features added to
> cover more recipes. And it has highlighted an issue with the CVE checks
> with universe builds - if a recipe is excluded from building due to a
> missing feature for example, that is excluded from CVE checks also.
> Technically it makes sense, though I still find it somewhat unexpected.
> Will try to spend some time on looking into bitbake about this, because
> it makes it harder to get a fuller picture.
>
> 3. When I started sending these reports, I mentioned that I plan send
> them till the end of November as an experiment. The end of November is
> here - anybody has anything against getting these reports in the future?
> Personally I think that they are useful even with their limitations, but
> I might be biased, since I started it to scratch my own itch. If no one
> will speak up, will keep sending them.
>
> Let me know if you have any questions or comments, either on this ML or
> in private message.
>

I think this is good information for the community so I would prefer that
you
keep sending them. This does spur discussion like where we looked into
dropping yasm, and figured that it's perhaps good to drop it now that
chromium no longer needs it.  nudge Ross ;)


>
> Thank you,
> Gyorgy
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#122013):
> https://lists.openembedded.org/g/openembedded-devel/message/122013
> Mute This Topic: https://lists.openembedded.org/mt/116450609/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000fb9f5906445ab274
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Nov 24,=
 2025 at 5:09=E2=80=AFAM Gyorgy Sarvari via <a href=3D"http://lists.openemb=
edded.org">lists.openembedded.org</a> &lt;skandigraun=3D<a href=3D"mailto:g=
mail.com@lists.openembedded.org">gmail.com@lists.openembedded.org</a>&gt; w=
rote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On 11/24/2=
5 13:58, Gyorgy Sarvari via <a href=3D"http://lists.openembedded.org" rel=
=3D"noreferrer" target=3D"_blank">lists.openembedded.org</a> wrote:<br>
&gt; List of all open CVEs (76, out of which new this week: 29):<br>
&gt;<br>
&gt;<br>
<br>
Hi all,<br>
<br>
I would like to add a couple of random notes to this week&#39;s reports.<br=
>
<br>
1. Whinlatter is now part of this report. The base for new/removed<br>
comparison for the first report is the last week&#39;s result from master<b=
r>
branch.<br>
<br>
2. There are some new CVEs which were missing in previous reports. This<br>
is because until now I ran the checks with vanilla config, but these<br>
reports were generated with a config that had more features added to<br>
cover more recipes. And it has highlighted an issue with the CVE checks<br>
with universe builds - if a recipe is excluded from building due to a<br>
missing feature for example, that is excluded from CVE checks also.<br>
Technically it makes sense, though I still find it somewhat unexpected.<br>
Will try to spend some time on looking into bitbake about this, because<br>
it makes it harder to get a fuller picture.<br>
<br>
3. When I started sending these reports, I mentioned that I plan send<br>
them till the end of November as an experiment. The end of November is<br>
here - anybody has anything against getting these reports in the future?<br=
>
Personally I think that they are useful even with their limitations, but<br=
>
I might be biased, since I started it to scratch my own itch. If no one<br>
will speak up, will keep sending them.<br>
<br>
Let me know if you have any questions or comments, either on this ML or<br>
in private message.<br></blockquote><div><br></div><div>I think this is goo=
d information for the community so I would prefer that you</div><div>keep s=
ending them. This does spur discussion like where we looked into</div><div>=
dropping yasm, and figured that it&#39;s perhaps good to drop it now that</=
div><div>chromium no longer needs it.=C2=A0 nudge Ross ;)</div><div>=C2=A0<=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Thank you,<br>
Gyorgy<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#122013): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/122013" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/122013</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/116450609/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/116450609/1997914</a><br>
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

--000000000000fb9f5906445ab274--

