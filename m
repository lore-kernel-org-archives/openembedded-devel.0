Return-Path: <Jonathan.Haigh@arm.com>
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
	(mail-db5eur01on0060.outbound.protection.outlook.com [104.47.2.60])
	by mail.openembedded.org (Postfix) with ESMTP id 0598A787ED
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  6 Jul 2018 19:02:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
	s=selector1-arm-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=y1iix1BAMmFtIoNbJVESfruWeH+HqqcPns1f1rQ/qh0=;
	b=cqmQ4mDydtSAtebLgOO9fCb3wRpxhxys6RU2Bz0iskulzDyw0fjUTSJpuogk8KIGwQSIqCxBAtXU2WiDdlREWbzO/wuSP0lzL5f1mgR+Vo+3ZW9U6DGxtwNvsKHR8VDum4lTbO0NVWSQlzE5SwX/SED/xSHu+HwahdsKjEDwZKA=
Received: from DB5PR08MB0888.eurprd08.prod.outlook.com (10.164.43.30) by
	DB5PR08MB0982.eurprd08.prod.outlook.com (10.166.13.153) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.930.19; Fri, 6 Jul 2018 10:28:17 +0000
Received: from DB5PR08MB0888.eurprd08.prod.outlook.com
	([fe80::d004:d47f:8a18:ac18]) by
	DB5PR08MB0888.eurprd08.prod.outlook.com
	([fe80::d004:d47f:8a18:ac18%3]) with mapi id 15.20.0930.016;
	Fri, 6 Jul 2018 10:28:17 +0000
From: Jonathan Haigh <Jonathan.Haigh@arm.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [PATCH] kernel-devicetree.bbclass: DTB make targets may contain
	path components
Thread-Index: AQHUFFH1NPowGlLtokWoO3sI/rlkxqSB/xp7
Date: Fri, 6 Jul 2018 10:28:17 +0000
Message-ID: <DB5PR08MB0888D243F1C828A518CBA90C93470@DB5PR08MB0888.eurprd08.prod.outlook.com>
References: <9a8e4137ac914b168091b71d755d54281530789529-12623-1-git-send-email-jonathan.haigh@arm.com>
In-Reply-To: <9a8e4137ac914b168091b71d755d54281530789529-12623-1-git-send-email-jonathan.haigh@arm.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Jonathan.Haigh@arm.com; 
x-originating-ip: [217.140.96.140]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; DB5PR08MB0982;
	7:7FqqABiYHM7omjF83OBKRL3II67WeU09ltNrPXiuy8fbI161St6dSLP7zl1vUSZu5je/gpCfJXUrLx/6lGpQpFFH6L6Ys0sN3n3Np3+mYRJgS9cNQA82Iisefvg5OYv09M6kKM5xDfaAeDjXiqW/hL4UW7Wl39s+Eqkn/asH91Pn9urtye3VNl3HJlI9iXFX/q5+5ne09xaVyQz+Oz8crC8yGeZsFtznzBidrHs7aKrdtxkkmEws74PWK5zro89b
x-ms-exchange-antispam-srfa-diagnostics: SOS;SOR;
x-ms-office365-filtering-correlation-id: 7f7ac1a3-5dc2-45d9-015d-08d5e32b3053
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652040)(8989117)(5600053)(711020)(48565401081)(2017052603328)(7153060)(7193020);
	SRVR:DB5PR08MB0982; 
x-ms-traffictypediagnostic: DB5PR08MB0982:
x-microsoft-antispam-prvs: <DB5PR08MB0982E077713325400B2DFADF93470@DB5PR08MB0982.eurprd08.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(180628864354917)(223705240517415);
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(5005006)(8121501046)(93006095)(93001095)(3231254)(944501410)(52105095)(10201501046)(3002001)(6055026)(149027)(150027)(6041310)(20161123560045)(20161123562045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123558120)(20161123564045)(6072148)(201708071742011)(7699016);
	SRVR:DB5PR08MB0982; BCL:0; PCL:0; RULEID:; SRVR:DB5PR08MB0982; 
