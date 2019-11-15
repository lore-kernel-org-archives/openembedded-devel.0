Return-Path: <raj.khem@gmail.com>
Received: from mail-qv1-f66.google.com (mail-qv1-f66.google.com
	[209.85.219.66])
	by mail.openembedded.org (Postfix) with ESMTP id 459B07F9A6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Nov 2019 15:04:39 +0000 (UTC)
Received: by mail-qv1-f66.google.com with SMTP id s18so3892276qvr.4
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Nov 2019 07:04:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=bfqjp15j0h4v1z31KUUvfBsWoIMQuPrn9TkKc711Oq4=;
	b=NDzNwsPn3Hi54XPdjbz2Jp8uERDhD3in5iLSbvudLDudKYpTm0V5qPxfHurDISQlC2
	lKXa/rYPNgJFTWUrlLAhtpYHNCAtVch1/rPvy8l4NrGeDOF52CJbMc+u9zBAKCxJ7c38
	QzGCp8QGfDbUBqBg6VoD5ofXsKCn3h39uWWZOlS8P2j/sll3dZLfOVDiPrDFzUkvy/iH
	R6b2EFM0yJeIdehRF+WSSRaIVGor1pkcahzZpv5t2OWGFwfF60XELsypOQ3tBtM0bNVS
	a10XBpQajfjhgMakXK7LCw8dLETJlXsVkFSGufclhWURhKaA9ZeHCeceDFNpJJDYES7d
	mKRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=bfqjp15j0h4v1z31KUUvfBsWoIMQuPrn9TkKc711Oq4=;
	b=TH9AHmI6L60ofr6TD+TSLXKI3+wpwIj4gmzJoEJL1FMQoApdIYDPkl5adC5quTKdi2
	rw8fw/EVP3MpLopPDmuxPfvekygVnUCRWXi6C51UFz+VDo3klASLSnc8E79+o92U8v6b
	Rt9yBL9pbjPmddAm8eCHX+uPDc+qg4O0WULvqLj5OrT0EFQKTuvdDa1264NvLbq6HPk/
	tflWmw1eRgMc0k/ABr1nfNUuBsgmalncQKJO3JjSbj2IDCyzBEqO7zJb/yzTpneVfhjs
	VV0ACBoxK1+9sdEARQUl4fwwR2mo8EjGzU0TEAR8UkTfYtcjcX0ytkBk5UkTtDr1FkGp
	q/yw==
X-Gm-Message-State: APjAAAU3fiMDIckHLUhWzrU0hZm2c10cOTVbkKoZH25BJtjT58uKGm4T
	hs9/53Eo7QVTx2KoKNcV12ApilzYMhzBtcxRTeA=
X-Google-Smtp-Source: APXvYqxmFmq6Gn2wPBW/y8fOFWtLZMt/rS1hWuqKO0xtQ0rchA5udgaAnZj4PdlR+9triyw9wzfFbO2P8Mru0MHhQdk=
X-Received: by 2002:a05:6214:901:: with SMTP id
	dj1mr9749456qvb.99.1573830279804; 
	Fri, 15 Nov 2019 07:04:39 -0800 (PST)
MIME-Version: 1.0
References: <1573752010-26608-1-git-send-email-leon.anavi@konsulko.com>
	<f88b8bfe-e3d9-d45c-8187-ad039df89cc0@intel.com>
	<3b9d3a8a-6edc-2c4f-ac81-8f2036f1d064@konsulko.com>
In-Reply-To: <3b9d3a8a-6edc-2c4f-ac81-8f2036f1d064@konsulko.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 15 Nov 2019 07:04:28 -0800
Message-ID: <CAMKF1sogHDPcjNtD3n8JCagLHP5=+n8D2iqELEV_VKBcsAWQRQ@mail.gmail.com>
To: Leon Anavi <leon.anavi@konsulko.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] surf: Add simple web browser
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
X-List-Received-Date: Fri, 15 Nov 2019 15:04:39 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 15, 2019 at 5:30 AM Leon Anavi <leon.anavi@konsulko.com> wrote:

> Hi Ross, Martin, Khem,
>
> Thanks you for the feedback and for helping me. I've just submitted an
> updated version of the patch for a review. Now the recipe inherits
> distro_features_check.
>
> On 15.11.19 =D0=B3. 1:22 =D1=87., Ross Burton wrote:
> > On 14/11/2019 17:20, Leon Anavi wrote:
> >> +DEPENDS =3D "webkitgtk gtk+ gtk+3 glib-2.0 xserver-nodm-init"
> >
> > Are you sure it *build* depends on the X init scripts?
> >
> No, sorry, xserver-nodm-init is not a build dependency. I've removed it
> from the new version of the patch.
> >> +INHIBIT_PACKAGE_DEBUG_SPLIT =3D "1"
> >> +INHIBIT_PACKAGE_STRIP =3D "1"
> >
> > Why?
> These two lines prevent already-stripped QA errors.
>

At least we don=E2=80=99t want debug splitting to be disabled
What errors do you see with this
Enabled


> I have tested the recipe on QEMU and Raspberry Pi 4.
>
> Thanks, Leon
> >
> > Ross
> >
> --
> Leon Anavi
> Software Engineer
> konsulko.com
>
>

