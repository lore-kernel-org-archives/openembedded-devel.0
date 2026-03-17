Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AECB6FED9E7
	for <webhook@archiver.kernel.org>; Tue, 17 Mar 2026 15:28:51 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.78868.1773761329616149143
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 17 Mar 2026 08:28:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=eWwerbMU;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=7536f4cc45=yi.zhao@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62H4flxJ1218892
	for <openembedded-devel@lists.openembedded.org>; Tue, 17 Mar 2026 08:28:49 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=5vCIsjKosfEJpDZSed0P
	BN1rlvb5T0qvyK5zXQY+4/w=; b=eWwerbMUTcM03lQDZ/rHHfyhVqlPu1rOzaCV
	wadpOQoXQu+L+ySS4HfT74Llu5g5X3a9PGG40BhMaixmJKBHcjelwTqDsso3QaW3
	zUofLJbDUOgbU4wPZwoUY3MybiGbLSmPF2e0N4/8gEAykq0B452bAK7/ZAmro/Pn
	NWalyUDk4t48yA2naa1R0p6hwL/01xs9rkcdMAmuDnF5Sp6cvquYFXvKdzgaxWIX
	o1SCIQ2cEhNlpwqmiJdiv+dswf0pOlnsKrrSXKN5VAWR2ZhHzLynTPWg9d/DPN9N
	m56wS4uTJKcmlmAvbvhJj2H7pGfpfcWffv2Iws1/PifdPUcL8w==
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11010040.outbound.protection.outlook.com [52.101.46.40])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4cw2y13cmc-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 17 Mar 2026 08:28:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CF73jLmR9s8YqfltRek0iNsoJN2sMqcTVUXYpWJOQTd/JCFl0Is1F3hZHcWIpHhZqS4cVbPy/NtRDDs0+PzPcdOtWuev4jpumzxv8PbZ3KhC0mxuOYsMRRLP1WQ/MlgHVZlwexIdJiffdczI4hXD0vmFpds36yCkBQ8MO4HsiQhVPXeHKEaGNbN+7aY+Y3yDSnlKYMYXjI3MMduXT8NSQErQCKrx/b1vTCIx8c/kKqKiybyRGmpByd4DzrsFaF/h/ULCTAPwm9XKWk34eAjBE6DJeRfIk0kqeU9lL+CqdRQfl36fAWQIPSE3rh9WYtr5y4zwnHFiOCvBqcekCIA/rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5vCIsjKosfEJpDZSed0PBN1rlvb5T0qvyK5zXQY+4/w=;
 b=hJHwOqQE1ekg/dum/Nt53extBpxtF5XlmveNF/Y/EL7PJA3daPRrhPOExcJwSkWZcH95XqazbVyU1SLz073suE7bgO70ssEW3MexxfprUifUiZexaaW1MEhtiUXpbVTWSYIsPRQdZNH6qhEcAPEdRHNW+akXSFwGNmT605GvPtB06nvW6db0o6tS0a4fFCUWj86wMYaBO8eCl4ukzxAK2TRaNBXJLZISQRRuF+Is/k57AvuXpVo3X4igvwKWVCJKZPA7Ar1EYyuw7DO7aUHrdSMG0Ih9C4rhDsKLqx5ORPRkEo1vzRLQg7Chpii1N6i/msf7x5MjdaUqdEOKRBingA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 MW4PR11MB6739.namprd11.prod.outlook.com (2603:10b6:303:20b::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Tue, 17 Mar
 2026 15:28:46 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::3432:2eb3:d0a5:7831]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::3432:2eb3:d0a5:7831%6]) with mapi id 15.20.9723.014; Tue, 17 Mar 2026
 15:28:46 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-filesystems][PATCH] ntfs-3g-ntfsprogs: update UPSTREAM_CHECK_GITTAGREGEX
