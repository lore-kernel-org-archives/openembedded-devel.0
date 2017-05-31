Return-Path: <mns@gomspace.com>
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
	(mail-db5eur01on0109.outbound.protection.outlook.com [104.47.2.109])
	by mail.openembedded.org (Postfix) with ESMTP id A5CBB71979
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 31 May 2017 19:48:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gomspace01.onmicrosoft.com; s=selector1-gomspace-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=2bmh2KoIETcATM/cDvu6fGqIfHNmKAfRr0CqiAaZELM=;
	b=PXLluAcWEYpL8Vn/+WAkkOCy1R3ltiOAYN4kDXriYyAcem8hxCgEuyRnYFm56zZwWlVTxyUc9Gi1CSe7PQrT1I8b4glwrtcuecUl7yPHd2WjggMyb2CeMhdd6dzPb6rVohcXcejRa7thovjapMSIsCXiAf+0bBe4iWVnCto3/2I=
Received: from AM5PR0402MB2769.eurprd04.prod.outlook.com (10.175.41.11) by
	AM5PR0402MB2771.eurprd04.prod.outlook.com (10.175.41.13) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1124.9; Wed, 31 May 2017 19:15:23 +0000
Received: from AM5PR0402MB2769.eurprd04.prod.outlook.com
	([fe80::5052:b387:3cc7:998]) by
	AM5PR0402MB2769.eurprd04.prod.outlook.com
	([fe80::5052:b387:3cc7:998%18]) with mapi id 15.01.1124.020;
	Wed, 31 May 2017 19:15:22 +0000
From: Martin Siegumfeldt <mns@gomspace.com>
To: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
Thread-Topic: [oe] URL of devmem2
Thread-Index: AQHS2X4ttMq8BE90gUOOHHpqWZndxqIOjvmAgABB0yQ=
Date: Wed, 31 May 2017 19:15:22 +0000
Message-ID: <AM5PR0402MB2769B4C2EB8E2882A248DD34C4F10@AM5PR0402MB2769.eurprd04.prod.outlook.com>
References: <AM5PR0402MB2769D2B8C27E4DDADE64D7CEC4F00@AM5PR0402MB2769.eurprd04.prod.outlook.com>,
	<1496243833.26945.66.camel@linux.intel.com>
In-Reply-To: <1496243833.26945.66.camel@linux.intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: lists.openembedded.org; dkim=none (message not signed)
	header.d=none; lists.openembedded.org;
	dmarc=none action=none header.from=gomspace.com;
x-originating-ip: [2603:10a6:203:2:cafe::14]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; AM5PR0402MB2771;
	7:/gZH6BPSfRD//WsopjZU0kusuSryOqFDKNn3iuENVSNM4h66J4I7cNq3N2dVBcr+bS8fFL+pcPxkXe0PJCT91R7o/Ihv6jL5NBrCpc1IxyKavG6QCqPuw62GLTgaqWdy7lchy1s29Xoo0N+3irKAy1A4AiSuNVaFnqwP+w0q/jRWGQdF/OEcVa/lfO7U5N4Itj2FY6Fi6MbzOL/GXGT8f+K0QA1kIrdFHxKPLtL96XuNNb6Oo4Q0CLk2Bfv1OSEr63ghJtV+RzSjA/YknwqiTZdwOqdqLkdUPdgIJHrCZMmL/iVNg1qvvJbGCtqS42ciLSX1Wsrr3u+dnMQlVdZDUg==
x-ms-traffictypediagnostic: AM5PR0402MB2771:
x-ms-office365-filtering-correlation-id: ccf7fe85-cbf9-4d83-3bca-08d4a85962c6
x-microsoft-antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(22001)(2017030254075)(201703131423075)(201702281549075);
	SRVR:AM5PR0402MB2771; 
x-microsoft-antispam-prvs: <AM5PR0402MB2771079F1908BCF67D24A2E9C4F10@AM5PR0402MB2771.eurprd04.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(264703809997249)(228905959029699);
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(100000700073)(100105000095)(100000701073)(100105300095)(100000702073)(100105100095)(6040450)(601004)(2401047)(8121501046)(5005006)(93006095)(93001095)(3002001)(10201501046)(100000703073)(100105400095)(6041248)(20161123560025)(20161123562025)(2016111802025)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123555025)(20161123564025)(20161123558100)(6072148)(6043046)(100000704073)(100105200095)(100000705073)(100105500095);
	SRVR:AM5PR0402MB2771; BCL:0; PCL:0;
	RULEID:(100000800073)(100110000095)(100000801073)(100110300095)(100000802073)(100110100095)(100000803073)(100110400095)(100000804073)(100110200095)(100000805073)(100110500095);
	SRVR:AM5PR0402MB2771; 
x-forefront-prvs: 0324C2C0E2
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(6009001)(39840400002)(39450400003)(39410400002)(39400400002)(24454002)(377424004)(33656002)(3280700002)(76176999)(6246003)(478600001)(9686003)(7696004)(189998001)(50986999)(966005)(38730400002)(110136004)(4326008)(102836003)(6116002)(99286003)(53936002)(6306002)(86362001)(3660700001)(5250100002)(14454004)(54356999)(55016002)(2900100001)(6436002)(74316002)(81166006)(229853002)(8936002)(305945005)(7736002)(6506006)(8676002)(2950100002)(5660300001)(53546009)(42262002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:AM5PR0402MB2771;
	H:AM5PR0402MB2769.eurprd04.prod.outlook.com; FPR:; SPF:None;
	MLV:sfv; LANG:en; 
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-OriginatorOrg: gomspace.com
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 May 2017 19:15:22.8366 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 91ed1e54-6d8b-4599-84d8-65fe75fda3d1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0402MB2771
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: URL of devmem2
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
X-List-Received-Date: Wed, 31 May 2017 19:48:39 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
Sent: Wednesday, May 31, 2017 17:17
To: Martin Siegumfeldt
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [oe] URL of devmem2
=A0  =20
On Tue, 2017-05-30 at 20:10 +0000, Martin Siegumfeldt wrote:
> Hi,
>=20
>=20
> Is there any chance that  http://git.openembedded.org/meta-openembedded/c=
ommit/?id=3Dfc801961457fe2fbb24973bb43b302ad46044cb8 and  http://git.openem=
bedded.org/meta-openembedded/commit/?id=3D6c584374a599f6f8d3607f20ecfc13a67=
ccf1da1 will be backported to release branches? lartmaker domain seems no l=
onger available - AFAICS all branches older than pyro is affected.
>=20

without much contexts on these two patches, send the backported patches
with proper stable releases names as prefixes to the mailing list.

Thanks Leonardo, assuming=A0https://www.openembedded.org/wiki/How_to_submit=
_a_patch_to_OpenEmbedded=A0still applies I will try it out - cheers...


>=20
> Thanks,
>=20
> Martin


    =

