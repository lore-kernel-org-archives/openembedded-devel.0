Received: from gate.tarent.de ([212.79.178.249] helo=ugs.tarent.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <thebohemian@gmx.net>) id 1NNl0k-0006sP-3K
	for openembedded-devel@lists.openembedded.org;
	Thu, 24 Dec 2009 11:33:41 +0100
Received: from localhost (localhost [127.0.0.1])
	by ugs.tarent.de (Postfix) with ESMTP id 5B009400083CC
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Dec 2009 11:31:44 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by ugs.tarent.de (Postfix) with ESMTP id 2B51D400083FC
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Dec 2009 11:31:44 +0100 (CET)
X-Virus-Scanned: by amavisd-new-2.4.2 (20060627) (Debian) at tarent.de
Received: from ugs.tarent.de ([127.0.0.1])
	by localhost (ugs.tarent.de [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SrOBwW6KCc8V
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Dec 2009 11:31:43 +0100 (CET)
Received: from [192.168.4.51] (entw2.tarent.buero [192.168.4.51])
	by ugs.tarent.de (Postfix) with ESMTP id A6CFA400083CC
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Dec 2009 11:31:43 +0100 (CET)
Message-ID: <4B334316.6020006@gmx.net>
Date: Thu, 24 Dec 2009 11:31:50 +0100
From: Robert Schuster <thebohemian@gmx.net>
User-Agent: Thunderbird 2.0.0.23 (X11/20090817)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <200912071959.19252.marcin@juszkiewicz.com.pl>
In-Reply-To: <200912071959.19252.marcin@juszkiewicz.com.pl>
X-Enigmail-Version: 0.95.7
X-SA-Exim-Connect-IP: 212.79.178.249
X-SA-Exim-Mail-From: thebohemian@gmx.net
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Java handling in OpenEmbedded
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
X-List-Received-Date: Thu, 24 Dec 2009 10:33:41 -0000
X-Groupsio-MsgNum: 15220
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="------------enig925946B1B7DB4E3985248A2F"

--------------enig925946B1B7DB4E3985248A2F
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi Marcin,
I am all fine with this change. However shouldn't the Jars end up in
something
like all-angstrom-foobar/usr/share/java then?

The second problem is native staging. In case 'inherit native' is active
STAGING_DIR_JAVA
needs to be changed to point into something like x86_64/usr/share/java.
Its a one
line change I am committing to org.oe.dev. It should be applied to the
stable branch as well:

http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=3Da0bed236d=
b2e2bc4beace697809eab8db9e51e01

Regards,
Robert

Marcin Juszkiewicz schrieb:
> Hi
>
> For most of time I do builds of BugLabs software for just one device: B=
UG=20
> which uses i.mx31 cpu (armv6). As I need to test it also on BeagleBoard=
 I got=20
> hit by one problem when it comes to building Java software...
>
> As Java is target independent we package it as "all". But the problem i=
s when=20
> build want to get JAR files built from other recipes (think dependencie=
s). By=20
> default all those jars are staged into target staging (armv6-angstrom-l=
inux-
> gnueabi in this case). It works fine as long as you do not want to buil=
d for=20
> other architecture in same tmpdir.
>
> After MACHINE change OE thinks (correctly) that it does not need to bui=
ld Java=20
> things again (as it was PACKAGE_ARCH=3D"all") and tries to use it from =
staging.=20
> But staging/usr/share/java/ dir is empty...
>
> OK, someone can say "but what is a deal? it got built before so you can=
 just=20
> install packages - they are 'all' anyway". Sure, but some of our Java r=
ecipes=20
> are bind to BUG kernel services so can not be built for other devices a=
nd we=20
> do not want to be forced to keep MACHINE values in specific order to 'm=
aybe=20
> this will work' way of building.
>
> What is a solution? I had few ideas during weekend and tested two of th=
em.
>
> 1. Drop PACKAGE_ARCH=3D"all" for ALL Java recipes. It works but adds ex=
tra
>    building time.
>
> 2. Change staging of JAR files. This worked fine for my build. Patch to=

>    stable/2009 branch attached.
>
> Please test and reply what do you think about it. I did tests with BugL=
abs=20
> meta-bug/ overlay [1] (concierge and some of bug-osgi are good test tar=
gets).
>
> 1. svn://svn.buglabs.net/bug/trunk/com.buglabs.build.oe/meta-bug/
>
> Regards,=20
>  =20
> -----------------------------------------------------------------------=
-
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel



--------------enig925946B1B7DB4E3985248A2F
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iEYEARECAAYFAkszQxcACgkQG9cfwmwwEtoS3QCfSl8xwcLwyPHLsTBkDp51T4pC
9j4An1stVPsBZTIH+iP/JhHnHD9oA/t9
=WYbY
-----END PGP SIGNATURE-----

--------------enig925946B1B7DB4E3985248A2F--
