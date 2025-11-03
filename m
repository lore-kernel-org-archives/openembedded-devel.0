Return-Path: <jan.vermaete@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB345CCFA03
	for <webhook@archiver.kernel.org>; Mon,  3 Nov 2025 21:20:07 +0000 (UTC)
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2764.1762204806037359788
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 03 Nov 2025 13:20:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=aPO+vDum;
 spf=pass (domain: gmail.com, ip: 209.85.128.169, mailfrom: jan.vermaete@gmail.com)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-78619d34979so43981837b3.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 03 Nov 2025 13:20:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762204805; x=1762809605; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U//TD2U86ZbhdSUE1WzuQc2BxvQdG2yZ68RcowLQ+aQ=;
        b=aPO+vDumEqnC0klrBTFM2R9IXSqt+HnBCn+yGzjcrk/wqaBvxQrNxJWYQvwBo9NAiO
         +EX31M6SuJ8UGeJD27dHeCVXHDDs7ZmAmaHFNbaVSF2HlWysCgMWCVh1YI0cDtWnUaYv
         WDa+whW9Ll4twWheQLpDDpn/zzXU49Ppw0jHm62Bm0OO+ciQrkspYVnC9Z7H5++sUPN1
         wtP5bhC+i9RXSgqq5QFhVLMm9N52wA4MGX315VOnU7/7da7H/+3S+x7el9Y5XEJk8cUN
         0iNP6K4uB7LTOokpkoViW1xtzguyb1dZHfoH3eym7QVNeUggX+JQe7/5YLWWSxHhnury
         LvDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762204805; x=1762809605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U//TD2U86ZbhdSUE1WzuQc2BxvQdG2yZ68RcowLQ+aQ=;
        b=xUsOETugZCJ/h1Edgcn9e2PmDJEBJQ9E4T8hlpqHyJ3oQ3HbQQFA7CYwpXrWN7PxkN
         c/POe0FtRl90E3CCs7jY+06//i2qnTsiTRb5KRIsSJnKivbjViMXsR/PwJQwIugmNv4Q
         yCMXwjRYhfN4UW/xPW2oPBDO9JRkEZ3R81uF8+xQQQF73v6QQvEiZbTTAG3FAGmLibdg
         lZ+hh1DAiYHewr8zJDv22v98/8YEEOJbI/hB+1ufqPVThk1rVSlBGPgcYFIkYYXE5kd3
         nJoQrWFymq9D4Uq+BMkmfS2ZZ8YnaJIwWfAV/Vj9TaOdqpy0uZBIW6BRWODSm8xmIbia
         U5xA==
X-Gm-Message-State: AOJu0YzavcBOMs4MM+MqTtRXES1ihSPjmEV0WljzK+azFYj/H5b2VTy/
	aZcn2aWoFyjoYON8RruV7Gl48WPllk78RP13oZSGn0JllTpr98+KD7tkrDYjM6WkK+5Pxm7lXqo
	OG9/oK+zIhRyiY+ZIF9Hi7XoOohdiuhc=
X-Gm-Gg: ASbGncucwcJUVxrNpt8RXV96KJEUvkwSPNlbtIzpKdXbSP7v8QPePie8Jo4psT2Wrfh
	L4AJI0jUlmVGmOVlw4GZm6PIMbidrU2b25wwsSJY3Q3al4bI/WoUCLMxKCdwPRqebklFTm2CRsH
	cRRXVs79SJs9TahQpFZ1uC8PKHXn9RqOZB0Vnf8ustSHRQcot4NivRJcUywIu2n/kYugnHKnuMI
	8bBEnkxyNBQ2lpcg9T+aXaUrBDqIn+tYops9kqCU3/ud1Q+3/sVgOsQJYFmQ67JV7uavv+1i/TL
	dgaG/ekhZnNtzCSIQObtQSyFivtKwUsEpyKCotl7rpVgdVEkNHFzpba3BYCR
