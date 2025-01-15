Return-Path: <peng.zhang1.cn@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02EE2C02185
	for <webhook@archiver.kernel.org>; Wed, 15 Jan 2025 07:24:47 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.15804.1736925883934177884
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Jan 2025 23:24:44 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=3110a90dd8=peng.zhang1.cn@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50F5fnok004599
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Jan 2025 23:24:43 -0800
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2170.outbound.protection.outlook.com [104.47.55.170])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 443s1pkjj0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Jan 2025 23:24:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GOwPStC+Y8/F16ZYH9p6Eul0N2P59UP0+FKGXWR4zbZdjyE8PIa21pyQJpeXcLlOdl+nSN44TCDBP+WLN4s7aBeRjMUqF6Pw0T4OVo0Uing9uJF+OzQnwrfMLyiioZsNcYEln6/KW39x68LoEX2sCYIXPdxll0FkH565h894+rW8v1jM6VLKNKzL2voUS1E59cisB0Mv70Bu+HicqsjOtp5m1SvZzrk2lpF9MVltPxHorRzq/jaoR35KapirC4W4BSXZGfdXzoJ3c3Q8EPa5OeOFpvGT5Ut/VFTW3E7i5ZTfOgaxsvitKkjzwncF1C7B4in4WciX11tOo9APoe+4MA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d5tqbWnYIZjGADl/d6SxtxRLZihpqGDHBYi05w0gcHc=;
 b=v6eXJUEVQXDOrODt7xmUZqABv6R6bLb11FHqCr4U5wX62C1sHEAGkjy/yBbQYHqcPxy5BFMf0hPubyozlFJTvivRkuuyZQfyNgP1A239Zh1do8x1hpzgV3JnjWCwFS6aVeMb4YENpfpFV7ccjf8RnYCcaxonX6bQalqV/0GyX0BVIhtQHXs9R5/P03iz5MsIhhtZAemsK7D2jNaryK3MzdAxic0s70NBZPzkpLIL6Vp/NS5eFEIntH3bzoauFAvG+bQJoBxdDij7wRKCHmSUiR0RxZn2kGkKkDls6jqKJT1bPz2n2IUf1ampWsLpMQeRxB5xdTZaqeRFbqPec7YABg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8562.namprd11.prod.outlook.com (2603:10b6:610:1b8::13)
 by SA3PR11MB8046.namprd11.prod.outlook.com (2603:10b6:806:2fb::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.18; Wed, 15 Jan
 2025 07:24:41 +0000
Received: from CH3PR11MB8562.namprd11.prod.outlook.com
 ([fe80::24c6:f8fc:1afe:179f]) by CH3PR11MB8562.namprd11.prod.outlook.com
 ([fe80::24c6:f8fc:1afe:179f%7]) with mapi id 15.20.8356.010; Wed, 15 Jan 2025
 07:24:39 +0000
From: peng.zhang1.cn@windriver.com
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 1/8] opensc: fix CVE-2024-1454
Date: Wed, 15 Jan 2025 15:24:21 +0800
Message-Id: <20250115072428.3667416-1-peng.zhang1.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0112.apcprd02.prod.outlook.com
 (2603:1096:4:92::28) To CH3PR11MB8562.namprd11.prod.outlook.com
 (2603:10b6:610:1b8::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8562:EE_|SA3PR11MB8046:EE_
X-MS-Office365-Filtering-Correlation-Id: 4c9982a7-45de-44d1-5725-08dd3535ac1d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|366016|1800799024|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?9lS3goGNk5OJiIllptdW+J7Icb0PygmcU/bKB4JCeRbGstUVMdElcpmkeJWF?=
 =?us-ascii?Q?shsRywVtt/3vw1z+/9ILRFjlJTZaJvUocCM0iYIs+D6f3gOGmMl7hLHOXbSV?=
 =?us-ascii?Q?xweBDXy84aQ0XXagi7byExcWu6r680BfYgzq/Se2+Q9yVrUghJ0BeLgYlLyn?=
 =?us-ascii?Q?pX/VnX88yyoFvk5LTcI0gcz22Slp/LOhtU1GXeG9COUgJ9H/CPc5T4R+EjOo?=
 =?us-ascii?Q?hRQ8W4Oq4gItVv8WLIeE08z0DCFdOMUVPnNzMTaVAPFpHUbaCGprLPTyeZqQ?=
 =?us-ascii?Q?5MCiVorECZwm94kG8QHQJjiqCq3v3ZcaiahwPkG1mQFdBmw+ZfXmZJstSF4F?=
 =?us-ascii?Q?YF9oXNppqHWZ5ZNVNRMFO6Asey8Jve9DA8SQizDjsAZX/3966HaNAB0sD2LX?=
 =?us-ascii?Q?tnySpZhcm86RWLDKfmtLXYkwg1jQ/M2MM0sm8ouBIWDe0iLGuXZ2mSibjcPC?=
 =?us-ascii?Q?AuU4D/iS+ys9DUnZ6m0GzQOjW+dWu9N+n/HyWjL42WF8m+sbK553hl19c+FS?=
 =?us-ascii?Q?WoAhAyS9x/Q4ExXWmoxv9E41hNcmYXw6Dm5JHRml2YgggTciTJazsbVDsE0w?=
 =?us-ascii?Q?vldK8/I025ncsTKyS6PWu/A/beZOS5G4PNKB6C681ZVA/csdf9ey7lrKPgMJ?=
 =?us-ascii?Q?HAAESdEFWnIKyLGyNot2tofVKJerW7Zu2KpVw2HKD46wIyTt2mo1ZL+GBAhm?=
 =?us-ascii?Q?aq3g9QnmvnNYalCq7QKqwBxjIAQU310AZPVaKXloXemeTjbEikE6gv5N94aN?=
 =?us-ascii?Q?XGDULqvSoz6ddxHP9K4X/1ScCfSAxf2Z4OidK7SIVGZYA2Yj6+md2EOZrLzH?=
 =?us-ascii?Q?fTiM1miNcuj2Yr1ZFIZyAXWcPAYtEjhTy7BoeHrQMKTKKhqdM+Ro/GJxJFbO?=
 =?us-ascii?Q?4JDXHKcf/WxbYY7naADojo8XWnwhsZxBIiwLkU2iQg9PbWyzHDMzJYgTt53D?=
 =?us-ascii?Q?HS/sJWigyLUFEVG6ztRMMx7qXyAGI6DsSO9I2LMC0wbSzZvpoTJp8AUtjz1T?=
 =?us-ascii?Q?gAggE/BoRNYYD2+Vy+AhJBqyxY3N8Y38ZTBmL5Dnt7kT4s2GZ5roKhBcyR5B?=
 =?us-ascii?Q?JTNPu10PVDnkfMZMTXktlLhPpdL5mP2WRXtC7bV2kXPtB6HwDfuuHDfMKj/H?=
 =?us-ascii?Q?7LvvKNl8N2OztBEAYuhjaFMiT/N3uY8m/UZHvmxfFX6rjZZG7z63VhaSkrzm?=
 =?us-ascii?Q?B0vl82c9lkbnsfLkzYfyBcE6ksrcDl2PAYf+/TWw/FImVvZYjIukdrBRuydp?=
 =?us-ascii?Q?bgQBEEFbpr+bHfuMV9RzqV7XK6RCAI+urA0dJ5+laBleXa+0F9KhlVU5Evhi?=
 =?us-ascii?Q?+qqXo9uJTKHf/5z4zBwz0cAWjo4mDFcv08M4ION0OMwDSDw6+P2z0c5mTBgt?=
 =?us-ascii?Q?67EIm6xhcwrtRZT9rleQlof9GUbyLKFGjhSu4AAFXhcpaZ7l3Q=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8562.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(366016)(1800799024)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Y3FLKnaDFOBZDMFemObuuvXclpWtyuvJ+EWp9YPk30hidoHVkY7UsibRGHkH?=
 =?us-ascii?Q?t3Q+dF8srxY/YH4GNG2cSOmVUHtgjtmJ2SAZcO+H4FQ9b5dRxMDLL5X4LIjO?=
 =?us-ascii?Q?zHak8K4rVXRt/iMt5sF6cax05jsBBVJ1ObvTbnLbbPsSK7P68z/h358CNUg7?=
 =?us-ascii?Q?J27fnSFJw/M94Sbz7gzaVscOl1bfMytiSwYtEGqQQ5p2u7QuKrwO7x3Z059z?=
 =?us-ascii?Q?PfWVMtHnw3UGsrqvL32M2JcMP6hpEQy0qQi5SLY5+qjoVy9BwHuPZzqnblA4?=
 =?us-ascii?Q?QusJgWk1S/9hg4r/hve+bnQtgYIYiq/chs4Hid3OiniiuAz/0nFNs+vFWTxC?=
 =?us-ascii?Q?DY1z2NWzwy77BbVXt+elokBdtAlCU9yWdq1i+9KQK5zpMm6cFGmyUth9ifgX?=
 =?us-ascii?Q?EbZlnFp772QWb1gsQUd1cV7Zr/ZX//Y1w+wqaSnlrvmo5SgbPeVadFyWOyE+?=
 =?us-ascii?Q?OpsdpTF8GuySAxflMavhP51VefukrbOXUMO6c6QCjCEPWrNWT9Bbuw+Puxze?=
 =?us-ascii?Q?Q7AwnhfAkBlHqvU2YjHdfmq7vWp7AUcovWdESOt1vhgoHkZf7j1seAwxD5cc?=
 =?us-ascii?Q?vzUGWRxQ+HWSIgnkf4EtQON7sZswdI/wvnlbL2bsJ7jhzOcFOTMG1esjbK2K?=
 =?us-ascii?Q?pHunv9JcUFEWJF3bJUdqWe/zcKA7MvaTPHA7pzNdgVdV8sphcbGKlzfjCjFk?=
 =?us-ascii?Q?8VzGH7JNXjF43bGWV/v7yze4ocdTYUdLdQuy1MoVwnAkJoCdJXDJWrdnzzRA?=
 =?us-ascii?Q?dhJJh06k/hqbkCogFFA+6bjq01FRfe1YTL0wlVExY9vuD+cspotRoh1tiVzf?=
 =?us-ascii?Q?LpjDWlcHnhU9eVMGcghKBUSf9FjRQwDXwRdkEzgnGAkjCWYY4qKAINCCNkTA?=
 =?us-ascii?Q?zoLh08u74XXWaKxYF+BnYMAcm07wJ34De+94CwL/i+8xxjP+ySxNoDNabPyx?=
 =?us-ascii?Q?OtJmQcR34wNeKIrC7CsVTvz2ZseHq87ThH0IFfUaEks5tJKfYiuYZoyRy61r?=
 =?us-ascii?Q?ZzlP0eEi8IYuRIiMKUyN3VV3mr+XAKUA2JZBcqqiDcXqxNKQb/cN2jA334R5?=
 =?us-ascii?Q?AubT/TfpaobXzSAqI8Ui1JGh7GISaR3CJVr06QSQNMjtD3vMr50x8kESgbvy?=
 =?us-ascii?Q?oHYZI1thgTAfH/MV1unvgEJoudYbKGDn5H++JSQlgxLTeqRu87lxyRTj8Uak?=
 =?us-ascii?Q?17Mj2+EItEmmP7H5LGeuyZbUK0F/VL8crDl9RVpu7KSlNHsrZBYhVemk7HMP?=
 =?us-ascii?Q?LA9+di8lNT/OfzGlyFrPNPCSBUF55+8uOqwmOqF7Ea2UDhlR0QdgTWvv1Ilr?=
 =?us-ascii?Q?L5gx7pvu6CFqt1jvJyoMD0C1nbZmDvwbsFBEZ8Fu5R6hKkfawicEMlEdVmWM?=
 =?us-ascii?Q?y6BFl73X1ZewF56yRf5ieONXNdkZX3TkgzRROj2XhReKzpt7VVc4ILWHHjPU?=
 =?us-ascii?Q?4E2wI0QrIVo5tjy2Vcol1GE+HDWV4D8RNMe7ldygZ2duoAzPalrRUXc0hkrr?=
 =?us-ascii?Q?HaiQAbVIwFBH1FJgIds2rpI0TkYEGj90lZypVPaMYUf4OR3yZYzO0HtDNaxl?=
 =?us-ascii?Q?5H9RfuakxWcFd/1TZT+TmxHqefCeK3H0jsPp1Q8aDjqV51o1c/fK91hoD6Vq?=
 =?us-ascii?Q?8A=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c9982a7-45de-44d1-5725-08dd3535ac1d
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8562.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2025 07:24:39.5301
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4qthHZbcrvXW1QEzLcK4TSQuydTOsx+u+Gk2Jc25klhQ5XfMp397ihQ0O+PepCuGgVd/cFvl3r8bOWYc3rN68K/DjWwayXyXeB5dta8As7g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB8046
X-Authority-Analysis: v=2.4 cv=DdLtqutW c=1 sm=1 tr=0 ts=678762bb cx=c_pps a=2bhcDDF4uZIgm5IDeBgkqw==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=VdSt8ZQiCzkA:10 a=bRTqI5nwn0kA:10 a=PYnjg3YJAAAA:8
 a=NEAV23lmAAAA:8 a=cm27Pg_UAAAA:8 a=t7CeM3EgAAAA:8 a=20KFwNOVAAAA:8 a=KNglsM-s9cJUc-KJZc4A:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: Sw5UllNmTg-MB1ACdDgvmbVvNv1JWDnX
X-Proofpoint-ORIG-GUID: Sw5UllNmTg-MB1ACdDgvmbVvNv1JWDnX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-15_02,2025-01-15_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 adultscore=0
 mlxlogscore=999 lowpriorityscore=0 mlxscore=0 priorityscore=1501
 phishscore=0 malwarescore=0 bulkscore=0 spamscore=0 clxscore=1015
 impostorscore=0 classifier=spam authscore=0 adjust=0 reason=mlx
 scancount=1 engine=8.21.0-2411120000 definitions=main-2501150054
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 15 Jan 2025 07:24:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114885

From: Zhang Peng <peng.zhang1.cn@windriver.com>

CVE-2024-1454:
The use-after-free vulnerability was found in the AuthentIC driver in OpenSC packages,
occuring in the card enrolment process using pkcs15-init when a user or administrator
enrols or modifies cards. An attacker must have physical access to the computer system
and requires a crafted USB device or smart card to present the system with specially
crafted responses to the APDUs, which are considered high complexity and low severity.
This manipulation can allow for compromised card management operations during enrolment.

Reference:
[https://nvd.nist.gov/vuln/detail/CVE-2024-1454]

Upstream patches:
[https://github.com/OpenSC/OpenSC/commit/5835f0d4f6c033bd58806d33fa546908d39825c9]

Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
---
 .../opensc/files/CVE-2024-1454.patch          | 37 +++++++++++++++++++
 .../recipes-support/opensc/opensc_0.22.0.bb   |  1 +
 2 files changed, 38 insertions(+)
 create mode 100644 meta-oe/recipes-support/opensc/files/CVE-2024-1454.patch

diff --git a/meta-oe/recipes-support/opensc/files/CVE-2024-1454.patch b/meta-oe/recipes-support/opensc/files/CVE-2024-1454.patch
new file mode 100644
index 000000000..0ef26d447
--- /dev/null
+++ b/meta-oe/recipes-support/opensc/files/CVE-2024-1454.patch
@@ -0,0 +1,37 @@
+From 5835f0d4f6c033bd58806d33fa546908d39825c9 Mon Sep 17 00:00:00 2001
+From: Jakub Jelen <jjelen@redhat.com>
+Date: Mon, 18 Dec 2023 11:09:50 +0100
+Subject: [PATCH] authentic: Avoid use after free
+
+Thanks oss-fuzz
+
+https://bugs.chromium.org/p/oss-fuzz/issues/detail?id=64898
+
+CVE: CVE-2024-1454
+Upstream-Status: Backport [https://github.com/OpenSC/OpenSC/commit/5835f0d4f6c033bd58806d33fa546908d39825c9]
+
+The original patch is adjusted to fit for the current version.
+
+Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
+---
+ src/pkcs15init/pkcs15-authentic.c | 5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/src/pkcs15init/pkcs15-authentic.c b/src/pkcs15init/pkcs15-authentic.c
+index c6894dd37..adedd0a04 100644
+--- a/src/pkcs15init/pkcs15-authentic.c
++++ b/src/pkcs15init/pkcs15-authentic.c
+@@ -858,7 +858,10 @@ authentic_emu_update_tokeninfo(struct sc_profile *profile, struct sc_pkcs15_card
+         rv = sc_select_file(p15card->card, &path, &file);
+         if (!rv)   {
+ 		rv = sc_get_challenge(p15card->card, buffer, sizeof(buffer));
+-		LOG_TEST_RET(ctx, rv, "Get challenge error");
++		if (rv < 0) {
++			sc_file_free(file);
++			LOG_TEST_RET(ctx, rv, "Get challenge error");
++		}
+ 
+ 		len = file->size > sizeof(buffer) ? sizeof(buffer) : file->size;
+ 	        rv = sc_update_binary(p15card->card, 0, buffer, len, 0);
+--
+2.34.1
\ No newline at end of file
diff --git a/meta-oe/recipes-support/opensc/opensc_0.22.0.bb b/meta-oe/recipes-support/opensc/opensc_0.22.0.bb
index 7915d8913..834b83d68 100644
--- a/meta-oe/recipes-support/opensc/opensc_0.22.0.bb
+++ b/meta-oe/recipes-support/opensc/opensc_0.22.0.bb
@@ -23,6 +23,7 @@ SRC_URI = "git://github.com/OpenSC/OpenSC;branch=master;protocol=https \
            file://CVE-2023-40661-5.patch \
            file://CVE-2023-40661-6.patch \
            file://CVE-2023-40661-7.patch \
+           file://CVE-2024-1454.patch \
           "
 
 # CVE-2021-34193 is a duplicate CVE covering the 5 individual
-- 
2.34.1


