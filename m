Received: from david.siemens.de ([192.35.17.14])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Fabrice.Aeschbacher@siemens.com>) id 1QjX4z-0001rT-Bj
	for openembedded-devel@lists.openembedded.org;
	Wed, 20 Jul 2011 15:44:49 +0200
Received: from mail3.siemens.de (localhost [127.0.0.1])
	by david.siemens.de (8.13.6/8.13.6) with ESMTP id p6KDSisF001369
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Jul 2011 15:28:44 +0200
Received: from DEMCHP99ET0MSX.ww902.siemens.net
	(demchp99et0msx.ww902.siemens.net [139.25.131.181])
	by mail3.siemens.de (8.13.6/8.13.6) with ESMTP id p6KDShlb028466
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Jul 2011 15:28:44 +0200
Received: from DEMCHP99E35MSX.ww902.siemens.net ([169.254.2.162]) by
	DEMCHP99ET0MSX.ww902.siemens.net ([139.25.131.181]) with mapi;
	Wed, 20 Jul 2011 15:28:43 +0200
From: "Aeschbacher, Fabrice" <Fabrice.Aeschbacher@siemens.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Date: Wed, 20 Jul 2011 15:28:42 +0200
Thread-Topic: [oe] Added header file to linux kernel - how to export
Thread-Index: AcxGD4ih4YSdUb0mRcCpV/r1/P2CaQADDFeKAACs9iAAIzpLAAAMqOUPAACMLCA=
Message-ID: <09D9BE2AC4AA764DABAA8C91E48D819E0157569AF9@DEMCHP99E35MSX.ww902.siemens.net>
References: <ED3E0BCACD909541BA94A34C4A164D4C06CA55@post.tritech.se>
	<ED3E0BCACD909541BA94A34C4A164D4C06CA7F@post.tritech.se>
	<09D9BE2AC4AA764DABAA8C91E48D819E0157569991@DEMCHP99E35MSX.ww902.siemens.net>,
	<20110720090459.GA3173@mi.fu-berlin.de>
	<ED3E0BCACD909541BA94A34C4A164D4C06CB64@post.tritech.se>
In-Reply-To: <ED3E0BCACD909541BA94A34C4A164D4C06CB64@post.tritech.se>
Accept-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: de-DE
MIME-Version: 1.0
Subject: Re: Added header file to linux kernel - how to export
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
X-List-Received-Date: Wed, 20 Jul 2011 13:44:49 -0000
Content-Language: de-DE
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Mats,

Installing myfile.h during do_install() certainly works for you right now.

But it won't if you plan to use packaged-staging in the future. Hence my ad=
vice to do this rather during do_stage()

With kind regards,
   Fabrice

> -----Urspr=FCngliche Nachricht-----
> Von: openembedded-devel-bounces@lists.openembedded.org=20
> [mailto:openembedded-devel-bounces@lists.openembedded.org] Im=20
> Auftrag von Mats K=E4rrman
> Gesendet: Mittwoch, 20. Juli 2011 15:14
> An: openembedded-devel@lists.openembedded.org
> Betreff: Re: [oe] Added header file to linux kernel - how to export
>=20
> @ Fabrice & Henning:
>=20
> Thank you both for your support! I ended up with:
>=20
> ## Export patched in header files for access by other recipes
> do_install_append_mymachine() {
>         cp ${S}/arch/powerpc/include/asm/myfile.h=20
> ${STAGING_DIR_TARGET}${includedir}/asm/
> }
>=20
> Works fine but I'm a bit confused about the number of=20
> "STAGING_" definitions in the environment. It's not always=20
> easy to pick the right one, e.g. STAGING_DIR_TARGET and=20
> STAGING_DIR_HOST both points to the same location...
>=20
> Best Regards,
> Mats
>=20
> ________________________________________
> From: openembedded-devel-bounces@lists.openembedded.org=20
> [openembedded-devel-bounces@lists.openembedded.org] on behalf=20
> of Henning Heinold [heinold@inf.fu-berlin.de]
> Sent: Wednesday, July 20, 2011 11:05 AM
> To: openembedded-devel@lists.openembedded.org
> Subject: Re: [oe] Added header file to linux kernel - how to export
>=20
> On Tue, Jul 19, 2011 at 08:14:14PM +0200, Aeschbacher, Fabrice wrote:
> > Hi,
> >
> > Your could put something like this:
> >
> > do_stage_append() {
> >       cp ${S}/my_ioctl.h ${STAGING_KERNEL_DIR}/include/linux
> > }
> >
> > in your recipes/linux<xxx>.bb
> >
> > With kind regards,
> >    Fabrice
>=20
> Hi,
>=20
> do_stage shouldn't be used anymore. Do it via do_install method.
>=20
>=20
> Bye Henning
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> =


