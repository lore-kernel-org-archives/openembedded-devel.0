Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com
	[209.85.160.194])
	by mail.openembedded.org (Postfix) with ESMTP id 2ACBE7F8C6
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  4 Nov 2019 15:53:50 +0000 (UTC)
Received: by mail-qt1-f194.google.com with SMTP id g50so24630148qtb.4
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 04 Nov 2019 07:53:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=6aQapF0ZG+qon8oLEMtCxt7lLv3n4iQGzFw621grGiU=;
	b=iCFfua5hJfCvlteAwZ2jSMO0+w9pcy8HvSw1AD6OekoS00zYya2XFwEkSPWIpBXSyM
	8UZa/uXEJJfRuelwyvm7PSMd5bbGSnzLyia0LqYpGUgcmwflbRIYaXZF0GNFsEksJGgy
	IJ2PFf/Z0u3pnS6AGYY1xkit9RyXw3NkCDb01m3IQuanseoFZ0BvL+HHtFxNV9ekuBYI
	Wu2uRKd2Umhq19OuHuyHYFxd9nrdsDJ2MFfpzFaJIBO+ym9JKgDmQRo4G42H+ecNDruC
	lk8FhyznWHvv3I4kF+poAGL+9a5GLxRmsw1yLcXHbPc9pfKHbUeaSV9+jiyJtfC4XSpQ
	kH6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=6aQapF0ZG+qon8oLEMtCxt7lLv3n4iQGzFw621grGiU=;
	b=P6KjFGQNbkCdNYfs9ZNCn5Je2JNkRf3kf06so/CeJsEd1mCTZkyItZ3M+cMe0nNBp9
	6401TIXALD+2ZEd0id/T/YyhAlWkUWRAPUlJpNe2k5f99eGsodUZNU9VyvTb512bYoqW
	Muyqp2RMmbAhmzeNcJL6Lobapg6baKb5lHTf+DV8jZYXoihdR1mYfxhPn5zNeWdR8ekL
	GKuIZREKhNoqY6xFiYMd/QayyJ1xXdYWCpbz0jF6BE+p6KC5RfvM9j5aNVqsoEdzPsmn
	gyp+uK4UQDSWl6xM8GT1/NL0Jm3IZ6ES5bFGNF2XCGHQVdMrBhZrmXPT6VQabNX5vLf4
	RqTQ==
X-Gm-Message-State: APjAAAX6s62JpFZQ8PN9k3pG1RwzLIyTMWTqVhkklWPzkqbwbg3QRCfn
	JAjdRlrGV/mbLnG1R6GtSGjsfPhlQ1CzEzEl3Z0=
X-Google-Smtp-Source: APXvYqxVq7ZoNTosOQYFYP/O3yXqYaiwwDrQaivEMhmm0+SYILbg2Mu76h9hbQRByST1MUTmXsCg6akJifEvewPnrtE=
X-Received: by 2002:ac8:2ddc:: with SMTP id q28mr12925017qta.88.1572882830634; 
	Mon, 04 Nov 2019 07:53:50 -0800 (PST)
MIME-Version: 1.0
References: <1572876614-6152-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
	<CALbNGRT49DwpLZ2BA2x1pBY+ynGQ9rn=hDZeExAY0G8Hkei65Q@mail.gmail.com>
In-Reply-To: <CALbNGRT49DwpLZ2BA2x1pBY+ynGQ9rn=hDZeExAY0G8Hkei65Q@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 4 Nov 2019 07:53:39 -0800
Message-ID: <CAMKF1soZyf80FjPUJgBfLnAReo-cG2rCYd1dOyDFZR0uqnwYjQ@mail.gmail.com>
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] mm-common: upgrade 0.9.12 -> 1.0.0
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
X-List-Received-Date: Mon, 04 Nov 2019 15:53:50 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 4, 2019 at 3:38 AM Andreas M=C3=BCller <schnitzeltony@gmail.com=
>
wrote:

> On Mon, Nov 4, 2019 at 11:31 AM Zheng Ruoqin
> <zhengrq.fnst@cn.fujitsu.com> wrote:
> >
> Have send similar + meson-build + summary
>

Thanks picked that one already


> Andreas
> > Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
> > ---
> >  meta-oe/recipes-core/mm-common/mm-common_0.9.12.bb | 9 ---------
> >  meta-oe/recipes-core/mm-common/mm-common_1.0.0.bb  | 9 +++++++++
> >  2 files changed, 9 insertions(+), 9 deletions(-)
> >  delete mode 100644 meta-oe/recipes-core/mm-common/mm-common_0.9.12.bb
> >  create mode 100644 meta-oe/recipes-core/mm-common/mm-common_1.0.0.bb
> >
> > diff --git a/meta-oe/recipes-core/mm-common/mm-common_0.9.12.bb
> b/meta-oe/recipes-core/mm-common/mm-common_0.9.12.bb
> > deleted file mode 100644
> > index 4f91f31..0000000
> > --- a/meta-oe/recipes-core/mm-common/mm-common_0.9.12.bb
> > +++ /dev/null
> > @@ -1,9 +0,0 @@
> > -inherit gnomebase
> > -
> > -SRC_URI[archive.md5sum] =3D "be1c61587db989c7677375a729b94672"
> > -SRC_URI[archive.sha256sum] =3D
> "ceffdcce1e5b52742884c233ec604bf6fded12eea9da077ce7a62c02c87e7c0b"
> > -
> > -LICENSE =3D "GPLv2"
> > -LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D751419260aa954499f7abaabaa8=
82bbe"
> > -
> > -BBCLASSEXTEND =3D "native"
> > diff --git a/meta-oe/recipes-core/mm-common/mm-common_1.0.0.bb
> b/meta-oe/recipes-core/mm-common/mm-common_1.0.0.bb
> > new file mode 100644
> > index 0000000..3dccbd8
> > --- /dev/null
> > +++ b/meta-oe/recipes-core/mm-common/mm-common_1.0.0.bb
> > @@ -0,0 +1,9 @@
> > +inherit gnomebase
> > +
> > +SRC_URI[archive.md5sum] =3D "9087b8612d75cbc1fad0c99e15c2a718"
> > +SRC_URI[archive.sha256sum] =3D
> "b97d9b041e5952486cab620b44ab09f6013a478f43b6699ae899b8a4da189cd4"
> > +
> > +LICENSE =3D "GPLv2"
> > +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D751419260aa954499f7abaabaa8=
82bbe"
> > +
> > +BBCLASSEXTEND =3D "native"
> > --
> > 2.7.4
> >
> >
> >
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

