Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RjWea-0007m6-Sz
	for openembedded-devel@lists.openembedded.org;
	Sat, 07 Jan 2012 14:49:48 +0100
Received: by eaal1 with SMTP id l1so1483373eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 07 Jan 2012 05:42:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=0CtgIAVC1kZHNA9t5lNb9H/JBBa1mEWTOnOYM007+rI=;
	b=RgqN3sQvxO5J2iSm+WUPy39qCXR1NyClOG2TPjgvUZgE9WAr0DsdlKnUhKSeYh9RJ9
	j4K30MqrTdsqPJ3+Wg9SNN/HqDkdlGKYkZORBCDdzgj8K/mQ9O0Gz0Ort3uIIku64x4Z
	J5tUWVtuNaNsqFB/aQ5NZ+ioXtyR0FOM8Sykw=
Received: by 10.213.22.207 with SMTP id o15mr304944ebb.124.1325943743894;
	Sat, 07 Jan 2012 05:42:23 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id t1sm262266820eeb.3.2012.01.07.05.42.21
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 07 Jan 2012 05:42:21 -0800 (PST)
Date: Sat, 7 Jan 2012 14:42:10 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20120107134210.GC3938@jama.jama.net>
References: <1325894128-26110-1-git-send-email-andrea.adami@gmail.com>
	<je8ucj$vub$1@dough.gmane.org>
	<CAP9ODKqFPd2GX6bw1_a0Fi2U+q5=_pcd4=OoHvYjVvPSLNf7RQ@mail.gmail.com>
	<20120107104945.GB3938@jama.jama.net>
	<CAAQYJAtoD4Hzpt2gPMEpw8ii=KT9rHxM0chU-Ag2R+-3MdkrKA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAAQYJAtoD4Hzpt2gPMEpw8ii=KT9rHxM0chU-Ag2R+-3MdkrKA@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-oe] [PATCH] xserver-common: remove extraneous BSP customizations
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
X-List-Received-Date: Sat, 07 Jan 2012 13:49:49 -0000
X-Groupsio-MsgNum: 36421
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="NU0Ex4SbNnrxsi6C"
Content-Disposition: inline

--NU0Ex4SbNnrxsi6C
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Jan 07, 2012 at 02:22:24PM +0100, Andrea Adami wrote:
> On Sat, Jan 7, 2012 at 11:49 AM, Martin Jansa <martin.jansa@gmail.com> wr=
ote:
> > On Sat, Jan 07, 2012 at 08:41:51AM -0200, Otavio Salvador wrote:
> >> On Sat, Jan 7, 2012 at 06:05, Koen Kooi <koen@dominion.thruhere.net> w=
rote:
> >>
> >> > -----BEGIN PGP SIGNED MESSAGE-----
> >> > Hash: SHA1
> >> >
> >> > Op 07-01-12 00:55, Andrea Adami schreef:
> >> > > * delete patches meant for BSP layers * bump PR
> >> >
> >> > With a recipe like xserver-common I don't see a point in going all o=
ut BSP
> >> > on it. This patch just moves things to layers just for the sake of m=
oving
> >> > it
> >> > to layers. I strongly suspect that applying this patch will be a net=
 burden
> >> > on device maintainers instead of a gain.
> >> >
> >>
> >> I agree this is going to be bad at first but those kind of improvements
> >> always cause some problems for a later gain. Dropping things that ough=
t to
> >> be in BSP layers is a good thing but only after the "fix other layers"=
 time
> >> window.
> >>
> >> I think this is worth it however it might be better to instead port the
> >> needed changes to OE-Core and ask other layers to adopt x11-common all=
owing
> >> us to remove this later on. This makes the change easier and avoid some
> >> problems for users IMO.
> >
> > This whole recipe has machine specific bits and removing those bits
> > only of some machines (in this case all from meta-smartphone BSPs)
> > doesn't improve that recipe.
> >
> > So if you want to improve it, merge extra functionality (like
> > xinput-pointercal) to oe-core and drop this completely, but breaking
> > some machines doesn't make thinks better.
> >
> > Instead of "fixing" it in meta-smartphone BSPs I would just copy whole
> > xserver-common back to meta-shr, because I don't have time now to fix it
> > properly and spending time on .bbappends is not worth it in this case.
> >
> > Cheers,
> >
> > JaMa, from daywork..ffs
> >
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> >
>=20
> I try to explain again my intent:
>=20
> 1) we have at the moment two xserver-nodm-init, one in meta-oe and one
> in oe-core
> 2) this is intrinsecaly bad and moreover the two recipes are totally
> different with regards to runtime dependencies

I'm aware of that and said that many times, just to busy with daywork
(in last couple of months) to fix it myself ;/.

> 3) as it is now, oe-core expects to use x11-common while in meta-oe
> there is xserver-common

I've already explained to you to use VIRTUAL_RUNTIME vars.

> 4) xserver-common is an old recipe coming from the oe-classic times,
> designed to work with gpe environments and targeting mostly kdrive.
> Thius recipe contains alot of BSP code.

Yes and those patches you've removed are not making it worse, upstream
script contains a lot of BSP code already and those patches are just
making it more complete (think about it as patch which should be applied
upstream not in BSP layer).

> 5) today, if one builds core-image-sato distroless for zaurus qvga
> using meta-oe the xserver won't start because of the bad settings
> provided by the recipe.

see A3).
=20
> So, I already sent a msg in that regard before (
> http://lists.linuxtogo.org/pipermail/openembedded-devel/2011-October/0355=
64.html
> ) and now I'm trying to help cleaning both sides.
> The patch for x11-common was taken in oe-core but this one for meta-oe
> is unexpectedly under discussion.
> BE sure my intentions are not to increase maintenance burden, on the
> opposite I'd like neutral/sane defaults and patches to override those
> in the BSP layers.

burden is to force people to fix recipe which should be removed instead.

Regards,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--NU0Ex4SbNnrxsi6C
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk8IS7IACgkQN1Ujt2V2gBzUlgCfdL0GmiQRg++3Dlwkrq3pXr0N
7WoAn35JUgdD/y7pGNN1ibkNa8ro4w3o
=ATDW
-----END PGP SIGNATURE-----

--NU0Ex4SbNnrxsi6C--
