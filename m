Return-Path: <cristian.iorga@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 384D2605D2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Apr 2015 14:23:00 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga101.jf.intel.com with ESMTP; 24 Apr 2015 07:23:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,640,1422950400"; d="scan'208";a="485159525"
Received: from irsmsx109.ger.corp.intel.com ([163.33.3.23])
	by FMSMGA003.fm.intel.com with ESMTP; 24 Apr 2015 07:23:00 -0700
Received: from irsmsx105.ger.corp.intel.com ([169.254.7.178]) by
	IRSMSX109.ger.corp.intel.com ([169.254.13.201]) with mapi id
	14.03.0224.002; Fri, 24 Apr 2015 15:23:00 +0100
From: "Iorga, Cristian" <cristian.iorga@intel.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] [meta-systemd][PATCH V2] bluez4_4.101.bbappend: update
	according to bluez4
Thread-Index: AQHQfolLx4LYZnGrZU2W1b6J28ZdyZ1cCRSAgAAuAZA=
Date: Fri, 24 Apr 2015 14:22:59 +0000
Message-ID: <969F26A8BAB325438E7EB80D3C3134FB2F4B5777@irsmsx105.ger.corp.intel.com>
References: <1429878122-23715-1-git-send-email-cristian.iorga@intel.com>
	<20150424123743.GA2353@jama>
In-Reply-To: <20150424123743.GA2353@jama>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [163.33.239.180]
MIME-Version: 1.0
Subject: Re: [meta-systemd][PATCH V2] bluez4_4.101.bbappend: update according to bluez4
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
X-List-Received-Date: Fri, 24 Apr 2015 14:23:02 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Will do, thanks for the guidance. Otherwise, the bbappend is now correct, r=
ight?
Thanks,
Cristian

-----Original Message-----
From: openembedded-devel-bounces@lists.openembedded.org [mailto:openembedde=
d-devel-bounces@lists.openembedded.org] On Behalf Of Martin Jansa
Sent: Friday, April 24, 2015 3:38 PM
To: openembedded-devel@lists.openembedded.org
Subject: Re: [oe] [meta-systemd][PATCH V2] bluez4_4.101.bbappend: update ac=
cording to bluez4

On Fri, Apr 24, 2015 at 03:22:02PM +0300, Cristian Iorga wrote:
> bluez4 recipe has been updated with proper systemd support, so update=20
> meta-systemd append accordingly.
> Also update to the right directory structure.

You need to update BBFILES in layer.conf, see:
commit 8b465f791a5ef3d9ef138a206c6fb9c3bbcb55b1
Author: Martin Jansa <Martin.Jansa@gmail.com>
Date:   Sat Apr 13 14:16:51 2013 +0200

    layer.conf: remove detection of other layers, now there are only oe-cor=
e bbappends

> Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
> ---
>  .../recipes-connectivity/bluez/bluez4_4.101.bbappend                 | 5=
 -----
>  1 file changed, 5 deletions(-)
>  rename meta-systemd/{oe-core =3D>=20
> meta-oe}/recipes-connectivity/bluez/bluez4_4.101.bbappend (51%)
>=20
> diff --git=20
> a/meta-systemd/oe-core/recipes-connectivity/bluez/bluez4_4.101.bbappen
> d=20
> b/meta-systemd/meta-oe/recipes-connectivity/bluez/bluez4_4.101.bbappen
> d
> similarity index 51%
> rename from=20
> meta-systemd/oe-core/recipes-connectivity/bluez/bluez4_4.101.bbappend
> rename to=20
> meta-systemd/meta-oe/recipes-connectivity/bluez/bluez4_4.101.bbappend
> index da01b05..260c02e 100644
> ---=20
> a/meta-systemd/oe-core/recipes-connectivity/bluez/bluez4_4.101.bbappen
> d
> +++ b/meta-systemd/meta-oe/recipes-connectivity/bluez/bluez4_4.101.bba
> +++ ppend
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

