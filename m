Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com
	[209.85.222.194])
	by mail.openembedded.org (Postfix) with ESMTP id 18DC76C102
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Dec 2019 16:19:04 +0000 (UTC)
Received: by mail-qk1-f194.google.com with SMTP id d71so8917982qkc.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Dec 2019 08:19:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=HVc5/jjck8CKMsLKZJaclITp/p89f8uEL8wUMUWJW8A=;
	b=gwUCyiy3SPHmGrY72TD6i1lKCtI449VFkJHic3OiBpCrPhzsTedz2L8vEpnxgImZzd
	cwH5O+JAR/KKmwC5jAIeJWrH5WsP0Age63ggypgXoMXGIaud+JOiEHG12oHkEM956Z8u
	JKF/hyO9S3CjxfdaZFIXqWplU3AsFNtfPp8W3XeoRyVLcOOduRBKxcaWt+h1y3uZ6Wau
	MnwNIkfjFiNNBwNjTUYEJqqklbufAGdbGJqHzj2Si5yH83cEdX5xC+Ns2LySiOVRjzXc
	qSbBUUIKx9g1ZkbbEQ5aCN6+pSvsrCMdPODUyrus1gD8wmZ1Io+OwhMkOK++vIQbc0zj
	vI4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=HVc5/jjck8CKMsLKZJaclITp/p89f8uEL8wUMUWJW8A=;
	b=RL4hszsG4FhBdxLFBZWd0LXeyqcx1LmlfJA6XhWuHaQmyMsh9B5UMnXjlGlWUegVdI
	cwHepiXJ23nCrPuEyO32zV/OY4QAFGasbfNFVepdirRRKMcK8ImmaVNlEb8dCxqaEwQA
	THQ9RYseSAH/VRPqPT/X79AxGdRD1zPMwZ+rgksK0J5/2o59CPQkRrwl74Qs2l2bjITD
	qJ6mqs8SR1Nb151mDynK24R+zMOQ43wnckZB6HcJEKRhuTm2Pa9wErY9FQeMFZhM2R4T
	DK7gNe6lN1zLg9ErcPI5pkaHgLO+31ZddQb5miFSx7HSqhXESYsIfRW1T/UAvZxp1OkZ
	fdsQ==
X-Gm-Message-State: APjAAAVSMxhAVOOO+uzBzPYPdTob6bVsxCzKTYdmwDd92CiSsJZ3zmRb
	Xz6fQtTFdwZPXJZ1b1gVod4ERRA9ZqI23rQYF8o=
X-Google-Smtp-Source: APXvYqxMar1ReuFG6Rz6EDDuTCUPlYSVkAsjyAa4gbCT9IUQ2U3vDsLMnxTpFDQwGoZcF0Ug9ewamUlxW9ppnJh2O1I=
X-Received: by 2002:a37:51d4:: with SMTP id f203mr1759195qkb.212.1575994745323;
	Tue, 10 Dec 2019 08:19:05 -0800 (PST)
MIME-Version: 1.0
References: <20191209144525.21752-1-brgl@bgdev.pl>
	<CAMKF1spX0HCZ-pcth0t80VSHMVvSN2BTyLb1jXg6h4LQG-XGOw@mail.gmail.com>
	<CAMRc=Mfgfmp8vKufxQdtZ7ojL1GAWeXhh8KbpCr96CUThbsKYg@mail.gmail.com>
In-Reply-To: <CAMRc=Mfgfmp8vKufxQdtZ7ojL1GAWeXhh8KbpCr96CUThbsKYg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 10 Dec 2019 08:18:53 -0800
Message-ID: <CAMKF1soOi9SMGJqjTbNEOpvVfdiYRqAgQ4MC_D73oDfLcZ9XvA@mail.gmail.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>,
	openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH] librsync: new package
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
X-List-Received-Date: Tue, 10 Dec 2019 16:19:05 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 10, 2019 at 7:50 AM Bartosz Golaszewski <brgl@bgdev.pl> wrote:

> pon., 9 gru 2019 o 20:24 Khem Raj <raj.khem@gmail.com> napisa=C5=82(a):
> >
> > On Mon, Dec 9, 2019 at 6:45 AM Bartosz Golaszewski <brgl@bgdev.pl>
> wrote:
> > >
> > > From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> > >
> > > rdiff is a popular tool for calculating binary delta patches. It's
> > > provided by the librsync package (unrelated to rsync already availabl=
e
> > > in poky).
> > >
> > > This recipe adds new packages for librsync and rdiff.
> > >
> > > Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> > > ---
> > >  .../recipes-support/librsync/librsync_2.2.1.bb | 18
> ++++++++++++++++++
> > >  1 file changed, 18 insertions(+)
> > >  create mode 100644 meta-oe/recipes-support/librsync/librsync_2.2.1.b=
b
> > >
> > > diff --git a/meta-oe/recipes-support/librsync/librsync_2.2.1.bb
> b/meta-oe/recipes-support/librsync/librsync_2.2.1.bb
> > > new file mode 100644
> > > index 000000000..9d224767c
> > > --- /dev/null
> > > +++ b/meta-oe/recipes-support/librsync/librsync_2.2.1.bb
> > > @@ -0,0 +1,18 @@
> > > +SUMMARY =3D "Remote delta-compression library."
> > > +AUTHOR =3D "Martin Pool, Andrew Tridgell, Donovan Baarda, Adam Schub=
ert"
> > > +
> > > +LICENSE =3D "LGPLv2.1+"
> > > +LIC_FILES_CHKSUM =3D
> "file://COPYING;md5=3Dd8045f3b8f929c1cb29a1e3fd737b499"
> > > +
> > > +SRC_URI =3D "git://github.com/librsync/librsync.git"
> > > +SRCREV =3D "5917692418657dc78c9cbde3a8db4c85f25b9c8d"
> > > +S =3D "${WORKDIR}/git"
> > > +
> > > +DEPENDS =3D "popt"
> > > +
> > > +inherit cmake
> > > +
> > > +BBCLASSEXTEND =3D "native nativesdk"
> > > +
> > > +PACKAGES =3D+ "rdiff"
> > > +FILES_rdiff =3D "/usr/bin/rdiff"
> >
> > Please use ${bindir} instead of /usr/bin
> >
>
> Will do.
>
> While at it: I noticed another problem and I'm not sure how to
> approach it: the recipe provides the librsync package as well as
> librsync-native by using BBCLASSEXTEND =3D "native". We also use
> PACKAGES =3D "rdiff" to provide the rdiff executable in a separate
> package, but it doesn't seem to provide the native package for rdiff
> automatically. What is the right way to provide librsync,
> librsync-native, rdiff and rdiff-native here?
>
> This is needed as native rdiff will be used to actually create the
> delta update images in the system I'm working on.
>

Use librsync-native

>
> Thanks in advance,
> Bartosz Golaszewski
>
> > > --
> > > 2.23.0
> > >
>

