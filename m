Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF76FC83F1A
	for <webhook@archiver.kernel.org>; Mon, 21 Jul 2025 03:02:39 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.31665.1753066954584291963
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 20 Jul 2025 20:02:34 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=92974f89d0=qi.chen@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.8/8.18.1.8) with ESMTP id 56L1VRa1760718
	for <openembedded-devel@lists.openembedded.org>; Mon, 21 Jul 2025 03:02:33 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11on2082.outbound.protection.outlook.com [40.107.220.82])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4800k09hfs-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 21 Jul 2025 03:02:32 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GKX+u6CyEPXdGF0IDQVlGJ5A30mRz3EUSSMSFM9Q6ApKyZI3+VmSgZFugvMdSygeM0xUniJJ6DWJQ+rXEknHhyZYkYomCG0jDcUkcQC2d9020CWde+n3CZuSNxsojgoRm7ogVB1OUes+e6QU6MAz2alxy+N9oRQibecY7c4i/6297pYX7Sf6JsawGleHLm/T/ZPVbMK7BQtWIX68QjnZg521eMW1xYryCzKpJSYYM5fudYD/MuPG287HRpThEtuTUDb1lYyf5lOpex/KHQUqA19Z0/vJ7MffG5H1abKVP/4gzocltrPNm55nYHeRnYXIH5Y9di+KG66XzktZLuCRrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dYotnTIpTjomnqPcGvybnKWVWgQ9L/ldrr6WYrO8S1U=;
 b=hPMGYClWBBnfL7/RJ2jk7A+p9tEv8Ev8q8WkChh6rv5BEr4DYEDbcP00FsJWVqJReA7B7u9yo63U7eBDU7dbAXW2La5xd/AeDOUHgPlcKk7PcarShw07r3KNtHw71Q1TLTlRh52Dpt6JvwmHXi9GgnRj447wVOppgg6FZwtymYYoEa6BEaqsAs1MSJ4FNCWl+mbQc/uWpVMNUvx8xRFV6o7Bmi5nbJD5oR/3aBUBpaw6clyzgCQStcPMH5K0gblv2pcUYXcwxlJI0eP84F9MiE+yqNjNqZd2Bgx8D2EOAS0k560lld4W962Pz4Arew3U/7rjf7eEfU6+1gEwS2P5IQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by IA4PR11MB9250.namprd11.prod.outlook.com (2603:10b6:208:56e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.29; Mon, 21 Jul
 2025 03:02:29 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093%6]) with mapi id 15.20.8943.029; Mon, 21 Jul 2025
 03:02:28 +0000
