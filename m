Return-Path: <MANJUKUM@xilinx.com>
X-Greylist: delayed 15482 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 18 Jun 2018 19:10:04 UTC
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
	(mail-bl2nam02on0084.outbound.protection.outlook.com [104.47.38.84])
	by mail.openembedded.org (Postfix) with ESMTP id F2BF171BF2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Jun 2018 19:10:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=kxrkzCGv2Sr6zLjdHLZTNMpdkIqulR7jBGv1g5HhspQ=;
	b=37Tj4zYiyqkiC2DEmj2dR0svOptOXzawGk6AApbSQSUK2NJZQIuwXt27gbSBUTUpwpmB5NvMSXPqOP+WPVi5GZobcay5FLPDQi+EAplYRZxK1MT8LLjNISF6653rnIxOmbnqhycbyQfumBVTLwOTMwFPP9hYr37bAadjZjA7k08=
Received: from DM5PR02MB3863.namprd02.prod.outlook.com (52.132.139.146) by
	DM5PR02MB2780.namprd02.prod.outlook.com (10.175.86.7) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.863.19; Mon, 18 Jun 2018 14:37:35 +0000
Received: from DM5PR02MB3863.namprd02.prod.outlook.com
	([fe80::a980:cb7c:becd:294]) by DM5PR02MB3863.namprd02.prod.outlook.com
	([fe80::a980:cb7c:becd:294%5]) with mapi id 15.20.0863.016;
	Mon, 18 Jun 2018 14:37:35 +0000
From: Manjukumar Harthikote Matha <MANJUKUM@xilinx.com>
To: Armin Kuster <akuster808@gmail.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] [PATCH 00/39] Sumo-next patch review
Thread-Index: AQHUBxE2f4QHBCrfd0uM/ClxAr8oSaRmFStg
Date: Mon, 18 Jun 2018 14:37:35 +0000
Message-ID: <DM5PR02MB3863CC1D2E4B15CB37B0ADDFB9710@DM5PR02MB3863.namprd02.prod.outlook.com>
References: <cover.1529330340.git.akuster808@gmail.com>
In-Reply-To: <cover.1529330340.git.akuster808@gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=MANJUKUM@xilinx.com; 
x-originating-ip: [73.231.161.32]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; DM5PR02MB2780;
	7:WGdKjphCho41LyjF5pjotEDQ2UPAYeAIZ63dIKi8O8p7Exnnw1nAW8QrHmD/oYisrbLbRz1R79Qmw+Z+Mj7slp/FNBw3PfLUvOk7/ZGinjn56HAsasfPhPRO3tPefOksSgIDoWi8hspT4qn9PN9p3/sZ6OYhTNA5OK0zM19i4C2eGASLlicInhUPtNaWVKFE58qV3oMl7k7v1JIY/Fxaf9TjqUlBlkae0TZp8hDp28MEKsDraH2HS536qPYkrW9I
x-ms-exchange-antispam-srfa-diagnostics: SOS;
x-ms-office365-filtering-correlation-id: 9af8c83b-d083-4e32-7188-08d5d529089f
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652020)(4534165)(4627221)(201703031133081)(201702281549075)(5600026)(711020)(48565401081)(2017052603328)(7153060)(7193020);
	SRVR:DM5PR02MB2780; 
x-ms-traffictypediagnostic: DM5PR02MB2780:
x-microsoft-antispam-prvs: <DM5PR02MB2780E7DFD463595492DB856BB9710@DM5PR02MB2780.namprd02.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(85827821059158)(264703809997249);
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(10201501046)(3002001)(93006095)(93001095)(3231254)(944501410)(52105095)(6055026)(149027)(150027)(6041310)(20161123560045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123564045)(20161123562045)(20161123558120)(6072148)(201708071742011)(7699016);
	SRVR:DM5PR02MB2780; BCL:0; PCL:0; RULEID:; SRVR:DM5PR02MB2780; 
