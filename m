Return-Path: <prvs=001f98f39=Alistair.Francis@wdc.com>
Received: from esa6.hgst.iphmx.com (esa6.hgst.iphmx.com [216.71.154.45])
	by mail.openembedded.org (Postfix) with ESMTP id 837826B436
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Apr 2019 18:53:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1555354394; x=1586890394;
	h=from:to:cc:subject:date:message-id:
	content-transfer-encoding:mime-version;
	bh=cHOwLS5plVr5pu/lKxGB2QjyfXDg3YaEDn/rUPxAtNI=;
	b=ZOtkWtRTBmwNsSKoDg+SEID5oW8pSjX+Q47wEYtkKRPG/UMNUDjnki26
	MH38kkbwy5O38EfBACH5hMAKcGQGiW77m+n3PRcbl8qIu0zibchFS1l90
	oPr6JxO8B38638j3nhUJQ0fQi7T1anT5fy8ZEMt8m9l7XyQvf3mbTlAGS
	+tzwVRlj83zd+RvY1lpPIZMCo4a2olEN5qz8sVsklzr0nxJiIyasM7lH+
	wurkX8giFQMgwkjaQ0Gj/2e8rATWAvsaf8R0PswuXkdbRjXgopQam534a
	Wo6CmEiQGMCHr6/DhmFi7fQlHL+iwCLsofuG9ql0sWEBHsGzzyc6q1Pci g==;
X-IronPort-AV: E=Sophos;i="5.60,354,1549900800"; d="scan'208";a="107759913"
Received: from mail-sn1nam02lp2058.outbound.protection.outlook.com (HELO
	NAM02-SN1-obe.outbound.protection.outlook.com) ([104.47.36.58])
	by ob1.hgst.iphmx.com with ESMTP; 16 Apr 2019 02:53:13 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=cHOwLS5plVr5pu/lKxGB2QjyfXDg3YaEDn/rUPxAtNI=;
	b=RhOOS8rkVtRB1Nxw5ZI9TdTTe1KzwgpxYlhLpj+5JAF9oT9rO+c0BCfhvNHPeOFhHn3tEwEANEkgYBIm9vmP9BiTlJtsWn/5u9XgqNnuqUEOu4tWYOH8KdbmtbuoipYbZTSGvjSDW8wqAr9C/SVYFsSGTV0uhmfOa5XcWKhLe6s=
Received: from BYAPR04MB4901.namprd04.prod.outlook.com (52.135.232.206) by
	BYAPR04MB5414.namprd04.prod.outlook.com (20.178.50.223) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1792.19; Mon, 15 Apr 2019 18:53:09 +0000
Received: from BYAPR04MB4901.namprd04.prod.outlook.com
	([fe80::44e8:bd21:17b:348c]) by BYAPR04MB4901.namprd04.prod.outlook.com
	([fe80::44e8:bd21:17b:348c%4]) with mapi id 15.20.1792.018;
	Mon, 15 Apr 2019 18:53:09 +0000
From: Alistair Francis <Alistair.Francis@wdc.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [meta-multimedia][PATCH 1/2] mycroft: Update the systemd service
	to ensure we are ready to start
