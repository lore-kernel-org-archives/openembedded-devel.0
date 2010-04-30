Received: from vms173013pub.verizon.net ([206.46.173.13])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1O7vwP-0000Je-1u
	for openembedded-devel@lists.openembedded.org;
	Fri, 30 Apr 2010 21:32:04 +0200
Received: from gandalf.denix.org ([unknown] [71.251.58.177])
	by vms173013.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0L1P00BYUFKYU4C0@vms173013.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Fri,
	30 Apr 2010 14:31:52 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 8B69214AF60; Fri,
	30 Apr 2010 15:27:53 -0400 (EDT)
Date: Fri, 30 Apr 2010 15:27:53 -0400
From: Denys Dmytriyenko <denis@denix.org>
In-reply-to: <t2x8db82dd41004301201mb827e1f6p2eced7b49a5a031f@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-id: <20100430192753.GC5713@denix.org>
MIME-version: 1.0
References: <q2x8db82dd41004300634g46c42cf7na4871677b8d92cb7@mail.gmail.com>
	<1272646386.21120.84.camel@trini-m4400>
	<20100430175823.GB5713@denix.org>
	<t2x8db82dd41004301201mb827e1f6p2eced7b49a5a031f@mail.gmail.com>
User-Agent: Mutt/1.5.16 (2007-06-09)
X-SA-Exim-Connect-IP: 206.46.173.13
X-SA-Exim-Mail-From: denis@denix.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Usage of meta recipe external-toolchain-csl
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 30 Apr 2010 19:32:05 -0000
Content-type: text/plain; charset=iso-8859-1
Content-transfer-encoding: QUOTED-PRINTABLE
Content-disposition: inline

On Fri, Apr 30, 2010 at 09:01:22PM +0200, Jerry Jacobs wrote:
> On Fri, Apr 30, 2010 at 7:58 PM, Denys Dmytriyenko <denis@denix.org=
> wrote:
> >
> > On Fri, Apr 30, 2010 at 09:53:06AM -0700, Tom Rini wrote:
> > > On Fri, 2010-04-30 at 15:34 +0200, Jerry Jacobs wrote:
> > > > Dear all,
> > > >
> > > > I'm very new to openembedded and already have a clear view ho=
w it is
> > > > structured. My embedded board mini2440 is already in git and =
want to create
> > > > my own distro.
> > > > The problem where I bump against is how to use the Codesource=
ry external
> > > > toolchain for my target. I know there is the file in recipes/=
meta/
> > > > external-toolchain-csl.bb
> > > > but it not clear how to use it.
> > >
> > > There's 2 ways. =A0One way is, in local.conf:
> > > ### CSL public ARM does <arch>-none-<os>, so fill in the -none
> > > TARGET_VENDOR =3D "-none"
> > > ### Bring in external-toolchain-csl.bb
> > > TOOLCHAIN_BRAND =3D "csl"
> > > ### Where the CSL version is installed.
> > > TOOLCHAIN_PATH =3D "/full/path/to/arm-2009q3"
> > > ### Where inside the CSL install the target libraries exist.
> > > TOOLCHAIN_SYSPATH =3D "${TOOLCHAIN_PATH}/arm-none-linux-gnueabi=
"
> > > ### Add tools to the PATH automatically.
> > > PATH_prepend =3D "${TOOLCHAIN_PATH}/bin:"
> > > require conf/distro/include/toolchain-external.inc
> > >
> > > The other way has a few less variables in local.conf but assume=
s PATH is
> > > already updated. =A0Denys will reply shortly with that, I imagi=
ne.
> >
> > The only difference I have from Tom's setup is I expect the CSL t=
oolchain
> > being already in the PATH variable:
> >
> > export PATH=3D/full/path/to/arm-2009q1/bin:$PATH
> >
> > And then set the other several BitBake variables accordingly (in =
local.conf
> > and toolchain-csl.conf):
> >
> > TARGET_VENDOR =3D "-none"
> > # no need to include/require toolchain-external.inc, as TOOLCHAIN=
_TYPE does it
> > TOOLCHAIN_TYPE =3D "external"
> > TOOLCHAIN_BRAND =3D "csl"
> >
> > [There I also set CPPFLAGS and LDFLAGS to point to CSL directly, =
but it's not
> > required as necessary files are staged by the recipe these days.]
> >
> > The "black magic" in the local.conf is basically a Python code to=
 set
> > TOOLCHAIN_PATH and TOOLCHAIN_SYSPATH based on the user's PATH:
> >
> > TOOLCHAIN_PATH =3D "${@code-to-extract-csl-path-from-PATH}"
> > TOOLCHAIN_SYSPATH =3D ${TOOLCHAIN_PATH}/${TARGET_SYS}
> >
> > So, with my setup, no modifications to local.conf are required, a=
s long as CSL
> > is in your PATH. With Tom's setup, users would need to add the CS=
L path to
> > local.conf.
> >
> > Hope this helps.
> >
> > --
> > Denys
>=20
> This clears things up, bit still its not sufficient to get it worki=
ng.
>=20
> The DISTRO seems to overwrite the TOOLCHAIN rules. And this while I
> set the TOOLCHAIN variables in local.conf

Can you please be more specific? Grepping conf/ shows all the assignm=
ents=20
of TOOLCHAIN_* vars are weak.

> And why compiles it things like coreutils-native? This are the tool=
s
> needed to compile software, like make, autoconf?
> NOTE: package coreutils-native-7.2-r1: task do_setscene: Started

coreutils-native provides basic commands like cp, mv, cat, ls, mkdir,=
 mknod,=20
install etc. That ensures we have sane versions of those with the exp=
ected set=20
of supported command line parameters... If you know your host OS/dist=
ro=20
provides the same, feel free to add coreutils-native to ASSUME_PROVID=
ED in=20
your local.conf...

--=20
Denys



