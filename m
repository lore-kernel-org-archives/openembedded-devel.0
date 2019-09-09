Return-Path: <alexandretm@amotus.ca>
Received: from CAN01-QB1-obe.outbound.protection.outlook.com
	(mail-eopbgr660078.outbound.protection.outlook.com [40.107.66.78])
	by mail.openembedded.org (Postfix) with ESMTP id 94BB77EA27
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  9 Sep 2019 19:52:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=WAvMS6exHs202otkYANFwQ04IPZI4hQCycK9OCrW4ydyNx4uQ+tlUydteXX+2sV6z/PUFV1MAWZdIfXn4OD+lbeOSm1YPuagzaqMhwyXhv9JfK3mdvtJYemI7unDdK2A9MzYv/WfRnWYouDFxHvaOvtgRXJdmzlktbu3BScV2orGxvvUifh9qqTf5Qf/4k9PsL6OIl5N6fw2kFS9TvF84Cjd9OmY2S7u3zMB7ggxYFr5qeDy3zMOAiFoBdj3QPaqtPrW+pzdzMRlH8aKMzeTdAYXvao8OuriJ5bDnFSAH8T00C9sduWwz7LmF97MfzQ6/UcRyBjC1moaokDY1fqFYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=vNIxW3786PjbegTs1ju5GChytGCcA9O20gi9wyt9vDM=;
	b=GAcEabcU7t1mBP1Tym25eHMHSQ3CsNqArm9EUfKfE4Z6sB9SfQgcy0cfK+LkIUQUuMcHBk4QN58XefA19syabaPk9laIFC5zwJ1EOXH/KeU1U54bbS6a2Nabr6oKFTjb5f0gDOcS7TPzc9U2lndh/U8Q1clz5OkO/BmlApNUgF9NuyCiR8C+PueoBe4cLcXr2ZAmCwnJ/pb79EoY8LLLYr3rNNd//bQ130QwL9bVS6LQiVBRd0xKue59DQihy4gW7evyy2CjQ9WVVPePbgFJpxnTcPq+dwCNNSCHwCIlYNlVuNZ7FBmEiZlwzp5ODu0Vt2y2F1+j8WAPPgUCs0bS7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=amotus.ca; dmarc=pass action=none header.from=amotus.ca; 
	dkim=pass header.d=amotus.ca; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=dimonoff.onmicrosoft.com; s=selector2-dimonoff-onmicrosoft-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=vNIxW3786PjbegTs1ju5GChytGCcA9O20gi9wyt9vDM=;
	b=sNn70mLpIwktMh4HCgXtWKVzTP3G9V35ZnbIRAzkDgNuyPbSodCXSwGb9LcbfjJR3ISkNq+2FHAgpcZuzNAkvvVqIdSacnvRycx7rl5az8n7fJNMCeuuAJxpLiBBA1GCznfgTK/t5VgjJdiVSb90p1In8YqwFcwselQE5GdVLlY=
Received: from YT1PR01MB3225.CANPRD01.PROD.OUTLOOK.COM (10.255.40.207) by
	YT1PR01MB2585.CANPRD01.PROD.OUTLOOK.COM (10.255.42.27) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2241.18; Mon, 9 Sep 2019 19:52:16 +0000
Received: from YT1PR01MB3225.CANPRD01.PROD.OUTLOOK.COM
	([fe80::e453:f27b:744f:5ad3]) by
	YT1PR01MB3225.CANPRD01.PROD.OUTLOOK.COM
	([fe80::e453:f27b:744f:5ad3%6]) with mapi id 15.20.2241.018;
	Mon, 9 Sep 2019 19:52:16 +0000
From: =?utf-8?B?TWF0aGlldSBBbGV4YW5kcmUtVMOpdHJlYXVsdA==?=
	<alexandretm@amotus.ca>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: Support for OpenJDK 9+
