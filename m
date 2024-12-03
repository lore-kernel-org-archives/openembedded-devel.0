Return-Path: <peng.zhang1.cn@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 860E2E67493
	for <webhook@archiver.kernel.org>; Tue,  3 Dec 2024 10:09:33 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.15858.1733220566514761535
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 03 Dec 2024 02:09:26 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=2067e51382=peng.zhang1.cn@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B35nSif011161
	for <openembedded-devel@lists.openembedded.org>; Tue, 3 Dec 2024 02:09:26 -0800
Received: from nam04-dm6-obe.outbound.protection.outlook.com (mail-dm6nam04lp2044.outbound.protection.outlook.com [104.47.73.44])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 437xv7tvp9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 03 Dec 2024 02:09:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VzROfmHn3rV44S7hvJD6lKdmqhh9LOjTZ2U3z4+r7hwxzgo8+PC1BxKJG0IOoCj+dsB/6YDgne5lVHQQseTtnuIB4bKulRg9WWCafON+L58SK6QXbVT6DdGYEgmg2LoAxMlFWl6HCUB/zxIb6vuenaGHF7pDHQ2MI0REtYBAClkOFEJku6KXGdxdsxwdyq/yVqpe/oa5AowS35uTZkFoiO/tvTBhJkT/Y9OEsYLD8Wxra2iZ4vQGCaItvdEB1ShqaT1CpllZCGuRGh3Cn54mG9X+3ymtmEFL3MBgZkfqJzDyMgqdtzHKETCjMH5fbnbo+RXSuQPC5MMsfKjszGj9LA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eg9uspUe3lgc6L00xFnEMWwaysjNgW8xVkIO6uY3znU=;
 b=Id5Sac+WyS+KqPA6NPBoVYoKDkMagqiSFi6FeVBQgMWKkzZC1AgtNVUQ2T8gCvOgxhGj+qbqPE57Jg68zfr5rfEZftGyxNQ7g4deYh5Ms+QVbS6S9jDQmTzWSNJ69won2Zwmsa5OFxjb2sLk1SZU6lbYvfMfaKDB0BYsQ0jwwJ/W3FztzqxVBccHDR4EhMK1KGMl9Nf+ky2XdlMZne/UGXV4NeduMSvbiPmNkzdbEy4NR2/49GxAoMcaNlbLM9mG8PC4V5GkvFnwXiyJgdDCQ8H7C2XtAocimvcsIGQIXj5mCBFhim1BuwAkgudePFjd6ijT4Q7FUtqsgvPDuNnpbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8562.namprd11.prod.outlook.com (2603:10b6:610:1b8::13)
 by LV3PR11MB8743.namprd11.prod.outlook.com (2603:10b6:408:20e::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.18; Tue, 3 Dec
 2024 10:09:23 +0000
Received: from CH3PR11MB8562.namprd11.prod.outlook.com
 ([fe80::24c6:f8fc:1afe:179f]) by CH3PR11MB8562.namprd11.prod.outlook.com
 ([fe80::24c6:f8fc:1afe:179f%7]) with mapi id 15.20.8207.017; Tue, 3 Dec 2024
 10:09:23 +0000
From: peng.zhang1.cn@windriver.com
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][kirkstone][PATCH] libgsf: Upgrade 1.14.49 -> 1.14.53
Date: Tue,  3 Dec 2024 18:09:11 +0800
Message-Id: <20241203100911.1911904-1-peng.zhang1.cn@windriver.com>
X-Mailer: git-send-email 2.39.4
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0057.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::10) To CH3PR11MB8562.namprd11.prod.outlook.com
 (2603:10b6:610:1b8::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8562:EE_|LV3PR11MB8743:EE_
X-MS-Office365-Filtering-Correlation-Id: 85071af4-a82d-417b-fae4-08dd13828f4a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?7wC6M/UwUGGeH4g5Ughsr0lj7yLniuaoElfAqPw1XkmhoPdX5YAMrcxFTtfT?=
 =?us-ascii?Q?3nj3KYfSrXf2myGxwXD8H8SCJzUucj6/3jWtzNAdNg5o12NLL4CekZRLt5HB?=
 =?us-ascii?Q?YlBpWm6qeVd3RJE1lPFw4eNbywcrmaYJxW3H8XcGDhuBVTjpFlxRmcmnN6NA?=
 =?us-ascii?Q?PrHl7WV04/oIhKu47HynQicELRMj9TDMFyrUFGFd/NMy76vERZkmr/AuHduY?=
 =?us-ascii?Q?LTplIrHB4lL1Srai6CFeUHmNtLmfzTv18dRf22neuqgMyJd+6p2mee+fJnNv?=
 =?us-ascii?Q?cFkaHM2fwBdRcks+Z3OKi3hCzoRKRyeWnxTdX7gaFPTVtuAzw/lqa2vv2enk?=
 =?us-ascii?Q?lGejnI+/pDHjnlk6p0NcgKBNxtBtgd2PNHE0wwLKBvgSepdeWkKQ+VwbcXHq?=
 =?us-ascii?Q?v+NBHfSiADkYDfZDPRUj13ppK4Osp8NM/ZCd3NRTwp/kEjW/MxjQd6lnLHwk?=
 =?us-ascii?Q?u/oB9YzUVMY4cmleEcV1BEqeG8GjbtP05ZSN18zAC9iCjN72wT/oAIApA07R?=
 =?us-ascii?Q?MKFZoHSOQtgvlAsCwiNtf2A8NVTa9rwb0XO91jAnVbmYHNxq3qN999NPULQ1?=
 =?us-ascii?Q?ouq6tUhqtyhgMIDLPgCGcy1p2mwDT6xmsVQJpQCvgZTw1Rjrtc2PCXGaHJE1?=
 =?us-ascii?Q?TVf9gymkDo7UlTEx4yCwmvsyX354HzSaCR3SD+dOaiKR9mOP7nMTtjSFsisr?=
 =?us-ascii?Q?no/XqxOo45OXqJ8xEcvkqp1YavOBawi2Fh1LM7/GmztCXkIbA+vxhRkwKWd2?=
 =?us-ascii?Q?p8+n9mP9aSTyx1JUowJRUWt6D0jj/5lz9sSONcY6+1wZ2vZ6W25uQ5RaB9Ga?=
 =?us-ascii?Q?pmR/0Y+INc/0b0+zDlBL6oUuTVZ+ZtQ+TuHS1sEs/yDedO2Y3d5zxJftd9lt?=
 =?us-ascii?Q?fVh0tdDi/CA/YS24XnwCI0r+d+VmbWmosNVJQuonr4p23DDRG1XFYSiXi2eC?=
 =?us-ascii?Q?FXBuh+bzCwbz8LnqZWFhDRlCWBoDnJw2OYkSBTxUpNSnHx+GGP42XjVNBwYD?=
 =?us-ascii?Q?H3WwXwpz3tnbBWILSPyhtA/y/So2Ni8Jm8OWKdlWLQJx2OiBpZGpmjABS16u?=
 =?us-ascii?Q?HBvepyx48rURBn94Qf5+a22j3p2mlzrDUU0zVQWCmx9oBlNsgttf09sz72vo?=
 =?us-ascii?Q?JgIcDifdBUcSHopNpvXqFxp8mex4C6+fsdeSPo2ClImsWfyjEOyqGqwXKyim?=
 =?us-ascii?Q?mUy7rRiY/xtE9PtYUkdo4ArgtNn0NllqMtXkLhYf5sjITGatndYG9XvLOnlp?=
 =?us-ascii?Q?iKbTgl+nKSDGTqJyvYaYR6XRkrgmclEB+4Oo9D+RnQl+awRG4wDyEksXdpT2?=
 =?us-ascii?Q?XvX2RESN6PV0kQ9Ml2zzlCLYGoRjp6PGFaVGMomWw7RhNxKpJBFc0nJ6uHQT?=
 =?us-ascii?Q?gUE8PII=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8562.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?d4Dn3hDTlaJLLtEKDmiULzMS6lkfmkl49Tyip8i4+x2pr2ndg1MJ93JvdjEq?=
 =?us-ascii?Q?Dzz76NqIrN2894mcC9EINCsGvia5Qfy2UK4BkHFEwW7pZ+2e4U3wCBEmjA9r?=
 =?us-ascii?Q?jKTp1PpyruhXFiB64Knqi7eLw9sswBMcpNMNlpPB7jiP2/hufngEoJOpzEt4?=
 =?us-ascii?Q?C0KN0spKkL5hWbODWYSmw2UrFO8szJA4qlvPDW2i5qBv7ZwpWr+igfNiCq7D?=
 =?us-ascii?Q?f0CkLMvb0cauqWrld4vhA43UqhAeC7m0SSKShd+peym3J1OgfQOGt6h8Bbso?=
 =?us-ascii?Q?lpY6JRo3RKAOCTZKJlko086IeOP00mqTJMB2SqtlYM/0xpNsw7UThHA6ajl9?=
 =?us-ascii?Q?bpxY7vkJzgSSjouRpmfngXaIVcV/xtfAOmK/2rx5K7aclJPa3765jxc98KGy?=
 =?us-ascii?Q?BddY0f7M/vKU/e695xklTONvG/tGoIlOZ+l6HMIxl6lC64u4thKUTjI4JZOH?=
 =?us-ascii?Q?EEO50QxYfy9dxbpvlRHtQH70QFP0pgz5jkHgyae681h4N0HvCPDcUkNuZqwd?=
 =?us-ascii?Q?FVg/5SDVLs548TukCljsqq3qtJlFvhpvgtgAgkopI99H1AhUf2JqCt9mOMbC?=
 =?us-ascii?Q?gcnjlesvnksa70CMNNfpbAr+4hgHdgGidT09tY0oRT8rUQ6pbX6kALR4ltWr?=
 =?us-ascii?Q?/iyl6/MWx8QcmeyLhW/tzAxMHGNcm5gn9BwvrgZgP0hYXkGkJ1Ihg9lhdwpj?=
 =?us-ascii?Q?jH2EIi/uH19NjIM+puV2Oy1DvXRt06ULVjQ0O0nUNolNnq0ibMuvJYOWvb8u?=
 =?us-ascii?Q?wSNs3XzfqePz32eF32sjL8hDZ8Ri44HSP2S3VCyBTTMhVnWtL7YBl4k5a/O1?=
 =?us-ascii?Q?8ZJ1SZcQN5lvzlgCcXpNj+PKfqekbraCagNNCAID1UEHSINaqUgiNyQCBY4e?=
 =?us-ascii?Q?ElBViLReyCYYQGYNJmGgA/HyERbSSSvRpYYbdAGQFV1k8719V2DDu+BxK6Ik?=
 =?us-ascii?Q?hRad7PWzsAdqGPWxWeVOzAaWue+Kuafh4Kvwhm3KRzQqTTlBNnasw7DQrofp?=
 =?us-ascii?Q?zLnv85cWecd2Fjdryz4qGO0ZwttPitS5xB4KC41hNs415JWKT+gKBeukqYy/?=
 =?us-ascii?Q?FkOcRt/Yfc58dpnJgWs0rxXOe/8hLJPVVf3LMs+Gft8fC1mLEDHNvHQQF9VA?=
 =?us-ascii?Q?zvyTuZYitilJ6XyXeS0xB5XdeknhJkOY2RjIFNlCynZBdOXXrGvAUP+PiBAM?=
 =?us-ascii?Q?5kEr12H3P1W4idONvMY1xtJj/uPBjGiL5L2dokfNMhtmeoL8VkyeS+trFo4G?=
 =?us-ascii?Q?jZVX5Wq/hDRv6rf4YeCEjlHI+Ie3Bs8IHKxamvZVShD5UjhZLo91hUvwS6/Q?=
 =?us-ascii?Q?7vApy5O13BvfgbLtw1K2EAXNTzA4AmvqxFDgDeXY1NW7DuRRjPak65yYhBNx?=
 =?us-ascii?Q?T7LmyG24Ou9bSqEqMsK3KxhAt+MAMKvKHaOtaXqzuMUKqf4biab8IJl9lHo1?=
 =?us-ascii?Q?jeeMD45LXZmTGALJ9lP1SJyRVaH4TUUZ0aiQFS7GEESQkDd5ytdmJajPBHaP?=
 =?us-ascii?Q?64ohU4CMiK3Pn4SLNB/YldCI9m3gwfkQqpyIYp7Xq302wh25UU7djGvGGh0a?=
 =?us-ascii?Q?oXSc9RJe8I43vh4cEjZqjcuQmAwXseMdB+OfBCHcw1ee00bnk3cIGGc8DVoY?=
 =?us-ascii?Q?Hw=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 85071af4-a82d-417b-fae4-08dd13828f4a
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8562.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2024 10:09:22.9034
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R0IyQ44YPMv+qJFmbIB1p1NmYxMSexJYtAs7cTBxDGgfQYc+GIF073lVS8PU09zLBsqvJLDHg8AN0p4PT518E8vC1dOsEYC1FfKWwLQPQsM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8743
X-Proofpoint-GUID: Qe8CFcnQ5-25esuYkY5RY6qm8tc9dMet
X-Authority-Analysis: v=2.4 cv=RpA/LDmK c=1 sm=1 tr=0 ts=674ed8d5 cx=c_pps a=coA4Samo6CBVwaisclppwQ==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=RZcAm9yDv7YA:10 a=bRTqI5nwn0kA:10 a=GHR8O2WEAAAA:20
 a=t7CeM3EgAAAA:8 a=cFdYe21RfcsvxgiSLx8A:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: Qe8CFcnQ5-25esuYkY5RY6qm8tc9dMet
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-12-02_14,2024-12-03_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 impostorscore=0 spamscore=0 bulkscore=0 malwarescore=0 adultscore=0
 phishscore=0 mlxlogscore=935 clxscore=1015 suspectscore=0
 priorityscore=1501 mlxscore=0 classifier=spam authscore=0 adjust=0
 reason=mlx scancount=1 engine=8.21.0-2411120000
 definitions=main-2412030087
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 03 Dec 2024 10:09:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114181

From: Zhang Peng <peng.zhang1.cn@windriver.com>

Changelog:
libgsf 1.14.53
* Compilation fixes for libxml 2.13
* Fix ABR in gsf-vba-dump.
* Teach gsf (the tool) to handle odf properties.
* Fix integer overflows affecting memory allocation.
* Add missing "DocumentStatus" ole2 property.
* Avoid some undefined C behaviour in overflow checks.
libgsf 1.14.51
* Fix thumbnailer crash.
* Fix leaks.
libgsf 1.14.50
* Fix error handling problem when writing ole files.

License changed to LGPL-2.1-only from 1.14.51
[https://gitlab.gnome.org/GNOME/libgsf/-/commit/037c913eb631349c410ef45e49697bf5c46dac8a]

remove obsolete DEPENDS from upstream [103f49b5fc987e7bb8765700d16bd387a33b62ca]

Security fixes:
CVE-2024-42415
An integer overflow vulnerability exists in the Compound Document Binary
File format parser of v1.14.52 of the GNOME Project G Structured File
Library (libgsf). A specially crafted file can result in an integer
overflow that allows for a heap-based buffer overflow when processing
the sector allocation table. This can lead to arbitrary code execution.
An attacker can provide a malicious file to trigger this vulnerability.
CVE-2024-36474
An integer overflow vulnerability exists in the Compound Document Binary
File format parser of the GNOME Project G Structured File Library
(libgsf) version v1.14.52. A specially crafted file can result in an
integer overflow when processing the directory from the file that allows
for an out-of-bounds index to be used when reading and writing to an
array. This can lead to arbitrary code execution. An attacker can
provide a malicious file to trigger this vulnerability.

Reference:
[https://gitlab.gnome.org/GNOME/libgsf/-/issues/34]

(master rev: 6ed5891c18fc78a69764af0a29ad9b5feefb1aa8)

Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
---
 .../libgsf/{libgsf_1.14.49.bb => libgsf_1.14.53.bb}      | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)
 rename meta-gnome/recipes-gnome/libgsf/{libgsf_1.14.49.bb => libgsf_1.14.53.bb} (52%)

diff --git a/meta-gnome/recipes-gnome/libgsf/libgsf_1.14.49.bb b/meta-gnome/recipes-gnome/libgsf/libgsf_1.14.53.bb
similarity index 52%
rename from meta-gnome/recipes-gnome/libgsf/libgsf_1.14.49.bb
rename to meta-gnome/recipes-gnome/libgsf/libgsf_1.14.53.bb
index f663141bd5..f31c4737a9 100644
--- a/meta-gnome/recipes-gnome/libgsf/libgsf_1.14.49.bb
+++ b/meta-gnome/recipes-gnome/libgsf/libgsf_1.14.53.bb
@@ -1,15 +1,14 @@
 SUMMARY = "GNOME Structured File Library"
-LICENSE = "GPL-2.0-only & LGPL-2.1-only"
-LIC_FILES_CHKSUM = "file://COPYING;md5=dc7371b50816c96e145fa0f8ade8e24d \
-                    file://COPYING.LIB;md5=61464cfe342798eeced82efe9ae55f63"
+LICENSE = "LGPL-2.1-only"
+LIC_FILES_CHKSUM = "file://COPYING;md5=61464cfe342798eeced82efe9ae55f63"
 
 SECTION = "libs"
 
-DEPENDS= "libxml2 bzip2 glib-2.0 zlib gnome-common-native"
+DEPENDS= "libxml2 bzip2 glib-2.0 zlib"
 
 inherit gnomebase gobject-introspection gettext gtk-doc
 
-SRC_URI[archive.sha256sum] = "e9ebe36688f010c9e6e40c8903f3732948deb8aca032578d07d0751bd82cf857"
+SRC_URI[archive.sha256sum] = "0eb59a86e0c50f97ac9cfe4d8cc1969f623f2ae8c5296f2414571ff0a9e8bcba"
 SRC_URI += "file://0001-configure.ac-drop-a-copy-paste-of-introspection.m4-m.patch"
 
 PACKAGECONFIG ??= ""
-- 
2.39.4


