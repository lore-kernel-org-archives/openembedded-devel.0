Return-Path: <Haixiao.Yan.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C0B9C41513
	for <webhook@archiver.kernel.org>; Thu, 18 Jul 2024 07:00:09 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.9685.1721286006748852737
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 18 Jul 2024 00:00:06 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=792994667f=haixiao.yan.cn@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46I5oRTp016735
	for <openembedded-devel@lists.openembedded.org>; Thu, 18 Jul 2024 07:00:06 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2048.outbound.protection.outlook.com [104.47.70.48])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 40erhj07tk-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 18 Jul 2024 07:00:05 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XKjUw9ipaO/lanCx/cWeonHjeDmP1B9Gam5VcD4C5/NjR52gehCp5Iv6dEGXxurjcFwVDhAZe3V+1lZtdMMNUn+CPWMAYnO2ZU1gKDrGChdBHOGpiORop4At4FY8n3FtJ+zIBI/hCDuMxzi/QDvJtGg6RgpLEjfYmmAJGm3ujPHFBB34x6Efm7FUJH0VgrLKyhaZCbIhsw6hB+Yuf9c7qn3f7PYgbdPmgHiCguxd3mci+O0a9t8fWZlFGwuwMHiEaRKLLbFmTe1MvOHtPIQTP9vKScaDaDtEDdhrmHuUO7vml26oZjW80PUb/KAeu8jWfvcDikPZBq1HeyA/uurHVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nvGIRa9EbVnWbR8UFZzVf5t4/6eT1Dhw5XYuczhFF/k=;
 b=HcjipyM2SfCAhD4pVMaTq4GiwML03l6Hfib/1pLaih0b4J5VY0iu6aEscxTGa6yerBE1F8dV61vinBBccI1XeN37Tbs0lrT4VGDO3XdHabpKsPXMDX5jrGLSN01r19xdJEhLPVqJc8I2IoXp3uv7Rd4NB/vkhyHzfg4gdGO4P6IkCVW+rXj71veEo/ZXOaPjriQKGgSdjk91zPogVCZZP6ikutWks/9IiARdeMINM1d3FzwuKwQaZGdzTYbh6eeMKi+DsuIfhiIO3jKBsN6s0dJvF7dc3OsylyK5nFFCLrxzvKKmFlFIhslfsY+glVhcFQuUAXMe7/KoucuN2h+J2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH0PR11MB8189.namprd11.prod.outlook.com (2603:10b6:610:18d::13)
 by MN0PR11MB5961.namprd11.prod.outlook.com (2603:10b6:208:381::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.29; Thu, 18 Jul
 2024 07:00:03 +0000
Received: from CH0PR11MB8189.namprd11.prod.outlook.com
 ([fe80::4025:23a:33d9:30a4]) by CH0PR11MB8189.namprd11.prod.outlook.com
 ([fe80::4025:23a:33d9:30a4%6]) with mapi id 15.20.7784.016; Thu, 18 Jul 2024
 07:00:03 +0000
From: haixiao.yan.cn@windriver.com
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 2/2] nss: fix failed test of nss.
Date: Thu, 18 Jul 2024 14:59:46 +0800
Message-Id: <20240718065946.3964212-2-haixiao.yan.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240718065946.3964212-1-haixiao.yan.cn@windriver.com>
References: <20240718065946.3964212-1-haixiao.yan.cn@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYAPR01CA0219.jpnprd01.prod.outlook.com
 (2603:1096:404:11e::15) To CH0PR11MB8189.namprd11.prod.outlook.com
 (2603:10b6:610:18d::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB8189:EE_|MN0PR11MB5961:EE_
X-MS-Office365-Filtering-Correlation-Id: 7518a988-bcc9-40ae-78a4-08dca6f73fa3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?ajtw7oMQzHNJVqPpgidQ4QilaC+q8zoCCoUD6zSgNLju3reH1+VXcfoO6vLj?=
 =?us-ascii?Q?3xzVBmwnn7gFmFQUNHG6BhN9wf1d902F9tQ75H2jUFw6mii5pUGIdzPB9kyG?=
 =?us-ascii?Q?RmDPJK62/UfRE5C9/3l11p9wDUn0V3DU2pTbF2Iwr5cqayHZ9e1JEP+kcuwG?=
 =?us-ascii?Q?MH5rBfHlf8nJT35Cvu76VI6uK35j4JoAZP1mQm7xGX2cx4UV6yI13BcPeSFh?=
 =?us-ascii?Q?h9aTABRcuOxOu8xux5bQEJOXzyjrHIszKt0pnaGZAvvSVh8bBfQWZxztOqa+?=
 =?us-ascii?Q?TAJQeQdBfgpl0BgwMQgcL1ZJemfwekZLyPVUJFwYMoKyptdNinwEg8eiBGz7?=
 =?us-ascii?Q?8yF4MVDfM1PV8eTtfeJQDqHNvB5KDA4xqwYAr5z3/2i1TO5Wg60ssnivG/dV?=
 =?us-ascii?Q?cn/5tGvp0Vo57TrNTzxjWcf4T0pCFmgA5mWZzcafNWl6uI7WqCRnmlT6nH/s?=
 =?us-ascii?Q?AvaprWvtBpRlkUq+aHD5wb0wEtgFQQdjpUq0p2RMTnfvN7HlASSX/P2gbPdg?=
 =?us-ascii?Q?EP2uoVJo0wTXeer6E49kQrSL/ZxphTole/U8qGtRPcuigPf3OFfygtcPXWj7?=
 =?us-ascii?Q?CK/a9t2I2SbMuSinfdtUe/ymxAjcJ0q9ht8gZb9/IX8VvIjfzOudT/SVoZXn?=
 =?us-ascii?Q?bsME4vEVqS7vFN35TAzO6q6ESBlYobwPH1rVrehb9of6L9z4T7y4tgtyW7su?=
 =?us-ascii?Q?V6prV14QLkvRFrwTeQ8MDhKRcXhccB/q8BMmwfeNb2SSOYZJNYvIBhEwcgKk?=
 =?us-ascii?Q?yyGkPeHdUf3Uudi1/Ic1PW1EFLCl5J1LphkcNxOOi/+FiM+Vikc86Osdoxdw?=
 =?us-ascii?Q?gDF4POYibSVUqm/E/2md8g4sOMjiu1Mxa5TZc2m9E9mkUjtv6TrVgzRzKv1f?=
 =?us-ascii?Q?4pvDCBUPirpKgrsG5OLMZv4M7Zh3RV/I4rXtNRWqUkV+g5BXZbQE7HdC90lh?=
 =?us-ascii?Q?jwn1VVsBcFTW03fHLp5iLwmJkixuUI03CaayAgkOgEyHXKqk/yNSIVQ2Ij4k?=
 =?us-ascii?Q?X1gXYM0qBkavyZTsXldLg6D9fuX0xZKRIBUyA+SxBYLeIksZMP3FpHNw6xe2?=
 =?us-ascii?Q?9P8deX2HV6bByRcqQzhJzF9bLfku7inrJsTSFmyDH7A9Rwcrx9rzrQZDYGhO?=
 =?us-ascii?Q?z2zg7u320JpZQRKrQR19wRgWc55C+/3KkSdZno8UbhnpFeKxYQ19lHufGojP?=
 =?us-ascii?Q?ayJHBtsSnI7sRnFqUol3PIS6K+uOqYb0tEvhWZtY4EckZemYEKm4LZlKukFB?=
 =?us-ascii?Q?y7qqPyGAPtUVTHWEGBJHl7HeDatSCHXA6kagyTDzB+MDxRrq5lcp58mxPlyK?=
 =?us-ascii?Q?Z1srgROqX7Rg8JQUdtn6IRVMJY2siM2h99gEzrl3cpi+F+nGb5jXDiTmMrZ8?=
 =?us-ascii?Q?OAVjA00=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR11MB8189.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?TqBfs3m0dzxqvCiy1drV5hrNDIEaTYcchM951X6BmTRfM30D+gN3dZsnsGGr?=
 =?us-ascii?Q?pWjtdrWFnFrc9TRwxURKFDrVDDSVHMTRIkOLUdGrvZbTwGMGUmbnZR+XDB1P?=
 =?us-ascii?Q?zlCJEbrgWFzywGNIjgfyZUfEgjdUw+NjO1KUx/UcsgXS97mifsiDDFoSVrjp?=
 =?us-ascii?Q?ljJx/jaQklxKHm3+TB4VY6aJpqrP51dbirzMhL/1qgL6A0TX84FPGMlgknPW?=
 =?us-ascii?Q?f/CXDmZpDqqO0qN+n6s9hFpgQcfrtrjm8lGiE+c8HR9yaC8UxjzBQMAZrY8P?=
 =?us-ascii?Q?UxHyuz2J+GvCPtuOrH0ways+laUSy/nyFb9PBMveh/cilGQBnKim9jiobXQm?=
 =?us-ascii?Q?5NJR28nKHhNNm3Sfjf/njZQtUiVXCPW7KjZj3AP7qEztvaIRWbqzR8Dw3PZZ?=
 =?us-ascii?Q?N8UXnZQ+ifED5joewLX2Fr67vBxnbJxVL9QWZ16sVwIvpZmjbz9vbqGNbRzU?=
 =?us-ascii?Q?IzpG2Omlmpf7kHTddxpESo2a9vLodsz9V8lowXrSL4DLnmpIUHLMguwCan0H?=
 =?us-ascii?Q?Gt/EIToaZ1lF7Q/7o5XyRrQYUxzSs/OxjFFw3dVLwwAMuMy1nWSTymQG9mCQ?=
 =?us-ascii?Q?utpBQ4rHAAE2kQhHNpay+SP8Km4x3v9EZ1HXpKWhg+eKhNWzVWl6VuJJgr/S?=
 =?us-ascii?Q?X0qYNdQ0IQBWChQFqbQkszgKz1iNdpjlqaWGs/7+S6MI1sNLlGyX2iGHcJfZ?=
 =?us-ascii?Q?OnJsChy6PBEMKq72fxcVm7BZDOSVDcD+uJ+pOaLcPyKG5uGHxENW7sXV3ETb?=
 =?us-ascii?Q?ErM5busJtOX1qZlYC3ZxVyz2dNkbZ7UhiS/LDStkCAQ3U2Opn834WxrWspP6?=
 =?us-ascii?Q?p+ienggfCLPKvwQuzPL/8OB+ol/cskbIpndB9qQBJPnWFoNdHWf25NgDVS8u?=
 =?us-ascii?Q?kZ8+8nqaMFtPHl1y+r8DZ3EA4Tjab5dAQBh+PW8hwRYraKFUUhSbpfZ0iF+P?=
 =?us-ascii?Q?QhOVyU9FbdSz24x+j2A8quPEQaiuttdC8ip4D9xvlHdAQauvXwcxggSJjmeS?=
 =?us-ascii?Q?lAej9QoVToqAjj4wDJliy2cAETZW5/juI4EEPxDee2NyZ2BY6HfW69Oo2veO?=
 =?us-ascii?Q?A8mNSdzhNwrMHkSZ8DLnWxavxEfQYrkJUUQdk/O0cUzc5zbWycE14JhEPfWk?=
 =?us-ascii?Q?4OyWuaoo1YP8mJcOxcqAbt0yksC6sNf3bxGAuElvGwR73fm/urAtZkPiXpUk?=
 =?us-ascii?Q?gWc00IiqixnmkqiTR4uFx7rsaDQpgin4L1VYsTndhZWaIGBbc7VY2n2b55ZB?=
 =?us-ascii?Q?TwI3F6BQcheGmG3jfCdPkNnTL0WvUWDkZdXsZk+X+eeQsrJdivL8l/8ABG6Q?=
 =?us-ascii?Q?US+y/EZPVBahZh+orw7oxEwc/dBVSYl54itu8ekTvjqH3reLV77aWG/K4ELn?=
 =?us-ascii?Q?UXTgeFEVfKBgj9wmQxIRrK8aPK8BFy54drNJn2L6ayoVcCkMTZILUA2ZtDTq?=
 =?us-ascii?Q?0ZhBVRW5U8D90Sucvf9Pkrp1ZP6mwKs+wrqHMwub7asO5HmaHycVxfxsy9WT?=
 =?us-ascii?Q?bzeN6ihzgc7RaXtBmXIGFSWbeEBTZo1POI2mJKJY54DOdJXO1WNS2ieZK5dp?=
 =?us-ascii?Q?qHiNc/xJrocCI+pcPomFCsFcsEa6FYW8YOKVmY9cpoIV9oEmWxCstNc/Ky9x?=
 =?us-ascii?Q?wQ=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7518a988-bcc9-40ae-78a4-08dca6f73fa3
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB8189.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2024 07:00:03.6374
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IqAtLUa96vfCXbl8lamOEwV5Fha0iyboM8oV1RPiQIPIwYiFF8WhCe4BLGKgOE38zLMGQbzqFTSv58Seg/7nQXSnX0FGc/WE6KTpdsbzqT0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB5961
X-Proofpoint-ORIG-GUID: 2BacCwustu0tjQM_deCMLA2-zf9uptN1
X-Proofpoint-GUID: 2BacCwustu0tjQM_deCMLA2-zf9uptN1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-18_03,2024-07-17_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 adultscore=0 lowpriorityscore=0 mlxlogscore=999 clxscore=1015
 malwarescore=0 bulkscore=0 phishscore=0 impostorscore=0 spamscore=0
 suspectscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.21.0-2407110000 definitions=main-2407180046
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 18 Jul 2024 07:00:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111395

From: Haixiao Yan <haixiao.yan.cn@windriver.com>

The expiration date of the "NameConstraints.*.cert" test certificate in
the nss package is Sep 4 2023 and causing a test failure.

This commit regenerate NameConstraints test certificates and changes the
validity period of test certs generated by `make-nc` from ~10 years to
~20 years.

regenerate_NameConstrain_test_certificates.tar.gz is a snapshot of certs
files based on the commit which update them. It fails to apply binary
commit, so create a tarball as part of SRC_URI rather than a .patch
file.

Upstream-Status: Backport [https://hg.mozilla.org/projects/nss/rev/1d565dc7e17dad6d2851b2d6ff522c5d6345ae26]

Signed-off-by: Haixiao Yan <haixiao.yan.cn@windriver.com>
---
 ...erate_NameConstrain_test_certificates.tar.gz | Bin 0 -> 10734 bytes
 meta-oe/recipes-support/nss/nss_3.74.bb         |   1 +
 2 files changed, 1 insertion(+)
 create mode 100644 meta-oe/recipes-support/nss/nss/regenerate_NameConstrain_test_certificates.tar.gz

diff --git a/meta-oe/recipes-support/nss/nss/regenerate_NameConstrain_test_certificates.tar.gz b/meta-oe/recipes-support/nss/nss/regenerate_NameConstrain_test_certificates.tar.gz
new file mode 100644
index 0000000000000000000000000000000000000000..568db6e7ec3fde7dfc0b778968b9d9b46f9e1c48
GIT binary patch
literal 10734
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

literal 0
HcmV?d00001

diff --git a/meta-oe/recipes-support/nss/nss_3.74.bb b/meta-oe/recipes-support/nss/nss_3.74.bb
index 4777f7937..cffeee5ec 100644
--- a/meta-oe/recipes-support/nss/nss_3.74.bb
+++ b/meta-oe/recipes-support/nss/nss_3.74.bb
@@ -36,6 +36,7 @@ SRC_URI = "http://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/${VERSIO
            file://0001-Bug-1867408-add-a-defensive-check-for-large-ssl_DefS.patch;patchdir=nss \
            file://CVE-2023-0767.patch \
            file://0001-Bug-1750624-Pin-validation-date-for-PayPalEE-test-ce.patch \
+           file://regenerate_NameConstrain_test_certificates.tar.gz \
            "
 SRC_URI[sha256sum] = "88928811f9f40f87d42e2eaccdf6e454562e51486067f2ddbe90aa47ea6cd056"
 
-- 
2.34.1


