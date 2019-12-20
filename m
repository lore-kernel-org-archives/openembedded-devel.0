Return-Path: <Peter.Kolbus@garmin.com>
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
	(mail-bn7nam10on2114.outbound.protection.outlook.com [40.107.92.114])
	by mail.openembedded.org (Postfix) with ESMTP id B28BF7FD29
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Dec 2019 19:06:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=hryA9oeGXThQ9Zs98yxHPQ9NDfcE9BRvRySCWQvBgQKxukpXYOVOVbEqdkzyGHrDowjiQ1ymwhvoF5mPj/UKIPQ/VAiZDg6xljWOL7LNn762jNUcDTQ6bw465uIh/3QRnAK7ts5Yj51iICv3J/xUUnGEpESuBTTVixEekCdDFYCVs0Lw3tLR0d2fz8mnTdHTx503ulV+jcx0P83JF5i0E01ALnd10TlWmZGH/jeKja6KEB4rDSrPXk+KzXN//2kHzVcZX1Nye6TKjX03vKnCHpKrrXqs9ZLg40Gl55HubhN7HiYKeAyTq9NWmKmP+BwuIfn6PAnKv59UM4X3soARDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=mNMAWp6aS3SfAVcRbxl8wo8jXFJEv/J6ML4OwSG6GeQ=;
	b=flXwv4tfgcVOURPL4lhjGaY5hKe4tmDyRfNLx1EJaz652fNXgR4wNVWcY5LYx1sziAX4V2wEqDu3+Aw/G+ANX5BZ2tErWHFf/GYRAsOgGlbpWlkCsNNK5YGsQFBejC9lTB2MWpf8mM8wJ5CDz5wh2N8V07NrdM2+Sg2BHfnkF9fatQzBnL6pcLdwbl14iumBmG1Dk6QTVAWD6FkeyU0JqV4ChN8iPfEul7a/ndHc1eIs2rjmUtWP/FktT52dptczhs6GGNqZt3nW9i76RwQixz22Er+Wk+1iguSxnFVsB6HokUJBgOHfMozU9/kk5uvXCn6uFOowwiru35zWdNJJIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
	204.77.163.244) smtp.rcpttodomain=intel.com smtp.mailfrom=garmin.com;
	dmarc=pass (p=none sp=none pct=100) action=none header.from=garmin.com; 
	dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garmin.com;
	s=selector2;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=mNMAWp6aS3SfAVcRbxl8wo8jXFJEv/J6ML4OwSG6GeQ=;
	b=RnXJ30VUETTQ4ZG5vae2kFlKxVO1qAVIJa0PNoFDiz0+hKKQjxaMSL2d6AMKXXgGNXV4K9wFGIKMiuHBIeDHyidqEtla8f6RdSy4glolkpwk7D3aR1XBalrxkq1hZbdkaJT83Nkfu5Juy92zWKdTzfqK0DPaK6tjcoTuMmodh+8=
Received: from MWHPR04CA0032.namprd04.prod.outlook.com (2603:10b6:300:ee::18)
	by DM5PR04MB0746.namprd04.prod.outlook.com (2603:10b6:3:ff::9) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2538.18; Fri, 20 Dec 2019 19:06:12 +0000
Received: from BN7NAM10FT021.eop-nam10.prod.protection.outlook.com
	(2a01:111:f400:7e8a::202) by MWHPR04CA0032.outlook.office365.com
	(2603:10b6:300:ee::18) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2559.14 via
	Frontend Transport; Fri, 20 Dec 2019 19:06:12 +0000
Authentication-Results: spf=pass (sender IP is 204.77.163.244)
	smtp.mailfrom=garmin.com; intel.com; dkim=none (message not signed)
	header.d=none; intel.com; dmarc=pass action=none header.from=garmin.com;
Received-SPF: Pass (protection.outlook.com: domain of garmin.com designates
	204.77.163.244 as permitted sender) receiver=protection.outlook.com;
	client-ip=204.77.163.244; helo=edgetransport.garmin.com;
Received: from edgetransport.garmin.com (204.77.163.244) by
	BN7NAM10FT021.mail.protection.outlook.com (10.13.157.29) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2559.14 via Frontend Transport; Fri, 20 Dec 2019 19:06:11 +0000