Date: Tue, 17 Mar 2026 23:28:31 +0800
Message-Id: <20260317152831.2506017-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SE2P216CA0165.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2cb::14) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|MW4PR11MB6739:EE_
X-MS-Office365-Filtering-Correlation-Id: 4c9508dd-92cf-464c-e5e8-08de8439e146
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	1D8QHBDVDCzS9ZmxkUn8QvRpMXAVCTL6NcdKm50aY0TIx/VIQvsCSk0UZyqLsx9s+NqTX1zdNOpS9sdN9YfsBwgXnfwLQnKiZIp8CzjPck3CPOtmJNYs0Ndl2RtieK5EcpGS9wqkpO4zJtuOTOY0x7CFMf7x+n/Y5sX+ubj072PJyLa+nf1Al9aRxlxREJDnkkrJIcmXDJ1WkVZsStkoEtXLjx3vfodF4LLOuy6Zd8EEnLHga9i3+aLlgnZIiMdPXObHhEX1ScelbP8tk4fvbADAn65x4PsZJ+oGi4AKsXIQXhN0XDrcz2v2P9nIfRvSTOE8XvoVKoCQSXT6Cklm94oQJ6W5T84ARBpUdrZJOt9BFH+mZg8jn2t4bgfGj4S74zMjHlTXZ1UXONYx9Sq+QoOivk3s2A937TYb5T/8xgMoIwMZ0xjs49THckuecRzIqXGfnCrZnAmPqS7NAfvn26qfXiM2yqNd/YuBO8dzjq/UfJzJumAk3yyZI/OcZZxocW0eD6w/dpIhbxxGfP8fRVWhs7gpTk5mifXzyOFleWMDoDgHE2uaMAIrW5Gc0FZpk3RhUKQyru3E9gAPomhIA1NVceYwk0uaBZoUnMe5PU6lO9tgmLbp54k3YuOkfPTpki3gKH7rm7AABRmvqRGItf00tT9xd6RDcFlUexiZVQoNxO/83fxAiBNNAcGvXfbqEYArAatdMmJnoWJ1y8K1LCEeQ+odHxsBnALpAa7ZV4OvawZTXUFqnBB6XaGIzThxQu789QlFXgBTSN6QIgoWs5YZ7G7EBsSxYh6+viSz1UA=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?6UI5alc8NDYU7Ynd1kcDVuwsIHQf9bmJwY/lLRAfywT03u2Mr3LryqiqmK14?=
 =?us-ascii?Q?vxAZRLvr49ZdFuLx0zxH60qG/slVZ4DLUmXLbiybcfN/tfDl+BNdDm0wkleF?=
 =?us-ascii?Q?4rOw6I1nByjPAHBfH8hzPLCfMK9+ImVxb86Uz0UshfpTnhoeZhoJQ1+IP6E1?=
 =?us-ascii?Q?6ExwiVjn2O4y4qbmbUEXpeMSwASgB/j5zySVhUBhJASX+6vWlABe2y/L4KaQ?=
 =?us-ascii?Q?7xtayD5cXjLNcxSUtPkaPy/ghP2RPKiGwqZfXH3RM9UVnG7ztMPwSSbTSJrk?=
 =?us-ascii?Q?dSWmFoY36+peOnnfz4FaKMPwzPccbemAmklT8X+Ee9imEJlTRjRjj3k7f+LO?=
 =?us-ascii?Q?Mguy45eVsKXVW07J1/kCWdDTooxgqJ/8I8eIkQPL0xkRGZLEzbWiEWP+vpUS?=
 =?us-ascii?Q?WUl+xW7Ba9eNCz+HzQWvNHLtN+hcznpSz34WyxkqODNzdA8Ic5UiYQmYpc0g?=
 =?us-ascii?Q?TTjbO4S+CYsrGICg/5OxmdyxSDJ7P4I7a7AEoczVFZrqGDltwNxuJKOcKEcK?=
 =?us-ascii?Q?+WhKnVenjBKyAOtfRnBb/HJUEhF2Tt8wNXLtBny8oaRrC4DcnQ5+FwViBbjB?=
 =?us-ascii?Q?UwhpldY/zpMqBTsPbloSGtWtFVYyqd2cUemCPddCKzOrTFOW9cQIt81f7y3h?=
 =?us-ascii?Q?TriMAWyF+WElN2VRZvc1olXtLT5me/jlSEAw+eEjs2kyWnbdRbiIbTICmyYi?=
 =?us-ascii?Q?3dqFc8bxBBK3358qBqdpiVz+27ZqPBoeQPy/CEpSn1XqC8KbEWVQm87ZRhAv?=
 =?us-ascii?Q?Wk4ZOkY+bgpl+Judj+tfqY6OomMK6ojCMZpuKGSwdvhUxYcmetYDXV4tAHhT?=
 =?us-ascii?Q?5jE+RbeUaB5X1TgksdW+Qj9Po1kOyViuggTUqFleKNhPz6vk1YigxPYfJf+O?=
 =?us-ascii?Q?EWEnqmmAQVETjE6V5AL8QXaZ8FIAZtmc2iusgTLNgvwEeDAEhkq5wBtzWvRd?=
 =?us-ascii?Q?ndlAdvftPj8/zicTHwXKY3DB+IuPZxdH9SILu3++Dkau5E43dHYPEogeDXEn?=
 =?us-ascii?Q?K8Pt4w7y1N/UUP93KlSa3Wn4GCd+b5AVYYxBGH0dT502JlgT67Rm1tov74al?=
 =?us-ascii?Q?Xd1M6lvhZ0Nxm8vzbN9lPmWiCI3F4s7lQUrx5LEhMfXwMTxd8nyM4E9z9T9Y?=
 =?us-ascii?Q?pEOxVjYm+4IA1OBQRwm8aORbDc/QvWoW4yeyqWnldl93maLwAWOw2WsOSKmu?=
 =?us-ascii?Q?78agmEOq3QlOPVqBoaaSAANmy8/7HG3J5FG0jCICP8/zOOnmd2xdnQ8vHWJl?=
 =?us-ascii?Q?UJLJJuQk1Z41mhMJYLYwV+iIIVs3YDYwmDxHh1T2wRvuQ54wRJMVw0rVdcgc?=
 =?us-ascii?Q?WpTkhN7qO6TMhlGmPCprTruKlHXZM1JA5idmy23FzFls1gUhHIdO2TBHMaJS?=
 =?us-ascii?Q?IeIg1lVQ3ek0hZM7LHZmxgPA0so5t4IJeeZgrQXLZduToc3Jz1+DPl8YJwab?=
 =?us-ascii?Q?3jKLjEyN/H5cU1tdr0ahBaOydIyLH5mnBAPzWMpG8d3ld3yP4SF6PH66l0NB?=
 =?us-ascii?Q?uWYnzJ0U4mqUeQWXLjVVhQOtET+o4G293sGtz710RbMRU0yCfEbHyE1c264f?=
 =?us-ascii?Q?yLSLLJrYGlJNWQNvmhVUit1Mi64qVyoUUubnTGy0wzcrqfvIC9EFFpUlS+Q4?=
 =?us-ascii?Q?8tnpBzMZ/v+YX94MZihjiB8wTy2NDtrZn+TmrZsWkNYVIUnGIx9pFr2q8eO+?=
 =?us-ascii?Q?AxuQUdHg1TPFprojL5ZeAzDjvkw0LeUieuVjZgiEbjMdGPcOvbcVZ/43AFcV?=
 =?us-ascii?Q?i49a4o1xgg=3D=3D?=
