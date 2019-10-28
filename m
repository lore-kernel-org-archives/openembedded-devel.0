Return-Path: <mns@gomspace.com>
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
	(mail-eopbgr30126.outbound.protection.outlook.com [40.107.3.126])
	by mail.openembedded.org (Postfix) with ESMTP id 1EFFE7F94A
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Oct 2019 12:33:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=TDJHCsc0PW2ExSmw+QHhx4cYSBn6TCBdQiL4r3ukiswLFrwoPmfpSRzojc//RXFms481xd/HFTYv2nquRPeeoT4FHK2oQOIGpVyDJ0KaPdJlzQlfGtlumX0zJw8Nf5knKD8m0mEs5hSRLRFkK8qTqZvmHLVYm6sddRHMQq7kGKK1NW4vJbFLlhFonyc7Cjp93/OSVAX9mSSGD+nekcWVRB9oxTvftiynr2p5XNho9sJv6lwy0i06vp2MueLKWqPQYjMHgMBVruLYMwhNquqvjhVZUVu09iVrFlRgpze8aeJLYKH+64QsdtHzlpaJQ7M/khvfRvhLKSRem2arvEeGhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=58mjyHxmmpOFOELzMqsC+zYAVRoojJj8HrkeDrNLP+g=;
	b=ZRrEWaNAXOLI0F86oIsuIcLJRAZRK6QQ/ew2qqQJY7fPGl78N/JW+SGzicF4vhSV4bCYyLWsrKzaHoXbRIzRNsa2e1KFekJC719D2z5FIKHcLsIQxNYS9yQZ4+U8qvFhAKO70Na4Nf/8uoxskm3ga/G7eVJ3XJOR02GlrlMAHGyMe354wBFXcTMQFRk3LrXR29yiG+ZaAkLgMJGs1eyrlzhM8wiuufrRWwf3Yw8lFvYgE+gK2WVGFdd06wmZbmO0KeOwY0Vpl9l10+EV+ZDEtCYJ5A07Nv+PeF84YSHlPDpw10SgUgWEAazVP2IBPNgR4DlBgS26S8xS8WGJagfrIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
	79.171.149.172) smtp.rcpttodomain=lists.openembedded.org
	smtp.mailfrom=gomspace.com;
	dmarc=none action=none header.from=gomspace.com; 
	dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gomspace.com;
	s=selector2;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=58mjyHxmmpOFOELzMqsC+zYAVRoojJj8HrkeDrNLP+g=;
	b=K9RMkFvGlQGSVkKn6jZffYHXgfql78ZmLFkODCVZWiZ/nyL8oiupQdbqxBq9PrFQxDCz4yBC0hxtbqMCfJfhH3ECfDkWjUlbfEat5pxDqR7Ic8gcz3WJY1Z4YR7xajW4cBAHj2nm4KdBpb4zMwPLOZ+US0mfpJoR/YemDFl/VCI=
