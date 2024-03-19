Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED330C54E60
	for <webhook@archiver.kernel.org>; Tue, 19 Mar 2024 05:49:07 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.8261.1710827340615165030
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Mar 2024 22:49:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=gfno62mX;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=38086297de=yi.zhao@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 42J52ron001862
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 Mar 2024 05:48:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:content-transfer-encoding
	:content-type:mime-version; s=PPS06212021; bh=65mWpXqr76EC3JwAQ7
	RrbIBvhzqPXUjlSHu5D3VtMNs=; b=gfno62mXDXGfPsqFjHhKxe1yHrQCeP1Tpw
	UDGW+VJxmZYHD+JG/6cpQKKCqktOqHUaRfQck960CEmdA37rTINwhkxcEYM6YnrS
	kJWEjS5h40K6B5Mp7D+iZEas7RFqmcNOIAP1wTKsAXjHazByvenUzbJNmQmcY6Sj
	qw9f5qZ5mibfyT3RySaD/hTzAKEj64zTu+TWRPPWQ/4D5RDUIJPCEmIEkWOYTOJk
	pCJcwsyKlW/4kgKoZdoan2AClCVNM0XV3kNtHmvMd0uRbdCHq67VCJE2MapBIEQs
	J1AFEvAQ7JJsQT+DO4QGyQoqj3R5Z5Zp2WO1Q5ufVu7WgGcbINfA==
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2100.outbound.protection.outlook.com [104.47.70.100])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ww2d6jgdk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 Mar 2024 05:48:59 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=luvOm5WtMYbLzfYECdn9VhuT5GZxke/w2CUteQC2NivGd4EbZJawwvNLCkf/DXma7XhA772LAxxW+BBCQFWSOPvb4MbA7oy83yP/7HHIT4DkYUJC4ZQ4T963fqX91PrCv/WjDoDV6ONe+fGy3a2l/vJf1mNL4GvjPSOcIYPVysfLMSGsW4+KOODUHBjgAGGD1T9mj6Z1DoWm/0iKfhajUg+9OIqotfEOVJrtqDTVGNlO7u4iHVgESS8FsnuZJZmb6ToGxIjPb2PMQGBe4AuGMYZqxd3tJE44gfFjX7K3TAYbp6yJUNKb9XeNQI2MawlGXVmcD0/B4QrQ8fmjmiPRyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=65mWpXqr76EC3JwAQ7RrbIBvhzqPXUjlSHu5D3VtMNs=;
 b=g26qYpDmel53d8LQL09w5ULScnDwluUWWuV2dz/3aJbetGC4snA9tHUmFRIvpqT3myrmR7lBOa67GNJY5ZsCkUAwY1OXhgPJz9+GNm6jm7lsZG2xLSPvPLRWLRhQLKuSIVL33I6fcFZoqjCGGldXyZRwmRnaQI6iuiLZ6H1WghKyHkmNe4x+UyQdztU9GA5DlfOoTiuCA83lWz05L3Hep1fWvuhyfmIy3QrmTVF+jOpcan4ptnfv7jFE5OBcOVojd862OMNgQgpICKrc7efEdkZwY9dQHNHSe8N1qKraz1nBsXM/XJlAVEOuiuO5q4RlyHboyIs8D3zP8tRGdFo3yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7484.namprd11.prod.outlook.com (2603:10b6:8:14c::10)
 by MW4PR11MB7102.namprd11.prod.outlook.com (2603:10b6:303:22b::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.11; Tue, 19 Mar
 2024 05:48:54 +0000
Received: from DS0PR11MB7484.namprd11.prod.outlook.com
 ([fe80::97da:833f:8511:a558]) by DS0PR11MB7484.namprd11.prod.outlook.com
 ([fe80::97da:833f:8511:a558%6]) with mapi id 15.20.7409.010; Tue, 19 Mar 2024
 05:48:54 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH] civetweb: remove buildpaths from civetweb-targets.cmake