From: Qi.Chen@windriver.com
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] wxwidgets: fix for multilib
Date: Sun, 20 Jul 2025 20:02:14 -0700
Message-ID: <20250721030214.2074503-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0162.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::17) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|IA4PR11MB9250:EE_
X-MS-Office365-Filtering-Correlation-Id: 788482b3-6216-42a3-9cd4-08ddc80306a7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?gVWMRitB9XWM+ilbYafpySU+qpu4EMKva0Hz5cmiI7GrObkrksZS/J63bKaC?=
 =?us-ascii?Q?J96VkF9hpgfkpXWqg95hdpr+RQjqc7jS85+xd0Ram8gYgIG4SE353Piuza9I?=
 =?us-ascii?Q?5DPmkVIzrHrn4YNG1UOOLOW9RDGE3dqy9tu8lQgkf/eB2mncQ747sqdx7sPw?=
 =?us-ascii?Q?xwEb0cLjYutRDAOjLrzoxTJ927rAPO7NDiEJbiT0IJaDhcYe/85GLq7yxiTy?=
 =?us-ascii?Q?b63bTCLCsHs2CwcmLTg0KRPK09QC59/+bay51mIYPCYN9injStZIhe/U4C72?=
 =?us-ascii?Q?heRF2B753wb6fEo9KdMQ2tXKquxlMr5BBn69YHq5GeOyMWDRs0mMPiaAjhf8?=
 =?us-ascii?Q?55888kIYbQfVAi62A42JR8IRJkRvPjyVUhaNhu3uy0Dol3Sh17bGwSE0Q1sQ?=
 =?us-ascii?Q?ykHBkOvBMT4ahkP00955YuMni3S0Y968WrIWK8HBCEd/h72uKsDBv9OVgXkL?=
 =?us-ascii?Q?wdLoJR5k4z3E9wDZ048oolFb+Tp2Fc7ADPwe3CSXlqV6c2IjY1nHJgRO9sfi?=
 =?us-ascii?Q?QLNlDYbIwHkN5VNQ8A13ihj2l0R3ZYErfM0OMNDAACQ9o4Y4Oflc5THNdofq?=
 =?us-ascii?Q?CqYOodsQSwmsvLNb7hl3xFdCATk2O/s09YK6anhYllwwOiM5EUwXI4Qt9iU3?=
 =?us-ascii?Q?2g8qyBm0maUKCmPLEa/EydogKClmzjnfPG1+DPZDcyf/Ur4Xq5T6XD8KWz8c?=
 =?us-ascii?Q?GgzSl2enHQs3qYBq30LRXC6T++Ap6B/OtYDoi8SHZTHklX8Ue9RuFTqDAdai?=
 =?us-ascii?Q?dn8W3Miz+U9u4lyHH8+PlTV4NSNGbt10F25/opDriRgdA5NM1csvUEa67Lq2?=
 =?us-ascii?Q?FdsDV/1kc4kl3a/boHbsP3mZTI2Ea15mKEDgnrYs19flLqggbAgTbiTIFqEU?=
 =?us-ascii?Q?gIXf75cFpbur4UdjhcvNFWA7he2T2AzsfHOVll4bMLb8XkV/L9Zl2V2quOK4?=
 =?us-ascii?Q?m5u4Ix9+X3pOOQmgBRRdC+tuGVMtVLI7JyLE/hdBzxbrbjPVphlYPgEB5tFv?=
 =?us-ascii?Q?aT0ix3kag7KCrhUW69AAF+ct2BQ/DTMb/T0UIDAb6nUDVihO/6cQuLyC6IGD?=
 =?us-ascii?Q?nwTOuT8s/iojssKeqjn3wC2pYOzAwJ0iVuoB6pci/sBYg0dXTg7K/ir2+R+z?=
 =?us-ascii?Q?raPvPprtkBFRBBQq4b7NYaJxxORBz8Rrh7zFY/B1O1nEWVIeJklTf47Te9gx?=
 =?us-ascii?Q?27HW9mZWyZBCAisFl8gkCRlkGyjx4uM0ptrXtyFcbcdfUTmKwHMTZaS4Ugco?=
 =?us-ascii?Q?VXkHh+zpNkJXo+/oBG39+WH6TiScOnpy0+MwLuW16OkdF1daj3oBwK22qD00?=
 =?us-ascii?Q?tavk24mfUJ8M9fHc355yHTqCI/bfTMNDx6dwMN3IHah0XuIu3JdP8Dm/WxSr?=
 =?us-ascii?Q?48E6BKwZ2/rA1a2jRynwdUVjzMVbzfPcRvySi+z0/vSQAqLjdnKSCzuFet6U?=
 =?us-ascii?Q?XTqI9/gKQ+zHL+xaDh7CUcFPShvFNIvdheI+cBsMvRzy1k932B53sg=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Pl3eUnLDdgNVBT3R79gzqMOtm0F7qZbvRYGB6SjY/tL/j5dfJPGSqGmg8+yb?=
 =?us-ascii?Q?zItgVt1b4bG+sHnOh7gYKHwLMX0ECWrvTtmFkKk7iCWM0Ic1+d+hEEZXfym/?=
 =?us-ascii?Q?eGjvrrNQiAIwjF44tNiHONdmwx/593vONRNmD02BKMJ2+bEDKY+CxrAJRXlV?=
 =?us-ascii?Q?ZcLTmF+5HZREQw9Y31NenLMUQ0VgM4IOmOTR9gyUGMom08HDWy7Yy92tWGfd?=
 =?us-ascii?Q?nQcuihLk2NZ+uMNYaTOpOaDEBzItppgPvlP4AYGY85L4/wKtainxmtuGoBVf?=
 =?us-ascii?Q?PevN6Rid5ONHby+UP16Hy+DDV3o1ceJ7b1RftfvA9Ul2pcg75xaDBJVHKptS?=
 =?us-ascii?Q?EDdofsV9DfohI8B3em6JJuaJYxoJP60O/Zwcx2TxJAitqvNhYVs7BTsvIsOa?=
 =?us-ascii?Q?3/Ic1JbIfM11zGfP2R7XhQvypyI+RD+EkZj4LUoI6Jiksn/QVF0CMeO3/p2k?=
 =?us-ascii?Q?P3gFzaG6+2q8fPLtpwyu11WcAlmAyic0SZY2NRWitYD6Y2SIMDi5DU7l/sAK?=
 =?us-ascii?Q?fJp6Ar1aMXlSyQyMynwDnta6dN1qm3mo6YZnLJWjtUEIu/3xRw9sFp5TphbF?=
 =?us-ascii?Q?NzGV72hOQ7XY4ipwNG7M2S1ZIqC3PSIau7rQBaOZ6y+eoYnBZfD9ENYa17gl?=
 =?us-ascii?Q?z246YrXx/va0JyhnPDxqC5C0mQWWgWQrIqrNVZWr5qbfHL+gcmGdv0+0Uuoq?=
 =?us-ascii?Q?i4g+fU7trDzXbElRGsxR2UdWtrUQcXMIBXdtN95nyUG0Z+R8pzkwdxBh6g6S?=
 =?us-ascii?Q?0Q2BROtzxN7ossAQqW5bH2PRBGosmQ9ubLbFQYkEMk/aCw67kZCJJq0WQF07?=
 =?us-ascii?Q?HdlbgXL03L5+d1KECVOJXdGDIAmKh3oeSn7VHsUIS3+xUHjKETKE7Y//IYfO?=
 =?us-ascii?Q?KE+Rp2qDQ9iwwJKTiOqTKOzFDHF1LLf1/RuU9yHonS2yPCMIV3EXmHUt/4Nk?=
 =?us-ascii?Q?P29qMMNvSHYx/YB7dXGRqvPLDkad0wBqOTkhls1IGke/TC+FA4xW+DXgSC5b?=
 =?us-ascii?Q?mFVp7qtJsFPx/3733v0ckxgfes+j2rqf60FLdZ9pKi1XPFb/0uc+qHrZVtKk?=
 =?us-ascii?Q?wvL6tDWWIjXne2OUgEjUEH+0w1kX6/8Ic6Fh7xhOdVPXyKNu1wJWhqhPtBSN?=
 =?us-ascii?Q?3ul8y6wB6oYkbBpsmDaZhkAUlGAFP4n0EhVCB2UsgAxpOEW2ys+lnkh+Nbcl?=
 =?us-ascii?Q?IVEnmaXsEd/W7cuCoGbiJlitetMxd89pMFkLJYWZOcpgfeG05Ed3iuNAefLR?=
 =?us-ascii?Q?pgYl3UmmKQjKFtuuyfUsqK9tyghcEOuD+syPHFapjZ6DLxGxG/GlBbFzawwy?=
 =?us-ascii?Q?TFvUp7brtg7VbrGQ/copxBQ58RRQzcZDsYknWmgs5on3PFt3mrl9YgIQpwAT?=
 =?us-ascii?Q?n5M2+OZps83lwlVqVU0PBF/WdKHAak2KaGrG3VcuwZ3iUvhJxCUgvFrwTAqL?=
 =?us-ascii?Q?6/B/tUsjjd4S5TXXIm05a9vs1XhKLhan7MZJFVhKT9j+d1zko1wqySo2Zr6K?=
 =?us-ascii?Q?RBlRjUR+hgrYe2m5VCkN2wP84XQ+c9grWMjQhLIIJxPNyxEbX8Z1lSskoCny?=
 =?us-ascii?Q?YUVwoeLWak3YwtP5lnOWOcYvFD5zF3GbzpfEmuJX?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 788482b3-6216-42a3-9cd4-08ddc80306a7
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2025 03:02:28.1677
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HEtX1PKiAkg3DxAPBPP0v9iZucr6QRUwaiRvL75nwlY1f9xHJuj/VslBeDIbfFBCoVVjYF3PjZTSek0yLkTrGA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9250
X-Proofpoint-GUID: fAIhOVZGdbqUtjspc9tTJYwQKLelTx3J
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE4MDIwMSBTYWx0ZWRfXwvpIfUMwQvrP
 se/hWemfojmKlNr+QAdgBirGewXugIpk8TttyGe9bZrk1OlrpEqPPFV1di7W1gXRxbbWi68H8Bi
 xM7cv32LiVFYMm+4OPa7LtpZ9Ce363SrwhAAtiyPbGun3yxfaxAerwPzTHFhZCFam3ZFc1EWa+t
 cY5kDtwgovov0k0MKJzqN5NyIDh8284j9vbLUY+t5+h4cItUcjfTRHnQfFJd+OWZoqml0B0m0N+
 WoN3rrTTvikm6RvqvLjSI+rcx5vsFi33o2g2FNkgQ01C3k3T+Fi9YXdc17w5yGMKME7/3z7pwqf
 8GrDFtPbeGFofdnc62cvewWj6qFxPg3h1njt6B+/3wBLfQpvJ/ZTP9MqREkH/CmwfpYYXG/TC9V
 pgEji5Ba
