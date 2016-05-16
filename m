Return-Path: <neenareddy.busireddy@nxp.com>
Received: from emea01-am1-obe.outbound.protection.outlook.com
	(mail-am1on0055.outbound.protection.outlook.com [157.56.112.55])
	by mail.openembedded.org (Postfix) with ESMTP id 2513565C8A
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 May 2016 18:57:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
	s=selector1-nxp-com;
	h=From:To:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=qZ5awa+4IuU1RklKVHn70avzMQ7KAzsKCg6zPvKoQ+c=;
	b=PtQ4PL4wcZpsJpVmSJF3hDLw84YOiczZFpNg3zZWX9L2ecAMUfpQTxjUTKTJZ+koCJyby6DTrMhk7cF3teOixBTsWXwAJZWlQRy315ZjZ6jZiBFdmEnPBBQytRH+4XFlgpUJUJJcg3v2NCVn1TWu6cIIGujmGniB/iD2U4b5GcY=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
	header.d=none; lists.openembedded.org;
	dmarc=none action=none header.from=nxp.com;
Received: from change-01.am.freescale.net (192.88.168.50) by
	AM4PR04MB1571.eurprd04.prod.outlook.com (10.164.78.141) with Microsoft
	SMTP Server (TLS) id 15.1.497.12; Mon, 16 May 2016 18:42:19 +0000
From: Neena Busireddy <neenareddy.busireddy@nxp.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 16 May 2016 13:40:30 -0500
Message-ID: <1463424030-12245-1-git-send-email-neenareddy.busireddy@nxp.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [192.88.168.50]
X-ClientProxiedBy: SN2PR10CA0030.namprd10.prod.outlook.com (10.160.12.168) To
	AM4PR04MB1571.eurprd04.prod.outlook.com (10.164.78.141)
X-MS-Office365-Filtering-Correlation-Id: 6b7c7ac0-53b2-4b55-fe9e-08d37db9cfbe
X-Microsoft-Exchange-Diagnostics: 1; AM4PR04MB1571;
	2:QpMcsMJa9CJ9MVpQOlIqTSHUOMODar5mI+d9H8ZYMUKCcN3Eg42o/Nj3sjJVZC7NwnMKVJKBhLM33XTMn84TOF5IlSusAo/YZSzQg1PmMe8OEzjsjtzncG7BB1vSNc4NzfkqCiRO/kxLvWDIDAWLcnmWiAJMiwM2hFbYHL5jgGq31HpaYSKgPlErl4IGOAIX;
	3:IMLDWxgUKxGwEfUBBorHuj0W8HcS8P8cLpqGnH/bpw/p76KBbWWVqZIpjoDmhwfsgMUA/TZNOXLcGslTrMF0U7v9xcXagJ5dCPiOSSkpwcMJYniGaSKmyVXHTT7qm7EC;
	25:KdDVbBa7+VYV418kc9gOotGKmnYWowFx97dBIrMLfhj5YGnycHLwxocOXbqk9yO28nZyeXIDIamW9pHexTcCIgJTXBYIQVtfhuTSbR3Tof/JdUdoXZpM48xFhdK3HT36RZGYWRvWDhAJfqlG5ta7Myt9VFyTtWyh5AfHyPgGS+I2Tlz6TH3fPwWPq6IkEkf27+gZtgWGkoI7RAt9fBB5jUxS4SwXgf6z+WDOfVShcWgAzb653JUELJL/A7LOC/nr5VxxDhBzZxmduTQqeKwoVHwO0o4164cFnmQIL5NKPDiOzIg9jlbY0y9jtE7yP9LmnjwaqrbZovd2LoermTHaxrzKzD2vygyNXpt2fdbFo08zuuUljbc7jjon2iAJJM6MK9dLuwcZ+nd1Z43mt5FVMsNoZGScGj5y8jKDicRKe24=
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:AM4PR04MB1571;
X-Microsoft-Exchange-Diagnostics: 1; AM4PR04MB1571;
	20:lIAkJSwqtFA4th+rOITHGdhJvG55l8T4ngeQQg9OziK4OZ3H1CtJzJJJ3CvzumNLwz6y/lxXeXIeSa6omEglYXrkz0pCcVoVJv4mXsKBm43jMIri/eudb/JAwV+m1UgJFHrVh5BtmyujfQdNHBTxbfScyySeFswwA4Q5awMSMWkQ7CWByckPZ6bdutlt7Mh6AsfxF+UV1mudiMKkfqM2ZWcDld0C3u62Wfbu+W+FI2IjDZDCLzkGYKpugM3GN3Uyg0xoIBBVK4eWmKri6qMTId7xBnpoFeQYlVUjucaZhVeicqrh2ckqGOAFj2hROci3PgyqSrjyytpHEun5VQh+8MeCf01BspOITllUvOmTGYeaYFao/NvYk+7NN+M0EQ5kg/wuSLnpVB6OpYviiWDFWpyUQPWOIeHuFI13DABEYBaNH8nZal2DY05RAAy6ZxG9xZsZ/r3+5JTqbUgOju93cxaFpBuW8MLHb5j4ysN3HkneKG0U5cNbE+wIyQj11UV6;
	4:XMY4oHRiiYCHvWfo594v4SMnc1+1Tpg+zes3n3bmirMho6iklGvShPFEVO1bW2H2U2MpBZxT4eKnYQLI7/x3M6+5VxSZ/vwDb9gF/PFW9WNmMrVWO7eldUNC3Q19fpJYkQ41JwtuhY+KgPg/9navQFklQUL8Incg7HDxEMToANyF7i+38hJjqhWZuvXUYgw46V8BlWVdKHA0XwUcZS2V7dr6aF3HU2hLy6X/rN5WBgD7Re129yl+olLgdlsl5A9O0Jx8sox7SX2DTqGjtBBkalRr/5BDzV2tmjsVqeDVbabfRn7y+cY/p+nbcOtSp7j/bXYBj28SfvviYJ8av3zcXHVN2rLrFkm+u7DtJuZl0b8+A/Pfl6P6QhqyJTFYhOQM
