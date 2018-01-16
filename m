Return-Path: <BSREEKAN@xilinx.com>
X-Greylist: delayed 62554 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 16 Jan 2018 17:10:03 UTC
Received: from NAM03-BY2-obe.outbound.protection.outlook.com
	(mail-by2nam03on0047.outbound.protection.outlook.com [104.47.42.47])
	by mail.openembedded.org (Postfix) with ESMTP id BAB9B7863A
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Jan 2018 17:10:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=a8hyWMsymw7Jlzu5BaGynYo8Bjfmsyn2lhxgN7lgBpc=;
	b=Kh9EL30OjzOk/NZzhVXUatSwHHFDx4ZVJJMsBOlNx86EEPFCyQhRcYg1MUqY9stVbOd9l94vBb2wlMtJSkHlbsHHzmUknpaWfuCxbyS0I7Oyz7y/+nVH8Ewo0+/R4bosfdnuHpkMzYEbVjUeyowI+OjgYuzmYV4tCZS+ZwtJVxs=
Received: from CY1PR02MB1287.namprd02.prod.outlook.com (10.161.170.155) by
	CY1PR02MB1232.namprd02.prod.outlook.com (10.163.16.15) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
	15.20.407.7; Tue, 16 Jan 2018 17:10:03 +0000
Received: from CY1PR02MB1287.namprd02.prod.outlook.com ([10.161.170.155]) by
	CY1PR02MB1287.namprd02.prod.outlook.com ([10.161.170.155]) with mapi id
	15.20.0407.012; Tue, 16 Jan 2018 17:10:03 +0000
From: Bhargava Sreekantappa Gayathri <BSREEKAN@xilinx.com>
To: =?iso-8859-1?Q?Jacobo_Aragunde_P=E9rez?= <jaragunde@igalia.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] [meta-browser] Running chromium as root
Thread-Index: AdOOTKVSPgXrQD6fTo+JFcxujF1IQQAeAZuAAAoEz/A=
Date: Tue, 16 Jan 2018 17:10:02 +0000
Message-ID: <CY1PR02MB128781F44F3B3D0F4F479379B0EA0@CY1PR02MB1287.namprd02.prod.outlook.com>
References: <CY1PR02MB1287081D0CCB26032B3B05F3B0EB0@CY1PR02MB1287.namprd02.prod.outlook.com>
	<4b27f51d-6d50-46d4-f814-c003f9be5613@igalia.com>
In-Reply-To: <4b27f51d-6d50-46d4-f814-c003f9be5613@igalia.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=BSREEKAN@xilinx.com; 
x-originating-ip: [149.199.62.254]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; CY1PR02MB1232;
	6:UcRN6hu4RS6VFzMPapPArL4dQFA4sO5DrgxcFlrZn8dcoNS9cNFMSDBtZbKa7VZhGWIBzWRzIP3NJIUyVWt/8JucaMNZ/l2wRMic+qi6tysLdGaMMuZGcnqHZ978yrtGVrXMFmBY6cotOT/pQiUl5hbee3IpGFsqycAzuVYTE2+Hlcb6YwyL6dRBwMjtIA73CLK7oEdK9XuXWu9dSixQ8WEzFQOLNxSC7hlcbU4NUHMY0AJCmFctsotT/OYFDvZYb9328uY/uh7dX9nhdPu9Wv3BRqoqJMPoMjnbLHhOsnXYeaVOzDNi25RfROYyjUXxHV4eoBv2UKifT7p4ngnWy/QWhENinYeeRsLRK3YWFwTQ51qQdrINbSHr/PHsEjVG;
	5:XKJnToBwqZvIkroCYg2chJzqGHRIC4ABEk92bnDhVovWh8be8BbIocP57JfSKf3+PLCmmecDjer4xs0XixUv4nkVGyrN/Qbm1sGiZTcRhLrB4LpkukdjgbboyHEafFVcBnWeK8dAdU4h/ggEAhcrtMslxln+1LLtzEdr654P+z4=;
	24:3KSXVekDAEe0DD43XFn4ERLOGJzDedzD/1gQ1drzaaWik1f4/Zl0Yfv+0n0RYAxmmy9QkBfYhm7RrbeSkXw1gpCX3D2HHRPtGA2ftQvB8Dk=;
	7:zklsGnwjXIAtXa606s4WmYv0JupO8h6wHNkvxKUxD6LEckfkZS09EmC7haydewzWMFh/2tSF6lqMV/PPqa6q4kb26QF2tP0uxv+OuveHPwIgAomaOl06BwiO85GwHK8gkog3ppbi9NRaOJuC1o/hvp2srBV4K5/DhqFtLpms1EZd8Zh8QaoMwm67o5wK316Fw2TF3m84Ul9soSyLtoDewkWWxJKjinR7fT4gkID6Rm29OlsArrtT3IeE8m9VSZ5G