Date: Tue, 19 Mar 2024 13:48:44 +0800
Message-Id: <20240319054844.1579494-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY2PR01CA0016.jpnprd01.prod.outlook.com
 (2603:1096:404:a::28) To DS0PR11MB7484.namprd11.prod.outlook.com
 (2603:10b6:8:14c::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7484:EE_|MW4PR11MB7102:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Vxvup6JmKkmqRRmoa+rWTBcs4+MkRHC9afvA3EplNQtqps9qxVrxdYtZKH6BYopeDGppav2sj97BZ+kUYDyGheoc88EDYeuMA2s5IGn/XJMabE1E0w+JMIDghyJixEwhrvYN+ENjgjq+SFH1IPFb0v4jwuj/qMbLypsw9wHkLLXo+KxbIavrTweVAfsGzyqhrhjz9nNBQHCgrp81UzH9z/UmB7zjktWgkuqV/aGShDWJ4xv5UEv1ZxUJ2CIRPS/mKPP+6Qzwttiiop5JLgPUFtw2Ncg6BgvXCKnmRPmj8dt2UQ7QeOXNviPOksomveIswZ1UtZd4mRrUgQyOxMivLeQznTFO5IukeZh3ldJLV51cnM8owjEUC9sbn39v6qk2Di4nZjwYpnomlPb+L8U0jvKtEM0Isk7q1C8NPTc929wCyOTA6xnDQ9l7WjCDM+8S3soy+fZe/WNtbgTOyBBtTGHLHinEa+6wTD+Mu5nk/ZuKgv/eHhdkYsczXQIZXLN/imVwCT6PAGhtXvDW+R3H7To/BXUqoySenZbONdy50iUmPp9on3+CTjy0Jfxw+rWmrAn3QYvVy+Dz7aU2P8ECid/9BCX9Jnwgo0mEsyYXQn8ytYeeUnvL5BFnVlLVsqKLvc6ygEBzVXdVva2+9atgdjVP2DSMMd9E/6QhbCI4LzAp0fTSJqpU20IOakYK7tn4bZUMY0zVBzKEfrQd4sftzqJZa/YZ5yWMPo/oFxOZpoY=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7484.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(52116005)(366007)(376005)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?HRYYD1ZwhNmk1VhipoX7Ug6URWf0AMdR303/TU49jm9qqYBYsJb7LWvV9wSc?=
 =?us-ascii?Q?dYnqjq5CI+UBgYjMPcWe3DtJin9rdN86FWYmzon7I9QDp8pQRhJPXZ0UCIqx?=
 =?us-ascii?Q?08gv5ZJ8M9pjfXdouLrfxOqT7yEsbvzjgH8+JPWD05TJZhl/2Sxy7qYEzXla?=
 =?us-ascii?Q?+xr5iqYQrpbAl+2GedUMTamJF4ESQfO6j/lYDP0ThztgTGZLi3TPyAIfENMw?=
 =?us-ascii?Q?hCkK5ASsyQyurFr4cg9QqV6KvxcWiKqFqJ2epnpLRsMDpnqBLNKU8NKXNuBj?=
 =?us-ascii?Q?MvVSqmjMMUr19v5mBCr+Lb7DjzIYUdQ+YwX+DUqNdYc4aAZIRsL6nrB3kYbf?=
 =?us-ascii?Q?7+axfTMIVpipNcIOzyfAyO119fOPsGUWw6dQbPKm+jrH3Q1H7POV/eEoV0Zf?=
 =?us-ascii?Q?qqktj3gQ7qLbcdZfjFWuiDn5ntMIOQZSJfbxJBmxo6c/jreaZz2jYAtSnhRM?=
 =?us-ascii?Q?Q2FYPjOJp2d8Jxkqn8puK/q8fIuzGIfRghD7iHOAUMbSqsyvHU1/TsEHbgU9?=
 =?us-ascii?Q?By2Wl+5AfL/Uk16oOuQ4DVqyX2MMX2J/OZwnEzhgWK2UucNbDXXAOG0ar2mr?=
 =?us-ascii?Q?7E0yP9KFs9kdZCc4z+Fo0IHOWucq48jsdN0Ueeppf6EfxHEkuszHuImHd3LQ?=
 =?us-ascii?Q?bk98iFBHxPzNgUkTjIjQ8oyNkLilaDLu9YPHzug/CdiCjoYdIZ3X4N595rd3?=
 =?us-ascii?Q?QdNOM1yqTlipc+RHxeM09JhhsJ7hTMaWgs/aMPMSbMg6fVUaVn+cLkqL74Fx?=
 =?us-ascii?Q?s9MWPEfq5RQFHDoh1z4rGpnazrQCTULZc1Vk3CWj5AFwMfkcyI2+fOHNA5J1?=
 =?us-ascii?Q?eegtc7HVfCz0CKFLeOpM4zvL97y77lYgSqy6DM2cPAfnb24h8Rl47fBzI4kt?=
 =?us-ascii?Q?uqDRVCW2IG4SrEaCHLMlsi+nmzlNy2fB5DzTlepwcrv8FSgTdbeJuxb/esnz?=
 =?us-ascii?Q?unixNq8C4D27tH8SlfTGktLvsEPQZHqVD3OP82Ydl6qXpw0v8Fg+ryRkcIWl?=
 =?us-ascii?Q?Phb2xYPbBzn+8srWTKxTP5o16i8Hsc7kxOAjtvAl7kTfTw/HpE5S0Tj/WxG+?=
 =?us-ascii?Q?TyYTLZD5u/ZiQYVhuKpMpQ2/Db2CbIH8xFKgRsIYd1fSReIz0fz/23FnP4yp?=
 =?us-ascii?Q?py/fx9Rj9UpBc8plrvmp0gsaA1NDYvdJ99wXeKH2CiEB8Mw8dnoLuGpw4FQ2?=
 =?us-ascii?Q?7OCgFi1Rdgti4qAEn+X49UQeKNXjcFXz22knYhYW3vWf+H96p1jToIL5xHAB?=
 =?us-ascii?Q?3We0gyVv5EA/i3OeSi3PfG/RuGl6HKgBKBMB7Ozls7RZA5DQFrRKvO0/zIZM?=
 =?us-ascii?Q?uTlVC23Luwe+8Bp1jYcUDiFuL1F82+bygWvNtQrpbz5F/dP7Q47JCCsO2mRn?=
 =?us-ascii?Q?8v7c54/fcc70rRSBgp38xplq5+hYJByGIhDUER2SKO+i5UpRWFPkzZk/ZggL?=
 =?us-ascii?Q?Y+VpePVUvP/eX+kSgMTGETIBPIRRy74w9VXBySFBCZuVJfnmNN06zstDsNfO?=
 =?us-ascii?Q?emBNUmg9tpKkuiPuWT9DUl2gl5R7LhZb5lFjqf8xxwbId0GH8PUFCgrTodYk?=
 =?us-ascii?Q?MxwlwTkkXYFNNExwVnnBukIJjk0YQ4SAvk09jOHT?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6506f29e-aace-4d4b-5e57-08dc47d8430d
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7484.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2024 05:48:54.5727
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pf/HNOMaNROLOmtzSbwC1XRoHiL1gkZEnTTiyBRzeOE0y+4NkpFryPcn/2ypSp558RyILmj9He+CKOFJs1aU1Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7102
X-Proofpoint-GUID: L_GD44QzAYvSZ4db5jIBPi6TdxPz5i8J
X-Proofpoint-ORIG-GUID: L_GD44QzAYvSZ4db5jIBPi6TdxPz5i8J
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-18_12,2024-03-18_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 lowpriorityscore=0 malwarescore=0 mlxscore=0 clxscore=1015 mlxlogscore=975
 impostorscore=0 suspectscore=0 phishscore=0 priorityscore=1501 spamscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2403140001 definitions=main-2403190043
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 Mar 2024 05:49:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109468

Fixes:
WARNING: civetweb-1.16-r0 do_package_qa: QA Issue: File
/usr/lib/cmake/civetweb/civetweb-targets.cmake in package civetweb-dev
contains reference to TMPDIR [buildpaths]

Siuned-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../recipes-connectivity/civetweb/civetweb_1.16.bb           | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta-networking/recipes-connectivity/civetweb/civetweb_1.16.bb b/meta-networking/recipes-connectivity/civetweb/civetweb_1.16.bb
index 0a654a10f..f5a699d5b 100644
--- a/meta-networking/recipes-connectivity/civetweb/civetweb_1.16.bb
+++ b/meta-networking/recipes-connectivity/civetweb/civetweb_1.16.bb
@@ -40,4 +40,9 @@ PACKAGECONFIG[server] = "-DCIVETWEB_ENABLE_SERVER_EXECUTABLE=ON -DCIVETWEB_INSTA
 PACKAGECONFIG[ssl] = "-DCIVETWEB_ENABLE_SSL=ON -DCIVETWEB_SSL_OPENSSL_API_1_1=OFF -DCIVETWEB_ENABLE_SSL_DYNAMIC_LOADING=OFF,-DCIVETWEB_ENABLE_SSL=OFF,openssl (=1.0.2%),"
 PACKAGECONFIG[websockets] = "-DCIVETWEB_ENABLE_WEBSOCKETS=ON,-DCIVETWEB_ENABLE_WEBSOCKETS=OFF,"
 
+do_install:append() {
+    sed -i -e 's|${RECIPE_SYSROOT_NATIVE}||g' \
+        -e 's|${RECIPE_SYSROOT}||g' ${D}${libdir}/cmake/civetweb/civetweb-targets.cmake
+}
+
 BBCLASSEXTEND = "native"
-- 
2.25.1


