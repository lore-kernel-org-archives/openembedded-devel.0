Return-Path: <peng.zhang1.cn@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04102C02180
	for <webhook@archiver.kernel.org>; Tue, 14 Jan 2025 03:07:51 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.36898.1736824061990444928
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Jan 2025 19:07:42 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=310900c87a=peng.zhang1.cn@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50E1Z124003518
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Jan 2025 03:07:41 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2041.outbound.protection.outlook.com [104.47.70.41])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 443fm8aj89-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Jan 2025 03:07:40 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YG5Uya2d25366NXRZhvVx1/KbXcsO9Jb6EyIHH8SglDVqhf4XfkOJrsvpEgBAmtfAqt9yjf5VCyEkX5/PKH9VZ+T5LW3OxNKtPlo0b5CzjuI4D8zoB3oNe3IEYK2qohvFTOLCwM5g3G03jU/aczebVF5AXZ4YNt/HjN9WVpEevExrktuYLyqn2q0fB0ff/Tnk3pot/rTTTLNX7K68RoIYtPCSu4xtra8CfIDOHsNkbV0feEt96DNiQsxCIPrtwtnCkoIMgiXIjXoLsRFOfWWfxYGX7RmzNa4eOAnufPHuLOFdg7hk3vvXX0fkhOHu2xAsJaUlnHzbIsrh5nWiT7Ufw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6w0gaNnSeRukLxy/qg0zpNaCZFOeOy0y/EarXqr21BQ=;
 b=uR/lSmNCV0re64e0x5zLIncrdsIuYo8ZgNAeajgwdIb6U91rxAoAxS+s9EhhJ1gwhcjP16ByCHmmfVqZv/ia6vg+i8kUNuO2dp5loCMgiTs97YfE7+3NzBCrXE5Q4BDK8XU8JmdM1b6qhGlR/HsIDHit6JJ9Mxp8PDfwgaEHVBuFhOZGdhYYm8hevNXjrHGOazL7fYJBTFleM1eDfW4L6PyW8neWnN6KzmwECXzWGSkFRySlCpBdlMIMMcyK6Y7+wbxm3+l81wn1B6hqyDmnFgyaQ5kYbzAeIW88NTUN0yuOIL6+8cOSqH0GPXIMJLtZBN8B6O02tWLcpaOlmpxL0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8562.namprd11.prod.outlook.com (2603:10b6:610:1b8::13)
 by DS0PR11MB7311.namprd11.prod.outlook.com (2603:10b6:8:11e::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.18; Tue, 14 Jan
 2025 03:07:36 +0000
Received: from CH3PR11MB8562.namprd11.prod.outlook.com
 ([fe80::24c6:f8fc:1afe:179f]) by CH3PR11MB8562.namprd11.prod.outlook.com
 ([fe80::24c6:f8fc:1afe:179f%7]) with mapi id 15.20.8335.017; Tue, 14 Jan 2025
 03:07:36 +0000
From: peng.zhang1.cn@windriver.com
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH v2] lapack: fix TMPDIR reference in do_package_qa
Date: Tue, 14 Jan 2025 11:07:26 +0800
Message-Id: <20250114030726.3639057-1-peng.zhang1.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYAPR01CA0121.jpnprd01.prod.outlook.com
 (2603:1096:404:2d::13) To CH3PR11MB8562.namprd11.prod.outlook.com
 (2603:10b6:610:1b8::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8562:EE_|DS0PR11MB7311:EE_
X-MS-Office365-Filtering-Correlation-Id: 4df9aa34-8756-4b4e-a595-08dd344898dd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|52116014|1800799024|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?n4n9CWZdb57Wj4KvsKq3V+s9d9LQ/xZLJgYJ2rzA8gOfYvBVf18yXbe+CvZT?=
 =?us-ascii?Q?S2HmTy8meUoRIbj1Id88WoQISGCotH3FfY7GNdeSbPOF56nDsPGcao7qwsc2?=
 =?us-ascii?Q?lFbhlBB6IBQLYvmxMW1aATLX5OHJL6Ps7XuUtoIQazFnJiYFQcoeo6Z2hvs4?=
 =?us-ascii?Q?t2FJr0q9AtzDTvAo08ZUKgS3/sjqnF/tZez8isMD9xgnbDcTsvwbr0g82i/0?=
 =?us-ascii?Q?R1GvMA+UCktaZfjW3GYRfaDrRlvuUPvTjwGU2TEf6EpdE+AN1c49sr7iauj+?=
 =?us-ascii?Q?QMVz8ZxCeSXLqPWEI/ofwJ9u6z+n4zewTS6UUqfEtxQg7xi+d7LCrFxzxQAl?=
 =?us-ascii?Q?Gnu4VDEz2Iye0roq3zEgapwwj/a93tEc53PPoL4QKoXV6jstfkh3PucdpB55?=
 =?us-ascii?Q?MRKjpKf0p5O/DOu/TSawZATm6fE/IqytvZQFAW3rnGul/YqW2QV2oHi82dSx?=
 =?us-ascii?Q?YQzsqkuPjZfohEinQXnioxjWwb/YnPGYDKb785LgHcyJyZz0JFSM3A5/YzSq?=
 =?us-ascii?Q?r6cTlo/4jXXFzp4dh023c7EIxNNbfsxH0qvy/2dwH0kCKsWpK8EaRUX+gNQ6?=
 =?us-ascii?Q?JdG2er9NrMCw+dS9vEJMt2J67jqPcWDg7aX4dr55hiPP4gnkbUA0ux9Bp3JS?=
 =?us-ascii?Q?a9lTuwlJw1pae1REvNKZ00957mBf9UVKCRawtTcCwhvTgZ74PWCo9RamELEn?=
 =?us-ascii?Q?i2sJQZBpQLOVHDJICCOlE88XeN9MvHJDrEwT22PhROehPZIv/rPwUJI7/4dM?=
 =?us-ascii?Q?DXOkTTsnUNMPLDuYkXfFMsYxKbU76iVW1k3rzKF5i1hxdpRkj81kiewhcR4W?=
 =?us-ascii?Q?I7EgK+X9QtjjrDXObRHckUrb2GmOnTCk/OPqKwNqkSlE2qr5mL6rBVtKfZOr?=
 =?us-ascii?Q?HeNwu+POq76Td3dXvT82PZuUokk0x/wn0bA4lHnLLUfTu1WBP1unp0zhKdGb?=
 =?us-ascii?Q?JbRRTXHNp/H/OXHtTBHbvk0/MChGELT3gqjgLvhtyQ88CWU7j4WmwwfSQlm5?=
 =?us-ascii?Q?APQqxLgKJq4mz7VH23lueYfiKQTqYi37cyovEozFTVgGvdwh3BlNM+8B6T5o?=
 =?us-ascii?Q?wGUdO0mFdy80G3ZRc3FhqIF5sVGMglXTQGzXVv/g9d0QKeRJV+qoccrPyEx3?=
 =?us-ascii?Q?T8by+EUGBwU0eEXGxqnSIemin+UMXeY141yO2/lcaxmztdC15wqRPmqXMAdd?=
 =?us-ascii?Q?pKAQTzdPabUOIgLk5K8cq2OZHMmAJ/OmFy5PZ4mNAmsyh9OVrDDmorLmBG68?=
 =?us-ascii?Q?J9+lRi+rESqEumdNdPyIJYY7ahkQqFaJgVuJyc1LUa5VrAqAHfi+7A3kM6fN?=
 =?us-ascii?Q?Jsk1B9wcVmmyLRALiq6cyoePMNpFlJ7uxRJ51bFDut8RNKuzcb+ZWFf2UYBJ?=
 =?us-ascii?Q?wUCnTapWBjq4mP+cmmgZqCDsQs3mZVWYPYXjMPTeBFSDOiZj3w=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8562.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(1800799024)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?gTf+TlI2UpK+2IwFmmtolcdBsqvPpgf1o3aR+6kIXEao3A+amlV4mwNLdv6z?=
 =?us-ascii?Q?nvN6GYjuhq+LbAL6FOXtOVKY1xATp6I+i/oEsEMwQPqBkTRxR2dAwwhx8EtG?=
 =?us-ascii?Q?zRPW/bqkHaIkb1JfkqjEdeo4QPCq7NGbLb8Olyl37MWAWI9BgKQCf4R15M71?=
 =?us-ascii?Q?G0yDK6Xf8SV5BI5X42CcQBhMvtDdh+tsUNhATHvx07mPwHXkZHid6kqG01yY?=
 =?us-ascii?Q?BXtuqXAR/DvFO9i/+6vttq/fNulU3I7AOp9qdO4oe+S1Q7akXfjx/6E6l5x2?=
 =?us-ascii?Q?MH35PBmiarrM8/w012QURvsehXDVHj5N6Savuqj6XpGT3tUW9vaRgJD9Y7T3?=
 =?us-ascii?Q?to61qfvkq1FWpIYOmR2dfEEAHhnm3LUZowO5hURm/oi21fwNs5mxk6LDHI9S?=
 =?us-ascii?Q?PG2daIkE4hGHNsJnXrafn20MQORMSlSQVzwxfZCk7Bu8H8n0+ax28Hen0jrG?=
 =?us-ascii?Q?6Tev61BkknfPqJUQMp5IRt1c1KK0JmosaM8ygftSM4f/JNKgxLdJ2WqfoENe?=
 =?us-ascii?Q?oY+Fey9Gjt5mx7Sv9WMiCJyJk1zoPGYj0aMrjTgDnWLz3dpuY+02LxGLWZGx?=
 =?us-ascii?Q?xy/6NbAGf0R/HXMzn3//WYtoxa00OHn6J8fHnSX8g7MnNCHssrX0o2vqRtkQ?=
 =?us-ascii?Q?3S0bO/1CDj0/s/YaBuJrUND6Jv56wR5nN+oNWRH8Vw8kRs+ABEixK5K7pRO9?=
 =?us-ascii?Q?Db8qByP+6q1LAUPqSR9P5QP3XLgwArlgO5xRLV2uNWR5WRydtqLPpMFuYXM7?=
 =?us-ascii?Q?1Uo6BoAfKs9nJdy+NxgCRrE4x2akC6e72KLI9auzqIP7pP9fuwk+PCsZA2J+?=
 =?us-ascii?Q?3zqaTmIAEPoTzVWDXOMuXgbU5UFF7i17gc1QUcYX0vY/GjY6p6BkGWC3OE8+?=
 =?us-ascii?Q?iF0H5nResR6hEl7ORRUM1+7McGzRtmue26Iy67oan/cYhUJVsCGBiGz6Zaet?=
 =?us-ascii?Q?IE5+f02VoL0w/MJEdSt5jYgpwZ95tCVntzqqa1A0UGZJ6XpduknJjOaqiS/q?=
 =?us-ascii?Q?IsCdyeCAAtZLZozjkUo5AjC5FrcfIewAzC2V2mEZu198kdFDfexX+4FWk6S3?=
 =?us-ascii?Q?qe4LF9B9Ika6tRigGllSpu/yBKntNk0Tq5TtLmsXdNnqNgX8guKB3yFVcO0M?=
 =?us-ascii?Q?Vozi8o04gZtxdi2f3qeQ5NxuYV2cN+SUQnhbSnHey6spOsMI4GTx6n461KlQ?=
 =?us-ascii?Q?2FjNNrz3rFMOy03uMwWvgdZSw3+ZHbRg7aV6EUOxks+KLeEDnuIUY3+8w+cf?=
 =?us-ascii?Q?tGAiEdHpZRfWVXlUIiux7Q8hnptqLo33DnLSPGPYc8yW6FlYlBJ87le9ypda?=
 =?us-ascii?Q?jPRivFJCe3ndXdSx3Dg4mc8PHQcohRyW65EvwhfF6fOPzrBD2ZVtyg0a+GF3?=
 =?us-ascii?Q?C8iPAL855SF8CrTkiIUFYAVBOavpA0UMoRMC2u34K9Sq/qbWPhJoalJVip++?=
 =?us-ascii?Q?OqQbsFYwc4VTwMtcoS3jeWUPFspslGpMbyF2YvQkdM8Uo8QkydJyTwU6btdS?=
 =?us-ascii?Q?irORiSm2/oBJ7ZMhpSDdKIGwwQPNVe5WlKop452/EWNVuYcw9P+FZgWUxLeI?=
 =?us-ascii?Q?WiUJNPtHo40K8w9dSwwBNdci9zZC75wJZY5ESw0a4Xi+DBMfsvss9Ba+gBNO?=
 =?us-ascii?Q?hg=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4df9aa34-8756-4b4e-a595-08dd344898dd
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8562.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2025 03:07:36.5338
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WPNxyKh0mh0goR4rF5eL92mdgCHg8DsCkG/BXUCHP0bzG372bzzuphxOIUYR6KuLVs7I4i657iYDP1h7WIWaKbR/YHM/UClm0+sAz6V+ywo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7311
X-Authority-Analysis: v=2.4 cv=Mtmo63ae c=1 sm=1 tr=0 ts=6785d4fc cx=c_pps a=ybfeQeV9t1qutTZukg5VSg==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=VdSt8ZQiCzkA:10 a=bRTqI5nwn0kA:10 a=NEAV23lmAAAA:8
 a=t7CeM3EgAAAA:8 a=UeBFM8ahQKyzkizZ_EwA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: fSmJEmaQXnK_ENjwgN05QWulG7LSWCg6
X-Proofpoint-GUID: fSmJEmaQXnK_ENjwgN05QWulG7LSWCg6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-13_10,2025-01-13_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 mlxscore=0
 phishscore=0 clxscore=1015 mlxlogscore=999 impostorscore=0
 priorityscore=1501 adultscore=0 lowpriorityscore=0 malwarescore=0
 bulkscore=0 spamscore=0 classifier=spam authscore=0 adjust=0 reason=mlx
 scancount=1 engine=8.21.0-2411120000 definitions=main-2501140024
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 Jan 2025 03:07:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114844

From: Zhang Peng <peng.zhang1.cn@windriver.com>

When building the `lapack` package, the following QA error occurs:
"File /usr/lib64/libblas.so.3.12.0 in package lapack contains reference to TMPDIR [buildpaths]"

The issue arises because the `xerbla.o` object file embeds the absolute host path of `xerbla.f`.
This occurs during compilation, where the build command in `build.make` (generated by CMake) specifies:
`gfortran -c <absolute path>/xerbla.f -o`.

As a result, the absolute path is included in `xerbla.o`. Unfortunately,  `gfortran` does not support
flags like `-fdebug-prefix-map` or `-ffile-prefix-map` to remove such paths.

To resolve this, the fix involves replacing the absolute path of `xerbla.f` in the generated
`build.make` file with a relative path before the compilation step. This ensures that the
resulting `xerbla.o` does not contain any references to TMPDIR, passing the `do_package_qa` check.

For ptest code, the solution is to replace `${WORKDIR}` with `../../..` in the generated `build.make`
files located in the TESTING directory.

Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
---
 .../recipes-devtools/lapack/lapack_3.12.0.bb  | 31 +++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/meta-oe/recipes-devtools/lapack/lapack_3.12.0.bb b/meta-oe/recipes-devtools/lapack/lapack_3.12.0.bb
index fef9d3a80..4357515b7 100644
--- a/meta-oe/recipes-devtools/lapack/lapack_3.12.0.bb
+++ b/meta-oe/recipes-devtools/lapack/lapack_3.12.0.bb
@@ -33,6 +33,37 @@ OECMAKE_GENERATOR = "Unix Makefiles"
 inherit cmake pkgconfig ptest
 EXCLUDE_FROM_WORLD = "1"
 
+# The `xerbla.o` file contains an absolute path in `xerbla.f.o`, but the options
+# `-fdebug-prefix-map` and `-ffile-prefix-map` cannot be used because gfortran does not support them.
+# To address this issue, we manually replace the absolute path with a relative path
+# in the generated `build.make` file.
+#
+# An issue has been reported: https://github.com/Reference-LAPACK/lapack/issues/1087,
+# requesting a fix in the source code.
+#
+# This workaround resolves the TMPDIR [buildpaths] issue by converting the absolute path
+# of `xerbla.f` to a relative path. The steps are as follows:
+#
+# 1. Locate all `build.make` files after the `do_configure` step is completed.
+# 2. Compute the relative path for `xerbla.f` based on the current build directory.
+# 3. Replace the absolute path with the calculated relative path in the `build.make` files
+#
+# Additionally, when ptests are enabled, apply a simpler workaround for ptest code:
+# - Replace occurrences of `${WORKDIR}` in all `build.make` files under the TESTING directory, excluding
+#   the MATGEN subdirectory, with a relative path prefix of `"../../.."`.
+do_configure:append(){
+    for file in `find ${B} -name build.make`; do
+        sed -i -e "s#\(.*-c \).*\(/xerbla\.f \)#\1$(grep '\-c .*xerbla\.f' $file | awk -F'cd ' '{print $2}'| \
+            awk '{src=$1; sub(/.*-c /, ""); sub(/xerbla\.f.*/, ""); obj=$0; print src, obj}' | \
+            while read src obj; do echo "$(realpath --relative-to="$src" "$obj")"; done)\2#g" $file
+    done
+    if (${@bb.utils.contains('PTEST_ENABLED', '1', 'true', 'false', d)});then
+        for file in `find . -name build.make -path '*TESTING*' -not -path '*MATGEN*'`; do
+            sed -i -e "s#\(.*-c \)\(${WORKDIR}\)\(.*.[f|F] \)#\1../../..\3#g" $file
+        done
+    fi
+}
+
 do_install_ptest () {
     rsync -a ${B}/TESTING ${D}${PTEST_PATH} \
           --exclude CMakeFiles \
-- 
2.34.1


