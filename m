Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38327E77199
	for <webhook@archiver.kernel.org>; Tue,  7 Jan 2025 12:59:58 +0000 (UTC)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
 by mx.groups.io with SMTP id smtpd.web11.19528.1736254795188145241
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 07 Jan 2025 04:59:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=I7rieHjY;
 spf=pass (domain: mvista.com, ip: 209.85.208.50, mailfrom: vanusuri@mvista.com)
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5d8c1950da7so15458304a12.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 07 Jan 2025 04:59:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1736254793; x=1736859593; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=oFmB3e2mk67Ig0++xx0+mWAzYHAY+5waefJvKuFWQ5g=;
        b=I7rieHjYiu/AMmhj9KDkVY7IL5qUO1fHKRqkscd+Wx0CJxpICkmPlLT/M3IZ7f6LwF
         Tog6TFb+nSiaZZbJCPDb7Kcsws5AXNge7dtHQ9nBPd2IuF5EfwzUSjOYIajxs8SJB3Dd
         ueyJW6pxlMEDeFsXPpdmYHvToMbEGDM9Y+Iyo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736254793; x=1736859593;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oFmB3e2mk67Ig0++xx0+mWAzYHAY+5waefJvKuFWQ5g=;
        b=oYHKMoi6XOdTgByhAhnpA8NawogU2PaVWJKeOHXxDH8CGhl0wZ7znFFfISAZYz/OuA
         4pPWM23OAY5lHc3YJEKagYuVmM6DXwGJVcL/C6oUVWbpCvguyuRT0DvTEFdaStSxjkYc
         hzC5CdXG+cgIe5dmIXykx25F9mlB5Xqgb6LHT2+aR1ep8Kv03Vzd535cNymbkFQVzqv3
         RFfcTzL0SmvIgt3gz1d3v6VZu+rRMbQScnY5LwKBGhzuVHyf1BgPsB7iNEf467FFpIu6
         +fX5otnJVwkdMowamoHvV6A1UUdnmOq0DMAKSGGUKXTaxzgafGNmYc7m1JYFuFPazGep
         l5iA==
X-Forwarded-Encrypted: i=1; AJvYcCVQ2R47DpugmYA+x2ctOIF/dnwiXhFtmULo4x4ut9Fpy/TVhhg+bfrOFY0VG8JJGsiWYmDONZHBjOHj/esPd8X45NU=@lists.openembedded.org
X-Gm-Message-State: AOJu0Yxs1BFQbn6TDdgPT6sxJwvKmgTDhXECgFpAU4CILnAJp2eGHQGM
	O3A+428naMWgtAM8X8B3SjJ/Z4fciEyupgXORp9ajcvzETBtB3ePykFuHeKKhyLognat5vcr1lp
	ySzs322qYY1f6FebTw3Mjuhp8XhstjOAm92g2XQ==
X-Gm-Gg: ASbGncvT046KGd/GFzcFfaPN4l5+krHPOw2xh1wqD/ybAaIjDVu06lZPvs6lYCLWDUv
	dJzDCXgDUVs/+tBAvtmhYd5RAq8Q+IciM8m/PzGUEvevZYsyQcrUhXlRp54LFct9JyN9yzg2R
X-Google-Smtp-Source: AGHT+IEgDOjNb/nYhJoInSxH4iqW0rpq3i1Hz8PFWpkaIdf3RCMQqqaIBVffO8GRrGPE2YVOL/lt7sDnGEsLDvC/XsM=
X-Received: by 2002:a05:6402:4403:b0:5d3:d7b0:b834 with SMTP id
 4fb4d7f45d1cf-5d81dd84a77mr50864868a12.1.1736254793219; Tue, 07 Jan 2025
 04:59:53 -0800 (PST)
MIME-Version: 1.0
References: <20241220112053.1866849-1-vanusuri@mvista.com> <AS1PR10MB569764016F8019CF8B9053A9FD072@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
 <AS1PR10MB56975711B8DD243A5224B155FD072@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
 <1816BE46D4FBD9B0.1259@lists.openembedded.org>
In-Reply-To: <1816BE46D4FBD9B0.1259@lists.openembedded.org>
From: Vijay Anusuri <vanusuri@mvista.com>
Date: Tue, 7 Jan 2025 18:29:40 +0530
X-Gm-Features: AbW1kvbFWFgG1fsEIjoEZkSUnzrmIanab3Tc48raa_OcnZPc2XzHx7IuJEW8uDA
Message-ID: <CANQUz19DKHDFVYPH-nK0oBnopaLom2ymKBK1=9LsTrAr3hbG8A@mail.gmail.com>
Subject: Re: [oe][meta-oe][scarthgap][PATCH] php: upgrade 8.2.24 -> 8.2.26
To: vanusuri@mvista.com
Cc: "Marko, Peter" <Peter.Marko@siemens.com>, Armin Kuster <akuster808@gmail.com>, 
	openembedded-devel@lists.openembedded.org, Khem Raj <raj.khem@gmail.com>
Content-Type: multipart/alternative; boundary="000000000000309ef1062b1d5204"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 07 Jan 2025 12:59:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114697

--000000000000309ef1062b1d5204
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Team,

Any update on this?

Thanks & Regards,
Vijay



On Thu, Jan 2, 2025 at 7:42=E2=80=AFAM Vijay Anusuri via lists.openembedded=
.org
<vanusuri=3Dmvista.com@lists.openembedded.org> wrote:

