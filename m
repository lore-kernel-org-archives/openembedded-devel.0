Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F63BE7718B
	for <webhook@archiver.kernel.org>; Thu,  2 Jan 2025 02:12:05 +0000 (UTC)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
 by mx.groups.io with SMTP id smtpd.web11.958.1735783917392005345
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 Jan 2025 18:11:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=FTQutyV9;
 spf=pass (domain: mvista.com, ip: 209.85.208.46, mailfrom: vanusuri@mvista.com)
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-5d122cf8dd1so18807053a12.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 01 Jan 2025 18:11:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1735783916; x=1736388716; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=N0dtySdMx9mVct7A0YOr9rsD7ByclMOTg4MS+kss0Jg=;
        b=FTQutyV9Nm2LZgHMaf+JT5lDXo+As/5bVuvNLYHqOKALVYifs3jvfFSoccuuWWfA/M
         xtBte7zt8mxzCIltkwBTychxRiFy01lpVxmK+D+1Kbn8K5N+0gmupFhlqa7lWy+gVwuj
         HXUZrszEgS+Q1fCX4wDT5VU9fDDkMPZa/QFiw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735783916; x=1736388716;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N0dtySdMx9mVct7A0YOr9rsD7ByclMOTg4MS+kss0Jg=;
        b=PIHR8YGmOWknWHWeWnHKZx3Iw5rDc3h64i+/FtF5bYddX78HpXgVsN9dxqhWZX0PrK
         wj4YFromNg1q/id4Y2ObSFqvJgUdkvzfbg8Y5yeC5Tan7gIuyPsb9ct38pRkGPRXrI4Q
         b6npHmZcxofJS4vI3YSqbvy8orE44qLv0o8SUWybONL2xC959GRY/UlQavJHhtpbfTTY
         JA/1j0DxuBs1aeCWfFuCmERhOsdT+IAsHn3wCucoNkrtwfQIFXqPx2ksYznumENByvpc
         fDDuCT0XG/IqoF29wOV3bng7pxfv7EYT4hx/cPFiV0US8rjynoiUogMUGy5piKFhw991
         47Kg==
X-Forwarded-Encrypted: i=1; AJvYcCX1L+OOJJQxnIwFm7gxgYzW0+NJTZAsdpm0vtXd5EN4U/6BL33UzH8ZrGz2ybe3GVMCgcVhHl4W3mvHialq07E9ukE=@lists.openembedded.org
X-Gm-Message-State: AOJu0YwVftTqxvcBlVyRpO/SfRQ7lzW8ayKBtIvvu/+oEq3rytee8YpU
	0OEQ8qMUJLCm1XAQidFMRj7Q2xDJbFBlv+t6WDRGm6JLbCjHBAIm3relQ4c2HBd9j3ZMNV7KyBV
	QYGnlze/ez9ljEpdtm2K19GZ4E2O8ZnBDNe8q7w==
X-Gm-Gg: ASbGncvRNuCottesu7LVQuzX50YJqd3SPzBXFl/1xA4wQkZO980DS8P1qimDXIfF8OH
	iOzGkir5p6VC9pm6cjyYE2KSJxyPQ0U7YBrMA3F9fOG//Za69NspV84PLJZNYGxHowfdSpLi7
X-Google-Smtp-Source: AGHT+IFplgFUXFQZjti1MNZRJoxBxB8Oq6lGW9Qm7cUEjeqRiOfpngXanzf/oLDUbu6OolxgIcb7WIN0EJK8jCLJF+w=
X-Received: by 2002:a05:6402:5243:b0:5d0:b51c:8479 with SMTP id
 4fb4d7f45d1cf-5d81dd9c935mr39809920a12.10.1735783915518; Wed, 01 Jan 2025
 18:11:55 -0800 (PST)
MIME-Version: 1.0
References: <20241220112053.1866849-1-vanusuri@mvista.com> <AS1PR10MB569764016F8019CF8B9053A9FD072@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
 <AS1PR10MB56975711B8DD243A5224B155FD072@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
