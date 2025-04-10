Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BD27C369A8
	for <webhook@archiver.kernel.org>; Thu, 10 Apr 2025 13:42:01 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.34465.1744292516828874396
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 10 Apr 2025 06:41:57 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=61957cd107=qi.chen@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53A5eYcX001118
	for <openembedded-devel@lists.openembedded.org>; Thu, 10 Apr 2025 13:41:56 GMT
Received: from nam04-mw2-obe.outbound.protection.outlook.com (mail-mw2nam04lp2168.outbound.protection.outlook.com [104.47.73.168])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45tsr1q1ba-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 10 Apr 2025 13:41:55 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UT6H0rMCNfMuEox9OdDh76PuYlrxldPwfqzOHEodorgScRKZaxZvOvL32ZD9QjQXdM7qEp6gEnnr6guziVuaxHUGCcMZZVnGCGCTfRkS4LlBHKp5jlphYlzmNSjxl/emIbNTpiwXmvXZpwwYO5H8QzIOncymQgI0jqqQILt9y8jhtKQUudbqHxp/cZTtmnSX8kfAGNTWfDZOxJlwdS8kYLARcwc9Sf5REyXv/bCuLup8xI8/riKeTHBTgeDgRnTX03bU7BXEruKyRxY4yIHyKRwGZbHR0YvDtGaMDmS+D4LzZHwaHXFq5O18vJQQSWt4hYAxd3dqwcNG7nhFaOhdOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h/TouNHXZosgSwxi5hFpXzNGDpZXXsNK0dqhH2x0vhk=;
 b=iOufgHTrxQuZc/Ef18Wt4wphJFS9+dHYTP77866dgUR9gQekzHs9guvTmUDw+jIFsKPfiEKldFyddKxwuP3QWL1Ygg7pKpe9TqK0BdaWLItzUrjyW9i+E5MT85/tyauJzkdQQ0LfblbZebaO0xhS/IauJFqQOC3nWcg2DcQPGfCnwKkBobDfVUJh2Y/19HLGoNsxhMi1IQN6FAaF7PEhpqhH7KuZAX6bqRVRUv5AHY5w8AFMam0fCRxoxLiDOxXioRtLnkZKgBeIoDA0DhRnItP82CsDyKwgT9lwn2W4N9EvYnDqKja23kv0y8bYROgiwsOCWBJIrkXiE4WRMlX9nQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by SN7PR11MB8281.namprd11.prod.outlook.com (2603:10b6:806:26b::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.31; Thu, 10 Apr
 2025 13:41:52 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093%4]) with mapi id 15.20.8606.029; Thu, 10 Apr 2025
 13:41:51 +0000
From: Qi.Chen@windriver.com
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-oe][PATCH V3 1/2] recipes: adapt to qemu.bbclass refactoring
Date: Thu, 10 Apr 2025 06:41:44 -0700
Message-ID: <20250410134145.1300042-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR17CA0013.namprd17.prod.outlook.com
 (2603:10b6:a03:1b8::26) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|SN7PR11MB8281:EE_
