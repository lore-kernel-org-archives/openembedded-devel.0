Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B805EC021BB
	for <webhook@archiver.kernel.org>; Mon, 24 Feb 2025 15:56:37 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.92873.1740412593269082750
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 24 Feb 2025 07:56:33 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=41502d4960=yi.zhao@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51O6uGJD006741
	for <openembedded-devel@lists.openembedded.org>; Mon, 24 Feb 2025 07:56:32 -0800
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2048.outbound.protection.outlook.com [104.47.58.48])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 44yeyqj21x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 24 Feb 2025 07:56:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IMJgbP/s9V2/0k7a8+0/Fll/OWGRbjFLPwiCtNPw6gtQDwhaEhpujNrtSm+nh9R2etfB9g/m0gElU4nd7SXZbRxWvs7lEsCmTeaRFMzgFBuiEQwGYF8RXBIW+tevU8aTytGLYepe/ZFQkthBR3jWK3CEEUtrj3i8CvVUEPj9rCcTynzC8NpZUilNCKxkpw/Ay3+TO68U4BWYoRC2sdWR0bwnlYrgWQiNqpJzzRz6LT9pNZVx36Bt9hugsSNYxHIif2f9PfvVhH0+67ZRh0k6RDsHSWPAIPel7Ctavqx8O5Zkt97XJesfbswv48gMjgOTO7RZzZ2xQFTgrv91W/YYrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n7nlSOQC3Q2vJMon+qZRe5kRAddb1vzM9rWnr16LNX8=;
 b=dPifsvvY1XUhP/tkaxltZMLLZ4RkIp8BtjFUF/k1gnEmOXxDHkeyeVLlgORNV5KIjR5BAFRRhomtS46LILaTqroObiKQ85TUzISYb2l3eqDVtwfbHrmwr7FFyUVLhj00NyhkaKumBzrRjDgBVY7ry11jRbNnf5h8FamA5L53AujF6OZ/zjP40q9pdY3hR/hAchFDo/ckbvm+p2DpPa+ajulHyC2uF3O5IHK0WtdfAZi8SEN123xJnxsibcmpf3a/ZP2akyT1Xk8ApYYxARqqncTV2HWEXELop0v9DsGGekbXVQ/5fVt3ns71+ilKHgoX8sIGrCHLt6mZ5i+B5mfCDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 LV3PR11MB8484.namprd11.prod.outlook.com (2603:10b6:408:1b4::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.19; Mon, 24 Feb
 2025 15:56:24 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%5]) with mapi id 15.20.8466.016; Mon, 24 Feb 2025
 15:56:24 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH] radvd: upgrade 2.19 -> 2.20
