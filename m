Received: from comal.ext.ti.com ([198.47.26.152])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <chase.maupin@ti.com>) id 1STzYP-0004SZ-VY
	for openembedded-devel@lists.openembedded.org;
	Mon, 14 May 2012 19:59:30 +0200
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id q4EHnQRA016097;
	Mon, 14 May 2012 12:49:26 -0500
Received: from DLEE74.ent.ti.com (dlee74.ent.ti.com [157.170.170.8])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q4EHnQ7T022857;
	Mon, 14 May 2012 12:49:26 -0500
Received: from DLEE12.ent.ti.com ([fe80::3867:617:aab3:5956]) by
	DLEE74.ent.ti.com ([fe80::a0f1:125b:e7e3:7ed8%18]) with mapi id
	14.01.0323.003; Mon, 14 May 2012 12:49:26 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "Flanagan, Elizabeth" <elizabeth.flanagan@intel.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] [PATCH 12/69] atk: Update LICENSE field version
Thread-Index: AQHNMfc7oxgk/96+BkO5ZDj1NmDeoJbJjVKw
Date: Mon, 14 May 2012 17:49:26 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED10138E31694@DLEE12.ent.ti.com>
References: <1337011834-24879-1-git-send-email-Chase.Maupin@ti.com>
	<1337011834-24879-13-git-send-email-Chase.Maupin@ti.com>
	<CAPhnLPDYGfet15Wek+2yRpiJK1+FwLi5+HyZv63khU5v9WCrcw@mail.gmail.com>
In-Reply-To: <CAPhnLPDYGfet15Wek+2yRpiJK1+FwLi5+HyZv63khU5v9WCrcw@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: Re: [PATCH 12/69] atk: Update LICENSE field version
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
X-List-Received-Date: Mon, 14 May 2012 17:59:30 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: Flanagan, Elizabeth [mailto:elizabeth.flanagan@intel.com]
> Sent: Monday, May 14, 2012 12:30 PM
> To: openembedded-devel@lists.openembedded.org
> Cc: Maupin, Chase
> Subject: Re: [oe] [PATCH 12/69] atk: Update LICENSE field version
>=20
> On Mon, May 14, 2012 at 9:09 AM, Chase Maupin
> <Chase.Maupin@ti.com> wrote:
> > * Update LICENSE field version from generic LGPL to GPLv2+ and
> > =A0LGPLv2+ to reflect the real license version.
> > * This change was based on setting in oe-core as well as code
> > =A0inspection.
> >
> > Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
> > ---
> > =A0recipes/atk/atk_1.30.0.bb | =A0 =A04 ++--
> > =A01 files changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/recipes/atk/atk_1.30.0.bb
> b/recipes/atk/atk_1.30.0.bb
> > index b3505bf..23c6685 100644
> > --- a/recipes/atk/atk_1.30.0.bb
> > +++ b/recipes/atk/atk_1.30.0.bb
> > @@ -1,9 +1,9 @@
> > =A0DESCRIPTION =3D "An accessibility toolkit for GNOME."
> > =A0SECTION =3D "x11/libs"
> > =A0PRIORITY =3D "optional"
> > -LICENSE =3D "LGPL"
> > +LICENSE =3D "GPLv2+ LGPLv2+"
>=20
> This should be:
>=20
> LICENSE =3D "GPLv2+ & LGPLv2+"
>=20
> or whatever the operator is (Most likely & or |)

I know that & works in oe-core, but when I use this in oe-classic I get bui=
ld errors like:

NOTE: Running task 432 of 513 (ID: 1, /home/a0271661/projects/arago-4.7/ara=
go-oe-dev/recipes/atk/atk_1.30.0.bb, do_patch)
ERROR: Function SRC_DISTRIBUTECOMMAND failed
NOTE: Task failed: ('function SRC_DISTRIBUTECOMMAND failed', '/home/a027166=
1/projects/arago-4.7/arago-tmp/work/armv7a-arago-linux-gnueabi/atk-1.30.0-r=
2/temp/log.SRC_DISTRIBUTECOMMAND.27742')
ERROR: Logfile of failure stored in: /home/a0271661/projects/arago-4.7/arag=
o-tmp/work/armv7a-arago-linux-gnueabi/atk-1.30.0-r2/temp/log.SRC_DISTRIBUTE=
COMMAND.27742
Log data follows:
| /home/a0271661/projects/arago-4.7/arago-tmp/work/armv7a-arago-linux-gnuea=
bi/atk-1.30.0-r2/temp/run.SRC_DISTRIBUTECOMMAND.27742: line 1288: /atk: No =
such file or directory
| ERROR: Function SRC_DISTRIBUTECOMMAND failed
NOTE: package atk-1.30.0-r2: task do_distribute_sources: Failed
ERROR: TaskFailed event exception, aborting
ERROR: Build of /home/a0271661/projects/arago-4.7/arago-oe-dev/recipes/atk/=
atk_1.30.0.bb do_distribute_sources failed
ERROR: Task 16 (/home/a0271661/projects/arago-4.7/arago-oe-dev/recipes/atk/=
atk_1.30.0.bb, do_distribute_sources) failed with exit code 1

The line (1288) that is causing this error looks like:

cd /home/a0271661/projects/arago-4.7/arago-tmp/deploy/glibc/sources/&/atk
SRC_DISTRIBUTECOMMAND

Looking at other recipes I noticed that when they had multiple licenses the=
y used a space separated list and in the case of an or license option |.

Any input on this would be appreciated.  I don't believe / is right because=
 that would make it look like a path for the classes that use the license.

>=20
> The license field needs to be ast parsable in order for the
> license
> system to work.
>=20
> -b
>=20
> >
> > -PR =3D "r1"
> > +PR =3D "r2"
> >
> > =A0inherit gnome
> >
> > --
> > 1.7.0.4
> >
> >
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-
> bin/mailman/listinfo/openembedded-devel
>=20
>=20
>=20
> --
> Elizabeth Flanagan
> Yocto Project
> Build and Release


