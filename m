Return-Path: <Hugues.Kamba@arm.com>
X-Greylist: delayed 3566 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 02 Nov 2018 12:50:24 UTC
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
	(mail-db5eur01on0080.outbound.protection.outlook.com [104.47.2.80])
	by mail.openembedded.org (Postfix) with ESMTP id 2BDC979F30
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  2 Nov 2018 12:50:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
	s=selector1-arm-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=jxuEfUIM1i1skvKDUqAAPN/UaW32PwKNN+ORL7R2DuY=;
	b=prFTkWoGExICC62DpcVcu1nJaM5GmQbKidmDrkbDS+Je98yntOTWUe3epPsTldgyfM0w3CTa7pzrmpotlDsKrpl8M0KkRSg97LLAGo6rOTen0MZ0/kkcQUUpR/Go8oJs6sdy9rLR4ncUwTrOlmODmK7+B5OBI5cCB9piz3ECRO4=
Received: from VI1PR08MB3631.eurprd08.prod.outlook.com (20.177.61.82) by
	VI1PR08MB3213.eurprd08.prod.outlook.com (52.133.15.153) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1294.21; Fri, 2 Nov 2018 09:16:47 +0000
Received: from VI1PR08MB3631.eurprd08.prod.outlook.com
	([fe80::545d:f7d:7c9e:bf11]) by VI1PR08MB3631.eurprd08.prod.outlook.com
	([fe80::545d:f7d:7c9e:bf11%2]) with mapi id 15.20.1273.030;
	Fri, 2 Nov 2018 09:16:47 +0000
From: Hugues Kamba <Hugues.Kamba@arm.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [meta-oe][PATCH] lvm2: Update source location
Thread-Index: AQHUcozHxENafS+vQkqPT8rqeEuxwQ==
Date: Fri, 2 Nov 2018 09:16:47 +0000
Message-ID: <1541150188-11814-1-git-send-email-hugues.kamba@arm.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: LO2P265CA0015.GBRP265.PROD.OUTLOOK.COM
	(2603:10a6:600:62::27) To VI1PR08MB3631.eurprd08.prod.outlook.com
	(2603:10a6:803:85::18)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Hugues.Kamba@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [217.140.106.50]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; VI1PR08MB3213;
	6:cXGLyj8zerB4F72Jn22UqiAZD+1rH8JPQ+AKKCdzIlTGzgs5TW/yjPNtdj5/AKCTWTWoNJ6KcEvebhBS5O3JDNy5SLHAQvdblHxHRxNLF+VwGYViF/lme8qe48I0wf9TLNXCMm8KTXs0gC8fy9g9V6z8fHYnHPu5pA7/96mYVh5UPrQPTnkVg2svJQRqnKvOPb4SoUA/WwtG81h52y2T2tD2tgeyu9E09bOYkqjmU4YDPjnjhH9GH3YheOse9zrdv11jBiIwLtvOVCUC8uyo/ih084LpqvwJy2eT6MDb/NPcFULEUdFuDljyzs8GNwCd/7+20ektSIIs3WcMIh5b7u3nZSDIUXCfh5fEXWxZKtHt9H/LJ2HTjiVud4M7lL6Ulje59MwdKuhVsI2uQcMzA1dNgdL8QD5u0eVeSS3N7DQ837c7KjFI4H1/OPfrJTfXEsLdJGcfZifrz6daQ6layw==;
	5:r0grtxCTIJp+KW0heaJYpCiA3LW4sQc17ZoBSJ3ENuTiLAL9MQWmGjejRLaOPKOPR+CeEMptjw4JblVnFJkb2TnIE280UIW65Wc+9ylF3ERdt7yfuh7toqw+V7aQe4liexBmhWaI2lwvibNQeCFCUJ6ivrLG/q0L/d8PVqHOyWI=;
	7:oNWvzV+s9RXwRcN3BVgmBIw0dVX39VBRCv46jxs9gS0/2cvVSRw5Al443bCGa92BdOLFdMzlqXhmbMt5rvuXx8a5eXU/k9I1n3PYm/ZETSh8tCET2ErHRCo1jv2tTqBbYj1UaSlVSfOrsb5S7Reg9w==