x-forefront-prvs: 0725D9E8D0
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(39860400002)(396003)(366004)(346002)(376002)(136003)(189003)(199004)(40434004)(9686003)(7696005)(6436002)(8676002)(2351001)(55016002)(53936002)(4326008)(105586002)(5660300001)(11346002)(446003)(33656002)(81156014)(486006)(81166006)(8936002)(476003)(72206003)(6506007)(5640700003)(256004)(2906002)(14444005)(6246003)(229853002)(68736007)(76176011)(106356001)(5250100002)(305945005)(2900100001)(7736002)(6116002)(3846002)(5024004)(97736004)(99286004)(102836004)(86362001)(478600001)(66066001)(25786009)(316002)(14454004)(2501003)(74316002)(6916009)(26005);
	DIR:OUT; SFP:1101; SCL:1; SRVR:DB5PR08MB0982;
	H:DB5PR08MB0888.eurprd08.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
	permitted sender hosts)
x-microsoft-antispam-message-info: J8T4R1KQ7TeZWAw3UTGo0UODl7gpCD7Ml4CDgsnmEUyEO58AUbP8CGj5HtTXhrZlMKlVLNdzwDF5C61jlXvvda9EHRz3mkrgNlUCJUQ0QjQNt3kF7zGDQCbeKza0fZt4Qy5u4LTr7gx+RJgiHgs0f2VoICm2SmoJaQo1A90W2P7iYz7HOYcpKuVD14SplOQN7hDu1Zp1vUKmX7px7B3U0abScL01+ng+QHhbXN5shWEU5atnS9yj8PNpbCspYDLssSRfzz0f32Ht8kwPOqXPmSleEZCIWiTgEcj+s8EpySeNEJ8BeolhTcPglTG91wh1JNjzGeQ2ZcTDd+FnaMtI+9Yut2DYA35vPOdaWlJpORg=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f7ac1a3-5dc2-45d9-015d-08d5e32b3053
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jul 2018 10:28:17.5327 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB5PR08MB0982
Cc: Jeremy Johnson <Jeremy.Johnson@arm.com>
Subject: Re: [PATCH] kernel-devicetree.bbclass: DTB make targets may contain path components
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
X-List-Received-Date: Fri, 06 Jul 2018 19:02:36 -0000
Content-Language: en-GB
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

normalize_dtb() turns DTS and DTB paths into values that can be used as
make targets. These make targets sometimes contain some directory component=
s
so 'basename' is not suitable for turning the paths into make targets -
we should only strip off leading directory components of the path up to
and including the 'dts' directory (if it exists). For example:
* 'overlays/at86rf233.dtbo' should not be changed.
* 'some/directory/path/dts/overlays/at86rf233.dtbo' should be changed to
  'overlays/at86rf233.dtbo' rather than just 'at86rf233.dtbo'

Signed-off-by: Jonathan Haigh <jonathan.haigh@arm.com>
---
 meta/classes/kernel-devicetree.bbclass | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/classes/kernel-devicetree.bbclass b/meta/classes/kernel-d=
evicetree.bbclass
index 9866d84..0ffa8e9 100644
--- a/meta/classes/kernel-devicetree.bbclass
+++ b/meta/classes/kernel-devicetree.bbclass
@@ -12,9 +12,10 @@ KERNEL_DEVICETREE_BUNDLE ?=3D "0"
 normalize_dtb () {
         DTB=3D"$1"
         if echo ${DTB} | grep -q '/dts/'; then
-               bbwarn "${DTB} contains the full path to the the dts file, =
but only the dtb name should be used."
+               bbwarn "${DTB} contains the full path to the the dts file, =
but the path should be relative to the dts directory."
+               DTB=3D`echo "${DTB}" | sed 's,^.*/dts/,,'`
         fi
-       DTB=3D`basename ${DTB} | sed 's,\.dts$,.dtb,g'`
+       DTB=3D`echo "${DTB}" | sed 's,\.dts$,.dtb,g'`
         echo "${DTB}"
 }

--
2.7.4


IMPORTANT NOTICE: The contents of this email and any attachments are confid=
ential and may also be privileged. If you are not the intended recipient, p=
lease notify the sender immediately and do not disclose the contents to any=
 other person, use it for any purpose, or store or copy the information in =
any medium. Thank you.