> Hi Armin/Team,
>
> Any update on this?
>
> Thanks & Regards,
> Vijay
>
> On Fri, Dec 20, 2024 at 9:11=E2=80=AFPM Marko, Peter <Peter.Marko@siemens=
.com>
> wrote:
>
>> Please ignore my comment, I have sent for master, not scrathgap.
>> Peter
>>
>> > -----Original Message-----
>> > From: Marko, Peter (FT D EU SK BFS1)
>> > Sent: Friday, December 20, 2024 16:40
>> > To: vanusuri@mvista.com; openembedded-devel@lists.openembedded.org
>> > Subject: RE: [oe][meta-oe][scarthgap][PATCH] php: upgrade 8.2.24 ->
>> 8.2.26
>> >
>> > This patch is missing rebase of patches.
>> > I have sent this same upgrade including patch rebase in my larger patc=
h
>> series.
>> >
>> > Peter
>> >
>> > > -----Original Message-----
>> > > From: openembedded-devel@lists.openembedded.org <openembedded-
>> > > devel@lists.openembedded.org> On Behalf Of Vijay Anusuri via
>> > > lists.openembedded.org
>> > > Sent: Friday, December 20, 2024 12:21
>> > > To: openembedded-devel@lists.openembedded.org
>> > > Cc: Vijay Anusuri <vanusuri@mvista.com>
>> > > Subject: [oe][meta-oe][scarthgap][PATCH] php: upgrade 8.2.24 -> 8.2.=
26
>> > >
>> > > From: Vijay Anusuri <vanusuri@mvista.com>
>> > >
>> > > Includes fix for CVE-2024-8929, CVE-2024-11236, CVE-2024-11234 and
>> CVE-
>> > > 2024-11233
>> > >
>> > > Changelog:
>> > > https://www.php.net/ChangeLog-8.php#8.2.26
>> > >
>> > > Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
>> > > ---
>> > >  meta-oe/recipes-devtools/php/{php_8.2.24.bb =3D> php_8.2.26.bb} | 2=
 +-
>> > >  1 file changed, 1 insertion(+), 1 deletion(-)
>> > >  rename meta-oe/recipes-devtools/php/{php_8.2.24.bb =3D> php_8.2.26.=
bb}
>> > (99%)
>> > >
>> > > diff --git a/meta-oe/recipes-devtools/php/php_8.2.24.bb
>> b/meta-oe/recipes-
>> > > devtools/php/php_8.2.26.bb
>> > > similarity index 99%
>> > > rename from meta-oe/recipes-devtools/php/php_8.2.24.bb
>> > > rename to meta-oe/recipes-devtools/php/php_8.2.26.bb
>> > > index 034f3bef1..10ef2c36e 100644
>> > > --- a/meta-oe/recipes-devtools/php/php_8.2.24.bb
>> > > +++ b/meta-oe/recipes-devtools/php/php_8.2.26.bb
>> > > @@ -34,7 +34,7 @@ SRC_URI:append:class-target =3D " \
>> > >            "
>> > >
>> > >  S =3D "${WORKDIR}/php-${PV}"
>> > > -SRC_URI[sha256sum] =3D
>> > > "4cc76ec644eee97d17c92bfe8d0e84714fedf299a538b7dfadc0639dd0dc432f"
>> > > +SRC_URI[sha256sum] =3D
>> > >
>> > "be57c347d451c905bcb4336832a864d9928dd0e20989b872705fea0ba6476c6b"
>> > >
>> > >  CVE_STATUS_GROUPS +=3D "CVE_STATUS_PHP"
>> > >  CVE_STATUS_PHP[status] =3D "fixed-version: The name of this product=
 is
>> exactly
>> > > the same as github.com/emlog/emlog. CVE can be safely ignored."
>> > > --
>> > > 2.25.1
>>
>>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#114614):
> https://lists.openembedded.org/g/openembedded-devel/message/114614
> Mute This Topic: https://lists.openembedded.org/mt/110212662/7301997
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> vanusuri@mvista.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000309ef1062b1d5204
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Team,</div><div><br></div><div>Any update on this?=
<br><br></div><div>Thanks &amp; Regards,</div><div>Vijay<br></div><br><br><=
/div><br><div class=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" =
class=3D"gmail_attr">On Thu, Jan 2, 2025 at 7:42=E2=80=AFAM Vijay Anusuri v=
ia <a href=3D"http://lists.openembedded.org">lists.openembedded.org</a> &lt=
;vanusuri=3D<a href=3D"mailto:mvista.com@lists.openembedded.org">mvista.com=
@lists.openembedded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex"><div dir=3D"ltr"><div><div>Hi Armin/Team,<br><br></d=
iv>Any update on this?<br><br></div><div>Thanks &amp; Regards,</div><div>Vi=
jay<br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D=
"gmail_attr">On Fri, Dec 20, 2024 at 9:11=E2=80=AFPM Marko, Peter &lt;<a hr=
ef=3D"mailto:Peter.Marko@siemens.com" target=3D"_blank">Peter.Marko@siemens=
.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex">Please ignore my comment, I have sent for master, not scrathgap.<br>
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
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#114614): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/114614" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/114614</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/110212662/730=
1997" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/110212662/7301997</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:vanusuri@mvista.com" tar=
get=3D"_blank">vanusuri@mvista.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--000000000000309ef1062b1d5204--

