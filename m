Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA773CD13CF
	for <webhook@archiver.kernel.org>; Wed, 12 Nov 2025 13:44:36 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13698.1762955072555385052
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 Nov 2025 05:44:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=bJbF+4Id;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=3411d85ce0=yi.zhao@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AC16kLW1293390
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Nov 2025 05:44:32 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=gcTdytGUngm2l+mwRfegV1aGG0mJLjcxttZkRBAoMbQ=; b=bJbF+4Id70o8
	9b3K0IT6NjUJJip31P0jgVMnlwUh0mqO0aesw/qLrXOHhey4QYDcQRE6PzuaGyom
	5lNPFp1m/1aDlIiA69dfdPWEW39AS8tuMSKGa4xf6Amm8YicWnlr2/oYoHFoWg7r
	ih3JEGPJ0bFEfJt5jSD8y3sddecFpN/REi2cDWk/SU318107L8L6xXXV2rl82b5t
	Vcr5gxq/kdL+G4SS6E8+k1keazox4DalO6Mthp0QoI0bQyAs6vhCcII/tQmlgfiw
	1zl0e9m6BjO0Rv5kMKjhO0D2MVofAZCb3d7x4D8nxRisIif6GuBqq84jDl5DV9Zv
	xFnu10HDAQ==
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11011029.outbound.protection.outlook.com [40.107.208.29])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4aa213546b-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Nov 2025 05:44:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lrjV0DPxrStntwoGd1EYZJbAMddOOlgWjBR/CXHEm5znA11dHGbsDCx9heCs+Mnn/WRe9pch7inGkAzY/rBbyOEMyKuBiLiUVa39emr2slcmYdCQXltyIY9kiUKl2mfMPwKYCZuutsHbSDl2orojZqK1f7mgG+h4qCIQvGC10ugG7tleTYgEWA/zvWxNlIphWneOD5I2xWmbcu3ssNL08PepGndz4r92QVrxqWucTr//6ZoOFIpCoxX3lHCBVUPZS3+7ntcOqUUhZP0AbOHG8hK8DLvR2XZQxjBrZ3DUL8bj/0Kw+ZvBjzUcw+y7lBLRBa3XVWXoVn+TsgB8xyBY/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gcTdytGUngm2l+mwRfegV1aGG0mJLjcxttZkRBAoMbQ=;
 b=IDqKNzwYGjQSDRJVctGFFILX2uXykOWcTFHMeOEDFfhpWuIr8QIPiIw4DL3EdzcSQBIs39+AdSVb+qdjMylYrpOJPjw86sbVY7F7ATpuUpTuuL8aZBXE2LIrKWPBF5qxtaXcgxuKKq8dGiLPyFm4SBTDGhBAoeQihZkL+DJVxzrH+Up+1AlCCrlJXqji6ypmD5aYVoY3/XzGPhOVQgbnej7weMFNLiRGsDFDyf2Dz+XCTtZCzZ82EzsVaOyNhWjSI3Lh7bTk5hyoToIb3vTy1Y5U21n+EJp3WxQIvjNCXnqETrPWglnA/cRczmAdq6FNJcozOteaHTxbHpfstdjnjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 DS4PPFABF58482A.namprd11.prod.outlook.com (2603:10b6:f:fc02::45) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Wed, 12 Nov
 2025 13:44:31 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%3]) with mapi id 15.20.9320.013; Wed, 12 Nov 2025
 13:44:31 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 07/19] hstr: add UPSTREAM_CHECK_URI
Date: Wed, 12 Nov 2025 21:43:53 +0800
Message-Id: <20251112134405.3706508-7-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251112134405.3706508-1-yi.zhao@windriver.com>
References: <20251112134405.3706508-1-yi.zhao@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR03CA0125.apcprd03.prod.outlook.com
 (2603:1096:4:91::29) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|DS4PPFABF58482A:EE_