Date: Mon, 24 Feb 2025 23:56:07 +0800
Message-Id: <20250224155607.3641791-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP301CA0089.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:7b::11) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|LV3PR11MB8484:EE_
X-MS-Office365-Filtering-Correlation-Id: 23db69d8-9c75-4355-9dc1-08dd54ebca5a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?p5LvW7lPr5SILWghpjYQsVZJqvov/KqE418sZMN4d8Y/inKJhYTmISHX9jWa?=
 =?us-ascii?Q?z7QCHncFrfq4qXnaF2t2/XebbgZb1LyQ+ydCkNPleuZ59xf5EZd23mNWXpn+?=
 =?us-ascii?Q?95v7f6CbiiEpLiiip4LjjEWPHaRR6/ruaVfSaQ3xgvzaaT33KZW7Cxzd+4Kf?=
 =?us-ascii?Q?X+aqoeefxsifG9R/CCTSnVrWF87icQNCTNeAvBrFaL3bhEa+Ed4VTEDk9KRv?=
 =?us-ascii?Q?lzgs8jDHAomVrgLXncs305w5ImhGb7s+HKlQYG5GizxOs0h5PAu3VJg4dLR1?=
 =?us-ascii?Q?iuwy7snLRXo4jekkkkeUos4t3e4GFuysgbQnmO6bU6+NdjqIX+dTDaT5qL2V?=
 =?us-ascii?Q?t53b2iq3oT5ihS9iITTW0rZnW7Hm89ZNN3hzorvx13OHGQ9CSXtGukHzahDd?=
 =?us-ascii?Q?lTGawVm7i6MeyZ6oGyPX1f5IfeIPiBqOay8uNzOp+L/nhltz1+yvwnJTHIyf?=
 =?us-ascii?Q?GqUIcxBUE7fn709LZNvMl39L1AJ+AZro9+qhPEsF6T3BOn6i321QUQ/itGAV?=
 =?us-ascii?Q?L3JhdB/p3SoJGeVWJ24bnCoK67T2x1HYH6JfyfcWmwt6QlnUhhQapMrFIXmQ?=
 =?us-ascii?Q?hc8KCMvldSLQXazBMNAIoPbj/O+OTtwpAHvili/lFaD7svoSQM6ykpVQF2jr?=
 =?us-ascii?Q?rSxF2Q9+doKhMztOpkqixZ+/2iJ27n+v3TBRkJIArrTRLXFldGxQq8zZUDx7?=
 =?us-ascii?Q?arDzGl4seSmVZHhBPbpi4OUQqpur7wkRmi0xb7DH9nzTyQDJl9e1HBiYkb+G?=
 =?us-ascii?Q?khAVqza3HEfCiRABTOV5H/Nr4eas+OInp1qiKVRNjQQf9Nmif0ytmsVqtP6G?=
 =?us-ascii?Q?6zzeTqIEh0Jsqv0EmzkQqLU11PdJD+rnqMz5iAqK8d3Y2Yiach8VT5LGlzH+?=
 =?us-ascii?Q?WaV8m7g2gfUGMj/q2srOVbaAiuisPeoYWHHD8wdimK8PiuMsPuh1OoKTbfds?=
 =?us-ascii?Q?pNz7fDQIXoZEh80CR7qscE8cSdaT7mHsR+v8tpUYnpEnD4wn6qoKWOOYETqo?=
 =?us-ascii?Q?nZJfuMjko0ixx6nnEJ0OEYc84HQn6BZKAnORC0U+FKvXC0qZE+PLRadl55Mt?=
 =?us-ascii?Q?qTwC8K7XFaMS3VTsZpSVhdfSgjoFXJIjekAI/MDLMuDohoy5Qe6uG09Pci8U?=
 =?us-ascii?Q?S+G6WskzaZohlQpCViUMl8abPImrtO1C0/+nTjCWCjGUa7VcfA7W/H2njjLl?=
 =?us-ascii?Q?y6zYQ6BpQE6hIQWvrs6/U74cceWaYyqtpGa3zvLKv+b7Zyyjf+6X44K+EkQR?=
 =?us-ascii?Q?dJwoHRxBKgd9z1AqKklu8bx+cbysWV1qaEfahbBMOtzGfx6Agh2qyZxO1yBx?=
 =?us-ascii?Q?2n+usZUb1z9KlRDHm92+nYYivJtDuo9zKoPJCEt4bP2TXTev0kErwOotElvX?=
 =?us-ascii?Q?NQwN7LBurYF3PRz52lF7bjkqsbz2xk6GLaxmCBcgHWGv7zOtgg=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?BXJxRZ/PGJLKASGlPFF+5jyPyOTdS2lBlrrEAygGkzJi7sgbpknRD+JX0zNY?=
 =?us-ascii?Q?C4Fi/+xUAAgzdzB/dbrvmJbko0AcsBTHEj4X1y76OHkFhhflo6vkE5a2Ewfc?=
 =?us-ascii?Q?d+qVrZWqUi79+WiDGL66Sr8CKKufeKwSHTDqUXjye9731shoMnuvtgjD9VVq?=
 =?us-ascii?Q?4GFvlnP7saW4D1djSAxp4Ebv1qacP7pRTovGbG4S1DQ1yiga627yPOAW0K5P?=
 =?us-ascii?Q?/Hrqi68FDdf8PzbcJ1N5pDnUznSHveXFa5uD57NlDaw7HKRMckpEytbZcjan?=
 =?us-ascii?Q?yVtAzQQkS5cyEej0vkotZ/Y7mZNVZDnRzroHJcF0rhfUWSgtGhaAXp+pOtUG?=
 =?us-ascii?Q?WmIVHdv9uP7Az/voYWgYP9xE2u6WyyNvuEMf+A6BTcxIfA5LPWwt2TBEfG/J?=
 =?us-ascii?Q?0/A9xgURKxyXyziTMd7d76+VOrw7M8p9RW72hwYPEWf7LgnkqaR72gxPxxHO?=
 =?us-ascii?Q?+7IYCJu3M74ckkXoFZG1F1zi6XUfK1mKxGTGcOb889+vHJOKnwe5APzQr0cy?=
 =?us-ascii?Q?Ijykj6a0zYbvQAnVfb3nsFBR2GYUhXQOJwTe8RBe1D4bKwHbbVw3jyt8WZoV?=
 =?us-ascii?Q?T1XfdahtF+ogB7Xg5pkE7CgKGTaTxQx917A7D2g1a++XBrOpTys4AZE0HBmD?=
 =?us-ascii?Q?lMnzkPikm6P8MWajJY2fPonnqg+4q6NRSZJB58Ks3UGQ4rYkrpAxFIT+lakN?=
 =?us-ascii?Q?KHcsudvVy5hL89EukA2pUShutIQsPs70E+APXsPf92ulnFS0V2l+0C41+9Cq?=
 =?us-ascii?Q?t4JmSDzgw0xXHaCSkvvB2PoGdoeQqfk+D+QUDd+kpW7jAZiDIUf+FY+U0P0w?=
 =?us-ascii?Q?+zCWo91Yle2jQZ8LV5eX74bRm+Y+Rm57tGUvRHTC4qOKoguO/aEp0p6vHdRq?=
 =?us-ascii?Q?q0avoTLRr5tZXJzn+15eqQMNStbZP+/nOeAJc4+xKU2CdR8fJuMwGZvfpnky?=
 =?us-ascii?Q?9MS0+jOwQtf99OKp5UgqsLHxV4diIqMNkcWZKgK4CKBKJllajV9t5Z+i2eDW?=
 =?us-ascii?Q?/MzcLd4GitDTKD0Lm0gOKdDMHjnpFOtzZkQB2Uc+jWQyyX5HlQOV7ozwiOUv?=
 =?us-ascii?Q?gElhkCE+Njk6aQ6V0P1VbO3JwiKiw8Ztr9/fu5K4CDZNKz+FKV2zqoxvKh9r?=
 =?us-ascii?Q?40SlhImIbuCPRRb5Oxgn+ru+QlqVfGWjL3wZXaOK5f31ZsBIHePSmHsw5gFP?=
 =?us-ascii?Q?WotFdFu+JUfPGhznP3+1yLiUNC7mdXeGyEBOhQKDdhju2DZLjNZYtQ+JgE31?=
 =?us-ascii?Q?BybUkgBU690GjruzsSB+Lk5Fb2DwKBUSb2x8zBIzQS8k3FZUHtS49LHrS4wh?=
 =?us-ascii?Q?i6UoNacPISo0H0JbEreGcOWR3IbeSL5PcywtM594tvEH0exksCTJrOZDYx6k?=
 =?us-ascii?Q?IXBOy5n47i8Tp2Uw0q4yTv8bsczl+9I2nvZ4PclZyxdvAUwrmi7ckC1jyL2F?=
 =?us-ascii?Q?yX9nlPQlnOqJ0TABPhb7ZfF4gzWDfd0aX3qwqjHC0DJp1u+2lzNDh27HYMWv?=
 =?us-ascii?Q?vrjuWtKaNff+Nw4yVJh9COdSG0htuL0wIk3qoVCtiNsP1e06DkbCY4CPW/6B?=
 =?us-ascii?Q?H5075T9tWM7KRt5fdTygT8QOMHJkvwXNyvRmhU3i?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 23db69d8-9c75-4355-9dc1-08dd54ebca5a
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2025 15:56:24.7952
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pDpkzNZwtWHATbqDR9fvUSBmzmOTxMBuKAL/28Wi/uYD1TmZekH+tPT1OhKUCHBolCtVsMiXpvdtmtWOjPbWyA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8484
X-Authority-Analysis: v=2.4 cv=AbBLH2XG c=1 sm=1 tr=0 ts=67bc96b0 cx=c_pps a=IJ1r+pqWkCYy+K3OX67zYw==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=T2h4t0Lz3GQA:10 a=NEAV23lmAAAA:8 a=k8RB6--xAAAA:8
 a=t7CeM3EgAAAA:8 a=sfOm8-O8AAAA:8 a=pGLkceISAAAA:8 a=kpYzrrzdlagYgKubv6EA:9 a=Bk4fAJMWwHb4EYOhdZbW:22 a=FdTzh2GWekK77mhwV6Dw:22 a=TvTJqdcANYtsRzA46cdi:22
