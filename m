Return-Path: <krzysztof.m.sywula@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 707F270022
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Apr 2016 01:00:59 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga103.jf.intel.com with ESMTP; 21 Apr 2016 18:01:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,515,1455004800"; d="scan'208";a="89688203"
Received: from fmsmsx105.amr.corp.intel.com ([10.18.124.203])
	by fmsmga004.fm.intel.com with ESMTP; 21 Apr 2016 18:00:59 -0700
Received: from fmsmsx117.amr.corp.intel.com (10.18.116.17) by
	FMSMSX105.amr.corp.intel.com (10.18.124.203) with Microsoft SMTP Server
	(TLS) id 14.3.248.2; Thu, 21 Apr 2016 18:00:58 -0700
Received: from fmsmsx116.amr.corp.intel.com ([169.254.2.62]) by
	fmsmsx117.amr.corp.intel.com ([169.254.3.77]) with mapi id
	14.03.0248.002; Thu, 21 Apr 2016 18:00:57 -0700
From: "Sywula, Krzysztof M" <krzysztof.m.sywula@intel.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] [meta-oe][PATCH] udisks2: add acl to DEPENDS
Thread-Index: AQHRm3tjWnRIDzB4cESb3hFZ7PYeKJ+U6G0AgABFXLA=
Date: Fri, 22 Apr 2016 01:00:57 +0000
Message-ID: <6741EAAB26B57F4995668065CB62D86B507EE3A8@fmsmsx116.amr.corp.intel.com>
References: <1461208189-2377-1-git-send-email-krzysztof.m.sywula@intel.com>
	<5718DB14.7060405@gmail.com>
In-Reply-To: <5718DB14.7060405@gmail.com>
Accept-Language: en-GB, pl-PL, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.1.200.108]
MIME-Version: 1.0
Cc: "koen@dominion.thruhere.net" <koen@dominion.thruhere.net>
Subject: Re: [meta-oe][PATCH] udisks2: add acl to DEPENDS
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
X-List-Received-Date: Fri, 22 Apr 2016 01:01:00 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Alright, didn't see that one.=20

-----Original Message-----
From: openembedded-devel-bounces@lists.openembedded.org [mailto:openembedde=
d-devel-bounces@lists.openembedded.org] On Behalf Of akuster808
Sent: Thursday, April 21, 2016 6:52 AM
To: openembedded-devel@lists.openembedded.org
Cc: koen@dominion.thruhere.net
Subject: Re: [oe] [meta-oe][PATCH] udisks2: add acl to DEPENDS



On 04/20/2016 08:09 PM, Krzysztof Sywula wrote:
> fixes:
> | configure: error: *** ACL headers not found.

a version of this is in master-next

http://cgit.openembedded.org/meta-openembedded/commit/?h=3Dmaster-next&id=
=3Ddff23fc84bb116e3b31aca0c8a7731507fb6ba37

- armin

> ---
>  meta-oe/recipes-support/udisks/udisks2_2.1.5.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta-oe/recipes-support/udisks/udisks2_2.1.5.bb b/meta-oe/re=
cipes-support/udisks/udisks2_2.1.5.bb
> index d273948..1e00f71 100644
> --- a/meta-oe/recipes-support/udisks/udisks2_2.1.5.bb
> +++ b/meta-oe/recipes-support/udisks/udisks2_2.1.5.bb
> @@ -2,7 +2,7 @@ SUMMARY =3D "udisks provides dbus interfaces for disks an=
d storage devices"
>  LICENSE =3D "GPLv2+ & LGPLv2+"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Ddd79f6dbbffdbc8e86b086a8f0c0e=
f43"
> =20
> -DEPENDS =3D "libatasmart polkit libgudev dbus-glib glib-2.0 intltool-nat=
ive gnome-common-native"
> +DEPENDS =3D "libatasmart polkit libgudev dbus-glib glib-2.0 intltool-nat=
ive gnome-common-native acl"
>  DEPENDS +=3D "${@base_contains('DISTRO_FEATURES', 'systemd', 'systemd', =
'', d)}"
> =20
>  RDEPENDS_${PN} =3D "acl"
>=20
--=20
_______________________________________________
Openembedded-devel mailing list
Openembedded-devel@lists.openembedded.org
http://lists.openembedded.org/mailman/listinfo/openembedded-devel

