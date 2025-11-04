Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73282CCFA00
	for <webhook@archiver.kernel.org>; Tue,  4 Nov 2025 08:09:31 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13170.1762243766298996225
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 04 Nov 2025 00:09:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=SYrF7SMK;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=34034774f0=yi.zhao@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A47J7BH3624642
	for <openembedded-devel@lists.openembedded.org>; Tue, 4 Nov 2025 00:09:26 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=Y75MS8Lvu7hDH1ovKcGw
	VzygQGrgAlh74DFTjuPklGM=; b=SYrF7SMKIlKCuev6NzCMMGhSMuPsffcdH/k4
	ivyeaKr5/FmxBI1jZ97TrLgQTEpz0v0m1T0dayPxory10pT5425rYiKIrdcs7OhN
	9ajRIkRG6p8v4D+wayXyq4u8bg1gYvAKpwp3FYGyummzeTrWBsB6U2lcWbmOfCyl
	ut+b1u9nlhpj/mcXFwdq2KvpOpyKD/bgmXwmHZF9KIDnR1F8d8KbZtLtfhAnL9uX
	3Lh/TpSyqDEH++uiBT7QAkgcD4W3F4h0H9pNqQdHsfCXhK+QDosIpq86483FaWLq
	A6R77gtFKWot6hhqxyIRjWF9VbjFW0ircGEaDpLB1Vda0lo5OA==
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11011064.outbound.protection.outlook.com [40.93.194.64])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4a5dfy2pbv-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 04 Nov 2025 00:09:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hY9a17TpC0EszuFOuz5p2NME0RsV2NXKuyP0a6Y5LOEFMj/glJVofcSJypDuGM4V60A9pKDOuO03XrAO9l/qMbY9k5wNDchfJ+Pm1VLPz2z39+IFMIYaRVnb0yRPs3LBLzmNcx5We2oY5pKIIxnbbJsnzuFIqDlcddADSn+z0DIBkyaAQRprC6knc/B9B0Sb6sz603edKQY5ztV5xlFRabmDszJ3/oNoTUp9xiCbVHWnIDUGgwv6fzP7oVDOaJZiGUvUjDrtajmfwic7KWG/H+mC0nH9Pym+79n6bxH8KA/bNCPmZedmjlvuCGEvMssJa2yxdzjdarLuEJQ/jftApA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y75MS8Lvu7hDH1ovKcGwVzygQGrgAlh74DFTjuPklGM=;
 b=Hi2PaksFyAi/Th4kfFGRbwDVrV4jkCR9APspvkG3A8dLoZlrXrjFMCf8gpDIvfwbb762j/BRI3AgRvTlf3gtTt68VeLlGFxSw52AzcfH+mRvAVJdMjrCqm0d/URAZvjZcqonAiLqY3CIwTwAWlKXxz4XaUJ7QL+fjypcuhks57PEPs+vfbJHycuN/bMoIqaC+IIN6cIgWzoU9lqQDTfjESzpLKQX503jKfb98ft4dR5AKWDK/JufzVpFdQZLP7dV7v1kHeeSLtSy1OcssaDFVlsL5I/uTv3ldQZ4ChvRoBBXJUKaUu4qvo8INhRgMqYHSNaHaNcnSgyIDu4pXs+BOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 PH3PPFBC2C58BB4.namprd11.prod.outlook.com (2603:10b6:518:1::d47) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Tue, 4 Nov
 2025 08:09:22 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%3]) with mapi id 15.20.9275.015; Tue, 4 Nov 2025
 08:09:21 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] googletest: upgrade 1.16.0 -> 1.17.0
Date: Tue,  4 Nov 2025 16:09:06 +0800
Message-Id: <20251104080906.2964572-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0032.apcprd02.prod.outlook.com
 (2603:1096:4:195::12) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|PH3PPFBC2C58BB4:EE_