x-forefront-prvs: 0707248B64
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(366004)(39860400002)(39380400002)(396003)(346002)(376002)(13464003)(199004)(189003)(105586002)(86362001)(66066001)(6306002)(9686003)(97736004)(55016002)(33656002)(2900100001)(5250100002)(3280700002)(2906002)(2501003)(3660700001)(229853002)(6436002)(1720100001)(91966014)(6116002)(3846002)(68736007)(25786009)(7736002)(14454004)(305945005)(5660300001)(74316002)(6246003)(39060400002)(53936002)(11346002)(76176011)(7696005)(102836004)(316002)(59450400001)(476003)(53546011)(6506007)(26005)(110136005)(186003)(446003)(486006)(8676002)(99286004)(478600001)(81156014)(8936002)(966005)(72206003)(81166006)(106356001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR02MB2780;
	H:DM5PR02MB3863.namprd02.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: xilinx.com does not designate
	permitted sender hosts)
x-microsoft-antispam-message-info: B62HpjVVw9LLPqhQ5GBOQpvkJHQfhd8Nr6rNZgd4jBqH7fN2wPJCyKYQsvf91qKeD7rb4kC1cIZJKO6UniWw3Uzs65HVPCT4gigOLSui4/ZwP67HRLGXaCuGkDr03ZqMFjQz1PDxHT0Y+PVaac1pEJ1VqA+8uuOt++zlaiz4V0lBmeyFGuCnDNV8M7soo9ZHy9NFq/uyESIbcr4ZkTKGWaUoJ5TN6QeETkNFFWPXYNDAq1WKihT6hQFJCe2SYIjVenbrQG2aixJePTWjhuUAFIbkJYOpfROt6c/orV/acsoIepGu/K3vcHm7DEWzwnCicq8ALQz0qk3zlBYXSpTYPw==
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9af8c83b-d083-4e32-7188-08d5d529089f
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jun 2018 14:37:35.6664 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR02MB2780
Subject: Re: [PATCH 00/39] Sumo-next patch review
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
X-List-Received-Date: Mon, 18 Jun 2018 19:10:05 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Armin,


> -----Original Message-----
> From: openembedded-devel-bounces@lists.openembedded.org
> [mailto:openembedded-devel-bounces@lists.openembedded.org] On Behalf Of
> Armin Kuster
> Sent: Monday, June 18, 2018 7:32 AM
> To: akuster808@gmail.com; openembedded-devel@lists.openembedded.org
> Subject: [oe] [PATCH 00/39] Sumo-next patch review
>=20
>=20
> These are backports from master for sumo.
> This is your chance to comment on this series for sumo.


Can we get this sysvinit patch to backport as well?
https://patchwork.openembedded.org/patch/150414/

Thanks,
Manju

