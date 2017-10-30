Return-Path: <mkelly@xevo.com>
X-Greylist: delayed 7148 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 30 Oct 2017 22:37:55 UTC
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
	(mail-cys01nam02on0045.outbound.protection.outlook.com
	[104.47.37.45])
	by mail.openembedded.org (Postfix) with ESMTP id 7CA336FF78
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Oct 2017 22:37:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=uievolution.onmicrosoft.com; s=selector1-xevo-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=vRAcf9b6LtrZUCYPDiN8rUrbsCmn8G0MPuf9f+59RIg=;
	b=3VOpQlHdquLDnqiyaDGHx1lPBJa+5Q3tA7ROgDu84bNCD0aisUxumqfk0MXCkio0reNedu099cFKg6SwYOM3+oPQHiEb2JCmKpKKyb3TBZ9Z1kHeWhcR2uxM84dXf2H7Sdqv2B68h/9lIsVFJFqagFCb5ok9SahbLqIMvL6Rjn0=
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=mkelly@xevo.com; 
Received: from willamette.Home (71.35.172.156) by
	MWHPR0101MB2944.prod.exchangelabs.com (10.174.170.15) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
	15.20.178.6; Mon, 30 Oct 2017 20:05:40 +0000
From: Martin Kelly <mkelly@xevo.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 30 Oct 2017 13:05:24 -0700
Message-Id: <20171030200524.1874-1-mkelly@xevo.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
X-Originating-IP: [71.35.172.156]
X-ClientProxiedBy: SN4PR0401CA0008.namprd04.prod.outlook.com (10.171.32.18) To
	MWHPR0101MB2944.prod.exchangelabs.com (10.174.170.15)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 84d41304-3570-402b-64c9-08d51fd19856
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(22001)(4534020)(4602075)(2017052603199);
	SRVR:MWHPR0101MB2944; 
X-Microsoft-Exchange-Diagnostics: 1; MWHPR0101MB2944;
	3:oAl06BmftxO1xKCW+YBjTEhcX0CVnjBnTkguO6M5+TkJC1mBV04nBoANXACviT0zwFlP8ioDMEwTAJvfmiGXpt6XzNJ1z/7DyaQEJ2pNZIysmp5hZl68G0+krYheSDkEUDH5eoQjWa4HVrsoHASFqMpaCPRr0g0MktWI738LLW8ZiCMTUqR/jjfxcea/bDw1nVuhnplVp2KwpaVjdFVM4fZCWMSRqL+ySf7fm0i9CyzNrb/iQEVOLN6KtHBUF1Kh;
	25:JNRQTCKgLw3hG1fz5qV4LC3PCKUWGK6BxnS792biy+svi3QRzfBYU9CQZRAzr+QC0wrtgAC3upWHQ9VwN9QIqpnBAySZr9/LJK7is7ZkVfN5bP88NyuMp02gj9hDGs2vc06SOoKg+9ncn5JfqseoPWzh/UsCAl0DSUm9RmOwcinRahlqfL26fE+D+Zcln5+ca16sLToTX7d3udTyoP94MHk16jwejdinMlfBGCyyMI2IcSKBC7adSQd4/kBjM5Ld+xHiipdjgNcV6nPLQdqyKSfGh183KG97WVo1PLiDaiGlIrl696y5Ly+4+u6wz7msAQDVItH+1wU7TC9iutNcjQ==;
	31:57Hi5ScSNEfRXxMoO+mcBs0CTzEchwsrMNOUYb6Q+C5TOcVxvZcYJoF1DH5ldfzaTaUNCI7N8EC3vaAxOWdw7FGjB8fQA+gdXjq8jWnaczy6pBR8oUDarg6JnWPUinfUV0fIBlkZ7MU9TgG2Z6tnQOgUEVBkGxLetHtvHX38mjleXXtpYFcGV/zG3lpTTZKbTCGYFJjHxoMlPazbX2KbIEe+7aEwHrZky1ntrs07E78=
X-MS-TrafficTypeDiagnostic: MWHPR0101MB2944:
X-Microsoft-Exchange-Diagnostics: 1; MWHPR0101MB2944;
	20:sFh5CTomqyvVdJOiZ13eOaL4nVsdXWfIZ3VltUTZBZWeQwALH3slBdhb2ibmzDEi70TGC5P2rZJRBror1kjpQQ5dssVat5MoPSqULLw46mv2pYy3AD6hmVLR4tbUp0ddimYcmSzq/M0EoGR3GV6kT+wqNRLLOIHLPtfnzENb73L21V6TEPcUiw0KRBKoeMm3spQu9xCdFGmzQOVIdZUd9InDwJWF228cZD3TFKNJVtB3lQYRNj+vMQneejvKZ7pa7JIyJ9ZlA+uAxUKXVTSBUL2FsEnXeevc5w4FRpy0rw0gMP9nfz1kc75/hnJfCl4l+wnGRbFW38mpvYkUtgweoOXk/jv9U9LjSHDJM0i6sJCbCvtLu32Zd1gob5ZqZx9P7iLwZ/+dXiH9VO6/p8sxwBTzWc28P4jjnOpRaKI8Izs=;
	4:JGvhWn4mt4hVfUO6eVHRAqRT8bZU6PJQERu/Qb/eWWx4sPVYSZuv/nJUCxLAY+qJHMm+UFxgk6HspGClg2HpJzS9lYmD7XJCoH0v6LMlAoiABMADwimBCIoB0WghYvr8tJ22BwSb7E3TOICCHwzql59BhCgClclaQfES59MlirdSMBOD4m6cJ8wfc2jgVTku8PC/p4XsBSOCOvlqJzqFSpBfBcLTbS9bjVXhVGv6Pyv9oTULqN8iP3diOw0fmNz8LYnoiM0jwqjoWmvPvj+uvg==