X-MS-Office365-Filtering-Correlation-Id: 42d179a6-608e-4d82-cfb8-08de1b7975db
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?84BGzhbDEjHMNP2NbbKPMf4jEST398hm6uEwcUo0jgpV/YgqX3FYNlNANeRf?=
 =?us-ascii?Q?1wDQPDS7SDUmSytGFZ417HA4vW6Waq11xfNE1LfIm4HVhlCMZfU1LmtzrF5J?=
 =?us-ascii?Q?dWlVgT44WewMSEDxICQQJpr8CFw9VayqPU1jcIdOUO6BroIjrB3f0VNUY2J0?=
 =?us-ascii?Q?/ayeDad4LYjjHajmbu4+4klzMb/PVCMe8Pn5y7J3CXiYazEfL0QVj249h9bm?=
 =?us-ascii?Q?4PIN2ljNKSRQSdU+M3RxOw/Z91GIiHOcdbRa33xIAwtj5AKojyOf3m//lG6Y?=
 =?us-ascii?Q?HrQmEXPd/rmtvUlDu8YEXcXn690NCIztJM0qLmgjiuSY4of9heWnpiuGpS8h?=
 =?us-ascii?Q?jvWMCLcla81OYvF5w7tMglngm3oYiLbUlcXt+G1Bsq77X1crItm9JjT6XPQy?=
 =?us-ascii?Q?wgw6Xwt0iVl67cfKseduZKcffJRbbV4k5N/cFJOHeJcEEEb57VO1BjFV42s3?=
 =?us-ascii?Q?SIuisqRbRYDOiZtGC6Y9npAN/pYswTqKqF6o+tTWWcMTNGaT+ObYkv25y6fG?=
 =?us-ascii?Q?llamCcvLL7CwoakcNUjFTcJxBo8ZPU43TeVBMQznD4FwncNH5M7zmxtwWzpD?=
 =?us-ascii?Q?LvNteVEVYVVQUaWzRpiRjs0vMu2aNUp636OlglTsq2JDEuScfEJJtTSRhVJ+?=
 =?us-ascii?Q?UoLW4KDCW/any/00qtljiJwrA9GNPOat+03LgDKmwnHbuZ57i2efCnbZy611?=
 =?us-ascii?Q?CV/H+zAtvO99nfNyx/kTa6wAWCRCEbq/JGGw8+xnghnRICY6pHKsGPo7aluB?=
 =?us-ascii?Q?z1eLhDhUNjikeJpTPMWBH6rPWeyjHeSlI49pkldP+y+djZG28hB6chhMpB6u?=
 =?us-ascii?Q?L+YpMe5bFlEVYU5V/tI29Mpi4YnZWKWJrYIBppd/hDhY4ojWfExJPVGGgYRB?=
 =?us-ascii?Q?Qrg1FYo3j8m82k7Awnn4vMRVUIEuoVidehHO0GWFhrZzpza+Dg9bbZkNmhKh?=
 =?us-ascii?Q?cyqfJ/0vGINiOHrjTqYPHJ2UwB67Fw9POF669OOvpBnQMaiMh+Xef13ErI+Y?=
 =?us-ascii?Q?xJI7JL7skjJ3v6O7euntCdADVoFRy+AwdmemGPQbi/jbFuu2ditZClSXVQRL?=
 =?us-ascii?Q?ioRk/+0pXpD8zRkHpIgsl9T3fWXYC+Lwv7NG+MCTFwu4jwegDtoXkVUhvtlo?=
 =?us-ascii?Q?B0lOeyysGy1hX2g/GAQOsihsWpBj29EmRliGzEzrTML8LhadOt8v3hUHG4q9?=
 =?us-ascii?Q?rmK4Nm8KGm9Rb5Sz2P9qN/0zvq75XjjzSvPFoveiIarxb1mQVS+czKjWzSJK?=
 =?us-ascii?Q?J9s5fWFZoMoqcU4tLIMmdHyRM4unVpJwDceCUzwOiRVx9+cYirWJhNa11//D?=
 =?us-ascii?Q?Y0PO/WceknnGtIwa0KOwFU68O+P8RS3PsgJin2eJ8p20QhzHg4zGhy7UuWLd?=
 =?us-ascii?Q?iLm+7WIXRsQdL0hIIiMaV4hrHJt1BAN0KXbGbdzTiydf6LKgqmU5yp84wV3D?=
 =?us-ascii?Q?pxz76gbxR3g6DFYmKpVzyFU3sBOpsie6DywoNm21KLMok0n7AWamAQ=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?DSjStuY4DZrZjqE17a611zg6ysMsb0R2psXWXaE/1iL/eZPe18/IozMp6pPW?=
 =?us-ascii?Q?kmn+we4xMmazP/0KC05dyCri1i73OOEmoUsoY57tZ4Y8Xz28EkbQJBIcBXd5?=
 =?us-ascii?Q?kPSXEaRC2NryQ+rIXqH90JBK07cRzWZ/LGnsF6zwkAMB+DdOsCUi57T8r4G8?=
 =?us-ascii?Q?FTjYVMZ7kuvA2n5IQhSRHIkdY7v8UjRZ+rkLMtoxMgNLEe5d4lNrKmZq7Y6J?=
 =?us-ascii?Q?ZBtOJKWgkowln7z4eB6+tI6vFXjuOA1gKmm3UJ8NHzsQ4dXvcSYd18LjUJVx?=
 =?us-ascii?Q?1P8+cC5yCn0dQ8PsRM8Gg4rnw+zqnydCzs7LXCDQKxQFJAPN3ljoDvGvTBWA?=
 =?us-ascii?Q?1ZoH4Hz/w+3vr/ul7S6A1n7r2r/MJ3YD0sw7noFh77LCERdShcZ5mY2YbPlr?=
 =?us-ascii?Q?3TXAkF2ijURWdGaFsTZc9JiGyhLEAL3vjpGv9mK/BWO277r1+e50zCd32dpI?=
 =?us-ascii?Q?ghgrDES3eflLSCM9LhA2NsyEL7vSpEuF+IUOtvCAa+k6U/Bjmy7i0eTVS6bJ?=
 =?us-ascii?Q?m+LFbgNB9z5eS+Kw6Qi1llst1cwPqfQTql66n5exh7lYQ5nQiOEmlkdR8LuO?=
 =?us-ascii?Q?6picemigOueOq1jd35RtdVUpOwL9bjAAE/c4tWnmPRwIh4vJM1D/5rNTrkjd?=
 =?us-ascii?Q?BuEiAcnVvTJawekO8a1H8/iFXgJFUgZGRyepKip6cTZUdOcQoGn4+PvzSqAq?=
 =?us-ascii?Q?MsgOdg6yo6p1Npa/NCjbF3bpKPfcsL1aToBa5JVoGS8m7H5qilMVTyK5XetC?=
 =?us-ascii?Q?pV3Ma5nHZbmmxCEB9MLRi7MGYM/QnMheXTXaZaUlEiMUjqhkJjPWOTszCFZB?=
 =?us-ascii?Q?5gCDyCLOPgGQku+0bTqTw/kifjMKjDhNZbRITeI90ImcamW7jHPUywudnNUv?=
 =?us-ascii?Q?m/IE2vJsewCQAhDR+7HoTcfS5Oa1NwQ44iGFgd+WgTnPMqUvLA1HlbJaXk0g?=
 =?us-ascii?Q?zBSuFgGDKYJLf96yW8LzsveUc5T1y4uInt6w8IDHu/0N1VKybyohvOibhF13?=
 =?us-ascii?Q?cHOqP/cW6kGrNxRnUCi8xbUe91nzNVn5CfHYJw0CYqF+JDvKKDoXK9KAAreA?=
 =?us-ascii?Q?fJnZOX93KLw9LpkIp9gUmO8fGMdL0X4eWpdkgQJuIfSNWflIwG5sobog5TxU?=
 =?us-ascii?Q?T1U5PhYOBNaDIqNpGwA4DJMBBzAWw2lTb7/9QqYAcDhGcclnbqT4Jko2NFgw?=
 =?us-ascii?Q?6xbW08u7ocu1mIgqbOEwR8W2xqtqJ4hCAFwKitskfSgalctK+2t3oXeTi6D8?=
 =?us-ascii?Q?jLtmxlKLFZIq0VnoDJM9kCKmxC/IC5HJbMH5De0HYUa7lsCs+tZlSid8lXph?=
 =?us-ascii?Q?Dbw18hpS4A14hDpR6m4jdH9xqTSxndapirtdovMRPjHKKK0VFtAYg7zvEy0o?=
 =?us-ascii?Q?jk86GozKDarfs5/eEI8iU09lJ9EFaS1rAkPnnK6GhLgZCuGwEQOPH5N469zg?=
 =?us-ascii?Q?RbTn5ZBW2jiIuWMDL1CMd0sPFosiFbAJflxFe9KBF9GqCOT1gR2x0NLwOAL3?=
 =?us-ascii?Q?LfvFZwkYp3xmPq1bRzr6Xo2SBq6AdrpwNe3tn8q+o2fmyIflpDNt5jaossYL?=
 =?us-ascii?Q?cqgQxqHnGjS9SfF8XQa6fd6PnL6FJIuPH1wJqz4V?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 42d179a6-608e-4d82-cfb8-08de1b7975db
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2025 08:09:21.7631
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UJJ8H64btuyD7ZQWAVNoiD7mEq4c1BFriYm4W6xRPD7Cy0J7r9PHavtmmuYTQMs1bwuRBSDCIi6s8bNs8NcNnA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPFBC2C58BB4
X-Authority-Analysis: v=2.4 cv=G5QR0tk5 c=1 sm=1 tr=0 ts=6909b4b5 cx=c_pps
 a=cAYAfY5XwGGlFG+HVYY7CQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=NEAV23lmAAAA:8 a=vTr9H3xdAAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8
 a=h4hIfcAKUT8BvTOe17gA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: iNWhJ3KsY3lEQ45VCIcL9-BH_m8OvvzD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA0MDA2NiBTYWx0ZWRfXwPkVSVHfN6Ra
 NDDLMoRgQBgGvBSy1+IalRAMof9SU4r+UyvcKqVbvHTPnB1RpFqFcjdcIcqbiQ+WgRkzh86lNLi
 8T7u+PFfTzTwAEja/nuOnOqREprYbjo+I4efcfGBayk3wFtzl7KWJc1JIe2SqujwozOHDDZk+Va
 AiKGaSHPAQeSTIQUT5PL2eNKKm8QJqUd122hnjr2x8s3ocAKaLOFA8hD+SlA/Fpt1tKawXTRif6
 dy/BmQdsUDHNeBE+lWmVonZsyCElwP5JxJQKN4P7O2dkFAABFLtftiRwouxFRMRWlbwoFo2eeSI
 N7AFoodf0pA4K9aGfBhSRiMumagkOYeBYmBTPzyPKoiP/nuLFsOcghHFTLzoCL/YKFgMpWjL6fX
 bXDPM0rOOdLUrKU4ptfwdqU5N7yszw==
