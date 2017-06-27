Return-Path: <liu.ming50@gmail.com>
Received: from mail-vk0-f41.google.com (mail-vk0-f41.google.com
	[209.85.213.41])
	by mail.openembedded.org (Postfix) with ESMTP id 673B871DD7
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Jun 2017 03:04:48 +0000 (UTC)
Received: by mail-vk0-f41.google.com with SMTP id y70so9804575vky.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Jun 2017 20:04:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=JTGiFhZomA8FfJSiSREJhY1IAlU+a951pA6qcQEIjmQ=;
	b=dlbWuARe535AqiYDPBqQU3iHvimC4rCYz+9lrak9UyXRFGHfelkN2iqbvDw15vbmds
	aL0TyKawyoiaXmlw7g9JA0632TtrrgRcQLRZlJGvz+cVNimFgWnbCGSUjqhVx4JMeHwX
	QLYt4aWgn+dg6diG7BMa+iMyElEftutPnQ0uZMrSI6pZ9S2cJx9H3ZgisW8eqv92nqj5
	t1AHuwpKhuDNjqiEXnji/4mrnDj6Qxy8Hmo9Na8xNT7ja1w+L9zmFEB+pNynO6RDZQwK
	8K/oc2teterJzy554GbvHhtKTijMxR0J3mJ221fE3PdQtHmSvgHYHFVeOwojGYUoJUMm
	PmpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=JTGiFhZomA8FfJSiSREJhY1IAlU+a951pA6qcQEIjmQ=;
	b=ZDSBKw7Kkwaqg+BYWThw2X73kQ/1AXgiEUtFHIV+G7slrgSsHrz/PwJtwgRmdYlhaj
	AE85ux6oseoZSnJJaYKcHFbN+4X8JnJ/qElqx0tfbLWjXNzlVRG6k1pm0+MDBoUPfTZL
	fECuRkzFNUwGAensdYebpNUJXvqEfh4fKkOfSE6ref3HEg7kiKh+zpL2d744lpt5qhGO
	tUiEObdOFKNnQLvK0O7p3uwt2b7L45nTtvzi02H0XYwFahg1YUXxNs7szMl9FF2RMkBe
	QTiDTY3EsEIRXXBpJ+uts+6MyZfVY+/slQqVS/HZbr9A4HoYbaPXlbn2STwp4ByUEkDr
	vceg==
X-Gm-Message-State: AKS2vOzzDLw2mcQoAZwwlFKXM/VNcbDJUV3zUFzQQvtOL/muLxH6AZZQ
	sShe+ETlLxEGs0wG8guEA5rA7DuJSviS
X-Received: by 10.31.124.66 with SMTP id x63mr1721369vkc.126.1498532690135;
	Mon, 26 Jun 2017 20:04:50 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.103.78.91 with HTTP; Mon, 26 Jun 2017 20:04:49 -0700 (PDT)
In-Reply-To: <20170626155256.GG28053@denix.org>
References: <1497932912-30016-1-git-send-email-liu.ming50@gmail.com>
	<20170622191849.GS28053@denix.org> <20170623211933.GB28053@denix.org>
	<CA+chaQeXfn18+4zHth7_enazNF9hh3idLT+V7YvJLPH+5p5cQw@mail.gmail.com>
	<20170623214631.GC28053@denix.org>
	<CALatG=7jn597sL8XE2hk8X67smJTH84HPe+wsYzwHC1HNHh9cA@mail.gmail.com>
	<20170626155256.GG28053@denix.org>
From: Ming Liu <liu.ming50@gmail.com>
Date: Tue, 27 Jun 2017 05:04:49 +0200
Message-ID: <CALatG=4YvrLRiLTczWKayJak2ZzX-iUGUX7sKhkX4pKp8cc1yA@mail.gmail.com>
To: Denys Dmytriyenko <denis@denix.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-qt5] [PATCH] qttools: DEPENDS on icu
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
X-List-Received-Date: Tue, 27 Jun 2017 03:04:49 -0000
Content-Type: text/plain; charset="UTF-8"

Hi,

Please revert it, I probably made a mistake, I encountered this issue in
morty branch, then I checked the qttools-5.7 source, and found there is
code referring ICU, so I thought the issue is also impacting the upstream,
which it seems is not according to Denys, sorry for the inconvenience I
brought.

2017-06-26 17:52 GMT+02:00 Denys Dmytriyenko <denis@denix.org>:

