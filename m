Return-Path: <BSREEKAN@xilinx.com>
X-Greylist: delayed 2022 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 25 Jan 2018 20:42:56 UTC
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
	(mail-co1nam03on0072.outbound.protection.outlook.com [104.47.40.72])
	by mail.openembedded.org (Postfix) with ESMTP id D9284601D4
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Jan 2018 20:42:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=uPDtEnn3nO/1vm+gk6P8fyEARcj5zxL32pYgqh/R3SA=;
	b=0HoWDJ8NrRBfL2aUBBw+HRKudc4aXtX2aYpFc3SemHD2Kd7mAACLi+dHiA1uitFO72Zm44p1zFs1XcKWVtivobMwzesyPRCjMDSvLIJ3GGiDlNbYXNMI2aGFwbzi03cvuhTb6sjBKIX71bDb+jDX+e0heoBr7UUO/8i0hbd89Zc=
Received: from BY2PR02MB1283.namprd02.prod.outlook.com (10.162.79.155) by
	BY2PR02MB2119.namprd02.prod.outlook.com (10.166.110.141) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
	15.20.444.14; Thu, 25 Jan 2018 20:09:14 +0000
Received: from BY2PR02MB1283.namprd02.prod.outlook.com ([10.162.79.155]) by
	BY2PR02MB1283.namprd02.prod.outlook.com ([10.162.79.155]) with mapi id
	15.20.0444.014; Thu, 25 Jan 2018 20:09:13 +0000
From: Bhargava Sreekantappa Gayathri <BSREEKAN@xilinx.com>
To: Derek Straka <derek@asterius.io>
Thread-Topic: [oe] [meta-python][PATCH]] python-oauthlib_2.0.6.bb: Add
	python-oauthlib
Thread-Index: AQHTlY9hhdN/TC2MgE6tVNjO0RVzNKOFBWhg
Date: Thu, 25 Jan 2018 20:09:13 +0000
Message-ID: <BY2PR02MB1283FF0292B5D4C1ABB5ADBFB0E10@BY2PR02MB1283.namprd02.prod.outlook.com>
References: <1516849201-27005-1-git-send-email-bhargava.sreekantappa-gayathri@xilinx.com>
	<CADNbA1pOzv0Si-7EoAzCUkXET=qfuU8u9zaUhG6oToP4u7KTqQ@mail.gmail.com>
	<CADNbA1o5kkKtQYB2iEsUArp3ynADdvYkwHS1997NqEV+fuC6+A@mail.gmail.com>
	<CADNbA1osLqof7hmEAtz0uCpWrqZVNaJS_fQV+p5iSgc2MV0fJw@mail.gmail.com>
In-Reply-To: <CADNbA1osLqof7hmEAtz0uCpWrqZVNaJS_fQV+p5iSgc2MV0fJw@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=BSREEKAN@xilinx.com; 
x-originating-ip: [62.221.5.234]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; BY2PR02MB2119;
	6:QOxlhkkWjWaJnT2yOixvbFAbxv9WuMlWXKnrVhSNfBTN/KSh6qmDiGj8w+c19O8+15qa9HAc50hbr9p2tOkt5Bq05sPJHx/u9fuyFBChu3V8QSU6dIElhoSfa5lVFIXeSJ79kdxM1HHHfSSLgNjA4GtM3g5BoLoc1Zd48ELcplyhtitwMCQxoAUkZgekCDmytWCFTQwQFUS+jMAOSI5hJNyPpaR82c6RNPFunf3mtzppk+nRX6XdObmlA9Bte8ggea+1QTyPZ4ETQFPvKQiyL0J6jh9tM0yqbO3j3kqBVHXLJKapwf95I9JmVmw5TLGUmePpdoL6aePgGb0j9jvN/dWEZMXcO6ESmiq/rKSGEW72SNmge9h39fVj1Y4nsWN2;
	5:xg4NOcwMyXcvZkWMSyQW/ucJ5NkcciHX4X8h20Ux4cquHygS++PS9Em1Ah6zgmnPZxuNA00Eo/DgjIaf3PIOckKmTvHDrf4lSQAe/H6vYm8bYADkL3RaLXY2Vhatinyo1j1uBx7hzmTvjdOv0n1+XzeGCS44hO6y3YxCXa/PDGQ=;
	24:/HF0vq6EbDG2zyrF2bBov5n+6CuKI8exA9oKSCx0MgfeLG6JPqmfwEWW+jFdjemdsHOj/byzkUT6CBW0DQe40qDzEN5Wf6a5PzYuor3eqcM=;
	7:BroVGChz+9Mg+AxsixYc1ZFMOV4oJdt1vWBJacpFdQVXh+elGal4w2l9TW4v/egE4XY6W8MGixI0gKU5bRl48PitJy1IZ3p5NVNNQuWRpycu02EGJ8kgug8TjJ77M0RdpO8ruVB8Q3LZ4pHBgt5ycL3wJCLVgZMN/r4+TGba6WybZ+dD+jAToLjBFQbkebHvc/DEl1tljOZDbzH91UA0uX1B53UuP4MU6B9NpkFX2szqzn7ZH80gSFYSQMZa+mZT
