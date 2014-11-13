Return-Path: <alejandro.delcastillo@ni.com>
Received: from ni.com (skprod2.natinst.com [130.164.80.23])
	by mail.openembedded.org (Postfix) with ESMTP id 4C22C60167
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Nov 2014 20:10:22 +0000 (UTC)
Received: from us-aus-mgwout2.amer.corp.natinst.com (nb-snip2-1338.natinst.com
	[130.164.19.135])
	by us-aus-skprod2.natinst.com (8.14.5/8.14.5) with ESMTP id
	sADK9lfY025068; Thu, 13 Nov 2014 14:10:15 -0600
Received: from us-aus-mail3.amer.corp.natinst.com ([130.164.14.198])
	by us-aus-mgwout2.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6)
	with ESMTP id 2014111314101240-1052764 ;
	Thu, 13 Nov 2014 14:10:12 -0600 
In-Reply-To: <20141113013933.6820d2d9@e6520eb.localdomain>
References: <OF81A9A14C.EC58A864-ON86257D8E.00636115-86257D8E.0064525F@ni.com>
	<20141113013933.6820d2d9@e6520eb.localdomain>
To: =?ISO-8859-1?Q?Eric_B=E9nard?= <eric@eukrea.com>
MIME-Version: 1.0
X-KeepSent: 69DC7AA2:57980DB5-86257D8F:006E27D9;
	type=4; flags=0; name=$KeepSent
X-Mailer: Lotus Notes Release 8.5.3FP3 Septem 15, 2011
From: Alejandro del Castillo <alejandro.delcastillo@ni.com>
Message-ID: <OF69DC7AA2.57980DB5-ON86257D8F.006E27D9-86257D8F.006ECC75@ni.com>
Date: Thu, 13 Nov 2014 14:10:12 -0600
X-MIMETrack: Serialize by Router on US-AUS-MAIL3/AUS/M/NIC(Release
	8.5.3FP6|November 21, 2013) at 11/13/2014 02:10:12 PM,
	Serialize complete at 11/13/2014 02:10:12 PM,
	Itemize by SMTP Server on US-AUS-MGWOut2/AUS/H/NIC(Release
	8.5.3FP6|November 21, 2013) at 11/13/2014 02:10:12 PM,
	Serialize by Router on US-AUS-MGWOut2/AUS/H/NIC(Release
	8.5.3FP6|November 21, 2013) at 11/13/2014 02:10:17 PM,
	Serialize complete at 11/13/2014 02:10:17 PM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:5.13.68, 1.0.28,
	0.0.0000
	definitions=2014-11-13_08:2014-11-13, 2014-11-13,
	1970-01-01 signatures=0
Cc: openembedded-devel@lists.openembedded.org,
	openembedded-core@lists.openembedded.org
Subject: Re: Opkg files at /var/lib/opkg/lists
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 13 Nov 2014 20:10:35 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="ISO-8859-1"

I think you got it, the commit d950ef40a3eae4b54cc62828e66d84a62d78c447=20
removed:

        rm -f ${IMAGE=5FROOTFS}${OPKGLIBDIR}/opkg/lists/*

step that I didn't see implemented on rootfs.py. I'll file a bug report=20
(not too familiar with rootfs.py to try to fix it myself).

cheers,

-Alejandro




From:   Eric B=E9nard <eric@eukrea.com>
To:     Alejandro del Castillo <alejandro.delcastillo@ni.com>,=20
Cc:     openembedded-devel@lists.openembedded.org,=20
openembedded-core@lists.openembedded.org
Date:   11/12/2014 06:39 PM
Subject:        Re: [oe] Opkg files at /var/lib/opkg/lists



Hi Aljandro,

copying oe-core's ML as the problem seems related to oe-core and
not to meta-oe.

Le Wed, 12 Nov 2014 12:15:46 -0600,
Alejandro del Castillo <alejandro.delcastillo@ni.com> a =E9crit :

> Hello,
>=20
> I noticed that the OE build process is leaving files at=20
> /var/lib/opkg/lists (~1.5 MB on my system), which I believe are the feed 


> content used to build the image. The target opkg.conf file configure=20
> lists=5Fdir to be at /var/lib/opkg (instead of the default=20
> /var/lib/opkg/lists), so the feed content under /var/lib/opkg/lists is=20
not=20
> used at all.=20
>=20
> Does anyone know if there Is a reason why the files are left over or is=20
> this a bug? Shouldn't the image creation process remove the whole=20
> directory if it's not going to be used?=20
>=20
> BTW, Dylan doesn't have this problem, but Daisy and Dizzy do (not sure=20
> about Dora).
>=20
I was on a similar subject today and this seems broken since :
d950ef40a3eae4b54cc62828e66d84a62d78c447

BTW it seems that FEED=5FDEPLOYDIR=5FBASE=5FURI was replaced by
PACKAGE=5FFEED=5FURIS in 9b8811045546ad67b4695d980f09636d5506e50c but the
document is still pointing to the previous one :
http://www.yoctoproject.org/docs/current/mega-manual/mega-manual.html#runti=
me-package-management-target-ipk

If the replacement was not intended then there is a problem as
FEED=5FDEPLOYDIR=5FBASE=5FURI doesn't seems to work anymore (tested with
dizzy and package=5Fipk).

Best regards
Eric