X-MS-Office365-Filtering-Correlation-Id: 06ae5db2-9803-49e5-4bc2-08de21f19b14
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?Jzf4S8BVEDKIVlTJ89GEeyH7Prj1uXUGrmQDROMVnOqzq6ll4cqNBYb/MkGF?=
 =?us-ascii?Q?B0IBNx9UiS/VrcZsw4Ht6a7sXhiGJmSivhlX/slYdtlacp3PZZJVHhpFZROT?=
 =?us-ascii?Q?Gv9/QwscOojpTTMc3WlfeYwMGrkHRlWiHd+rUN/aOXqYqQrWVdwqWQrRtZYZ?=
 =?us-ascii?Q?lAgxM3dDK0ZK5nqoST46P5empmrlPMWgLm3B7svHOn3O7aE/RchhEuXY9+C1?=
 =?us-ascii?Q?BizdAbVqohz2oOGfdoP8iXDKNGKfPLK7WSkTlc+c5W8W4syopvVuGNQm/kD5?=
 =?us-ascii?Q?DuHD/dJzrjTm2ygECjURUqkkTitdOrOUqH6//yEPkAkxXghjlbOVD488BLkf?=
 =?us-ascii?Q?uxpk8WRx8dpsxcrsBbtb4q5owwXepX4jGQRH/9QdPNM66iit8diQybLiFh8J?=
 =?us-ascii?Q?Ls6TYZBGS1jVM9RAkiGR/SYRYrXFBFePybr7T8QtbDIGf1gHm0Qi0MTe6tK2?=
 =?us-ascii?Q?GsWSmApRiFxDckUxTrzehliuk8ZSRpXDskn50SS4svkmQ97s80VQjXHrR0XA?=
 =?us-ascii?Q?6pXicq+SSku1wG4Mtx3MtOko5hbIcSIpWze20fffI7WCLeReAwWeLqr/1Zta?=
 =?us-ascii?Q?M3Ix/ogMIk9YNb9Ck7veJNnBseiZq3lU2up+Hbl+ODD8n3mjCreVJDUv/MBr?=
 =?us-ascii?Q?LjlrFsl8NauylvMmocxmsukVGF+V6OSuPNreqnJeNWbNaTAexs/2mm87OzEm?=
 =?us-ascii?Q?/1XzyGNIubia3TMiZIyWZfPk2FpbRimsYeE8pPh1tXU4qUlXq8aGNQjRYsh6?=
 =?us-ascii?Q?q2rY/Sy4x6oFnK8saK7CuLuSmROtM3CneZxjTcgk9+NVbLYABHHBp9G5DIy4?=
 =?us-ascii?Q?5BIpLaNoOoSY60eBRcsK6N42RoYyGKLfUIvT/7Nr9StfpLwSg/pXej8Ys8pq?=
 =?us-ascii?Q?rFGoErkwxVqtxc+fFYeyZ6B+XsEnD1XuEtFvKl32EaiARQ1ZOj+ev8WwzztT?=
 =?us-ascii?Q?/6SDkzlGdyCGjGbJ//xRIb2amMmQj+bq77dk9fp8XOI5H068/YtS5WHwvydy?=
 =?us-ascii?Q?c1vT6vESbXZWPQYroVvbyWS0kelMQSugQbEOYcRyOtRhHGjL+pNpO7ZLxwWv?=
 =?us-ascii?Q?SmFtLvPtYIiQRCceKPCzTIpahDfYOwLYdobCxGeX1mvdQfpOWkQdHrMGSS2d?=
 =?us-ascii?Q?NON7ZOZwACn+n2ugeEXI6Fcitzcauy4TTqDUDchbVAtp0avkm27bjrrG3x0a?=
 =?us-ascii?Q?G8swALVtGhNnbq7eNMZY7T8WdRCeI4oUZVhE270dZGoHYzfpUM4yMx3WpvLW?=
 =?us-ascii?Q?65SK4VT7dkEGy/5myWE+dKMmH+ZQpRQ7tz0L88hadem22yH057wjz1PNwR5j?=
 =?us-ascii?Q?4upvsFlQh4M+KES6x+Iokw7FlQ4HZCY0YBqWVi+PDvsZXYKg2I43Y2/qJIPO?=
 =?us-ascii?Q?yzEqhHfGTjqcb5KzAxYvW59Fz5yXZJlC/NN+ZRDVoxUjWuwL2mRui9XwoaZs?=
 =?us-ascii?Q?aPqoAfOhEPndgHtHmhvxMzr0wK7gieKqQoQxuFIGlNREi8AjaIaaUA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?YQcGYWHcm1YdVlsjPmnOYxGvZ+9vXlXVvx1gNqHxUV/stln5khCF0xpApwpw?=
 =?us-ascii?Q?HEpe2Y4dgQZd1FCSpQpfSYk1YBCScVP5aw3xabtpSEGIVsRbZ1padsdai5/U?=
 =?us-ascii?Q?OYFQaRUb+KaW97FkWCtTYPuuq4SjBMYFHiBsYHeArY3LZLNX7NZVlGcrumAD?=
 =?us-ascii?Q?g0rLEAfrjpDuFT/3X4MzMdJ7Hv5ySFAaRJIyW77XC8a0u9h/Ynw+M38voUXw?=
 =?us-ascii?Q?7vz7tZKOMXk65ZO0H4oHmu6/Bu4tcs+lDhXvSmSollWZzezXsFybdy0MHa4l?=
 =?us-ascii?Q?e/IwjXBH6ctG5LNLSzelg6bMyc1T3Vsz2VXzDANXqRcw8g0tubwDkL5KXklY?=
 =?us-ascii?Q?xiiL9o/tEu0ZyQylfKJReW6q9siZ5qiEOyTHwJy9W885Rz1Eq2Jynj4x5O0U?=
 =?us-ascii?Q?IhYZwk3CNryzDqW39P3jqHEkYuoskoypY2oiHoDOU94eCWMSDLo+Ri5Gtgfc?=
 =?us-ascii?Q?w30Jgy+BvrbhUeg8+f7TTh1HP0UuvPaaInxMAQ/Y8W5ZNFfL5PnoqPmUCVhh?=
 =?us-ascii?Q?Aqtjwoh+2hhD7aiCOsTHsoO2Cs0alWXwd3bFR343BchKxnoJVFX79aOgpl0M?=
 =?us-ascii?Q?ygOpa59DlA9fEk0XsXooKIf4Eyvzbdhi3UebRKrnewJ9wNVKiN4gLhDo5XkA?=
 =?us-ascii?Q?WBV74Qt6jEYcX77lGD+0VuxhGCjyvt3SSXZtcIxBQUnasruG+asD28k1s1IX?=
 =?us-ascii?Q?y3pqGuNa3ACVPW8WEi/jxab5/cqoor5y2Zk75sEu6xf/nG/AeGsnLizCCE2T?=
 =?us-ascii?Q?UIwb/actv8Cxgrh1xeHvST0W59KlHOH7cJIANNEdPygxBdeY72NreL5QWI1+?=
 =?us-ascii?Q?tlx/O85M6hgKbOxPUoVby1wM4oowfRmDznNWBrZVwPuKQ0WSU+uXb5lSZqi1?=
 =?us-ascii?Q?fZt8pk+QemcT7zDvKZbh1zqwJZWRqY3r8K7HMFyRh52642KwHP+9Z7VSW059?=
 =?us-ascii?Q?PSSJWQzB6yK5V4EywBkmiLJ3NvbtbFwEMtzmDuJIGANdXFPD3tMK/qN3b4zH?=
 =?us-ascii?Q?rg09x9ZW/AuZzGCIcu6FY/uWFm9UVUG5D8aO5YDkfiXF9aZVA2QEdo5Pqa5A?=
 =?us-ascii?Q?xMUeMmLUkoVU2ZW5FyneyDGTtfK93xeqcrubkPClEWW1Lapje8Fq3JzxHjic?=
 =?us-ascii?Q?olDVJtH/8ALTv2T3K/8eAR/oGOxgfMOlk3he/ICXgCDJyoUtK5yeYfiftNPw?=
 =?us-ascii?Q?p9X69VkPEAI8SJOJk2GKYR19ItFc5qaNxsbkTwqGUv+9NF+Rdu9FO1QxMg0x?=
 =?us-ascii?Q?Lnc1O7nUVJsBvWpBSzDs4m2yog8DXJFmvNHxQ2XzZe/f76BVBTyHhPSwFyhB?=
 =?us-ascii?Q?NPDDLn/5JGXZJX5Ckm5FL+n9W5svdTUyjWGjjPqDRXx5fEkzuRBmtG+3pYRk?=
 =?us-ascii?Q?fjfWwTvJKWaYN1vz4qz8edxSg4yYWC7fdsSQg3xIvzo8nIWKlZceG4v04sBV?=
 =?us-ascii?Q?UuVOfnkdK5SXp+6+i5m69cWtetTiEM5fWVrnZdibNKeYOLYVMX1X7nOcj3oz?=
 =?us-ascii?Q?XTNNqVRI8a596P0OpothAo07M9Xga4EKIXh+EWQpoHgRvJF3S0RyCaEjj+Jl?=
 =?us-ascii?Q?GDRmYVXSln5Bpj1UY/Jhplp9VUCbdTn8xV76JOk/?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 06ae5db2-9803-49e5-4bc2-08de21f19b14
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2025 13:44:30.9959
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8AHswc3vODgT4MpEfF8rUcVNN6dPPMPYakhVi6jXrBGBm1io3XGj64o8XxX7oTd5GEpL0WY+y9MSWpEaKH7srw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPFABF58482A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEyMDExMSBTYWx0ZWRfX97yrawGScH0q
 SOYfVDaM3yGN6dCLRrpsJOWz6sm47QbtUyd1k8vzrLlEwzlnze3NV6JJGOOSXprjMqPM0OvyuOi
 Iao2egj2Ie52hVUHgYPHkK0x3uIP+JWC4MaHNhx9MNEuuodI/Ofh4NAQJDmfqTUn9JMGpWeaznX
 3EgMFZ/xL1Tb4f57+Y6m9t9cByP1wvHxErNF+aSJ+C84D5ShaS5ZNOO+B01mlzhLXU4HqSPCBH6
 yuzjUDBgL4MAZkrYPuM54LH2A54jDQKJIjF9Ukt2kLrkD0B4StDyvXbAoG2MTgW5HTXlejId6Mg
 c9uZ+wXzEeHZ+qRyGNsION92hQdR6IDVvRz1CvHbB0ZhR8v8yFZ4B8aj7Ycx8hQZFKTp0m3Pzln
 4xZn1gIUISMNg/tzVieGc7EnEN2/kQ==
