Received: from [213.165.64.20] (helo=mail.gmx.net)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <theBohemian@gmx.net>) id 1Jki8U-0004CQ-M0
	for openembedded-devel@lists.openembedded.org;
	Sat, 12 Apr 2008 17:59:26 +0200
Received: (qmail invoked by alias); 12 Apr 2008 15:59:19 -0000
Received: from brln-4db9810e.pool.einsundeins.de (EHLO [192.168.4.110])
	[77.185.129.14]
	by mail.gmx.net (mp004) with SMTP; 12 Apr 2008 17:59:19 +0200
X-Authenticated: #17532834
X-Provags-ID: V01U2FsdGVkX1/qQ6dcYtXqRzvfbM8pFivXZp02u+mQXero4aZI+l
	md6kaaDToGAi02
Message-ID: <4800DC3B.9080007@gmx.net>
Date: Sat, 12 Apr 2008 17:58:51 +0200
From: Robert Schuster <theBohemian@gmx.net>
User-Agent: Mozilla-Thunderbird 2.0.0.9 (X11/20080110)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <35a670560804100650w7de4cec0gae583d5ae73b8fad@mail.gmail.com>	<47FE2530.2@gmx.net>
	<35a670560804101007m1d787b4ai97927bb42fcbfe5d@mail.gmail.com>
In-Reply-To: <35a670560804101007m1d787b4ai97927bb42fcbfe5d@mail.gmail.com>
X-Enigmail-Version: 0.95.0
X-Y-GMX-Trusted: 0
Subject: Re: Building ubuntu/gcc-4_2-branch to get GCJ for arm EABI
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 12 Apr 2008 15:59:26 -0000
X-Groupsio-MsgNum: 4942
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="------------enigF42732896D00AF9AB7114B8B"

--------------enigF42732896D00AF9AB7114B8B
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

HI Matthijs,

Matthijs van de Water schrieb:
> I know they're not all needed to get a working arm-linux-gnueabi-gcj.
> But I'm not sure if I should mix GCC versions...
> So I changed my preferred version of GCC to '4.2.3-ubuntu' so that one
> will be used in the entire build and started a clean build. I thought
> I was a good idea to keep all gcc things that are built based on the
> same code-base. Is that a wrong assumption? To test I just did a
> "bitbake glibc" which I presume will build enough to know if things
> work.
That is indeed a good idea. GCJ heavily relies on the BC ABI which is
defined for C++. If you use different compilers things may break.

>>  Please report your results.
> The build has just failed on glibc-intermediate with a linking error:
> cannot find -lgcc_eh. I'll look into that now.
> It has finished building the following stuff:
> binutils-cross-2.18-r1
> gcc-cross-4.2.3-ubuntu-r6
> gcc-cross-initial-4.2.3-ubuntu-r6
> glibc-2.6.1-r3
> glibc-intermediate-2.6.1-r3
> linux-libc-headers-2.6.24-r2
Have a look at gcc-4.2.2.inc. As you there are many patches applied
which for e.g. ARM. It is likely that you need to have those for your
GCC recipe, too.

>>  If you get it working please try whether the GCJ patches can be appli=
ed
>>  to any of the existing GCC versions within OE. That way all
>>  distributions in OE can make use of it optionally (when they switch t=
o
>>  this GCC).
> That patch will be massive: there are tons of new .java files....
Which perhaps it makes sense then to get everything working from GCJ
4.3.0 onwards. AFAIK this release contains all the ARM GCJ stuff we need
and we can ask Andrew Haley if important GCJ patches have been
introduced after the 4.3.0 release.

GCC 4.3.0 support in OE is still in its infancy and requires some
workarounds. Keep an eye on this list for news about that.

Regards
Robert


--------------enigF42732896D00AF9AB7114B8B
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iD8DBQFIANxAG9cfwmwwEtoRCDn/AJwNkKapU9Oe99Xv3+dvVRKnlbmuWwCfbrh2
u+MTLXjva+RYIJLiGthUmxs=
=Irfh
-----END PGP SIGNATURE-----

--------------enigF42732896D00AF9AB7114B8B--
