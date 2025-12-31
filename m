Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44AF7EE57CE
	for <webhook@archiver.kernel.org>; Wed, 31 Dec 2025 00:59:37 +0000 (UTC)
Received: from mail-yx1-f49.google.com (mail-yx1-f49.google.com [74.125.224.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.77278.1767142767609904829
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Dec 2025 16:59:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dAGK/9UV;
 spf=pass (domain: gmail.com, ip: 74.125.224.49, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f49.google.com with SMTP id 956f58d0204a3-64471fcdef0so8279718d50.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 30 Dec 2025 16:59:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767142767; x=1767747567; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=U2qSlyxGymSwqw9KKSvdbrqoXCHXvx9etWTwPRqOj14=;
        b=dAGK/9UVTYMNkyt+4O0+EQRuzw9jk0XKMiOf4JpuGZnfEP+2MgQL0zhMR7nz4icod8
         FEyALkxmV0DwelV6bkgE5kH0D1pFaaXKtkpP7sDojv0nTPfmM/vFCUaohJi2ezRcuhfB
         1lrPxsLFesk2AcWuQ2TEwkmeh7CrWui3d+YyWC1xYdmHJUTzI1qNrAMo6AGpU+Y/WPfd
         WjMHbzKLf1n/I0GfLT7BVHRig129QT+tYZaMPKlOLWq41OWXDpn6V6DRTm4ct7GxwY9y
         bHK/VykZWPr3uLpb23ua6/O4SDKPqor2NV+U4EYD2Vd0vAJYo2fRtHxjd61MZzHJNFe9
         cmDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767142767; x=1767747567;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U2qSlyxGymSwqw9KKSvdbrqoXCHXvx9etWTwPRqOj14=;
        b=I2mwpHqqyAMhQ1Tm0gnedlBbjH0xROXQeXaNks+JRKpdhUHkyJ4iOA8TgYIu6a9jf8
         qR1QgAZfWFEXwVpBuqsjqffG0PeGnxQl+nw/6xmHTB91OsX47TX5q40GGjUPwWV95o7d
         ajMC0TbclqwYoB4N5RAvsPGACQzW/DlbBoLavu1Tjv98kfU9s7f0nwZciX192kKVmbde
         SecuVYG9gANui3E9oLMh1sPGoS+y2I5fyGwx/kRNY1Oq/10f2KT/z94LgB8moqtJ9CgE
         RbOuqrL4Z95e1zNCerFYU3po8lD/UPQraNuwpgk2S7YrxKdLIzGfI9CHJ2wq1TqzwKq7
         0nwg==
X-Gm-Message-State: AOJu0Yw3OSvjXA1uHdtAT/DHFt1n+h91atNinkpEIyRk5lUg9cNURplj
	D3+ZLvlVtooQWi0SpAp2xko5WqODHBv7fYpZIQKnD/vAsGBfpxQQmOIR4kfOtFm5O1fqH0AXAl2
	KCVxqDQ6I7JfwZYxZNLApCfkYuJ/PmHY=
X-Gm-Gg: AY/fxX6G/etyNjDFq8BMdHBPHgPefNtJ75m/d+ZHKBAjGsPdHS/+8LkVOoQzXv9i226
	nC6ebnDijbTM/dw6n0Wy+qrak50kPr6uhZZMJpsRTwwZ4SkPgVdX7NBWasC6q6vpqIph05+9rVx
	Pt0pKtwh3tG1zoFTDXulwP7DOgY1jD3/0YgQpl6k1mtWwEnFd8iYPEkAx3YhF8oDmZaRjhzJ3Bl
	pYuq3I3AIFhaZqpGfVno0KiOJ7ZihiMAMV7e14j5xjUR194g2QXigdHA0AH88dljr3iyf9b6N/q
	gX4WJbd3/A07pJ+kwHT071AEeJaRlpCwZTm4JiV7KSFjRNSq0tArvdgsgdvAda3XVVtocAc290I
	Rp4vwXynJcm0DfoC32/i1GaKyR1A=
X-Google-Smtp-Source: AGHT+IGt1BLyrEexeDcutUT69JZrPzAhh5TERwjYdQk+y57eaErWHrXNVF6hHMOh+RX0wkgpkPvtW1fTY93d46zcuWQ=
X-Received: by 2002:a05:690c:4912:b0:78d:7307:769f with SMTP id
 00721157ae682-78fb3f03ff1mr609940697b3.3.1767142766643; Tue, 30 Dec 2025
 16:59:26 -0800 (PST)
MIME-Version: 1.0
References: <3d4935dc-f9b9-400e-831e-843104190500@gmail.com>
In-Reply-To: <3d4935dc-f9b9-400e-831e-843104190500@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 30 Dec 2025 16:59:00 -0800
X-Gm-Features: AQt7F2pxMc0Nr19mU23QmJmbkzfbZ7FdDb0h7pPMw2uYI_JkQjErdhYDUA0NGpk
Message-ID: <CAMKF1spztuv101FcQgyozBBwoowjNBMpJvtO7Xy0P7x_XrRWrQ@mail.gmail.com>
Subject: Re: [oe] Many CVE_PRODUCTS patches
To: skandigraun@gmail.com
Cc: "openembedded-devel@lists.openembedded.org" <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000df8ee7064734fc5e"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 31 Dec 2025 00:59:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123038

--000000000000df8ee7064734fc5e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

such patches are quite useful as they improve the recipe quality, so keep
it up.

On Tue, Dec 30, 2025 at 7:51=E2=80=AFAM Gyorgy Sarvari via lists.openembedd=
ed.org
<skandigraun=3Dgmail.com@lists.openembedded.org> wrote:

> Apologies for this CVE_PRODUCT patch-tsunami.
>
> While reviewing an earlier submitted CVE patch, I was wondering why that
> CVE didn't show up in the CVE report - it turned out that almost all
> recipes using the pypi class use the default CVE_PRODUCT, however there
> are quite a few where it is not appropriate, making the cve-checker to
> miss relevant CVEs.
>
> For today I don't plan to spam further, but I'm only about halfway
> through my list for the master branch, about the same amount left for
> tomorrow-ish.
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#123037):
> https://lists.openembedded.org/g/openembedded-devel/message/123037
> Mute This Topic: https://lists.openembedded.org/mt/116999150/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000df8ee7064734fc5e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">such patches are quite useful as they improve the recipe q=
uality, so keep it up.</div><br><div class=3D"gmail_quote gmail_quote_conta=
iner"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Dec 30, 2025 at 7:51=E2=
=80=AFAM Gyorgy Sarvari via <a href=3D"http://lists.openembedded.org">lists=
.openembedded.org</a> &lt;skandigraun=3D<a href=3D"mailto:gmail.com@lists.o=
penembedded.org">gmail.com@lists.openembedded.org</a>&gt; wrote:<br></div><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex">Apologies for this CVE_PRO=
DUCT patch-tsunami.=C2=A0<br>
<br>
While reviewing an earlier submitted CVE patch, I was wondering why that<br=
>
CVE didn&#39;t show up in the CVE report - it turned out that almost all<br=
>
recipes using the pypi class use the default CVE_PRODUCT, however there<br>
are quite a few where it is not appropriate, making the cve-checker to<br>
miss relevant CVEs.<br>
<br>
For today I don&#39;t plan to spam further, but I&#39;m only about halfway<=
br>
through my list for the master branch, about the same amount left for<br>
tomorrow-ish.<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#123037): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/123037" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/123037</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/116999150/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/116999150/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" targ=
et=3D"_blank">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--000000000000df8ee7064734fc5e--

