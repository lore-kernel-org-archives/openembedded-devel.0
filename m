Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 871D1C55172
	for <webhook@archiver.kernel.org>; Tue,  4 Aug 2026 07:03:07 +0000 (UTC)
Received: from mail-yx1-f50.google.com (mail-yx1-f50.google.com [74.125.224.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11281.1785826977999759908
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 04 Aug 2026 00:02:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=p7m14J+y;
 spf=pass (domain: gmail.com, ip: 74.125.224.50, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f50.google.com with SMTP id 956f58d0204a3-668005ba03cso5770275d50.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 04 Aug 2026 00:02:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785826977; cv=none;
        d=google.com; s=arc-20260327;
        b=lttDaWt3buR4Cxx6Uax0Tqd+qM47JWKpJpXE40t0Jy/6oMM1XdmekpKKipdZt8k2bm
         npnKnwJftHARDlrQsK0E1Gwt0x2xPA/h+NmWXR9346mQrzfSq3OW/DAR/+a+UPI0dsLW
         xw4MwtMIPferIqVmCl4BSN1U4+SDbFDfcldkK8Q7RN3V7Q6K/m6iNw3xAhYDbVvxfpw2
         EfIrpSRkIjN4OVw6qIRrUfCICPL3Ry9OtIc1KORM3t9qxEmPHvGMdLEa4G+NRksgGjPT
         LMCuF+49yRS4egnvkO1Rl78X4ZfNV5pjivhTNWAUDqSs2FgfggayhrWuh6Lx9qk1KZQ6
         koLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=b3prSA2FbLMvPyJHMs5c1ZkPKQZG9bzmSnJpgwZETtI=;
        fh=B8F3lforaWXqCOLcYLVP4hd84u8I8RwmQUzZM4ZNJEc=;
        b=OecGnZfeIv4tXeJ9a/mYFEwuKVBvNFr8aig9YjgB2/UnRAcy9FgkJxvniAMT47DBTE
         RfMhIdJ3DhQnzKxiRcdd04Lbie1jIOGwy/mo3POi03kjD9fXXMlDrtNJ/kq2HgsGu0ZU
         b71R2ZBfAGPm5sJ5wu9j6XYyAmmdD1So/YmdhGWO8ZH7w2hqMtP2pWJ247dX8gEog8OT
         IcQy3zz3e08xIgkU0/SEyTHOYz/xoI7MQkgl4v36VhMKVNzuf/8xwrkzuoZg+XvDTuXv
         KNSNzR0Yjta8pDnelIclReVXeH0Flcr294U5cGG43jJrw47Cc3ADDb6Gtjm9W/HpP1bP
         pATQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785826977; x=1786431777; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=b3prSA2FbLMvPyJHMs5c1ZkPKQZG9bzmSnJpgwZETtI=;
        b=p7m14J+yqSbag50nv/3j2SQPeDrN6YPEY+zSzJloLrs6WTlARHlxcDssGsxXwdAZ65
         jlemCasmMCOhj72hihGK3cAlu80b0vPsJKon8EiZ2x2C72sk7SBAGJn3rxmn1OBRkmr3
         0Dx6de+gcxQCuRhaGDKADF0SYFTeLiiU3VtOwz7y3HPfDKD39AbnE3iYnkpnQDkkO3cH
         bxx6lP/qJDjnorvT/aJWtZ9rTW5G88kwVlupiOUmkDSQNWnAzvKpvVF17hSg/4qHPvwX
         0ecM6YqfBLU1tqvSvNk29zRO/kow8tXoVN3idS0IzLvfPYZMEeu8ecDpRjf3nMwUsnRf
         xCqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785826977; x=1786431777;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=b3prSA2FbLMvPyJHMs5c1ZkPKQZG9bzmSnJpgwZETtI=;
        b=NJbZLNAfxESliUTlMDqH+zeF3zT87M7aydNxQeKUWURonIKedokfdIRNwqmMVtJzRS
         ed3QH605mSkA6W3vHR90otL8tsYNKSjn9+EE1S8D9qFq3/hiwBFm5GS/vyI//2/0OSjz
         ms5JVrUZMXRdu/R9DA45IGzRfAqerCeCU4t/YtHep6lwABWbTg8lSFtm7S5W68xlMxUr
         z78FRjLauz+cXn7aFxi1w7p+SBYEp9OF+XE8+Jg6TMwjP7D41re5RfSHIC07ko/W8H7N
         tJSQp+OZdnVPqUo+x8ATBPvNW6nbr0CzQZ+/TUodSIpxkhUgjssIo2q1cBprLBQ1Rv/D
         6TEw==
X-Gm-Message-State: AOJu0YzZ67jzsW1E5+4OFFXf14J/NV3rt1gkc1PWE52Y7s3S9046IIrY
	cymcH/SpENA1Hc+MdlOjmr8galhcg0GIO4RUJsZCd9NVMVETtUOEI3j0ZsJXU+kD5NP/YAj3l17
	oMzBgCMTxedrn+ZXLYcY8rmYSNh3qfHY=
X-Gm-Gg: AR+sD11vZAL2mTo05ycqh+dpyhAr/5RSmmxlqO46Hhkik9gzNiIEkPXKwO/Z85l+Gdk
	TaqpeToLU8Ei7XBdS05PKKYU5Wer6pQaTBkwfqp4PBTk2xbivWnLPcVyAdAAMqDoSfxmNZX+ITC
	7DYbLFidw/tKD6T4xlafiQPyRu3IHeqrajAELfIBW29/aIHzoWXyDfW4ukh8PyPlCsnf91sSgFG
	e5XCp6BXASYQuDWwSpe0Dhsc0x4rRe339TyyZf64hOTjbWw+Swr68D+jffzPl5092jDFUWCM7LR
	mxcdvx0nHnl5PG5iEvpJhciTlVicprWEb8MEIObrEHzLgvU+RxMxSlFlyQ4P3xFvRUqBR9flDXD
	nkFvJ2V3+pDI6b4IWPhcxU0bGluo7eSmDjhqVZDIYQ05SC1RAFPGGUdaTMLGfM35SquFiEbML68
	SDvZnu2fe6aY4jWRRQJbwNv/Jvabo1pijoZFRNvl+H8A==
X-Received: by 2002:a05:690e:168a:b0:664:c3aa:66f0 with SMTP id
 956f58d0204a3-66953835b3cmr15356848d50.39.1785826976920; Tue, 04 Aug 2026
 00:02:56 -0700 (PDT)
MIME-Version: 1.0
References: <20260804002727.586577-1-ankur.tyagi85@gmail.com>
 <CAMKF1spENpUegEZePkKD75zuvgRrS1VQiNdxeWZwXimjvQZuPA@mail.gmail.com> <CADySD0HoRaHcXpcC=7x8uRk1j97kvhedtwKin4x88=U0yVReUg@mail.gmail.com>
In-Reply-To: <CADySD0HoRaHcXpcC=7x8uRk1j97kvhedtwKin4x88=U0yVReUg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 4 Aug 2026 00:02:30 -0700
X-Gm-Features: AUfX_myGmm7ricDvKS6-cOCJF0T1CA-WHSNasKHsuHPLyPFCwKpL4gm9n7NbEsw
Message-ID: <CAMKF1sq6DJRCnR=Ey658wDLsvuaZtLNkSbACcFdcQ_iv0O1XsQ@mail.gmail.com>
Subject: Re: [oe][meta-oe][PATCH v2 1/1] gtkwave: upgrade 3.3.127 -> 3.3.128
To: Ankur Tyagi <ankur.tyagi85@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000096f72e0658333ea1"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 04 Aug 2026 07:03:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128739

--00000000000096f72e0658333ea1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 3, 2026 at 6:36=E2=80=AFPM Ankur Tyagi <ankur.tyagi85@gmail.com=
> wrote:

> On Tue, Aug 4, 2026 at 12:34=E2=80=AFPM Khem Raj <raj.khem@gmail.com> wro=
te:
> >
> > please rebase on top of master. I applied v1
>
> In that case it will be an empty commit, please advise how to proceed.
>
>
hmm thats right. Lets leave it as it is.

> >
> > On Mon, Aug 3, 2026 at 5:27=E2=80=AFPM Ankur Tyagi via lists.openembedd=
ed.org
> <ankur.tyagi85=3Dgmail.com@lists.openembedded.org> wrote:
> >>
> >> From: Ankur Tyagi <ankur.tyagi85@gmail.com>
> >>
> >> License-Update: update md5sum as address was replaced with FSF url
> >>
> >> Changelog:
> >> - Hurd compile fix.
> >> - Update lz4 to 1.10.0.
> >>
> >> Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
> >> ---
> >>  .../gtkwave/{gtkwave_3.3.127.bb =3D> gtkwave_3.3.128.bb}        | 4 +=
+--
> >>  1 file changed, 2 insertions(+), 2 deletions(-)
> >>  rename meta-oe/recipes-graphics/gtkwave/{gtkwave_3.3.127.bb =3D>
> gtkwave_3.3.128.bb} (89%)
> >>
> >> diff --git a/meta-oe/recipes-graphics/gtkwave/gtkwave_3.3.127.bb
> b/meta-oe/recipes-graphics/gtkwave/gtkwave_3.3.128.bb
> >> similarity index 89%
> >> rename from meta-oe/recipes-graphics/gtkwave/gtkwave_3.3.127.bb
> >> rename to meta-oe/recipes-graphics/gtkwave/gtkwave_3.3.128.bb
> >> index 774a30e1a4..62ffafe08d 100644
> >> --- a/meta-oe/recipes-graphics/gtkwave/gtkwave_3.3.127.bb
> >> +++ b/meta-oe/recipes-graphics/gtkwave/gtkwave_3.3.128.bb
> >> @@ -3,10 +3,10 @@ DESCRIPTION =3D "gtkwave is a viewer for VCD (Value
> Change Dump) files which are u
> >>  HOMEPAGE =3D "http://gtkwave.sourceforge.net/"
> >>
> >>  LICENSE =3D "GPL-2.0-only"
> >> -LIC_FILES_CHKSUM =3D
> "file://COPYING;md5=3D75859989545e37968a99b631ef42722e"
> >> +LIC_FILES_CHKSUM =3D
> "file://COPYING;md5=3Dc5b1819073ecce49dec65a690b638c48"
> >>
> >>  SRC_URI =3D "http://gtkwave.sourceforge.net/gtkwave-gtk3-${PV}.tar.gz=
"
> >> -SRC_URI[sha256sum] =3D
> "f19da2db43b27bbcc669725843451945a68c3a4ce232562e341d6f63b80b55e4"
> >> +SRC_URI[sha256sum] =3D
> "817e197fc1808f8aac3543c2c2f9683cb01368c91192b8eae5af58070ef1d1f8"
> >>  S =3D "${UNPACKDIR}/${BPN}-gtk3-${PV}"
> >>
> >>  DEPENDS =3D " \
> >>
> >> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >> Links: You receive all messages sent to this group.
> >> View/Reply Online (#128701):
> https://lists.openembedded.org/g/openembedded-devel/message/128701
> >> Mute This Topic: https://lists.openembedded.org/mt/120587319/1997914
> >> Group Owner: openembedded-devel+owner@lists.openembedded.org
> >> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub
> [raj.khem@gmail.com]
> >> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >>
>

--00000000000096f72e0658333ea1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Aug 3, =
2026 at 6:36=E2=80=AFPM Ankur Tyagi &lt;<a href=3D"mailto:ankur.tyagi85@gma=
il.com">ankur.tyagi85@gmail.com</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">On Tue, Aug 4, 2026 at 12:34=E2=80=AFPM Kh=
em Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem=
@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; please rebase on top of master. I applied v1<br>
<br>
In that case it will be an empty commit, please advise how to proceed.<br>
<br></blockquote><div><br></div><div>hmm thats right. Lets leave it as it i=
s.=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
&gt;<br>
&gt; On Mon, Aug 3, 2026 at 5:27=E2=80=AFPM Ankur Tyagi via <a href=3D"http=
://lists.openembedded.org" rel=3D"noreferrer" target=3D"_blank">lists.opene=
mbedded.org</a> &lt;ankur.tyagi85=3D<a href=3D"mailto:gmail.com@lists.opene=
mbedded.org" target=3D"_blank">gmail.com@lists.openembedded.org</a>&gt; wro=
te:<br>
&gt;&gt;<br>
&gt;&gt; From: Ankur Tyagi &lt;<a href=3D"mailto:ankur.tyagi85@gmail.com" t=
arget=3D"_blank">ankur.tyagi85@gmail.com</a>&gt;<br>
&gt;&gt;<br>
&gt;&gt; License-Update: update md5sum as address was replaced with FSF url=
<br>
&gt;&gt;<br>
&gt;&gt; Changelog:<br>
&gt;&gt; - Hurd compile fix.<br>
&gt;&gt; - Update lz4 to 1.10.0.<br>
&gt;&gt;<br>
&gt;&gt; Signed-off-by: Ankur Tyagi &lt;<a href=3D"mailto:ankur.tyagi85@gma=
il.com" target=3D"_blank">ankur.tyagi85@gmail.com</a>&gt;<br>
&gt;&gt; ---<br>
&gt;&gt;=C2=A0 .../gtkwave/{<a href=3D"http://gtkwave_3.3.127.bb" rel=3D"no=
referrer" target=3D"_blank">gtkwave_3.3.127.bb</a> =3D&gt; <a href=3D"http:=
//gtkwave_3.3.128.bb" rel=3D"noreferrer" target=3D"_blank">gtkwave_3.3.128.=
bb</a>}=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 4 ++--<br>
&gt;&gt;=C2=A0 1 file changed, 2 insertions(+), 2 deletions(-)<br>
&gt;&gt;=C2=A0 rename meta-oe/recipes-graphics/gtkwave/{<a href=3D"http://g=
tkwave_3.3.127.bb" rel=3D"noreferrer" target=3D"_blank">gtkwave_3.3.127.bb<=
/a> =3D&gt; <a href=3D"http://gtkwave_3.3.128.bb" rel=3D"noreferrer" target=
=3D"_blank">gtkwave_3.3.128.bb</a>} (89%)<br>
&gt;&gt;<br>
&gt;&gt; diff --git a/meta-oe/recipes-graphics/gtkwave/<a href=3D"http://gt=
kwave_3.3.127.bb" rel=3D"noreferrer" target=3D"_blank">gtkwave_3.3.127.bb</=
a> b/meta-oe/recipes-graphics/gtkwave/<a href=3D"http://gtkwave_3.3.128.bb"=
 rel=3D"noreferrer" target=3D"_blank">gtkwave_3.3.128.bb</a><br>
&gt;&gt; similarity index 89%<br>
&gt;&gt; rename from meta-oe/recipes-graphics/gtkwave/<a href=3D"http://gtk=
wave_3.3.127.bb" rel=3D"noreferrer" target=3D"_blank">gtkwave_3.3.127.bb</a=
><br>
&gt;&gt; rename to meta-oe/recipes-graphics/gtkwave/<a href=3D"http://gtkwa=
ve_3.3.128.bb" rel=3D"noreferrer" target=3D"_blank">gtkwave_3.3.128.bb</a><=
br>
&gt;&gt; index 774a30e1a4..62ffafe08d 100644<br>
&gt;&gt; --- a/meta-oe/recipes-graphics/gtkwave/<a href=3D"http://gtkwave_3=
.3.127.bb" rel=3D"noreferrer" target=3D"_blank">gtkwave_3.3.127.bb</a><br>
&gt;&gt; +++ b/meta-oe/recipes-graphics/gtkwave/<a href=3D"http://gtkwave_3=
.3.128.bb" rel=3D"noreferrer" target=3D"_blank">gtkwave_3.3.128.bb</a><br>
&gt;&gt; @@ -3,10 +3,10 @@ DESCRIPTION =3D &quot;gtkwave is a viewer for VC=
D (Value Change Dump) files which are u<br>
&gt;&gt;=C2=A0 HOMEPAGE =3D &quot;<a href=3D"http://gtkwave.sourceforge.net=
/" rel=3D"noreferrer" target=3D"_blank">http://gtkwave.sourceforge.net/</a>=
&quot;<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 LICENSE =3D &quot;GPL-2.0-only&quot;<br>
&gt;&gt; -LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D75859989545e37968=
a99b631ef42722e&quot;<br>
&gt;&gt; +LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3Dc5b1819073ecce49d=
ec65a690b638c48&quot;<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 SRC_URI =3D &quot;<a href=3D"http://gtkwave.sourceforge.net/=
gtkwave-gtk3-$%7BPV%7D.tar.gz" rel=3D"noreferrer" target=3D"_blank">http://=
gtkwave.sourceforge.net/gtkwave-gtk3-${PV}.tar.gz</a>&quot;<br>
&gt;&gt; -SRC_URI[sha256sum] =3D &quot;f19da2db43b27bbcc669725843451945a68c=
3a4ce232562e341d6f63b80b55e4&quot;<br>
&gt;&gt; +SRC_URI[sha256sum] =3D &quot;817e197fc1808f8aac3543c2c2f9683cb013=
68c91192b8eae5af58070ef1d1f8&quot;<br>
&gt;&gt;=C2=A0 S =3D &quot;${UNPACKDIR}/${BPN}-gtk3-${PV}&quot;<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 DEPENDS =3D &quot; \<br>
&gt;&gt;<br>
&gt;&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;&gt; Links: You receive all messages sent to this group.<br>
&gt;&gt; View/Reply Online (#128701): <a href=3D"https://lists.openembedded=
.org/g/openembedded-devel/message/128701" rel=3D"noreferrer" target=3D"_bla=
nk">https://lists.openembedded.org/g/openembedded-devel/message/128701</a><=
br>
&gt;&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/1205=
87319/1997914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembed=
ded.org/mt/120587319/1997914</a><br>
&gt;&gt; Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.op=
enembedded.org" target=3D"_blank">openembedded-devel+owner@lists.openembedd=
ed.org</a><br>
&gt;&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembed=
ded-devel/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openemb=
edded.org/g/openembedded-devel/unsub</a> [<a href=3D"mailto:raj.khem@gmail.=
com" target=3D"_blank">raj.khem@gmail.com</a>]<br>
&gt;&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;&gt;<br>
</blockquote></div></div>

--00000000000096f72e0658333ea1--