X-Microsoft-Antispam-PRVS: <AM4PR04MB15715D881395B60773FDC97E91770@AM4PR04MB1571.eurprd04.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(2401047)(8121501046)(5005006)(10201501046)(3002001)(6055026);
	SRVR:AM4PR04MB1571; BCL:0; PCL:0; RULEID:; SRVR:AM4PR04MB1571; 
X-Forefront-PRVS: 09443CAA7E
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10009020)(4630300001)(6009001)(229853001)(36756003)(2351001)(19580395003)(19580405001)(92566002)(42186005)(33646002)(47776003)(66066001)(50466002)(86362001)(586003)(50986999)(48376002)(5008740100001)(3846002)(6116002)(2906002)(5003940100001)(4326007)(8676002)(81166006)(77096005)(15975445007)(5004730100002)(110136002)(189998001)(450100001)(50226002)(8558605004)(15395725005)(19623455009);
	DIR:OUT; SFP:1101; SCL:1; SRVR:AM4PR04MB1571;
	H:change-01.am.freescale.net; FPR:; SPF:None; MLV:nov;
	PTR:InfoNoRecords; LANG:en; 
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; AM4PR04MB1571;
	23:u/eADg7zTioIAs4TMyjJTzT/RDP5LjYMESqrHCIen?=
	=?us-ascii?Q?FzAWKPFn7UC5SJ7b89bwEp+GnaNTC1dRRGXjwhtQ8l8s6np8bflebfqUop/Z?=
	=?us-ascii?Q?pe3WTc3s7QT8nR0kOOnRDzcnFhxaZaAHPgdzX7cun+fr7BTbnS5wUT9rayHO?=
	=?us-ascii?Q?EfSUKVTP/7QyR8YndY38YhYLmCvHZLMMcnE5+Ttxqv6X85ZDMhbIWMbCJsHv?=
	=?us-ascii?Q?G9TOI9fSw6pcO/adX+pR7UnRlKx0lMn0uM1DRgpZqHIko0wFiWU90DYNk0Lz?=
	=?us-ascii?Q?s2ewAV3brLpTZsZBDUbELMm1tLpw8McYAqXNUPHudugwXKArLqTO72AOStsZ?=
	=?us-ascii?Q?ZV/X2NXx2qFpIq95mQWC3h38x+VmlLYAuI1X+NWg2M/mwEcfrdIDMr2W9c76?=
	=?us-ascii?Q?qzXxMqfCXKWfQ4pV33NP7CY2FpYt+YtTmClrwvc2S/AngIFhlVAQ3B+uwdOW?=
	=?us-ascii?Q?NXcSxcxI+hY0jBoLGwW1aVqOOmxwaOvtMoslSJgvTdbKG5UPGXU4KvfXDk3/?=
	=?us-ascii?Q?AuifmjnNpzMnQzkq5ZugxOdDh3AlGCtkExwylFQoGPQh4CqP2QVLaEftZeRx?=
	=?us-ascii?Q?lKk9uE6p/+L1Z8QOeI3nnQTZzU+J0XtlZ40JtjSX4EL+XySn+Lw5KuOxkKMk?=
	=?us-ascii?Q?xjh1CdLHSSapyGKTOHeGZHw6ek2y929Vjugw/t1Lfw7nK2e0OKqe5xc4MFCO?=
	=?us-ascii?Q?8rRegnyyutnRw4dDNS5Iv3VDJS21WwbqCwjt9n7tWVUxFljKtE7MA7KDzKsY?=
	=?us-ascii?Q?DxA5mcl9crSY65hQg0OTS75j9at31f73g6JdsT/h+upcWKk8ysrJv5sTNQTT?=
	=?us-ascii?Q?tFNjDvAniRbRS3KwlroepxKE/r8h2v5OTsFE5n/7u6UvtYndxcQqHm7pCgcE?=
	=?us-ascii?Q?zwaGL1qIwA4S5yU/wTS16EdrTix3ENh5aj/QPXC8sZ8364ODnFUFhzhuu08b?=
	=?us-ascii?Q?Vvux9rpvlB5h7XHd722buQc7extA1L6wbmxTvbV5g=3D=3D?=
