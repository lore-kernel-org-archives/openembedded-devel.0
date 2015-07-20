Return-Path: <lixin.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 39A8B73D0B
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Jul 2015 01:42:31 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.13,665,1427731200"; d="scan'208";a="98614964"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 20 Jul 2015 09:46:08 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t6K1ebdQ028149;
	Mon, 20 Jul 2015 09:40:38 +0800
Received: from G08CNEXMBPEKD02.g08.fujitsu.local ([10.167.33.84]) by
	G08CNEXCHPEKD01.g08.fujitsu.local ([10.167.33.80]) with mapi id
	14.03.0181.006; Mon, 20 Jul 2015 09:42:24 +0800
From: "Li, Xin" <lixin.fnst@cn.fujitsu.com>
To: Joe MacDonald <Joe_MacDonald@mentor.com>
Thread-Topic: [oe] [meta-networking][PATCH] opensaf: Add PACKAGECONFIG for
	openhpi
Thread-Index: AQHQwJsYAnI+hrOcCU6AUkyoOpdBnJ3jkykw
Date: Mon, 20 Jul 2015 01:42:24 +0000
Message-ID: <A8FC939F80655644A89BB21CCD3741E87390F757@G08CNEXMBPEKD02.g08.fujitsu.local>
References: <20150716185219.GD4432@mentor.com>
	<1437101120-1624-1-git-send-email-lixin.fnst@cn.fujitsu.com>
	<20150717141526.GA3901@mentor.com>
In-Reply-To: <20150717141526.GA3901@mentor.com>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.167.226.92]
MIME-Version: 1.0
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking][PATCH] opensaf: Add PACKAGECONFIG for openhpi
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
X-List-Received-Date: Mon, 20 Jul 2015 01:42:38 -0000
Content-Language: zh-CN
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable


> -----Original Message-----
> From: Joe MacDonald [mailto:Joe_MacDonald@mentor.com]
> Sent: Friday, July 17, 2015 10:15 PM
> To: Li, Xin/=1B$BM{=1B(B =1B$B6U=1B(B
> Cc: openembedded-devel@lists.openembedded.org
> Subject: Re: [oe] [meta-networking][PATCH] opensaf: Add PACKAGECONFIG for
> openhpi
>=20
> Hi Li,
>=20
> [[oe] [meta-networking][PATCH] opensaf: Add PACKAGECONFIG for openhpi] On
> 15.07.17 (Fri 10:45) Li xin wrote:
>=20
> > opensaf support for the HPI, So provide a PACKAGECONFIG option for
> > openhpi
> >
> > Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
> > ---
> >  meta-networking/recipes-daemons/opensaf/opensaf_4.5.0.bb | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/meta-networking/recipes-daemons/opensaf/opensaf_4.5.0.bb
> > b/meta-networking/recipes-daemons/opensaf/opensaf_4.5.0.bb
> > index 3d0175e..6ad8a3d 100644
> > --- a/meta-networking/recipes-daemons/opensaf/opensaf_4.5.0.bb
> > +++ b/meta-networking/recipes-daemons/opensaf/opensaf_4.5.0.bb
> > @@ -36,6 +36,8 @@ USERADD_PARAM_${PN} =3D  "-r -g opensaf -d
> > ${datadir}/opensaf/ -s ${sbindir}/nolog  SYSTEMD_SERVICE_${PN} +=3D
> "opensafd.service plmcboot.service plmcd.service"
> >  SYSTEMD_AUTO_ENABLE =3D "disable"
> >
> > +PACKAGECONFIG ??=3D "${@base_contains('DISTRO_FEATURES', 'openhpi',
> 'openhpi', '', d)}"
>=20
> AFAIK this won't actually add openhpi to DEPENDS properly unless you are =
explicitly
> defining a DISTRO_FEATURE for it.  But it will cause a bunch of stuff to =
be rebuilt
> since PACKAGECONFIG is getting updated and signatures will be invalidated=
.  Not
> a big deal, but still not quite what you're hoping to accomplish, I think=
.
>=20
> I was just testing a few other things on my current patch queue and have =
a patch
> for this already, so I'm going to drop this patch for now.
>=20
> Just for future reference, too, @base_contains is on the way out, you sho=
uld use
> @bb.utils.contains instead.

I got it. :)
Thank you very much.

Regards,
Li

