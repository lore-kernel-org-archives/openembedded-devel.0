Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E62E1CF6496
	for <webhook@archiver.kernel.org>; Sat, 28 Sep 2024 23:06:37 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.23011.1727564794189299971
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 28 Sep 2024 16:06:34 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=0001c3639c=yi.zhao@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48SN13b6019969
	for <openembedded-devel@lists.openembedded.org>; Sat, 28 Sep 2024 16:06:33 -0700
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2173.outbound.protection.outlook.com [104.47.58.173])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 41xhakgcwq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Sat, 28 Sep 2024 16:06:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=inqh7PPYJI6rEulZdz8YADSHTNO16y9lq9X9AtloKmHhF7Gili/2TXxx5LesKk8kgCacQE9/3vSvdRCP6qhMycEM0k0Kyc/WLVaHSI3e6z1Rop2RLaS6HzfF4tsI5prV/qqXRwxaD2bHoZY6E0JXhJthlr8Q00yU6mcBhp/Mvjbtj2miYmG7oxtMJNAopa+Km8d473lx51XGTdmCJ4VP9qtHSGYlHk7aJE4Jz5EKejgjAKg6QG07MA9QQBv8dJcK5vrPrUbg7GQRMPemVh+/UOqIOKaiXst9UXaezWSY23J5RsuKezCj7rTCZn3pxKt0zAEPqagyTxpVqVIQppGgvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oic0kkXDKLCp4O35unAkxJKELdKqZNyBFr79hhvVAq8=;
 b=Z/K3WnXPbPRSZwk2gRS8AwLM/40kwZYknhJXbUoG/LA7xl2icV9YV1cR/+lY1mjq3eDPZFI1LJqW6ofc9L+Jk5Jbg45K/DvZezYD+ZbLW2/OzJ0Wtsw78luNCklbhFgDEtFabEqMJhKVXO2kfcThmyzLnR9jC2l2BXD6TsHyVJGY6GCiJppFiC9ziHa8PpfwKJz7SQ+XM8Zq0jOXTnE2E+F4h2ZEN2EXEVnaqel2JL3+7yKaA23xQKVEdNA44zfQbDhKLZ3yYNcYHZNoW1dJhvCU7fdRd+fD5muBlnazVTSgYjF6ZNi09mRHcqJPodIxvdzxjYEJ6qa0sD2WsyJzPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 SN7PR11MB7512.namprd11.prod.outlook.com (2603:10b6:806:345::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8005.25; Sat, 28 Sep 2024 23:06:31 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%5]) with mapi id 15.20.8005.024; Sat, 28 Sep 2024
 23:06:31 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-filesystems][PATCH] e2tools: upgrade 0.1.0 -> 0.1.2