x-ms-office365-filtering-correlation-id: 7bea3a66-d3ef-434e-2744-08d640a3ea0a
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(4618075)(2017052603328)(7153060)(7193020);
	SRVR:VI1PR08MB3213; 
x-ms-traffictypediagnostic: VI1PR08MB3213:
x-microsoft-antispam-prvs: <VI1PR08MB3213C7FFD7B401B923FDF65598CF0@VI1PR08MB3213.eurprd08.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(180628864354917);
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(5005006)(8121501046)(3002001)(10201501046)(93006095)(93001095)(3231382)(944501410)(52105095)(6055026)(148016)(149066)(150057)(6041310)(20161123564045)(20161123562045)(20161123558120)(20161123560045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(201708071742011)(7699051)(76991095);
	SRVR:VI1PR08MB3213; BCL:0; PCL:0; RULEID:; SRVR:VI1PR08MB3213; 
x-forefront-prvs: 08444C7C87
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(346002)(396003)(366004)(39860400002)(136003)(376002)(199004)(189003)(40434004)(478600001)(15650500001)(6512007)(52116002)(72206003)(86362001)(3846002)(6116002)(66066001)(99286004)(316002)(5660300001)(305945005)(8676002)(2900100001)(7736002)(6436002)(6486002)(105586002)(5640700003)(8936002)(71190400001)(106356001)(81166006)(71200400001)(81156014)(6916009)(14454004)(2351001)(44832011)(486006)(476003)(1857600001)(186003)(256004)(2501003)(2906002)(14444005)(5024004)(68736007)(97736004)(26005)(386003)(6506007)(2616005)(102836004)(53936002)(25786009)(36756003);
	DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR08MB3213;
	H:VI1PR08MB3631.eurprd08.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
	permitted sender hosts)
x-microsoft-antispam-message-info: AXe6JQo6fzBOQTTrXqmmrr+e/AL666z35wNYEBJAZkk/lICIUGqobaOFbxvMBvY18NG/afH7lqe+zS6jgpDklUWJZnQ0IvTksIBuxEHARQPbSD9TuXjrSOl28kYrYCtdTyhAMYpeoTVJr4Yq6dtQXqERSt42LRN1xs9yTI0ZcwLLKrC3Oez6EUKytfONhlUi0YAet9hWT+JeXGhvSzui15s//1tzspTc5rEFCCEsslL6nAJ0e0okPGR1epy2//A8wmA5lmM3U24HBVX9KPihd9MvaG2RbxiROQhyK9Z682qB+DDOYOHYrZq8LvyIHNnsCEh50JUeV7h7Ud5dE5FztGq9o6o4Bq3SPbvAN6qjk1w=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7bea3a66-d3ef-434e-2744-08d640a3ea0a
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Nov 2018 09:16:47.4884 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3213
Subject: [meta-oe][PATCH] lvm2: Update source location
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
X-List-Received-Date: Fri, 02 Nov 2018 12:50:25 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Hugues Kamba <hugues.kamba@arm.com>
---
 meta-oe/recipes-support/lvm2/lvm2.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/lvm2/lvm2.inc b/meta-oe/recipes-suppor=
t/lvm2/lvm2.inc
index 5728d83..039ed33 100644
--- a/meta-oe/recipes-support/lvm2/lvm2.inc
+++ b/meta-oe/recipes-support/lvm2/lvm2.inc
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D12713b4d9386533f=
eeb07d6e4831765a \

 DEPENDS +=3D "util-linux libaio"

-SRC_URI =3D "ftp://sources.redhat.com/pub/lvm2/old/LVM2.${PV}.tgz \
+SRC_URI =3D "ftp://sources.redhat.com/pub/lvm2/releases/LVM2.${PV}.tgz \
            file://lvm.conf \
            file://0001-implement-libc-specific-reopen_stream.patch \
            file://0002-Guard-use-of-mallinfo-with-__GLIBC__.patch \
--
2.7.4

IMPORTANT NOTICE: The contents of this email and any attachments are confid=
ential and may also be privileged. If you are not the intended recipient, p=
lease notify the sender immediately and do not disclose the contents to any=
 other person, use it for any purpose, or store or copy the information in =
any medium. Thank you.

