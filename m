Return-Path: <gshastri@juniper.net>
Received: from na01-bn1-obe.outbound.protection.outlook.com
	(mail-bn1bon0130.outbound.protection.outlook.com [157.56.111.130])
	by mail.openembedded.org (Postfix) with ESMTP id 6E794606BF
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  9 Apr 2015 14:46:39 +0000 (UTC)
Received: from BN3PR0501MB1427.namprd05.prod.outlook.com (25.160.117.149) by
	BN3PR0501MB1425.namprd05.prod.outlook.com (25.160.117.147) with
	Microsoft
	SMTP Server (TLS) id 15.1.136.25; Thu, 9 Apr 2015 14:46:39 +0000
Received: from BN3PR0501MB1427.namprd05.prod.outlook.com ([25.160.117.149]) by
	BN3PR0501MB1427.namprd05.prod.outlook.com ([25.160.117.149]) with
	mapi id 15.01.0130.020; Thu, 9 Apr 2015 14:46:39 +0000
From: Gaurang Shastri <gshastri@juniper.net>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] [[meta-filesystems][Add xorriso support]] Add xorriso tool
	support
Thread-Index: AQHQcjX0Mp6zoP2RlECF2Zrekom/I51Ewe0w
Date: Thu, 9 Apr 2015 14:46:38 +0000
Message-ID: <BN3PR0501MB1427033101BD79CB1A787E9ED5FB0@BN3PR0501MB1427.namprd05.prod.outlook.com>
References: <1427916099-30314-1-git-send-email-gshastri@juniper.net>
	<20150408195516.GB29645@jama>
In-Reply-To: <20150408195516.GB29645@jama>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: lists.openembedded.org; dkim=none (message not signed)
	header.d=none;
x-originating-ip: [116.197.184.12]
x-microsoft-antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:BN3PR0501MB1425;
x-forefront-antispam-report: BMV:1; SFV:NSPM;
	SFS:(10019020)(6009001)(24454002)(377454003)(122556002)(40100003)(575784001)(86362001)(46102003)(99286002)(92566002)(1720100001)(76576001)(77156002)(450100001)(15975445007)(62966003)(102836002)(66066001)(2656002)(2900100001)(2950100001)(2501003)(19580405001)(19580395003)(50986999)(76176999)(54356999)(2351001)(74316001)(106116001)(33656002)(87936001)(110136001)(107886001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BN3PR0501MB1425;
	H:BN3PR0501MB1427.namprd05.prod.outlook.com; FPR:; SPF:None;
	MLV:sfv; LANG:en; 
x-microsoft-antispam-prvs: <BN3PR0501MB1425EFCD31251D04D0343D49D5FB0@BN3PR0501MB1425.namprd05.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:;
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(601004)(5002010)(5005006); SRVR:BN3PR0501MB1425; BCL:0;
	PCL:0; RULEID:; SRVR:BN3PR0501MB1425; 
x-forefront-prvs: 0541031FF6
MIME-Version: 1.0
X-OriginatorOrg: juniper.net
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Apr 2015 14:46:38.9569 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bea78b3c-4cdb-4130-854a-1d193232e5f4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN3PR0501MB1425
Subject: Re: [[meta-filesystems][Add xorriso support]] Add xorriso tool support
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
X-List-Received-Date: Thu, 09 Apr 2015 14:46:41 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

>> Have you tested this recipe before sending it?

Yes, I have tested this in my Yocto 1.6 environment(x86_64) before sending =
it and did and get any error.

Can you share your yocto environment information please ?

//Gaurang Shastri

-----Original Message-----
From: openembedded-devel-bounces@lists.openembedded.org [mailto:openembedde=
d-devel-bounces@lists.openembedded.org] On Behalf Of Martin Jansa
Sent: Thursday, April 09, 2015 1:25 AM
To: openembedded-devel@lists.openembedded.org
Subject: Re: [oe] [[meta-filesystems][Add xorriso support]] Add xorriso too=
l support

On Wed, Apr 01, 2015 at 12:21:39PM -0700, Gaurang Shastri wrote:
> xorriso copies file objects from POSIX compliant filesystems into Rock=20
> Ridge enhanced ISO 9660 filesystems and allows session-wise=20
> manipulation of such filesystems.

Have you tested this recipe before sending it?

It fails to build, most likely because of missing foreign flag to automake.

| configure.ac:47: installing './compile'
| configure.ac:14: installing './missing'
| Makefile.am: error: required file './NEWS' not found
| Makefile.am: installing './depcomp'
| autoreconf: automake failed with exit status: 1
| ERROR: autoreconf execution failed.
| WARNING: exit code 1 from a shell command.
| ERROR: Function failed: do_configure (log file is located at=20
| /home/jenkins/oe/world/shr-core/tmp-glibc/work/i586-oe-linux/xorriso/1
| .3.8-r0/temp/log.do_configure.16725)
NOTE: recipe xorriso-1.3.8-r0: task do_configure: Failed

> Signed-off-by: Gaurang Shastri <gshastri@juniper.net>
> ---
>  .../recipes-utils/xorriso/xorriso_1.3.8.bb         |   17 ++++++++++++++=
+++
>  1 file changed, 17 insertions(+)
>  create mode 100644=20
> meta-filesystems/recipes-utils/xorriso/xorriso_1.3.8.bb
>=20
> diff --git a/meta-filesystems/recipes-utils/xorriso/xorriso_1.3.8.bb=20
> b/meta-filesystems/recipes-utils/xorriso/xorriso_1.3.8.bb
> new file mode 100644
> index 0000000..93914b4
> --- /dev/null
> +++ b/meta-filesystems/recipes-utils/xorriso/xorriso_1.3.8.bb
> @@ -0,0 +1,17 @@
> +DESCRIPTIONS =3D "xorriso copies file objects from POSIX compliant files=
ystems into Rock Ridge enhanced ISO 9660 filesystems and allows session-wis=
e manipulation of such filesystems"
> +
> +inherit autotools
> +
> +DEPENDS +=3D "attr zlib"
> +
> +SRC_URI =3D "http://www.gnu.org/software/${BPN}/${BPN}-${PV}.tar.gz"
> +
> +SRC_URI[md5sum] =3D "a0fc534ef8f9589282a189f0e6cdf952"
> +SRC_URI[sha256sum] =3D "901204634651533f7cbd105eab560534702458258529aac4=
b2f0fc946992107e"
> +
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dd32239bcb673463ab874e80d47fae=
504"
> +LICENSE =3D "GPLv3"
> +
> +EXTRA_OECONF =3D "--disable-libacl"
> +
> +BBCLASSEXTEND =3D "nativesdk"
> --
> 1.7.9.5
>=20
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

