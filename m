Received: from [213.165.64.20] (helo=mail.gmx.net)
	by linuxtogo.org with smtp (Exim 4.68)
	(envelope-from <theBohemian@gmx.net>) id 1J5gkm-0007J1-LC
	for openembedded-devel@lists.openembedded.org;
	Fri, 21 Dec 2007 13:13:24 +0100
Received: (qmail invoked by alias); 21 Dec 2007 12:08:10 -0000
Received: from e178102245.adsl.alicedsl.de (EHLO [192.168.4.101])
	[85.178.102.245]
	by mail.gmx.net (mp010) with SMTP; 21 Dec 2007 13:08:10 +0100
X-Authenticated: #17532834
X-Provags-ID: V01U2FsdGVkX1/04wFPERT0h1cILbEUCv9UYQSmlzVFg+91MQYdp0
	CEdgwWrrrYcGpA
Message-ID: <476BAC9A.4070102@gmx.net>
Date: Fri, 21 Dec 2007 13:07:54 +0100
From: Robert Schuster <theBohemian@gmx.net>
User-Agent: Mozilla-Thunderbird 2.0.0.6 (X11/20071009)
MIME-Version: 1.0
To: Paul Sokolovsky <pmiscml@gmail.com>, 
	openembedded-devel@lists.openembedded.org
References: <476B8D3A.7010703@gmx.net> <489984884.20071221133816@gmail.com>
In-Reply-To: <489984884.20071221133816@gmail.com>
X-Enigmail-Version: 0.95.0
X-Y-GMX-Trusted: 0
Subject: Re: java recipe policy for OE
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
X-List-Received-Date: Fri, 21 Dec 2007 12:13:24 -0000
X-Groupsio-MsgNum: 3729
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="------------enig3083B23F54CB2F2A204F0EE1"

--------------enig3083B23F54CB2F2A204F0EE1
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi Paul.

Paul Sokolovsky schrieb:
> Hello Robert,
>=20
> Friday, December 21, 2007, 11:54:02 AM, you wrote:
>=20
>> Hi,
>> the toolchain stuff has not been committed yet but I still want to sta=
rt
>> a little discussion about the future of java packages in OE.
>=20
>> a) jar location
>> The Debian java packages have the fine habit of placing all the jars
>> (this is what resembles a shared library in java land) into
>> /usr/share/java. Since Java (still) lacks an automated mechanism to lo=
ok
>> up those jars they have to be provided manually when starting an
>> application (e.g. through a shell script) and putting them into a comm=
on
>> directory saves people's nerves.
>=20
>> Making the jar location variable is easy, making applications work can=

>> be hard (patching scripts etc). I don't see much value in making this
>> configurable either.
>=20
>   What you mean by "variable"? Packages represent finished software
> bundles, are supposed to be installed in specific place, don't have
> special requirement of being relocatable, and are not supposed to be
> tweak by users besides some specially marked config files.
Yes, I was only talking about being variable/configurable at build time.

>   Another thing, you should not assume that every distro will *build*
> packages to be installed to /usr. Instead, OE offers location
> variables (based on standard GNU configure path vars) for packages to
> use. So, please don't hardcode /usr or something into your recipes.
> Default CLASSPATH is ${datadir}/java thus (worth defining datadir_java
> for that, so it was further configurable).
Yes, I am using ${datadir}/java everywhere. ${datadir_java} would be no
problem either. Should that go into bitbake.conf? And what about
staging. Is using ${STAGING_DATADIR}/java and
${STAGING_DATADIR_NATIVE}/java OK?

>=20
>   So, once again, please don't hardcode paths in *your*
> .bb's/.bbclass'es. But of course, patching 3rd party code to fully
> adhere to this is yet another "another task". But if you can check for
> this at least core components, like standard java runtime,
> that would be appreciated.
That would be possible. Is there a nice way to preprocess a patch? I
would like to run sed on it to replace the hard coded path.

>   Realistic usecase? Building NSLU2 Optware like feeds for alien
> systems (mostly vendor Leenooxes). OE is pretty bad on that now.
> Trying to build nano, I had to patch 2-3 dependent recipes just to
> have them build.
Yes, have seen the optware stuff. Would be funny to retrofit
proprietarisied ... err vendor LXes with our packages. ;)

> []
>=20
>> c) naming
>> Debian names packages containing only jars lib<PN>-java. If it has a
>> corresponding JNI library it is called lib<PN>-jni. I would like to
>> adopt this for OE. With the help of a bbclass for java library recipes=

>> this safes boilerplate. I have an early version of such a bbclass in t=
he
>> Jalimo repository for everyone to look at, criticise and enhance. :)
>=20
>   Oh, these misguided debian naming conventions! (well, depends) We
> already have inconsistency with this in OE. Python uses prefix, Perl -
> suffixes. Chose your way ;-).
Oh well. Adhering to the Debian rules makes java-gnome
libjava-gnome-java which isnt exactly what I call a nice package name.
Still for many other packages it is OK and in regard to the JNI packages
I think it makes sense to use suffixes.

Regards
Robert


--------------enig3083B23F54CB2F2A204F0EE1
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iD8DBQFHa6ydG9cfwmwwEtoRCDbpAJwKNJHFvXy/jli9wxDthF5njk1QAACfecET
lkGwtM0Twndg6wE5ADZN1SE=
=zqe/
-----END PGP SIGNATURE-----

--------------enig3083B23F54CB2F2A204F0EE1--
