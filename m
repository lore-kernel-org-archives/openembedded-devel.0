Received: from einhorn.in-berlin.de ([192.109.42.8] ident=root)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sledz@dresearch.de>) id 1PwWBm-00027Y-C3
	for openembedded-devel@lists.openembedded.org;
	Mon, 07 Mar 2011 09:53:14 +0100
X-Envelope-From: sledz@dresearch.de
Received: from mobil-400-586.intern.dresearch.de
	(p57A20496.dip0.t-ipconnect.de [87.162.4.150]) (authenticated bits=0)
	by einhorn.in-berlin.de (8.13.6/8.13.6/Debian-1) with ESMTP id
	p278phUL011475
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT);
	Mon, 7 Mar 2011 09:51:43 +0100
Received: from mobil-400-586.intern.dresearch.de (localhost [IPv6:::1])
	by mobil-400-586.intern.dresearch.de (Postfix) with ESMTP id 9A84225FDD;
	Mon,  7 Mar 2011 09:51:41 +0100 (CET)
Message-ID: <4D749C9D.3020600@dresearch.de>
Date: Mon, 07 Mar 2011 09:51:41 +0100
From: Steffen Sledz <sledz@dresearch.de>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.1.16) Gecko/20101125 SUSE/3.0.11 Lightning/1.0b1
	Thunderbird/3.0.11
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4D6D0340.9090109@dresearch.de>
In-Reply-To: <4D6D0340.9090109@dresearch.de>
X-Scanned-By: MIMEDefang_at_IN-Berlin_e.V. on 192.109.42.8
X-MIME-Autoconverted: from 8bit to quoted-printable by einhorn.in-berlin.de id
	p278phUL011475
Cc: Michael Lauer <mickey@vanille-media.de>
Subject: Re: Release-2011.03 gupnp-0.13.4-r0: task do_compile: Failed
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
X-List-Received-Date: Mon, 07 Mar 2011 08:53:14 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 03/01/2011 03:31 PM, Steffen Sledz wrote:
> Clean build: bitbake gupnp
>=20
> | make[3]: Entering directory `/SCRATCH/SSZ/HydraIP/OE/tmp.6/work/armv5=
te-angstrom-linux-gnueabi/gupnp-0.13.4-r0/gupnp-0.13.4/libgupnp'
> |   CC     http-headers.lo
> |   CC     gupnp-context-manager.lo
> |   CC     gupnp-unix-context-manager.lo
> |   CC     gupnp-context.lo
> |   CC     gupnp-control-point.lo
> |   CC     gupnp-device.lo
> |   CC     gupnp-device-info.lo
> |   CC     gupnp-device-proxy.lo
> |   CC     gupnp-error.lo
> |   CC     gupnp-resource-factory.lo
> |   CC     gupnp-root-device.lo
> |   CC     gupnp-service.lo
> |   CC     gupnp-service-info.lo
> |   CC     gupnp-service-proxy.lo
> |   CC     gupnp-service-introspection.lo
> |   CC     gupnp-xml-doc.lo
> |   CC     gupnp-types.lo
> |   CC     gvalue-util.lo
> |   CC     xml-util.lo
> |   CC     gupnp-marshal.lo
> |   CCLD   libgupnp-1.0.la
> |   GEN    GUPnP-1.0.gir
> | Couldn't find include 'Soup-2.4.gir' (search path: ['/SCRATCH/SSZ/Hyd=
raIP/OE/tmp.6/sysroots/armv5te-angstrom-linux-gnueabi/usr/share/gir-1.0',=
 '/SCRATCH/SSZ/HydraIP/OE/tmp.6/sysroots/x86_64-linux/usr/share/gir-1.0',=
 '/usr/share/gir-1.0', '/SCRATCH/SSZ/HydraIP/OE/tmp.6/sysroots/x86_64-lin=
ux/usr/share/gir-1.0'])
> | make[3]: *** [GUPnP-1.0.gir] Error 1
>=20
> Build Configuration:
> BB_VERSION        =3D "1.10.2"
> METADATA_BRANCH   =3D "testing-release-2011.03"
> METADATA_REVISION =3D "62bf073"
> TARGET_ARCH       =3D "arm"
> TARGET_OS         =3D "linux-gnueabi"
> MACHINE           =3D "hipox"
> DISTRO            =3D "angstrom"
> DISTRO_VERSION    =3D "2010.7-test-20110301"
> TARGET_FPU        =3D "soft"

It seems that the compile stage of gupnp uses gobject-introspection from =
the host system. :(

The mentioned error occurs, if this is not installed there. If i install =
the package (called gir-repository at openSUSE 11.3), there error changes=
 to

|   GEN    GUPnP-1.0.gir
| /usr/share/gir-1.0/Soup-2.4.gir: Incompatible version 1.0 (supported: 1=
.2)

In general i think it's not a good idea to depend on a gir aka gobject-in=
trospection installation at the build host but use a gir-native oe packag=
e. Is such a package available yet?

Steffen

--=20
DResearch Fahrzeugelektronik GmbH
Otto-Schmirgal-Str. 3, 10319 Berlin, Germany
Tel: +49 30 515932-237 mailto:sledz@DResearch.de
Fax: +49 30 515932-299
Gesch=C3=A4ftsf=C3=BChrer: Dr. Michael Weber, Werner M=C3=B6gle;
Amtsgericht Berlin Charlottenburg; HRB 130120 B;
Ust.-IDNr. DE273952058