X-MS-Office365-Filtering-Correlation-Id: 6090c8f2-cecd-4e4b-9258-08dd78357327
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?k7ywNGD90M7kKQNQSXo/NiyXUCsz0a+C37oOGUSe+zHP+qLmhir9HKlR68GN?=
 =?us-ascii?Q?fLIOwBymmpfxT3iSvoM1cKMnflx1lSfi/XdnGiVUmiPYdRlVwRfwx8VIYn49?=
 =?us-ascii?Q?Ty9CiYX0rWFf9268ogONurTqyVpvuS5+JuTGV3WGDJMLV8dOlzL/g0F+ROfS?=
 =?us-ascii?Q?nwExCkvLCF09aCh+8du4WoCxylGdt6MSkzrZHOVPNyE2N7YzCCEMAYMAA/z3?=
 =?us-ascii?Q?5RVSh1QNSbvDQHhqnuupGHKYJPcSf1HyYmbwBOl/IZD1HJS1sZiZKQZ3TXhh?=
 =?us-ascii?Q?BKyf1f6PVpnQydY8U7rYjt53PXomER8ZB0940zVmtRQT1xd9Zho/iscymjan?=
 =?us-ascii?Q?mIc7a8t24zeVBD9oJpityXq86ZtAPjXqE49DrHUCCN/vo2gmb5rVAljYf5Zn?=
 =?us-ascii?Q?+gY1CDqM3hH+bGUq3afXpKyMHR+P6LKg1BKRc8BXNlDn/E4ddn3WmsnMI1jA?=
 =?us-ascii?Q?q6OoY3ildQZit4bB88J2HDLhbxs+KiVx05VC6/f/TkUAYe1VrRWGklb55heG?=
 =?us-ascii?Q?xai659P+JZdhB1Kwy41BWCss5ds8mbkK5GRuKTwHLQCq3jCGAp/e0WiR0me5?=
 =?us-ascii?Q?a+3kShu9eYQ8SovkMPUtshoBmawuxkyZj1S29rD6l6RuIbUopuIzn8E5+/h3?=
 =?us-ascii?Q?WDOez2sqS08RqgYubLhhltEectWAAr/gmHsYaU/TDlG4LYzMZEo48OKjtmxt?=
 =?us-ascii?Q?e4E2loK3ZMwSrFvcCpyotZcbnowwaI+5aVIAq6ccyea5FDIs1lNhdIS85cBM?=
 =?us-ascii?Q?ahEew9uSToSiJpGFTU+CKCayFncDLD+wSjcDtLF/IczjSvWcHvmy5TvdcVPn?=
 =?us-ascii?Q?9ZTu5u/xqkrmsY5x5HTY+I5w3/LsRNwqUQHS97gjgBym9SSY6RJrQEJ1zUv3?=
 =?us-ascii?Q?El16Wz5WcokFkOomTmHsV02cH7VTia5k8/csOoYCgTbuAhjmHqO3pqyn5f8V?=
 =?us-ascii?Q?yOt2zKzGVPmaB8LGuBfNYnFU5ibu11SlGLfoUOxHk++jIKMsfXGmrHvWaGeh?=
 =?us-ascii?Q?Ax/3zWGbqB6kI1cDgJHxVwy+zspy1hRliOeAAQ9Mo9Ev7ggAlHIA28YU08q2?=
 =?us-ascii?Q?a0fOoJb1d1VIelOoBBBIhYpg5o6+zXgLc5V/W0CmVQfYmiwxNsL/CCsnsawQ?=
 =?us-ascii?Q?HdniK2Cz0HOo1j5OjR31FKYzO51sgIIaua9JqRVAnS0HCGFv7e75cemC2YHN?=
 =?us-ascii?Q?tiMblM8ZwqQnuMOJ4M4E9hg2wFIOKPK71lKH4/iLDglkkYO2WR4YHcUUa1fM?=
 =?us-ascii?Q?q1duUZrqqPGtqxXz4sWObVNHDnoTM4KpGxqgAg2fl8DSvZmpRWnMbj1PUI3v?=
 =?us-ascii?Q?Ddoq47S+x+6D/1mObJSP+1+0MfMCuCPJ684i9BMFBf3WFM/sfRpbVkB8GkTj?=
 =?us-ascii?Q?MGrUeETUlZFY0h9YoL32uRSwn+IU86sP0HcbrBCpch3pXObOLjtnnTe/3wUc?=
 =?us-ascii?Q?zVzT/IVyfSg=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?cSmmJ7efhV1dUYIG8fDiN2nKne7uxOJEe6ul7JUQoXwgyW3kYLX5IrmFtn+J?=
 =?us-ascii?Q?e2e7K7BQ3BQZBfj5zcxH1fy4BJPM1pLo1zmg/x1HX+l93H8oztZKc64RoWUA?=
 =?us-ascii?Q?VGQv64SGzYA779jRKIycUclT0KZCKGU/YjuByamf9gYa+U7yLVMJssHYCUGa?=
 =?us-ascii?Q?RGKc6OuYo78vjz7XCIFu3heIWsOLjLl4UZR/NnWO11KnmGYHJfk3R/JZjIMJ?=
 =?us-ascii?Q?R/kawdp7lx4Ez8bM4gSWHv7rfa7Ht8W6smfmewt5WnIghD9lUtZNppbcwBiX?=
 =?us-ascii?Q?YnWvF2UE4N0KLkoAX+cnHAgpWZ+M58QvFLxfQFB09VVhQZEy9CX0g5GpHD45?=
 =?us-ascii?Q?i6PgKH+4XubzmvJpjhYG1Gt9bM3m432PssbaslR2URQTh13fkBZkobycXEsh?=
 =?us-ascii?Q?1UtC0cGQmdtIL8DeRNiuL4gRYf9DqbcnV3QUuknPwCWYoslxpAu6V7BaNEI/?=
 =?us-ascii?Q?e0Ia+E5oissBXqnhS69bab1HyMFxqouBwxzkTrBpukS/7PvpcvOv3SSTda1c?=
 =?us-ascii?Q?3mYgBlZ6X1IL8uNkic/ey+EWPVOSzamSooEc0nG2JbOeY2zEKSj6DIHKnjY8?=
 =?us-ascii?Q?U0sFN3PFUSJZSaUcK4TJCpDMeFilT9hVuayzN2KHZIO+jiCBDIRKQFx1j2DP?=
 =?us-ascii?Q?H2xfB0Rup4Oqqqp+b/kh9e8DW4xINPw98VkDQ+HzZUcDVWuhuUDCUfrB0W/I?=
 =?us-ascii?Q?OK8HcQt+X0gfykhgwpksw7GJhxwLh08PbCbrEfKEPZaJpUe7gq1IQoIJqHO1?=
 =?us-ascii?Q?nxBS4ksGVYf5cJXAnAtPxPOSc6tO4K35gI3/wtHQgERhJ5IINlKojGvFvE+1?=
 =?us-ascii?Q?Ob7/CshJCiGs+tjNkDM8b8NfS18XGtzGHpA8tIWbvfaYYdSROuSNUBlKwgFK?=
 =?us-ascii?Q?13IlpZX5p8cdOinT2zLEJXT7L9LgLXOhb7obf27Y8cASq407NiItwaP28E/L?=
 =?us-ascii?Q?QzujFN8Y+sz5m8Mlic8NYbSpz+zsvu3BAhn3wXPLorW6KHvAo4FaH3Kbf3UC?=
 =?us-ascii?Q?oYhuQDvAn01RpID5UC3rm5zMIB6Y0X/nSOxyNRWz1HrqQfXGelQXnLvli7G+?=
 =?us-ascii?Q?IiXyktx2CAYniX7XsNuC4C2fP/xyL8Mkn4Ose+B65g/rc1FcOQeqX1d6groi?=
 =?us-ascii?Q?BZitVKUMIuoFvWbaOpeXRGFcyJoZtONJpDD8S33DkSyHdtH8Zxhqfqv78Qzs?=
 =?us-ascii?Q?Hbt+zgqaHev0/ok115voWx6LPyY4aAyjzrmduh8V1f6KWHNl01ci8JNOt7MS?=
 =?us-ascii?Q?kbuQ/vfGLBX3bCiZ1D5gQxQ/hrdUf1b9eJTHqo2hMvMSxc/P5zQxzLBHDNs9?=
 =?us-ascii?Q?YmRqRRQ27L2Ky4z1YMOixiPaqbaBLCQQzS2ekFoGAU52KfpAYknIOPTtoSSB?=
 =?us-ascii?Q?+UBlw/+T+h+OnB+DOkdmQ22K9m6R27JGpgJgJvz60mnwiS2J5KiJJeObMnmc?=
 =?us-ascii?Q?MrVTiiDo6atn/JG3fABlISwrpj6uNjd4mfstdPjs7Fl1PVpzP8tIPsyCC0Dw?=
 =?us-ascii?Q?DU0AoVg2oTqeqhX2bipkwU/NvxeYzbqMhAkvMQ77GrG0tsDl5T4hAbesivkF?=
 =?us-ascii?Q?LoeGtKfbBrtcKQDd/y93XQnAQ96pBm5oIXeoaexWFwHg6KA78hv0qUSVAr5q?=
 =?us-ascii?Q?jQ=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6090c8f2-cecd-4e4b-9258-08dd78357327
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2025 13:41:51.9392
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hkHpFbuFQVpzZaQgWQN34AgZ2tUyzMfrc3BZFpjWEGfuK/PA6EwGHd1I/ZpfKDhdT6bj4YypuKUp3rVrzAF5WQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB8281
X-Authority-Analysis: v=2.4 cv=Td6WtQQh c=1 sm=1 tr=0 ts=67f7caa3 cx=c_pps a=WGTt6C9BqyZsVnlRayY6PA==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=XR8D0OoHHMoA:10
 a=NEAV23lmAAAA:8 a=p0WdMEafAAAA:8 a=OGsvooznAAAA:8 a=t7CeM3EgAAAA:8 a=Vx67Z-VKHrIevtutq1IA:9 a=B5HV4OX4S3AA:10 a=Ro9wbLpunPwA:10 a=_MKx33s3DjsVgJzmPKfz:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: nz0idrUovYUreqTJNrv2bzLDHk3iJdzj
