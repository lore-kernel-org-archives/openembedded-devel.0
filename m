Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B3B3C28B30
	for <webhook@archiver.kernel.org>; Sun, 23 Mar 2025 05:16:43 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.10908.1742706979687587358
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 22 Mar 2025 22:16:19 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=51775b8887=yi.zhao@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52N5GJdS009873;
	Sat, 22 Mar 2025 22:16:19 -0700
Received: from nam04-mw2-obe.outbound.protection.outlook.com (mail-mw2nam04lp2176.outbound.protection.outlook.com [104.47.73.176])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45hrg40mr9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Sat, 22 Mar 2025 22:16:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V2w1NeZLKvmmzAj4fxHS/8sEG9O1Dz7ty3Lcm2BFsqisIoNH0T2CU5j0ShYuU8E5NyYFEN9XEHSsO6PqHbDtoR680B00YnPbtYzIRaEOCGpapH1GgdIVun7/+3Z0tknhhI0xEoK3g+PeqNXWD+S3l7P60E98YDaz3gdFSoFJrrIUdBDQX43f1yZfvev7wx/CBz17v3N4zDsucOUg+re1vIEopDNYyewiKTKjCHL8erUEnwGaWgz5l9T7DhUF97SjRhVa1pW4Kxo1UtiamTIx0cCDS6klTPJH1xFwF0M3bQ30osgEbpEEsCx176R4aTf79POBdtNYtlTvdlEhYoY8Eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W7r8o9W7zGLmwh2MGaJWNzMfaWyns2GKvYOqwiJl9RE=;
 b=wNs9tQajUz/c+kkx0/5NQO1e1TXqHphB2Lc7AQdThm4NkKBi7LXIK4bvPMJujLIeSKQ166jnR5GFA0Jw4OjolAaGYn6ZT4fBcCeerLEEMoRXUGUdwLqvQQWmuzWb6wt0LMQbAbgvyyza3EGaaJnjjyNYRHGlUP7OStYX0Z0RhihTvi6+CVH6xt+/zU1+voUF9sNm3WLydUJ8WWgyn97Xpiq7w9Xu7YMFArdGmr3TtrS2g2irI05EiAFyeOfmlOHaj8s+lDFOh/pdueLbbSZC3TgUAK2Ohi+dv5U+85O4TJvliD8Z9Yzfoz0A5zypmf4AHhxK5AlApqiteSYAPnNj1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 CO1PR11MB4772.namprd11.prod.outlook.com (2603:10b6:303:97::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8534.42; Sun, 23 Mar 2025 05:16:16 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%5]) with mapi id 15.20.8534.036; Sun, 23 Mar 2025
 05:16:16 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH] dnsmasq: upgrade 2.90 -> 2.91
Date: Sun, 23 Mar 2025 13:16:02 +0800
Message-Id: <20250323051602.3652304-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCPR01CA0157.jpnprd01.prod.outlook.com
 (2603:1096:400:2b1::10) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|CO1PR11MB4772:EE_