X-Proofpoint-ORIG-GUID: M7YTnxDKUpSeo5YD0w4tSGGeiA-5uc-1
X-Proofpoint-GUID: M7YTnxDKUpSeo5YD0w4tSGGeiA-5uc-1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-24_08,2025-02-24_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxlogscore=891
 phishscore=0 suspectscore=0 impostorscore=0 priorityscore=1501
 malwarescore=0 clxscore=1015 adultscore=0 spamscore=0 lowpriorityscore=0
 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.21.0-2502100000
 definitions=main-2502240112
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 24 Feb 2025 15:56:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115550

ChangeLog:
https://github.com/radvd-project/radvd/blob/v2.20/CHANGES

* Drop backport patch
* Add dependency libbsd
* Update rdavd.service
* Install systemd service file and sysvinit script separately through
  conditional statements.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 ...ude.h-change-in-46883f8a1a02fe42040d.patch | 32 -------------
 .../recipes-daemons/radvd/files/radvd.init    |  0
 .../recipes-daemons/radvd/files/radvd.service |  7 ++-
 .../radvd/{radvd_2.19.bb => radvd_2.20.bb}    | 48 ++++++++++---------
 4 files changed, 30 insertions(+), 57 deletions(-)
 delete mode 100644 meta-networking/recipes-daemons/radvd/files/0001-Reverts-the-include.h-change-in-46883f8a1a02fe42040d.patch
 mode change 100755 => 100644 meta-networking/recipes-daemons/radvd/files/radvd.init
 rename meta-networking/recipes-daemons/radvd/{radvd_2.19.bb => radvd_2.20.bb} (56%)