In-Reply-To: <AS1PR10MB56975711B8DD243A5224B155FD072@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
From: Vijay Anusuri <vanusuri@mvista.com>
Date: Thu, 2 Jan 2025 07:41:43 +0530
Message-ID: <CANQUz1-Hk5RZy+WCbb--mf+E=MbFQP2dMRi2xjLkbEQV4EwWvg@mail.gmail.com>
Subject: Re: [oe][meta-oe][scarthgap][PATCH] php: upgrade 8.2.24 -> 8.2.26
To: "Marko, Peter" <Peter.Marko@siemens.com>, Armin Kuster <akuster808@gmail.com>, 
	openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Content-Type: multipart/alternative; boundary="000000000000b11454062aafaf93"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 02 Jan 2025 02:12:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114614

--000000000000b11454062aafaf93
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Armin/Team,

Any update on this?

Thanks & Regards,
Vijay

On Fri, Dec 20, 2024 at 9:11=E2=80=AFPM Marko, Peter <Peter.Marko@siemens.c=
om>
wrote:

> Please ignore my comment, I have sent for master, not scrathgap.
> Peter
>
> > -----Original Message-----
> > From: Marko, Peter (FT D EU SK BFS1)
> > Sent: Friday, December 20, 2024 16:40
> > To: vanusuri@mvista.com; openembedded-devel@lists.openembedded.org
> > Subject: RE: [oe][meta-oe][scarthgap][PATCH] php: upgrade 8.2.24 ->
> 8.2.26
> >
> > This patch is missing rebase of patches.
> > I have sent this same upgrade including patch rebase in my larger patch
> series.
> >
> > Peter
> >
> > > -----Original Message-----
> > > From: openembedded-devel@lists.openembedded.org <openembedded-
> > > devel@lists.openembedded.org> On Behalf Of Vijay Anusuri via
> > > lists.openembedded.org
> > > Sent: Friday, December 20, 2024 12:21
> > > To: openembedded-devel@lists.openembedded.org
> > > Cc: Vijay Anusuri <vanusuri@mvista.com>
> > > Subject: [oe][meta-oe][scarthgap][PATCH] php: upgrade 8.2.24 -> 8.2.2=
6
> > >
> > > From: Vijay Anusuri <vanusuri@mvista.com>
> > >
> > > Includes fix for CVE-2024-8929, CVE-2024-11236, CVE-2024-11234 and CV=
E-
> > > 2024-11233
> > >
> > > Changelog:
> > > https://www.php.net/ChangeLog-8.php#8.2.26
> > >
> > > Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> > > ---
> > >  meta-oe/recipes-devtools/php/{php_8.2.24.bb =3D> php_8.2.26.bb} | 2 =
+-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >  rename meta-oe/recipes-devtools/php/{php_8.2.24.bb =3D> php_8.2.26.b=
b}
> > (99%)
> > >
> > > diff --git a/meta-oe/recipes-devtools/php/php_8.2.24.bb
> b/meta-oe/recipes-
> > > devtools/php/php_8.2.26.bb
> > > similarity index 99%
> > > rename from meta-oe/recipes-devtools/php/php_8.2.24.bb
> > > rename to meta-oe/recipes-devtools/php/php_8.2.26.bb
> > > index 034f3bef1..10ef2c36e 100644
> > > --- a/meta-oe/recipes-devtools/php/php_8.2.24.bb
> > > +++ b/meta-oe/recipes-devtools/php/php_8.2.26.bb
> > > @@ -34,7 +34,7 @@ SRC_URI:append:class-target =3D " \
> > >            "
> > >
> > >  S =3D "${WORKDIR}/php-${PV}"
> > > -SRC_URI[sha256sum] =3D
> > > "4cc76ec644eee97d17c92bfe8d0e84714fedf299a538b7dfadc0639dd0dc432f"
> > > +SRC_URI[sha256sum] =3D
> > >
> > "be57c347d451c905bcb4336832a864d9928dd0e20989b872705fea0ba6476c6b"
> > >
> > >  CVE_STATUS_GROUPS +=3D "CVE_STATUS_PHP"
> > >  CVE_STATUS_PHP[status] =3D "fixed-version: The name of this product =
is
> exactly
> > > the same as github.com/emlog/emlog. CVE can be safely ignored."
> > > --
> > > 2.25.1
>
>