X-Google-Smtp-Source: AGHT+IHrFi3kENtyPN7I37/Tvv2zBJ9OMtREEslSZfy3G1Uk+cNhSD7G3XjF5E3QjjMdoKQLgOKW7dcTrfk4lxnhiO0=
X-Received: by 2002:a05:690c:670a:b0:786:8dc1:525d with SMTP id
 00721157ae682-7868dc15996mr23671997b3.60.1762204805107; Mon, 03 Nov 2025
 13:20:05 -0800 (PST)
MIME-Version: 1.0
References: <20251103200433.1766280-1-jan.vermaete@gmail.com> <CAMKF1srn9eqk1M99yhH0x=VQax3eHRzUPj==tqUPaiF-nu-1Yw@mail.gmail.com>
In-Reply-To: <CAMKF1srn9eqk1M99yhH0x=VQax3eHRzUPj==tqUPaiF-nu-1Yw@mail.gmail.com>
From: jan vermaete <jan.vermaete@gmail.com>
Date: Mon, 3 Nov 2025 22:19:54 +0100
X-Gm-Features: AWmQ_bmgB9GFdMQbTnSQ76uiG26J1ZFYu6gBp5V7h9TFIfkBY1FFZsDEPIsYSH8
Message-ID: <CABF_=yjgq_9kLQUeRYLkTFh_ZD-1ZO6MEOdzYctNWm4uo9g62A@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH] python3-rich-toolkit: add new recipe
 (version 0.15.1)
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 03 Nov 2025 21:20:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121285

Hi Khem,

It does have tests.  I will send a V2 within a few days.

On Mon, Nov 3, 2025 at 10:06=E2=80=AFPM Khem Raj <raj.khem@gmail.com> wrote=
:
>
> Does it have tests ? the please enable them via ptests
>
> On Mon, Nov 3, 2025 at 12:04=E2=80=AFPM Jan Vermaete via
> lists.openembedded.org <jan.vermaete=3Dgmail.com@lists.openembedded.org>
> wrote:
> >
> > Signed-off-by: Jan Vermaete <jan.vermaete@gmail.com>
> > ---
> >  .../python/python3-rich-toolkit_0.15.1.bb        | 16 ++++++++++++++++
> >  1 file changed, 16 insertions(+)
> >  create mode 100644 meta-python/recipes-devtools/python/python3-rich-to=
olkit_0.15.1.bb
> >
> > diff --git a/meta-python/recipes-devtools/python/python3-rich-toolkit_0=
.15.1.bb b/meta-python/recipes-devtools/python/python3-rich-toolkit_0.15.1.=
bb
> > new file mode 100644
> > index 0000000000..d63850b3ba
> > --- /dev/null
> > +++ b/meta-python/recipes-devtools/python/python3-rich-toolkit_0.15.1.b=
b
> > @@ -0,0 +1,16 @@
> > +SUMMARY =3D "Rich toolkit for building command-line applications"
> > +HOMEPAGE =3D "https://github.com/patrick91/rich-toolkit"
> > +LICENSE =3D "MIT"
> > +LIC_FILES_CHKSUM =3D "file://pyproject.toml;md5=3D29c91c89ee62891477a1=
476375143bef;beginline=3D6;endline=3D6"
> > +
> > +SRC_URI[sha256sum] =3D "6f9630eb29f3843d19d48c3bd5706a086d36d62016687f=
9d0efa027ddc2dd08a"
> > +
> > +inherit pypi python_hatchling
> > +
> > +PYPI_PACKAGE =3D "rich_toolkit"
> > +
> > +RDEPENDS:${PN} =3D "\
> > +    python3-click \
> > +    python3-rich \
> > +    python3-typing-extensions \
> > +"
> > --
> > 2.47.3
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#121282): https://lists.openembedded.org/g/openembed=
ded-devel/message/121282
> > Mute This Topic: https://lists.openembedded.org/mt/116105107/1997914
> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub =
[raj.khem@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >



--=20
Jan Vermaete
=E2=80=9CSuccess is a self-correcting phenomenom.=E2=80=9D -- Gary Hamel