diff --git a/meta-networking/recipes-daemons/radvd/files/0001-Reverts-the-include.h-change-in-46883f8a1a02fe42040d.patch b/meta-networking/recipes-daemons/radvd/files/0001-Reverts-the-include.h-change-in-46883f8a1a02fe42040d.patch
deleted file mode 100644
index 57338d4713..0000000000
--- a/meta-networking/recipes-daemons/radvd/files/0001-Reverts-the-include.h-change-in-46883f8a1a02fe42040d.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 15f439c555289f900eb33111b010bf1266f97edb Mon Sep 17 00:00:00 2001
-From: Jonathan Davies <jpds@protonmail.com>
-Date: Thu, 25 Nov 2021 15:29:18 +0000
-Subject: [PATCH] Reverts the include.h change in
- 46883f8a1a02fe42040dd8e48aec0ed871545d4d
-
-Closes: #158
-
-Upstream-Status: Backport [https://github.com/radvd-project/radvd/commit/06689f8c06f44c7e87f7ff1d814428f88375b53f]
-Signed-off-by: Jonathan Davies <jpds@protonmail.com>
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- includes.h | 5 -----
- 1 file changed, 5 deletions(-)
-
-diff --git a/includes.h b/includes.h
-index ef30b10..c528c86 100644
---- a/includes.h
-+++ b/includes.h
-@@ -76,12 +76,7 @@
- #include <sys/sysctl.h>
- #endif
- 
--#if !defined(__GLIBC__) && defined(linux)
--#include <linux/if.h>
--#define IF_NAMESIZE IFNAMSIZ
--#else
- #include <net/if.h>
--#endif
- 
- #ifdef HAVE_NET_IF_DL_H
- #include <net/if_dl.h>
diff --git a/meta-networking/recipes-daemons/radvd/files/radvd.init b/meta-networking/recipes-daemons/radvd/files/radvd.init
old mode 100755
new mode 100644
diff --git a/meta-networking/recipes-daemons/radvd/files/radvd.service b/meta-networking/recipes-daemons/radvd/files/radvd.service
index e60798a6b3..9230543c48 100644
--- a/meta-networking/recipes-daemons/radvd/files/radvd.service
+++ b/meta-networking/recipes-daemons/radvd/files/radvd.service
@@ -4,8 +4,11 @@ After=network.target
 ConditionPathExists=@SYSCONFDIR@/radvd.conf
 
 [Service]
-EnvironmentFile=-@SYSCONFDIR@/default/radvd
-ExecStart=@SBINDIR@/radvd -n $OPTIONS
+Type=forking
+EnvironmentFile=@SYSCONFDIR@/default/radvd
+ExecStart=@SBINDIR@/radvd $OPTIONS
+PIDFile=/run/radvd.pid
+ExecReload=/bin/kill -HUP $MAINPID
 
 [Install]
 WantedBy=multi-user.target
diff --git a/meta-networking/recipes-daemons/radvd/radvd_2.19.bb b/meta-networking/recipes-daemons/radvd/radvd_2.20.bb
similarity index 56%
rename from meta-networking/recipes-daemons/radvd/radvd_2.19.bb
rename to meta-networking/recipes-daemons/radvd/radvd_2.20.bb
index a8a116cbe5..e2d606823b 100644
--- a/meta-networking/recipes-daemons/radvd/radvd_2.19.bb
+++ b/meta-networking/recipes-daemons/radvd/radvd_2.20.bb
@@ -8,7 +8,7 @@ addresses and some other parameters. They also can \
 choose a default router based on these advertisements."
 HOMEPAGE = "http://www.litech.org/radvd/"
 SECTION = "net"
-DEPENDS = "flex-native bison-native libdaemon "
+DEPENDS = "flex-native bison-native libdaemon libbsd"
 
 # License is BSD-Style (with advertising clause) but also has an additional 0th clause
 LICENSE = "radvd"
@@ -20,9 +20,8 @@ SRC_URI = "http://v6web.litech.org/radvd/dist/radvd-${PV}.tar.gz \
            file://volatiles.03_radvd \
            file://radvd.default \
            file://radvd.conf \
-           file://0001-Reverts-the-include.h-change-in-46883f8a1a02fe42040d.patch \
            "
-SRC_URI[sha256sum] = "c36470706fec3a9e6bed394ffea08acaff5dac647848d26b96bb9b9c65d58da0"
+SRC_URI[sha256sum] = "af37c5a81d59f3bdc00d83056606ffa1810d4550beed6caa4f81181246494220"
 
 inherit autotools useradd pkgconfig systemd
 
@@ -30,34 +29,37 @@ SYSTEMD_SERVICE:${PN} = "radvd.service"
 SYSTEMD_AUTO_ENABLE = "disable"
 
 do_install:append () {
-    install -m 0755 -d ${D}${sysconfdir}/init.d \
-                       ${D}${sysconfdir}/default/volatiles \
-                       ${D}${docdir}/radvd
-    # Install init script and volatiles
-    install -m 0755 ${UNPACKDIR}/radvd.init ${D}${sysconfdir}/init.d/radvd
-    sed -i 's!/usr/sbin/!${sbindir}/!g' ${D}${sysconfdir}/init.d/radvd
-    sed -i 's!/etc/!${sysconfdir}/!g' ${D}${sysconfdir}/init.d/radvd
-    sed -i 's!/var/!${localstatedir}/!g' ${D}${sysconfdir}/init.d/radvd
-    sed -i 's!^PATH=.*!PATH=${base_sbindir}:${base_bindir}:${sbindir}:${bindir}!' ${D}${sysconfdir}/init.d/radvd
+    install -m 0755 -d ${D}${sysconfdir}/default
+    install -m 0644 ${UNPACKDIR}/radvd.conf ${D}${sysconfdir}/radvd.conf
+    install -m 0644 ${UNPACKDIR}/radvd.default ${D}${sysconfdir}/default/radvd
 
-    install -m 0644 ${UNPACKDIR}/volatiles.03_radvd ${D}${sysconfdir}/default/volatiles/03_radvd
+    if ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'true', 'false', d)}; then
+        install -m 0755 -d ${D}${sysconfdir}/init.d \
+            ${D}${sysconfdir}/default/volatiles
 
