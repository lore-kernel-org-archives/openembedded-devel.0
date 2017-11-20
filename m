Return-Path: <Jonathan.Haigh@arm.com>
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
	(mail-db5eur01on0078.outbound.protection.outlook.com [104.47.2.78])
	by mail.openembedded.org (Postfix) with ESMTP id 484E778524
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Nov 2017 00:49:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
	s=selector1-arm-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=/DjEm90eXkwbiYhCFP3H8fK5h4xRKZLAACec9YiQNT0=;
	b=Oxu1BIyY7gwyarJMxwoH+Vbnw63a6KOMlYN01vwZH1H8GMTUrIedMoxlhK84S0XHp+fGDgzpBYF7FpxT/8Uhwz5ShFFwABfhCumtnKB0u4h6/D+hil8/YZ6tovCkBeMwamoO1nWNvkUqgM2yE9/BMXRoYo20hb6Fx5ngFJszXDg=
Received: from DB6PR0802MB2229.eurprd08.prod.outlook.com (10.172.227.138) by
	DB6PR0802MB2230.eurprd08.prod.outlook.com (10.172.227.139) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.20.239.5;
	Mon, 20 Nov 2017 16:15:22 +0000
Received: from DB6PR0802MB2229.eurprd08.prod.outlook.com
	([fe80::60b3:4357:98e2:c2f3]) by
	DB6PR0802MB2229.eurprd08.prod.outlook.com
	([fe80::60b3:4357:98e2:c2f3%15]) with mapi id 15.20.0239.007;
	Mon, 20 Nov 2017 16:15:22 +0000
From: Jonathan Haigh <Jonathan.Haigh@arm.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [meta-python][PATCH] Allow native builds of python-asyn1crypto
Thread-Index: AQHTYfOUp9YgOQFtKUOIbKYSrhAiZqMdcPFY
Date: Mon, 20 Nov 2017 16:15:22 +0000
Message-ID: <DB6PR0802MB222932BF61D9B1CE9554690193220@DB6PR0802MB2229.eurprd08.prod.outlook.com>
References: <51e59e7c62e6420bb7e8b2a1960348951511177653-26373-1-git-send-email-jonathan.haigh@arm.com>
In-Reply-To: <51e59e7c62e6420bb7e8b2a1960348951511177653-26373-1-git-send-email-jonathan.haigh@arm.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Jonathan.Haigh@arm.com; 
x-originating-ip: [217.140.96.140]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; DB6PR0802MB2230;
	6:X8tkVnIAPCkQ2kp7MHRW9Aj8CLZInwbABAugFoieM733e7b6cNx7Z8j1y8IUAEiK67meMTlDK0dy7MgNxkEYupQY/QvZItHUnAADctD1XKOO4pSYdEGK3LjilLCOF6uIvKriP/eRvXlqW8wRCb+099oxCklJeI+sXA+3ODWZzo0pYlma27wRZW4wget86XsaT332ViVm+QQsVp28rqZINBrYLrG5m5r9XjUO5n7sBPrzwrG+HONgGioWEsOyRuoNmEc/nftrrJYGPfxzwMCq33APqLB9xJ1LpITbMGZLJZPHD+RIC5akT+WjRFsBcjBrXrwq0M25ROCVBYbz5n+oXLRt9b1DBfEsTwjJLsrougc=;
	5:dg5S1EX241uwFfmmRhTJsQ7XjBMpr3sv+7FHXU/PfntOFCxC/OQOhB+cDWtC5AOGt5v6LX9odhJPfgiogkpn/N/Td1RD9gakMetZHGWxQ5TaG+abjayKVBwQUAVPfhc9EU1Vf384xAhXQUyti/4XPLNDKBN+iAxLn/taiAACVOQ=;
	24:wmd0SJtOB96anHvOYwMNa+YPdHEhZGS3ju8jC5Ar0709vhgwVzAtFa0NTfJKM+RjTt+QIS1nInu3p2HruxKU33sQ1rZ6LA/t4R+KiLtcrlM=;
	7:BJqtnoZmdKXLVQ4VQHQRDm9o/QU6D3AWi40G96HM900Q6hAF/6aamJjfuS8cwlUApjkNjErSC1MkRCaP6shIHEcJxnd6DtMekQtZ1mfZwTiCQcR/VquH/62vmVCabqlJeuZD6IJ/LvdUYf/t6EHSOvhHLJFp1vH0GAxQNDafIsq7kfpsboThglL0hj9x0eaqWKOtDo2YD6oHS9hHRiTwZzwjDzCUBOmSPfMLtvk52qDdzPzDlpK/sILrqtCDswtX