Thread-Index: AQHVZ0gU5pgtlyO8106HiWTgwi9PtA==
Date: Mon, 9 Sep 2019 19:52:16 +0000
Message-ID: <b6f2c586-cb29-5015-ec35-ab2c7dcf8d4d@amotus.ca>
Accept-Language: en-CA, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [24.37.194.182]
x-clientproxiedby: YQXPR0101CA0070.CANPRD01.PROD.OUTLOOK.COM
	(2603:10b6:c00:14::47) To YT1PR01MB3225.CANPRD01.PROD.OUTLOOK.COM
	(2603:10b6:b01:3::15)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=alexandretm@amotus.ca; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b415b9de-652f-4c1f-4f08-08d7355f373c
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(7021145)(8989299)(4534185)(7022145)(4603075)(4627221)(201702281549075)(8990200)(7048125)(7024125)(7027125)(7023125)(5600166)(711020)(4605104)(1401327)(2017052603328)(7193020);
	SRVR:YT1PR01MB2585; 
x-ms-traffictypediagnostic: YT1PR01MB2585:
x-microsoft-antispam-prvs: <YT1PR01MB258561F40EFE29130D9DBF6DB2B70@YT1PR01MB2585.CANPRD01.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 01559F388D
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(366004)(39840400004)(376002)(346002)(396003)(136003)(189003)(199004)(5660300002)(25786009)(6916009)(31686004)(6436002)(486006)(2616005)(476003)(508600001)(102836004)(316002)(6116002)(3846002)(6486002)(186003)(2351001)(14454004)(99286004)(66066001)(81166006)(81156014)(8936002)(2906002)(26005)(85202003)(6506007)(386003)(305945005)(8676002)(53936002)(6512007)(66946007)(36756003)(5640700003)(71190400001)(7736002)(14444005)(256004)(558084003)(66476007)(66556008)(71200400001)(64756008)(66446008)(85182001)(31696002)(7116003)(86362001)(52116002)(2501003);
	DIR:OUT; SFP:1101; SCL:1; SRVR:YT1PR01MB2585;
	H:YT1PR01MB3225.CANPRD01.PROD.OUTLOOK.COM; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amotus.ca does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: lCSdrAh5rzAKKq9P7faexF3JEtuFEWYU6qnB+DAYxIc/tjKbDine9kZarK6P8EUhZY4xMm2wqAfUhYLS8Xg1kxubkM162FUoBoYGMGpOWUSCuaY2wzE3HoHD8qczmNbK6uL+mnxDrBN0WP33uyvfpdvG9WXzX9P45f4slKFYSTMLtnrKdb8WjMkbB7y7UFVlr8wK29aQu1e9zNIuMGlq4IEm6lxs9TyQWWjEq94vsjsa0j/rMspNXZTODYH5eDL+XC0ZDJbf3rFQYBsG8dHpWLHvP9SfGlSeN77Uye0dHyBzCb/VP6zb2mm4gKMxdp2ewigQm2MchOPWCF4LNG2f3gQq4rjM8eBn7dKl+mvQEbGddtxMYSgSKzM2h7WUWk0wxiS0W3IFgqrYs19NKHEFOlvXHrMRZLCkA6GclAZ5wcI=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: amotus.ca
X-MS-Exchange-CrossTenant-Network-Message-Id: b415b9de-652f-4c1f-4f08-08d7355f373c
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Sep 2019 19:52:16.1978 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c4063547-e5e6-4866-a386-58c3965da102
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RTev2fVrP/J61y3J0b0GWYyEJzMYNnIm1bHefVff/YaB/6g1M0oIr/UE7e8n/1fjpuRBwOGieHUJzlgy1n1Cwg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: YT1PR01MB2585
Subject: Support for OpenJDK 9+
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
X-List-Received-Date: Mon, 09 Sep 2019 19:52:17 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <8E7A188C0B020447B2485459A3956A40@CANPRD01.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64

SG93ZHksDQoNCldlIHJlY2VudGx5IGdvdCBhIHJlcXVlc3QgdG8gYWRkIHN1cHBvcnQgZm9yIEph
dmEoT3BlbkpkaykgOSsuDQpJIGNhbWUgdG8gd29uZGVyIGlmIHRoZXJlIHdhcyBhbnkgbGltaXRh
dGlvbnMgcHJldmVudGluZyB0aGUgdXNlIG9mIA0KT3BlbmpkayA5KyBvbiBhcm0/DQoNCkFueSBh
ZHZpc2Ugd2lsbCBiZSBhcHByZWNpYXRlZC4NCg0KQ2hlZXJzLA0KDQpNYXRoaWV1DQoNCg==