-    # Install systemd service files
-    install -d ${D}${systemd_unitdir}/system
-    install -m 0644 ${UNPACKDIR}/radvd.service ${D}${systemd_unitdir}/system
-    sed -i -e 's#@SYSCONFDIR@#${sysconfdir}#g' \
-           -e 's#@SBINDIR@#${sbindir}#g' \
-           -e 's#@BASE_BINDIR@#${base_bindir}#g' ${D}${systemd_unitdir}/system/radvd.service
+        install -m 0755 ${UNPACKDIR}/radvd.init ${D}${sysconfdir}/init.d/radvd
+        sed -i 's!/usr/sbin/!${sbindir}/!g' ${D}${sysconfdir}/init.d/radvd
+        sed -i 's!/etc/!${sysconfdir}/!g' ${D}${sysconfdir}/init.d/radvd
+        sed -i 's!/var/!${localstatedir}/!g' ${D}${sysconfdir}/init.d/radvd
+        sed -i 's!^PATH=.*!PATH=${base_sbindir}:${base_bindir}:${sbindir}:${bindir}!' ${D}${sysconfdir}/init.d/radvd
 
-    # Install default environment file
-    install -m 0644 ${UNPACKDIR}/radvd.default ${D}${sysconfdir}/default/radvd
+        install -m 0644 ${UNPACKDIR}/volatiles.03_radvd ${D}${sysconfdir}/default/volatiles/03_radvd
+    fi
+
+    if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
+        install -m 0755 -d ${D}${systemd_unitdir}/system
+
+        install -m 0644 ${UNPACKDIR}/radvd.service ${D}${systemd_unitdir}/system
+        sed -i -e 's#@SYSCONFDIR@#${sysconfdir}#g' \
+            -e 's#@SBINDIR@#${sbindir}#g' \
+            ${D}${systemd_unitdir}/system/radvd.service
+    fi
 
     # Documentation
+    install -m 0755 -d ${D}${docdir}/radvd
     for i in radvd.conf.example README; do \
         install -m 0644 ${S}/$i ${D}${docdir}/radvd; \
     done
-
-    install -m 0644 ${UNPACKDIR}/radvd.conf ${D}${sysconfdir}/radvd.conf
 }
 
 USERADD_PACKAGES = "${PN}"
-- 
2.25.1