X-MS-Office365-Filtering-Correlation-Id: af23763d-e30d-4569-f447-08dd69c9d649
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?MavoW7BglhQRsaqIVgtna5Ibjd20FCWWly98pFVVOaBZmEoJ82JYhlX9V+0A?=
 =?us-ascii?Q?t0Y/SkWPPFIweKa8LyJq/F6XGQAm0rIEp9Ie8CjbMIuvWuIWjE2KKb74Hzd4?=
 =?us-ascii?Q?FyM9F3HuBhEcJLDePz2abtE1eq2gmENqA+HVdWDHkU6AsTe4LPpz2CwjxJeP?=
 =?us-ascii?Q?wbXfPpGizbUOdG9KbzFurnrdH3wNSDpahix9EctSmnLIvgZ7N1qLLE5lniFq?=
 =?us-ascii?Q?2oE21BBEh9R1za9y71SJ4Wd0Jsg4J+B/NYQEtmszMt3wCetWKInfQLe1e4fW?=
 =?us-ascii?Q?RXxTyaPjH4iubtmRqSDbijSGCef8FZGcobYQHzKFLQQkn/aKlf5pQZ/5FyxH?=
 =?us-ascii?Q?axZDPqp6P0ud2tpDS1LGn5sPxx+erc89w2308V4SteWbzma1X62xR0VxsCKx?=
 =?us-ascii?Q?M9Y45UxX0Dc00rPP+XtAZkPaTppZe/vH5hAid1M+UHXRfOrekzpxBZvm0CFU?=
 =?us-ascii?Q?iqdHrXH9+D+s40xlMt8lR6/F+2qaZIijB3G6QFVpb5zNEO/L73u8ChKTo0AY?=
 =?us-ascii?Q?/Ac6YmjrDyfS8W5qpL9xWFs42/bViYQoT5xFY6DlT7LMlxJ7c2bE8ha0gqEn?=
 =?us-ascii?Q?cIIwRZ0dOUe5mvjEGIpo+Wkym7UkmfdjQZhHMoXu6St3RW0fZMtNaRkSt2PN?=
 =?us-ascii?Q?CD50bsIsoNHVafQHjENkv6oa1sEHYtSBk0QQh/22thEXK9HDiD3MS9BwGzlz?=
 =?us-ascii?Q?iYMNtjeAUfoVMc9uqN9305eftxpP/lJDi39lg99TtCgjBSEVIYdaYq2dyfqF?=
 =?us-ascii?Q?PEkY43aWTGEtl6Aj6+BLS8eyMfkgMUBufJPygN1cLpBRnpFq9bESqxeU/x4w?=
 =?us-ascii?Q?cXbAp9hlW/OYCXcngYwA2p+lM5duGqADaHthQD8Np2nMFjDHxYpSz3cqAc8Z?=
 =?us-ascii?Q?IMpqNneBnZ2MLNQ+TfSP12OVc+LBdggSUY4tw+n58I7lo63Q9HgonSlNhiZ9?=
 =?us-ascii?Q?hF/nyS1IXdyxSeRLcQQnDkAi8wmKYHP9Qbx2X32m9AAdf82FuMumufQZtfKn?=
 =?us-ascii?Q?EnxzT8+D29FHzmQk3eW8cQzYmRxoWi3CtzcZjXmfBcBLPCxEC46B0M5HiYhz?=
 =?us-ascii?Q?UfhXeGg3tL+CPNFGrghWCIR0iLGK2p/w/O5/IowEBxAoVhtdPoI/NpQmtr9X?=
 =?us-ascii?Q?v5jKhcdD8xTmqQ1WWW4MZ+7fEd21CoVqUhk4xHOHRJ0qhzBENUYg4X4dUlh+?=
 =?us-ascii?Q?uOl4oQItpvU5sIHj0Iczm2LlpQMgR2I8gKGh09yRdQgOcH/CR+zxVdj7i6LC?=
 =?us-ascii?Q?cy+WeqASXUFYa2M489DrBcFUT4QSgmCRIE3vh0UmlYv1sRo/PzFq8VNHUD7Y?=
 =?us-ascii?Q?coSK2NPn2nftGildaUMxGL90/T6Ex9ettNx4QiFugrCyYkjTFSNqMMUYFUPJ?=
 =?us-ascii?Q?obWk33KI7HU/VVqHNtCv+Buk7DeJ?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?cnEnXTeL1sFf1cauK2B8witxAEJg80sLbndQPYBtPpRs/0o/8akZOLquzjOX?=
 =?us-ascii?Q?bmu9hVhS/RfE8bRIp1OvXO+4dxuChcGF7LpMqnurU6RQOPVg5qeYKWgcjBrG?=
 =?us-ascii?Q?tGwddy0WRF0q0DRe5jqvkUj0SngEnxv2eYu4FxCb4vQIO58b0ojyn0KOFCHA?=
 =?us-ascii?Q?bZ6+rv2TJnonpmEm69MqSSbGl7Ceh+Qc+t/V3ImJdKDeqwcLarOaldSH0Awq?=
 =?us-ascii?Q?G8fodeNUSct8Fx68ArZfgIl0qDv0wKqxUZie2SkA+5JfOcEKoMczNHjfg9bF?=
 =?us-ascii?Q?hgQc7ZsJ0FvgpmpRmZ4XOoFScuvvcU3ZgBiELX9OvvVjedwRVOA24IlrT/yx?=
 =?us-ascii?Q?z4KSPsOG4laPh8IJrcwYKsJnBH05gsH4AtgBkdB7YGJJm5wD0Vjwic0Rz4l3?=
 =?us-ascii?Q?PEzQ0hHIUJjqzXbEbqFQ3UoVlX9QDRRISjnIW96Fkqp59OJzy6NsPLBzqSm4?=
 =?us-ascii?Q?k16qlUWofslEPJHFyrSJMXx3tT+YFT4aAqrc/E36xCx6boPbFeMcmMs7MYCN?=
 =?us-ascii?Q?lblePxw8aMyPdvY+1CCMc6lc0DLneFWPALMNYZwkLt2DCLClMlIqXI9bUITT?=
 =?us-ascii?Q?+trXq/XdtLrih+A8QQSpmyDz+skJ57SwilPoJDVWiSoSbqH+oAsUCQuc55s7?=
 =?us-ascii?Q?LqK44pSfLhQnbrpzd+W73LIRiioyylQj5g6QxmFiwt6HTzwZYOitTxgkdrsv?=
 =?us-ascii?Q?o5PJ/RpQNRVHz5aFmEd63EHWu+jq44L7PCNzGz0w2uFJYWqg/7Se2kx1j4g1?=
 =?us-ascii?Q?JX1PIBE2tnVTha43nwQ8/3lEJxpX4z5FaVEie5DvrvV3J9T6iUBtWjB84DLb?=
 =?us-ascii?Q?XeFY3yD5GcftNyIdoJe3lC4Kc2m/HHjoPO38p1+3PlY5GpAR2Mk+LPC2u1/a?=
 =?us-ascii?Q?zJRai7pir0smurVVu6Z+ENj9eRsLm11xR2pJKfZuUu6rAH1Q/Vd+joU88WKy?=
 =?us-ascii?Q?EP1ksMeumgocb3uRoR8ofRNfGDJPwE6KjSlBwG5D5MZQ3uOZK3PvPvjN7nlw?=
 =?us-ascii?Q?4CcqoU6ykK2AuXPJa4l6kET1NzM0wSlv+vR8TKsq5RjBm45pGx9imIMa7RGV?=
 =?us-ascii?Q?RoFCHl8PDDan+LWCTbSraWOHWv/p6OWZ01DJyrEosWepYACzMXq/qkyWCNbq?=
 =?us-ascii?Q?WX/eKZGkw/6i5dGIfFsTjFX8Eom0GcKYjhF72scrfxno3kLSXwWT/WnMuCYB?=
 =?us-ascii?Q?F/cMopMZFrDvpHX+Fu6mhjrvPsofJ5mXqxE0Jgm2ql2O08Zrb7svu1N+a32f?=
 =?us-ascii?Q?3D/BlsZBHrMlAQXoBeQaKwKuJWu2GFUBwdqIMCL2HO2apVEuNIFzcIZCvY0u?=
 =?us-ascii?Q?QW9oM4q5jkrWMLtxA86+U3m0a4dyul7vb2NENE87/b/G+yifbfWF8nj/CdrT?=
 =?us-ascii?Q?Ha7mLTusbfLgRx4+2a1ZKoj8++Cr01OAM/jWCTjuq3IT0Yme/NK19/wNmGMO?=
 =?us-ascii?Q?K5QtduqGpBElcTOie1SV5Sj3Cjm8BFubuJwSMTENZK5h+L+q/gEBIcyxv2LY?=
 =?us-ascii?Q?TQ3mVS8l5VvJfel3oO9VunAHfbeziQVD0w7dgHd+jSewYUvpMwssvBi1a9+I?=
 =?us-ascii?Q?zHeLNoc5HVpdhuohVoaZWJrAtR7fDFmTr3yXs/py?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: af23763d-e30d-4569-f447-08dd69c9d649
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2025 05:16:16.3725
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AhLpmAKbgTeYDatz3MZ2XA/CsH+OXtoD4h9ZhKh40FGFxrVXGihd7s0Sn9gkcvOZVE1JIW3oLi57sCdLz0Ri0A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4772
X-Authority-Analysis: v=2.4 cv=HZwUTjE8 c=1 sm=1 tr=0 ts=67df9923 cx=c_pps a=BfiT+f4K8gVEfImFRIf1tA==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=Vs1iUdzkB0EA:10
 a=H5OGdu5hBBwA:10 a=omqxvBYPAAAA:8 a=t7CeM3EgAAAA:8 a=YisA5kpUfJGTjswuSrQA:9 a=LHRESdT2jHCYgTnjdhDM:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: mcMkxzcanfj6m0ApavWuzKeeEAZCPs6Q
