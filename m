Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f196.google.com (mail-wr0-f196.google.com
	[209.85.128.196])
	by mail.openembedded.org (Postfix) with ESMTP id 19C2D77848
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Mar 2017 18:13:18 +0000 (UTC)
Received: by mail-wr0-f196.google.com with SMTP id u48so24962251wrc.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Mar 2017 11:13:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=hreD8qzH/ncsYdeSPMb3ctsKs2GicEM7Y9+JAK62T5U=;
	b=d6wSc4BFG4qo1wA179ysnDV8f+Trr+THq9+Gsnk9JfSSJstQYYQhE0YZ99OPeipAms
	XQ9dzHl1CIxaK5maXYDqwzgMYvyFq9Rfgg0hhlZOW72GeXA0QiphWIImyWnaDvOrC91w
	zWhACBd+JCXYSOUdaGklUr9FPVtzNK+g1SQfqXAnojHxAZREcVFP6MjIIjEbfcH7WsFY
	F5k8Z7v4mgqqMaj4S4LuXCJr5v6LUUr9jYJMMaMOj8NDB8lYscZyJwAtA6G+YM5kZwH1
	ZZYX5wGcK2RHNrpO4TswQFs5qM2Li012KIMim+w2cMUtXj/FEuPd/q67HKY3fSJoQcG0
	mxBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=hreD8qzH/ncsYdeSPMb3ctsKs2GicEM7Y9+JAK62T5U=;
	b=g7WRsbw0TQjqDgohXqGqaxH9iAfcoCJjk9CBtp0oc7/GdHNxrHU4Wts4mkGd8zCn5D
	4OS3mu2sJGe/jwbAL20LTS7y1VzTzdqhZffQOOMDx7al23VQE8rs6wlFMPocXjUQozNR
	3CN3/3xcm7l9n96yh4QRB69fI379eU/G3vlNYL9gWwuae159dsegVQ59VvKbZ1we+Nxh
	ZQmPYUz7vT42KrTir/uhf94NFn0A82utFld2NWsCl22e6dw+phkYEDtI0GztBswOQbpI
	/UZZTwGHmfLGNAyi/SAO5vdGu1sEDUJS9ryf+6ywIz9rBI/VXgMqLc3piltl+4hT40nB
	2+sg==
X-Gm-Message-State: AMke39m2ly9XvSRoW9z1QxykBFTDKvFYURu67VRGXROQ9af8UndvyzLYjKe/37jC+2e6PO29fWKJU0mgxAHXnA==
X-Received: by 10.223.154.149 with SMTP id a21mr32998697wrc.145.1489515199598; 
	Tue, 14 Mar 2017 11:13:19 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.145.24 with HTTP; Tue, 14 Mar 2017 11:13:19 -0700 (PDT)
In-Reply-To: <20170314173704.paadx2itbq6anwkh@piout.net>
References: <20170228150119.21252-1-nicolas.ferre@microchip.com>
	<20170314161431.GJ15664@denix.org>
	<20170314173704.paadx2itbq6anwkh@piout.net>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 14 Mar 2017 19:13:19 +0100
Message-ID: <CA+chaQeAhKqzacGGdtZ8rsTu7sd2XkLB+Ui_nYgodsZDzutp3w@mail.gmail.com>
To: Alexandre Belloni <alexandre.belloni@free-electrons.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>,
	openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] devmem2: Change source URL to regain access to it
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
X-List-Received-Date: Tue, 14 Mar 2017 18:13:20 -0000
Content-Type: text/plain; charset=UTF-8

Denys already sent patch with alternative solution.

All things included in my bitbake world are also mirrored on
sources.openembedded.org, so here is the old version:

http://sources.openembedded.org/devmem2.c

On Tue, Mar 14, 2017 at 6:37 PM, Alexandre Belloni <
alexandre.belloni@free-electrons.com> wrote:

> On 14/03/2017 at 12:14:31 -0400, Denys Dmytriyenko wrote:
> > On Tue, Feb 28, 2017 at 04:01:19PM +0100, Nicolas Ferre wrote:
> > > Change URL due to connexion error on the original page.
> > > As the header of the new devmem2.c source file has changed, change the
> > > signature and the LIC_FILES_CHKSUM specificaiton.
> >
> > Oh, great! So, now, everyone who has this file cached locally would have
> to
> > invalidate their mirrors? Moreover, if you are building master and morty
> or
> > older, you can't reuse the same source mirror as each of the builds will
> > complain about bad checksums...
> >
>
> Please suggest another solution. The main issue is that lartmaker.nl
> doesn't reply anymore and we don't have a local copy of the previous
> devmem2.c and I don't see it on
> http://downloads.yoctoproject.org/mirror/sources/ either.
>
> > --
> > Denys
> >
> >
> > > Signed-off-by: Nicolas Ferre <nicolas.ferre@microchip.com>
> > > ---
> > >  meta-oe/recipes-support/devmem2/devmem2.bb | 8 ++++----
> > >  1 file changed, 4 insertions(+), 4 deletions(-)
> > >
> > > diff --git a/meta-oe/recipes-support/devmem2/devmem2.bb
> b/meta-oe/recipes-support/devmem2/devmem2.bb
> > > index e48cc9210bb3..c42eb5e0b1c5 100644
> > > --- a/meta-oe/recipes-support/devmem2/devmem2.bb
> > > +++ b/meta-oe/recipes-support/devmem2/devmem2.bb
> > > @@ -1,9 +1,9 @@
> > >  SUMMARY = "Simple program to read/write from/to any location in
> memory"
> > >  LICENSE = "GPLv2+"
> > > -LIC_FILES_CHKSUM = "file://devmem2.c;endline=28;md5=
> dd68f2b0a5184b3db3dc25c99e0bd0cd"
> > > +LIC_FILES_CHKSUM = "file://devmem2.c;endline=38;md5=
> a9eb9f3890384519f435aedf986297cf"
> > >  PR = "r7"
> > >
> > > -SRC_URI = "http://www.lartmaker.nl/lartware/port/devmem2.c \
> > > +SRC_URI = "http://www.free-electrons.com/pub/mirror/devmem2.c \
> > >             file://devmem2-fixups-2.patch;apply=yes;striplevel=0"
> > >  S = "${WORKDIR}"
> > >
> > > @@ -18,5 +18,5 @@ do_install() {
> > >      install devmem2 ${D}${bindir}
> > >  }
> > >
> > > -SRC_URI[md5sum] = "be12c0132a1ae118cbf5e79d98427c1d"
> > > -SRC_URI[sha256sum] = "ec382c90af3ef2f49695ff14a4d652
> 1e58ac482c4e29d6c9ebca8768f699c191"
> > > +SRC_URI[md5sum] = "e23f236e94be4c429aa1ceac0f01544b"
> > > +SRC_URI[sha256sum] = "3b15515693bae1ebd14d914e46d388
> edfec2175829ea1576a7a0c8606ebbe639"
> > > --
> > > 2.9.0
> > >
> > > --
> > > _______________________________________________
> > > Openembedded-devel mailing list
> > > Openembedded-devel@lists.openembedded.org
> > > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
> --
> Alexandre Belloni, Free Electrons
> Embedded Linux and Kernel engineering
> http://free-electrons.com
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