X-Proofpoint-GUID: nz0idrUovYUreqTJNrv2bzLDHk3iJdzj
X-Sensitive_Customer_Information: Yes
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-10_03,2025-04-08_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 mlxscore=0
 mlxlogscore=999 clxscore=1015 lowpriorityscore=0 adultscore=0 bulkscore=0
 impostorscore=0 phishscore=0 spamscore=0 suspectscore=0 priorityscore=1501
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.21.0-2502280000
 definitions=main-2504100099
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 10 Apr 2025 13:42:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116768

From: Chen Qi <Qi.Chen@windriver.com>

Avoid inheriting qemu.bbclass and use oe.qemu.xxx instead.

Also, the 'qemu-native' dep is replaced by 'qemuwrapper-cross' for
PACKAGE_WRITE_DEPS. qemuwrapper-cross is the one that is actually
used by postints and it has 'qemu-native' in DEPENDS.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta-oe/classes/check-version-mismatch.bbclass       |  4 +---
 meta-oe/recipes-devtools/mpich/mpich_4.3.0.bb        |  4 ++--
 meta-oe/recipes-devtools/nodejs/nodejs_22.14.0.bb    |  6 +++---
 meta-oe/recipes-extended/icewm/icewm_3.7.3.bb        |  4 ++--
 meta-oe/recipes-graphics/graphviz/graphviz_12.2.1.bb |  6 +++---
 meta-oe/recipes-support/espeak/espeak_1.48.04.bb     |  4 ++--
 meta-oe/recipes-support/hdf5/hdf5_1.14.4-3.bb        |  4 ++--
 meta-oe/recipes-support/uim/uim_1.9.0.bb             | 12 ++++++------
 meta-oe/recipes-support/unixodbc/unixodbc_2.3.12.bb  |  4 ++--
 9 files changed, 23 insertions(+), 25 deletions(-)