x-ms-exchange-antispam-srfa-diagnostics: SSOS;SSOR;
x-forefront-antispam-report: SFV:SKI; SCL:-1; SFV:NSPM;
	SFS:(10009020)(39380400002)(366004)(376002)(39860400002)(396003)(346002)(199004)(189003)(13464003)(316002)(2900100001)(97736004)(105586002)(33656002)(966005)(72206003)(54906003)(99286004)(478600001)(3846002)(6116002)(2906002)(2950100002)(5890100001)(93886005)(305945005)(14454004)(1720100001)(7736002)(6916009)(3280700002)(3660700001)(5660300001)(81156014)(68736007)(81166006)(86362001)(74316002)(66066001)(4326008)(55016002)(53936002)(6306002)(6506007)(7696005)(59450400001)(229853002)(77096007)(106356001)(76176011)(25786009)(9686003)(26005)(53546011)(102836004)(6436002)(8936002)(186003)(6246003);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BY2PR02MB2119;
	H:BY2PR02MB1283.namprd02.prod.outlook.com; FPR:; SPF:None;
	PTR:InfoNoRecords; A:1; MX:1; LANG:en; 
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 6e8befe4-bfab-455c-4285-08d5642f8140
x-microsoft-antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652020)(4534165)(4627221)(201703031133081)(201702281549075)(48565401081)(5600026)(4604075)(3008032)(2017052603307)(7153060)(7193020);
	SRVR:BY2PR02MB2119; 
x-ms-traffictypediagnostic: BY2PR02MB2119:
x-microsoft-antispam-prvs: <BY2PR02MB2119B385D88D23435F543E9CB0E10@BY2PR02MB2119.namprd02.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(166708455590820)(251646265452963)(264703809997249)(192813158149592);
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(6040501)(2401047)(5005006)(8121501046)(3231023)(2400081)(944501161)(3002001)(93006095)(93001095)(10201501046)(6055026)(6041288)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123558120)(20161123562045)(20161123560045)(20161123564045)(6072148)(201708071742011);
	SRVR:BY2PR02MB2119; BCL:0; PCL:0; RULEID:; SRVR:BY2PR02MB2119; 
x-forefront-prvs: 0563F2E8B7
received-spf: None (protection.outlook.com: xilinx.com does not designate
	permitted sender hosts)
x-microsoft-antispam-message-info: WpFH/DzgH2083quEK4Imbk6lS1Uielx0w5IuVwZjW1RCuE+XB+L515kZCn22ISd2aZJfF0JFtnKudpD8Y100Fg==
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e8befe4-bfab-455c-4285-08d5642f8140
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jan 2018 20:09:13.6274 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY2PR02MB2119
Cc: Manjukumar Harthikote Matha <MANJUKUM@xilinx.com>,
	openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-python][PATCH]] python-oauthlib_2.0.6.bb: Add	python-oauthlib
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
X-List-Received-Date: Thu, 25 Jan 2018 20:42:57 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable


