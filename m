Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7584E77197
	for <webhook@archiver.kernel.org>; Tue, 31 Dec 2024 08:59:17 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.79449.1735635548905638698
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 31 Dec 2024 00:59:09 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=3095ea9653=yi.zhao@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BV8rdAW015154
	for <openembedded-devel@lists.openembedded.org>; Tue, 31 Dec 2024 08:59:08 GMT
Received: from nam04-dm6-obe.outbound.protection.outlook.com (mail-dm6nam04lp2045.outbound.protection.outlook.com [104.47.73.45])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 43t8a82da5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 31 Dec 2024 08:59:08 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AlKH1CW2yY8Abu3Q7YjesDhVIXXZnqqtl0QxTi5CrHRrdpsMIeh7RFzBs5EELK9xM8G7+mCBBZsn6zxlh7GVKO1xidHkEzzK/pFLhOYIECpErIPXbZk//EwtiTtrSrvuAH7lTByfFiwH+53mzHzrZcxaWR3Wx4fEVQcaE9rToKGzta8Vlj9eWr2H9S2iFs0lYMQAfMr4aF9B3H0rXtrvH4JDIm3LFZSj5qR61BEtw4NDyv1qk+0fc+XFsTToCA1I7p/qRioguzU/ivoi8l8ystItGCrn+ZtmQJTLvVTr4CMF3BgHjeTwK3myQCBQm7feIkhrkC5x8NZX+VoQ2S9W2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sTTxOrVKqXUH5RhyoTTia6vd23CoXajtCQrg9A20tzU=;
 b=cX54vm+7vIKHU2cgmECnBxxSvMnrsBNIz3ajerK38+M707nmXSWNfstkbaaZADtyVAnHb6foX0FWKPalM/QJZAem5Ogz57ZEosCbMi1IDQimuFy+UBfb6fxf9FOL6yhhU0u/uNk0C1E/gTq2TdTfwiYDjRXUiyDOvYfcHhof+yo3dyqBkbQCbq8oTLrPbqiIY2NGCkbJ9usnPK34rOPKAMk9we6CDRDAs/2eX/miLkJBXO3U9doCCMszS4QpiLyRUNBkC6cNBbX0ZEasR8ijCVE1afdHSE+NxHqkKAN/oWGu7gFt3KgjvRv2kxv0a0dVUlCH5Kz3fqE+QQEjJGjQig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 BL4PR11MB8846.namprd11.prod.outlook.com (2603:10b6:208:5aa::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8293.18; Tue, 31 Dec
 2024 08:59:01 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%7]) with mapi id 15.20.8314.011; Tue, 31 Dec 2024
 08:59:01 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] mce-inject: update to latest git rev
Date: Tue, 31 Dec 2024 16:58:44 +0800
Message-Id: <20241231085846.4022015-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2P153CA0019.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c7::6)
 To DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|BL4PR11MB8846:EE_
