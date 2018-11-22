Return-Path: <schnitzeltony@gmail.com>
Received: from mail-yw1-f66.google.com (mail-yw1-f66.google.com
	[209.85.161.66])
	by mail.openembedded.org (Postfix) with ESMTP id 88A816C5C0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Nov 2018 15:03:14 +0000 (UTC)
Received: by mail-yw1-f66.google.com with SMTP id h32so3735756ywk.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Nov 2018 07:03:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=2VEvilNe5KdMqUahwpPKAoA1W7FmA6jmnR1CW/NBdiM=;
	b=f1eH5IvX/nyjyvlJ05cbKUrYFBVF3dGzC6flwXA7CRuwDoTAf07/29cJrmZWyxe4eG
	xNgTxdwutBn7hoTgj25ujvvHy5IPDcAXJjvWLxN9Nesg8S23mrJZsLcbNPWfmc0jdSzU
	yOT9sgzq362vFEAKP6qTtkhUii68h6Sq5twoHmdElZD08fbILXMXqpHAbTBhN8S54Bt7
	0iny2fpPuJEgNMO0KAUuWfAQz4mues0cLaDxO4EoB4YuITpFXlNLhLyiqI/MqT59LOjI
	TRybLj9fVvTfY6V/XTgs1mKti/wIrzshwsGHJMziFmQNeq0Fb4ny/LJP464Y5nPSZG0o
	5nQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=2VEvilNe5KdMqUahwpPKAoA1W7FmA6jmnR1CW/NBdiM=;
	b=M6g4gYMdM19XpOhpg75PDf8YAJqI4Dwe/rWrRYxqnGLg9A4vbRdYrRYYUJ9kkB8ed0
	l7NnKCBP7vmKw0A7TsR/tXexjuLUgmQUHYJTyYl4kKs1kCjKjghYuZWQ+JohwthuldjZ
	D+efh9r491Y23VcQnHChRkPtuzzWi9h+ZrLYKrrjtEA7XqB2U28KDjxZmlDh9IcPZ8lh
	Zp96MgRLKHj8CXvLAt/MKa+NrL5lVJ1Ieyr7YJEbCWKj9Zrkl3UIrfQLEMPtV2JKlkt/
	Qso/KivXhz9a8kfuvrgdxwzPw/RLakdxJcmCnDOb+FxSLkZrPr3jBXU0b+rOdJRpLGgS
	Gz4A==
X-Gm-Message-State: AA+aEWZt8Hcx3r3FtRbJg0hZ8xHoaDDaj4RZzdxFKr1/09wW58PN0Hb1
	aFsD/La7QRdsVKOzHMzKS38rgJUfw8lplqQ/eGBaygy+
X-Google-Smtp-Source: AFSGD/V5h1LFaW07DS2bpqTWWCQWT8pW2mOnnOK0cSjKeXOuQi6NxNMniXvRGfjiBxciQydj9AQFyCTz8KKNBKRGU8I=
X-Received: by 2002:a81:3e07:: with SMTP id l7mr1977947ywa.447.1542898995293; 
	Thu, 22 Nov 2018 07:03:15 -0800 (PST)
MIME-Version: 1.0
References: <20181112143259.11488-1-schnitzeltony@gmail.com>
	<8a63135c-70eb-6744-fa5c-88092b63bfaf@geanix.com>
In-Reply-To: <8a63135c-70eb-6744-fa5c-88092b63bfaf@geanix.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Thu, 22 Nov 2018 16:03:02 +0100
Message-ID: <CALbNGRSz-nvzdtkivON5dZqRojng+MD8WYRU54ohjvUmH8FZYw@mail.gmail.com>
To: martin@geanix.com
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [thud][PATCH 1/2] lvm2: update SRC_URI
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 22 Nov 2018 15:03:14 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 22, 2018 at 3:02 PM Martin Hundeb=C3=B8ll <martin@geanix.com> w=
rote:
>
> Hi Andreas,
>
> On 12/11/2018 15.32, Andreas M=C3=BCller wrote:
> > From: Mingli Yu <Mingli.Yu@windriver.com>
> >
> > Update SRC_URI for lvm2 as the previous
> > one is invalid.
> >
> > Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
> > Tested-by: Stefan Agner <stefan.agner@toradex.com>
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> >   meta-oe/recipes-support/lvm2/lvm2.inc | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta-oe/recipes-support/lvm2/lvm2.inc b/meta-oe/recipes-su=
pport/lvm2/lvm2.inc
> > index 75f4d89a0..5728d83ea 100644
> > --- a/meta-oe/recipes-support/lvm2/lvm2.inc
> > +++ b/meta-oe/recipes-support/lvm2/lvm2.inc
> > @@ -7,7 +7,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D12713b4d9386=
533feeb07d6e4831765a \
> >
> >   DEPENDS +=3D "util-linux libaio"
> >
> > -SRC_URI =3D "ftp://sources.redhat.com/pub/lvm2/LVM2.${PV}.tgz \
> > +SRC_URI =3D "ftp://sources.redhat.com/pub/lvm2/old/LVM2.${PV}.tgz \
>
> Why not use
>    ftp://sources.redhat.com/pub/lvm2/releases/
> or
>    https://www.sourceware.org/pub/lvm2/releases/
>
> ?
>
> >              file://lvm.conf \
> >              file://0001-implement-libc-specific-reopen_stream.patch \
> >              file://0002-Guard-use-of-mallinfo-with-__GLIBC__.patch \
> >
>
> --
> Kind regards,
> Martin Hundeb=C3=B8ll
> Embedded Linux Consultant
>
> +45 61 65 54 61
> martin@geanix.com
>
> Geanix IVS
> https://geanix.com
> DK39600706

Just forwarded a patch from master to thud.

Andreas