X-Proofpoint-ORIG-GUID: 6yMDpOHDW-Pxo5YQbh4PEJqY0xuxn5ng
X-Authority-Analysis: v=2.4 cv=XPA9iAhE c=1 sm=1 tr=0 ts=69148f40 cx=c_pps
 a=WFfob/tpvpsU+KY5JpTU8Q==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=Ks5_vexzEMRq5Txj9KgA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: 6yMDpOHDW-Pxo5YQbh4PEJqY0xuxn5ng
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-12_03,2025-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 malwarescore=0 adultscore=0 bulkscore=0
 phishscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511120111
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 12 Nov 2025 13:44:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121536

Add UPSTREAM_CHECK_URI and UPSTREAM_CHECK_REGEX to check the correct
latest stable verison.

Before the patch:
$ devtool latest-version hstr
INFO: Current version: 3.1.0
INFO: Latest version:

After the patch:
$ devtool latest-version hstr
INFO: Current version: 3.1.0
INFO: Latest version: 3.1

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta-oe/recipes-support/hstr/hstr_3.1.0.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-support/hstr/hstr_3.1.0.bb b/meta-oe/recipes-support/hstr/hstr_3.1.0.bb
index 0ee900ca3d..96be8bd09f 100644
--- a/meta-oe/recipes-support/hstr/hstr_3.1.0.bb
+++ b/meta-oe/recipes-support/hstr/hstr_3.1.0.bb
@@ -14,4 +14,7 @@ S = "${UNPACKDIR}/${BPN}"
 
 SRC_URI[sha256sum] = "4dabf61f045f022bac8bc909e5fd96041af6c53df56d97dfa3cfbf49af4453a5"
 
+UPSTREAM_CHECK_URI = "https://github.com/dvorka/hstr/releases"
+UPSTREAM_CHECK_REGEX = "releases/tag/(?P<pver>\d+(\.\d+)+)"
+
 inherit autotools pkgconfig bash-completion
-- 
2.34.1