--000000000000b11454062aafaf93
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div>Hi Armin/Team,<br><br></div>Any update on this?<=
br><br></div><div>Thanks &amp; Regards,</div><div>Vijay<br></div></div><br>=
<div class=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"=
gmail_attr">On Fri, Dec 20, 2024 at 9:11=E2=80=AFPM Marko, Peter &lt;<a hre=
f=3D"mailto:Peter.Marko@siemens.com">Peter.Marko@siemens.com</a>&gt; wrote:=
<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Please ignore m=
y comment, I have sent for master, not scrathgap.<br>
Peter<br>
<br>
&gt; -----Original Message-----<br>
&gt; From: Marko, Peter (FT D EU SK BFS1)<br>
&gt; Sent: Friday, December 20, 2024 16:40<br>
&gt; To: <a href=3D"mailto:vanusuri@mvista.com" target=3D"_blank">vanusuri@=
mvista.com</a>; <a href=3D"mailto:openembedded-devel@lists.openembedded.org=
" target=3D"_blank">openembedded-devel@lists.openembedded.org</a><br>
&gt; Subject: RE: [oe][meta-oe][scarthgap][PATCH] php: upgrade 8.2.24 -&gt;=
 8.2.26<br>
&gt; <br>
&gt; This patch is missing rebase of patches.<br>
&gt; I have sent this same upgrade including patch rebase in my larger patc=
h series.<br>
&gt; <br>
&gt; Peter<br>
&gt; <br>
&gt; &gt; -----Original Message-----<br>
&gt; &gt; From: <a href=3D"mailto:openembedded-devel@lists.openembedded.org=
" target=3D"_blank">openembedded-devel@lists.openembedded.org</a> &lt;opene=
mbedded-<br>
&gt; &gt; <a href=3D"mailto:devel@lists.openembedded.org" target=3D"_blank"=
>devel@lists.openembedded.org</a>&gt; On Behalf Of Vijay Anusuri via<br>
&gt; &gt; <a href=3D"http://lists.openembedded.org" rel=3D"noreferrer" targ=
et=3D"_blank">lists.openembedded.org</a><br>
&gt; &gt; Sent: Friday, December 20, 2024 12:21<br>
&gt; &gt; To: <a href=3D"mailto:openembedded-devel@lists.openembedded.org" =
target=3D"_blank">openembedded-devel@lists.openembedded.org</a><br>
&gt; &gt; Cc: Vijay Anusuri &lt;<a href=3D"mailto:vanusuri@mvista.com" targ=
et=3D"_blank">vanusuri@mvista.com</a>&gt;<br>
&gt; &gt; Subject: [oe][meta-oe][scarthgap][PATCH] php: upgrade 8.2.24 -&gt=
; 8.2.26<br>
&gt; &gt;<br>
&gt; &gt; From: Vijay Anusuri &lt;<a href=3D"mailto:vanusuri@mvista.com" ta=
rget=3D"_blank">vanusuri@mvista.com</a>&gt;<br>
&gt; &gt;<br>
&gt; &gt; Includes fix for CVE-2024-8929, CVE-2024-11236, CVE-2024-11234 an=
d CVE-<br>
&gt; &gt; 2024-11233<br>
&gt; &gt;<br>
&gt; &gt; Changelog:<br>
&gt; &gt; <a href=3D"https://www.php.net/ChangeLog-8.php#8.2.26" rel=3D"nor=
eferrer" target=3D"_blank">https://www.php.net/ChangeLog-8.php#8.2.26</a><b=
r>
&gt; &gt;<br>
&gt; &gt; Signed-off-by: Vijay Anusuri &lt;<a href=3D"mailto:vanusuri@mvist=
a.com" target=3D"_blank">vanusuri@mvista.com</a>&gt;<br>
&gt; &gt; ---<br>
&gt; &gt;=C2=A0 meta-oe/recipes-devtools/php/{<a href=3D"http://php_8.2.24.=
bb" rel=3D"noreferrer" target=3D"_blank">php_8.2.24.bb</a> =3D&gt; <a href=
=3D"http://php_8.2.26.bb" rel=3D"noreferrer" target=3D"_blank">php_8.2.26.b=
b</a>} | 2 +-<br>
&gt; &gt;=C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt; &gt;=C2=A0 rename meta-oe/recipes-devtools/php/{<a href=3D"http://php_=
8.2.24.bb" rel=3D"noreferrer" target=3D"_blank">php_8.2.24.bb</a> =3D&gt; <=
a href=3D"http://php_8.2.26.bb" rel=3D"noreferrer" target=3D"_blank">php_8.=
2.26.bb</a>}<br>
&gt; (99%)<br>
&gt; &gt;<br>
&gt; &gt; diff --git a/meta-oe/recipes-devtools/php/<a href=3D"http://php_8=
.2.24.bb" rel=3D"noreferrer" target=3D"_blank">php_8.2.24.bb</a> b/meta-oe/=
recipes-<br>
&gt; &gt; devtools/php/<a href=3D"http://php_8.2.26.bb" rel=3D"noreferrer" =
target=3D"_blank">php_8.2.26.bb</a><br>
&gt; &gt; similarity index 99%<br>
&gt; &gt; rename from meta-oe/recipes-devtools/php/<a href=3D"http://php_8.=
2.24.bb" rel=3D"noreferrer" target=3D"_blank">php_8.2.24.bb</a><br>
&gt; &gt; rename to meta-oe/recipes-devtools/php/<a href=3D"http://php_8.2.=
26.bb" rel=3D"noreferrer" target=3D"_blank">php_8.2.26.bb</a><br>
&gt; &gt; index 034f3bef1..10ef2c36e 100644<br>
&gt; &gt; --- a/meta-oe/recipes-devtools/php/<a href=3D"http://php_8.2.24.b=
b" rel=3D"noreferrer" target=3D"_blank">php_8.2.24.bb</a><br>
&gt; &gt; +++ b/meta-oe/recipes-devtools/php/<a href=3D"http://php_8.2.26.b=
b" rel=3D"noreferrer" target=3D"_blank">php_8.2.26.bb</a><br>
&gt; &gt; @@ -34,7 +34,7 @@ SRC_URI:append:class-target =3D &quot; \<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 S =3D &quot;${WORKDIR}/php-${PV}&quot;<br>
&gt; &gt; -SRC_URI[sha256sum] =3D<br>
&gt; &gt; &quot;4cc76ec644eee97d17c92bfe8d0e84714fedf299a538b7dfadc0639dd0d=
c432f&quot;<br>
&gt; &gt; +SRC_URI[sha256sum] =3D<br>
&gt; &gt;<br>
&gt; &quot;be57c347d451c905bcb4336832a864d9928dd0e20989b872705fea0ba6476c6b=
&quot;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 CVE_STATUS_GROUPS +=3D &quot;CVE_STATUS_PHP&quot;<br>
&gt; &gt;=C2=A0 CVE_STATUS_PHP[status] =3D &quot;fixed-version: The name of=
 this product is exactly<br>
&gt; &gt; the same as <a href=3D"http://github.com/emlog/emlog" rel=3D"nore=
ferrer" target=3D"_blank">github.com/emlog/emlog</a>. CVE can be safely ign=
ored.&quot;<br>
&gt; &gt; --<br>
&gt; &gt; 2.25.1<br>
<br>
</blockquote></div>

--000000000000b11454062aafaf93--