Date: Sun, 29 Sep 2024 07:06:16 +0800
Message-Id: <20240928230616.4036050-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0152.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:383::14) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|SN7PR11MB7512:EE_
X-MS-Office365-Filtering-Correlation-Id: f0f172fc-eb8e-4673-1410-08dce0123092
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?wFLFI7UhH9SVymlkYfzVSeRJn/4QRCBvDwY1T4OS1O5AnyJ5qVPtMbaXzb7W?=
 =?us-ascii?Q?YBK5WRE0vnw5zrDpPP7JtP/0xtEzidvv3uflDhUBDr6q3Nql8nOxvklQK1MD?=
 =?us-ascii?Q?KbzwwykL0mpc9QXt6cTBFRDpMYjlHTDf5AMj1dcK5GPkm7kOrAT9+BR8emYO?=
 =?us-ascii?Q?jVVPkQfqBK70063NoVGlJpAesQ/H3KoJT2O5rLiIVoHPuuIQwPQD/c26Us8X?=
 =?us-ascii?Q?zucDQl9v30BAGfDx+oIZcKiqd7mIKYVZ+i2h7YPReUSE+kE43UNAMFsyOSlg?=
 =?us-ascii?Q?2beqSx11WqH8s6ciYlZaY65bHuyfycJUqraxiYtLtyOukwfALOtxgVBXYcPt?=
 =?us-ascii?Q?m5HNmN2JHAvxNAroeF2cAybZi32GpFEBX42cfVjCojGJOKhSrV7nsgEbMA+p?=
 =?us-ascii?Q?aEAzaiD+hXqTsZ2mUD0MiR9t8vJajg0/DJrWqadXTJ+1N7aIoJ9KDO3lTi54?=
 =?us-ascii?Q?DWhUsVfgFLu5xI9aZIoKnaHN+TEaWQkUe857DHlHeLdIshaFXNzylUKvU6Sb?=
 =?us-ascii?Q?DPgSPF0Wj1XUKsRonOUAphzjXtVegrTTIJGchmIxaAuRkVQQ02MynZonCJjO?=
 =?us-ascii?Q?ukVcq/WNfSFd4/eVqMLj47rYJQQssij/Y26IKo9MaksejFTIe+IrruViqISD?=
 =?us-ascii?Q?OLOxrpu7MEkgT1gCpNRbWc3r8BvhiSQxiOSuBJ9JbVSVgiOux13xgObFsBU5?=
 =?us-ascii?Q?nJcxO1HdH4OSLrje8ih7ZB3n2VN/gX93/SW4Qcugk8VaHva9bXAa/VhQexVS?=
 =?us-ascii?Q?9dEdtEZyMEmBifFpfz/u9l9OuzKXNwOXI2kJ0GUDnVEwqDyVYFmHNXsG/i0c?=
 =?us-ascii?Q?BJU2FNyEVzeBmA1hfO1jWObZ6Xfzx3tkeBnk7mTaawEnvF9yWJVisrUtUa9D?=
 =?us-ascii?Q?6cCnWuCH6eZr7bTHVTUmvK0eBxMEvY6wM1eqwnXWDMl7dVlS8H1XKLmhN0xM?=
 =?us-ascii?Q?RIWKUY/ka5sZP0vKqmqAFE/N8mED5ojvrgw3k0Ew7jyGSo5YdtFb5xFIy56d?=
 =?us-ascii?Q?HwOU/RF6kPq4n3vgzJ5+S/dZzwK5zDfx+vLPWoStGEGp+hcVB2XWJ7c8eICg?=
 =?us-ascii?Q?lKsb4PNM/nq9/M/UyWlnzt2sSDyh0wIsIMQDv6V29l0aF6fMekceL16auAYF?=
 =?us-ascii?Q?Bkkrq5oVz8ChUw0v2gnBy3uVBygNQCqS7fnXPDpDVi8CCymWLP01LgATeBE5?=
 =?us-ascii?Q?jOecArPpsFGahflKY9RuYEqJYReyN+jtka83Lvnfm3fpFwAmQxuiuAekLufK?=
 =?us-ascii?Q?HpboydYj6XX0w1QkmeDtgyjR5XzvpvFgLcfvi6pHtjOB+6kfmv2rRDLNEq+w?=
 =?us-ascii?Q?RQTe6Oql88YdavLGsIH5gpvm0/Vp8Kbf56MuQCgRdRZzQQpnW3YxBvfDZnng?=
 =?us-ascii?Q?UlAGLYM=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?VW1Em477TcB5WYVtv+3NV1zEajSNOIMO7sUxw3Q/h/XBAwR2bvLiSIKcflZl?=
 =?us-ascii?Q?xhWZnsqldxXTH/lOh+Z2fdfoFfvh5BjZpjytx3Cmuz2uq88R1nWVRfodHKzy?=
 =?us-ascii?Q?gc8cShy4lLyCmyMUrlg+SqwpC6O5OouQ5OaaGbZg04iBektsseFmaVDmOjZA?=
 =?us-ascii?Q?N53dE6N/NcBcSCVsiMC5YyTFyKINDtVLis9SEpQzdrDP1J1MNLfo7mwGOmtC?=
 =?us-ascii?Q?hj6kRNRwabRprHiWfj/kT1DhIuPhiwBs1cS0LfPRwp+WfJFMqwy6wDHVsakL?=
 =?us-ascii?Q?q4kTeeA2MkyVURq/3iPp7UV7L5dhNyQUTJ9Glu7mz0sRec+jTz0qc4U6hB3E?=
 =?us-ascii?Q?jHd7lNiPiovtvwzi9xi/9f97lQLXub6xebqfaSDm9MJtuMPYQ5q+jlX1W7AB?=
 =?us-ascii?Q?t9pxXwu6ivN05ujc1TQBQi+ReEVMVLfKDLitKorGuIl10RYUmivC6bvuZkfE?=
 =?us-ascii?Q?vsfeOQOjY+jacwqJgRS382dXnWc4ZnnPAVkPstkqfwzwuEp6rQlyrnRwsDnU?=
 =?us-ascii?Q?99hrwVR0X9N4PgSSwFaqYUkIE5embIZAMTqWhZeQM28fMiooTaQiGQp3jwjo?=
 =?us-ascii?Q?fpAK/K2KofoJXRiRlZVoDtqiYZlKzgchrJ9C8vs5r1yXi2R7dnckuQ1tlntR?=
 =?us-ascii?Q?nWebekXWYTmIiBWThO9IH9UDhh37GME4fV5Q9qMGW/DSvfMwhrTip0lnzt+c?=
 =?us-ascii?Q?JLreTQW5QOa9x8E+71vNZWzU8/Shgk+k9rlQxfqAYLWY2WpUgxthWEL5Litr?=
 =?us-ascii?Q?OdDhbbhDtkjv4JGeAt3L3YwEwz3VgopRLwRd6TxyK43xTfuMVBN4MsuSmnPG?=
 =?us-ascii?Q?iw4VYQrdwxfOIKgDiRtEYgVl5jJSn4jM40i0YRyRE9ut5z5hHaEdO5rxlC86?=
 =?us-ascii?Q?solt5eBLVlwxjQuq/frfprXT7x6gdA/YqWlDrx1WwyfNuoIUxQ5eWVkV19mc?=
 =?us-ascii?Q?wy+rCKT70kDhwEQdhrEdrWU4iygm3yqFXpnELMjYnNsE7wEC5ei/6abpBisN?=
 =?us-ascii?Q?EMdh8U4TiGMd6Tsv3HBO7CUp2n/pw1hZ5v19pSvY+m50CVcKpKvjbn/aIBDO?=
 =?us-ascii?Q?GTUjWf++G4EjTjc0iGk+qh6iCXm91JEL++38SbULigtCC+qBFk7Ssd8TI5Dx?=
 =?us-ascii?Q?yIWcYPIiOcdy0Bp93Jc2dCCLGVH9rMWmyH7A6yWC0R8mnug4wBqwE5ZrwnEQ?=
 =?us-ascii?Q?JWMwP7FJjJ122u76Fg/a403iAqY+blOYoZXEMYJyLDzlEnAYNdstlypHJEPV?=
 =?us-ascii?Q?J8C3yodGHR4Lkwb5W6vZb9OOCDBNFiwuIQDsfhQFKA/GjRoM9XEMpSmDQONY?=
 =?us-ascii?Q?StecX+a5zjyG9OZToRQcagoddG5alXGB/Q+Pq5j+gp/txZ5Y8yi85TcuUzsu?=
 =?us-ascii?Q?Bjp7hJpQqVEjM48Yf+QzaFPvQagNaSjt5QMI2XKNLwjNl9OCnc6XOICCMMaF?=
 =?us-ascii?Q?/hpkFN5Pcwe9QDtjJ7q76ybnR2BAXy84VaaB0XYX76gIHsVvmyt37Q+UDVeJ?=
 =?us-ascii?Q?wnokAP7tR2NvtZFqVry2YQHLmEQAdPdPG5eo8Yd5ICnooQ4U+/lPSzHXHDKr?=
 =?us-ascii?Q?5KKE3gGvzX6KfJhbC2vZLkm74inJeLDC9IxBVzpZ?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f0f172fc-eb8e-4673-1410-08dce0123092
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2024 23:06:31.0400
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pD0mErVHtUxRNR164aRrjVUSX3Lhli+ncFLpXIgsww+WIzuezIMTpYF6SuPgBYyPXVyh/I0Kq2L0XWyeLXa10Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7512
X-Authority-Analysis: v=2.4 cv=YOLNygGx c=1 sm=1 tr=0 ts=66f88bf9 cx=c_pps a=19K1aDEwnJ0RahI1emVHDw==:117 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=EaEq8P2WXUwA:10 a=bRTqI5nwn0kA:10 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8
 a=mDV3o1hIAAAA:8 a=_1Y6M1BbgGxWZop-zTEA:9 a=-2isCLQ3ilAA:10 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: uC9V3wJqEGZtJl7n-JzA0EiVODMA2a7T
