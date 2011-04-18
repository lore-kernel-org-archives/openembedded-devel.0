Received: from dub0-omc1-s31.dub0.hotmail.com ([157.55.0.230])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <l.bolognini@hotmail.it>) id 1QBpwg-00083H-1W
	for openembedded-devel@lists.openembedded.org;
	Mon, 18 Apr 2011 17:00:58 +0200
Received: from DUB107-W12 ([157.55.0.237]) by dub0-omc1-s31.dub0.hotmail.com
	with Microsoft SMTPSVC(6.0.3790.4675); 
	Mon, 18 Apr 2011 07:57:24 -0700
Message-ID: <DUB107-w12A7956EF90A1529568C7A98910@phx.gbl>
X-Originating-IP: [78.6.111.196]
From: Luca Bolognini <l.bolognini@hotmail.it>
To: Openembedded Mailing List <openembedded-devel@lists.openembedded.org>
Date: Mon, 18 Apr 2011 16:57:24 +0200
Importance: Normal
In-Reply-To: <4DAAF293.7080705@mlbassoc.com>
References: <DUB107-w168531FE95ECFF71F7C03098AE0@phx.gbl>,
	<4DAAF293.7080705@mlbassoc.com>
MIME-Version: 1.0
X-OriginalArrivalTime: 18 Apr 2011 14:57:24.0215 (UTC)
	FILETIME=[ED0F3070:01CBFDD8]
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: an ipk package depending on its corresponding -dev
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
X-List-Received-Date: Mon, 18 Apr 2011 15:00:58 -0000
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable


Thank you=2C but my libgles-omap3-dev_4.03.00.01-r11.6_armv7a.ipk includes =
only /usr/include/* files=2C as written in the recipe: FILES_${PN}-dev =3D =
"${includedir}"
Moreover it doesn't happen when MACHINE=3Dc6a816x-evm... however I don't th=
ink MACHINE=3Dbeagleboard is involved...

-------------------------Luca Bologninil.bolognini@hotmail.it




> Date: Sun=2C 17 Apr 2011 08:00:51 -0600
> From: gary@mlbassoc.com
> To: openembedded-devel@lists.openembedded.org
> CC: l.bolognini@hotmail.it
> Subject: Re: [oe] an ipk package depending on its corresponding -dev
>=20
> On 04/17/2011 07:43 AM=2C Luca Bolognini wrote:
> >
> > A strange thing happended to me last time I created libgles-omap3 ipk p=
ackages.I had justed patched /usr/bin/cputype (a file contained in one of t=
he SRC_URIs) and libgles-omap3.inc to add some INSANE_SKIPs =2C then I gave=
 the commands:MACHINE=3Dbeagleboard bitbake -v -c clean libgles-omap3MACHIN=
E=3Dbeagleboard bitbake -v libgles-omap3
> > At least=2C it happened that I had the dependency:libgles_omap3 ->  lib=
gles_omap3_dev
> > It's quite strange and it's the first time I see a package depending on=
 its corresponding -dev.Obviously this dependency is false=2C there can't b=
e any dependency between these two packages.The same action=2C with MACHINE=
=3Dc6a816x-evm (in a different development machine) doesn't lead to this be=
haviour.However I don't think that MACHINE=3Dbeagleboard is involved=2C pro=
bably I corrupted something in the 1st development machine=2C I don't know.=
Have you any idea how to remove this ugly (and useless) dependency? How cou=
ld it originate?
>=20
> I've seen this happen when something in the package depends on a
> library named *.so=2C instead of a more qualified library such as *.so.1
> The *.so files are only packaged in the -dev subpackages by default.
>=20
> An easy workaround (which might not be perfectly correct) is to just
> list the .so files in the main package=2C e.g.
>    FILES_${PN} +=3D "/usr/lib/lib*.so"
>=20
> --=20
> ------------------------------------------------------------
> Gary Thomas                 |  Consulting for the
> MLB Associates              |    Embedded world
> ------------------------------------------------------------
 		 	   		  =