X-Authority-Analysis: v=2.4 cv=EtLSrTcA c=1 sm=1 tr=0 ts=687dadc8 cx=c_pps
 a=mJWS1GFEA4k5pH2C763n6w==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=Wb1JkmetP80A:10
 a=t7CeM3EgAAAA:8 a=J7jROQ5nx-kroVDJIq8A:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: fAIhOVZGdbqUtjspc9tTJYwQKLelTx3J
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-21_01,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 spamscore=0 priorityscore=1501 suspectscore=0
 impostorscore=0 adultscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2506270000 definitions=main-2507180201
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 21 Jul 2025 03:02:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118643

From: Chen Qi <Qi.Chen@windriver.com>

In case of multilib enabled, we'll get installed-vs-shipped QA
error. This is because the hardcoded/default '/lib' is used.

Update 0002-fix-libdir-for-multilib.patch and set wxBUILD_INSTALL_xxx
variables to fix this issue.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../0002-fix-libdir-for-multilib.patch        | 36 +++++++++++++++----
 .../wxwidgets/wxwidgets_3.2.8.bb              |  3 ++
 2 files changed, 32 insertions(+), 7 deletions(-)

diff --git a/meta-oe/recipes-extended/wxwidgets/wxwidgets/0002-fix-libdir-for-multilib.patch b/meta-oe/recipes-extended/wxwidgets/wxwidgets/0002-fix-libdir-for-multilib.patch
index fe65dd2836..cd0417612f 100644
--- a/meta-oe/recipes-extended/wxwidgets/wxwidgets/0002-fix-libdir-for-multilib.patch
+++ b/meta-oe/recipes-extended/wxwidgets/wxwidgets/0002-fix-libdir-for-multilib.patch
@@ -1,4 +1,4 @@
-From 9487fe5cd271a4bee96ab590509ef38f6972887a Mon Sep 17 00:00:00 2001
+From 42b1d9e8138b8b4f7160f208a5d15fe25d0223a3 Mon Sep 17 00:00:00 2001
 From: Kai Kang <kai.kang@windriver.com>
 Date: Sat, 12 Oct 2024 18:43:25 +0800
 Subject: [PATCH] fix libdir for multilib
