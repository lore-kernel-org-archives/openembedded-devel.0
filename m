Return-Path: <uvv.mail@gmail.com>
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com
	[209.85.160.177])
	by mail.openembedded.org (Postfix) with ESMTP id 079C0799F4
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  5 Oct 2018 09:50:45 +0000 (UTC)
Received: by mail-qt1-f177.google.com with SMTP id x23-v6so13133232qtr.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 05 Oct 2018 02:50:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=2LWTE+VCwCLmhIAemrX00ICRHo2okVqxNfZlHw2Oy30=;
	b=McNtXLS+Zr0/Z7dZE6NmXDR+c2YBdCjf+L/cK3Q08yVuxDLwt4SyKpSxZg0urpetxQ
	cyKoWxZ54C7BqY53nKAEsfr4ODcxnjPOfagVQYQvr54IciHpqZmJtW2FCHGjPi/Hw3LP
	aeBpmVwoGyVA+PH/YdBq5DNR7eRtc53AcungS4rEOdutrHOgegPf25F9dJ6FkiU/3WN2
	AXUXBDnEuq7KXSwj4vYY4uH1o23iVm+ZFriqnwZjFDlXM4JcRkIbFyMc7MFk7KTCqcof
	laMWd15lg4wLGbJ2CuLlq3c3HfkIdf1VuOXlC4yIjavzUV83xCIDTlkPh7D06p5e+28t
	qE/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=2LWTE+VCwCLmhIAemrX00ICRHo2okVqxNfZlHw2Oy30=;
	b=rR3qxU4HP0VdigWDUcqXrTFtsj02h0BYKA9MGhooBs+5JQnBK3vrxdUR7ThX0QR43H
	svRbEKnN68OJkpSspNnh5jNlLIQVDNHl+B373+EzS+29tKrbaHs8y26ZglDKgRzV3BRy
	H8mfZL8hq5kkOUlLETFeDFUt+tiS+UEPcTSchpRCBhYbzRMGSt/k8Fe030w1oQ4JHPFE
	ZOpayHvQ/JwRJVYN0lJz9sWhDSPOydyRl3A9RVK3lflaV/P1g8WOidgOHFQumYrWyeer
	VqPBuz73S/gdPgWXHXXg1fe64h43n5fAM0z+QR8FsmGTvrRZmZfa071GRP/j6vEYCveR
	/HUw==
X-Gm-Message-State: ABuFfogdAOhX5tr+6ib+wUhtrofJrLr+IDlBLYHCj5hi7N1tIxTeNNWC
	tUeJDaS8xd40zk6oriGrJaUalemPLd0nrYhD2u4=
X-Google-Smtp-Source: ACcGV60OExUN8n/sMhcmwFhfi7n9ZuJ2EYXUeaYH02NQdVmlJ0+SpBa4Qp+aGwTiKMZVeLK7nbnPrwe+Y2Pw8RyawOM=
X-Received: by 2002:ac8:2729:: with SMTP id
	g38-v6mr8426307qtg.168.1538733046910; 
	Fri, 05 Oct 2018 02:50:46 -0700 (PDT)
MIME-Version: 1.0
References: <20181005091722.105122-1-uvv.mail@gmail.com>
	<20181005094401.GA1334@jama>
In-Reply-To: <20181005094401.GA1334@jama>
From: Vyacheslav Yurkov <uvv.mail@gmail.com>
Date: Fri, 5 Oct 2018 11:50:40 +0200
Message-ID: <CAKHfEaig7knGXeXsHdwZ=jk4w4z5+aZQ2TmdE_QRxpKzQJcLFA@mail.gmail.com>
To: martin.jansa@gmail.com
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] ceres-solver: Removed empty package
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
X-List-Received-Date: Fri, 05 Oct 2018 09:50:46 -0000
Content-Type: text/plain; charset="UTF-8"

I'm bit behind with oe-core (not on master) and was not aware of that.
Anyway I was about to send v2, because I realized that static library and
headers should come together, and it doesn't make sense to specify two
packages.

Vyacheslav

On Fri, Oct 5, 2018 at 11:43 AM Martin Jansa <martin.jansa@gmail.com> wrote:

> On Fri, Oct 05, 2018 at 11:17:22AM +0200, Vyacheslav Yurkov wrote:
> > By default ceres-solver provides a static library and headers.
> > This change removes an empty package and sets an implicit dependency
> > on dev and dbg packages.
> >
> > It also addresses missing cmake configuration files in dev package.
> >
> > Signed-off-by: Vyacheslav Yurkov <uvv.mail@gmail.com>
> > ---
> >  meta-oe/recipes-support/ceres-solver/ceres-solver_1.14.bb | 5 ++++-
> >  1 file changed, 4 insertions(+), 1 deletion(-)
> >
> > diff --git a/meta-oe/recipes-support/ceres-solver/ceres-solver_1.14.bb
> b/meta-oe/recipes-support/ceres-solver/ceres-solver_1.14.bb
> > index ad7c8f2a3..13ca8efab 100644
> > --- a/meta-oe/recipes-support/ceres-solver/ceres-solver_1.14.bb
> > +++ b/meta-oe/recipes-support/ceres-solver/ceres-solver_1.14.bb
> > @@ -13,5 +13,8 @@ S = "${WORKDIR}/git"
> >
> >  inherit cmake
> >
> > +FILES_${PN}-dev += "${libdir}/cmake/"
>
> Why is this needed? cmake files are packaged automatically since oe-core
> commit:
>
> commit 543e39ad5e2baa0f1ece013a89483783e6b15dd9
> Author: Andre McCurdy <armccurdy@gmail.com>
> Date:   Tue Jun 26 12:48:11 2018 -0700
>
>     bitbake.conf: handle cmake -dev files packaging with default rules
>
> > +
> >  # Only a static library and headers are created
> > -ALLOW_EMPTY_${PN} = "1"
> > +RDEPENDS_${PN}-dev = ""
> > +RRECOMMENDS_${PN}-dbg = "${PN}-dev (= ${EXTENDPKGV})"
> > --
> > 2.19.0
> >
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>