> -----Original Message-----
> From: openembedded-devel-bounces@lists.openembedded.org
> [mailto:openembedded-devel-bounces@lists.openembedded.org] On Behalf Of
> Derek Straka
> Sent: Wednesday, January 24, 2018 7:48 PM
> To: Bhargava Sreekantappa Gayathri <BSREEKAN@xilinx.com>
> Cc: Manjukumar Harthikote Matha <MANJUKUM@xilinx.com>; openembeded-
> devel <openembedded-devel@lists.openembedded.org>
> Subject: Re: [oe] [meta-python][PATCH]] python-oauthlib_2.0.6.bb: Add pyt=
hon-
> oauthlib
>=20
> Any chance you can adapt it work on both python 2.7 and python3?

Hi Derek,

I will try your suggestion and send a v2 shortly.

Thanks,
Bhargav
>=20
> On Jan 24, 2018 10:34 PM, "Bhargava Sreekantappa Gayathri" <
> bhargava.sreekantappa-gayathri@xilinx.com> wrote:
>=20
> This patch adds python-oauthlib.
>=20
> Signed-off-by: Bhargava Sreekantappa Gayathri <bhargava.sreekantappa-
> gayathri@xilinx.com>
> ---
>  .../python/python-oauthlib_2.0.6.bb                | 27
> ++++++++++++++++++++++
>  1 file changed, 27 insertions(+)
>  create mode 100644 meta-python/recipes-devtools/python/
> python-oauthlib_2.0.6.bb
>=20
> diff --git a/meta-python/recipes-devtools/python/python-oauthlib_2.0.6.bb
> b/meta-python/recipes-devtools/python/python-oauthlib_2.0.6.bb
> new file mode 100644
> index 0000000..0bcb7b8
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python-oauthlib_2.0.6.bb
> @@ -0,0 +1,27 @@
> +SUMMARY =3D "A generic, spec-compliant, thorough implementation of the
> +OAuth
> request-signing logic"
> +HOMEPAGE =3D "https://github.com/idan/oauthlib"
> +
> +LICENSE =3D "BSD"
> +LIC_FILES_CHKSUM =3D
> "file://LICENSE;md5=3D5ba9ce41463615e082609806255bce1b"
> +
> +SRC_URI =3D "https://pypi.python.org/packages/a5/8a/
> 212e9b47fb54be109f3ff0684165bb38c51117f34e175c379fce5c7df754
> /oauthlib-${PV}.tar.gz"
> +SRC_URI[md5sum] =3D "277a9a966cc8c72e492b4eeb41332445"
> +SRC_URI[sha256sum] =3D "ce57b501e906ff4f614e71c36a3ab9
> eacbb96d35c24d1970d2539bbc3ec70ce1"
> +
> +S =3D "${WORKDIR}/oauthlib-${PV}"
> +
> +inherit setuptools
> +
> +# The following configs & dependencies are from setuptools extras_requir=
e.
> +# These dependencies are optional, hence can be controlled via
> PACKAGECONFIG.
> +# The upstream names may not correspond exactly to bitbake package names=
.
> +#
> +# Uncomment this line to enable all the optional features.
> +#PACKAGECONFIG ?=3D "test signedtoken signals rsa"
> +PACKAGECONFIG[test] =3D ",,,python-blinker python-cryptography
> +python-nose
> python-pyjwt"
> +PACKAGECONFIG[signedtoken] =3D ",,,python-cryptography python-pyjwt"
> +PACKAGECONFIG[signals] =3D ",,,python-blinker"
> +PACKAGECONFIG[rsa] =3D ",,,python-cryptography"
> +
> +RDEPENDS_${PN} +=3D "python-core python-crypt python-datetime python-jso=
n
> python-lang python-logging python-math python-netclient python-re python-
> unittest"
> +
> --
> 2.7.4
>=20
> This email and any attachments are intended for the sole use of the named
> recipient(s) and contain(s) confidential information that may be propriet=
ary,
> privileged or copyrighted under applicable law. If you are not the intend=
ed
> recipient, do not read, copy, or forward this email message or any attach=
ments.
> Delete this email message and any attachments immediately.
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