>=20
> Cover letter only
>=20
> The following changes since commit
> a19aa29f7fa336cd075b72c496fe1102e6e5422b:
>=20
>   python-evdev: Use target header to generate ecodes.c (2018-05-01 18:17:=
50 -
> 0700)
>=20
> are available in the git repository at:
>=20
>   git://git.openembedded.org/meta-openembedded-contrib stable/sumo-next
>   http://cgit.openembedded.org/meta-openembedded-
> contrib/log/?h=3Dstable/sumo-next
>=20
> Andre McCurdy (1):
>   openobex: explicitly set ASNEEDED from openobex recipe
>=20
> Armin Kuster (1):
>   ntp: update to 4.2.8.p11
>=20
> Christophe PRIOUZEAU (1):
>   minicoredumper: relocate admin-binaries to sbin
>=20
> Florian Wickert (1):
>   Add missing dependency for python-flask packages.
>=20
> Hains van den Bosch (1):
>   libtevent: refresh patch
>=20
> Hannu Lounento (1):
>   vlan: use update-alternatives for vconfig
>=20
> Hongxu Jia (2):
>   krb5: support environment setting on systemd
>   xfce4-notifyd: fix parallel build issue
>=20
> Khem Raj (2):
>   geany-plugins: Add dependency on fribidi
>   iperf3: Drop redundant patch
>=20
> Mark Asselstine (1):
>   gnome-keyring: fix 'installed but not shipped' QA issue
>=20
> Martin Jansa (2):
>   Revert "libxml++: only include when x11 in DISTRO_FEATURES"
>   android-tools: use fixed SRCREVs instead of tag name
>=20
> Michael Siebecker (1):
>   Fix zram module paramter name
>=20
> Mikko Rapeli (1):
>   lmbench: fix Upstream-Status metadata typos in patch
>=20
> Noor Ahsan (1):
>   radvd: Fix missing yacc error.
>=20
> Robert Joslyn (1):
>   htop: Fix typo
>=20
> Sipke Vriend (1):
>   python-robotframework: Add runtime dependencies to robot framework
>=20
> Slater, Joseph (1):
>   phoronix-test-suite: disable systemd services by default
>=20
> Trevor Woerner (14):
>   grubby: switch away from github archive
>   gst-instruments: switch away from github archive
>   gst-instruments: recipe cleanup, fix -staticdev
>   libsrtp: switch away from github archive
>   libuv: switch away from github archive
>   libwebsockets: switch away from github archive
>   python-cpuset: switch away from github archive
>   openh264: fix build for 32-bit intel arch
>   openh264: switch away from github archive
>   tinyalsa: switch away from github archive
>   wolfssl: switch away from github archive
>   ipcalc: switch away from github archive
>   geoip-perl: switch away from github archive
>   gtest: switch away from github archive
>=20
> Yi Zhao (2):
>   networkmanager: fix QA issue error for multilib
>   networkmanager-openvpn: fix QA issue error for multilib
>=20
> Zheng Ruoqin (2):
>   hostapd: fix the bug for PATCHTOOL =3D "patch"
>   xorgxrdp: Fix the License
>=20
> leimaohui (1):
>   python-lockfile: Fix build error as following:
>=20
> texierp (1):
>   minicoredumper: fixes for sysvinit and systemd
>=20
>  .../gnome-keyring/gnome-keyring_3.20.0.bb          |   2 +-
>  .../recipes-devtools/grubby/grubby_8.40.bb         |  10 +-
>  .../recipes-multimedia/openh264/openh264_1.7.0.bb  |  16 +-
>  .../recipes-multimedia/tinyalsa/tinyalsa_1.1.1.bb  |   6 +-
>  .../gst-instruments/gst-instruments_0.2.3.bb       |  12 +-
>  .../recipes-support/libsrtp/libsrtp_1.5.2.bb       |   6 +-
>  .../networkmanager/networkmanager-openvpn_1.2.8.bb |   2 +-
>  .../networkmanager/networkmanager_1.10.6.bb        |   4 +-
>  .../recipes-connectivity/vlan/vlan_1.9.bb          |   6 +
>  .../recipes-connectivity/wolfssl/wolfssl_3.12.0.bb |   9 +-
>  meta-networking/recipes-daemons/radvd/radvd.inc    |   2 +-
>  .../recipes-support/geoip/geoip-perl_1.50.bb       |  11 +-
>  .../recipes-support/ipcalc/ipcalc_0.2.2.bb         |   7 +-
>  .../libtevent/avoid-attr-unless-wanted.patch       |  18 +-
>  .../ntp/{ntp_4.2.8p10.bb =3D> ntp_4.2.8p11.bb}       |   4 +-
>  ...de-stdint.h-for-various-std-c99-int-types.patch |  25 -
>  meta-oe/recipes-benchmark/iperf3/iperf3_3.2.bb     |   1 -
>  .../use-base_libdir-instead-of-hardcoded-lib.patch |   2 +-
>  .../phoronix-test-suite_7.8.0.bb                   |   5 +
>  ...-Avoid-key-reinstallation-in-FT-handshake.patch | 177 ++++  ...nstall=
ation-of-an-
> already-in-use-group-ke.patch | 253 ++++++  ...ection-of-GTK-IGTK-reinsta=
llation-
> of-WNM-.patch | 187 ++++  ...04-Prevent-installation-of-an-all-zero-TK.pa=
tch |  82
> ++  ...Fix-PTK-rekeying-to-generate-a-new-ANonce.patch |  67 ++  .../0006=
-TDLS-
> Reject-TPK-TK-reconfiguration.patch  | 135 +++  ...llow-multiple-Reassoci=
ation-
> Response-fram.patch |  85 ++  .../hostapd/hostapd/key-replay-cve-multiple=
.patch
> | 984 ---------------------
>  .../recipes-connectivity/hostapd/hostapd_2.6.bb    |   8 +-
>  .../krb5/krb5/etc/default/krb5-admin-server        |   4 +-
>  .../krb5/krb5/krb5-admin-server.service            |   1 +
>  .../krb5/krb5/krb5-kdc.service                     |   1 +
>  meta-oe/recipes-connectivity/krb5/krb5_1.16.bb     |   5 +
>  meta-oe/recipes-connectivity/libuv/libuv_1.11.0.bb |   8 +-
>  .../libwebsockets/libwebsockets_2.1.0.bb           |   7 +-
>  .../recipes-connectivity/obex/openobex_1.7.2.bb    |   2 +
>  meta-oe/recipes-core/libxml/libxml++_2.40.1.bb     |   2 +-
>  .../android-tools/android-tools_5.1.1.r37.bb       |  18 +-
>  .../recipes-devtools/geany/geany-plugins_1.31.bb   |   1 +
>  .../recipes-devtools/python/python-cpuset_1.5.7.bb |  11 +-
>  meta-oe/recipes-extended/zram/zram/init            |   2 +-
>  .../minicoredumper/files/minicoredumper.init       |   2 +-
>  .../minicoredumper/files/minicoredumper.service    |   2 +-
>  .../minicoredumper/minicoredumper_2.0.0.bb         |   4 +
>  meta-oe/recipes-support/htop/htop_2.1.0.bb         |   2 +-
>  .../recipes-support/xorg-xrdp/xorgxrdp_0.2.5.bb    |   2 +-
>  meta-oe/recipes-test/gtest/gtest_1.8.0.bb          |   9 +-
>  .../recipes-devtools/python/python-flask.inc       |   2 +-
>  .../python/python-lockfile_0.12.2.bb               |   6 +
>  .../python/python-robotframework.inc               |  11 +
>  .../python/python-robotframework_3.0.2.bb          |   4 +
>  .../xfce4-notifyd/xfce4-notifyd_0.4.2.bb           |   2 +-
>  51 files changed, 1123 insertions(+), 1111 deletions(-)  rename meta-
> networking/recipes-support/ntp/{ntp_4.2.8p10.bb =3D> ntp_4.2.8p11.bb} (97=
%)
> delete mode 100644 meta-oe/recipes-benchmark/iperf3/iperf3/0001-include-
> stdint.h-for-various-std-c99-int-types.patch
>  create mode 100644 meta-oe/recipes-connectivity/hostapd/hostapd/0001-
> hostapd-Avoid-key-reinstallation-in-FT-handshake.patch
>  create mode 100644 meta-oe/recipes-connectivity/hostapd/hostapd/0002-
> Prevent-reinstallation-of-an-already-in-use-group-ke.patch
>  create mode 100644 meta-oe/recipes-connectivity/hostapd/hostapd/0003-
> Extend-protection-of-GTK-IGTK-reinstallation-of-WNM-.patch
>  create mode 100644 meta-oe/recipes-connectivity/hostapd/hostapd/0004-
> Prevent-installation-of-an-all-zero-TK.patch
>  create mode 100644 meta-oe/recipes-connectivity/hostapd/hostapd/0005-Fix=
-
> PTK-rekeying-to-generate-a-new-ANonce.patch
>  create mode 100644 meta-oe/recipes-connectivity/hostapd/hostapd/0006-TDL=
S-
> Reject-TPK-TK-reconfiguration.patch
>  create mode 100644 meta-oe/recipes-connectivity/hostapd/hostapd/0007-FT-
> Do-not-allow-multiple-Reassociation-Response-fram.patch
>  delete mode 100644 meta-oe/recipes-connectivity/hostapd/hostapd/key-repl=
ay-
> cve-multiple.patch
>=20
> --
> 2.7.4
>=20
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

