Received: from proxy.dresearch.de ([87.193.137.100] helo=mail.dresearch.de)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sledz@dresearch.de>) id 1PwXzP-0001gy-II
	for openembedded-devel@lists.openembedded.org;
	Mon, 07 Mar 2011 11:48:35 +0100
Received: from exchange.intern.dresearch.de (owa.xfer-intern.dresearch.de
	[192.168.32.16])
	by mail.dresearch.de (Postfix) with ESMTP id 025FD491284;
	Mon,  7 Mar 2011 11:47:03 +0100 (CET)
Received: from [127.0.0.1] ([10.32.10.2]) by exchange.intern.dresearch.de with
	Microsoft SMTPSVC(6.0.3790.4675); Mon, 7 Mar 2011 11:47:03 +0100
Message-ID: <4D74B7A6.6070702@dresearch.de>
Date: Mon, 07 Mar 2011 11:47:02 +0100
From: Steffen Sledz <sledz@dresearch.de>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; de;
	rv:1.9.2.15) Gecko/20110303 Lightning/1.0b2 Thunderbird/3.1.9
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4D6D0340.9090109@dresearch.de> <4D749C9D.3020600@dresearch.de>
In-Reply-To: <4D749C9D.3020600@dresearch.de>
X-OriginalArrivalTime: 07 Mar 2011 10:47:03.0077 (UTC)
	FILETIME=[FE69ED50:01CBDCB4]
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
X-List-Received-Date: Mon, 07 Mar 2011 10:48:36 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Am 07.03.2011 09:51, schrieb Steffen Sledz:
> On 03/01/2011 03:31 PM, Steffen Sledz wrote:
>> Clean build: bitbake gupnp
>>
>> | make[3]: Entering directory `/SCRATCH/SSZ/HydraIP/OE/tmp.6/work/armv=
5te-angstrom-linux-gnueabi/gupnp-0.13.4-r0/gupnp-0.13.4/libgupnp'
>> |   CC     http-headers.lo
>> |   CC     gupnp-context-manager.lo
>> |   CC     gupnp-unix-context-manager.lo
>> |   CC     gupnp-context.lo
>> |   CC     gupnp-control-point.lo
>> |   CC     gupnp-device.lo
>> |   CC     gupnp-device-info.lo
>> |   CC     gupnp-device-proxy.lo
>> |   CC     gupnp-error.lo
>> |   CC     gupnp-resource-factory.lo
>> |   CC     gupnp-root-device.lo
>> |   CC     gupnp-service.lo
>> |   CC     gupnp-service-info.lo
>> |   CC     gupnp-service-proxy.lo
>> |   CC     gupnp-service-introspection.lo
>> |   CC     gupnp-xml-doc.lo
>> |   CC     gupnp-types.lo
>> |   CC     gvalue-util.lo
>> |   CC     xml-util.lo
>> |   CC     gupnp-marshal.lo
>> |   CCLD   libgupnp-1.0.la
>> |   GEN    GUPnP-1.0.gir
>> | Couldn't find include 'Soup-2.4.gir' (search path: ['/SCRATCH/SSZ/Hy=
draIP/OE/tmp.6/sysroots/armv5te-angstrom-linux-gnueabi/usr/share/gir-1.0'=
, '/SCRATCH/SSZ/HydraIP/OE/tmp.6/sysroots/x86_64-linux/usr/share/gir-1.0'=
, '/usr/share/gir-1.0', '/SCRATCH/SSZ/HydraIP/OE/tmp.6/sysroots/x86_64-li=
nux/usr/share/gir-1.0'])
>> | make[3]: *** [GUPnP-1.0.gir] Error 1
>>
>> Build Configuration:
>> BB_VERSION        =3D "1.10.2"
>> METADATA_BRANCH   =3D "testing-release-2011.03"
>> METADATA_REVISION =3D "62bf073"
>> TARGET_ARCH       =3D "arm"
>> TARGET_OS         =3D "linux-gnueabi"
>> MACHINE           =3D "hipox"
>> DISTRO            =3D "angstrom"
>> DISTRO_VERSION    =3D "2010.7-test-20110301"
>> TARGET_FPU        =3D "soft"
>=20
> It seems that the compile stage of gupnp uses gobject-introspection fro=
m the host system. :(
>=20
> The mentioned error occurs, if this is not installed there. If i instal=
l the package (called gir-repository at openSUSE 11.3), there error chang=
es to
>=20
> |   GEN    GUPnP-1.0.gir
> | /usr/share/gir-1.0/Soup-2.4.gir: Incompatible version 1.0 (supported:=
 1.2)
>=20
> In general i think it's not a good idea to depend on a gir aka gobject-=
introspection installation at the build host but use a gir-native oe pack=
age. Is such a package available yet?

BTW: Is there someone maintaining the (g)upnp recipes?

--=20
DResearch Fahrzeugelektronik GmbH
Otto-Schmirgal-Str. 3, 10319 Berlin, Germany
Tel: +49 30 515932-237 mailto:sledz@DResearch.de
Fax: +49 30 515932-299
Gesch=C3=A4ftsf=C3=BChrer: Dr. Michael Weber, Werner M=C3=B6gle;
Amtsgericht Berlin Charlottenburg; HRB 130120 B;
Ust.-IDNr. DE273952058



