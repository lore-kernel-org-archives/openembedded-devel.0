Return-Path: <cristian.iorga@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 910316AC24
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Apr 2015 16:21:18 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga101.fm.intel.com with ESMTP; 23 Apr 2015 09:21:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,632,1422950400"; d="scan'208";a="560750034"
Received: from irsmsx108.ger.corp.intel.com ([163.33.3.3])
	by orsmga003.jf.intel.com with ESMTP; 23 Apr 2015 09:21:18 -0700
Received: from irsmsx105.ger.corp.intel.com ([169.254.7.178]) by
	IRSMSX108.ger.corp.intel.com ([169.254.11.246]) with mapi id
	14.03.0224.002; Thu, 23 Apr 2015 17:21:17 +0100
From: "Iorga, Cristian" <cristian.iorga@intel.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] [meta-systemd][PATCH] bluez4_4.101.bbappend: update
	according to bluez4
Thread-Index: AQHQfdG+A/OapBat6EOLf/i+bvesWZ1apH+AgAAhraA=
Date: Thu, 23 Apr 2015 16:21:17 +0000
Message-ID: <969F26A8BAB325438E7EB80D3C3134FB2F4B50F7@irsmsx105.ger.corp.intel.com>
References: <1429799251-14057-1-git-send-email-cristian.iorga@intel.com>
	<20150423151619.GB2336@jama>
In-Reply-To: <20150423151619.GB2336@jama>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [163.33.239.180]
MIME-Version: 1.0
Subject: Re: [meta-systemd][PATCH] bluez4_4.101.bbappend: update according to bluez4
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
X-List-Received-Date: Thu, 23 Apr 2015 16:21:20 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

What is left into that bbappend is not suitable for inclusion into bluez4 r=
ecipe.
I am not sure why I should move it meta-oe... Does not seem to be present i=
n oe-core. Or am I wrong?

Thanks,
Cristian

-----Original Message-----
From: openembedded-devel-bounces@lists.openembedded.org [mailto:openembedde=
d-devel-bounces@lists.openembedded.org] On Behalf Of Martin Jansa
Sent: Thursday, April 23, 2015 6:16 PM
To: openembedded-devel@lists.openembedded.org
Subject: Re: [oe] [meta-systemd][PATCH] bluez4_4.101.bbappend: update accor=
ding to bluez4

On Thu, Apr 23, 2015 at 05:27:31PM +0300, Cristian Iorga wrote:
> bluez4 recipe has been updated with proper systemd support, so update=20
> meta-systemd append accordingly.
>=20
> Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
> ---
>  .../oe-core/recipes-connectivity/bluez/bluez4_4.101.bbappend         | 5=
 -----
>  1 file changed, 5 deletions(-)
>=20
> diff --git=20
> a/meta-systemd/oe-core/recipes-connectivity/bluez/bluez4_4.101.bbappen
> d=20
> b/meta-systemd/oe-core/recipes-connectivity/bluez/bluez4_4.101.bbappen
> d
> index da01b05..260c02e 100644
> ---=20
> a/meta-systemd/oe-core/recipes-connectivity/bluez/bluez4_4.101.bbappen
> d
> +++ b/meta-systemd/oe-core/recipes-connectivity/bluez/bluez4_4.101.bba
> +++ ppend

It should be either moved from oe-core to meta-oe directory or better merge=
d into bluez4 recipe and removed from meta-systemd.

> @@ -1,9 +1,4 @@
> -inherit systemd
> -
> -EXTRA_OECONF +=3D "--with-systemdunitdir=3D${systemd_unitdir}/system/"
> -
>  RPROVIDES_${PN} +=3D "${PN}-systemd"
>  RREPLACES_${PN} +=3D "${PN}-systemd"
>  RCONFLICTS_${PN} +=3D "${PN}-systemd"
> -SYSTEMD_SERVICE_${PN} =3D "bluetooth.service"
>  SYSTEMD_AUTO_ENABLE =3D "disable"
> --
> 2.1.0
>=20
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
--
_______________________________________________
Openembedded-devel mailing list
Openembedded-devel@lists.openembedded.org
http://lists.openembedded.org/mailman/listinfo/openembedded-devel