x-ms-exchange-antispam-srfa-diagnostics: SSOS;
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: cf8f3f82-c3c6-45a1-a597-08d55d03fb96
x-microsoft-antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652020)(48565401081)(5600026)(4604075)(3008032)(2017052603307)(7153060)(7193020);
	SRVR:CY1PR02MB1232; 
x-ms-traffictypediagnostic: CY1PR02MB1232:
x-microsoft-antispam-prvs: <CY1PR02MB12323615609EFAEC2254D12FB0EA0@CY1PR02MB1232.namprd02.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(192374486261705)(264703809997249);
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(6040470)(2401047)(8121501046)(5005006)(3002001)(93006095)(93001095)(10201501046)(3231023)(944501161)(6055026)(6041268)(20161123562045)(20161123564045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123558120)(20161123560045)(6072148)(201708071742011);
	SRVR:CY1PR02MB1232; BCL:0; PCL:0;
	RULEID:(100000803101)(100110400095); SRVR:CY1PR02MB1232; 
x-forefront-prvs: 0554B1F54F
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(346002)(39860400002)(396003)(366004)(376002)(39380400002)(24454002)(13464003)(199004)(189003)(14454004)(26005)(68736007)(25786009)(74316002)(66066001)(305945005)(3846002)(6246003)(2501003)(7736002)(6116002)(72206003)(478600001)(966005)(86362001)(2900100001)(110136005)(5660300001)(105586002)(7696005)(77096006)(81156014)(33656002)(59450400001)(8676002)(229853002)(316002)(1720100001)(106356001)(8936002)(2906002)(53546011)(53936002)(6436002)(3660700001)(81166006)(76176011)(97736004)(3280700002)(9686003)(6506007)(55016002)(6306002)(2950100002)(102836004)(99286004);
	DIR:OUT; SFP:1101; SCL:1; SRVR:CY1PR02MB1232;
	H:CY1PR02MB1287.namprd02.prod.outlook.com; FPR:; SPF:None;
	PTR:InfoNoRecords; A:1; MX:1; LANG:en; 
received-spf: None (protection.outlook.com: xilinx.com does not designate
	permitted sender hosts)
x-microsoft-antispam-message-info: e59Bjziq7Ux3M6HTgQcgx7wAfmee4A6Ol/iy897oc28hjckzLM1QML2DSeO+j2CDUUkhLwB/lQtQMWlmtgHjng==
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf8f3f82-c3c6-45a1-a597-08d55d03fb96
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jan 2018 17:10:02.8157 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR02MB1232
Subject: Re: [meta-browser] Running chromium as root
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
X-List-Received-Date: Tue, 16 Jan 2018 17:10:04 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Thanks Jacob, I will try that out.

Thanks,
Bhargav

> -----Original Message-----
> From: openembedded-devel-bounces@lists.openembedded.org
> [mailto:openembedded-devel-bounces@lists.openembedded.org] On Behalf Of
> Jacobo Aragunde P=E9rez
> Sent: Tuesday, January 16, 2018 4:22 AM
> To: openembedded-devel@lists.openembedded.org
> Subject: Re: [oe] [meta-browser] Running chromium as root
>=20
> Hi!
>=20
> On 15/01/18 23:14, Bhargava Sreekantappa Gayathri wrote:
> > Hello,
> >
> > Has anyone has been able to run chromium-x11 as root user? Is there a f=
lag or
> config I can tweak before building chromium?
> >
>=20
> You should be able to run chromium as root with the runtime flag `--no-
> sandbox`. No changes in the build process are needed.
>=20
> Take into account such a setup is discouraged for security reasons!
>=20
> Best,
> --
> Jacobo Aragunde
> Software Engineer at Igalia
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