X-Exchange-Antispam-Report-Test: UriScan:;
X-Microsoft-Antispam-PRVS: <MWHPR0101MB2944BADC907BFE674EDA4B6EAB590@MWHPR0101MB2944.prod.exchangelabs.com>
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(2401047)(8121501046)(5005006)(100000703101)(100105400095)(93006095)(93001095)(3231020)(10201501046)(3002001)(6041248)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123558100)(20161123562025)(20161123564025)(20161123555025)(20161123560025)(6072148)(201708071742011)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:MWHPR0101MB2944; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:MWHPR0101MB2944; 
X-Forefront-PRVS: 0476D4AB88
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10009020)(6009001)(376002)(39830400002)(346002)(189002)(199003)(47776003)(478600001)(21086003)(5003940100001)(66066001)(50226002)(16526018)(33646002)(16586007)(6666003)(6916009)(2351001)(97736004)(189998001)(106356001)(5660300001)(316002)(6512007)(105586002)(2361001)(25786009)(50466002)(69596002)(305945005)(7736002)(4326008)(101416001)(107886003)(50986999)(53936002)(2906002)(8936002)(48376002)(86362001)(36756003)(3846002)(81156014)(81166006)(6486002)(68736007)(6116002)(6506006)(8676002)(1076002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR0101MB2944;
	H:willamette.Home; FPR:; SPF:None; PTR:InfoNoRecords; MX:1; A:1;
	LANG:en; 
Received-SPF: None (protection.outlook.com: xevo.com does not designate
	permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; MWHPR0101MB2944;
	23:i1AwWRk3DJhBGZx91IFzhi9Oiosi8hwjJEwPmjn?=
	=?us-ascii?Q?upBfk9VcoMSGvpPHVaHHHBD8c2DSBPehw+yebepiQLnMJnNoapLmMb4V15mD?=
	=?us-ascii?Q?4I5zthJdZORTz477QHVosffgo2xscrtkhgOSFdDu4GjJl7432vkkKHUlQgrM?=
	=?us-ascii?Q?nnuYuNO5i7NmQgZ/ZJ0UTTF3lWzZ3gtTIiECBWgPpf4DSa/qqlJKMb79hP+0?=
	=?us-ascii?Q?58zFdENeLvdHQS9592gKsMH3Ggu7e0MMsW/+zDBpW3il8CY7jrete38lPC8A?=
	=?us-ascii?Q?424G1QJ6djabghQAsj/nm8xuLagJpDnUJ015pdCi56B1J4w/DeTHPy+6Lbv9?=
	=?us-ascii?Q?pYijazibzEuIZd/X+uPmks5joHamtbiiN4Mf6vH4JDRlrjTavyKz2XzCgLBo?=
	=?us-ascii?Q?epn7ObH5DOuvDq5JMP4piWezteZ+umhdbkbbfa6vgcBTouLjj3rTtkpEtAKc?=
	=?us-ascii?Q?wQe/pho8EMK4kDmB9/jdoCHulumWEsCWcX2JXk6ovACBw4P8jaY1V2d7/he7?=
	=?us-ascii?Q?o+1G1Ysn/6lSVOngmAzu7vYftQsix5bEpeNT+OrFRB+vqNR/2v1BD+TMEurS?=
	=?us-ascii?Q?cglTn7RFDoYFaTqKs6tiXuOXBget0uBxkfPGy7nrAs0k8H9iMM0G5oP2Tizr?=
	=?us-ascii?Q?FERFkmhrh/aObCApQJx8SAMLfZbL7FSdD9ZQih3PalaxDZUSFvY3RqMu2mcQ?=
	=?us-ascii?Q?OdNMQgTl5HVzLATPvDU6/DV9CGHLdsb8A9303WTAJ+vLBskSMPWmceTecP+M?=
	=?us-ascii?Q?Mwz9dgh05arcb7NdsCq8Gl9FDQR1ydNN/BoyIOq9SDdA8oMqJ2+owO1yTy9s?=
	=?us-ascii?Q?P3U4/kLDk0/gJjSazhx36mJ0IDPO90efJL8eRdI0/tigY7t8ngFxT70wBWIQ?=
	=?us-ascii?Q?3lccFjjW1dhEVmw4A5IvDnXupDAxjspNRaik9YsdNWvQH3c6bv4LMk6Anc3i?=
	=?us-ascii?Q?Ep1N5OZ+Inzs7j5imPxq/Dn5qFmEcIhQVcXMZe2hKwavEXH5Rj0Eb1bHb2Bx?=
	=?us-ascii?Q?wgGFrR2rbADdnJ19Ele/hSDbbNwblNMhVL3TA1fkGIlRY+XTDhkX/hOcOGKQ?=
	=?us-ascii?Q?kfSdI/YIJJRtdPBoaGKxK1inG+I87IK28TxBLBD62XWQ3H4lmCa8KC+L6B6n?=
	=?us-ascii?Q?dmXieEVxIkM0LxW4mDRcyR7/8Ona4FX/w8uanYmrLFn6fl/Q8hPz5Iw=3D?=
	=?us-ascii?Q?=3D?=
X-Microsoft-Exchange-Diagnostics: 1; MWHPR0101MB2944;
	6:+VOfPeHwc4SAeWhmLv7YbkRA57fHE4ljcWhlcSybsQBiIvdUrSPdkHpsEuPHk+tGMNsg6Sb2VvCVv68CAwF8G+YHPSthjzdtXbV/OoXxzOwlPY5TmVHP/eNet1NBv+Hzha5Qs/efjuW6H7NZoLdpesuZBu76O4FuukD2UE91TpAkQfpVMfj8FU+cc/3ZKabZAeng7tLiC6WVeXGPJdcNj34rQf23opR7Renn+BxvATSDoSwlUH2CfGJdubT680jO/fhRfeo1udfjwmHQNYJxJi5p4zkoHReNPKodxp64veXl/K9U5yrvTFidduJ3JASj2X61ncFPT9dZ4eZDZkVSBo1pi+TYQGhX9XxIOwwc8Vw=;
	5:So8RY7HplinwQqJqxb6uJxKFXdcJ5ngWBwj9XecLcMD+EuDZQrt+HO8aJgeZMk0/54HeU8tI5/aVhgefn1gAdTH62E2zzec6Xmd8gyjddrMWSyV0WxNuKHIEdOgt/TY0BQUfDfHL/5asV0vRIMHixDVyMciXHcNJif+qzqH+nT8=;
	24:x96VXDzfGq+zBZg3lF7+efEf2C8Mwof9Pabp0XGi4dq6eZJU3VVcwrQjM8A5bdQ+yo3wPYxLH4+63DY/BqB3t0uLnA0M3EsMNAD44xrNNsY=;
	7:1tGBjp52IrhbyR4w4mAzKL6l5myI7kmi/cuzKNyjJZ74Cw4OFTMHoLlUGuIM4QrBqg7ublh710QPhhSjiaYGS5bXFJTD5BOD0XM2FPHzkPZdhjOk2062aNsrxitXLeQBlHSTic7Zqldx029EWyxcUIDtByT6ZGdaVgkuA5Pt6Bpk2hGAWWPKyHIUBBB+Ytu3h3Llo4YMm52/vUiw6rYC6JYVPRLDsEigCCcT/11jqJ1ZXO4JmlV8CgmPvCxshPzK
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xevo.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2017 20:05:40.1905 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 84d41304-3570-402b-64c9-08d51fd19856
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e0a7ca1f-2458-4cd6-a7c7-d733c07495ab
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR0101MB2944
Subject: [meta-oe][PATCH] gpsd: add missing python-pygps RDEPENDS
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
X-List-Received-Date: Mon, 30 Oct 2017 22:37:56 -0000
Content-Type: text/plain

Several runtime dependencies are missing from python-pygps. You can
verify this by adding gps-utils to an image and running gpsfake, which
will fail with python import errors. With this patch, gpsfake works
correctly.

Signed-off-by: Martin Kelly <mkelly@xevo.com>
---
 meta-oe/recipes-navigation/gpsd/gpsd_3.16.bb | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-navigation/gpsd/gpsd_3.16.bb b/meta-oe/recipes-navigation/gpsd/gpsd_3.16.bb
index f8e6a2b13..e23d63033 100644
--- a/meta-oe/recipes-navigation/gpsd/gpsd_3.16.bb
+++ b/meta-oe/recipes-navigation/gpsd/gpsd_3.16.bb
@@ -120,7 +120,14 @@ RDEPENDS_gps-utils = "python-pygps"
 
 SUMMARY_python-pygps = "Python bindings to gpsd"
 FILES_python-pygps = "${PYTHON_SITEPACKAGES_DIR}/*"
-RDEPENDS_python-pygps = "python-core python-curses gpsd python-json"
+RDEPENDS_python-pygps = " \
+    python-core \
+    python-io \
+    python-threading \
+    python-terminal \
+    python-curses \
+    gpsd \
+    python-json"
 
 RPROVIDES_${PN} += "${PN}-systemd"
 RREPLACES_${PN} += "${PN}-systemd"
-- 
2.11.0