X-Microsoft-Exchange-Diagnostics: 1; AM4PR04MB1571;
	5:yyR8sA+Q3y5yQr1i1UsfLHAugzcAAdpsnmi9SfmEzg1kE+vn5/j6J4CBsu04jiglszj57m6h7wob5hIV6thDbN9LB+IFWUnDqX1an7yIoe0WDsnMyE166a4KLY+BrkmpfNn9VmC2OGJ6DuiFSBv/VA==;
	24:7rqwd2mYamvWIDhj/Oy4w0Ou3x2LifZBN+HMWvqHh1P5c4nVAlVvZlOnriaFwJuj0Qd8k5TnAvUx5jaVtWtcP7nDP/PI4EoklxAYMKiXwlg=;
	7:dv24z7duOR9rWkHFOVA+2juIWrP1t1hxMomWJ6iSaLK7TnSIs42gkkan9StsfW/TpczSr+UaOM/1F0W7kzxcy2iiVq28HR9ecGeAyMQJwHODboU87Qgzgv9IjeqXxDZpCb0eiULsnwprxqq50LRUdSxNKR/rYV3++9mdFIfJGi5JXK0uc02mp7C+ZRfUgEry
SpamDiagnosticOutput: 1:23
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2016 18:42:19.2194 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR04MB1571
Subject: [meta-oe][PATCH v2] assimp: Add recipe for Open Asset Import Library
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
X-List-Received-Date: Mon, 16 May 2016 18:57:07 -0000
Content-Type: text/plain

Open Asset Import Library (short name: Assimp) is a portable Open Source
library to import various well-known 3D model formats in a uniform manner.

Signed-off-by: Neena Busireddy <neenareddy.busireddy@nxp.com>
---
 meta-oe/recipes-graphics/assimp/assimp_3.1.1.bb | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/assimp/assimp_3.1.1.bb

diff --git a/meta-oe/recipes-graphics/assimp/assimp_3.1.1.bb b/meta-oe/recipes-graphics/assimp/assimp_3.1.1.bb
new file mode 100644
index 0000000..bf987af
--- /dev/null
+++ b/meta-oe/recipes-graphics/assimp/assimp_3.1.1.bb
@@ -0,0 +1,16 @@
+DESCRIPTION = "Open Asset Import Library is a portable Open Source library to import \
+               various well-known 3D model formats in a uniform manner."
+HOMEPAGE = "http://www.assimp.org/"
+SECTION = "devel"
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=bc4231a2268da8fc55525ad119638a87"
+
+DEPENDS = "boost"
+
+SRC_URI = "http://sourceforge.net/projects/${BPN}/files/${BPN}-3.1/${BPN}-${PV}_no_test_models.zip"
+SRC_URI[md5sum] = "ccd4788204509da58a3a53c7aeda7a8b"
+SRC_URI[sha256sum] = "da9827876f10a8b447270368753392cfd502e70a2e9d1361554e5dfcb1fede9e"
+
+inherit cmake
+
+FILES_${PN}-dev += "${libdir}/cmake/assimp-3.1/*.cmake"
-- 
1.9.1