X-Proofpoint-ORIG-GUID: uC9V3wJqEGZtJl7n-JzA0EiVODMA2a7T
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-28_18,2024-09-27_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 mlxlogscore=999 clxscore=1015 suspectscore=0 priorityscore=1501
 spamscore=0 bulkscore=0 malwarescore=0 adultscore=0 phishscore=0
 impostorscore=0 mlxscore=0 classifier=spam authscore=0 adjust=0 reason=mlx
 scancount=1 engine=8.21.0-2408220000 definitions=main-2409280178
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 28 Sep 2024 23:06:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112545

ChangeLog:
https://github.com/e2tools/e2tools/releases/tag/v0.1.2

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../{e2tools_git.bb => e2tools_0.1.2.bb}      |  5 +--
 ...Disable-portability-warning-as-error.patch | 34 -------------------
 2 files changed, 1 insertion(+), 38 deletions(-)
 rename meta-filesystems/recipes-utils/e2tools/{e2tools_git.bb => e2tools_0.1.2.bb} (92%)
 delete mode 100644 meta-filesystems/recipes-utils/e2tools/files/0001-Disable-portability-warning-as-error.patch

diff --git a/meta-filesystems/recipes-utils/e2tools/e2tools_git.bb b/meta-filesystems/recipes-utils/e2tools/e2tools_0.1.2.bb
similarity index 92%
rename from meta-filesystems/recipes-utils/e2tools/e2tools_git.bb
rename to meta-filesystems/recipes-utils/e2tools/e2tools_0.1.2.bb
index 459c7058e..d7e654bab 100644
--- a/meta-filesystems/recipes-utils/e2tools/e2tools_git.bb
+++ b/meta-filesystems/recipes-utils/e2tools/e2tools_0.1.2.bb
@@ -11,15 +11,12 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 DEPENDS += "coreutils e2fsprogs"
 
