Return-Path: <Haixiao.Yan.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF9AAD12D79
	for <webhook@archiver.kernel.org>; Mon, 11 Nov 2024 06:41:47 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.53531.1731307302761711861
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 10 Nov 2024 22:41:42 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=1045eb20c4=haixiao.yan.cn@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AB5M8tJ005065
	for <openembedded-devel@lists.openembedded.org>; Sun, 10 Nov 2024 22:41:42 -0800
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2043.outbound.protection.outlook.com [104.47.58.43])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 42t84ps78j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Sun, 10 Nov 2024 22:41:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KLIxLSiioeX8u5QE+CIYtVikDlZhX41kUbhSf8k2938IBvJVsd0D8vDuhpGGZV2ayhV+OZtXYqhl1ADPxo+aWR5moYO+h9vW+UPGyIFYkXN5kXQ53PzkiJXepzrLIoWhO3D2AexmcELuxsFLsKgJ2KDOLPypbrndFkQU/5lhtDisxyQlw15fBTE5Rr1ptnw4x2VwN9Geu+TKDrOJ6iBSHrcBX8vEtYzUvOY14bl4cFI2ndBAjmsfWyIJLwqwMjf8lqarYFJNbcdicnP5IcEyTHhFQneyMTUAlcwox+FGkoXFEHO9jR009ho06ovwRUPEVapOjgIWm6it4Rlf6ayFCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4oMQrS1Sk18ypbjoyXpuGlG0g1KG0k91RMhyqBTRU9Q=;
 b=WEnY62PcK38vWzCwT0laLezG3JCZuWCmdMrVOVqMfMxQ5s3Rvh7qO4Oa6wrOtCqrc9kC2IpiVpnomTpFipfx8+njzA8deQuEP/sre3J6pnAMBpIkKJkdsArfpvP+i8yHI5oH+JKxqfLlJlbCQuOiQuLcsupzPpdqvl8KPTsY9h3tmtYU8k6PaCHLH+QI0IGyf4FrJ72Wv8Kw2nGUMvHmSb2LBqkY+k6IOSOfvz81C2GGcby7CImxOjmsOoGLxpges4ZXAXzjcf6LhCrFlgC+fLqSKWNEFJLXU4IyP9XX2YROH4gHAtapyGvXZjD8kUqU1lSMGAx57Xn1CXAqZNBq0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from IA1PR11MB8200.namprd11.prod.outlook.com (2603:10b6:208:454::6)
 by CYXPR11MB8730.namprd11.prod.outlook.com (2603:10b6:930:e3::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.29; Mon, 11 Nov
 2024 06:41:39 +0000
Received: from IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e]) by IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e%6]) with mapi id 15.20.8137.022; Mon, 11 Nov 2024
 06:41:39 +0000
