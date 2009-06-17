Received: from [213.165.64.20] (helo=mail.gmx.net)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <theBohemian@gmx.net>) id 1MH3oc-0001JU-5s
	for openembedded-devel@lists.openembedded.org;
	Thu, 18 Jun 2009 00:41:10 +0200
Received: (qmail invoked by alias); 17 Jun 2009 22:30:39 -0000
Received: from g225130211.adsl.alicedsl.de (EHLO [192.168.4.110])
	[92.225.130.211]
	by mail.gmx.net (mp066) with SMTP; 18 Jun 2009 00:30:39 +0200
X-Authenticated: #17532834
X-Provags-ID: V01U2FsdGVkX1+jqtk7+lajyo1/5vq5OfC1y4ajl5gGuVo4/Z+cZS
	sgRTb1G5E/cO2o
Message-ID: <4A396EBD.2010207@gmx.net>
Date: Thu, 18 Jun 2009 00:31:25 +0200
From: Robert Schuster <theBohemian@gmx.net>
User-Agent: Mozilla-Thunderbird 2.0.0.19 (X11/20090103)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <9050EA3F-01E5-479A-8AF2-C6553F347FE7@mac.com>
In-Reply-To: <9050EA3F-01E5-479A-8AF2-C6553F347FE7@mac.com>
X-Enigmail-Version: 0.95.0
X-Y-GMX-Trusted: 0
X-FuHaFi: 0.51
Subject: Re: classpath_0.98 recipe failure
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
X-List-Received-Date: Wed, 17 Jun 2009 22:41:10 -0000
X-Groupsio-MsgNum: 11362
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="------------enigFA550ED224170E1326C89249"

--------------enigFA550ED224170E1326C89249
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi Elvis,
you are writing a lot of mails but really vital information is missing
from them.

First thing to know is: What version of OE are you using? Is this the
development branch (org.openembedded.dev)?

If so I am wondering why you are not seeing a recipe for jamvm-native
1.5.3. Such a recipe should be there and work just fine.

In one of the later mails you write that you missing the 'ecj-initial'
binary. Rebuild the recipe ecj-initial then (bitbake -c clean
ecj-initial && bitbake ecj-initial). If the script does not exist
afterwards something is strange at you place.

Btw: Take care if you change between cacao-native and jamvm-native. At
this time cacao does not work nicely together with classpath 0.98. So
you need to rebuilt classpath as well (when switching from jamvm+classpat=
h).

Regards
Robert

Elvis Dowson schrieb:
> Hi,
>     I'm trying to build the classpath_0.98 recipe, but it doesn't work.=

> I get a failure that is a really long list of java exceptions, to big t=
o
> reproduce here. Here are the last few lines.
>=20
> Could someone please help me resolve this error?
>=20
> checking if javac -Xlint:unchecked,cast,divzero,empty,finally,overrides=

> works... configure: error: The Java compiler javac
> -Xlint:unchecked,cast,divzero,empty,finally,overrides failed (see
> config.log, check the CLASSPATH?)
> | FATAL: oe_runconf failed
> NOTE: Task failed:
> /tool/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/classpath-0.98-r0=
/temp/log.do_configure.14142
>=20
> ERROR: TaskFailed event exception, aborting
> ERROR: Build of
> /tool/overo-oe/org.openembedded.dev/recipes/classpath/classpath_0.98.bb=

> do_configure failed
> ERROR: Task 6
> (/tool/overo-oe/org.openembedded.dev/recipes/classpath/classpath_0.98.b=
b,
> do_configure) failed
> NOTE: Tasks Summary: Attempted 1703 tasks of which 1698 didn't need to
> be rerun and 1 failed.
> ERROR:
> '/tool/overo-oe/org.openembedded.dev/recipes/classpath/classpath_0.98.b=
b'
> failed
>=20
>=20
> Best regards,
>=20
> Elvis
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>=20



--------------enigFA550ED224170E1326C89249
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iEYEAREIAAYFAko5bsAACgkQG9cfwmwwEtquNQCgiw0vfeROALEIeNw9Gt+2hILv
k3cAnAskQzz/OuFRewuOQGSIbadaVeYV
=GSOo
-----END PGP SIGNATURE-----

--------------enigFA550ED224170E1326C89249--
