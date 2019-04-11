Return-Path: <prvs=99731c0ad=Alistair.Francis@wdc.com>
Received: from esa4.hgst.iphmx.com (esa4.hgst.iphmx.com [216.71.154.42])
	by mail.openembedded.org (Postfix) with ESMTP id 1A0647D44F
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Apr 2019 21:34:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1555018476; x=1586554476;
	h=from:to:cc:subject:date:message-id:
	content-transfer-encoding:mime-version;
	bh=BwUapohqFyYBfRR+XGO4190jNJV+VPa2M4LVN4xbOKU=;
	b=R5su8vqMxrg7S2u46x8/YEJ7Bos6PPEPE8lwITgoadDBD+8dVMXLP3TG
	xuKUh+/2zFPrzpAF0DsZ1qrhGPiEDL/JDEKYhKqFb1bDIk86pCgFjye4l
	RIYTihvSU9EHgAoU8hw8+YEsg3TU4zYeRwtO6oF3okNFQ6w+dHOAspS0K
	C5cagLF9V6BHqDghj8kuvlYSoSle4qZ2daQANqX+DLUBOVak3ek5MnYoo
	B7vXdg6otw9mDoLPi563wobh5MiEdrXTXX3LUF/2bdyhhH+qjNmwraHxu
	VpG9VVX+nBumdrfb3X4rD+SzkYdxNtDn1+A866TewAKw+/tK5u6Ackm2i A==;
X-IronPort-AV: E=Sophos;i="5.60,338,1549900800"; d="scan'208";a="105640878"
Received: from mail-by2nam01lp2051.outbound.protection.outlook.com (HELO
	NAM01-BY2-obe.outbound.protection.outlook.com) ([104.47.34.51])
	by ob1.hgst.iphmx.com with ESMTP; 12 Apr 2019 05:34:35 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=BwUapohqFyYBfRR+XGO4190jNJV+VPa2M4LVN4xbOKU=;
	b=nqu6lNxLXpeN2IVDiZTZj5Y0mUUu0iZ0WQ6BIwHmrQsnci6v5+L8qFA+5MNeeGho4bwr91swv/cl2c+n6Yx3u7XHH6AmtXSF3lO7hG56+hyh6PiKddYxznNimt6KL2tiN8mlWzw8201MOEix6lwfRp4ZJStRXriBYqzRzVLz1+4=
Received: from DM6PR04MB4908.namprd04.prod.outlook.com (20.176.109.81) by
	DM6PR04MB4025.namprd04.prod.outlook.com (20.176.87.138) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1792.17; Thu, 11 Apr 2019 21:34:33 +0000
Received: from DM6PR04MB4908.namprd04.prod.outlook.com
	([fe80::9ba:6028:ae27:7d2]) by DM6PR04MB4908.namprd04.prod.outlook.com
	([fe80::9ba:6028:ae27:7d2%2]) with mapi id 15.20.1771.019;
	Thu, 11 Apr 2019 21:34:33 +0000
From: Alistair Francis <Alistair.Francis@wdc.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [meta-java][PATCH] layer.conf: Mark warrior as supported
Thread-Index: AQHU8K5aI4QhPbykDU6SZ4Pgvcsbiw==
Date: Thu, 11 Apr 2019 21:34:33 +0000
Message-ID: <20190411213317.20935-1-alistair.francis@wdc.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.21.0
x-clientproxiedby: BYAPR05CA0048.namprd05.prod.outlook.com
	(2603:10b6:a03:74::25) To DM6PR04MB4908.namprd04.prod.outlook.com
	(2603:10b6:5:19::17)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Alistair.Francis@wdc.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [199.255.44.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7ecfffeb-62fb-4159-f116-08d6bec57c99
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600139)(711020)(4605104)(4618075)(2017052603328)(7193020);
	SRVR:DM6PR04MB4025; 
