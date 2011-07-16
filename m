Received: from thoth.sbs.de ([192.35.17.2])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Fabrice.Aeschbacher@siemens.com>) id 1Qi2uX-0006dd-Tw
	for openembedded-devel@lists.openembedded.org;
	Sat, 16 Jul 2011 13:19:54 +0200
Received: from mail2.siemens.de (localhost [127.0.0.1])
	by thoth.sbs.de (8.13.6/8.13.6) with ESMTP id p6GBFpqw003074;
	Sat, 16 Jul 2011 13:15:53 +0200
Received: from DEMCHP99ET1MSX.ww902.siemens.net
	(demchp99et1msx.ww902.siemens.net [139.25.131.180])
	by mail2.siemens.de (8.13.6/8.13.6) with ESMTP id p6GBFnoL031828
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=FAIL);
	Sat, 16 Jul 2011 13:15:50 +0200
Received: from DEMCHP99E35MSX.ww902.siemens.net ([169.254.2.162]) by
	DEMCHP99ET1MSX.ww902.siemens.net ([139.25.131.180]) with mapi;
	Sat, 16 Jul 2011 13:15:49 +0200
From: "Aeschbacher, Fabrice" <Fabrice.Aeschbacher@siemens.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Date: Sat, 16 Jul 2011 13:15:46 +0200
Thread-Topic: [oe] PSTAGE_MIRROR not working with file:// uri
Thread-Index: AcxDKnj0st4jYErMQY6a+KG9JkQZMQAfc4pg
Message-ID: <09D9BE2AC4AA764DABAA8C91E48D819E015756958F@DEMCHP99E35MSX.ww902.siemens.net>
References: <09D9BE2AC4AA764DABAA8C91E48D819E0157569474@DEMCHP99E35MSX.ww902.siemens.net>
	<4E209D45.9000802@mentor.com>
In-Reply-To: <4E209D45.9000802@mentor.com>
Accept-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: de-DE
MIME-Version: 1.0
Subject: Re: PSTAGE_MIRROR not working with file:// uri
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
X-List-Received-Date: Sat, 16 Jul 2011 11:19:54 -0000
Content-Language: de-DE
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi Tom,

Thanks, it helped. The key in your code was to return bb.fetch.localpath() =
- which was not the case in the version we used (release-2010.12)

Anyone interessed in the patch? As far as I can see, this has not been fixe=
d yet in openembedded HEAD.

With kind regards,
Fabrice Aeschbacher


> -----Urspr=FCngliche Nachricht-----
> Von: openembedded-devel-bounces@lists.openembedded.org=20
> [mailto:openembedded-devel-bounces@lists.openembedded.org] Im=20
> Auftrag von Tom Rini
> Gesendet: Freitag, 15. Juli 2011 22:04
> An: openembedded-devel@lists.openembedded.org
> Betreff: Re: [oe] PSTAGE_MIRROR not working with file:// uri
>=20
> On 07/15/2011 01:48 AM, Aeschbacher, Fabrice wrote:
> > Hi,
> >=20
> > [bitbake 1.12 / OE 2010.12]
> >=20
> > I am facing a quite strange issue with packaged-staging=20
> (INHERIT +=3D "packaged-staging" in local.conf) when trying to=20
> use a pre-built toolchain.
> [snip]
> > I guess this must already have worked, mainly because of=20
> this comment in the .bbclass:
> >=20
> >   # To use the prebuilt pstage packages, save them away..
> >   # $ rsync --delete -a tmp/pstage/ /there/oe/build/pstage_mirror
> >   # .. and use it as mirror in your conf/local.conf:
> >   # PSTAGE_MIRROR =3D "file:///there/oe/build/pstage_mirror"
> >=20
> > So I wondered if someone can confirm that PSTAGE_MIRROR has=20
> already worked with a file:/// uri,
> > and could see what I am missing here.
>=20
> Internally we have code like http://pastebin.com/cb1Nen97 and=20
> file URIs
> work.  Try merging the two and see if that fixes things?
>=20
> --=20
> Tom Rini
> Mentor Graphics Corporation
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> =


