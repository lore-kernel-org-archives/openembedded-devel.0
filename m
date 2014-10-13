Return-Path: <nickdademo@gmail.com>
Received: from mail-oi0-f46.google.com (mail-oi0-f46.google.com
	[209.85.218.46])
	by mail.openembedded.org (Postfix) with ESMTP id 1125760167
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Oct 2014 21:41:29 +0000 (UTC)
Received: by mail-oi0-f46.google.com with SMTP id h136so14578771oig.19
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Oct 2014 14:41:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=cIwzWUNkt+DaDF26brP9ODCTV1SztpPA5WuBXWYBJb8=;
	b=oxZU2yfininNbNxF/ChaGjLjhsvAVuUAAUfqk2kyaDsxT+ROFTc2sFy/wEALj0MVOU
	i7yj7Ro8igOR1MGq0vGmiST6gkhH/Ebfxh3DnV1mqt6yGwXl/ZIzr54Xk/2e/sxByOak
	zMa0I4riI56nHwmCsn6aQ/AGq+hf9E34cdj+P1L8MYfR6hMjY7hpazmeNcjBGwyEYyqu
	ImW2DjTiDh5ZFNON4aziuFB8FZwkfMppvJC1Q1yX5XcQpk88DwCoTppxFSoMIHyDraOT
	+UQoEmjRGhuFUFYfbRtADxn6iCnWqZiOuUFJDatHwVzL2P7hjHBehNABuweohSWidKZz
	RWGw==
X-Received: by 10.202.180.6 with SMTP id d6mr836458oif.33.1413236490232; Mon,
	13 Oct 2014 14:41:30 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.76.167.163 with HTTP; Mon, 13 Oct 2014 14:41:10 -0700 (PDT)
In-Reply-To: <20141013081638.GF3000@jama>
References: <CANR6C54p6yC1FPviBpmX-qHiF198s3vK7UWEmmDj3hYs7mAovQ@mail.gmail.com>
	<CANR6C57416FmV0MHSKmKLvD=Xdf=Lds5OnrHu_6nCW8z3qB_jg@mail.gmail.com>
	<20141013071037.GA5099@ad.chargestorm.se> <20141013081638.GF3000@jama>
From: "Nick D'Ademo" <nickdademo@gmail.com>
Date: Tue, 14 Oct 2014 08:41:10 +1100
Message-ID: <CANR6C57Ojtx=ptYQiMP4oRrSzzc24JiCfdXitRXvvVScjcEqXg@mail.gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>, 
	Martin Jansa <martin.jansa@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-qt5] What is needed to build a recipe with CMake?
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
X-List-Received-Date: Mon, 13 Oct 2014 21:41:36 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Martin,

Thanks - what are some example recipes in that layer? (I had a look but
couldn't find any cmake + qt5 recipes)

Nick

On Mon, Oct 13, 2014 at 7:16 PM, Martin Jansa <martin.jansa@gmail.com>
wrote:

> On Mon, Oct 13, 2014 at 09:10:37AM +0200, Anders Darander wrote:
> > Hi,
> >
> > * Nick D'Ademo <nickdademo@gmail.com> [141013 01:50]:
> > > Has anyone had any success at all building a Qt5-based recipe with
> CMake?
> >
> > Yes, I've at least got a local recipe here building KDSoap, which uses
> > cmake.
>
> See meta-webos-ports layer for more recipes using cmake + qt5.
>
> >
> >
> >
> > > On Wed, Oct 8, 2014 at 1:41 PM, Nick D'Ademo <nickdademo@gmail.com>
> wrote:
> >
> > > > Looks like the *qmake* binary cannot be found.
> >
> > > > The relevant parts of the recipe are as follows:
> >
> >
> > > > *DEPENDS =3D "qtbase"*
> >
> > Just as you, I've got hte DEPENDS li=C5=84e above in my recipe. However=
, I've
> > also the following line (situated after the DEPENDS +=3D...)
> >
> > inherit qmake5
> >
> > That line should set up all the necessary path's in order to find qmake=
.
> >
> > Let us know if this helps you.
> >
> > Cheers,
> > Anders
> >
> > --
> > Abstainer, n.:
> >       A weak person who yields to the temptation of denying himself a
> >       pleasure.
> >               -- Ambrose Bierce, "The Devil's Dictionary"
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
>

