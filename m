Return-Path: <giulian@gmail.com>
Received: from mail-pa0-f51.google.com (mail-pa0-f51.google.com
	[209.85.220.51])
	by mail.openembedded.org (Postfix) with ESMTP id 3C4856DC27
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Feb 2014 12:39:13 +0000 (UTC)
Received: by mail-pa0-f51.google.com with SMTP id kq14so761486pab.24
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Feb 2014 04:39:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=XQP22oP5WjaT50i+4UYB+slHQ0YRe/KyN4+hRNvDTow=;
	b=NQYPDcnapRayuH2LOJHWLZ6KwMzLBqxkrrTJkbRGASJQi5V0AuGGcljtjgyk56on2k
	ffoNxHSB4lMa/qappkyBk9aeqghMGdgQu/qVOpXZMmnxPi99HH7OuhNgwczv4HpQ0RI0
	QhjsJZomVV2mBCNRc5ON2oiNniSf3AxEd0evX6h1XzSSJkN7zLYckIP+UQtLVEIM+yco
	8vRQmAgdTxl83VKbIjck8s+hGkAeOf/ONIB5BF8eaBOTBSkKyAA13EyPsOG63Wz8zpF+
	Y8Zdk2ArV84E9DOT+FV0BKlXxj6z3E0TXAmToPt3qhsAeywtB7WH3S8mqp4Z60SzsP13
	MCfg==
X-Received: by 10.68.216.133 with SMTP id oq5mr6616766pbc.72.1393418354594;
	Wed, 26 Feb 2014 04:39:14 -0800 (PST)
MIME-Version: 1.0
Sender: giulian@gmail.com
Received: by 10.66.8.225 with HTTP; Wed, 26 Feb 2014 04:38:54 -0800 (PST)
In-Reply-To: <CAP9ODKp_b4MmZZ38DSB5JwWevucrOmE3tzFeL2F-DKe9=LyEnA@mail.gmail.com>
References: <1393273696-9249-1-git-send-email-otavio@ossystems.com.br>
	<1393273696-9249-3-git-send-email-otavio@ossystems.com.br>
	<CAMKF1sor8AfGAjLODy5W9N91HQsBTTvAhh0+j3S-Obn_Gdv2Nw@mail.gmail.com>
	<CAP9ODKp_b4MmZZ38DSB5JwWevucrOmE3tzFeL2F-DKe9=LyEnA@mail.gmail.com>
From: Giulian Vivan <giulian@ossystems.com.br>
Date: Wed, 26 Feb 2014 09:38:54 -0300
X-Google-Sender-Auth: nsYjLvzF10eJ7fVq-7KTIUFb8Us
Message-ID: <CAFYUCi6HYOU3c1Mo4W3sXzv=D3E5NGuFQ=JCWkdvVkWZ+m+y7g@mail.gmail.com>
To: Otavio Salvador <otavio@ossystems.com.br>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-qt5][PATCH 2/3] packagegroup-qt5-qtcreator-debug: Add package group
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 26 Feb 2014 12:39:14 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hello

We tested it and when qtcreator tries to connect to the device with
dropbear, it gets "server rejected password". A connection done through a
terminal is accepted normally.

Giulian Gon=E7alves Vivan
O.S. Systems Software Ltda.
www.ossystems.com.br
+55 53 3282-2787


On Tue, Feb 25, 2014 at 8:36 AM, Otavio Salvador <otavio@ossystems.com.br>w=
rote:

> On Tue, Feb 25, 2014 at 2:52 AM, Khem Raj <raj.khem@gmail.com> wrote:
> > On Mon, Feb 24, 2014 at 12:28 PM, Otavio Salvador
> >> +RDEPENDS_${PN} =3D " \
> >> +    gdbserver \
> >> +    openssh \
> >
> > one could use dropbear or openssh for providing ssh server can we rely
> on that
> > instead of hardcoding openssh here ?
>
> We can try and see if it works.
>
> Giulian, could you give this a try?
>
> --
> Otavio Salvador                             O.S. Systems
> http://www.ossystems.com.br        http://code.ossystems.com.br
> Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750
>

