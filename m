Return-Path: <peng.zhang1.cn@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26A92C7115B
	for <webhook@archiver.kernel.org>; Fri, 20 Jun 2025 02:44:54 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.1107.1750387490166493857
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 19 Jun 2025 19:44:50 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=82661b579a=peng.zhang1.cn@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55K1o6Z7013929
	for <openembedded-devel@lists.openembedded.org>; Thu, 19 Jun 2025 19:44:49 -0700
Received: from nam02-dm3-obe.outbound.protection.outlook.com (mail-dm3nam02on2088.outbound.protection.outlook.com [40.107.95.88])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 47c80s18eu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 19 Jun 2025 19:44:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kMn4Hi1Uwx2LyDN7U3WY0vAD94/r2M/Q44yfsmChKrXWG54+Ef//BNf6L+ZszhwTsaAKqTSUIwO+K8VxnyY43q2nN1KKKWDgc2ZDxADHU4kuqj7L+rFfaRvd9Ve9/5F00OkZ/WbIydl8+1N7L66BmVe3g/1Y13quxYM6YV8Y1c+p+Qsqp0icrIGmPRnH2+M31HthckVj7eEj+PKg+aMZ2c/EGTLUnGceO1Nz/Es4oB+DxY3YU6CBOyvKpu+nBL4Cp/n2/tUpnCn/DkwcT4wu47e8i5xJfWc57KkA6+JUPO15oMzvFW1htaKy3THcSOE3RdqRWnfP9K5LK8Hi5pLg/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b0GD7GLGY3TfjB2JrKrsM4qkOsBThk7Y2DIandctt34=;
 b=p2pl19/UsKmmVM11Bazdn8OozPway+L8ycCVJApjjiYHbyqLgWtw+fa0yAu87P7su07hocciLbTg8Qcnk0NoVBF7u+bBT6KSsMBBxtoBo2PusB6BDunN6Pak0UH9KXvs+GnJvx057UDLuX48TuzhEzkG2hK3NX+FxV/Yb8R6wq7KYVYjMXGeV61YC896J2FL0kVvRjrnVm0F7KJYRhvJAJEPyY7/9fSQR/SWGSBWeK4644nIEQo+JdBRp/xKa7JBZsVMmcmKwSl5HKRpDAVSOg89+oFDlXntNEXwTW7MEPj+ffkA47ZRRR0d5APHo4BSbXKWPjPtpzUbJdQD7uVduQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8562.namprd11.prod.outlook.com (2603:10b6:610:1b8::13)
 by BL1PR11MB5240.namprd11.prod.outlook.com (2603:10b6:208:30a::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.25; Fri, 20 Jun
 2025 02:44:46 +0000
Received: from CH3PR11MB8562.namprd11.prod.outlook.com
 ([fe80::ea76:e083:b8bf:7484]) by CH3PR11MB8562.namprd11.prod.outlook.com
 ([fe80::ea76:e083:b8bf:7484%5]) with mapi id 15.20.8857.022; Fri, 20 Jun 2025
 02:44:46 +0000
From: peng.zhang1.cn@windriver.com
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][walnascar][PATCH 1/2] glade: update 3.22.2 -> 3.36.0
Date: Fri, 20 Jun 2025 10:44:35 +0800
Message-Id: <20250620024436.2107776-1-peng.zhang1.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYWP286CA0025.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:262::13) To CH3PR11MB8562.namprd11.prod.outlook.com
 (2603:10b6:610:1b8::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8562:EE_|BL1PR11MB5240:EE_
X-MS-Office365-Filtering-Correlation-Id: 6af585b2-cafb-4ffc-e32f-08ddafa46aed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?gR8O3zLIO50GT5Eu67MR0uEvDoqtLN5ECHpsJZQAd5WpDHTknMu+wBa8/Xwz?=
 =?us-ascii?Q?G48tyYfWBa0M4riKZZ9tvV7mMF2oS5YfG1PtxVgQz2RywXPOtRDEsPRLKAM5?=
 =?us-ascii?Q?3SQfdK2qbNWPEI5sgqa+ze3g9WCIbcAfjyCxCY8VyiygVcaOdC+m1iHWyQAp?=
 =?us-ascii?Q?7rPEIPudR5Dblg+s09LoMSW8GBg6w/VqBKfhS7dfxx2eNMIQNWPh5wrjH+xp?=
 =?us-ascii?Q?j9Kmp/EInEzQ3QiYNqstO0v+x6bIz2XT22zJEwzsNwyTLCuuEAEdaEz8y7So?=
 =?us-ascii?Q?JUkGRZgZDEh+CKlvb3SXt3cPx64oIhsSesRsBhdOtdax3G+zcrY0AGwMyrZ5?=
 =?us-ascii?Q?YSc2DdooB9dqm8ecBJFteLB2pZBDgzVZCkjxTPEKvxBzDKZloKvh62mcPTYO?=
 =?us-ascii?Q?XPHlvZawWBRenz96eH/OccETfullbx/HgNDnvJkxiv4BUCnGvDLx15cTFGgg?=
 =?us-ascii?Q?AWzv53hJWyoVW3fT3x/ERfdNrGIq43mEMMPJhbFH+1JgCcyOXOxITnmx2igM?=
 =?us-ascii?Q?uyF4QsCTPY2DYTToQmvkxS9wXQ9yNoCcVRsru9eiYeJhR6BBqGKGcSn4xKeJ?=
 =?us-ascii?Q?kPeYsl6AD3OKDLX3y2v1bVobTtlEijTSusl1hdARnosrFcSPKE8Wqmkgbj5s?=
 =?us-ascii?Q?Ge0QTuvvn62tetMseN+xT9SGxh+9Blh4B0G9t0/7xG30VOBD94da+7T25eMm?=
 =?us-ascii?Q?SfA2mla4ScYNUkZW5ywwFKVjxbaicf4+1OEYIwxg5dByD5DLqz/1nW/385z+?=
 =?us-ascii?Q?kaHcxvLCuFmYUMGdGgiGovXs+JVH3BUhame5NH88UdIUzYgk5r9RaSMGFq/n?=
 =?us-ascii?Q?eMOvut/I6fwY7spycIE8gmUhaV+BJKt3663lnGtVfgPCw6e3KfzK/095iHf4?=
 =?us-ascii?Q?O9AJHjKE07lNUxPBxHLpDfeGBCAeRYLpz2l4VRZWzY4zag+m93GpkTJoAmjV?=
 =?us-ascii?Q?PyjptjORb+EkM9jFMDb+SpkypZiEQYmWzhsR403SfN+JsX0kld5nGt543mO8?=
 =?us-ascii?Q?Up5HmZMdB9WFNUkyZ2C85dR/TtFvUxBqP5avxRfEp2VmsZNWw3BmLCIOgs43?=
 =?us-ascii?Q?hm4YllPCSQEm4Y3hm1Ww0W4p7BOSvcby9Wzye4Fk9Ug6Qjj1Tzbrbaync9qp?=
 =?us-ascii?Q?Alz3Vo9c2lw3T74trJltPi3iiAxOF/m+W29SrbCplNDpeY3mY5J2FfJ8zW+w?=
 =?us-ascii?Q?cIoqk1vFFblSiLZ4fc5NBoPGczyjDD4GCG8zzkp+j5Z69r0ZIHDf6wQZN0AU?=
 =?us-ascii?Q?uoR1lw0kyM9ZnlGmaUcZkP2s5V1q+CpPoxs8vz5qVnZUJ1f9V9K/yRIrlP/A?=
 =?us-ascii?Q?MMSxvqLAc/Bc4lhwI0gB0dWJks/UqPk/w8OwziGCwyZ2DnuUmU7qo/Uz2iAW?=
 =?us-ascii?Q?/ksE+fFIooYBLsybuJCcP/olekmBeK//l6yKK776aWkj+dvKgHQ6sQjuK5ZU?=
 =?us-ascii?Q?DKuHPd/0Scw=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8562.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?c5W6aQQYmWr7Rba1a98JmvxEc35QzvW4tSaVTqsWaFXLqxLmz7uHlQsnxcxq?=
 =?us-ascii?Q?Dt02mufzd7KzchHDWsLBJ4g9ZdrK46gAMmey4ds/zG81fhmwPd5GLMfKRIVA?=
 =?us-ascii?Q?Zec4Rmxj4WgdetB8pUq9HPGkwEixm7KEpzBOg1CJEJaK2FAviov5l1dvBgSZ?=
 =?us-ascii?Q?A6WMwP+WPKmSB7VmFM1iLHLgECkry7jZWUcrFK27IVAY0N9KzI8xAkNrIkla?=
 =?us-ascii?Q?cgY3UIUJS+Kjga4UF/ntO7/npEMfI2H+l9QwB7bM52mvCOXedTzlXTStS/be?=
 =?us-ascii?Q?NuVyxirL1ndpBtjMIGxzdRkrtHGBIOxsU4rwiBRArGQcr+zO/YTuACkU7KfM?=
 =?us-ascii?Q?1MW4ZUdwKiDI1igTkuep5lWT9UyuRpDS96oSPlVK5UQ9Y4IeiWmRbw73RhbP?=
 =?us-ascii?Q?pybmBSgmarZw2rllrPiRS+3bDUGE8cVZUiqx2GWHbJ/hGW6wulE1iUVMJPZq?=
 =?us-ascii?Q?oFBy4LZ2zb6ExU5ir36mMtSSrOck8vI0orLhGtRDB7L3XbeRohhXuwqBh3x6?=
 =?us-ascii?Q?Mj192WhRE0wpWbpKTkffD94/UsbTK7CabHc/WJJeapbuj97t831Fhhxal74h?=
 =?us-ascii?Q?w8wv7nQqnMeniHvMj1daKZ/sAM7Xd57yrQ/ibwyg/gdJoWwCseoxDFgvScsI?=
 =?us-ascii?Q?fDFItAQmeDoK7VBDJ0coHVe9fhxBOZip0MBI+AM0tDsFura6+wdr+JnCjHp6?=
 =?us-ascii?Q?vBFe+k9Mqze2BTpm7nUp/G6UJ/dZMAV0w/HLPPND1elDT+2ogJR9262x5vBj?=
 =?us-ascii?Q?4cybX+6dYot7+43nI6CavIW0FxeragvHqdmyiiGoQZlcWpQuFTU9vGQn/+Wi?=
 =?us-ascii?Q?wbBI4hVP3rF+8Qg3xaiGE/1OpL71mMjJmgFBuK5YkT3+5kpupdoRZJ4fje+p?=
 =?us-ascii?Q?rDE9cAprUx2dTzteNMDwPZVdcyAC4VmmOHwUfDDznpUCFBbFqTlEISZThyY9?=
 =?us-ascii?Q?HRBxfwhXp4NBgr7WVeZOBT/4gAfibISsNsmOnS1sdMZrQLeOj4N9tyVF8XtU?=
 =?us-ascii?Q?Fm7xnhQBZEcMhnIJOhk1Xmqbn37gM/N+/zWerf0a5+4p6FxxRpaPR//zYggn?=
 =?us-ascii?Q?pzMiL6ecmUKFDcH7qQBMQZZ/1sLQzPpdHJNEL77QZGDPfQYrh+57/eoE/okC?=
 =?us-ascii?Q?HJceGfWPHM3kllnx0Ielr02klfU41SsuY459piY09EAJYyhWXB9LM/15cOCG?=
 =?us-ascii?Q?1hlhUGQmx+k3jA4H8n195OmG6bp0qKTSgmm1+KhZl2vl4uSgMosPXksbSySy?=
 =?us-ascii?Q?soxXU4PlvE492ohGcyQVChmCS7kMnMp85MjgM2gU5q9a70vOfTrhcAt22CyU?=
 =?us-ascii?Q?N6sLoiBMgxCsFmQbpinMO8KEY7Hzic5sfDtZDxQ7O0+gqt6bmCjTvdStdkjz?=
 =?us-ascii?Q?WceecmQOtxKLUYeGdoL0AP45rcrAVG0NxWpeeUQiL0/X1ZG/CUVYp3gDnI35?=
 =?us-ascii?Q?1yIKVG/ldewE1euSZD7EEKOk+rK00H3VlqNGzG/fUEgPAbKIoVjW7klAKF2C?=
 =?us-ascii?Q?osnELBVndnS0YhX6JgfURwZI0Tl/kJfkrICpNHL9CqGmXFsV2M4Bh/oHASwy?=
 =?us-ascii?Q?0dpr48B3O6ynFCh3hGIaaM5ChR3hVnIQPNuW7R+efe6MJ3up/PETb+qzlD8f?=
 =?us-ascii?Q?oQ=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6af585b2-cafb-4ffc-e32f-08ddafa46aed
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8562.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2025 02:44:46.1805
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pTh7nj7CuanpzVEWJg4lKzyvVd7bA40Z1n1dEWSSzXmsN6hUX6tqi9pCw/NbXGEXMGkPcbbNxZze1aMHG4JmXp7PcElDg746eUTG+0nrobo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5240
X-Authority-Analysis: v=2.4 cv=edg9f6EH c=1 sm=1 tr=0 ts=6854cb21 cx=c_pps a=aZuVfPrC45A246xPil/Ifw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10 a=mDV3o1hIAAAA:8 a=n1dRnMMuAAAA:20 a=iGHA9ds3AAAA:8 a=aiIX5UjjAAAA:8 a=pGLkceISAAAA:8 a=t7CeM3EgAAAA:8 a=CguWzySS89uvwxo1DOoA:9 a=nM-MV4yxpKKO9kiQg6Ot:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIwMDAxOSBTYWx0ZWRfX+EOT5QoxC+Ai UiI1E+aF9J3vzxJyKwiduQ82WB1oDLsqBQaYzP724eRLDESLkJvaS4PmJG+QH4IEzx204hZyhec USt33YYOglhdonCWp4cPGmLIuOs/j6a8HZRcfe5Y8PXcFjSZo8cf8Qvgmrmakqalq4dKbciUnyE
 QzbbVAofpQxcN8lzHIDi3CIyIqjIsBrbgwuI2fT28X8Pj1K8Eij1mSRa9mKXGt5kxcPY8eSOPA7 wqecLa8fDtFxslkW8rgBeFRG+Ny/BtoBsX68qdM9akrASVrni2UPl1l26i8mKZ30Re/yIQmRX9E CcnN7e6qXBJjB+WOCMThhEveVEAiWgKfVOlpsUeQSjevDAa2JYRIC+Ceu7rODNk9L5khbR7JBUu
 ghIlPHa1BXAh4xi6p2F0aOLkNRtJM/ny9g61ysWnOM3qjBn0E1tRR19AqmjcPkaWlvrdFux7
X-Proofpoint-GUID: 7r9-4CY47EJQOWwleUaELY9BDJob0_gZ
X-Proofpoint-ORIG-GUID: 7r9-4CY47EJQOWwleUaELY9BDJob0_gZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-20_01,2025-06-18_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 suspectscore=0 priorityscore=1501 lowpriorityscore=0 impostorscore=0
 adultscore=0 clxscore=1015 malwarescore=0 phishscore=0 spamscore=0
 mlxscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2506200019
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 20 Jun 2025 02:44:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117958

From: Jason Schonberg <schonm@gmail.com>

    Fix HOMEPAGE

    License Update:  COPYING.GPL - whitespace changes and change of address of the
      Free Software Foundation.  COPYING.LGPL - whitespace changes and change of
      address of the Free Software Foundation.

    | checking for itstool... no
    | configure: error: itstool not found

    add itstool-native to DEPENDS to address configure failure.

    | ERROR: glade-3.36.0-r0 do_configure: QA Issue: AM_GNU_GETTEXT used but no inherit gettext [configure-gettext]

    inherit gettext to address QA error.

    The code of gladeui/glade-command.c has changed from using
      G_OBJECT (prop)    to  GLADE_PROPERTY (prop)
      G_OBJECT (widget)  to  GLADE_WIDGET (widget)
    thus resolving the incompatible pointer types seen in glade 3.22.2.

Signed-off-by: Jason Schonberg <schonm@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>

(master: ecca54d9307a523d6f644e70294a37d6f89548ee)
Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
---
 .../recipes-devtools/glade/glade_3.22.2.bb    | 32 -------------------
 .../recipes-devtools/glade/glade_3.36.0.bb    | 32 +++++++++++++++++++
 2 files changed, 32 insertions(+), 32 deletions(-)
 delete mode 100644 meta-oe/recipes-devtools/glade/glade_3.22.2.bb
 create mode 100644 meta-oe/recipes-devtools/glade/glade_3.36.0.bb

diff --git a/meta-oe/recipes-devtools/glade/glade_3.22.2.bb b/meta-oe/recipes-devtools/glade/glade_3.22.2.bb
deleted file mode 100644
index 84ca98a8b4..0000000000
--- a/meta-oe/recipes-devtools/glade/glade_3.22.2.bb
+++ /dev/null
@@ -1,32 +0,0 @@
-SUMMARY = "Glade - A User Interface Designer"
-HOMEPAGE = "http://www.gnu.org/software/gnash"
-LICENSE = "GPL-2.0-only & LGPL-2.0-only"
-LIC_FILES_CHKSUM = "file://COPYING;md5=aabe87591cb8ae0f3c68be6977bb5522 \
-                    file://COPYING.GPL;md5=9ac2e7cff1ddaf48b6eab6028f23ef88 \
-                    file://COPYING.LGPL;md5=252890d9eee26aab7b432e8b8a616475"
-DEPENDS = "gtk+3 glib-2.0 libxml2 intltool-native \
-           gnome-common-native \
-           autoconf-archive-native \
-"
-GNOMEBASEBUILDCLASS = "autotools"
-inherit features_check autotools pkgconfig gnomebase gobject-introspection mime-xdg gtk-doc
-
-# xfce4 depends on libwnck3, gtk+3 and libepoxy need to be built with x11 PACKAGECONFIG.
-# cairo would at least needed to be built with xlib.
-ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
-
-SRC_URI = "http://ftp.gnome.org/pub/GNOME/sources/glade/3.22/glade-${PV}.tar.xz \
-           file://remove-yelp-help-rules-var.patch \
-          "
-SRC_URI[sha256sum] = "edefa6eb24b4d15bd52589121dc109bc08c286157c41288deb74dd9cc3f26a21"
-
-EXTRA_OECONF += "--disable-man-pages"
-
-FILES:${PN} += "${datadir}/glade ${datadir}/metainfo ${libdir}/glade/modules/libgladegtk.so"
-
-# http://errors.yoctoproject.org/Errors/Details/766882/
-# glade-3.22.2/gladeui/glade-widget.c:1822:36: error: assignment to 'GtkWidget *' {aka 'struct _GtkWidget *'} from incompatible pointer type 'GObject *' {aka 'struct _GObject *'} [-Wincompatible-pointer-types]
-# glade-3.22.2/gladeui/glade-command.c:920:23: error: assignment to 'GladeProperty *' {aka 'struct _GladeProperty *'} from incompatible pointer type 'GObject *' {aka 'struct _GObject *'} [-Wincompatible-pointer-types]
-# glade-3.22.2/gladeui/glade-command.c:1253:21: error: assignment to 'GladeWidget *' {aka 'struct _GladeWidget *'} from incompatible pointer type 'GObject *' {aka 'struct _GObject *'} [-Wincompatible-pointer-types]
-# glade-3.22.2/gladeui/glade-command.c:1419:21: error: assignment to 'GladeWidget *' {aka 'struct _GladeWidget *'} from incompatible pointer type 'GObject *' {aka 'struct _GObject *'} [-Wincompatible-pointer-types]
-CFLAGS += "-Wno-error=incompatible-pointer-types"
diff --git a/meta-oe/recipes-devtools/glade/glade_3.36.0.bb b/meta-oe/recipes-devtools/glade/glade_3.36.0.bb
new file mode 100644
index 0000000000..85f85a4612
--- /dev/null
+++ b/meta-oe/recipes-devtools/glade/glade_3.36.0.bb
@@ -0,0 +1,32 @@
+SUMMARY = "Glade - A User Interface Designer"
+HOMEPAGE = "https://glade.gnome.org"
+LICENSE = "GPL-2.0-only & LGPL-2.0-only"
+LIC_FILES_CHKSUM = "file://COPYING;md5=aabe87591cb8ae0f3c68be6977bb5522 \
+                    file://COPYING.GPL;md5=4641e94ec96f98fabc56ff9cc48be14b \
+                    file://COPYING.LGPL;md5=81227099add6b483afd7b1d4fc4e93b7"
+DEPENDS = "gtk+3 glib-2.0 libxml2 intltool-native itstool-native \
+           gnome-common-native \
+           autoconf-archive-native \
+"
+GNOMEBASEBUILDCLASS = "autotools"
+inherit features_check autotools gettext pkgconfig gnomebase gobject-introspection mime-xdg gtk-doc
+
+# xfce4 depends on libwnck3, gtk+3 and libepoxy need to be built with x11 PACKAGECONFIG.
+# cairo would at least needed to be built with xlib.
+ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
+
+SRC_URI = "http://ftp.gnome.org/pub/GNOME/sources/glade/3.36/glade-${PV}.tar.xz \
+           file://remove-yelp-help-rules-var.patch \
+          "
+SRC_URI[sha256sum] = "19b546b527cc46213ccfc8022d49ec57e618fe2caa9aa51db2d2862233ea6f08"
+
+EXTRA_OECONF += "--disable-man-pages"
+
+FILES:${PN} += "${datadir}/glade ${datadir}/metainfo ${libdir}/glade/modules/libgladegtk.so"
+
+
+
+
+
+
+
-- 
2.34.1