x-ms-exchange-antispam-srfa-diagnostics: SSOS;
x-ms-office365-filtering-correlation-id: bc99900e-0dde-46da-970c-08d53031e6cf
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(22001)(4534020)(4602075)(4627115)(201703031133081)(201702281549075)(48565401081)(2017052603258);
	SRVR:DB6PR0802MB2230; 
x-ms-traffictypediagnostic: DB6PR0802MB2230:
x-microsoft-antispam-prvs: <DB6PR0802MB22309EFDB402836CF2F673F293220@DB6PR0802MB2230.eurprd08.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(180628864354917);
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(2401047)(5005006)(8121501046)(100000703101)(100105400095)(3002001)(3231022)(10201501046)(93006095)(93001095)(6055026)(6041248)(20161123555025)(20161123564025)(20161123560025)(20161123558100)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123562025)(6072148)(201708071742011)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:DB6PR0802MB2230; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:DB6PR0802MB2230; 
x-forefront-prvs: 04976078F0
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(6009001)(39860400002)(376002)(346002)(189002)(199003)(40434004)(9686003)(5640700003)(7736002)(14454004)(5890100001)(6916009)(2950100002)(3280700002)(189998001)(3660700001)(6606003)(105586002)(106356001)(102836003)(6116002)(55016002)(68736007)(3846002)(74316002)(7696004)(72206003)(316002)(53936002)(5660300001)(2501003)(8936002)(478600001)(8676002)(5250100002)(19627405001)(81156014)(81166006)(99286004)(6506006)(2906002)(86362001)(575784001)(2351001)(66066001)(76176999)(54356999)(50986999)(54896002)(25786009)(101416001)(33656002)(6436002)(97736004)(2900100001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:DB6PR0802MB2230;
	H:DB6PR0802MB2229.eurprd08.prod.outlook.com; FPR:; SPF:None;
	PTR:InfoNoRecords; MX:1; A:1; LANG:en; 
received-spf: None (protection.outlook.com: arm.com does not designate
	permitted sender hosts)
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc99900e-0dde-46da-970c-08d53031e6cf
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Nov 2017 16:15:22.5438 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0802MB2230
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: [meta-python][PATCH] Allow native builds of python-asyn1crypto
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
X-List-Received-Date: Tue, 21 Nov 2017 00:49:04 -0000
Content-Language: en-GB
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Add "native" to BBCLASSEXTEND to allow native builds.

Signed-off-by: Jonathan Haigh <jonathan.haigh@arm.com>
---
 meta-python/recipes-devtools/python/python-asn1crypto.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-python/recipes-devtools/python/python-asn1crypto.inc b/me=
ta-python/recipes-devtools/python/python-asn1crypto.inc
index 3bdb4b2..41b7342 100644
--- a/meta-python/recipes-devtools/python/python-asn1crypto.inc
+++ b/meta-python/recipes-devtools/python/python-asn1crypto.inc
@@ -10,3 +10,4 @@ SRC_URI[md5sum] =3D "97d54665c397b72b165768398dfdd876"
 SRC_URI[sha256sum] =3D "0874981329cfebb366d6584c3d16e913f2a0eb026c9463efcc=
4aaf42a9d94d70"

 inherit pypi
+BBCLASSEXTEND =3D "native"
--
2.7.4
IMPORTANT NOTICE: The contents of this email and any attachments are confid=
ential and may also be privileged. If you are not the intended recipient, p=
lease notify the sender immediately and do not disclose the contents to any=
 other person, use it for any purpose, or store or copy the information in =
any medium. Thank you.