@@ -16,15 +16,17 @@ in this patch that LIB_SUFFIX has been passed to cmake in cmake.bbclass.
 
 Signed-off-by: Kai Kang <kai.kang@windriver.com>
 ---
- CMakeLists.txt              |  2 +-
- build/cmake/config.cmake    |  2 +-
- build/cmake/functions.cmake |  4 ++--
- build/cmake/install.cmake   | 12 ++++++------
- 4 files changed, 10 insertions(+), 10 deletions(-)
+ CMakeLists.txt                         |  2 +-
+ build/cmake/config.cmake               |  2 +-
+ build/cmake/install.cmake              | 12 ++++++------
+ build/cmake/lib/webview/CMakeLists.txt |  2 +-
+ 4 files changed, 9 insertions(+), 9 deletions(-)
 
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index d6a4b49..9e86b87 100644
 --- a/CMakeLists.txt
 +++ b/CMakeLists.txt
-@@ -43,7 +43,7 @@ include(build/cmake/policies.cmake NO_PO
+@@ -43,7 +43,7 @@ include(build/cmake/policies.cmake NO_POLICY_SCOPE)
  # Initialize variables for quick access to wx root dir in sub dirs
  set(wxSOURCE_DIR ${CMAKE_CURRENT_SOURCE_DIR})
  set(wxBINARY_DIR ${CMAKE_CURRENT_BINARY_DIR})
@@ -33,6 +35,8 @@ Signed-off-by: Kai Kang <kai.kang@windriver.com>
  
  # parse the version number from wx/version.h and include in wxMAJOR_VERSION and wxMINOR_VERSION
  file(READ "${wxSOURCE_DIR}/include/wx/version.h" WX_VERSION_H_CONTENTS)
+diff --git a/build/cmake/config.cmake b/build/cmake/config.cmake
+index addd8d6..9ec6775 100644
 --- a/build/cmake/config.cmake
 +++ b/build/cmake/config.cmake
 @@ -100,7 +100,7 @@ function(wx_write_config_inplace)
@@ -44,6 +48,8 @@ Signed-off-by: Kai Kang <kai.kang@windriver.com>
          "${wxBINARY_DIR}/wx-config"
          )
  endfunction()
