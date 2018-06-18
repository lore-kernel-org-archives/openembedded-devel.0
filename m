Return-Path: <Mark.Asselstine@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id BA2AD6FEFE
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Jun 2018 20:14:35 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w5IKEaMb009251
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 18 Jun 2018 13:14:36 -0700 (PDT)
Received: from yow-masselst-lx1.localnet (128.224.22.35) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.399.0; Mon, 18 Jun 2018 13:14:35 -0700
From: Mark Asselstine <mark.asselstine@windriver.com>
To: Andreas =?ISO-8859-1?Q?M=FCller?= <schnitzeltony@gmail.com>
Date: Mon, 18 Jun 2018 16:14:34 -0400
Message-ID: <1897778.l7aI5iDS63@yow-masselst-lx1>
Organization: Wind River
In-Reply-To: <CALbNGRQR6OPvXyoTmfXm9Yh5PmADNb=CNamyo7T-PebQ4-nrXA@mail.gmail.com>
References: <1529333146-6459-1-git-send-email-mark.asselstine@windriver.com>
	<d42b7242-3e89-796d-091a-fa3eb8ddd44d@windriver.com>
	<CALbNGRQR6OPvXyoTmfXm9Yh5PmADNb=CNamyo7T-PebQ4-nrXA@mail.gmail.com>
MIME-Version: 1.0
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-xfce][PATCH] xfce4-panel: fix QA issue 'installed-vs-shipped'
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
X-List-Received-Date: Mon, 18 Jun 2018 20:14:35 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

On Monday, June 18, 2018 4:10:12 PM EDT Andreas M=FCller wrote:
> On Mon, Jun 18, 2018 at 8:55 PM, Mark Hatle <mark.hatle@windriver.com>=20
wrote:
> > On 6/18/18 1:47 PM, Khem Raj wrote:
> >> On Mon, Jun 18, 2018 at 11:09 AM Mark Asselstine
> >>=20
> >> <mark.asselstine@windriver.com> wrote:
> >>> On Mon, Jun 18, 2018 at 1:57 PM, Khem Raj <raj.khem@gmail.com> wrote:
> >>>> On Mon, Jun 18, 2018 at 10:54 AM Mark Hatle <mark.hatle@windriver.co=
m>=20
wrote:
> >>>>> On 6/18/18 12:50 PM, Khem Raj wrote:
> >>>>>> Hi Mark
> >>>>>>=20
> >>>>>> It seems your distro is not inheriting it globally. Here I have
> >>>>>> INHERIT_DISTRO ?=3D  "debian devshell sstate license remove-libtoo=
l"
> >>>>>=20
> >>>>> So is remove-libtool a recipe or a distro option?
> >>>>>=20
> >>>>> I'm asking because doing this half-way is causing a lot of confusio=
n.
> >>>>>=20
> >>>>> If it's a distro option, then the recipes should work without it be=
ing
> >>>>> set.  If it's a recipe option, then the recipes that need it should
> >>>>> use it.
> >>>>>=20
> >>>>> Right now it doesn't seem to be working with these recipes because
> >>>>> they don't package the .la files UNLESS it's enabled.  So the fix is
> >>>>> either to package them (by default) or inherit the remove-libtool.
> >>>>=20
> >>>> since we make it as part of meta/conf/distro/defaultsetup.conf
> >>>> its a default policy,  its perfectly fine for a distro to disregard
> >>>> that
> >>>> however, then you fall into a non-default case. I am willing to acce=
pt
> >>>> per recipe patches but I would recommend to consider it as a distro
> >>>> feature for your distro.
> >>>=20
> >>> Andreas,
> >>>=20
> >>> Can you revert your "various classes recipes: Remove FILES entries for
> >>> dbg/dev packages" then? If this is a distro feature then these recipes
> >>> need to build without the QA issue and without the remove-libtool
> >>> distro feature being set.
>=20
> I prefer not to apply the patch (Or Khem shall I send a revert?). It
> is not a good idea to break builds for distros not following a
> recommendation. Anyway the mentioned patch was a cleanup: It is not
> worth to break things by a minor cleanup.

The patch doesn't just cleanup .la but also some .debug files, so I suppose=
 it=20
doesn't have to be a full revert. I can put together something which just g=
ets=20
things going with a return to including .la files in FILES if people would=
=20
prefer that approach.

MarkA

>=20
> Andreas