x-ms-traffictypediagnostic: DM6PR04MB4025:
wdcipoutbound: EOP-TRUE
x-microsoft-antispam-prvs: <DM6PR04MB40251FFF1D2889BEB3E8476A902F0@DM6PR04MB4025.namprd04.prod.outlook.com>
x-forefront-prvs: 00046D390F
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(376002)(366004)(396003)(346002)(136003)(39860400002)(199004)(189003)(71190400001)(71200400001)(6436002)(44832011)(68736007)(105586002)(6486002)(6916009)(14454004)(53936002)(25786009)(5640700003)(6512007)(5660300002)(186003)(26005)(102836004)(6506007)(386003)(52116002)(4326008)(2616005)(486006)(476003)(2906002)(6116002)(3846002)(99286004)(54906003)(2501003)(81156014)(8676002)(81166006)(8936002)(97736004)(50226002)(316002)(2351001)(72206003)(106356001)(36756003)(7736002)(305945005)(478600001)(4744005)(66066001)(86362001)(14444005)(256004)(1076003);
	DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR04MB4025;
	H:DM6PR04MB4908.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: luxW1Mkr5mb3L8h+zqJ283RYQtgdh/zrJPp3+0i8ZZBI2E7VjbFn/fdDye/mkupt8YFOVXtnfua897YROIRzt6KN0eI0JOxYH9jUVET/cBk6HP21dNduOLIH6NjaaIvrjhDdDdTSMbXH3DudZODdL8hMJ5StejizXXqPpYCyhJUd+CxSQ+JVYHjMhYXmkbiGoykvpAlCrCmu4by8b2wpV2xzkFfkF/bKmv5+a8JxJLpZPHskEaZgwzyT5hlgIjsuKTFNAybktxKFQIeTvWNNUNBOQqGWpIOj7pLxy7N5ysPNODxko3Pjec/vQ1Qd55w+vtnDVuDZ2jxs6QKrVcz5+KdTD2DQidwbrjfb3PYN59GpLh5littVIUC23SJ8ccxtOGjbt/H6XUV77rZNvA7jg02n9hJrHdlchLewEvV5cbM=
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ecfffeb-62fb-4159-f116-08d6bec57c99
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Apr 2019 21:34:33.0584 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR04MB4025
Subject: [meta-java][PATCH] layer.conf: Mark warrior as supported
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
X-List-Received-Date: Thu, 11 Apr 2019 21:34:34 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

U2lnbmVkLW9mZi1ieTogQWxpc3RhaXIgRnJhbmNpcyA8YWxpc3RhaXIuZnJhbmNpc0B3ZGMuY29t
Pg0KLS0tDQogY29uZi9sYXllci5jb25mIHwgMiArLQ0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2Vy
dGlvbigrKSwgMSBkZWxldGlvbigtKQ0KDQpkaWZmIC0tZ2l0IGEvY29uZi9sYXllci5jb25mIGIv
Y29uZi9sYXllci5jb25mDQppbmRleCBiMDNhNjA4Li45MDIzNmJlIDEwMDY0NA0KLS0tIGEvY29u
Zi9sYXllci5jb25mDQorKysgYi9jb25mL2xheWVyLmNvbmYNCkBAIC03LDcgKzcsNyBAQCBCQkZJ
TEVTICs9ICIke0xBWUVSRElSfS9yZWNpcGVzKi8qLyouYmIgJHtMQVlFUkRJUn0vcmVjaXBlcyov
Ki8qLmJiYXBwZW5kIg0KIEJCRklMRV9DT0xMRUNUSU9OUyArPSAibWV0YS1qYXZhIg0KIEJCRklM
RV9QQVRURVJOX21ldGEtamF2YSA6PSAiXiR7TEFZRVJESVJ9LyINCiBCQkZJTEVfUFJJT1JJVFlf
bWV0YS1qYXZhID0gIjEwIg0KLUxBWUVSU0VSSUVTX0NPTVBBVF9tZXRhLWphdmEgPSAidGh1ZCIN
CitMQVlFUlNFUklFU19DT01QQVRfbWV0YS1qYXZhID0gInRodWQgd2FycmlvciINCiANCiBMSUNF
TlNFX1BBVEggKz0gIiR7TEFZRVJESVJ9L2xpY2Vuc2VzIg0KIA0KLS0gDQoyLjIxLjANCg0K

