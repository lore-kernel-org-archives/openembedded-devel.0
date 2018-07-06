Return-Path: <raj.khem@gmail.com>
Received: from mail-ua0-f174.google.com (mail-ua0-f174.google.com
	[209.85.217.174])
	by mail.openembedded.org (Postfix) with ESMTP id A6D9C7553C
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  6 Jul 2018 21:06:22 +0000 (UTC)
Received: by mail-ua0-f174.google.com with SMTP id x18-v6so8343541uaj.9
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 06 Jul 2018 14:06:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=4AD14cN61lonuTXyNqv5s1chkPpquikb9Bu1g0631lI=;
	b=rbN7hBD3SxCggvlwvSd8vB3FcDOcWBn+jFX58X2CMEai98t4V1uIFGddFQzJoxOVTv
	uZw3oMJcvcYakJivLO3l7XLstmVr+ZR1jZn9ykEl7nsz3/w/qFc7sRbigTwO/iVBzzMg
	o2djTxRFxFz2KZPoiy1HL8uXuKtlEnSjUZZLQzQU1sJVX372HIsJQhnk9JF57c1XAVF/
	4ToZNWeRvfduvwTiK4iMMo0Bqf5MOJhGUgqTfBOkUiCqs6lF4r3TXb8M1nGiXF0EqQ1k
	XpzXhqF71JSmMXlsZQid/q3Yon2+NOqFECO3VH+UURPTdon4ZolgjmevFERa8rAj1MKQ
	DQXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=4AD14cN61lonuTXyNqv5s1chkPpquikb9Bu1g0631lI=;
	b=QucnR2USxRD/gKQ7RykGGNWGZmFUE/7mo1hsJkzlNsMSg2OZfHmQ2hj4Oo254BpGxG
	5eJFY/fl43/gIWVSkCtKH4PCNgEDwRCRfN+WaqgqLWf1Kug2071awjQqh33lHQ0uRT7d
	UCnlCZ2ZeuWvfVwLj53dRzizPH/+urnzmIgt1bJjwDbTm8QHCiK1fVS+V5SWoXJr72Tx
	PIA4NOktS3uX9RXOSmvCPZXX71BYi3XlDvBDdrKSqSncq7W7Sh2xDidVXanmQ1j7BrJz
	VBC7NQlQff/aSFNzNL/dl4gS7sj0Bdr8tFo1K8tUBbBbzF3NilrWG4U0EX22KJZLV7RZ
	bVbg==
X-Gm-Message-State: APt69E3RMCX6ZsSgK9nF2UXJzSBD/2rrkzF9IdPPGfKMXpvzbROLCfIF
	SSQqJ7cgg7KXJCTDiqzqxa2ond9sQCZbPVxh3B8=
X-Google-Smtp-Source: AAOMgpeWA/D7EGvew8E8DI1piuqbqDLfjL4bOkMG/AsCgYc71vp7f5MGzhi+aLbrEaAhRxxMjKMrdqwBbAPBwrJBc2I=
X-Received: by 2002:ab0:11dd:: with SMTP id
	q29-v6mr7132968uac.191.1530911183384; 
	Fri, 06 Jul 2018 14:06:23 -0700 (PDT)
MIME-Version: 1.0
References: <20180706084113.95133-1-mingli.yu@windriver.com>
	<5B3F2C1B.1050005@windriver.com>
In-Reply-To: <5B3F2C1B.1050005@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 6 Jul 2018 14:05:21 -0700
Message-ID: <CAMKF1sp3L9mBB8O4hzHNT0xbvPXJe_qyn5SJJ3QSFJ9yenR-_A@mail.gmail.com>
To: Mingli Yu <mingli.yu@windriver.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH v2] mcelog: Upgrade to 159
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
X-List-Received-Date: Fri, 06 Jul 2018 21:06:22 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Please do not include raw diffs in commit log. This will cause pw to confus=
e.
On Fri, Jul 6, 2018 at 1:50 AM Yu, Mingli <mingli.yu@windriver.com> wrote:
>
>
>
> On 2018=E5=B9=B407=E6=9C=8806=E6=97=A5 16:41, mingli.yu@windriver.com wro=
te:
> > From: Mingli Yu <mingli.yu@windriver.com>
> >
> > Update LIC_FILES_CHKSUM as license file README.md
> > updated as below:
> >
> > diff a.orig/README.md a/README.md
> >
> > < see [mcelog.org](http://www.mcelog.org).
> > ---
> >> see [mcelog.org](https://www.mcelog.org).
> > 56a57,60
> >>
> >> By default mcelog reports its version as the git tag. This can be over=
ridden
> >> by setting up a .os_release file in the source directory. A build syst=
em
> >> could write the OS version to this file to mark the binary.
>
>
> The message as below, seems > behaves special in email.
>
>      Update LIC_FILES_CHKSUM as license file README.md
>      updated as below:
>
>      diff a.orig/README.md a/README.md
>
>      < see [mcelog.org](http://www.mcelog.org).
>      ---
>      > see [mcelog.org](https://www.mcelog.org).
>      56a57,60
>      >
>      > By default mcelog reports its version as the git tag. This can be
> overridden
>      > by setting up a .os_release file in the source directory. A build
> system
>      > could write the OS version to this file to mark the binary.
>
>      Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
>
> Thanks,
>
> >
> > Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> > ---
> >   .../recipes-support/mcelog/{mcelog_1.49.bb =3D> mcelog_159.bb}  | 4 +=
+--
> >   1 file changed, 2 insertions(+), 2 deletions(-)
> >   rename meta-oe/recipes-support/mcelog/{mcelog_1.49.bb =3D> mcelog_159=
.bb} (89%)
> >
> > diff --git a/meta-oe/recipes-support/mcelog/mcelog_1.49.bb b/meta-oe/re=
cipes-support/mcelog/mcelog_159.bb
> > similarity index 89%
> > rename from meta-oe/recipes-support/mcelog/mcelog_1.49.bb
> > rename to meta-oe/recipes-support/mcelog/mcelog_159.bb
> > index 84633a76c..236ad7d00 100644
> > --- a/meta-oe/recipes-support/mcelog/mcelog_1.49.bb
> > +++ b/meta-oe/recipes-support/mcelog/mcelog_159.bb
> > @@ -9,10 +9,10 @@ SRC_URI =3D "git://git.kernel.org/pub/scm/utils/cpu/m=
ce/mcelog.git;protocol=3Dhttp;
> >       file://run-ptest \
> >   "
> >
> > -SRCREV =3D "2cfdf29b2ef98ccd5ed42cdde8bbe437e0d6412f"
> > +SRCREV =3D "2ed5cc0489d20cbffdc6d2e08b1fe49973f0ee34"
> >
> >   LICENSE =3D "GPLv2"
> > -LIC_FILES_CHKSUM =3D "file://README.md;md5=3D279840fabb191e6cd9150492d=
31b0e20"
> > +LIC_FILES_CHKSUM =3D "file://README.md;md5=3D74bb47b9a68850cb398665cf7=
8b31de6"
> >
> >   S =3D "${WORKDIR}/git"
> >
> >
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

