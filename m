Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1ROtgU-0004bF-1n
	for openembedded-devel@lists.openembedded.org;
	Fri, 11 Nov 2011 17:10:30 +0100
Received: by faat2 with SMTP id t2so4328594faa.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Nov 2011 08:04:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=Js2bXyPDcAzAfjKN6cyVLzmHhdRjCV/NDbzd9F5cAbU=;
	b=x1uoifu5uWAb76qNTPUoyWwfbBvMTMxMGiMF+gGMIGeleUJ34mXlzWXwzXc9XR+8wB
	c7ezuE8gp7NB6j8IT1zDHdypGLO/IZd46kzsQ8f2BbKMfNKsaSm/+Avh/uQYZAm+UEX0
	Wb7mb1R6om1upYmg7jPBz0sQTrFabpdXyvqcU=
Received: by 10.205.126.13 with SMTP id gu13mr1125411bkc.114.1321027452034;
	Fri, 11 Nov 2011 08:04:12 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id o7sm1629414bkw.16.2011.11.11.08.04.10
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 11 Nov 2011 08:04:10 -0800 (PST)
Date: Fri, 11 Nov 2011 17:03:59 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20111111160358.GC3574@jama.jama.net>
References: <CALJpqJwD0FPCUiD1FRCKR4e=ZTRJb-Lko1nBAC-gLPp057EKpg@mail.gmail.com>
	<1320996619.7415.4.camel@mattotaupa>
	<833EEBB2-42FF-438F-A5F3-8B24DDD3964D@microbee-systems.com>
	<6416131.BOns2L3oYb@helios>
	<CALJpqJz=KCMbQJqg=_iuCgaFzvk8mH+454saq254ZuS+e8OgtA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CALJpqJz=KCMbQJqg=_iuCgaFzvk8mH+454saq254ZuS+e8OgtA@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: SRC_URI = "svn://svn.o-hand.com/repos/matchbox/trunk
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
X-List-Received-Date: Fri, 11 Nov 2011 16:10:30 -0000
X-Groupsio-MsgNum: 35346
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="f+W+jCU1fRNres8c"
Content-Disposition: inline

--f+W+jCU1fRNres8c
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 11, 2011 at 09:52:35AM -0600, David Thomas wrote:
> I think it is choking on this:
>=20
>=20
> PV =3D "0.0+svnr${SRCPV}"
> PR =3D"r7"
>=20
> bb.mkdirhier(codir)
>=20
>  fatal: Not a valid object name 1910
> NOTE: package matchbox-keyboard-0.0+svnr0+1910-r7: task Fetch failed:
> Unable to fetch URL
> git://git.yoctoproject.org/matchbox-keyboard;protocol=3Dgit from any
> source.: Failed
> ERROR: Function 'Fetch failed: Unable to fetch URL
> git://git.yoctoproject.org/matchbox-keyboard;protocol=3Dgit from any
> source.' failed
>=20
>=20
> Tinkering a tad by commenting out PV =3D "0.0+svnr${SRCPV}"  makes me
> think it is trying to point to a specific release in the repository,
> something similar.
>=20
> bb.mkdirhier(codir)
>=20
>  fatal: Not a valid object name 1910
> NOTE: package matchbox-keyboard-svn-r7: task Fetch failed: Unable to
> fetch URL git://git.yoctoproject.org/matchbox-keyboard;protocol=3Dgit
> from any source.: Failed
> ERROR: Function 'Fetch failed: Unable to fetch URL
> git://git.yoctoproject.org/matchbox-keyboard;protocol=3Dgit from any
> source.' failed
> ERROR: Task 5758
> (/home/twoods/openembedded/recipes/matchbox-keyboard/matchbox-keyboard_sv=
n.bb,
> do_fetch) failed with exit code '1'
> ERROR: '/home/twoods/openembedded/recipes/matchbox-keyboard/matchbox-keyb=
oard_svn.bb'
> failed

This looks like you didn't copy SRCREV param from git recipe in oe-core.

So it's trying to checkout git hash 1910 which doesn't exist, because
it's subversion revision from old recipe and not git hash.

>=20
>=20
>=20
>=20
>=20
>=20
> On Fri, Nov 11, 2011 at 7:05 AM, Paul Eggleton
> <paul.eggleton@linux.intel.com> wrote:
> > On Friday 11 November 2011 06:11:14 David Thomas wrote:
> >> Well I checked this and the files where in this location... Still no d=
ice.
> >> The manual states it first searches to see if they exist then download=
s. I
> >> see the opposite, it fails to contact the server and then fails.
> >
> > I don't think this is to do with those files (they are in the files sub=
dir as
> > you point out, and they will be found there via FILESPATH; this is auto=
matic).
> > If it's contacting the server and failing, it's the URI pointing to that
> > server or some other problem relating to that operation. You're not beh=
ind
> > some kind of firewall that blocks the git protocol are you?
> >
> > Also, from one of your earlier emails:
> >> SRC_URI =3D "git:///home/twoods/local;protocol=3Dfile;branch=3Dmaster"
> >
> > I don't think this is what you want. Just use file://<full path> if you=
 want to
> > point it to a local location. But I'm not sure that's what you really w=
ant
> > here either.
> >
> >> git://git.yoctoproject.org/matchbox-keyboard;protocol=3Dgit;file://sma=
llscreen
> >> -fontsize.patch;patch=3D1
> >
> > That won't work - you have no space between the first URI and the next.=
 Fix
> > that, and assuming your network allows access to remote git repos, that=
 should
> > work.
> >
> > You can double check what SRC_URI bitbake is going to use by running th=
is:
> >
> > bitbake -e matchbox-keyboard | grep ^SRC_URI
> >
> > Could you also remind me what DISTRO you are using?
> >
> > Cheers,
> > Paul
> >
> > --
> >
> > Paul Eggleton
> > Intel Open Source Technology Centre
> >
>=20
>=20
>=20
> --=20
> Dave Thomas
> MicroBee Systems, Inc
> 1429 Weatherly Road, Suite G
> Huntsville, AL 35803-1187
> 256-489-6671 (Voice)
> 256-426-2431 (Mobile)
> 256-489-6673 (FAX)
> www.microbee-systems.com
> "Innovative Solutions for an Embedded World"
>=20
> This message is intended for the sole use of the addressee, and may
> contain information that is privileged, confidential and exempt from
> disclosure under applicable law. If you are not the addressee you are
> hereby notified that you may not use, copy, disclose, or distribute to
> anyone the message or any information contained in the message. If you
> have received this message in error, please immediately advise the
> sender by reply email and delete this message.
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--f+W+jCU1fRNres8c
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk69R24ACgkQN1Ujt2V2gBx+uQCfcNMLk0yx4FG051KXR0G/MoHv
rjYAniPcGrWegjlcknyCZvdnejiBYDYh
=HJM5
-----END PGP SIGNATURE-----

--f+W+jCU1fRNres8c--