From: haixiao.yan.cn@windriver.com
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-networking][scarthgap][PATCH 1/1] openvpn: upgrade 2.6.10 -> 2.6.12
Date: Mon, 11 Nov 2024 14:41:19 +0800
Message-Id: <20241111064119.2832645-1-haixiao.yan.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0004.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:26c::13) To IA1PR11MB8200.namprd11.prod.outlook.com
 (2603:10b6:208:454::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB8200:EE_|CYXPR11MB8730:EE_
X-MS-Office365-Filtering-Correlation-Id: 94ea9f98-1c17-4ba2-ff1d-08dd021be534
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?EG8Q++nVXhl9tI8rSHaw6CW74UXVj3do0gqXAWAaEf+ELqAFKKhewkOwd0L2?=
 =?us-ascii?Q?A5CGkJwtCCZ8Wr602/0TD2ynjoTghlXM73aFwhzyZcTJB01UuEKNBzESeLsS?=
 =?us-ascii?Q?wBPOgALgnoPPF+V+JmFPUl+P6CKCCSeyJDE9m8xzzE99yE6P0O6MZjkBgOL8?=
 =?us-ascii?Q?SwYwUMJ8kKGNIB5E5itLrA43chnlTjJJfI9mDxGp+x9E5hQ9HMf3SaT8WqGW?=
 =?us-ascii?Q?g7xXnCA8ChAsH63YJ8Swh3v/PDHnjWG7yNDG2cSg7UuU4TXBteFVxKbx9eqO?=
 =?us-ascii?Q?35Y2hZ5YhYha0wwpZUji4ozy9BeHZcuqFlYvmU6mf8YgBCb0U5U1CLX9DDup?=
 =?us-ascii?Q?Esad15DEJqBsyrvNmB/8bgRvXZ9Ke2vKAeB1+aBw+l8MmObNkKf7UwoJ2fHO?=
 =?us-ascii?Q?XT27ONu3nEQ3/Y0fSo4Rfhw6IVqpexSSQbNJuDFAG0ufePqVSTWIqZQBUVlC?=
 =?us-ascii?Q?EDto3T8WEukJAvYwkGyyIVpMIkLH12JKKg4AARXHdLRT38PZdTYFAB/dTtaV?=
 =?us-ascii?Q?DVcjyy7T9ZV0ySA2XSDBpV8MutCU8jh2bOBNLVwuPxJxhcI7IcfOF3M1ummS?=
 =?us-ascii?Q?Chh9g6sKe/aP0CvBvU22PqBk1Pt2IjQmZxVKq824GV385E/DTSMy2ltwX2m3?=
 =?us-ascii?Q?MmeodEMtvdGsgHIxxy6IgojbA6rrrEpjFzBDnPXhXyyZe+KuKlyPIqzwQ0m5?=
 =?us-ascii?Q?Q9liVzW02GJBu5iUbV7xHUmcx/jIPgk7CrH9PNQHyJ3Uqii+osOjiYSRbMZE?=
 =?us-ascii?Q?g98XmKnqZmX70lcFV/hyTw7pKIALjCKvn6kya9bA7kk0vtT7VW58BWSkmwyH?=
 =?us-ascii?Q?QWIGU21f6r1CQi9vhl52mao6kSlnX9ZVWJEKg4n0pEpRypgqam0tP9kxH6yF?=
 =?us-ascii?Q?dsJjiKtUj2Rav4kZAPN4eqzMgdXKqQakgPMzYT/oCJT09u5k7bosJCGOLDPZ?=
 =?us-ascii?Q?QO1LG0fQ3xPSC9nsn5yi8BNu7bBpEs97Wnd55zEEn1LaOWX6DQH2VsRAHPGh?=
 =?us-ascii?Q?/DXu0zwUYqUEt8CBrFBaMjzSKqlBRSZzKSjkRHeUv6568lmhnZPW0HpNlGzJ?=
 =?us-ascii?Q?vSBwMCWAFTyQy2Gsa9lFcqX4alJmu5sRWQVlULdPi4/Loi00wMnlkhbprcED?=
 =?us-ascii?Q?2Xo8hPBqjQ9SE29gUIgTNWp9v8ltmZkHramVF2PZUNsknM0XXOWBuQl5Hh9p?=
 =?us-ascii?Q?o+1rLFxGCwL1PXf2RYznabMZnwB89bl4yZ1Eyj1eEKa3FGqPt+BJaBivQ0iF?=
 =?us-ascii?Q?5wY24BhpD0nJvhkd7zWOrU/g0s4kIyAHZ8pDWR1stRsg7J9EkgQWx3t7t8Ce?=
 =?us-ascii?Q?wXIXrnfmJsMxghghZ1ZNsKATknlGnHcYgj2NAvcwDssG1g=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB8200.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?YwL3yCFN/faXmjK4BqS9FPvv/Vb3GIX4Czf2YsrTPgkPEVbcLrsotJ2A0Rxn?=
 =?us-ascii?Q?iU4/nMgXMBZZJhegO9sePdrttcUCzG3lQ1yUfXihx8WaQ0UURas3TKU7Wo1S?=
 =?us-ascii?Q?qR1Ev1ptvXvQwJjYWDbroL3ZW455vYz4Vg6pCvatfeaNwk2RAk9/XeNVdH3T?=
 =?us-ascii?Q?DHDoeBWB0MwGz915APXN690jP8BNanvzdRpPP2asB8Cd7HhBF1xNDashEBpe?=
 =?us-ascii?Q?QNnVjJeZ6OXqxjFscV825oWiWfuWXwehK35uL96s085niLvJm6koGlJZq3XN?=
 =?us-ascii?Q?x33FcEZQurzdgKOkmacUQnbNlQ0DfzB0RKfel/Upae7K34VneUF6SB/6xrs5?=
 =?us-ascii?Q?9/8LyF6nSzGIm7OMFr6EFesRKl5wWKo2qF5vsAfF6lpnE4/6FMcok+bNOc+N?=
 =?us-ascii?Q?kXgte2ZoSSZRbYI12SE4nehoxhWo1YRr5HTpw+d7ZRHDrg8Pv5tcKvTOb2m3?=
 =?us-ascii?Q?qrqo4tATkKZRNev+sg52xhnw3L3iD5DXOV6tMZBn6whTQth4CdX/1aU9LsWj?=
 =?us-ascii?Q?uq7sq/1tIJsGgUzFzO+4wSzpwIRSo4ZkV12KhLAhzTq4NsYrMjKaJtlNVrFU?=
 =?us-ascii?Q?QO6IRNxkHz8ReSMKuuuCKsI5UrKtshy31HnKlqEAoHXPgKZ3jxF/CrdyMVKL?=
 =?us-ascii?Q?Da079e2+oY+KbVIla1+mKAZENIriGW+dxte/M8sTKpjwSj1d1UlmTZjvOrA5?=
 =?us-ascii?Q?sse1z82tJqw0kUNZtEw/ykB587OBQHOOOd+shYD4BHcn6iytlqwrFRMaPYCX?=
 =?us-ascii?Q?pplUBi8hp/xDHG+Av791PgIWzGm0fUSCxRQdOCKpOrWVRYpKHlSgUCr23VnM?=
 =?us-ascii?Q?qTNBJr1vkHlut/jec1/S07pkkGy2nomz541e/brgEMoIBi9HhmjWfKsBNBhz?=
 =?us-ascii?Q?iTP8mzLh1QhbnwnSviiot5pVZp+g1e4Nlms6VhsQr/dLJnyuLSp/U52ytvrh?=
 =?us-ascii?Q?uM1wzE81yLnT5I95bSShvEvKYgW1MXJHMS6hyW93/Qd+3p8A9aOjsKZ40fNn?=
 =?us-ascii?Q?wtOGz0hitufV9ao7u6HZNM2mwePWgmASgSPJO+51fe+nkhMiZ5N7M8GwKpNA?=
 =?us-ascii?Q?YISZ1PMS+kO5S436Li5yMvYctUBUNGnzJDcMrbLu4XYVdOJOXxxiSn2wNYC6?=
 =?us-ascii?Q?1oPYruKe0rEbJDJototImj95HN2mAnZd+MZHoO3wrH62we6uReZ1F3UqHW0A?=
 =?us-ascii?Q?7m3IusBQS5RgMRlwmT54qWZ58rVjfIbjGkZ6XxyJQ4MGuUr1+8aFke1/xshZ?=
 =?us-ascii?Q?hEWc9gd0BaKLJi0ONbBrdEDP2iaqz5xI90rByaasZduJm7XxXe/e4lqBGYg7?=
 =?us-ascii?Q?h0IoB/9MrMJBzBBy0R8bWYkFGAJDYY1dkqo+DIDvCV/iAUyBLbMU/KBf2lI6?=
 =?us-ascii?Q?v6qSZBNhjBBmy4J8W1HfiPBS/92r4zzLQ5tJVyLZwDLunE7I5sgBDyKjArXZ?=
 =?us-ascii?Q?aKnPc9hkjlh8wJtpG4bp0nICEpbw/lnP8ivhl0nutVyr+GgxvXf7rCiHI+Iw?=
 =?us-ascii?Q?vclOcjP8EVSdtPqRTnrwJt17Te1kAoXYQwM2oySAP40sCl9D3gAkiKky5xAz?=
 =?us-ascii?Q?bBjYyDb6A2YPGY0NECsEXpNNfNLZ91Zdu0zCuDrdjz9r56FpjoZSAQCsiMq/?=
 =?us-ascii?Q?NQ=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 94ea9f98-1c17-4ba2-ff1d-08dd021be534
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB8200.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2024 06:41:39.1971
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v7yHRKLjcbL9YAgnOnAxEyMy9SIqV9Lbqc/wQM6RnqAgZj5PHlHGoQhe01VlstGC/l53KHDVlniJ9eQd+6f2qoVGHrexraxFVivZM3pw+uY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR11MB8730
X-Authority-Analysis: v=2.4 cv=IrVMc6/g c=1 sm=1 tr=0 ts=6731a726 cx=c_pps a=S2IcI55zTQM2EKrhu3zyRw==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=JBbWWo_dQDwA:10 a=VlfZXiiP6vEA:10 a=bRTqI5nwn0kA:10
 a=t7CeM3EgAAAA:8 a=NEAV23lmAAAA:8 a=9dNbsytUAAAA:8 a=uDo-SIiEAAAA:8 a=vOtmyezTaZJXdoZdcd0A:9 a=FdTzh2GWekK77mhwV6Dw:22 a=gPpeecpFUKP6j8iU7U-x:22 a=Rkhf4GTZPwEC63LfVcCP:22
X-Proofpoint-ORIG-GUID: tayeweCMIaE8xOROkyE_nExbJBLPUDxk
X-Proofpoint-GUID: tayeweCMIaE8xOROkyE_nExbJBLPUDxk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-11-11_06,2024-11-08_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 clxscore=1015
 malwarescore=0 priorityscore=1501 suspectscore=0 bulkscore=0 spamscore=0
 mlxscore=0 mlxlogscore=999 adultscore=0 lowpriorityscore=0 impostorscore=0
 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2409260000 definitions=main-2411110055
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 11 Nov 2024 06:41:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113783

From: Haixiao Yan <haixiao.yan.cn@windriver.com>

ChangeLog:
https://github.com/OpenVPN/openvpn/blob/v2.6.12/Changes.rst

Security fixes:

CVE-2024-4877: Windows: harden interactive service pipe.
Security scope: a malicious process with "some" elevated privileges
(SeImpersonatePrivilege) could open the pipe a second time,
tricking openvn GUI into providing user credentials (tokens),
getting full access to the account openvpn-gui.exe runs as.

CVE-2024-5594: control channel: refuse control channel messages with
nonprintable characters in them.
Security scope: a malicious openvpn peer can send garbage to openvpn log,
or cause high CPU load.

CVE-2024-28882: only call schedule_exit() once (on a given peer).
Security scope: an authenticated client can make the server "keep the
session" even when the server has been told to disconnect this client.

Signed-off-by: Haixiao Yan <haixiao.yan.cn@windriver.com>
---
 .../openvpn/{openvpn_2.6.10.bb => openvpn_2.6.12.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/openvpn/{openvpn_2.6.10.bb => openvpn_2.6.12.bb} (97%)

diff --git a/meta-networking/recipes-support/openvpn/openvpn_2.6.10.bb b/meta-networking/recipes-support/openvpn/openvpn_2.6.12.bb
similarity index 97%
rename from meta-networking/recipes-support/openvpn/openvpn_2.6.10.bb
rename to meta-networking/recipes-support/openvpn/openvpn_2.6.12.bb
index f8de78ff74fd..af237280ea0d 100644
--- a/meta-networking/recipes-support/openvpn/openvpn_2.6.10.bb
+++ b/meta-networking/recipes-support/openvpn/openvpn_2.6.12.bb
@@ -14,7 +14,7 @@ SRC_URI = "http://swupdate.openvpn.org/community/releases/${BP}.tar.gz \
 
 UPSTREAM_CHECK_URI = "https://openvpn.net/community-downloads"
 
-SRC_URI[sha256sum] = "1993bbb7b9edb430626eaa24573f881fd3df642f427fcb824b1aed1fca1bcc9b"
+SRC_URI[sha256sum] = "1c610fddeb686e34f1367c347e027e418e07523a10f4d8ce4a2c2af2f61a1929"
 
 CVE_STATUS[CVE-2020-27569] = "not-applicable-config: Applies only Aviatrix OpenVPN client, not openvpn"
 
-- 
2.34.1