-PV = "0.1.0+git"
-
 SRC_URI = " \
            git://github.com/e2tools/e2tools;protocol=https;branch=master \
-           file://0001-Disable-portability-warning-as-error.patch \
            file://run-ptest \
 "
 
-SRCREV = "fd092754a6b65c3a769f74f888668c066f09c36d"
+SRCREV = "46da6c398e70635a296245851fcedbc56c35e824"
 
 S = "${WORKDIR}/git"
 
diff --git a/meta-filesystems/recipes-utils/e2tools/files/0001-Disable-portability-warning-as-error.patch b/meta-filesystems/recipes-utils/e2tools/files/0001-Disable-portability-warning-as-error.patch
deleted file mode 100644
index dec793f37..000000000
--- a/meta-filesystems/recipes-utils/e2tools/files/0001-Disable-portability-warning-as-error.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From e0aaedea30483bf5b9bb085e12fff79144fa1174 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Thu, 29 Aug 2024 11:12:57 -0700
-Subject: [PATCH] Disable portability warning as error
-
-With latest automake 1.17 its warning about escape hash
-mark [1] and since configure.ac uses -werror to call automake
-this becomes an error and reconfigure fails.
-
-escape hash mark is non-portable as discussed here [2]
-
-Fow now let it be a warning, it should be fixed in a portable way
-
-[1] https://debbugs.gnu.org/cgi/bugreport.cgi?bug=7610
-[2] https://lists.gnu.org/archive/html/automake/2011-08/msg00023.html
-
-Upstream-Status: Submitted [https://github.com/e2tools/e2tools/pull/31]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- configure.ac | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/configure.ac b/configure.ac
-index dd32c4d..9f37591 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -14,6 +14,7 @@ AC_CONFIG_MACRO_DIR([m4])
- AM_INIT_AUTOMAKE([
- -Wall
- -Werror
-+-Wno-portability
- 1.9.6
- foreign
- subdir-objects
-- 
2.25.1