Received: from OLAWPA-EXMB1.ad.garmin.com (10.5.144.23) by
	olawpa-edge5.garmin.com (10.60.4.229) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
	15.1.1466.3; Fri, 20 Dec 2019 13:06:08 -0600
Received: from OLAWPA-EXMB4.ad.garmin.com (10.5.144.25) by
	OLAWPA-EXMB1.ad.garmin.com (10.5.144.23) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1779.2; Fri, 20 Dec 2019 13:06:10 -0600
Received: from OLAWPA-EXMB4.ad.garmin.com ([fe80::d9c:e89c:1ef1:23c]) by
	OLAWPA-EXMB4.ad.garmin.com ([fe80::d9c:e89c:1ef1:23c%23]) with mapi id
	15.01.1779.002; Fri, 20 Dec 2019 13:06:10 -0600
From: "Kolbus, Peter" <Peter.Kolbus@garmin.com>
To: Ross Burton <ross.burton@intel.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] [meta-python][PATCH] python(3)-requests: add
	DEPENDS_class-native
Thread-Index: AQHVtd+lockCXb6k3k69Qy88kECguqfBtu2AgAGpYSA=
Date: Fri, 20 Dec 2019 19:06:10 +0000
Message-ID: <4c5f479c8e2b458fa68e61333433ee60@garmin.com>
References: <20191218201337.78070-1-peter.kolbus@garmin.com>
	<c7378418-7972-1ef4-a52f-735e02ee2851@intel.com>
In-Reply-To: <c7378418-7972-1ef4-a52f-735e02ee2851@intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.50.4.6]
MIME-Version: 1.0
X-TM-AS-Product-Ver: SMEX-12.5.0.1300-8.5.1010-25116.002
X-TM-AS-Result: No-21.002800-8.000000-10
X-TMASE-MatchedRID: WMT2WRIkHPM4HKI/yaqRm8zWN98iBBeGgvr7ECxWof21eX0jEQ9c6vLX
	3qoNbEngNUeVodu4FwkL9uygyOduDqhWorwwQWMCqa6SJk58+LYDU7iFmd8/xT07m5a3Vf0jW8b
	gdD1o+YFF5W+7mYqoUeR1c6lEEK2JLYpNE9jp28b2b09s2KGDsH4yToAKzDgmSvQhBUOr9yss8m
	1alsmNjQm5Y2LgY2Wnb3EUqONGQAHfwcu78111GfSG/+sPtZVkS6mvV++TKmlQKAQSutQYXH5Cz
	uF6I4V0ZRcP7LSftg5EfrsFWGTzMkQXu2820icGQCg+244PxtoGchEhVwJY3xv2iroWthDcECqm
	KiRotDHc3ODX0dLAE+DcAHv31uCX/Ly3VILoo9xTnbANo5id2GeKMm8nChkmM/dZg2GSzOXDBDv
	GLyiq4n0tCKdnhB58pvI8UZOf47hXaDn6DhA2Ao2j49Ftap9Eymsk/wUE4hoD/dHyT/Xh7Q==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--21.002800-8.000000