Received: from VI1PR0802CA0019.eurprd08.prod.outlook.com
	(2603:10a6:800:aa::29) by AM0PR08MB3762.eurprd08.prod.outlook.com
	(2603:10a6:208:100::25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2387.24;
	Mon, 28 Oct 2019 12:33:27 +0000
Received: from VE1EUR01FT016.eop-EUR01.prod.protection.outlook.com
	(2a01:111:f400:7e01::201) by VI1PR0802CA0019.outlook.office365.com
	(2603:10a6:800:aa::29) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2387.22 via
	Frontend Transport; Mon, 28 Oct 2019 12:33:27 +0000
Authentication-Results: spf=fail (sender IP is 79.171.149.172)
	smtp.mailfrom=gomspace.com; lists.openembedded.org;
	dkim=none (message not
	signed) header.d=none;lists.openembedded.org; dmarc=none action=none
	header.from=gomspace.com;
Received-SPF: Fail (protection.outlook.com: domain of gomspace.com does not
	designate 79.171.149.172 as permitted sender)
	receiver=protection.outlook.com; client-ip=79.171.149.172;
	helo=gomspace.com; 
Received: from gomspace.com (79.171.149.172) by
	VE1EUR01FT016.mail.protection.outlook.com (10.152.2.227) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
	15.20.2387.20 via Frontend Transport; Mon, 28 Oct 2019 12:33:27 +0000
Received: from Ex01.gomspace.lan (10.0.1.60) by Ex01.gomspace.lan (10.0.1.60)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1466.3;
	Mon, 28 Oct 2019 13:33:26 +0100
Received: from Ex01.gomspace.lan ([fe80::21fc:471c:6190:5f20]) by
	Ex01.gomspace.lan ([fe80::21fc:471c:6190:5f20%4]) with mapi id
	15.01.1466.003; Mon, 28 Oct 2019 13:33:26 +0100
From: Martin Siegumfeldt <mns@gomspace.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: Libiio Python Bindings
Thread-Index: AQHVjYlB7AHOO552xUGsKCbtXGPtaA==
Date: Mon, 28 Oct 2019 12:33:26 +0000
Message-ID: <595fa4eb0a404956aae3fa9a7a25ba12@gomspace.com>
Accept-Language: en-US, da-DK
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.0.8.211]
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:79.171.149.172; IPV:CAL; CTRY:DK; EFV:NLI;
	SFV:NSPM;
	SFS:(10019020)(346002)(376002)(396003)(136003)(39840400004)(1110001)(339900001)(199004)(189003)(6916009)(966005)(50466002)(40036005)(76130400001)(108616005)(7116003)(21086003)(102836004)(5640700003)(33026002)(86362001)(23756003)(5660300002)(186003)(6306002)(14454004)(3846002)(2501003)(36756003)(6116002)(8936002)(26005)(2351001)(81166006)(2906002)(70586007)(81156014)(8676002)(508600001)(356004)(476003)(4744005)(126002)(486006)(3480700005)(2616005)(8746002)(7736002)(305945005)(53416004)(47776003)(316002)(336012)(105606002)(26826003)(70206006)(24736004);
	DIR:OUT; SFP:1102; SCL:1; SRVR:AM0PR08MB3762; H:gomspace.com;
	FPR:; SPF:Fail; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8d081a3f-94de-4c27-7fd0-08d75ba30837
X-MS-TrafficTypeDiagnostic: AM0PR08MB3762:
X-MS-Exchange-PUrlCount: 1
X-Microsoft-Antispam-PRVS: <AM0PR08MB3762D8D50ECAA48C69ABEF6CC4660@AM0PR08MB3762.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-Forefront-PRVS: 0204F0BDE2
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mlbdHda4sL/ID8RSy9xTSPbhz6hBx4ZlgbMSzgLZREipAjZbMlcNn6oupxw4CbyH4zqiGeadG+Kmq9LTwmr95Zfi4wKr67xDx9k1cxkIR9KiokMJ7ZltbJ6Oebbcn0SaXat7kWiqIzFR+Wa02GKlVVLHueoL8l3SW5OJaI3L10S7Wg5D9hiqb9YCgevUeE9mgjOlxo6A8P1m+hjwHAf8HKU1EXwZg+j32/KImjLrPAp8166k7yS3ebqxZFFzG/GP+c6Qua+UZcqpiZZxkc0Ccx/iwv2ePUHiK44SeinFfXCC8rpKetNaosDK6lcVguEy5r0+w+mmFpsSBq97dsXXJA+7Zv3+i30ShdNxd48Yf/RSksP/7+ZuPf9WSjDP3Um8DcrQnqtryN6XQP+6Vo0yWMdU2QJA2WqrRPqp3Nbb2m8hTXVoswk8aj34FETJGqhB3ceqsdnTa93j12H1RLG8Gtx809PRzhxDYvddEjnrB6U=
X-OriginatorOrg: gomspace.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2019 12:33:27.0845 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d081a3f-94de-4c27-7fd0-08d75ba30837
X-MS-Exchange-CrossTenant-Id: 91ed1e54-6d8b-4599-84d8-65fe75fda3d1
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=91ed1e54-6d8b-4599-84d8-65fe75fda3d1;
	Ip=[79.171.149.172]; Helo=[gomspace.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3762
Subject: Libiio Python Bindings
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
X-List-Received-Date: Mon, 28 Oct 2019 12:33:28 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi,

I noticed that since http://lists.openembedded.org/pipermail/openembedded-d=
evel/2019-October/202502.html was merged, libiio started depending on 'pyth=
on3-core', even without any dependencies defined towards libiio-python3.=20

We use=20

RDEPENDS_${PN} +=3D "libiio"

for describing the (native library) dependency (i.e. without bindings), and

RDEPENDS_${PN} +=3D "libiio-${PYTHON_PN}"

for a dependency including the bindings - isn't this valid?

I assume, that a pure native library dependency (i.e. without python bindin=
gs) should not introduce any python core functionality?

Thanks,
Martin Siegumfeldt=

