Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AFB8C3601E
	for <webhook@archiver.kernel.org>; Thu, 10 Apr 2025 05:58:48 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.27955.1744264718350908331
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 09 Apr 2025 22:58:38 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=61957cd107=qi.chen@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53A5K2MQ003880
	for <openembedded-devel@lists.openembedded.org>; Wed, 9 Apr 2025 22:58:38 -0700
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2040.outbound.protection.outlook.com [104.47.58.40])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45u41m603u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 09 Apr 2025 22:58:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VJFaJ8kixBwQ9+xFuFkUNULdSMEi58kRKg/s0fgjWZKXB8ZHywxnkGiUUA556ZUGdX8SyGA75EucyPhRgvcDNShcoN+x9o1LwP/KuVmCz5/9aGlsQJ97mqgrf6V2W6HeL61a/3Ullg0R+7CNsDe7fWz6mWNgI4l9GL0IvuG/SuUhvWiPTZacN90XqoGzs1J1dFjbjZNbFWXthUPW5uMdJm0nitxcYGWYU7xaDj6CGESpJYJuAGqXdTAIfkd/GpzCprp3ogIWhIHLGTrKGrdBVvc2A8jEVJVdp6eiBOqfje5AgTgXcZUc3P2TOagYxfZyfXQ4g3nDEZHJ+chlK9CiNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NpjPSkQzqU3hBfdV18lcFKHgaK5KS+5R5q2Mog5CZEk=;
 b=ILAh/6mMRZFjQwMU/yd3cWc9zHwfD4go6sWmgg0T2ch7jQhlVdNH3E0LpoSfQMrv7cOTU3gLiP/V1n54p9UmueVJW1bFgn76/J4SsmMl2mvNfvhRx4hXmiXuwxz9BpW0yXXtP1gurzicEPSTy8ZXBD1DL5aUU28sHMj7iwVZrW8wdHAT4u8hZIp/PYuY1RZdUESqhjs+W6RbFcZpiUIPkqgtMa2OoxnvcUthlIebMiZ5TF7XpHLsWhLLL/gh2GYnURUZ0rZvSHkiKHN05tV6OLZQsKTpbv4Ld201mxVia2GpTSlUr7ZnmHYuyfpsIomlk7tHxG4B3F/47BLpN2pRmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by CH3PR11MB7868.namprd11.prod.outlook.com (2603:10b6:610:12e::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.23; Thu, 10 Apr
 2025 05:58:34 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093%4]) with mapi id 15.20.8606.029; Thu, 10 Apr 2025
 05:58:34 +0000