Thread-Index: AQHU87x4J82y1ZGYeUuGEjhhSPS81w==
Date: Mon, 15 Apr 2019 18:53:09 +0000
Message-ID: <20190415185146.14189-1-alistair.francis@wdc.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.21.0
x-clientproxiedby: BYAPR11CA0054.namprd11.prod.outlook.com
	(2603:10b6:a03:80::31) To BYAPR04MB4901.namprd04.prod.outlook.com
	(2603:10b6:a03:4f::14)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Alistair.Francis@wdc.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [199.255.44.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: daa0d561-ba47-4d30-950b-08d6c1d39a6d
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(5600140)(711020)(4605104)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
	SRVR:BYAPR04MB5414; 
x-ms-traffictypediagnostic: BYAPR04MB5414:
wdcipoutbound: EOP-TRUE
x-microsoft-antispam-prvs: <BYAPR04MB54149D0D24FCEDF24ADAFECD902B0@BYAPR04MB5414.namprd04.prod.outlook.com>
x-forefront-prvs: 000800954F
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(39860400002)(366004)(136003)(396003)(346002)(376002)(189003)(199004)(6916009)(71190400001)(66066001)(8936002)(105586002)(5640700003)(106356001)(4744005)(68736007)(52116002)(81156014)(86362001)(50226002)(1076003)(71200400001)(81166006)(8676002)(54906003)(7736002)(97736004)(6512007)(2351001)(99286004)(316002)(2501003)(6506007)(26005)(14454004)(72206003)(476003)(486006)(6486002)(5660300002)(305945005)(44832011)(186003)(2616005)(2906002)(36756003)(3846002)(478600001)(6436002)(386003)(53936002)(102836004)(256004)(25786009)(6116002)(4326008);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BYAPR04MB5414;
	H:BYAPR04MB4901.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: VtW1eo/M+uxeSSX7DYcf1p/A8i5kbxuz+5n0gG6o+7/2GDyzAq5LtFWu7ZIBt15VE4s/l1Ff4ImMmTCZLjNI68XyKB3OHD1kZtZC8bGQGDdRFCOENyXKbe6v9eelVQCdA9yiyC78p5L+r+oP2lduJaHZr0PYwIrO2cbcM4RKI4WN2d2k8lCe6PwZp+zP3tH2bvZ/1m3Cj3qFaGkdrNWVEdhev4HTFP9qTmbC5oY9wLMqpj2D1LqVK85tFIvrraNjYa7jTUhMxce/52t8y+SRQZ6SZdXGUJaKMAo5Giw25gkTE/Z40edr5HLQpVy5nFk0fZ6F/ow01kXPQDBdSzuOrjjseHXtZa7wcI5LbOXpN6SMWGC++GqerIiMGDKD3IeHJaVrfjUwf3ag8k1GLiA4HnWbsnxHxS/W86///6dbFTg=
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: daa0d561-ba47-4d30-950b-08d6c1d39a6d
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Apr 2019 18:53:09.5599 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR04MB5414
Subject: [meta-multimedia][PATCH 1/2] mycroft: Update the systemd service to ensure we are ready to start
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
X-List-Received-Date: Mon, 15 Apr 2019 18:53:12 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

U2lnbmVkLW9mZi1ieTogQWxpc3RhaXIgRnJhbmNpcyA8YWxpc3RhaXIuZnJhbmNpc0B3ZGMuY29t
Pg0KLS0tDQogLi4uL3JlY2lwZXMtbXVsdGltZWRpYS9teWNyb2Z0L2ZpbGVzL215Y3JvZnQuc2Vy
dmljZSAgICAgICAgIHwgNSArKystLQ0KIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyks
IDIgZGVsZXRpb25zKC0pDQoNCmRpZmYgLS1naXQgYS9tZXRhLW11bHRpbWVkaWEvcmVjaXBlcy1t
dWx0aW1lZGlhL215Y3JvZnQvZmlsZXMvbXljcm9mdC5zZXJ2aWNlIGIvbWV0YS1tdWx0aW1lZGlh
L3JlY2lwZXMtbXVsdGltZWRpYS9teWNyb2Z0L2ZpbGVzL215Y3JvZnQuc2VydmljZQ0KaW5kZXgg
MDRjZjQzNjIwLi4yODcyOWY2YjEgMTAwNjQ0DQotLS0gYS9tZXRhLW11bHRpbWVkaWEvcmVjaXBl
cy1tdWx0aW1lZGlhL215Y3JvZnQvZmlsZXMvbXljcm9mdC5zZXJ2aWNlDQorKysgYi9tZXRhLW11
bHRpbWVkaWEvcmVjaXBlcy1tdWx0aW1lZGlhL215Y3JvZnQvZmlsZXMvbXljcm9mdC5zZXJ2aWNl
DQpAQCAtMSwxMCArMSwxMSBAQA0KIFtVbml0XQ0KIERlc2NyaXB0aW9uPU15Y3JvZnQNCi1EZWZh
dWx0RGVwZW5kZW5jaWVzPW5vDQotQWZ0ZXI9bXljcm9mdC1zZXR1cA0KK1JlcXVpcmVzTW91bnRz
Rm9yPS92YXINCitBZnRlcj1teWNyb2Z0LXNldHVwLnNlcnZpY2UNCiANCiBbU2VydmljZV0NCiBU
eXBlPWZvcmtpbmcNCitXb3JraW5nRGlyZWN0b3J5PUBMSUJESVJAL215Y3JvZnQNCiBFeGVjU3Rh
cnRQcmU9bWtkaXIgLXAgL3Zhci9sb2cvbXljcm9mdA0KIEV4ZWNTdGFydD1ATElCRElSQC9teWNy
b2Z0L3N0YXJ0LW15Y3JvZnQuc2ggYWxsDQogRXhlY1N0b3A9QExJQkRJUkAvbXljcm9mdC9zdG9w
LW15Y3JvZnQuc2ggYWxsDQotLSANCjIuMjEuMA0KDQo=