diff --git a/meta-oe/classes/check-version-mismatch.bbclass b/meta-oe/classes/check-version-mismatch.bbclass
index 7b46151b03..dc6eeab4e7 100644
--- a/meta-oe/classes/check-version-mismatch.bbclass
+++ b/meta-oe/classes/check-version-mismatch.bbclass
@@ -1,12 +1,10 @@
-inherit qemu
-
 ENABLE_VERSION_MISMATCH_CHECK ?= "${@'1' if bb.utils.contains('MACHINE_FEATURES', 'qemu-usermode', True, False, d) else '0'}"
 DEBUG_VERSION_MISMATCH_CHECK ?= "1"
 CHECK_VERSION_PV ?= ""
 
 DEPENDS:append:class-target = "${@' qemu-native' if bb.utils.to_boolean(d.getVar('ENABLE_VERSION_MISMATCH_CHECK')) else ''}"
 
-QEMU_EXEC ?= "${@qemu_wrapper_cmdline(d, '${STAGING_DIR_HOST}', ['${STAGING_DIR_HOST}${libdir}','${STAGING_DIR_HOST}${base_libdir}', '${PKGD}${libdir}', '${PKGD}${base_libdir}'])}"
+QEMU_EXEC ?= "${@oe.qemu.qemu_wrapper_cmdline(d, '${STAGING_DIR_HOST}', ['${STAGING_DIR_HOST}${libdir}','${STAGING_DIR_HOST}${base_libdir}', '${PKGD}${libdir}', '${PKGD}${base_libdir}'])}"
 
 python do_package_check_version_mismatch() {
     import re
diff --git a/meta-oe/recipes-devtools/mpich/mpich_4.3.0.bb b/meta-oe/recipes-devtools/mpich/mpich_4.3.0.bb
index 6babba3de7..af15ce61a3 100644
--- a/meta-oe/recipes-devtools/mpich/mpich_4.3.0.bb
+++ b/meta-oe/recipes-devtools/mpich/mpich_4.3.0.bb
@@ -28,13 +28,13 @@ PACKAGECONFIG[fortran] = "--with-cross=${WORKDIR}/cross_values.txt --enable-fort
 LDFLAGS:append:x86-64 = " -lgcc"
 LDFLAGS:append:x86 = " -lgcc"
 
-inherit autotools gettext pkgconfig qemu
+inherit autotools gettext pkgconfig
 
 DEPENDS += "qemu-native"
 
 do_configure() {
     if [ "${@bb.utils.contains('PACKAGECONFIG', 'fortran', '1', '', d)}" = "1" ]; then
-        qemu_binary="${@qemu_wrapper_cmdline(d, d.getVar('STAGING_DIR_HOST'), [d.expand('${STAGING_DIR_HOST}${libdir}'),d.expand('${STAGING_DIR_HOST}${base_libdir}')])}"
+        qemu_binary="${@oe.qemu.qemu_wrapper_cmdline(d, d.getVar('STAGING_DIR_HOST'), [d.expand('${STAGING_DIR_HOST}${libdir}'),d.expand('${STAGING_DIR_HOST}${base_libdir}')])}"
         cat > ${WORKDIR}/qemuwrapper << EOF
 #!/bin/sh
 $qemu_binary "\$@"
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_22.14.0.bb b/meta-oe/recipes-devtools/nodejs/nodejs_22.14.0.bb
index dee4c9df4f..a9d98ff453 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_22.14.0.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_22.14.0.bb
@@ -9,7 +9,7 @@ DEPENDS = "openssl openssl-native file-replacement-native python3-packaging-nati
 DEPENDS:append:class-target = " qemu-native"
 DEPENDS:append:class-native = " c-ares-native"
 
-inherit pkgconfig python3native qemu ptest siteinfo
+inherit pkgconfig python3native ptest siteinfo
 
 COMPATIBLE_MACHINE:armv4 = "(!.*armv4).*"
 COMPATIBLE_MACHINE:armv5 = "(!.*armv5).*"
@@ -107,8 +107,8 @@ python do_create_v8_qemu_wrapper () {
     on the host."""
     qemu_libdirs = [d.expand('${STAGING_DIR_HOST}${libdir}'),
                     d.expand('${STAGING_DIR_HOST}${base_libdir}')]
-    qemu_cmd = qemu_wrapper_cmdline(d, d.getVar('STAGING_DIR_HOST'),
-                                    qemu_libdirs)
+    qemu_cmd = oe.qemu.qemu_wrapper_cmdline(d, d.getVar('STAGING_DIR_HOST'),
+                                            qemu_libdirs)
 
     if d.getVar("HOST_AND_TARGET_SAME_WIDTH") == "1":
         qemu_cmd = ""
diff --git a/meta-oe/recipes-extended/icewm/icewm_3.7.3.bb b/meta-oe/recipes-extended/icewm/icewm_3.7.3.bb
index 311abc3702..8c238beb42 100644
--- a/meta-oe/recipes-extended/icewm/icewm_3.7.3.bb
+++ b/meta-oe/recipes-extended/icewm/icewm_3.7.3.bb
@@ -10,7 +10,7 @@ SRC_URI[sha256sum] = "4d845d8af6194fa25b36524467ae9fdcca2faed5c4046515e3bc633ff1
 UPSTREAM_CHECK_URI = "https://github.com/ice-wm/${BPN}/releases"
 UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)"
 
-inherit autotools pkgconfig gettext perlnative features_check qemu update-alternatives
+inherit autotools pkgconfig gettext perlnative features_check update-alternatives
 REQUIRED_DISTRO_FEATURES = "x11"
 
 EXTRA_OECONF += "--with-libdir=${datadir}/icewm \
@@ -31,7 +31,7 @@ do_compile:prepend:class-target() {
     cd ${B}
     oe_runmake -C src genpref
 
-    qemu_binary="${@qemu_wrapper_cmdline(d, '${STAGING_DIR_TARGET}',['${B}/src/.libs','${STAGING_DIR_TARGET}/${libdir}','${STAGING_DIR_TARGET}/${base_libdir}'])}"
+    qemu_binary="${@oe.qemu.qemu_wrapper_cmdline(d, '${STAGING_DIR_TARGET}',['${B}/src/.libs','${STAGING_DIR_TARGET}/${libdir}','${STAGING_DIR_TARGET}/${base_libdir}'])}"
     cat >qemuwrapper <<EOF
 #!/bin/sh
 ${qemu_binary} src/genpref "\$@"
diff --git a/meta-oe/recipes-graphics/graphviz/graphviz_12.2.1.bb b/meta-oe/recipes-graphics/graphviz/graphviz_12.2.1.bb
index cccbbe75f7..cb04a1b24a 100644
--- a/meta-oe/recipes-graphics/graphviz/graphviz_12.2.1.bb
+++ b/meta-oe/recipes-graphics/graphviz/graphviz_12.2.1.bb
@@ -16,7 +16,7 @@ DEPENDS = " \
 DEPENDS:append:class-target = " ${BPN}-native"
 DEPENDS:append:class-nativesdk = " ${BPN}-native"
 
-inherit autotools-brokensep pkgconfig gettext qemu
+inherit autotools-brokensep pkgconfig gettext
 
 SRC_URI = "https://gitlab.com/api/v4/projects/4207231/packages/generic/${BPN}-releases/${PV}/${BP}.tar.xz \
            "
@@ -84,7 +84,7 @@ SYSROOT_PREPROCESS_FUNCS:append:class-native = " graphviz_sstate_postinst"
 pkg_postinst:${PN} () {
     if [ -n "$D" ]; then
         if ${@bb.utils.contains('MACHINE_FEATURES', 'qemu-usermode', 'true', 'false', d)}; then
-            ${@qemu_run_binary(d, '$D', '${bindir}/dot')} -c
+            ${@oe.qemu.qemu_run_binary(d, '$D', '${bindir}/dot')} -c
         fi
     else
         dot -c
@@ -96,7 +96,7 @@ pkg_postrm:${PN} () {
     rmdir --ignore-fail-on-non-empty $D${libdir}/graphviz
 }
 
-PACKAGE_WRITE_DEPS += "qemu-native"
+PACKAGE_WRITE_DEPS += "qemuwrapper-cross"
 
 PACKAGES =+ "${PN}-python ${PN}-perl ${PN}-demo"
 
diff --git a/meta-oe/recipes-support/espeak/espeak_1.48.04.bb b/meta-oe/recipes-support/espeak/espeak_1.48.04.bb
index b4812d59d6..363fffbc05 100644
--- a/meta-oe/recipes-support/espeak/espeak_1.48.04.bb
+++ b/meta-oe/recipes-support/espeak/espeak_1.48.04.bb
@@ -13,7 +13,7 @@ SRC_URI[sha256sum] = "bf9a17673adffcc28ff7ea18764f06136547e97bbd9edf2ec612f09b20
 S = "${WORKDIR}/espeak-${PV}-source"
 
 DEPENDS = "portaudio-v19 qemu-helper-native"
-inherit siteinfo qemu
+inherit siteinfo
 
 
 CXXFLAGS += "-DUSE_PORTAUDIO"
@@ -31,7 +31,7 @@ do_compile() {
     oe_runmake
 
     cd "${S}/platforms/big_endian"
-    qemu_binary="${@qemu_wrapper_cmdline(d, '${STAGING_DIR_TARGET}', ['${S}/platforms/big_endian', '${STAGING_DIR_TARGET}${base_libdir}'])}"
+    qemu_binary="${@oe.qemu.qemu_wrapper_cmdline(d, '${STAGING_DIR_TARGET}', ['${S}/platforms/big_endian', '${STAGING_DIR_TARGET}${base_libdir}'])}"
     cat >qemuwrapper <<EOF
 #!/bin/sh
 $qemu_binary "\$@"
diff --git a/meta-oe/recipes-support/hdf5/hdf5_1.14.4-3.bb b/meta-oe/recipes-support/hdf5/hdf5_1.14.4-3.bb
index f34e5f183d..4ffc875cec 100644
--- a/meta-oe/recipes-support/hdf5/hdf5_1.14.4-3.bb
+++ b/meta-oe/recipes-support/hdf5/hdf5_1.14.4-3.bb
@@ -7,7 +7,7 @@ SECTION = "libs"
 LICENSE = "HDF5"
 LIC_FILES_CHKSUM = "file://COPYING;md5=adebb1ecf1b3b80c13359e18ef67301e"
 
-inherit cmake siteinfo qemu multilib_header multilib_script
+inherit cmake siteinfo multilib_header multilib_script
 
 DEPENDS += "qemu-native zlib"
 
@@ -30,7 +30,7 @@ EXTRA_OECMAKE:prepend:class-target = "-DCMAKE_CROSSCOMPILING_EMULATOR=${WORKDIR}
 gen_emu() {
         # Write out a qemu wrapper that will be used by cmake
         # so that it can run target helper binaries through that.
-        qemu_binary="${@qemu_wrapper_cmdline(d, d.getVar('STAGING_DIR_HOST'), [d.expand('${STAGING_DIR_HOST}${libdir}'),d.expand('${STAGING_DIR_HOST}${base_libdir}')])}"
+        qemu_binary="${@oe.qemu.qemu_wrapper_cmdline(d, d.getVar('STAGING_DIR_HOST'), [d.expand('${STAGING_DIR_HOST}${libdir}'),d.expand('${STAGING_DIR_HOST}${base_libdir}')])}"
         cat > ${WORKDIR}/qemuwrapper << EOF
 #!/bin/sh
 $qemu_binary "\$@"
diff --git a/meta-oe/recipes-support/uim/uim_1.9.0.bb b/meta-oe/recipes-support/uim/uim_1.9.0.bb
index 5ed61fd098..4c16ab327a 100644
--- a/meta-oe/recipes-support/uim/uim_1.9.0.bb
+++ b/meta-oe/recipes-support/uim/uim_1.9.0.bb
@@ -25,7 +25,7 @@ LEAD_SONAME = "libuim.so.1"
 COMPATIBLE_HOST:riscv64 = "null"
 COMPATIBLE_HOST:riscv32 = "null"
 
-inherit features_check autotools pkgconfig gettext qemu gtk-immodules-cache
+inherit features_check autotools pkgconfig gettext gtk-immodules-cache
 
 REQUIRED_DISTRO_FEATURES = "x11"
 
@@ -118,10 +118,10 @@ FILES:uim-skk = "${libdir}/uim/plugin/libuim-skk.* \
     ${datadir}/uim/skk*.scm \
 "
 
-PACKAGE_WRITE_DEPS += "qemu-native"
+PACKAGE_WRITE_DEPS += "qemuwrapper-cross"
 pkg_postinst:uim-anthy() {
     if test -n "$D"; then
-        ${@qemu_run_binary(d, '$D', '${bindir}/uim-module-manager')} --register anthy --path $D${datadir}/uim
+        ${@oe.qemu.qemu_run_binary(d, '$D', '${bindir}/uim-module-manager')} --register anthy --path $D${datadir}/uim
     else
 		uim-module-manager --register anthy --path ${datadir}/uim
     fi
@@ -129,7 +129,7 @@ pkg_postinst:uim-anthy() {
 
 pkg_prerm:uim-anthy() {
     if test -n "$D"; then
-        ${@qemu_run_binary(d, '$D', '${bindir}/uim-module-manager')} --path $D${datadir}/uim --unregister anthy
+        ${@oe.qemu.qemu_run_binary(d, '$D', '${bindir}/uim-module-manager')} --path $D${datadir}/uim --unregister anthy
     else
 		uim-module-manager --path ${datadir}/uim --unregister anthy
     fi
@@ -137,7 +137,7 @@ pkg_prerm:uim-anthy() {
 
 pkg_postinst:uim-skk() {
     if test -n "$D"; then
-        ${@qemu_run_binary(d, '$D', '${bindir}/uim-module-manager')} --register skk --path $D${datadir}/uim
+        ${@oe.qemu.qemu_run_binary(d, '$D', '${bindir}/uim-module-manager')} --register skk --path $D${datadir}/uim
     else
 		uim-module-manager --register skk --path ${datadir}/uim
     fi
@@ -145,7 +145,7 @@ pkg_postinst:uim-skk() {
 
 pkg_postrm:uim-skk() {
     if test -n "$D"; then
-        ${@qemu_run_binary(d, '$D', '${bindir}/uim-module-manager')} --path $D${datadir}/uim --unregister skk
+        ${@oe.qemu.qemu_run_binary(d, '$D', '${bindir}/uim-module-manager')} --path $D${datadir}/uim --unregister skk
     else
 		uim-module-manager --path ${datadir}/uim --unregister skk
     fi
diff --git a/meta-oe/recipes-support/unixodbc/unixodbc_2.3.12.bb b/meta-oe/recipes-support/unixodbc/unixodbc_2.3.12.bb
index 0927f5c904..ce02535c95 100644
--- a/meta-oe/recipes-support/unixodbc/unixodbc_2.3.12.bb
+++ b/meta-oe/recipes-support/unixodbc/unixodbc_2.3.12.bb
@@ -18,14 +18,14 @@ SRC_URI[sha256sum] = "f210501445ce21bf607ba51ef8c125e10e22dffdffec377646462df5f0
 UPSTREAM_CHECK_URI = "https://www.unixodbc.org/download.html"
 UPSTREAM_CHECK_REGEX = "unixODBC-(?P<pver>\d+(\.\d+)+)\.tar"
 
-inherit autotools-brokensep multilib_header qemu
+inherit autotools-brokensep multilib_header
 
 S = "${WORKDIR}/unixODBC-${PV}"
 
 EXTRA_OEMAKE += "LIBS=-lltdl"
 EXTRA_OECONF += "--enable-utf8ini"
 DEPENDS:append:class-target = "${@' qemu-native' if bb.utils.contains('MACHINE_FEATURES', 'qemu-usermode', True, False, d) else ''}"
-QEMU_WRAPPER = "${@qemu_wrapper_cmdline(d, '${STAGING_DIR_HOST}', ['${STAGING_DIR_HOST}/${libdir}','${STAGING_DIR_HOST}/${base_libdir}'])}"
+QEMU_WRAPPER = "${@oe.qemu.qemu_wrapper_cmdline(d, '${STAGING_DIR_HOST}', ['${STAGING_DIR_HOST}/${libdir}','${STAGING_DIR_HOST}/${base_libdir}'])}"
 
 do_configure:prepend() {
     # old m4 files will cause libtool version don't match
-- 
2.49.0