X-Proofpoint-GUID: iNWhJ3KsY3lEQ45VCIcL9-BH_m8OvvzD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-03_06,2025-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 suspectscore=0 bulkscore=0
 priorityscore=1501 impostorscore=0 malwarescore=0 spamscore=0 phishscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511040066
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 04 Nov 2025 08:09:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121289

ChangeLog:
https://github.com/google/googletest/releases/tag/v1.17.0

Drop gtest-ciso646.patch as the issue has been fixed upstream.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../googletest/googletest/gtest-ciso646.patch | 26 -------------------
 ...gletest_1.16.0.bb => googletest_1.17.0.bb} |  7 +++--
 2 files changed, 3 insertions(+), 30 deletions(-)
 delete mode 100644 meta-oe/recipes-test/googletest/googletest/gtest-ciso646.patch
 rename meta-oe/recipes-test/googletest/{googletest_1.16.0.bb => googletest_1.17.0.bb} (89%)

diff --git a/meta-oe/recipes-test/googletest/googletest/gtest-ciso646.patch b/meta-oe/recipes-test/googletest/googletest/gtest-ciso646.patch
deleted file mode 100644
index 814912650b..0000000000
--- a/meta-oe/recipes-test/googletest/googletest/gtest-ciso646.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-https://github.com/google/googletest/issues/4701
-
-taken from fedora:
-https://src.fedoraproject.org/rpms/gtest/c/b3fe6f803a1e554971f70e1c3f55aa5fcb377b1b?branch=rawhide
-
-Upstream-Status: Pending
-Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
-
---- ./googletest/include/gtest/internal/gtest-port.h.orig	2025-01-27 03:39:18.963893931 +0000
-+++ ./googletest/include/gtest/internal/gtest-port.h	2025-01-28 13:57:51.381081952 +0000
-@@ -288,11 +288,11 @@
- 
- // Detect C++ feature test macros as gracefully as possible.
- // MSVC >= 19.15, Clang >= 3.4.1, and GCC >= 4.1.2 support feature test macros.
--#if GTEST_INTERNAL_CPLUSPLUS_LANG >= 202002L && \
--    (!defined(__has_include) || GTEST_INTERNAL_HAS_INCLUDE(<version>))
-+#if GTEST_INTERNAL_HAS_INCLUDE(<version>) || \
-+    (GTEST_INTERNAL_CPLUSPLUS_LANG >= 202002L && !defined(__has_include))
- #include <version>  // C++20 and later
--#elif (!defined(__has_include) || GTEST_INTERNAL_HAS_INCLUDE(<ciso646>))
--#include <ciso646>  // Pre-C++20
-+#else
-+#include <cerrno>  // Pre-C++20
- #endif
- 
- #include <ctype.h>   // for isspace, etc
diff --git a/meta-oe/recipes-test/googletest/googletest_1.16.0.bb b/meta-oe/recipes-test/googletest/googletest_1.17.0.bb
similarity index 89%
rename from meta-oe/recipes-test/googletest/googletest_1.16.0.bb
rename to meta-oe/recipes-test/googletest/googletest_1.17.0.bb
index 55d670a428..c8ed80053d 100644
--- a/meta-oe/recipes-test/googletest/googletest_1.16.0.bb
+++ b/meta-oe/recipes-test/googletest/googletest_1.17.0.bb
@@ -6,10 +6,9 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=cbbd27594afd089daa160d3a16dd515a"
 
 PROVIDES += "gmock gtest"
 
-SRCREV = "6910c9d9165801d8827d628cb72eb7ea9dd538c5"
-SRC_URI = "git://github.com/google/googletest.git;branch=v1.16.x;protocol=https \
-    file://gtest-ciso646.patch \
-"
+SRC_URI = "git://github.com/google/googletest.git;branch=v1.17.x;protocol=https \
+          "
+SRCREV = "52eb8108c5bdec04579160ae17225d66034bd723"
 
 inherit cmake pkgconfig
 
-- 
2.34.1


