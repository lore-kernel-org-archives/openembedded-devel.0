Return-Path: <martin.jansa@gmail.com>
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com
	[209.85.208.47])
	by mail.openembedded.org (Postfix) with ESMTP id EAFC87F2A1
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  2 Sep 2019 11:47:18 +0000 (UTC)
Received: by mail-ed1-f47.google.com with SMTP id t50so15401282edd.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 02 Sep 2019 04:47:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=qK7mSPzd+RtDmDPFPZeIXMG/RCVC5aakVqfH9LPlBrY=;
	b=kWjGUur0HMlchMHGl84g4PR3IBwmknBXQhUtp/VWeKtXOxti6jFRUlp1/AkYKiA9tx
	AVMXo81rcPcAkGyOq22eO+b7c3E6gUtMA8JXJhJE/7FC6T7CvQGJi6oxDedfc0S6P0xG
	r6I5y9fKHf+u5m+I9i42PpqLTi9fYRvsfvvMidPHlqb+pjDTmMbvZ60vz1NgrWir+6ep
	+LkxqxMn+G+2Pt+kTFaOWj6aDJblWa/HIe8EnpxWrWly9RaPJJhGmFRg6sIdcW5Pejom
	7lXYmUYa2YkSfbaUkHvfUDQralMjednrkLncWAJAzpmguYrF+rlW9O9H/D8Tz826r1A6
	qbYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=qK7mSPzd+RtDmDPFPZeIXMG/RCVC5aakVqfH9LPlBrY=;
	b=X+1fmbEmpNpWi1zt/PH8plb9N4YTzmyr0kpHpYkkVjFYcFXZAJUmitCIg433yup+C8
	a9EPSmBZGnRQBSqzHYbevxCyrAHwpgInTzJyNgBpQ/wRS/jCWRfjMlPJT4uu9GbnZS8G
	bQVaqG4g6fo6sLz/IYpgZwriOp4TrUA/fEUR1jHBbVgpQc06aCOZowAbk6nud9WYysT+
	542ikg0KYK9NGwVx6RI2FFDUpRDxusuqvvDV0JhOeSyO0JKS/54DmgFuA0rHzm73VlPq
	3P4+e4ffuwk3Xhl6evEBbYNdQq8tPAUpyR0T/jrgG7d0x5WKteLoU4cxOW+57rGGMn7k
	+tEQ==
X-Gm-Message-State: APjAAAWfzG7YVAAGA1yWk4UEzij+Mf4RIoeJAmsYDRSS3Q041YpJ0d7d
	4f+54ysjiVerrgkOd97kuqB9eHVRIjcCYR9nwW0=
X-Google-Smtp-Source: APXvYqxCOHrtG8g5XHzRknwVkHyrvC9xDiZPwaUUf+KzQ2a+/kxmB5KqXGJAbXgTVtLlzbkFHTbAWN+tGR5zkJMcSy0=
X-Received: by 2002:a50:c3cb:: with SMTP id i11mr2231482edf.98.1567424838429; 
	Mon, 02 Sep 2019 04:47:18 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1563719996.git.akuster808@gmail.com>
	<CAMKF1sqTednsK5Rvw+F-_wE_1x7GL=jP483T7HRsLNrwP6G-pQ@mail.gmail.com>
In-Reply-To: <CAMKF1sqTednsK5Rvw+F-_wE_1x7GL=jP483T7HRsLNrwP6G-pQ@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 2 Sep 2019 13:47:07 +0200
Message-ID: <CA+chaQfCXcEy+Fy_KGLDMiyW-u6wAGcpZzA9MQS2t6uQ1M-cFw@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [warrior] 0/8] patch review
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
X-List-Received-Date: Mon, 02 Sep 2019 11:47:19 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

This PR is still only in warrior-next, can this be merged to warrior before
the current PR gets merged to warrior-next (or warrior)?

On Sun, Jul 21, 2019 at 4:48 PM Khem Raj <raj.khem@gmail.com> wrote:

> On Sun, Jul 21, 2019 at 7:41 AM Armin Kuster <akuster808@gmail.com> wrote=
:
> >
> > Patch comments window closes on Wednesday.
> >
>
> series looks fine to me
>
> > The following changes since commit
> 8d5dcd6522e9d15e68637b6d7dda0401f9bb91d0:
> >
> >   turbostat: copy bits.h from kernel to turbostat (2019-06-16 08:15:44
> -0700)
> >
> > are available in the git repository at:
> >
> >   https://git.openembedded.org/meta-openembedded-contrib
> stable/warrior-nmut
> >   http://cgit.openembedded.org//log/?h=3Dstable/warrior-nmut
> >
> > Adrian Bunk (2):
> >   ndctl: Remove the unnecessary dependency on virtual/kernel
> >   wireless-regdb: Upgrade 2019.03.01 -> 2019.06.03
> >
> > Andreas M=C3=BCller (2):
> >   gnome-desktop3: set correct meson gtk doc option
> >   evince: add patch to fix build with recent gobject-introspection
> >
> > Martin Jansa (4):
> >   ndctl: make MACHINE_ARCH and ignore from libblockdev
> >   oprofile: make MACHINE_ARCH
> >   oprofile: drop virtual/kernel dependency and switch back to
> >     TUNE_PKGARCH
> >   SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS add lsb, busybox and util-linux for
> >     phoronix-test-suite
> >
> >  ...ove-EvDocumentModel-get-type-function-dec.patch | 33
> ++++++++++++++++++++++
> >  meta-gnome/recipes-gnome/evince/evince_3.28.2.bb   | 12 ++++----
> >  .../gnome-desktop/gnome-desktop3_3.32.0.bb         |  1 +
> >  ..._2019.03.01.bb =3D> wireless-regdb_2019.06.03.bb} |  4 +--
> >  meta-oe/conf/layer.conf                            |  3 ++
> >  meta-oe/recipes-core/ndctl/ndctl_v63.bb            |  2 +-
> >  meta-oe/recipes-kernel/oprofile/oprofile_1.3.0.bb  |  1 -
> >  7 files changed, 47 insertions(+), 9 deletions(-)
> >  create mode 100644
> meta-gnome/recipes-gnome/evince/evince/0001-libview-Remove-EvDocumentMode=
l-get-type-function-dec.patch
> >  rename meta-networking/recipes-connectivity/wireless-regdb/{
> wireless-regdb_2019.03.01.bb =3D> wireless-regdb_2019.06.03.bb} (91%)
> >
> > --
> > 2.7.4
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

