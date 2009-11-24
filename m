Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1NCvRi-00039i-AO
	for openembedded-devel@lists.openembedded.org;
	Tue, 24 Nov 2009 14:28:45 +0100
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	nAODNtYQ004249 for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Nov 2009 13:23:55 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id mOaosQ8mvP5c
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Nov 2009 13:23:55 +0000 (GMT)
Received: from [192.168.1.3] (tim [93.97.173.237]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	nAODNomj004221
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Nov 2009 13:23:52 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1259011185.7271.32.camel@mattotaupa.wohnung.familie-menzel.net>
References: <1258311783.18820.149.camel@mattotaupa.wohnung.familie-menzel.net>
	<1258537305.3021.14.camel@mattotaupa.wohnung.familie-menzel.net>
	<1258586470.3071.10.camel@mattotaupa.wohnung.familie-menzel.net>
	<1258589851.5229.17.camel@dax.rpnet.com>
	<1258629037.3093.129.camel@mattotaupa.wohnung.familie-menzel.net>
	<1258631121.5229.22.camel@dax.rpnet.com>
	<1259011185.7271.32.camel@mattotaupa.wohnung.familie-menzel.net>
Date: Tue, 24 Nov 2009 13:27:15 +0000
Message-Id: <1259069235.10321.176.camel@dax.rpnet.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
X-MIME-Autoconverted: from 8bit to quoted-printable by dan.rpsys.net id
	nAODNtYQ004249
X-SA-Exim-Connect-IP: 93.97.175.187
X-SA-Exim-Mail-From: rpurdie@rpsys.net
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: bitbake base-image: gmp-native: ERROR: function	do_configure failed: configure: error: Oops, mp_limb_t is 32 bits, but the	assembler code
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
X-List-Received-Date: Tue, 24 Nov 2009 13:28:45 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Mon, 2009-11-23 at 22:19 +0100, Paul Menzel wrote:
> Am Donnerstag, den 19.11.2009, 11:45 +0000 schrieb Richard Purdie:
> > So just to be clear, you don't have any 64 bit userspace, just a 32 b=
it
> > one? Running gcc to compile something gives you a 32 bit binary, not =
a
> > 64 bit one?
>=20
> That is correct.
>=20
>         $ dpkg --print-architecture
>         i386
>=20
> > I'd try adding:
> >=20
> > BUILD_ARCH =3D "i686"
> > BUILD_OS =3D "linux"
> >=20
> > to your local.conf
>=20
> That worked perfectly. Thank you!
>=20
> I do not know how to proceed with #3470 though. Can it be closed as
> won=E2=80=99t fix and a note added to the FAQ?

I've closed the bug as fixed, detailing how to work around the problem.
Adding to the FAQ would be good too. As I mentioned in the bug,
identifying this problem case in sanity.bbclass would also be a nice
enhancement.

Cheers,

Richard



