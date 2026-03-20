Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A7A41099B35
	for <webhook@archiver.kernel.org>; Fri, 20 Mar 2026 18:26:57 +0000 (UTC)
Received: from mail-yx1-f52.google.com (mail-yx1-f52.google.com [74.125.224.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19883.1774031214818610721
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 20 Mar 2026 11:26:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=J8XRaB8B;
 spf=pass (domain: gmail.com, ip: 74.125.224.52, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f52.google.com with SMTP id 956f58d0204a3-64e8c7f5082so2045203d50.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 20 Mar 2026 11:26:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774031214; cv=none;
        d=google.com; s=arc-20240605;
        b=HI7nq1BdaQLxv+8s01JhoJaZMXXLUXDywDsXJtfALe0B21MROVXs9FFIfvSmOaM1X7
         TPH6+012esyaMzwMGONuH6s57BfK8TongpvwV16O8xnCKK7yfUQrPv3igku7ROeBCRhP
         Cd3boEvywZ/PfbejYwONxtUsv/EY6jdK1XoT1v9ckQN41LdCLRr2uFHZTmwNPERUtfnR
         jr7I+KTcLZ6fINeW1OXqIFjCY2C/+bj9+1+ycyQnVBV4TU82pL4W8keZqMtty5t/PpmN
         tGPrU8mndD/PHfz9gw5Ebt+AdFTviDJKeDBi794bK+UdbX5vxzYMHbemSRjIasx22NOC
         lRHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=NSzyIyEC3ZCFPm4gKpXJtMScpkKbNndS9Z7S3n+jrQ8=;
        fh=lmVfLuXiORWQ6/4diYrzJXM3e5aGWnwjhaIT8qJCvr0=;
        b=cYGJSH3k4btZ/Zn8yIaq6tqFiPZRVJ1HAQmx8isU3C7kctYYD5ainY9lRV6j88Wfgz
         j+vb04h5CH3C5JT/hSBOrt5DIQY/9m6d+sezuT2qp+5xqw1N/SAsKR4Eyy2r5wdlhQqC
         ws1snv3MHOGv/w++/JDwezYL+QDUopm2cCTq9eiOgpw8pq/jg7Oj4f+UaIKMPdk9v2Pt
         lPLOZywTOB2sRFUH1Aspv94Nd5SGrl8OQrFl7+Ilb5bm5vBQtq7SusN9IGuNknWGmjN5
         XAS0fkG0y3uDBCBA4aNhokNWYUk5W9KIYXdzBoM0rjIMnLLfsNp4C10EWAVR2Bd7CBSF
         HdRw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774031214; x=1774636014; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=NSzyIyEC3ZCFPm4gKpXJtMScpkKbNndS9Z7S3n+jrQ8=;
        b=J8XRaB8BQVVdytm23KsBLqGecOsAy1nma1qeH9Ag7i+Uxwr6BAL/FgMqAhODndryB0
         ufhZgB2dF3kXAftIrDiktyyb/sXGYgg6o4esI2cQgEzJ1mCpMjXBSDtjziPR00es0tOV
         ovdpzsStVHgBKbMV1HqUarVJwOWNqfeztZS+PcdQZZOAkHf9NCAxCDW2v2xn9+yl0WRt
         vO9EfJdruxY9njVck5Ea4UbEuQB593x4pABYoCULgHEd17VTd27/eSxY5kSJlUDyMOGw
         Z+rcszAvpfH8d38heOTsfEjY5drot6TX5ooCH9v7q/7m6BtyMaxDSgGSwj73/EcC8UR4
         wI2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774031214; x=1774636014;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NSzyIyEC3ZCFPm4gKpXJtMScpkKbNndS9Z7S3n+jrQ8=;
        b=r4H5foUq6YDxGiCsxCckepBAwahEG/gOBHOzkky2fs2zpV9fVrqh0vQCz9fgYPa/74
         0WbZDhOKgnDDPBXjoRuSS9dyTM+OzSMY2UPGh7ooA9mj44j3DmFPbB6s2nhnZmuxeQ9W
         wfOZRJx9qIi/vliuxZG8SdEpXI1f+4gd5+my29CEALxJnxi0jIfSYMDJ8VUgvsKx9Kbj
         sJEYI6Na4b42w7Y56Aoj4jTl+wtZOYFeaUTVR2qZOo6odc4voGUwQQOGAt9dyNJowEFO
         b8+aV6G0XuhrNaHUZwMlsXIRmTyAaW0ONPHwH2jg/Ax4ajKYd0C0rNSz/HOlWP+JmCa0
         YqTQ==
X-Gm-Message-State: AOJu0YxnRE1cITYDfKubqlDmg1jn5lr/XF5Mv8GLM95YEyzaqShupyVk
	OF6wQLyUBym29KOfyIEIEAWNkA9C2VUQrL2BN1asuJ6iGx8Ib6Vrw8THI2g2GnHoHJiUEteQ6Qy
	2r71eCg/QarrvVbBUsBzQVy0/0k66SbU=
X-Gm-Gg: ATEYQzzD/j7+2atWcKciJwoHMok1NtLsZxsbN2ICWocAnIW5hwWy/Y0cx+szNV1mR0I
	31Dxlcm7v2M35lTNN6Jkb6ZSL4XFlZqeyajZPAS1QR9GyCOyVeAEr+XXcUg06KryL2DC7zVGWWC
	/FGIzDJkqwuFUYSFMSOfpIu5ma60RKncIXScsRRBkct2T32MEhcR+py5tq2bXB/2mQx25Q4JS+s
	LcQ+QKWD6iF/QVCmUFuSWDnrPeGMJfe/pzVnCRIy57sF9muCFD+y0QTqQSsNxaCqKrPxwVElr2U
	9azjaJT0Y7BdQ0hlJdg7rfc7ki0iifikXSuLNASPRA5jv8xLDT+Poi1H/DoNRwlODHwxnVTzSOT
	x+bTCVoOyj4XJAbrIWYWXvzid/F9f3NkaudzyqDP5XNJ2OodP0sXZb/e7tAc=
X-Received: by 2002:a53:c052:0:10b0:64e:a220:295c with SMTP id
 956f58d0204a3-64eaa6de30amr3561791d50.23.1774031213743; Fri, 20 Mar 2026
 11:26:53 -0700 (PDT)
MIME-Version: 1.0
References: <20260320083033.2703890-1-skandigraun@gmail.com>
 <CAMKF1spZyOr-=86hia5ittUnTXXXuxV8rRiyEeT5r67w0pPtuA@mail.gmail.com> <4efbf53d-8e2a-4494-afd8-8c73300326f9@gmail.com>
In-Reply-To: <4efbf53d-8e2a-4494-afd8-8c73300326f9@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 20 Mar 2026 11:26:42 -0700
X-Gm-Features: AaiRm5254taHBNZOv705RY4BRWDkml3_9ro7S3e2eY3XmwQPsCzfgos43R6igPU
Message-ID: <CAMKF1soCG1g5mDUtSVzKksWihQve5Uo0srzFSiBEr+OP621aPA@mail.gmail.com>
Subject: Re: [oe] [meta-networking][PATCH v2] samba: upgrade 4.19.9 -> 4.23.5
To: Gyorgy Sarvari <skandigraun@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000050ddbe064d78d4f4"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 20 Mar 2026 18:26:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125453

--00000000000050ddbe064d78d4f4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 20, 2026, 10:01=E2=80=AFAM Gyorgy Sarvari <skandigraun@gmail.co=
m> wrote:

>
>
> On 3/20/26 15:50, Khem Raj wrote:
>
> >      SRC_URI =3D "${SAMBA_MIRROR}/stable/samba-${PV}.tar.gz \
> >                 file://smb.conf \
> >                 file://volatiles.03_samba \
> >     @@ -24,11 +28,11 @@ SRC_URI =3D "${SAMBA_MIRROR}/stable/samba-
> >     ${PV}.tar.gz \
> >
> file://0005-Fix-pyext_PATTERN-for-cross-compilation.patch \
> >
> file://0006-smbtorture-skip-test-case-tfork_cmd_send.patch \
> >                 file://0007-Deleted-settiong-of-python-to-fix-the-
> >     install-confli.patch \
> >     -           file://9aa5c43315d83c19514251a11c4fba5a137f2821.patch \
> >                 file://0001-lib-replace-Implement-memset_explicit.patch=
 \
> >
> file://0002-lib-replace-Add-test-for-memset_explicit.patch \
> >                 file://0003-Replace-memset_s-with-memset_explicit.patch=
 \
> >                 file://0004-lib-replace-Remove-memset_s.patch \
> >     +           file://use-xslt-replace-function-when-
> >     available.patch;rev=3Dneed-to-be-applied-manually \
> >
> >
> > use apply=3Dno if you want patch to be created in build area but not
> applied.
> > however, this patch should be applied to oe-core docbook-xsl-stylesheet=
s
> > recipe
> > the recipe should perhaps also swtich to using https://github.com/
> > docbook/xslt10-stylesheets <
> https://github.com/docbook/xslt10-stylesheets>
> >  for sources as there seems to be newer releases there 1.79.1 was
> > released in 2015
> >
> >                 "
> >
>
> Thanks, deep down I had a feeling that there is a better way to avoid
> do_patch, but couldn't find in the docs.
> The oe-core submission will be left for someone else, however.
>

Let me find some time to send that

>

--00000000000050ddbe064d78d4f4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote gmail_quote_contai=
ner"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Mar 20, 2026, 10:01=E2=
=80=AFAM Gyorgy Sarvari &lt;<a href=3D"mailto:skandigraun@gmail.com">skandi=
graun@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pad=
ding-left:1ex"><br>
<br>
On 3/20/26 15:50, Khem Raj wrote:<br>
<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0SRC_URI =3D &quot;${SAMBA_MIRROR}/stable/samb=
a-${PV}.tar.gz \<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://sm=
b.conf \<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://vo=
latiles.03_samba \<br>
&gt;=C2=A0 =C2=A0 =C2=A0@@ -24,11 +28,11 @@ SRC_URI =3D &quot;${SAMBA_MIRRO=
R}/stable/samba-<br>
&gt;=C2=A0 =C2=A0 =C2=A0${PV}.tar.gz \<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://00=
05-Fix-pyext_PATTERN-for-cross-compilation.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://00=
06-smbtorture-skip-test-case-tfork_cmd_send.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://00=
07-Deleted-settiong-of-python-to-fix-the-<br>
&gt;=C2=A0 =C2=A0 =C2=A0install-confli.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://9a=
a5c43315d83c19514251a11c4fba5a137f2821.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://00=
01-lib-replace-Implement-memset_explicit.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://00=
02-lib-replace-Add-test-for-memset_explicit.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://00=
03-Replace-memset_s-with-memset_explicit.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://00=
04-lib-replace-Remove-memset_s.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://us=
e-xslt-replace-function-when-<br>
&gt;=C2=A0 =C2=A0 =C2=A0available.patch;rev=3Dneed-to-be-applied-manually \=
<br>
&gt; <br>
&gt; <br>
&gt; use apply=3Dno if you want patch to be created in build area but not a=
pplied.<br>
&gt; however, this patch should be applied to oe-core docbook-xsl-styleshee=
ts<br>
&gt; recipe<br>
&gt; the recipe should perhaps also swtich to using <a href=3D"https://gith=
ub.com/" rel=3D"noreferrer noreferrer" target=3D"_blank">https://github.com=
/</a><br>
&gt; docbook/xslt10-stylesheets &lt;<a href=3D"https://github.com/docbook/x=
slt10-stylesheets" rel=3D"noreferrer noreferrer" target=3D"_blank">https://=
github.com/docbook/xslt10-stylesheets</a>&gt;<br>
&gt; =C2=A0for sources as there seems to be newer releases there 1.79.1 was=
<br>
&gt; released in 2015<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br=
>
&gt; <br>
<br>
Thanks, deep down I had a feeling that there is a better way to avoid<br>
do_patch, but couldn&#39;t find in the docs.<br>
The oe-core submission will be left for someone else, however.<br></blockqu=
ote></div></div><div dir=3D"auto"><br></div><div dir=3D"auto">Let me find s=
ome time to send that</div><div dir=3D"auto"><div class=3D"gmail_quote gmai=
l_quote_container"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
</blockquote></div></div></div>

--00000000000050ddbe064d78d4f4--