X-Exchange-RoutingPolicyChecked: 
	wnb8++fO9g0p9VrHW/zvSRpjerInVwc03ZYNmdPaMIwgf8JiZabBzoJSjoYykyyYjfDT25HiHHxKcEg7/9OaPJT2Jskhknf3I9kN4wFuzvlhkMQ69ItlOEtpwPmEQZkaHzC0/Jcp3x1Phw2ARLs26ydpxey3DX7y3IU1gHb3dLGxjROwNDoarGYKwejgno3Ghvy+harWbmBOYfPTt8ydUJqk1PSUFCo1HUERH95GI560yCpm5uDP1jszsgWZSNFxlo9XlzmIIuaJ7PKWrE+5qE0eiuzn21dR+pM5d+/AFcTzMYS2pwGNa/UXAacRHLG/zqF5Fj1/DibmYJYyH6LFRQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c9508dd-92cf-464c-e5e8-08de8439e146
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2026 15:28:46.2280
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NXawJcaagvd1HUpm8K9f+OIL1Ioo9Mv/BGgbRh5joeoohuZboruGA4FqT72sfioj4suSLfkLHzE7mIaldVTAMw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6739
X-Authority-Analysis: v=2.4 cv=CekFJbrl c=1 sm=1 tr=0 ts=69b97331 cx=c_pps
 a=AQ8jqBFaYtg5UXnSSWtk/A==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22 a=Pjj3pwTvAAAA:20
 a=t7CeM3EgAAAA:8 a=NEAV23lmAAAA:8 a=195FDWGPKEdAjbawqvYA:9
 a=FdTzh2GWekK77mhwV6Dw:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE3MDEzNyBTYWx0ZWRfX+1qpFLL2+qdA
 La3WtWm6Sd+8c+b5GSXxWkYymlT/Fq4ggJusRyqup74VS/F2+8YQvA4v/1VsiH+8KE9YjiDV96q
 0poPHarO3Zi3pB1gkvc3ADS3V91lchEz0voz23swVB6X9rO5O3kNFCEQLc6GFGAl7P5SKnqxN2D
 jdk8z2NWD975UZsgSkEXdqZZHEeJjTY4ga1hz0Pw8uxZdIrqad5UBQna12ympmrA5YavcqwT18i
 3rIqvnsLBDfMtWaXRVMW1gApfN/XmJXdHrpHqRyy3m1AB1yIS+oe7bJwv2AVEasJRATVcdW0pMN
 iONwHqYMDVGdhUEPueKc0tq+teDTWNB9XqHVH+r/5jRdU0C4dQXCnfzbwpBH4KhHVB2bl91qnMd
 OirAaZqcrweco6Apw+58lQFf/gthAGJUBMFd6QwDE4PpwgG6d8S4Wm8ilgAoe4JEhfEwGWfxFZ4
 1XjGRLNKtZbtt0PwJmQ==
