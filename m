Return-Path: <j-stiffler@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by mail.openembedded.org (Postfix) with ESMTP id 21D34731E3
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  4 May 2016 19:58:18 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id u44JwJ0X026613
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 4 May 2016 14:58:19 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id u44JwJrb008622
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 4 May 2016 14:58:19 -0500
Received: from DFLE09.ent.ti.com ([fe80::7090:147d:b5eb:4c12]) by
	DLEE71.ent.ti.com ([fe80::4dce:5c82:1ad0:d462%28]) with mapi id
	14.03.0224.002; Wed, 4 May 2016 14:58:18 -0500
From: "Stiffler, Jacob" <j-stiffler@ti.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] [PATCH] opencv: Fix broken deps for opencv meta package
Thread-Index: AQHRphfUImP+X9BUwEKnEpMSEz34fp+pf9WA//+wSEA=
Date: Wed, 4 May 2016 19:58:18 +0000
Message-ID: <4B26FB5A64EBA14C87266869E037F9581426BFA9@DFLE09.ent.ti.com>
References: <1462374941-8473-1-git-send-email-j-stiffler@ti.com>
	<CAJTo0LaDTuXZu9r7py2ZaKOYF2oMa1GUmKSRBWP61J1k_EDwew@mail.gmail.com>
In-Reply-To: <CAJTo0LaDTuXZu9r7py2ZaKOYF2oMa1GUmKSRBWP61J1k_EDwew@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.172.224.221]
MIME-Version: 1.0
Subject: Re: [PATCH] opencv: Fix broken deps for opencv meta package
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 04 May 2016 19:58:20 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: openembedded-devel-bounces@lists.openembedded.org
> [mailto:openembedded-devel-bounces@lists.openembedded.org] On
> Behalf Of Burton, Ross
> Sent: Wednesday, May 04, 2016 3:35 PM
> To: OpenEmbedded Devel List
> Subject: Re: [oe] [PATCH] opencv: Fix broken deps for opencv meta package
>=20
> On 4 May 2016 at 16:15, Jacob Stiffler <j-stiffler@ti.com> wrote:
>=20
> > * The opencv meta package's RDEPENDS list is blindly populated with
> >   all non *-dev, *-dbg, and *-doc packages
> >
> > * This includes the non-existent opencv-locale package which is added
> >   to the list by default in oe-core/meta/conf/bitbake.conf
> > * This issue was hidden as late as jethro as the distutils class was
> >   overwriting the PACKAGES list
> > * Therefore add opencv-locale to the opencv meta package blacklist,
> >   and filter out all packages which contain "locale" in the package
> >   name to be safe.
> >
> > * Another issue with the meta package dependency generation logic is
> >   that it may add other empty, non-existent packages.
> > * The existence of the opencv-java package depends on the
> >   PACKAGECONFIG, though it is added as a meta package dependency in
> >   all cases.
> > * Therefore check the contents of PKGDEST to only add non-empty
> >   packages as RDEPENDS for the opencv meta package.
> >
>=20
> do_split_packages() returns the list of packages that it created, so the
> output from the final call to do_split_packages (that creates lib%s) shou=
ld
> be exactly what you need to create a metapackage.
>

The problem this patch is resolving does not involve do_split_packages.=20

The problem is that the PACKAGES list and the packages created are differen=
t since empty packages will not be created by default. For opencv, the PACK=
AGES list is initialized with non-existent packages such as opencv-locale. =
The logic which constructs the meta package dependencies will add the non-e=
xistent opencv-locale package. Adding non-existent packages to the RDEPENDS=
 means that the meta package has broken dependencies.

> (it currently returns duplicates if multiple files are packages, but this
> doesn't cause a problem for metapackage dependencies)
>=20
> Ross
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

