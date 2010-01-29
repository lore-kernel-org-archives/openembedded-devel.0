Received: from exchsrvr.syntech-fuelmaster.com ([199.44.250.2]
	helo=courier.syntech-fuelmaster.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mbutsch@syntech-fuelmaster.com>) id 1Naxxp-0003wF-BA
	for openembedded-devel@lists.openembedded.org;
	Fri, 29 Jan 2010 22:01:16 +0100
Received: from Courier.syntech.org ([fe80::f1e9:ec58:2caf:f234]) by
	Courier.syntech.org ([fe80::f1e9:ec58:2caf:f234%14]) with mapi;
	Fri, 29 Jan 2010 15:58:41 -0500
From: Mark Butsch <mbutsch@syntech-fuelmaster.com>
To: "'openembedded-devel@lists.openembedded.org'"
	<openembedded-devel@lists.openembedded.org>
Date: Fri, 29 Jan 2010 15:58:39 -0500
Thread-Topic: [oe] Difficulties building java
Thread-Index: AcqgCdf/V+wxqH98SN6VADFrAhH0fgBGqpMw
Message-ID: <6C2434209962DC46B88345CA85C334A28596C7FBC4@Courier.syntech.org>
References: <6C2434209962DC46B88345CA85C334A28596C7F9D3@Courier.syntech.org>
	<1264196828.26541.14.camel@mattotaupa.wohnung.familie-menzel.net>
	<6C2434209962DC46B88345CA85C334A28596C7FB21@Courier.syntech.org>
	<20100128110438.GA18170@rhein.zuhause.netz>
In-Reply-To: <20100128110438.GA18170@rhein.zuhause.netz>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 199.44.250.2
X-SA-Exim-Mail-From: mbutsch@syntech-fuelmaster.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Difficulties building java
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
X-List-Received-Date: Fri, 29 Jan 2010 21:01:17 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

on Thursday, January 28, 2010 6:05 AM, Henning Heinold wrote:

> On Wed, Jan 27, 2010 at 04:49:13PM -0500, Mark Butsch wrote:
> > I forgot to mention that I am using "stable/2009" branch.
>
> Hm seems stable branch is not in the right shape for java stuff.
> >=20
> > I have been trying different combinations of PREFERRED_PROVIDERS and VE=
RSIONS with no success.
> >=20
> > I searched my openembedded email archive and found someone had a simila=
r error back in June of 2009,
> > But there was no solution posted.
> >=20
> > I also found a wiki article that described using the Jalimo-Overlay to =
build OpenJDK, but I haven't had any
> > Success with it either.
> > Is the Jalimo-Overlay required to build Java in OE or only in certain c=
ases?
>
> Only the openjdk recipes are left in the jalimo svn all other was merged =
into dev. So you might need
> a checkout before this merge for the stable oe branch to work.
> >=20
> > Still confused,
> >=20
> > Mark
>
> Sorry,
>
> we dont have yet the time to work on the stable branch to get java into s=
hape.
>
> Bye Henning

Well, I switched over to using the "org.openembedded.dev" branch and did a =
"git pull" to make sure it was
Up to date.

I still get the same error when building "classpath". From the log.do_confi=
gure file:
-----
configure: WARNING: I have to compile Test.class from scratch
checking for ecj... ecj -warn:-deprecation,serial,unusedImport
checking if ecj -warn:-deprecation,serial,unusedImport is a version of gcj.=
.. directory does not exist: --version
checking if ecj -warn:-deprecation,serial,unusedImport works... yes
checking if java works... configure: error: The Java compiler ecj -warn:-de=
precation,serial,unusedImport failed=20
   (see config.log, check the CLASSPATH?)
FATAL: oe_runconf failed
--------

I am using the following:

PREFERRED_PROVIDER_virtual/java-initial =3D "cacao-initial"
PREFFERED_VERSION_cacao-initial =3D "0.98"

PREFERRED_PROVIDER_virtual/java-native =3D "cacao-native"
PREFFERED_VERSION_cacao-native =3D "0.99.3"

PREFERRED_PROVIDER_virtual/javac-native =3D "ecj-bootstrap-native"
PREFFERED_VERSION_libecj-bootstrap =3D "3.4"

PREFERRED_PROVIDER_classpath =3D "classpath"
PREFFERED_VERSION_classpath-initial =3D "0.93"
PREFFERED_VERSION_classpath-native =3D "0.97.2"

PREFERRED_PROVIDER_swt3.4-gtk =3D "swt3.4-gtk"

PREFFERED_VERSION_cacao=3D "0.99.4"
PREFFERED_VERSION_classpath=3D "0.98"

Are these a good combination? I am building on an x86-64 machine for i686 t=
arget with Angstrom as my distro.

Suggestions on what to try/investigate?

Thanks in advance,

Mark