+diff --git a/build/cmake/install.cmake b/build/cmake/install.cmake
+index 202d054..e255e0b 100644
 --- a/build/cmake/install.cmake
 +++ b/build/cmake/install.cmake
 @@ -44,11 +44,11 @@ if(WIN32_MSVC_NAMING)
@@ -90,3 +96,19 @@ Signed-off-by: Kai Kang <kai.kang@windriver.com>
  )
  
  # uninstall target
+diff --git a/build/cmake/lib/webview/CMakeLists.txt b/build/cmake/lib/webview/CMakeLists.txt
+index 2cb35e7..7977a84 100644
+--- a/build/cmake/lib/webview/CMakeLists.txt
++++ b/build/cmake/lib/webview/CMakeLists.txt
+@@ -146,7 +146,7 @@ if(WXGTK AND wxUSE_WEBVIEW_WEBKIT2)
+         ${WEBKIT2_LIBRARIES}
+         )
+ 
+-    wx_install(TARGETS wxwebkit2_ext LIBRARY DESTINATION "lib/wx/${WX_WEB_EXT_VERSION}/web-extensions")
++    wx_install(TARGETS wxwebkit2_ext LIBRARY DESTINATION "lib${LIB_SUFFIX}/wx/${WX_WEB_EXT_VERSION}/web-extensions")
+ 
+     wx_add_dependencies(wxwebview wxwebkit2_ext)
+ endif()
+-- 
+2.49.0
+
diff --git a/meta-oe/recipes-extended/wxwidgets/wxwidgets_3.2.8.bb b/meta-oe/recipes-extended/wxwidgets/wxwidgets_3.2.8.bb
index 2137bc686c..8d1090a171 100644
--- a/meta-oe/recipes-extended/wxwidgets/wxwidgets_3.2.8.bb
+++ b/meta-oe/recipes-extended/wxwidgets/wxwidgets_3.2.8.bb
@@ -40,6 +40,9 @@ EXTRA_OECMAKE += " \
     -DwxUSE_LIBPNG=sys \
     -DwxUSE_LIBTIFF=sys \
     -DwxUSE_REGEX=builtin \
+    -DwxBUILD_INSTALL_RUNTIME_DIR=${libdir} \
+    -DwxBUILD_INSTALL_LIBRARY_DIR=${libdir} \
+    -DwxBUILD_INSTALL_PLATFORM_SUBDIR=${libdir} \
 "
 EXTRA_OECMAKE:append:class-target = ' -DEGREP="/bin/grep -E"'
 
-- 
2.49.0