X-Proofpoint-GUID: OOOwKIY1lTQsaTFllOAonSjVTKOHoFNO
X-Proofpoint-ORIG-GUID: OOOwKIY1lTQsaTFllOAonSjVTKOHoFNO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-17_02,2026-03-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 suspectscore=0 adultscore=0 impostorscore=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603170137
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 17 Mar 2026 15:28:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125319

Update UPSTREAM_CHECK_GITTAGREGEX to check the correct latest stable
verison.

Before the patch:
$ devtool latest-version ntfs-3g-ntfsprogs
INFO: Current version: 2022.10.3
INFO: Latest version: 20070925
INFO: Latest version's commit: e859b1b1099d6fb8080f84db7f3790ab2bdc92e4

$ devtool latest-version ntfs-3g-ntfsprogs
INFO: Current version: 2022.10.3
INFO: Latest version: 2022.10.3
INFO: Latest version's commit: 78414d93613532fd82f3a82aba5d4a1c32898781

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../ntfs-3g-ntfsprogs/ntfs-3g-ntfsprogs_2022.10.3.bb           | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/ntfs-3g-ntfsprogs_2022.10.3.bb b/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/ntfs-3g-ntfsprogs_2022.10.3.bb
index c91e18a0d7..3a7dd783b9 100644
--- a/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/ntfs-3g-ntfsprogs_2022.10.3.bb
+++ b/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/ntfs-3g-ntfsprogs_2022.10.3.bb
@@ -12,8 +12,7 @@ SRC_URI = "git://github.com/tuxera/ntfs-3g;protocol=https;branch=edge;tag=${PV}
 "
 SRCREV = "78414d93613532fd82f3a82aba5d4a1c32898781"
 
-UPSTREAM_CHECK_URI = "https://github.com/tuxera/ntfs-3g/releases"
-UPSTREAM_CHECK_REGEX = "releases/tag/(?P<pver>\d+(\.\d+)+)"
+UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+(\.\d+)+)"
 
 inherit autotools pkgconfig
 
-- 
2.34.1


