Return-Path: <abhishek.bachiphale@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 681DCCD4F3C
	for <webhook@archiver.kernel.org>; Mon, 18 May 2026 17:14:18 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2383.1779124449343396662
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 May 2026 10:14:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=B0UzGZ9B;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=95986d85e0=abhishek.bachiphale@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64IEJhjm1574516
	for <openembedded-devel@lists.openembedded.org>; Mon, 18 May 2026 17:14:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=CBCBySpd0s0Ja01Lfj5M
	qwUnpV9QwudvbBZROKlsaZc=; b=B0UzGZ9BTW/KkH9PW2aF9TL4/0dkMJ7sBnkC
	wl+iA6GxNaJh0wzbqIpnKBqns/wiZMC9rmmM2P+yOORth3v3RXogyh+hNFdKFbD/
	zTLuNuMUF/BE9QwN/IjCLPHQyMLJSBj4ZjcF1g/wg6rgatj1qt6sl2xrYZ8bCd+X
	gXuiXB/aFAqDW95OV8y/Pv0Sn9g2gIWbMl8Dx/PAXlR/QSOD+wJiJjPcpd5Ev64b
	9fwbnqrNKtbG/XNv/03caHGFbgCkZcPc4OaFWKVSDVA+ISEO2bEdJ5czSggJatzB
	QfSQVgAzdGJdH7FA+wvvnpABvtdAE+0XmF2FdB6/9rePX6s4OA==
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11013000.outbound.protection.outlook.com [40.93.201.0])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4e6ecf2es1-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 18 May 2026 17:14:08 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V6ukFIDc7hkVfND9SJ9tkn8eMk5nitkWtHgRIF2jO2LN1vEw8mWx2Kp/aytB4QVUu1gkzM3qr9wY2GcWh24s1IVH4rbJ8CYvSUi2VgSHxCLEg1kjt7h3JIKWZdHT5YveDK92GspsyVB5AcDdllKTeym84BZVQ39+/JZWJp5z61jU+i4RcGffhj1QRnxX8bWt/gcvfLxdHz6pOSU1T6iqqIw7iDmaRHU+6zI+eivUsbh1gEYf4uYdsX4jKFfRI5VWa7udNqoCzSFNaAGrQPW/9JjW9Vzngha1PtP3w/nOzEjFhuiT+JP0NcZi8BSLKVeNJWgrQhaAMbDKVJQ+G0k8tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CBCBySpd0s0Ja01Lfj5MqwUnpV9QwudvbBZROKlsaZc=;
 b=SK6pWnzwI26O8ki/sxaHhRUurnaMIpDsziBUpnaLH1FbtD/FnegMajP00pZbNrFFYY12WUa0jw+y7GqtQ6eDytaIG1JNeH9eJDnYV1CIGl/z+EuNC5oKCwunOcgAYenr9z0gM6OmQ7scens4QdaufpSUCRBgjuVVVIIBhmlUFdzK31qTc5HFtBkFqmYgTrdNjz4N9KumcyZpOxGHC9EVxngVYXTYWfbo2/wn2UKYzkHXlO7KcUZQqvR3UsaPt6gnW7q0UEYasSxHVaRvwo6NY5ena8cqk10LE5iIY+BGZuSwSXKayF3l6OtlkFkyl4OvxAg+hdx3mRqCmJWqaDb7Ig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from IA0PR11MB8399.namprd11.prod.outlook.com (2603:10b6:208:48d::9)
 by DS0PR11MB8739.namprd11.prod.outlook.com (2603:10b6:8:1bb::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.24; Mon, 18 May
 2026 17:14:04 +0000
Received: from IA0PR11MB8399.namprd11.prod.outlook.com
 ([fe80::ea10:3d10:93bf:f83c]) by IA0PR11MB8399.namprd11.prod.outlook.com
 ([fe80::ea10:3d10:93bf:f83c%6]) with mapi id 15.21.0025.020; Mon, 18 May 2026
 17:14:04 +0000
From: Abhishek Bachiphale <Abhishek.Bachiphale@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 0/6] dnsmasq: fix multiple CVEs
Date: Mon, 18 May 2026 22:43:30 +0530
Message-Id: <20260518171336.470608-1-Abhishek.Bachiphale@windriver.com>
X-Mailer: git-send-email 2.40.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY6P286CA0001.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:3b8::18) To IA0PR11MB8399.namprd11.prod.outlook.com
 (2603:10b6:208:48d::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB8399:EE_|DS0PR11MB8739:EE_
X-MS-Office365-Filtering-Correlation-Id: b1bc84de-a8ab-4875-8ac4-08deb500dcab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|38350700014|56012099003|18002099003|11063799003;
X-Microsoft-Antispam-Message-Info: 
	gu/SqZtsjTkWksHpWdyJLmM3KnbyNSRER4aOf8l5aIaJxGiuU1RPlzmbcL8/oIqb67RzpJjiJZiNDZmOdSGJUVwc0R0HUnDf8Nay0LahAfgzVQEukapFWHKFadM/AY4/u/u8ozasY4+iyxNc1RjIFURijmQtotjbPuaCl7RaomG+LJxZ8PYvL6J3dKoq0Dz2y2cl/ExQSuTEubCOEg8ztHz4ut7nuGxLN+9PbtBmev3ewq0rYm4xhL3jS7LyLaPQ/Zc0+/hxcncFG4GUcJlGiwfN+qfXU8pxqpSeEYJiIbXQI2X094WaCYLiv/Y7U122Bhbm/eEmXtA+G3HmmyYVJ3ch5vfOBvOyzEWjlpY81c84N2WwzIMcHrs4qSZHDkPvXqh6kW71otfaHJ/eNLLvjd4PD0zLTZrPHgcIlLe5B+iP+kDJfwjDgtn/ORzLYAwA2fey2vI75Ifdk1VQdILBBwY0QqrYBBrSBvJWT860M5Y9s4Hfw01E0ub/eBRGL6NkWQ2hUKwhhMvR1R+ET7O4GeubLNo/HxkiZkVezZgCp4vmTvY+RchAHGUd1IO5zk9cGTeyfR8MAGqj+iuU8vPKlNtFSVjkJsZvI8du0BoLrhrMJlKksym+NbtLgdAxeIME1zHndV7BHr3XR2Fpd81lhGWhyztzuHtxGtn6otChIc1adZsKGqliiZfYP6E5H/NmyIEstlurf1O4L7hlt7MKjQ1R0S4VAbBk8ydkpMRJptt2aoEZFXU3RzlaC9yekRlI
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR11MB8399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014)(56012099003)(18002099003)(11063799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?+5SlMFtqe0di7jPezlSZGFHIZTumRO8cjF5Y16aw/8xMquH8UY8UxQhWKYcy?=
 =?us-ascii?Q?93eYakX3KVyVP/VsmzvU1aLF63zk3OAYLgzf86NJR3Ir8uMLDXUmKFYa6fiW?=
 =?us-ascii?Q?aBe2CMDEOvqf2E+Vqegkihb8+ZEk3eQlsJkMXXbuexAOu2nFfKcDZXpQcXuo?=
 =?us-ascii?Q?DC9x7EarZtjBAVWjgU0x+sNseI2gDKRG+DwGZClbQfr4NjPC4oU97cN5iGzQ?=
 =?us-ascii?Q?jEgmIbHNt241NsOqRFz7FpoSnbxiLX4tMLdcIBVgHPIuUj9xdPhwOjXheqjg?=
 =?us-ascii?Q?Myp+Wh/r9ehQ+hNukE2ZJPJj38FE8LKZhsGmUrY3vn4ubh1JyZYBK3/0/U+2?=
 =?us-ascii?Q?u8pigfoHNsa9DvX7+fKs+4DX45Ijq67OIBB8uP4F1q6bl0e6MPlKDrXHS8zt?=
 =?us-ascii?Q?Uwmy1uhaJSymoVNOAdMbRIvPxiCbTTLRLnr6xbo6DqSHC7bsz79y396LCF6g?=
 =?us-ascii?Q?cj01nFJfc3LTMu0KCdDff/uc9f9HTmhxEEqW456sSAhkxSmBYZb517FgjXPn?=
 =?us-ascii?Q?qkDwb1u3kQcdOFfAOmHkRdDRVNil/02QgIld2i1xakUUO/KT2MdNe2l+F/9e?=
 =?us-ascii?Q?z93XiX0XHYgbSSvJDi8B9v89qcGzK6De+oycWradmLJQQnxNm45Co6G7288r?=
 =?us-ascii?Q?s2E/fdoD6t8jByjd3+rnF2nOFN7S7gqhUwwYCXz5YYGpegtBgua9xNBNjize?=
 =?us-ascii?Q?3PpkVTdImW1t1aeTAtDKvBPLjEz+DKzk1sTffU4ODme57wqvEbA+BuDW9VSh?=
 =?us-ascii?Q?zHb2Fbb7UCusUQruibVdYpWd2/4KWYLm+3vooXrO9TpfhiQRb9sAXg7Cz1vp?=
 =?us-ascii?Q?yQwOBykTv+l/nxZuwk2urk6sQ1Kmb2TZAxDy1o5mtpPvFmkinDtFCwzGIOV/?=
 =?us-ascii?Q?ALwstl4hozIMf5AmCdIEpaTkBqORclN+La/OHVpgRCeC5XIjEFQqzKmECcsr?=
 =?us-ascii?Q?RceuU/LOCZKEpwI4BvJhGyNc6PzuRDM4Q9X18Kr3O7SVzawQLGE8G0Ppsyc4?=
 =?us-ascii?Q?uKP/jarVlF+f9MxJT5RKtn+zO91v8zlaZqJO/vxxW5j4uZdIPpC7T00Tjl4K?=
 =?us-ascii?Q?NzUWKKdGAQlDthEr+yk0QAwRM5A8CBpUFbMECGYJ1gvmtrFifSWeWkQ+4aIx?=
 =?us-ascii?Q?W+lGRiG7KRr0Af+rRKFmZY9rV2FOaLLix8sS788tZyUMk4ZEzQVoBMTnfqYJ?=
 =?us-ascii?Q?rvmhlZ4VZHMKtOSbMUt3yAjMjBQGRFI7T2T+svBRYzEkFbJcGZjdcGzYoPzB?=
 =?us-ascii?Q?xPRnfpoo5/JU+nOinHE7hVY/HyFkubR9oWNBzIheEq8MeGVuN+VyPZUFExNp?=
 =?us-ascii?Q?fPyKSFGg76xNy6drwFkLSbmXaQ34im89Q/0NU6j45Z3LCzbC4XUYebvhyilt?=
 =?us-ascii?Q?B4zSuCni2j1HTs8Atdcb79SYrSk2alccAdz8vU/w/UrtjCgNS0OSR2pMVijs?=
 =?us-ascii?Q?IeN/qmbWYJBUzIP6DNAdiGUPqnyJuV7meVK5HPwcYWV6omGhgBsKMxYyaPTB?=
 =?us-ascii?Q?LeLG01tVn95rlPHyjf7xFnudc9wF+757iRx7HMz98VkJydICUzB8I/klcNFR?=
 =?us-ascii?Q?AGZfNsWpcYFXg9VRKzACjERNL8AYktVfKGqi4veyVMbKoWcnfXW+TxbbKmgD?=
 =?us-ascii?Q?1Mgz+vlr0UarVtyZSVCpzwGTDZwi6iD8hYznND6fj6gpx5gJJXfVyLnKoT0Q?=
 =?us-ascii?Q?tGiUk9idHzloCRqTmSxq7P115thx43NucAtHzflZt9QRwT/1YlmM8ZpFLhCu?=
 =?us-ascii?Q?Nu7W/TZ6nZnd5BWYyb5hRWF7JJF8YC9CuIqzAkF1LwkLaczEE5Sp?=
X-Exchange-RoutingPolicyChecked: 
	RqMv4r6DECjMdqpkcEDryBZuUhMSyipbzkoqjwKYKi8Q/3q+3dWf40xlGs3TfcYQ4c9f4zY7E1AFSpsUnwBaPIj+mjwWx8OS+G4HEPf5RI9LhKtQG2lGOOOq/Emp/L9GQBRhplaNFSc16T4GhnhBULGLIF/n+o+2D0lxMwQrX9ymK1VsGrAk4DZTrWEcKSOmzIYjKQjZtDEpda5xNIevFo6KMT6a98cGyBJR+XqH9PMVruQD7lU0HkcZPluJPQ9RTHolWoGLAII/6x/aN2bjA0gIyeUDCGtPVwCmX/53fhd9Fm4rq28ZLgmwqHIZKjDJsMNAXHJ9F0nsnbuNlaHkSg==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b1bc84de-a8ab-4875-8ac4-08deb500dcab
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB8399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2026 17:14:04.2255
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 84BwQNlFtIDQjghq/B5oe67RiVIWXTpf5h1wqHe8s0RfyWHGAjTSBadz63lg7QzbMh9l0r0Vc51Fb+dHOYRld1j9QwUyhMpG5EYNGi7uJsUD6Lgr5Z6RhFLDUItTbISe
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8739
X-Proofpoint-ORIG-GUID: tHIWsuHbU8Q2SPIFb2EYqXmn3h4a69kr
X-Proofpoint-GUID: tHIWsuHbU8Q2SPIFb2EYqXmn3h4a69kr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE4MDE2OSBTYWx0ZWRfX37Oxx9luB6EU
 NY3bpQB9dPUGhQe/9DGuD/nDi8HLYyyF4F4STCq9lNWe8jd7CjZiXYcbhDZoYY4yHsqjYWzqTH5
 Gy8unoAGobLuFw1aRTEqwPyz31md8IsIT2nD1ydaAQGV+/YEUNMNfT1oBzfrsgwxgxh1Bued9HS
 EurPz75ksaZRoZALVVOoHOI9X1fsbb7R3NTPJ1JcMkbi333cUo6S3qWqcZthwo4k9NMxDTt5qMO
 soDvRWJI0NelRwXbqs6ApRjw8KipnHdG2Epwfjp22fUMA9Hn57yeQBO5bZf1bGXsKg5NyJUFTU1
 IOd2GQ1cWC0WhmNDO4L1zVroaUaV4a7lR5u3aSbI/BVznJc1suBz0aGBgoAveqcGT3F3If4HwpX
 d7KUzMkQcRdveIrv3M3YZC5xjePxvEzMm1OZu8B6l6grhYWaBEA7q7Hn979VYzi2P8yIsiNorFE
 tNqs+pGQMbZ50LNhEJA==
X-Authority-Analysis: v=2.4 cv=dK2WXuZb c=1 sm=1 tr=0 ts=6a0b48e0 cx=c_pps
 a=snd9/+/+5efdJOckOpJmHA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22 a=1rmXSXA7gf5JGEuglL4A:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-18_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 clxscore=1011 phishscore=0
 impostorscore=0 adultscore=0 suspectscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605180169
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 18 May 2026 17:14:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127051

Fixes:
- CVE-2026-2291
- CVE-2026-4890
- CVE-2026-4891
- CVE-2026-4892
- CVE-2026-4893
- CVE-2026-5172

All fixes are backported from upstream.

Tested by building dnsmasq successfully.

Abhishek Bachiphale (6):
  dnsmasq: fix CVE-2026-2291
  dnsmasq: fix CVE-2026-4890
  dnsmasq: fix CVE-2026-4891
  dnsmasq: fix CVE-2026-4892
  dnsmasq: fix CVE-2026-4893
  dnsmasq: fix CVE-2026-5172

 .../recipes-support/dnsmasq/dnsmasq_2.92.bb   |  6 +++
 .../dnsmasq/files/CVE-2026-2291.patch         | 37 ++++++++++++++
 .../dnsmasq/files/CVE-2026-4890.patch         | 50 +++++++++++++++++++
 .../dnsmasq/files/CVE-2026-4891.patch         | 40 +++++++++++++++
 .../dnsmasq/files/CVE-2026-4892.patch         | 36 +++++++++++++
 .../dnsmasq/files/CVE-2026-4893.patch         | 34 +++++++++++++
 .../dnsmasq/files/CVE-2026-5172.patch         | 34 +++++++++++++
 7 files changed, 237 insertions(+)
 create mode 100644 meta-networking/recipes-support/dnsmasq/files/CVE-2026-2291.patch
 create mode 100644 meta-networking/recipes-support/dnsmasq/files/CVE-2026-4890.patch
 create mode 100644 meta-networking/recipes-support/dnsmasq/files/CVE-2026-4891.patch
 create mode 100644 meta-networking/recipes-support/dnsmasq/files/CVE-2026-4892.patch
 create mode 100644 meta-networking/recipes-support/dnsmasq/files/CVE-2026-4893.patch
 create mode 100644 meta-networking/recipes-support/dnsmasq/files/CVE-2026-5172.patch

-- 
2.40.0


