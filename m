Received: from mail-ww0-f47.google.com ([74.125.82.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <xor.gate.engineering@gmail.com>) id 1O7vX4-0008Fp-PE
	for openembedded-devel@lists.openembedded.org;
	Fri, 30 Apr 2010 21:05:51 +0200
Received: by wwb18 with SMTP id 18so397880wwb.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Apr 2010 12:02:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=ZBlMMclzx0nira6IqxEAPUudZeQQkS9q3CHqfyAiuUs=;
	b=cvqQ6wyPaosuNa1qPNwvbFAn1W7FG583JaUUb2qfB3168yCUanSzA/c2CVxHLHy2zm
	V1CbiEU2OD3+bmWTqm/J2KjqtO7mnZoT39W+tht6uM0iEzTLcJbpVOobDijcOKVbflfa
	VCefAwxImyCXZVDb3tmbxhUb6hphiEjiqJa64=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=Wz13P7+OpTNGtjA+N7Jz8t9+JUp+bMdGVJByF9CRFmqlnetlttAP4clehBewcTLJoL
	rM7yKUq+vexyxF1Y+mjtGhnhzTkMBWQw5cZcbUvmkWzQdgP+ASrwN/0kWgINgLAa8mip
	XyYWsivYyueR35QJ828DvTJg56nL9MgXK9bGU=
MIME-Version: 1.0
Received: by 10.216.90.135 with SMTP id e7mr2715834wef.82.1272654082853; Fri, 
	30 Apr 2010 12:01:22 -0700 (PDT)
Received: by 10.216.139.144 with HTTP; Fri, 30 Apr 2010 12:01:22 -0700 (PDT)
In-Reply-To: <20100430175823.GB5713@denix.org>
References: <q2x8db82dd41004300634g46c42cf7na4871677b8d92cb7@mail.gmail.com>
	<1272646386.21120.84.camel@trini-m4400>
	<20100430175823.GB5713@denix.org>
Date: Fri, 30 Apr 2010 21:01:22 +0200
Message-ID: <t2x8db82dd41004301201mb827e1f6p2eced7b49a5a031f@mail.gmail.com>
From: Jerry Jacobs <xor.gate.engineering@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.47
X-SA-Exim-Mail-From: xor.gate.engineering@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
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
X-List-Received-Date: Fri, 30 Apr 2010 19:05:52 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 30, 2010 at 7:58 PM, Denys Dmytriyenko <denis@denix.org> wrote:
>
> On Fri, Apr 30, 2010 at 09:53:06AM -0700, Tom Rini wrote:
> > On Fri, 2010-04-30 at 15:34 +0200, Jerry Jacobs wrote:
> > > Dear all,
> > >
> > > I'm very new to openembedded and already have a clear view how it is
> > > structured. My embedded board mini2440 is already in git and want to =
create
> > > my own distro.
> > > The problem where I bump against is how to use the Codesourcery exter=
nal
> > > toolchain for my target. I know there is the file in recipes/meta/
> > > external-toolchain-csl.bb
> > > but it not clear how to use it.
> >
> > There's 2 ways. =A0One way is, in local.conf:
> > ### CSL public ARM does <arch>-none-<os>, so fill in the -none
> > TARGET_VENDOR =3D "-none"
> > ### Bring in external-toolchain-csl.bb
> > TOOLCHAIN_BRAND =3D "csl"
> > ### Where the CSL version is installed.
> > TOOLCHAIN_PATH =3D "/full/path/to/arm-2009q3"
> > ### Where inside the CSL install the target libraries exist.
> > TOOLCHAIN_SYSPATH =3D "${TOOLCHAIN_PATH}/arm-none-linux-gnueabi"
> > ### Add tools to the PATH automatically.
> > PATH_prepend =3D "${TOOLCHAIN_PATH}/bin:"
> > require conf/distro/include/toolchain-external.inc
> >
> > The other way has a few less variables in local.conf but assumes PATH i=
s
> > already updated. =A0Denys will reply shortly with that, I imagine.
>
> The only difference I have from Tom's setup is I expect the CSL toolchain
> being already in the PATH variable:
>
> export PATH=3D/full/path/to/arm-2009q1/bin:$PATH
>
> And then set the other several BitBake variables accordingly (in local.co=
nf
> and toolchain-csl.conf):
>
> TARGET_VENDOR =3D "-none"
> # no need to include/require toolchain-external.inc, as TOOLCHAIN_TYPE do=
es it
> TOOLCHAIN_TYPE =3D "external"
> TOOLCHAIN_BRAND =3D "csl"
>
> [There I also set CPPFLAGS and LDFLAGS to point to CSL directly, but it's=
 not
> required as necessary files are staged by the recipe these days.]
>
> The "black magic" in the local.conf is basically a Python code to set
> TOOLCHAIN_PATH and TOOLCHAIN_SYSPATH based on the user's PATH:
>
> TOOLCHAIN_PATH =3D "${@code-to-extract-csl-path-from-PATH}"
> TOOLCHAIN_SYSPATH =3D ${TOOLCHAIN_PATH}/${TARGET_SYS}
>
> So, with my setup, no modifications to local.conf are required, as long a=
s CSL
> is in your PATH. With Tom's setup, users would need to add the CSL path t=
o
> local.conf.
>
> Hope this helps.
>
> --
> Denys

This clears things up, bit still its not sufficient to get it working.

The DISTRO seems to overwrite the TOOLCHAIN rules. And this while I
set the TOOLCHAIN variables in local.conf

And why compiles it things like coreutils-native? This are the tools
needed to compile software, like make, autoconf?
NOTE: package coreutils-native-7.2-r1: task do_setscene: Started

I have experience with compiling software on a linux machine but
OpenEmbedded is a bit different
than the other frameworks and tools.


