Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FE2FE7C70C
	for <webhook@archiver.kernel.org>; Mon,  2 Feb 2026 07:52:56 +0000 (UTC)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.47748.1770018775585690968
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 01 Feb 2026 23:52:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TacC1QqL;
 spf=pass (domain: gmail.com, ip: 209.85.128.181, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-7927b1620ddso58531647b3.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 01 Feb 2026 23:52:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770018775; cv=none;
        d=google.com; s=arc-20240605;
        b=HLbxiODCVWv/FQCUA619INM6zphuiMBlbHAHPrifi8y2UnyKjJrjGBcwSO5ttlkCnt
         rFHX8GnRZHc/TPnBP9kMecm+483S1wYz3g1o6Dpmbg/2aK5DFHdPnftg4oCXlc4I2PJR
         k2ge8Osq5VEI397n/sLgMjgpCccQifz0+UrqT52nLhe4bltmEvCYegrnaNLKMRYj6AdO
         9UjOZeS7DxM8DeAZL+xd1FFio8DhIKp7a0VXaDkQiwQ+/4XDhCdGzt2hfNhj0OiKDlFD
         2yj6BeLpDHoYn7vccAqQkdZnb3adhs+lCjUfYhFNoASzBOYGEPrHK2DHVivN5TNthwVL
         M4yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=5mKbEYybRt9L5QAINbEruo4hSvpztmo8/bRcPLDdnfg=;
        fh=evSEETYhi+I0CuI6tByd4fnFrTN2ZdiJ4UqxZ44kUtI=;
        b=WZn9JwyD0mROMWdaQcLgAFcC50p6zWwt5Z3/gk4xMEwXbUZQNKclRv/vuq6Vc7fiV8
         Whd0GjmcvrqYIQPKR1ej+4fCPOybJltncTlOq26AqbKuR4LjqTdUh4aisq2hdyobH/Ye
         Hqljrz7D/rBJ+rXr5FN4hWffzR3jgYl0Yxi3YdoCcRFR1pdbphu6pRL7RBmufshuiYzB
         Pc79o3IjvTd7ycHsQu6ggfqVNvDw5LZm/xs3DDW+C6pjHiHwGa2mVNSf0hKcDWweHvNd
         hwpwAITtWxJBljgwQ3BuJsw+hKTSwMiiJRtSUaCfVOCUr5wmb9rAh4PsxRO4Aa/WBJG6
         gVVw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770018775; x=1770623575; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=5mKbEYybRt9L5QAINbEruo4hSvpztmo8/bRcPLDdnfg=;
        b=TacC1QqLKTLi4MkDwVF0N51vwRb5K3jRNKW+xRMTrtVgjvhR/wnceOLXZTMp8DKTJj
         TwSCrY3gDO4j0jrkrgtVt/nvKjfMPJFcR3ocwM3IqG070zg48jSPOJk8LYBLFBuTp+sq
         rZToE1ZHBnFnHxTVgjAicx2sYKBdNumWvjfKsJs8KIiVMBRfk4918DvOTxOqq816m9h0
         SrCa5GQS+31PO6hYxpQ95UCODfJ2vEck0pxDukvS9xptS5p719LxgnhAHtNxuYrAVzdV
         mTfc7aarRVHdSotkOnCXe4D5F/stRbjghw9I9d+1XtwQ1vj5JGEDqGvgDObrscn9Y4Zh
         7qRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770018775; x=1770623575;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5mKbEYybRt9L5QAINbEruo4hSvpztmo8/bRcPLDdnfg=;
        b=aUlwJn7Ok1RZm8+SP+lAFXU1Bm1d4IQzqziuZti/MPzhvcoxF0KHSbcJ5Zs23yXjGd
         +SbXqwmAAmVGmVyEwQxMn2P1r6Jrbq1PSJUNL7SzBgRl8dBIgv49yFZkwtWVrIke/Qdi
         pBDQ0nFFJhiWMdaGkTb6A8OJqAYvI2a5CJbNwZt/QXfpw2r4GeFOgQoxp+Jh6zeOkP/9
         wSW3j0bxwclJ+HmBupePLkN0DR/vmoZGVW3WzSwdkP8HU35hSXvG1Qkc4Kf0irzsozsu
         EE8WCp54njifSa5xZETlg87tm7s/J3pGM+IG/0+StpFxri3HMlhoZPVny9Mu5biFyuLU
         /E1A==
X-Gm-Message-State: AOJu0Yy/7mKzlHloZgNxDplE9BOfNGYC4lJOb64J1isGTouXXExBw0fK
	fTA2sLGXFcoujU2NBqdTZrnD4oYSJNg4xk6STxEryLl6FX0VRFLKTy0d0ojpZgrEBO4T3CKNQAa
	6/fqqHZ8e6pPU8fNuLVSQLP/XUycivs8=
X-Gm-Gg: AZuq6aLpG4szCtrF6SFN5i60ZdHK7IjeyR3SrjshDNjpqqrn1amQI9qfDF/xyN/GV4q
	WwgFvJEm1U77LBxxxr6tcDCj7/GMKUTM85q6UUt/ld9BlvxdqT0g0xrIT2GlbCjHuQU/XNspZMx
	jmFALNczMBOuPIcj+iPy0+VsI2n4uAtr26iFhqYLc02dXuq0V1mILoWM0nz4WuuNiYt8k+feGqz
	hyhGj/SPGzSKfOixlxb9hi6D2Bp0itm8P+S0qX++5cYRJbjQtvyPVLGBVgVmn9zaqXh6hz/Zxf+
	xC+gBygKhDgsR1KalTbYX8tCP+768NVIOv8vuIs4vnEltnqzssFG8ycLI49rNKPmImfmlvY9BYE
	rxKMS3GgF+6A=
X-Received: by 2002:a05:690c:2703:b0:794:bd20:ea25 with SMTP id
 00721157ae682-794bd210232mr37820467b3.18.1770018774660; Sun, 01 Feb 2026
 23:52:54 -0800 (PST)
MIME-Version: 1.0
References: <20260131222346.307600-1-peter.marko@siemens.com> <AS1PR10MB5697DA543582C59199F7C301FD9AA@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
In-Reply-To: <AS1PR10MB5697DA543582C59199F7C301FD9AA@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 1 Feb 2026 23:52:28 -0800
X-Gm-Features: AZwV_QivIx8cxvGC9FJibyTpbZaXv5c5PBJCZn4KzbQJCBPDAge8a25DeIN0C7E
Message-ID: <CAMKF1sqcHFhYSKJcPH16DX_qrxY_TrJkXyedt+LRudqyJ1p1fQ@mail.gmail.com>
Subject: Re: [meta-python][PATCH v2 1/2] python3-protobuf: upgrade 6.33.2 -> 6.33.5
To: "Marko, Peter" <Peter.Marko@siemens.com>
Cc: "openembedded-devel@lists.openembedded.org" <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000004f3c350649d29c05"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 02 Feb 2026 07:52:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124053

--0000000000004f3c350649d29c05
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Why dont you send a v3 rebased on top of the latest master please.

On Sun, Feb 1, 2026 at 11:14=E2=80=AFPM Marko, Peter <Peter.Marko@siemens.c=
om>
wrote:

> Looks like I have created this on older version of master and when picked
> to master-next this is now upgrade 6.33.4 -> 6.33.5.
> I guess that included resolving merge conflict in sha256sum, so I'm a bit
> surprised that my patch was not rejected.
>
> Note that the rebae introduced a problem with commit message showing wron=
g
> "from" version now, could you please also change the commit message on
> master-next to reflect it?
> I can also resend if necessary.
>
> Peter
>
> > -----Original Message-----
> > From: Marko, Peter (FT D EU SK BFS1) <Peter.Marko@siemens.com>
> > Sent: Saturday, January 31, 2026 23:24
> > To: openembedded-devel@lists.openembedded.org
> > Cc: Marko, Peter (FT D EU SK BFS1) <Peter.Marko@siemens.com>
> > Subject: [meta-python][PATCH v2 1/2] python3-protobuf: upgrade 6.33.2 -=
>
> 6.33.5
> >
> > Solves CVE-2026-0994.
> >
> > Signed-off-by: Peter Marko <peter.marko@siemens.com>
> > ---
> > v2: fixed "from version in commit message
> >
> >  .../{python3-protobuf_6.33.2.bb =3D> python3-protobuf_6.33.5.bb}  | 2 =
+-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >  rename meta-python/recipes-devtools/python/{python3-protobuf_6.33.2.bb
> =3D>
> > python3-protobuf_6.33.5.bb} (95%)
> >
> > diff --git a/meta-python/recipes-devtools/python/
> python3-protobuf_6.33.2.bb
> > b/meta-python/recipes-devtools/python/python3-protobuf_6.33.5.bb
> > similarity index 95%
> > rename from meta-python/recipes-devtools/python/
> python3-protobuf_6.33.2.bb
> > rename to meta-python/recipes-devtools/python/python3-protobuf_6.33.5.b=
b
> > index d0ef7753b0..af30165f81 100644
> > --- a/meta-python/recipes-devtools/python/python3-protobuf_6.33.2.bb
> > +++ b/meta-python/recipes-devtools/python/python3-protobuf_6.33.5.bb
> > @@ -10,7 +10,7 @@ LIC_FILES_CHKSUM =3D " \
> >  "
> >
> >  inherit pypi setuptools3
> > -SRC_URI[sha256sum] =3D
> > "56dc370c91fbb8ac85bc13582c9e373569668a290aa2e66a590c2a0d35ddb9e4"
> > +SRC_URI[sha256sum] =3D
> > "6ddcac2a081f8b7b9642c09406bc6a4290128fce5f471cddd165960bb9119e5c"
> >
> >  CVE_PRODUCT +=3D "google:protobuf protobuf:protobuf google-protobuf
> > protobuf-python"
> >
>

--0000000000004f3c350649d29c05
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Why dont you send a v3 rebased on top of the latest master=
 please.</div><br><div class=3D"gmail_quote gmail_quote_container"><div dir=
=3D"ltr" class=3D"gmail_attr">On Sun, Feb 1, 2026 at 11:14=E2=80=AFPM Marko=
, Peter &lt;<a href=3D"mailto:Peter.Marko@siemens.com">Peter.Marko@siemens.=
com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x">Looks like I have created this on older version of master and when picke=
d to master-next this is now upgrade 6.33.4 -&gt; 6.33.5.<br>
I guess that included resolving merge conflict in sha256sum, so I&#39;m a b=
it surprised that my patch was not rejected.<br>
<br>
Note that the rebae introduced a problem with commit message showing wrong =
&quot;from&quot; version now, could you please also change the commit messa=
ge on master-next to reflect it?<br>
I can also resend if necessary.<br>
<br>
Peter<br>
<br>
&gt; -----Original Message-----<br>
&gt; From: Marko, Peter (FT D EU SK BFS1) &lt;<a href=3D"mailto:Peter.Marko=
@siemens.com" target=3D"_blank">Peter.Marko@siemens.com</a>&gt;<br>
&gt; Sent: Saturday, January 31, 2026 23:24<br>
&gt; To: <a href=3D"mailto:openembedded-devel@lists.openembedded.org" targe=
t=3D"_blank">openembedded-devel@lists.openembedded.org</a><br>
&gt; Cc: Marko, Peter (FT D EU SK BFS1) &lt;<a href=3D"mailto:Peter.Marko@s=
iemens.com" target=3D"_blank">Peter.Marko@siemens.com</a>&gt;<br>
&gt; Subject: [meta-python][PATCH v2 1/2] python3-protobuf: upgrade 6.33.2 =
-&gt; 6.33.5<br>
&gt; <br>
&gt; Solves CVE-2026-0994.<br>
&gt; <br>
&gt; Signed-off-by: Peter Marko &lt;<a href=3D"mailto:peter.marko@siemens.c=
om" target=3D"_blank">peter.marko@siemens.com</a>&gt;<br>
&gt; ---<br>
&gt; v2: fixed &quot;from version in commit message<br>
&gt; <br>
&gt;=C2=A0 .../{<a href=3D"http://python3-protobuf_6.33.2.bb" rel=3D"norefe=
rrer" target=3D"_blank">python3-protobuf_6.33.2.bb</a> =3D&gt; <a href=3D"h=
ttp://python3-protobuf_6.33.5.bb" rel=3D"noreferrer" target=3D"_blank">pyth=
on3-protobuf_6.33.5.bb</a>}=C2=A0 | 2 +-<br>
&gt;=C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt;=C2=A0 rename meta-python/recipes-devtools/python/{<a href=3D"http://py=
thon3-protobuf_6.33.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-prot=
obuf_6.33.2.bb</a> =3D&gt;<br>
&gt; <a href=3D"http://python3-protobuf_6.33.5.bb" rel=3D"noreferrer" targe=
t=3D"_blank">python3-protobuf_6.33.5.bb</a>} (95%)<br>
&gt; <br>
&gt; diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://pyt=
hon3-protobuf_6.33.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-proto=
buf_6.33.2.bb</a><br>
&gt; b/meta-python/recipes-devtools/python/<a href=3D"http://python3-protob=
uf_6.33.5.bb" rel=3D"noreferrer" target=3D"_blank">python3-protobuf_6.33.5.=
bb</a><br>
&gt; similarity index 95%<br>
&gt; rename from meta-python/recipes-devtools/python/<a href=3D"http://pyth=
on3-protobuf_6.33.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-protob=
uf_6.33.2.bb</a><br>
&gt; rename to meta-python/recipes-devtools/python/<a href=3D"http://python=
3-protobuf_6.33.5.bb" rel=3D"noreferrer" target=3D"_blank">python3-protobuf=
_6.33.5.bb</a><br>
&gt; index d0ef7753b0..af30165f81 100644<br>
&gt; --- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-pr=
otobuf_6.33.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-protobuf_6.3=
3.2.bb</a><br>
&gt; +++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-pr=
otobuf_6.33.5.bb" rel=3D"noreferrer" target=3D"_blank">python3-protobuf_6.3=
3.5.bb</a><br>
&gt; @@ -10,7 +10,7 @@ LIC_FILES_CHKSUM =3D &quot; \<br>
&gt;=C2=A0 &quot;<br>
&gt; <br>
&gt;=C2=A0 inherit pypi setuptools3<br>
&gt; -SRC_URI[sha256sum] =3D<br>
&gt; &quot;56dc370c91fbb8ac85bc13582c9e373569668a290aa2e66a590c2a0d35ddb9e4=
&quot;<br>
&gt; +SRC_URI[sha256sum] =3D<br>
&gt; &quot;6ddcac2a081f8b7b9642c09406bc6a4290128fce5f471cddd165960bb9119e5c=
&quot;<br>
&gt; <br>
&gt;=C2=A0 CVE_PRODUCT +=3D &quot;google:protobuf protobuf:protobuf google-=
protobuf<br>
&gt; protobuf-python&quot;<br>
&gt; <br>
</blockquote></div>

--0000000000004f3c350649d29c05--

