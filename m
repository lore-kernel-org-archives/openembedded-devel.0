Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BA61C3064D
	for <webhook@archiver.kernel.org>; Fri, 28 Jun 2024 06:09:44 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.11099.1719554976000993493
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 27 Jun 2024 23:09:36 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=6909187cab=yi.zhao@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45S4ehcP020065
	for <openembedded-devel@lists.openembedded.org>; Fri, 28 Jun 2024 06:09:35 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2174.outbound.protection.outlook.com [104.47.55.174])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ywnk5wrra-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 28 Jun 2024 06:09:34 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ovsh/p5Ak0BUhjzppJbVAPqi+me8kVUnum7PowbBm27TAc6xOEM9Egev49dsLpRxUfTWt6anFPzVQWcFLJaxufFr7Yl/MyHgnb0DKNTqnTgUYKLkEsP1gBDTgkJXk6Cf2wrRek3j2vwxC63VzwZvzwvnKHrvQMnW2gk8CS7fDZTC4DK6moXY+F0oN/dEFVehmcDIwnFiLwZKtgdD+38X+o9GfuWpLo7pxRpQys3Qwx6w9wJ92cHkGtiDAVsRnblJxa3D5je47/fOZM+ICszkRlaCY4WN1bp1kPFOD3qOHhi6kDq5K30hyOaIcuv1qyLrK+4yY3R8AwSzPtas2aK02Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JsXWtyh9t2bI73JfopcLDyTx7IM+0qmwojCin8//POs=;
 b=moKK5hUe0wYKiBuFjbyIKO4FiHHAIPMntDU/32d0KSEqGxDbFoSfWvSHZuw9k9750xdkzNrfWl1+mjeXQruf3pB2IN7xQQe8g9iQ86deWm+rsHMSBXBOJCIDoxXEWM2HLxpxnkmqEJcjRbHGrUyQZyGMPOc+HjIqTYghN5EiejDXGCLyvYBoKwINkAV4h66f7OEiB3urUCTtMUony91ZnV+FoTb2fYOynyl9CX95Et+MBdiq9enu9YVAqIjLCSKoW3UQbHszgOLy97R/hRyKk8AcGVJ3Bglm2uOr7ivieSc6uUpWm6f13S7VISb1ObO4zz9z9iyr2A15ak/zkX+2zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 CO1PR11MB4833.namprd11.prod.outlook.com (2603:10b6:303:99::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7698.34; Fri, 28 Jun 2024 06:09:32 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%3]) with mapi id 15.20.7698.033; Fri, 28 Jun 2024
 06:09:32 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH] devecot: set dovecot.conf file mode with chmod
Date: Fri, 28 Jun 2024 14:06:44 +0800
Message-Id: <20240628060644.797260-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SGBP274CA0013.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b0::25)
 To DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|CO1PR11MB4833:EE_