X-Proofpoint-ORIG-GUID: mcMkxzcanfj6m0ApavWuzKeeEAZCPs6Q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-23_02,2025-03-21_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 lowpriorityscore=0
 suspectscore=0 bulkscore=0 phishscore=0 malwarescore=0 adultscore=0
 clxscore=1015 impostorscore=0 spamscore=0 priorityscore=1501
 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2502280000
 definitions=main-2503230038
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 23 Mar 2025 05:16:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116202

ChangeLog:
https://thekelleys.org.uk/dnsmasq/CHANGELOG

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../dnsmasq/{dnsmasq_2.90.bb => dnsmasq_2.91.bb}                | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/dnsmasq/{dnsmasq_2.90.bb => dnsmasq_2.91.bb} (98%)

diff --git a/meta-networking/recipes-support/dnsmasq/dnsmasq_2.90.bb b/meta-networking/recipes-support/dnsmasq/dnsmasq_2.91.bb
similarity index 98%
rename from meta-networking/recipes-support/dnsmasq/dnsmasq_2.90.bb
rename to meta-networking/recipes-support/dnsmasq/dnsmasq_2.91.bb
index ba783d03ff..25f2d4c09a 100644
--- a/meta-networking/recipes-support/dnsmasq/dnsmasq_2.90.bb
+++ b/meta-networking/recipes-support/dnsmasq/dnsmasq_2.91.bb
@@ -16,7 +16,7 @@ SRC_URI = "http://www.thekelleys.org.uk/dnsmasq/${@['archive/', ''][float(d.getV
            file://dnsmasq-noresolvconf.service \
            file://dnsmasq-resolved.conf \
 "
-SRC_URI[sha256sum] = "8f6666b542403b5ee7ccce66ea73a4a51cf19dd49392aaccd37231a2c51b303b"
+SRC_URI[sha256sum] = "2d26a048df452b3cfa7ba05efbbcdb19b12fe7a0388761eb5d00938624bd76c8"
 
 inherit pkgconfig update-rc.d systemd
 
-- 
2.34.1