From: Qi.Chen@windriver.com
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-oe][walnascar][PATCH] check-version-mismatch.bbclass: use contents from qemu.bbclass directly
Date: Wed,  9 Apr 2025 22:58:28 -0700
Message-ID: <20250410055828.714881-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0174.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::29) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|CH3PR11MB7868:EE_
X-MS-Office365-Filtering-Correlation-Id: b3d56cf2-65a7-4cea-12e3-08dd77f4ba65
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?QswGwcPVYApB9uYow6cgpSiHOH5LH6pbQTJ80T8wP44zt4ZU4iP55Ln4N9S0?=
 =?us-ascii?Q?c+lzqB2GMilNk8CN8anVYboM58vEizQlkQmxjmoT1mpjnRPcm/raEhtzOPKA?=
 =?us-ascii?Q?c9XBZtEIanq1RHEOv/5ZdpTN28z4HmSJlBW3+qfNeASUL4q3NvSSkUIkH4Sq?=
 =?us-ascii?Q?sgFHUOzO6a7c63WJeGv2Lyu6uZg1/BWxNeNRgQXBy7QGnAEcoLMsi7i/px4B?=
 =?us-ascii?Q?vHBtCzMh5ms6u3SOSsWOcb/bAUFXl8lS/sKgStNIKII8wNvY1IfJ49bf+cWA?=
 =?us-ascii?Q?6cISZZhXH5lmJHpk4sU4Edb0sJpT/nO7uJ1OrBskjIn/IC1QPIqP0QVcYxID?=
 =?us-ascii?Q?I82zp7Jtw7C3G9myN2+xtQnlQWj7gZvAT1+HHGvlV2fEvPqjENL2GSoFvVs/?=
 =?us-ascii?Q?Raol8MfEGNI8HgX/3YszUca77Tdl+RmA/TEM0W4bAes/0jAvbd3RtiJht0e1?=
 =?us-ascii?Q?j20+0oTaLTgwEgVi0x0/q1qiECUPttpnVevxukQkX/62vtfN3osELD40riEr?=
 =?us-ascii?Q?QrgZ0pAx6PzsKFWYY0Ygpc4mO2DH8Ylw+69xnRrKrd2NMgz2k3QGTQyhOf3H?=
 =?us-ascii?Q?dDmiQ897iVCzaNKt0n/TvpPJczPrRfVA9Z5EUDxh9KE8y4qm3U+Lu0RI0btO?=
 =?us-ascii?Q?XYkqNbJn97tN9qptUtSgJadIrD8BMz0IvwPY3ncyteOgePuK91ODQpP+1XFw?=
 =?us-ascii?Q?Md+bKaPkS0ofJaFqMh2Jn3GoNHc1rkRJDjv6jtPBqXsfWQk7/VD88yP4ieBy?=
 =?us-ascii?Q?jH24HSn4Y3q5l4A/7sxlutSOCfFfSoRoEL/uHWxKYVnAiQuLywQZPd+nNIvS?=
 =?us-ascii?Q?++jsqOJ3gnXmSb/P0EEo7gJUEZdc9/0jcTEVJwegQQyq+sgmJX6hjZX59Clb?=
 =?us-ascii?Q?ZkHmK/b88F7XPhxIkczOxI7a5ADHGxgBxIpIzzTa/uVpCMnkw5vfqGZCXI8v?=
 =?us-ascii?Q?8jWnQHLzfsQ9IevSR77Gdyv7Kgms2DeLASDPcrQGv8RgVFkF/HFOM9nebSs3?=
 =?us-ascii?Q?EOzmqJGXLJFxbIDxFca6WcgrZ3OzX7oHhsgqgHmXGcbu8oWgwOCp9hvWhS7r?=
 =?us-ascii?Q?AwjWT0V/UWNSoIDY4zJ2mwEy8Sc0ARv9H8spapqF5W3RWg3oWZPUTtEpqz8L?=
 =?us-ascii?Q?KrxqciWPF8zkegmm4QhS1EGBVdbVU1xVmyXgH2fu6oOi5ArlWB2XhAssFwmz?=
 =?us-ascii?Q?PZFc4Le7+xuEnNlq9op8GKB0fn6JSc6Ug+9SNt6UO1mdOSI4TRIHRFQlD5oo?=
 =?us-ascii?Q?eW8U0NHP/j2W6laMA79ePAxi/JmYP4K+HW/DBEXjEc1ABm0vulSYRBTyHcxr?=
 =?us-ascii?Q?Bq8oCZy8EItaQBJBDZNCSEfdWaEpqznUAteU0Jz4V8p3QN+Hy7TCJUMLzI7Z?=
 =?us-ascii?Q?gEPR4PEhnVXfjB7Oxum/JBBonq9l7MvW8BhSwaWEaCcKBqS8QvJqDW8Z9mHA?=
 =?us-ascii?Q?rNWDjOibhOKy+RmqkVZXxcym/xxqLDrTh+0nRBrGCwu4cMSY5Suc0g=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?VcymFf8mYns14wKFK9L6259Xu4Oglo+8kIjbqs/8DuQlPe6UW5FNdjO33Vqi?=
 =?us-ascii?Q?7oTcXn9IiBDoJDYVPKeQfYuF2v3AQk+JdFjLhHhmCtVewY6U/eq7I0FDpKVg?=
 =?us-ascii?Q?qGrfBhYv1wFduk8tME+0GlZAXr3a/s0PLcYrY3Rtzsx4Kxh4zWcKg7kn2MJ4?=
 =?us-ascii?Q?pICODQCTpCYf+ARylEOH4qPNqYPIss3vxrc77m1M0AeKQXPNm5dzvyi1dwD6?=
 =?us-ascii?Q?lLBj0+SQUfm2VhbKnkP+UGy0r9IoRRiijTi2/Ikr4Y0J8GkhnGa4/Y4gHeQX?=
 =?us-ascii?Q?Js/TIDsQFT/RnViFlF49dy3IhatGNE+S0ai8uWv/lsHgEHAjX19oKyZTsCCs?=
 =?us-ascii?Q?tBcgcYDkq1EIH2VXxuTGQX0ozSsULNnsR1edDxXoyxseo9SX013HGygS1TrY?=
 =?us-ascii?Q?zy2urSbCmIrX9Rr9X6D3BCwRaPd8vH9dxCYzQPQvjb8b/hMz2x/AzVuBF9Js?=
 =?us-ascii?Q?C6ryNGdoohvaPVQETMja5V7Ktk0WaqizloVfnPX8zJGzLmS4SOUQlfahbhJ6?=
 =?us-ascii?Q?k2gpNcS5MBpRQGCmuMismeUrsJAJ8tGCsM4RjCYPHHdp0uibGx6OILW71oMP?=
 =?us-ascii?Q?HOUSP5TqrXuwH5++R64DTjVp55SnURB7UhUMFzbPx67WfgzwW8+0/Py+a0v5?=
 =?us-ascii?Q?lp7WmEvmUOleAtGaDEq8rxGzX9BTxYa6FPI+PwhwlQWtlIrbrLz+N4nfduZ+?=
 =?us-ascii?Q?A4fSu7IE26hsPCRTCxlGw7McY2COdCFdSxzz5KZnvqwoBrkBn1Sb6y03twEj?=
 =?us-ascii?Q?Afya/ZKnETMBnfXKGzzVK3wH2iW3Jzld6vvvJ9CIILY5CMDF/5qsFjwlcRX3?=
 =?us-ascii?Q?fiMmITW9/qBV5vkqnCFa9bavEYCGbmjkp9/qaluWwGhR8H2Jafo1cFzz4SPp?=
 =?us-ascii?Q?l/AUxauNJAKQ5i92Gd+Ey1DYjHTaHtI12WvFc+jtciN+p6YUa3wP+0mSOQRm?=
 =?us-ascii?Q?OyVgm0ngUvSzpf6gdJzfAk98lVlhzCZNFMCsgfqauem4VgWWfs+TE+BRy6b1?=
 =?us-ascii?Q?k2vWnqkATGtwnxuzsp63nJhhFTdTIWeGbtyc7epTWDHmLSJ7UvsaXuee5yRs?=
 =?us-ascii?Q?iH9edhxONDKAdw4MfyylmPOKbn3eJrzFVhPwckOxm17OKAFoB4kgEuFwufxR?=
 =?us-ascii?Q?ydpBhRaN7mguUUiCeKo4eUy4kJfP55iaaH62OVLjMvAF5YK3FFYEccGSasK0?=
 =?us-ascii?Q?mSEtQotuhi85hY9CsqgbO5sJW7RorZaF1i2dKeIVWsjHW+4ktZ8qsqXFYd+O?=
 =?us-ascii?Q?JNw7AWe0H+E5xgaZZEcjgq7ZIbZ1fKlRJKnWIcGAGocgoT1T5nw5b6Jjfj4q?=
 =?us-ascii?Q?lwR4NKs+velTON3tEDn18uxcuhhoeEXILP+TkOf4afQdbWLN2fqHzvuYC/l/?=
 =?us-ascii?Q?VlSgRo9TOlbIi1Jo9SQpddX5J0NNZLb5eZAmgjsniDGs5sgrXYcplhqESvxH?=
 =?us-ascii?Q?XSw0uYTw+grD7qXSkPGUYkdIv6PyOlj1ffO174SSKfC82kPN78X74/Dki6+I?=
 =?us-ascii?Q?C9m0vMUDgMpC7i8jtu3ipXEMJu6qS55ReAep6K6hsSjEG61KbY17eeL+oMej?=
 =?us-ascii?Q?m8+mGyiQ+Gi8fcFWc1miETRNyfsYs5bmgWzIGHLD1YSg5ouDrLjCyyPOa6Ir?=
 =?us-ascii?Q?1Q=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b3d56cf2-65a7-4cea-12e3-08dd77f4ba65
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2025 05:58:34.0272
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9/cEzVYoiuRRNPZl0YC1ynobfguDNjS6266jzIiP9Ew92usn87EKttmHFalQFOaCn12Y3br7ZkMIuRZHBapKqA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7868
X-Proofpoint-GUID: vXz5NUgxA2jFfApdY7mF3ADuV3-d9UuW
X-Proofpoint-ORIG-GUID: vXz5NUgxA2jFfApdY7mF3ADuV3-d9UuW
X-Authority-Analysis: v=2.4 cv=QOZoRhLL c=1 sm=1 tr=0 ts=67f75e0d cx=c_pps a=G+3U1htxrnhIFlrbIuZW0A==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=XR8D0OoHHMoA:10
 a=t7CeM3EgAAAA:8 a=UFPMlIoCnxD1ginCLscA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Sensitive_Customer_Information: Yes
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-09_06,2025-04-08_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 mlxlogscore=825 bulkscore=0 phishscore=0 impostorscore=0
 priorityscore=1501 clxscore=1015 lowpriorityscore=0 spamscore=0 mlxscore=0
 malwarescore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2502280000
 definitions=main-2504100043
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 10 Apr 2025 05:58:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116759