X-TMASE-Version: SMEX-12.5.0.1300-8.5.1010-25116.002
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:204.77.163.244; IPV:CAL; SCL:-1; CTRY:US;
	EFV:NLI; SFV:NSPM;
	SFS:(10019020)(396003)(39860400002)(346002)(376002)(136003)(199004)(13464003)(189003)(51914003)(7696005)(336012)(356004)(24736004)(26826003)(316002)(108616005)(5660300002)(36756003)(8676002)(76130400001)(70586007)(110136005)(8936002)(86362001)(53546011)(246002)(70206006)(478600001)(426003)(2616005)(186003)(966005)(7636002)(26005)(2906002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:DM5PR04MB0746;
	H:edgetransport.garmin.com; FPR:; SPF:Pass; LANG:en;
	PTR:extedge.garmin.com; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8a1760bb-f64b-46a2-652e-08d7857fad8f
X-MS-TrafficTypeDiagnostic: DM5PR04MB0746:
X-Microsoft-Antispam-PRVS: <DM5PR04MB0746D879E4F6BC915DC633D4FF2D0@DM5PR04MB0746.namprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-Forefront-PRVS: 025796F161
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2uwXD1YmlWG/F5ZgStj0zbPqCmdoQY3L4DpG/PzXFw/JO+A82o+UZCYb3BmB2LM9Tmfo2NiHn3PMYdrfRjZExfMt9p5qamGqTB4zN64tKCCsjUYvpudZS7CXRrWVEldVWv6lDuDrZ0flOCstyRfKSt5k3J7mIaKDBTXxk0u8i9+1mfbMxDM4Clc7iQE4PFNyhXtLVX/CyK1CM5+x4BiFaMHr/vwxpzReXwsGG3W50JJ9XBJnA6izlcxDrDUb+B5Q8lYRMbsR4xHrg+SHU4I6Vk457uIWgulGBHt14MBgTNAh2FknyIkojjsXy/YmTBaBlmSWaGr1yq1i3GNMHF/c4AqDBiNM19+n/HdLXIyOe/84BOxrSVp9/yioRJnoJ4E4Le2XKlHJfiedSmWbb9cEQ32Bbse7cOkxQ0upPs7wtqgffWTbQEFJz9VTrk+jADPFJd6L3GZ6Gvs4wtfwOOPtwYqn3OK1tpizrSUqZ+kZHfStS0Svuwud4keZNr7qCQAsyFrE/PB2sJfQgiq+MW01HGj8hdPpX8PptPo5qiUvlEUm4TBph/5hdO8BeZoGmJtr
X-OriginatorOrg: garmin.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2019 19:06:11.4290 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a1760bb-f64b-46a2-652e-08d7857fad8f
X-MS-Exchange-CrossTenant-Id: 38d0d425-ba52-4c0a-a03e-2a65c8e82e2d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=38d0d425-ba52-4c0a-a03e-2a65c8e82e2d;
	Ip=[204.77.163.244]; Helo=[edgetransport.garmin.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR04MB0746
Subject: Re: [meta-python][PATCH] python(3)-requests: add DEPENDS_class-native
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
X-List-Received-Date: Fri, 20 Dec 2019 19:06:13 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: openembedded-devel-bounces@lists.openembedded.org
> <openembedded-devel-bounces@lists.openembedded.org> On Behalf Of Ross
> Burton
> Sent: Thursday, December 19, 2019 5:26 AM
> To: openembedded-devel@lists.openembedded.org
> Subject: Re: [oe] [meta-python][PATCH] python(3)-requests: add
> DEPENDS_class-native
>=20
> CAUTION - EXTERNAL EMAIL: Do not click any links or open any attachments
> unless you trust the sender and know the content is safe.
>=20
>=20
> On 18/12/2019 20:13, Peter Kolbus wrote:
> > Change-Id: Ie8bd80d56da599b29430da65b303d69bba43fdda
> > ---
> >   .../recipes-devtools/python/python-requests.inc        | 10 +++++++++=
+
> >   1 file changed, 10 insertions(+)
> >
> > diff --git a/meta-python/recipes-devtools/python/python-requests.inc b/=
meta-
> python/recipes-devtools/python/python-requests.inc
> > index 5fe5dc21f..ea2983821 100644
> > --- a/meta-python/recipes-devtools/python/python-requests.inc
> > +++ b/meta-python/recipes-devtools/python/python-requests.inc
> > @@ -23,6 +23,16 @@ RDEPENDS_${PN} +=3D " \
> >       ${PYTHON_PN}-idna \
> >   "
> >
> > +DEPENDS_class-native +=3D " \
> > +    ${PYTHON_PN}-ndg-httpsclient-native \
> > +    ${PYTHON_PN}-pyasn1-native \
> > +    ${PYTHON_PN}-pyopenssl-native \
> > +    ${PYTHON_PN}-pysocks-native \
> > +    ${PYTHON_PN}-urllib3-native \
> > +    ${PYTHON_PN}-chardet-native \
> > +    ${PYTHON_PN}-idna-native \
>=20
> Why would you ned to do this?=20

Thanks for the check. My objective here was to ensure all dependencies are =
in the sysroot, but after more careful retesting, I'm not seeing a need for=
 this particular patch. From what I can tell, it looks like Richard Purdie =
actually addressed the root cause back in February, in native.bbclass.

(When first tested my patches on master, I dropped a similar patch for pyth=
on(3)-beautifulsoup4, but that recipe actually has class-native issues of a=
 slightly different root cause. And in doing so, confused myself about what=
 is truly needed.)

Consider this patch withdrawn. I'll clean up the rest of my patches and sen=
d -- including a better change for beautifulsoup4.

>=20
> Ross
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