> I believe this was meant to be sent to the list, not just me directly...
>
> On Mon, Jun 26, 2017 at 05:00:14AM +0200, Ming Liu wrote:
> > Hi,
> >
> > Please revert it, I probably made a mistake, I encountered this issue in
> > morty branch, then I checked the qttools-5.7 source, and found there is
> > code referring ICU, so I thought the issue is also impacting the
> upstream,
> > which it seems is not according to Denys, sorry for the inconvenience I
> > brought.
> >
> > //Ming Liu
> >
> > 2017-06-23 23:46 GMT+02:00 Denys Dmytriyenko <denis@denix.org>:
> >
> > > Thanks.
> > >
> > > On Fri, Jun 23, 2017 at 11:41:05PM +0200, Martin Jansa wrote:
> > > > Yes, I've seen both e-mails. I'm waiting for response from author,
> then
> > > > I'll revert it in master and pyro branches.
> > > >
> > > > On Fri, Jun 23, 2017 at 11:19 PM, Denys Dmytriyenko <denis@denix.org
> >
> > > wrote:
> > > >
> > > > > Martin,
> > > > >
> > > > > Were you able to look into this yet? I didn't copy you directly at
> > > first,
> > > > > so
> > > > > not sure if you missed it...
> > > > >
> > > > >
> > > > > On Thu, Jun 22, 2017 at 03:18:49PM -0400, Denys Dmytriyenko wrote:
> > > > > > On Tue, Jun 20, 2017 at 06:28:32AM +0200, liu.ming50@gmail.com
> > > wrote:
> > > > > > > From: Ming Liu <peter.x.liu@external.atlascopco.com>
> > > > > > >
> > > > > > > This fixes a following QA issue:
> > > > > > > | QA Issue: nativesdk-qtbase-tools rdepends on
> > > nativesdk-libicui18n,
> > > > > but it isn't a build dependency.
> > > > > > > | QA Issue: nativesdk-qtbase-tools rdepends on
> nativesdk-libicuuc,
> > > but
> > > > > it isn't a build dependency.
> > > > > > > | QA Issue: nativesdk-qtbase-tools rdepends on
> > > nativesdk-libicudata,
> > > > > but it isn't a build dependency.
> > > > > >
> > > > > > It seems there's inconsistency here between errors above
> referring to
> > > > > > nativesdk-qtbase-tools and the change below made to qttools
> instead
> > > of
> > > > > > qtbase!
> > > > > >
> > > > > > I wonder if this fix was not included by the author:
> > > > > >
> > > > > > https://github.com/meta-qt5/meta-qt5/commit/
> > > > > ff073f04109900fc07bf81e2f1df63c626caf342
> > > > > >
> > > > > > Just to double-check, I just built nativesdk-qttools using
> meta-qt5
> > > w/o
> > > > > this
> > > > > > patch and I don't see the above QA errors.
> > > > > >
> > > > > > --
> > > > > > Denys
> > > > > >
> > > > > >
> > > > > > > Signed-off-by: Ming Liu <peter.x.liu@external.atlascopco.com>
> > > > > > > ---
> > > > > > >  recipes-qt/qt5/qttools_git.bb | 2 +-
> > > > > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > > > > >
> > > > > > > diff --git a/recipes-qt/qt5/qttools_git.bb b/recipes-qt/qt5/
> > > > > qttools_git.bb
> > > > > > > index 5c0f51c..1108390 100644
> > > > > > > --- a/recipes-qt/qt5/qttools_git.bb
> > > > > > > +++ b/recipes-qt/qt5/qttools_git.bb
> > > > > > > @@ -16,7 +16,7 @@ LIC_FILES_CHKSUM = " \
> > > > > > >
> > > > > > >  inherit ptest
> > > > > > >
> > > > > > > -DEPENDS += "qtbase qtdeclarative qtxmlpatterns"
> > > > > > > +DEPENDS += "qtbase qtdeclarative qtxmlpatterns icu"
> > > > > > >
> > > > > > >  SRC_URI += " \
> > > > > > >      file://run-ptest \
> > > > > > > --
> > > > > > > 2.7.4
> > > > > > >
> > > > > > > --
> > > > > > > _______________________________________________
> > > > > > > Openembedded-devel mailing list
> > > > > > > Openembedded-devel@lists.openembedded.org
> > > > > > > http://lists.openembedded.org/mailman/listinfo/openembedded-
> devel
> > > > > > --
> > > > > > _______________________________________________
> > > > > > Openembedded-devel mailing list
> > > > > > Openembedded-devel@lists.openembedded.org
> > > > > > http://lists.openembedded.org/mailman/listinfo/openembedded-
> devel
> > > > >
> > >
>