From: Chen Qi <Qi.Chen@windriver.com>

This check-version-mismatch.bbclass uses function from qemu.bbclass.
As qemu.bbclass is under a refactoring for master branch and such
refactoring is not likely to be backported to walnascar branch. We
need to copy the needed contents from qemu.bbclass here. The contents
are put in the beginning of this bbclass so that any future fix for
master branch can be easily backported to walnascar branch without
conflicts.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../classes/check-version-mismatch.bbclass    | 35 ++++++++++++++++++-
 1 file changed, 34 insertions(+), 1 deletion(-)

diff --git a/meta-oe/classes/check-version-mismatch.bbclass b/meta-oe/classes/check-version-mismatch.bbclass
index 7b46151b03..b80ecdfbc4 100644
--- a/meta-oe/classes/check-version-mismatch.bbclass
+++ b/meta-oe/classes/check-version-mismatch.bbclass
@@ -1,4 +1,37 @@
-inherit qemu
+### qemu.bbclass contents ###
+def qemu_target_binary(data):
+    package_arch = data.getVar("PACKAGE_ARCH")
+    qemu_target_binary = (data.getVar("QEMU_TARGET_BINARY_%s" % package_arch) or "")
+    if qemu_target_binary:
+        return qemu_target_binary
+
+    target_arch = data.getVar("TARGET_ARCH")
+    if target_arch in ("i486", "i586", "i686"):
+        target_arch = "i386"
+    elif target_arch == "powerpc":
+        target_arch = "ppc"
+    elif target_arch == "powerpc64":
+        target_arch = "ppc64"
+    elif target_arch == "powerpc64le":
+        target_arch = "ppc64le"
+
+    return "qemu-" + target_arch
+
+def qemu_wrapper_cmdline(data, rootfs_path, library_paths):
+    import string
+
+    qemu_binary = qemu_target_binary(data)
+    if qemu_binary == "qemu-allarch":
+        qemu_binary = "qemuwrapper"
+
+    qemu_options = data.getVar("QEMU_OPTIONS") or ""
+
+    return "PSEUDO_UNLOAD=1 " + qemu_binary + " " + qemu_options + " -L " + rootfs_path\
+            + " -E LD_LIBRARY_PATH=" + ":".join(library_paths) + " "
+
+QEMU_OPTIONS = "-r ${OLDEST_KERNEL} ${@d.getVar("QEMU_EXTRAOPTIONS:tune-%s" % d.getVar('TUNE_PKGARCH')) or ""}"
+QEMU_OPTIONS[vardeps] += "QEMU_EXTRAOPTIONS:tune-${TUNE_PKGARCH}"
+### end of qemu.bbclass contents ###
 
 ENABLE_VERSION_MISMATCH_CHECK ?= "${@'1' if bb.utils.contains('MACHINE_FEATURES', 'qemu-usermode', True, False, d) else '0'}"
 DEBUG_VERSION_MISMATCH_CHECK ?= "1"
-- 
2.49.0


