Received: from thoth.sbs.de ([192.35.17.2])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Fabrice.Aeschbacher@siemens.com>) id 1QjF2T-0004yO-Qs
	for openembedded-devel@lists.openembedded.org;
	Tue, 19 Jul 2011 20:29:02 +0200
Received: from mail2.siemens.de (localhost [127.0.0.1])
	by thoth.sbs.de (8.13.6/8.13.6) with ESMTP id p6JIEGll031912
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Jul 2011 20:14:16 +0200
Received: from DEMCHP99ET0MSX.ww902.siemens.net
	(demchp99et0msx.ww902.siemens.net [139.25.131.181])
	by mail2.siemens.de (8.13.6/8.13.6) with ESMTP id p6JIEFfQ026143
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Jul 2011 20:14:16 +0200
Received: from DEMCHP99ET4MSX.ww902.siemens.net (139.25.131.174) by
	DEMCHP99ET0MSX.ww902.siemens.net (139.25.131.181) with Microsoft SMTP
	Server (TLS) id 8.3.192.1; Tue, 19 Jul 2011 20:14:15 +0200
Received: from DEMCHP99E35MSX.ww902.siemens.net ([169.254.2.162]) by
	DEMCHP99ET4MSX.ww902.siemens.net ([139.25.131.174]) with mapi;
	Tue, 19 Jul 2011 20:14:15 +0200
From: "Aeschbacher, Fabrice" <Fabrice.Aeschbacher@siemens.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Date: Tue, 19 Jul 2011 20:14:14 +0200
Thread-Topic: Added header file to linux kernel - how to export
Thread-Index: AcxGD4ih4YSdUb0mRcCpV/r1/P2CaQADDFeKAACs9iA=
Message-ID: <09D9BE2AC4AA764DABAA8C91E48D819E0157569991@DEMCHP99E35MSX.ww902.siemens.net>
References: <ED3E0BCACD909541BA94A34C4A164D4C06CA55@post.tritech.se>
	<ED3E0BCACD909541BA94A34C4A164D4C06CA7F@post.tritech.se>
In-Reply-To: <ED3E0BCACD909541BA94A34C4A164D4C06CA7F@post.tritech.se>
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
X-List-Received-Date: Tue, 19 Jul 2011 18:29:02 -0000
Content-Language: de-DE
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi,

Your could put something like this:

do_stage_append() {
	cp ${S}/my_ioctl.h ${STAGING_KERNEL_DIR}/include/linux
}

in your recipes/linux<xxx>.bb

With kind regards,
   Fabrice

> -----Urspr=FCngliche Nachricht-----
> Von: openembedded-devel-bounces@lists.openembedded.org=20
> [mailto:openembedded-devel-bounces@lists.openembedded.org] Im=20
> Auftrag von Mats K=E4rrman
> Gesendet: Dienstag, 19. Juli 2011 15:57
> An: openembedded-devel@lists.openembedded.org
> Betreff: [oe] Added header file to linux kernel - how to export
>=20
> Hi,
>=20
> I have made a patch to the linux kernel, involving adding=20
> some ioctl's. Relevant definitions are in a .h file. Now I=20
> need to access this .h file from another recipe (that builds=20
> a utility using those ioctl's) but the headers in=20
> sysroots/xxx-linux/usr/include are put there (by=20
> linux-libc-headers?) long before the target Linux kernel is=20
> patched and built.
>=20
> I'm thinking about adding a do_install_append to the linux=20
> recipe but that doesn't feel right. Neither does adding a=20
> path from the util recipe build to the work folder of linux=20
> kernel. Third alternative would be to build the driver as an=20
> LKM but I really like to have it built into the kernel...
>=20
> If any of you have some good advice here I would be very happy!
>=20
> Best Regards,
> Mats
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> =