X-MS-Office365-Filtering-Correlation-Id: cd16102b-64fc-4d24-f0d0-08dc973883c3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?emfLQWYsxn3sEBEuraxJVDf9XCN6D2RhuMK8sTBUtkDcwVubY5dxYqycuWR9?=
 =?us-ascii?Q?EuRkZrWanKz1Hr1l0sUMhVY79F92fJwJVnG8cyY99MF/9txHIs1D69euf/L5?=
 =?us-ascii?Q?Fai4xfa4gs+q0l4QZfBI/Exp6u7tPvfQ73FudK3OZRf0Ci7YEJ/swv5c8H4H?=
 =?us-ascii?Q?Y915noCbIyQAiCnwp+++8cu+3ojPyoTn42LD3XgbY1rYaTKIVIOBPdfpuZTR?=
 =?us-ascii?Q?69RG390PTcXIRj0MPkAR5XJajJNDt1YdBFgaj0aaFT13ODhAGSj7HEdOd3HD?=
 =?us-ascii?Q?usUV3htWTifp2/tKF6G1OzdyEpr3ar+fHuA2qnEppQSWI+Feku8A8GIFSRPJ?=
 =?us-ascii?Q?FaLpeyA9PHnfDgLO2K2xQ1XluMBkIayRwOtqoJ9WPdZi3gH20mOOLkEpXzG5?=
 =?us-ascii?Q?h7sqvJNW0sgqx1bR7QNjqQVn2XK4h3MouSMGqmimADA1NvJuEaJBEvWiSNNt?=
 =?us-ascii?Q?lYvN+zJa+Ey0M8RkEKa32TQFnpRLe8EVNhPwZ3AliLpcikleiXYWDIpILqhT?=
 =?us-ascii?Q?qO0MmfoEsFl1DbgMOBVl1ZfBukZbcGJDakf2xYV3h5h200tUUHIo0Pjs1BXX?=
 =?us-ascii?Q?hntV67GXHRKokbwxWKVrD/oOt1Dr8mP0RVWC9FeqUTD8LgR5ISFCuWq+lUdM?=
 =?us-ascii?Q?+4TCJuKk75/8PZcyUV5/lNdjMIBhP/T9Cskxn2vI3HB+pK6pzNt+fFs071Rw?=
 =?us-ascii?Q?jMeVI3gxg9uKc30BRISGkG7/MJ2F1jPNEs9pcBseaTeSbXS0IL8QUUitt2F/?=
 =?us-ascii?Q?HSRil/FDlyVWlPnsZ8YkSVfPiq8AzdahBHRB2hl3HOaIjwB7MeB8Iyz+jPM+?=
 =?us-ascii?Q?DOYQsk65ymAlnTjv4K0w1JSS/hvVU1SOsBO1Vh/tMJypVf7MdFB2ywmJIkMI?=
 =?us-ascii?Q?s8zW1mTH9bao++0xqF8oizFPzfuOtGs9ytqstRH3Z28jmf5yA2rDnHLI7hIr?=
 =?us-ascii?Q?5vw0aDHILwTFIsbUnKmxcaAEGwYxNesbeRJCAPJMq3eSE9NCf/LdfWxrMZni?=
 =?us-ascii?Q?aeqmrvEDZgShWD6HxYikq13EoqvRl9pmcTDvig8OnRDdkwyko0ZPnmzdWVFr?=
 =?us-ascii?Q?sU82AnewuvyAKB24CLDE5acMvK4ZlG1fBDkBuO8mhfDef5M1RQN8GsBwRvV3?=
 =?us-ascii?Q?BqX8IuecOowHH+ZZ8lb9f6KxOuPc5A0KYOSxO07hTUiNFINhp/lcxHFIgZ+0?=
 =?us-ascii?Q?6L3DKgeHBYjHLTauuDzZYaBIv2pWJLmyCW7aDbAim8P5BBPg9EOPKzEjKPPg?=
 =?us-ascii?Q?mfvmA+T56ppjbAZY35A/4B7/ronJVgToJ2NDwB7sdxb9mIitft9T0VrrNbyD?=
 =?us-ascii?Q?uyx84viV8MvY6biwKg93/t0G7UooG/3LquZItIg6TVtxSMKtQAFIWphsVS9X?=
 =?us-ascii?Q?eOeCqgWYvp8yJgfmbAfvg3Adr2Uqc8q/WDZqBAt0qnItxNDt6g=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?yDRzu5tZCUb68gqBPj5G8z17fnJ+AI0iareHx0v6Dy1mzzFgxvmyfVII+BwM?=
 =?us-ascii?Q?yosjaO732giZLsUnk4xjZAbemTKCYUIrCjznHcW7lCBkUIHTBouS4HAnUTAF?=
 =?us-ascii?Q?IEvTu6mVlOUQ6C3hThx8o5QCO/whvNrSXq3aepdHmFttt95Jvb1VbZ02gdun?=
 =?us-ascii?Q?aWuQf+VwDGGvmo18wuDqyGeA+WSoj4JfXcYdWsrHIceW1WP5QTgzyr1Cu4Lq?=
 =?us-ascii?Q?7aiVA8iH9/9HpJdBQYQ04YqaWQnNowo5Cx38Id5QxSc16Y28gMh3uuPWIHC6?=
 =?us-ascii?Q?tN2CYY0TCAeZnKB8a5EF7Rvf6RzyMQpNO+FjYtxtewdqq1+Fu/4bM8Xq4WcX?=
 =?us-ascii?Q?/8wFU2cTKyqkaGdqqLMn7nglYQf/5+HwwsYC+GDxsAcqF1s9UkMg1bpUEQGK?=
 =?us-ascii?Q?+jOwFY68ODQzRrFh7rpe7azmztODq9lAyZGTYwOZEXizyK55rOFh41CRUoSF?=
 =?us-ascii?Q?xNtE5eGjSEscEMe2U5QU5NtijqF1ZOwyj5CbFYDujbpR9mwJ7EMsdI2CZZBy?=
 =?us-ascii?Q?+heJ4HJUXyqd+L7RuZNrCA1B6hQkAqSjifFcQ7OEB124X6ueJrhXJRYLTALy?=
 =?us-ascii?Q?ejlB9qSfPm6jM9vNOwmaXhcqIiF1WNZRHuuCWpyZE19QHdrmnDa7xuHBVGyB?=
 =?us-ascii?Q?94AhwbPlKTL5b+tpItM27+2qSg8kXC0k0+4rugkWDD9yPdRuBzulra2QCpnz?=
 =?us-ascii?Q?VMBivp/S2Wk9c2hVMTsDUjo/Cgrb0s0xbhkVmW4WPCMmMOnd2Al9RRnjUNNF?=
 =?us-ascii?Q?6OBQc1Pchec/n/aQ+RsQHO1T1b+BNlbiOIcIz7iV0UDcqDiw0OJw8RcRN//0?=
 =?us-ascii?Q?7Ecdz7e/PXKGH5V/uSq0Me4gux9uNZfHia1ksulkST6LeYsHoK99CrJF61+q?=
 =?us-ascii?Q?N8OquE0nMld+3jUr71YLN/LXwnLFtZPA2w+ouoyAGJYYSFrYVg0InqBq0Xif?=
 =?us-ascii?Q?3nMHI8fcVvf6tfy9wmYeLM0BBwX8Rp1FTrCwZTJt3BqfCRknRtNkQgyXHB5Q?=
 =?us-ascii?Q?aHPmO9tISRxHrOdNDo80mgExYCn25RQxDYA4wq6xqtJ+kFIZZQKX686SEG4Z?=
 =?us-ascii?Q?0CqtnZ4Cxx/j2he1xvIXBwzExbKC6tz14rCSQsFqjbyDkb1IY6c98xCqDBE4?=
 =?us-ascii?Q?c5js4BcL+RA7TILJyu27hqK9k8ORCg25IEWD7YS37LigqHwJAqNAsz0oPaq8?=
 =?us-ascii?Q?uQ9Iig2w2TPX7by1VPastTHWcqrOArgPEODormW04vjVoCF4iqX8SbgAa0xv?=
 =?us-ascii?Q?cO6fqCyqrTucJ0LCnS3xtpOslhLmJueXdXTBcaaX/720mjLIIPGi/ZzsQfXC?=
 =?us-ascii?Q?ixkQv3wTKIebBPenDbl9krZ+SoSM899oMYs+Nt7b2IaAeARHo6Zq+rZo5QJX?=
 =?us-ascii?Q?6thpb280VlwZJoi5VExAzz/hJe8QuvyVUL/vydOyuwsXwLQzO/aLPlMCvvl7?=
 =?us-ascii?Q?LqT7PPBeinqxVJ9tmcTMKBsisic13mXzJV9PddxQ4Kr/2T0Of1YBrf4uJ+sh?=
 =?us-ascii?Q?xj7MOOnf8mUCx8cZIiY4IRrzmpnYQgVpgJEyn8a/6X8cJ+iVmVh9Ya0+vGfB?=
 =?us-ascii?Q?4Xm6ZPQLaqKEc/aVFZEgebAEKqLQYNc7EBrK0uU4?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cd16102b-64fc-4d24-f0d0-08dc973883c3
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2024 06:09:32.8293
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F8TVWg7e7T6Y3z8TnmZuUUnARhduS/7OPV9hEj1nREQq2ZCo8BofldpXirw2aIb3T4Pq5LYBvaAsk4FdVa02yA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4833
X-Proofpoint-ORIG-GUID: 7aRGhnTSQs-qSCK0qKudzl8YSJ4wdm2y
X-Proofpoint-GUID: 7aRGhnTSQs-qSCK0qKudzl8YSJ4wdm2y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-28_02,2024-06-28_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 bulkscore=0
 impostorscore=0 spamscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0
 phishscore=0 priorityscore=1501 clxscore=1015 mlxscore=0 mlxlogscore=987
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.21.0-2406140001
 definitions=main-2406280043
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 28 Jun 2024 06:09:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111143

The touch command doesn't support file mode setting. Set it with chmod.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta-networking/recipes-support/dovecot/dovecot_2.3.21.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-networking/recipes-support/dovecot/dovecot_2.3.21.bb b/meta-networking/recipes-support/dovecot/dovecot_2.3.21.bb
index 2f887e601..4e76d2452 100644
--- a/meta-networking/recipes-support/dovecot/dovecot_2.3.21.bb
+++ b/meta-networking/recipes-support/dovecot/dovecot_2.3.21.bb
@@ -50,7 +50,8 @@ SYSTEMD_AUTO_ENABLE = "disable"
 do_install:append () {
     rm -rf ${D}${libdir}/dovecot/dovecot-config
     install -d 755 ${D}/etc/dovecot
-    touch 644 ${D}/etc/dovecot/dovecot.conf
+    touch ${D}/etc/dovecot/dovecot.conf
+    chmod 644 ${D}/etc/dovecot/dovecot.conf
     if [ "${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)}" ]; then
         install -m 0644 ${UNPACKDIR}/dovecot.service ${D}${systemd_unitdir}/system
         sed -i -e 's#@SYSCONFDIR@#${sysconfdir}#g' ${D}${systemd_unitdir}/system/dovecot.service
-- 
2.25.1