X-MS-Office365-Filtering-Correlation-Id: 02b4acdb-23cf-4e3b-23ec-08dd29795eae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?MkPsZYyC0Ygj3dQnsnEG1NOiY/q5S0BiJRIM0vaqn2F5MgqEGBDGz/vt3IHQ?=
 =?us-ascii?Q?49aztCzuSafasPuAyiFunGXMolVZNBGQaQ5JX9SEGxdZpjoPEE6c3KU5Dzhl?=
 =?us-ascii?Q?EKcOh4C2QwMLFiKH27CbeVvpNTIgUxn+pngI843OGRgsBB979ekp5Q/Xevtl?=
 =?us-ascii?Q?UAhd8HfWTlCtyIAnqrGC5TUpuv9UBbhadZCoQzanjWZ33LL/PReTZLplZsgT?=
 =?us-ascii?Q?XmDO0rgNaMiUuk0OGLBdGFJ8eIuJh2FDIT21fKwucwz4qeJrLmk4ZDhXAhcj?=
 =?us-ascii?Q?sBcrs6YyRcGSeDfru2VGKTpY8DJZF5eUr9pPhT/sz4IEBhy0gbLqNze4AIPK?=
 =?us-ascii?Q?Dx5jfTrkctG9MLz3rquwCCsUp4gnzbNV8niNI2TXyK2NtW3Pf2/ABNsxjf2r?=
 =?us-ascii?Q?UrNrlMzLNcAdCKZw/p802e6SaLETlqW6dBQ5CM5aYtSLkblxJJsfkzJJgqmJ?=
 =?us-ascii?Q?1YC7SWUonm7dAAarBaGjz717zsiO5buy3ACaITU0O/O03v+i70i40t6XgJDZ?=
 =?us-ascii?Q?0RkS4bnZXRbBn8h+luxZw5HdS99/IPMdiRYCpvrfYX0l3iwKTV2h7AJf7PiQ?=
 =?us-ascii?Q?NRjuK5HOVdj7oSsKltsjuSBrib6nW2PI/YNYw865NbvUxZ4DFOppZLafVY2A?=
 =?us-ascii?Q?rtrdtHV983zOtPGt/I4Cn03GylN8gwW+iOsCmmYVWUDaGZt48rkH/+TRkm8l?=
 =?us-ascii?Q?oZ4udCK74Q+N+ynnbF7fRUCFkqWgyBQvVAAt2pdJ5C0Yz4pybD+5Wa2PWKsW?=
 =?us-ascii?Q?JWu22A3vjJbLqy1cFAvsAZRE58HQOSIFyyNNMCMBydHWPtVmnzMC8DInWTEF?=
 =?us-ascii?Q?QrI7mWz7lQzBKSVHwFuFGccx66B+eW6pX/hllxCFjE8DkcK8zilUW5oZkzLb?=
 =?us-ascii?Q?0Ybm5KSlgcnkD/2NLg0R9a8U4H7GO0ykEJPSqnbFA82p/gyvR2jhCcMMdyVe?=
 =?us-ascii?Q?F6/b9L/JCHlk7/ihY/9u95j4yYjHIs+uyvQRtvpkT0rj03n6mQZ5owXk2zsJ?=
 =?us-ascii?Q?hNxGeCuq2i1+KpQxiR+pDwa18WrfI4mLB8QXd9RxOUy/F/Qtvc97xvrDnkn1?=
 =?us-ascii?Q?VCKA3AiaKKkrE3LvI0HTcQv5AVnyn1YfySlD+CmIhZG79qDQnzm4d9EoQHvD?=
 =?us-ascii?Q?zpavw7DWAUHGi62zrLyDu9TId84p8xA1hZGQBq0h9mlvJ66coF+7u6TRXIqo?=
 =?us-ascii?Q?MS3qyhMBImC4bKmXtn3dQoyzi8iuIjS3FF4QFEbI9A58NBMa/u0GBu9lYEzr?=
 =?us-ascii?Q?vNNJh1JTLo72h5rhukCBDbgdDilnt0z8yyW4e97zVsDHbwUeipo438e7hjV0?=
 =?us-ascii?Q?zPf6KdZNCX/o6ohJJsSkjo9QSV4FvIrPTUzfhK2Mof7OpTqiX0UXJ4DZeCgO?=
 =?us-ascii?Q?3PBnqu/3im4/GpYQyyDngysmsj+LYKwEosy36GARyUufWZxjsYa2znRPvwxl?=
 =?us-ascii?Q?gyak92PydyhyEExZE6JyHv6js3X6jHsu?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?90uOOxl2cbIq+odu7vNo+b9YDjtLzSLMI4muKEtLegsaHh5lm+z/CMy0wc21?=
 =?us-ascii?Q?aahZcZdcxRcBZYet4lAzKNyfhESiT0rS1P3KD/DGqvQ2/1JLtktyMSSIAueh?=
 =?us-ascii?Q?5RikAsbLwb4V62SPgsWOTIAZQc3W28uegYEGeN3qw5hAxlKXOmlkXB95CZQ4?=
 =?us-ascii?Q?66ylgeqNJTnd1W6gJU3mn8spGKml5wwLJZj5hUYksurSL80vd6pd38nqKBla?=
 =?us-ascii?Q?LB8Cw7wfBYWwztpVhOCN5YRHGhKQo3qoBoZH27rTndAe7eABw3jO02o/O7pQ?=
 =?us-ascii?Q?zENShqra5mkCpM6iXrSDVx4CAorrYIMIU9dFh8hQXSBo4N+Q6rH9EiPgkvVp?=
 =?us-ascii?Q?tgtCx9aEqFB/X6L/sqsJ2ps9Crh4bNzQN5lGaVn5RC0YJLAk8BaPchx2UHXd?=
 =?us-ascii?Q?3uhdVloEOyPKnHCxLx2GOTRdLSDNhc+OgyFsygI4CdhhQred17N5/vfzr08f?=
 =?us-ascii?Q?3r6NS/UOKGgjBNf+kOeVq99i5S4PQZkDqR0jPw8KYM3aLrtU/dzTomPC5aZs?=
 =?us-ascii?Q?Ra5yuwzP88rod9wek1WnF4Myh4wyAxUzehjRRD55kf83CzF46VjyUzPvXM1p?=
 =?us-ascii?Q?FYIgaYFTHmhP5fp4u8GU733dZ7imynS1hcn2QjaBUEe2eo9E2uML5zpe7mTB?=
 =?us-ascii?Q?OUs8VWqASZEuRvtdlOYFylXpaycbZhRAFjuRacEnJHkMmt/AaLyeg7uomkP8?=
 =?us-ascii?Q?JJGlti5m+vfjJiJa9s07i+HDyHEy2InEDGCRSF88SONrgd2s8XKKieKN3hss?=
 =?us-ascii?Q?t7inpDjQbeKa0BeNWcCswKuVINoFdiYCdeNdmuPL7vu4UfDSxw7IJhzcqTuG?=
 =?us-ascii?Q?vwiZ2D1XwgRYLrhKitUXlGSKJptGeIeEPxjbOLzQc8O9WmRXhGt5EevozKwZ?=
 =?us-ascii?Q?IYUHxQft6X5k2H8bk0Pl8BBxDkc6RQaaDeOSvFkK6XVsHLNJShl90J9Kf38k?=
 =?us-ascii?Q?eYFPpLMmOkRWVZgDu6K+TyjlqFaTWDDQYzCAmOw6huPcQ4T7Pm2GldSJnIFn?=
 =?us-ascii?Q?+1F/c/j2OIIRjBYvfGilHCeOQ3jeXJi3Gh0jh0NPjO2IFzU+yMMPmQ+xVddo?=
 =?us-ascii?Q?CHYjrArBxgE0maowhlDKj4Q/EpJF0hrlkyLyaWo+7rViULrstVlsdtywgyuX?=
 =?us-ascii?Q?pQgdLT3KuflN4+pjC0e4T6oygVYH1XxCg4xXw//6CfSte1SPwGKl5g2n0kXa?=
 =?us-ascii?Q?kRmdNN5HqrwLSQLDJcwaGTJRQUptZaHEAha8YFoMpPJZWJCnFG5AJjM59iKj?=
 =?us-ascii?Q?ehRlODEaLFFil1PXuwefxYv297172ho5X1y1UKHFIVJoJEpevGPlmUj7uotU?=
 =?us-ascii?Q?0vAc339N45zp3T4qFDjP+VJch8ZomxlRP//1DPXfxpiT93so5CaRIDAGratM?=
 =?us-ascii?Q?u9NI1oLehTACKdU7TvXa7YqLdYWGAiHXl0CWcxYzAMd/WwndgAkUeu9ac9Em?=
 =?us-ascii?Q?4Hf0fH/HDZKhUPsdS4yL2R00RXME2B61MCARyGRaapW/tWnETFKC7ersMsNl?=
 =?us-ascii?Q?RvM8EKihQquDqZpryDLZuok5c6/JIPwl9cU2OP0AVu7EkhlUip6sWP6qeaCC?=
 =?us-ascii?Q?bcl6dzfgkT06fmNJ/ULTVRBwWsX2ARrBvNtK/GK2?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 02b4acdb-23cf-4e3b-23ec-08dd29795eae
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Dec 2024 08:59:01.6042
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UWnee6JIYJJfb8Wui8HZiW/YGhr99/euJW4io3pquoibXT8BOrfKXU2LAU3+geFfy3RZEZLtkVFk29TgD+0Srg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL4PR11MB8846
X-Proofpoint-GUID: MrKI-WUinc_Sw9MyWvrHdRR57ta5-pex
X-Proofpoint-ORIG-GUID: MrKI-WUinc_Sw9MyWvrHdRR57ta5-pex
X-Authority-Analysis: v=2.4 cv=f8qyBPyM c=1 sm=1 tr=0 ts=6773b25c cx=c_pps a=o99l/OlIsmxthp48M8gYaQ==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=RZcAm9yDv7YA:10 a=bRTqI5nwn0kA:10 a=t7CeM3EgAAAA:8
 a=VwQbUJbxAAAA:8 a=4AlgU9zqqJ6Wsp_O3zcA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-12-31_03,2024-12-24_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 spamscore=0
 bulkscore=0 clxscore=1015 adultscore=0 phishscore=0 priorityscore=1501
 suspectscore=0 impostorscore=0 mlxlogscore=905 lowpriorityscore=0
 mlxscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2411120000 definitions=main-2412310075
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 31 Dec 2024 08:59:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114602

7668d820 simulate a MCE event happened during TDX guest context

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta-oe/recipes-support/mcelog/mce-inject_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/mcelog/mce-inject_git.bb b/meta-oe/recipes-support/mcelog/mce-inject_git.bb
index 08ec8c574e..8fc8e2b5e5 100644
--- a/meta-oe/recipes-support/mcelog/mce-inject_git.bb
+++ b/meta-oe/recipes-support/mcelog/mce-inject_git.bb
@@ -6,7 +6,7 @@ SECTION = "System Environment/Base"
 
 SRC_URI = "git://git.kernel.org/pub/scm/utils/cpu/mce/mce-inject.git;branch=master"
 
-SRCREV = "7668d820cadce2da9d90b72aab14c3e637ca47d6"
+SRCREV = "ca81c1dbed5c7e30fe79d44953ccfeaab98d2b4f"
 
 UPSTREAM_CHECK_COMMITS = "1"
 
-- 
2.25.1


