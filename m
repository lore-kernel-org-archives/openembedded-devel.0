Return-Path: <Haixiao.Yan.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDC18D41C38
	for <webhook@archiver.kernel.org>; Wed, 13 Nov 2024 11:08:40 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.9395.1731496113464013081
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 13 Nov 2024 03:08:33 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=1047842519=haixiao.yan.cn@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AD9MjuJ020188
	for <openembedded-devel@lists.openembedded.org>; Wed, 13 Nov 2024 11:08:32 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2176.outbound.protection.outlook.com [104.47.58.176])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 42uwtu9we7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 13 Nov 2024 11:08:32 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ny3bR2BK/MApJ5349MaMnbK4/JkMi+tnwOxYNjb+ztwsEez+xCl7zlqGKg2QiAm3Dd0rzx1kMtH7dm9uWe1/ijLaXOo6ekLYkQ4Xt+mddtmVD3Pj945406RGcJgst9Jkj1lJZnsK+jeqhdq1HwtgT4WqUam9Xsrjj7o7AAPsQtNljhEN5NFhXDvHT/IykhKTEtRPvOvhQ8nXBvF8v13O2QECicsAS1n5eqEjCSdfm7hjn0Yd4QYReRB24bSJKV8t7cc4dsttX562xzySUNFCNJv6gkgGBRWsPMvpbYOHAfB+in8NyVCV+aLrLM0aER38YEd8o/DvFBtOzOBVwVN8+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s3D3/XUeSTO5h7Ft2i9EtyrlQVnJZj3LcSY3PTU4/5I=;
 b=vpvJebfgjLoCCRUkE16rFvOaJivn3lIo1Y/LLovznPKrWgINozQv9H+C+RnXv5yRpO5pn+mKUDHLqeX7ZX+bdK3IElojtLf+8MekWEOMeaxEh6SeueEwV11Qp9afW9oCvgyhJiT2VeBu1TxDzbytHYSCJI/Qq3KoVoPMPUz1o6cWlBGdWqTTUwx7+3bEJ9Z3FW8VefrogukU6Bt00f0tpzfwdXfTMURol7nlUdSnhumpCCLxNJ5hWDRAmdze+D2/VyqI1dPyBX3+P+boK588+l9/PXEy1aLDf4mqdRMXhAxdmKJMItftMOfTG0wGFIQL99zbs0uLgkYnSfFb6l9tlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH0PR11MB8189.namprd11.prod.outlook.com (2603:10b6:610:18d::13)
 by DS7PR11MB7805.namprd11.prod.outlook.com (2603:10b6:8:ea::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.27; Wed, 13 Nov
 2024 11:08:27 +0000
Received: from CH0PR11MB8189.namprd11.prod.outlook.com
 ([fe80::4025:23a:33d9:30a4]) by CH0PR11MB8189.namprd11.prod.outlook.com
 ([fe80::4025:23a:33d9:30a4%4]) with mapi id 15.20.8137.027; Wed, 13 Nov 2024
 11:08:27 +0000
From: haixiao.yan.cn@windriver.com
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-networking][kirkstone][PATCH v3 1/1] openvpn: upgrade 2.5.6 -> 2.5.11
Date: Wed, 13 Nov 2024 19:08:12 +0800
Message-Id: <20241113110812.2674507-1-haixiao.yan.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0167.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c6::19) To CH0PR11MB8189.namprd11.prod.outlook.com
 (2603:10b6:610:18d::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB8189:EE_|DS7PR11MB7805:EE_
X-MS-Office365-Filtering-Correlation-Id: 85b93848-abe5-4406-b793-08dd03d37fc3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?EqW+Pt+2rPdalaMhHYb84hWMogF/mIgNVTSSmSHJbItzlgAtxLd7Swe9JuLR?=
 =?us-ascii?Q?vaWJpNb6Bd+iDwMPuDA8oSyzqcDwzGqgf7qZe6Ak07pdDNglybR+OVJfs36K?=
 =?us-ascii?Q?OGivL0cYk2Oh3QMz8qtc7bnnwrkrJbJlP6EbPvI4F+kGiJEfH56gnaeriFSR?=
 =?us-ascii?Q?NQxy53nG5oQw5maqxngVvPIXBaptzfjyMYXA+yLLSUs2lVoaOO2uS4yte2G9?=
 =?us-ascii?Q?kTis/x+J71CXDSHDiOSRRFKh1DXoUiEejmhfGhEkvFGx4exj4Y5qVvbKoY3i?=
 =?us-ascii?Q?0h+5b1FEr4ZnCUaVxHX80ZuxRljBWtlJma/8o8XKlnetRgOprPYO4EkALWE7?=
 =?us-ascii?Q?z6HQfCFZkd/BNz5d6IrVP5doPoWO0fkjBea+0RS2fgz9EXdEpPSoIiUVscaS?=
 =?us-ascii?Q?/UYGbZ6y88uF4Q2em4y+/vkWeayBRpGrudyotlTyP35SUwMZXqfdwtrLdOeZ?=
 =?us-ascii?Q?AUtgXcudvP4R4ApeeepwLHr6hi1/YgxoQU1GWj59QXPY8pCD3xGMyF1Ww/4c?=
 =?us-ascii?Q?oMRPlffFSWpaE7sRbpltqaOUcbehhSNXQKAL92tqeac67aitObWm7MOOy9/h?=
 =?us-ascii?Q?MNcUQjqykYEQHU8SIhqztjPyqpe0giZxfu5nF+1C2np4yqnQIwbjtX2ctiu9?=
 =?us-ascii?Q?UsUbZWYS5YQE9GvSihvgaD1xWkjuwXzgW8Y1ChqQR3EbGBS3oqzuDVrX1n29?=
 =?us-ascii?Q?B+6mHtvX5icjaMvLQcnqtjDqhRqimy2ID6oV8T6asKwpbId4Jucf/OK6Bpwy?=
 =?us-ascii?Q?B+L82bk4JIrDUWOrnFRnaTIOUsjE3uuC3ao3Fc+5H51URNTkGKsBHkoX4wxv?=
 =?us-ascii?Q?6EagnIgqfQDJ7B/HO2Lc4xdQKdjpHoBJpDJVW5BI2dXcdxWiM+MtXyFCTp3Y?=
 =?us-ascii?Q?MNxQB6oJRJyAsb5yo8DIPznggl0DWEQM1YEIP/IELFyOBT7n+7Un0Be4jCFG?=
 =?us-ascii?Q?ymrMDUcbRmFz4WlWwkCHfSjiz2QQg4ll0Tb8++vAtNl9ccWsDfwXweuUFwjc?=
 =?us-ascii?Q?Yi5Q8BpEA5XG8Mh+yHX7frF5+r8BjxR9kgJd+Vq+6lUYBYRPaTf+nlJ7dL96?=
 =?us-ascii?Q?vKeBRn48VbREpf7JLo0yc9RYyRbma1mrW8hn7w0XuIGW0JeDIfDNZpgz4I5S?=
 =?us-ascii?Q?31xxJzRJ6ix+i4qJnBJnQvtrOWexTCRD+OgeffwQfQIIk7EtoUy3HfoW/YIq?=
 =?us-ascii?Q?iSQl4CUMeui/7O1FK73r7M5EtsMaET0rhviVIHcF+cnMywyQcxQqiZg9JtDb?=
 =?us-ascii?Q?RFq8uSRXoL8dmeQzV85U7XZWSyv2uguGgCFd4eDxGgL3/OYAhxf8KPM9604Y?=
 =?us-ascii?Q?bxhvDq1mnxBPMFsDWDxdhyW9?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR11MB8189.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?mieRkVKcC0vsE64NLtLEOXphuvt0do0b9/h2zcM7oMzKGC+VWxChKj7d9C+e?=
 =?us-ascii?Q?XTftmqbRXwJtxRNerhYTxx7nsB4NpDNaCAci6lFtgPg3q3g/GD+ixfXMiize?=
 =?us-ascii?Q?0QR6cy/iMz+Tcgun3xkbvhiUsQuJnoHwYKV1YnKj544N4sxDiAp+tzfRUKFQ?=
 =?us-ascii?Q?d6tIow1mPPqDb02Sd1XvdYKGV3Y9XDIC4EIXjnrB+hbLRhAMukeE05SjRE27?=
 =?us-ascii?Q?MW5QIP6G62DmpNdj6q75q6QTxR8SYxOZPMq2T4gvN0dwsiZ2HBmuV3rxblh+?=
 =?us-ascii?Q?hZ3n2ecFjXCQIkBYDCu7hlJQ3kIbDXSgzpXNadBDXRf4cUBpzlc6hPmBMgbh?=
 =?us-ascii?Q?9JYVAFrsxEuGXRwXep5BSIGulS2OqnTkP6oNurNtILYR/+Y49PYFTTx2Xwkt?=
 =?us-ascii?Q?vKWHx1vIv4LJtqZAAtqQXVvQwHpxao3w2H+tnIVspCI+zwTmHHR+ly+XDvsf?=
 =?us-ascii?Q?GwQVpNzyIdA/EZwSW4wLgR2mDGXdXJx4nzC6a409DbBASQJFHq9gYbWqEfaH?=
 =?us-ascii?Q?222rqBYMU5+Q8mkAqSC6SHTrCYP+thcqnOAUhxGlF1k+6tDcpgm24rTzI+gz?=
 =?us-ascii?Q?FTwpePf3L6XYwp9ZgTzSq72nAd0OU0GGkNqTspimYM8uaf0eDBybIJw6nGH1?=
 =?us-ascii?Q?UWEpjOBbto+hqrBWfgXHSk8t3BseSV5WbF9ijYq8xT/n+jXo1pF7lYvdWRt0?=
 =?us-ascii?Q?A0ewwWbxQ75w8V/TIuGyjAbi5BvE6jIg9K8DjQGxFpfiE05efmiYqU3+upkt?=
 =?us-ascii?Q?sKHsggMNNa2wjCer1tvpDhR9qrfAnjylZPO0j2Cu4nejGPuAOrQxPGzlE91J?=
 =?us-ascii?Q?bqVXuNpaa5+7iWf1kcW79Svu5wV3qV7GObnuZnW5iXzIKc/NolpICrD0SsZ5?=
 =?us-ascii?Q?20z0QEwwsVX30ZYNnPKOFiK3mpUzUIiPG+uI7JRyIwWxMa+qtWFhPAVAjyH8?=
 =?us-ascii?Q?89LzjtArK9aRlSgbvU7rTsiaVf+yrV5I2BlwrBH5xIvMBXQ7r7Pfm8uvAjiA?=
 =?us-ascii?Q?lVumgeg25jIQcgIwXdTh9LQStKQ5jcvBq3p1taib0VILNQvYB6XYmy34qze7?=
 =?us-ascii?Q?4pAPGJaO2sYWrgOh9FHxU97eZfjqSaDBKz1U/8tN4vcB76KG5+IoguvTxg9B?=
 =?us-ascii?Q?IboIlad95W5WA3U0ODAMjZ3mM5uziQABA4hIcNpQ10+dKKmT6xFm7XtDDiCs?=
 =?us-ascii?Q?TnVyJJRq0qwhGowJ4/6hiwH7n+uKvunEgSdXChS8QIm7lrbWkolq8yQEpRO9?=
 =?us-ascii?Q?B1syrXquQmbZiOb9ZD/R/7KL7fNjONKM/Ytx4/ThIieJtxTqoC9zmjKQQ292?=
 =?us-ascii?Q?a58Khce58NUq+XIeuiUxbDAFGnajmBUfFLWFpc/UjtQS3bSoAmPSzfLRWDBS?=
 =?us-ascii?Q?bBZ0doza6V5Z3atQiqcnX5DZRRcNU9faflujCTi/N9HCqdEMU/uRsZe+Mf38?=
 =?us-ascii?Q?Cp1M/fbUuCgakduztFtUa6uOEcoq/DDHnPt6rL5O3ry/MLwNkr3Jsra4R8i+?=
 =?us-ascii?Q?DMLbzFGl4Ud00MdKbLK6+onOGPlTGdUTe8VVJOijuhYMd/6sJV/x/QEKVrzO?=
 =?us-ascii?Q?8gPEBMe7XqtRFI0pm1VGZZ5o4Nyl60ySJGDwXHXpzu9R842DFObqe1pksdtl?=
 =?us-ascii?Q?kA=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 85b93848-abe5-4406-b793-08dd03d37fc3
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB8189.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2024 11:08:27.5316
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dF+qxlnzzPXGWXfaRtbVYSQd/p0uGJ2iFhTw8ZhMia0nEsvAq2grDfAtlsQGzLrUBO/XJ52pthdV7j0TdEv7johTU1Pc3WSp1VmWQQZ3Tec=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7805
X-Proofpoint-GUID: FjnZHpDE39zpzDRBV2PKAZXCDSvhX6bs
X-Authority-Analysis: v=2.4 cv=BPnhr0QG c=1 sm=1 tr=0 ts=673488b0 cx=c_pps a=X8fexuRkk/LHRdmY6WyJkQ==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=yU_jQ1hFIRIA:10 a=VlfZXiiP6vEA:10 a=bRTqI5nwn0kA:10
 a=t7CeM3EgAAAA:8 a=NEAV23lmAAAA:8 a=pGLkceISAAAA:8 a=yMhMjlubAAAA:8 a=uDo-SIiEAAAA:8 a=Vt2AcnKqAAAA:8 a=FP58Ms26AAAA:8 a=9dNbsytUAAAA:8 a=neW7uqNyAoFAEOfBOKMA:9 a=FdTzh2GWekK77mhwV6Dw:22 a=Rkhf4GTZPwEC63LfVcCP:22 a=v10HlyRyNeVhbzM4Lqgd:22
 a=gPpeecpFUKP6j8iU7U-x:22
X-Proofpoint-ORIG-GUID: FjnZHpDE39zpzDRBV2PKAZXCDSvhX6bs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-11-12_09,2024-11-12_02,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 adultscore=0
 malwarescore=0 clxscore=1015 mlxscore=0 mlxlogscore=999 bulkscore=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 suspectscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2409260000 definitions=main-2411130097
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 13 Nov 2024 11:08:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113807

From: Haixiao Yan <haixiao.yan.cn@windriver.com>

License-Update: Add Apache2 linking for new commits [1]

ChangeLog:
https://github.com/OpenVPN/openvpn/blob/v2.5.11/Changes.rst

Security fixes:
CVE-2024-5594: control channel: refuse control channel messages with
nonprintable characters in them.
Security scope: a malicious openvpn peer can send garbage to openvpn
log, or cause high CPU load.

[1] https://github.com/OpenVPN/openvpn/commit/4a89a55b8a9d6193957711bef74228796a185179

Signed-off-by: Haixiao Yan <haixiao.yan.cn@windriver.com>
---

Update commit message for License-Update

 .../openvpn/openvpn/CVE-2024-24974.patch      |  49 --------
 .../openvpn/openvpn/CVE-2024-27459.patch      |  99 ---------------
 .../openvpn/openvpn/CVE-2024-27903.patch      | 119 ------------------
 .../{openvpn_2.5.6.bb => openvpn_2.5.11.bb}   |   7 +-
 4 files changed, 2 insertions(+), 272 deletions(-)
 delete mode 100644 meta-networking/recipes-support/openvpn/openvpn/CVE-2024-24974.patch
 delete mode 100644 meta-networking/recipes-support/openvpn/openvpn/CVE-2024-27459.patch
 delete mode 100644 meta-networking/recipes-support/openvpn/openvpn/CVE-2024-27903.patch
 rename meta-networking/recipes-support/openvpn/{openvpn_2.5.6.bb => openvpn_2.5.11.bb} (92%)

diff --git a/meta-networking/recipes-support/openvpn/openvpn/CVE-2024-24974.patch b/meta-networking/recipes-support/openvpn/openvpn/CVE-2024-24974.patch
deleted file mode 100644
index b42b3040ef34..000000000000
--- a/meta-networking/recipes-support/openvpn/openvpn/CVE-2024-24974.patch
+++ /dev/null
@@ -1,49 +0,0 @@
-From 2c1de0f0803360c0a6408f754066bd3a6fb28237 Mon Sep 17 00:00:00 2001
-From: Lev Stipakov <lstipakov@gmail.com>
-Date: Tue, 19 Mar 2024 17:16:07 +0200
-Subject: [PATCH] interactive.c: disable remote access to the service pipe
-
-Remote access to the service pipe is not needed and might
-be a potential attack vector.
-
-For example, if an attacker manages to get credentials for
-a user which is the member of "OpenVPN Administrators" group
-on a victim machine, an attacker might be able to communicate
-with the privileged interactive service on a victim machine
-and start openvpn processes remotely.
-
-CVE: 2024-24974
-
-Microsoft case number: 85925
-
-Reported-by: Vladimir Tokarev <vtokarev@microsoft.com>
-Change-Id: I8739c5f127e9ca0683fcdbd099dba9896ae46277
-Signed-off-by: Lev Stipakov <lev@openvpn.net>
-Acked-by: Heiko Hund <heiko@openvpn.net>
-Message-Id: <20240319151723.936-2-lev@openvpn.net>
-URL: https://www.mail-archive.com/openvpn-devel@lists.sourceforge.net/msg28419.html
-Signed-off-by: Gert Doering <gert@greenie.muc.de>
-
-CVE:CVE-2024-24974
-Upstream-Status: Backport [https://github.com/OpenVPN/openvpn/commit/2c1de0f0803360c0a6408f754066bd3a6fb28237]
-
-Signed-off-by: Meenali Gupta <meenali.gupta@windriver.com>
----
- src/openvpnserv/interactive.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/openvpnserv/interactive.c b/src/openvpnserv/interactive.c
-index 3b120ae..5e3ff12 100644
---- a/src/openvpnserv/interactive.c
-+++ b/src/openvpnserv/interactive.c
-@@ -1994,7 +1994,7 @@ CreateClientPipeInstance(VOID)
-
-     openvpn_sntprintf(pipe_name, _countof(pipe_name), TEXT("\\\\.\\pipe\\" PACKAGE "%s\\service"), service_instance);
-     pipe = CreateNamedPipe(pipe_name, flags,
--                           PIPE_TYPE_MESSAGE | PIPE_READMODE_MESSAGE,
-+                           PIPE_TYPE_MESSAGE | PIPE_READMODE_MESSAGE | PIPE_REJECT_REMOTE_CLIENTS,
-                            PIPE_UNLIMITED_INSTANCES, 1024, 1024, 0, NULL);
-     if (pipe == INVALID_HANDLE_VALUE)
-     {
---
-2.40.0
diff --git a/meta-networking/recipes-support/openvpn/openvpn/CVE-2024-27459.patch b/meta-networking/recipes-support/openvpn/openvpn/CVE-2024-27459.patch
deleted file mode 100644
index d04eeb571db2..000000000000
--- a/meta-networking/recipes-support/openvpn/openvpn/CVE-2024-27459.patch
+++ /dev/null
@@ -1,99 +0,0 @@
-From 989b22cb6e007fd1addcfaf7d12f4fec9fbc9639 Mon Sep 17 00:00:00 2001
-From: Lev Stipakov <lstipakov@gmail.com>
-Date: Tue, 19 Mar 2024 17:27:11 +0200
-Subject: [PATCH] interactive.c: Fix potential stack overflow issue
-When reading message from the pipe, we first peek the pipe to get the size
-of the message waiting to be read and then read the message. A compromised
-OpenVPN process could send an excessively large message, which would result
-in a stack-allocated message buffer overflow.
-
-To address this, we terminate the misbehaving process if the peeked message
-size exceeds the maximum allowable size.
-
-CVE: 2024-27459
-Microsoft case number: 85932
-
-Reported-by: Vladimir Tokarev <vtokarev@microsoft.com>
-Change-Id: Ib5743cba0741ea11f9ee62c4978b2c6789b81ada
-Signed-off-by: Lev Stipakov <lev@openvpn.net>
-Acked-by: Heiko Hund <heiko@openvpn.net>
-Message-Id: <20240319152803.1801-2-lev@openvpn.net>
-URL: https://www.mail-archive.com/openvpn-devel@lists.sourceforge.net/msg28420.html
-Signed-off-by: Gert Doering <gert@greenie.muc.de>
-
-CVE:CVE-2024-27459
-Upstream-Status: Backport [https://github.com/OpenVPN/openvpn/commit/989b22cb6e007fd1addcfaf7d12f4fec9fbc9639]
-
-Signed-off-by: Meenali Gupta <meenali.gupta@windriver.com>
----
- src/openvpnserv/interactive.c | 34 +++++++++++++++++++++-------------
- 1 file changed, 21 insertions(+), 13 deletions(-)
-
-diff --git a/src/openvpnserv/interactive.c b/src/openvpnserv/interactive.c
-index 5e3ff12..f613b99 100644
---- a/src/openvpnserv/interactive.c
-+++ b/src/openvpnserv/interactive.c
-@@ -111,6 +111,18 @@ typedef struct {
-     HANDLE device;
- } ring_buffer_handles_t;
-
-+typedef union {
-+    message_header_t header;
-+    address_message_t address;
-+    route_message_t route;
-+    flush_neighbors_message_t flush_neighbors;
-+    block_dns_message_t block_dns;
-+    dns_cfg_message_t dns;
-+    enable_dhcp_message_t dhcp;
-+    register_ring_buffers_message_t rrb;
-+    set_mtu_message_t mtu;
-+    wins_cfg_message_t wins;
-+} pipe_message_t;
-
- static DWORD
- AddListItem(list_item_t **pfirst, LPVOID data)
-@@ -1444,18 +1456,7 @@ static VOID
- HandleMessage(HANDLE pipe, HANDLE ovpn_proc, ring_buffer_handles_t *ring_buffer_handles,
-               DWORD bytes, DWORD count, LPHANDLE events, undo_lists_t *lists)
- {
--    DWORD read;
--    union {
--        message_header_t header;
--        address_message_t address;
--        route_message_t route;
--        flush_neighbors_message_t flush_neighbors;
--        block_dns_message_t block_dns;
--        dns_cfg_message_t dns;
--        enable_dhcp_message_t dhcp;
--        register_ring_buffers_message_t rrb;
--        set_mtu_message_t mtu;
--    } msg;
-+    pipe_message_t msg;
-     ack_message_t ack = {
-         .header = {
-             .type = msg_acknowledgement,
-@@ -1465,7 +1466,7 @@ HandleMessage(HANDLE pipe, HANDLE ovpn_proc, ring_buffer_handles_t *ring_buffer_
-         .error_number = ERROR_MESSAGE_DATA
-     };
-
--    read = ReadPipeAsync(pipe, &msg, bytes, count, events);
-+    DWORD read = ReadPipeAsync(pipe, &msg, bytes, count, events);
-     if (read != bytes || read < sizeof(msg.header) || read != msg.header.size)
-     {
-         goto out;
-@@ -1884,6 +1885,13 @@ RunOpenvpn(LPVOID p)
-             break;
-         }
-
-+	 if (bytes > sizeof(pipe_message_t))
-+        {
-+            /* process at the other side of the pipe is misbehaving, shut it down */
-+            MsgToEventLog(MSG_FLAGS_ERROR, TEXT("OpenVPN process sent too large payload length to the pipe (%lu bytes), it will be terminated"), bytes);
-+            break;
-+        }
-+
-         HandleMessage(ovpn_pipe, proc_info.hProcess, &ring_buffer_handles, bytes, 1, &exit_event, &undo_lists);
-     }
-
---
-2.40.0
diff --git a/meta-networking/recipes-support/openvpn/openvpn/CVE-2024-27903.patch b/meta-networking/recipes-support/openvpn/openvpn/CVE-2024-27903.patch
deleted file mode 100644
index d0726ab35c86..000000000000
--- a/meta-networking/recipes-support/openvpn/openvpn/CVE-2024-27903.patch
+++ /dev/null
@@ -1,119 +0,0 @@
-From aaea545d8a940f761898d736b68bcb067d503b1d Mon Sep 17 00:00:00 2001
-From: Lev Stipakov <lstipakov@gmail.com>
-Date: Tue, 19 Mar 2024 15:53:45 +0200
-Subject: [PATCH] win32: Enforce loading of plugins from a trusted directory
-
-Currently, there's a risk associated with allowing plugins to be loaded from
-any location. This update ensures plugins are only loaded from a trusted
-directory, which is either:
-
-    - HKLM\SOFTWARE\OpenVPN\plugin_dir (or if the key is missing,
-    then HKLM\SOFTWARE\OpenVPN, which is installation directory)
-
-    - System directory
-
-Loading from UNC paths is disallowed.
-
-Note: This change affects only Windows environments.
-
-CVE: 2024-27903
-
-Change-Id: I154a4aaad9242c9253a64312a14c5fd2ea95f40d
-Reported-by: Vladimir Tokarev <vtokarev@microsoft.com>
-Signed-off-by: Lev Stipakov <lev@openvpn.net>
-Acked-by: Selva Nair <selva.nair@gmail.com>
-Message-Id: <20240319135355.1279-2-lev@openvpn.net>
-URL: https://www.mail-archive.com/openvpn-devel@lists.sourceforge.net/msg28416.html
-Signed-off-by: Gert Doering <gert@greenie.muc.de>
-
-CVE:CVE-2024-27903
-Upstream-Status: Backport [https://github.com/OpenVPN/openvpn/commit/aaea545d8a940f761898d736b68bcb067d503b1d]
-
-Signed-off-by: Meenali Gupta <meenali.gupta@windriver.com>
----
- src/openvpn/plugin.c | 18 +++++++++++++++---
- src/openvpn/win32.c  | 21 +++++++++------------
- 2 files changed, 24 insertions(+), 15 deletions(-)
-
-diff --git a/src/openvpn/plugin.c b/src/openvpn/plugin.c
-index ed5d7c0..f7315f4 100644
---- a/src/openvpn/plugin.c
-+++ b/src/openvpn/plugin.c
-@@ -279,11 +279,23 @@ plugin_init_item(struct plugin *p, const struct plugin_option *o)
-
- #else  /* ifndef _WIN32 */
-
--    rel = !platform_absolute_pathname(p->so_pathname);
--    p->module = LoadLibraryW(wide_string(p->so_pathname, &gc));
-+    WCHAR *wpath = wide_string(p->so_pathname, &gc);
-+    WCHAR normalized_plugin_path[MAX_PATH] = {0};
-+    /* Normalize the plugin path, converting any relative paths to absolute paths. */
-+    if (!GetFullPathNameW(wpath, MAX_PATH, normalized_plugin_path, NULL))
-+    {
-+        msg(M_ERR, "PLUGIN_INIT: could not load plugin DLL: %ls. Failed to normalize plugin path.", wpath);
-+    }
-+
-+    if (!plugin_in_trusted_dir(normalized_plugin_path))
-+    {
-+        msg(M_FATAL, "PLUGIN_INIT: could not load plugin DLL: %ls. The DLL is not in a trusted directory.", normalized_plugin_path);
-+    }
-+
-+    p->module = LoadLibraryW(normalized_plugin_path);
-     if (!p->module)
-     {
--        msg(M_ERR, "PLUGIN_INIT: could not load plugin DLL: %s", p->so_pathname);
-+        msg(M_ERR, "PLUGIN_INIT: could not load plugin DLL: %ls", normalized_plugin_path);
-     }
-
- #define PLUGIN_SYM(var, name, flags) dll_resolve_symbol(p->module, (void *)&p->var, name, p->so_pathname, flags)
-diff --git a/src/openvpn/win32.c b/src/openvpn/win32.c
-index e91e742..1e61ffa 100644
---- a/src/openvpn/win32.c
-+++ b/src/openvpn/win32.c
-@@ -1532,27 +1532,24 @@ openvpn_swprintf(wchar_t *const str, const size_t size, const wchar_t *const for
-     return (len >= 0 && len < size);
- }
-
--static BOOL
--get_install_path(WCHAR *path, DWORD size)
-+bool
-+get_openvpn_reg_value(const WCHAR *key, WCHAR *value, DWORD size)
- {
-     WCHAR reg_path[256];
--    HKEY key;
--    BOOL res = FALSE;
-+    HKEY hkey;
-     openvpn_swprintf(reg_path, _countof(reg_path), L"SOFTWARE\\" PACKAGE_NAME);
-
--    LONG status = RegOpenKeyExW(HKEY_LOCAL_MACHINE, reg_path, 0, KEY_READ, &key);
-+    LONG status = RegOpenKeyExW(HKEY_LOCAL_MACHINE, reg_path, 0, KEY_READ, &hkey);
-     if (status != ERROR_SUCCESS)
-     {
--        return res;
-+        return false;
-     }
-
--    /* The default value of REG_KEY is the install path */
--    status = RegGetValueW(key, NULL, NULL, RRF_RT_REG_SZ, NULL, (LPBYTE)path, &size);
--    res = status == ERROR_SUCCESS;
-+    status = RegGetValueW(hkey, NULL, key, RRF_RT_REG_SZ, NULL, (LPBYTE)value, &size);
-
--    RegCloseKey(key);
-+    RegCloseKey(hkey);
-
--    return res;
-+    return status == ERROR_SUCCESS;
- }
-
- static void
-@@ -1561,7 +1558,7 @@ set_openssl_env_vars()
-     const WCHAR *ssl_fallback_dir = L"C:\\Windows\\System32";
-
-     WCHAR install_path[MAX_PATH] = { 0 };
--    if (!get_install_path(install_path, _countof(install_path)))
-+    if (!get_openvpn_reg_value(NULL, install_path, _countof(install_path)))
-     {
-         /* if we cannot find installation path from the registry,
-          * use Windows directory as a fallback
---
-2.40.0
diff --git a/meta-networking/recipes-support/openvpn/openvpn_2.5.6.bb b/meta-networking/recipes-support/openvpn/openvpn_2.5.11.bb
similarity index 92%
rename from meta-networking/recipes-support/openvpn/openvpn_2.5.6.bb
rename to meta-networking/recipes-support/openvpn/openvpn_2.5.11.bb
index b5ee31078b6a..810a60308b80 100644
--- a/meta-networking/recipes-support/openvpn/openvpn_2.5.6.bb
+++ b/meta-networking/recipes-support/openvpn/openvpn_2.5.11.bb
@@ -2,7 +2,7 @@ SUMMARY = "A full-featured SSL VPN solution via tun device."
 HOMEPAGE = "https://openvpn.net/"
 SECTION = "net"
 LICENSE = "GPL-2.0-only"
-LIC_FILES_CHKSUM = "file://COPYING;md5=b76abd82c14ee01cc34c4ff5e3627b89"
+LIC_FILES_CHKSUM = "file://COPYING;md5=132de9241e3147d49dbaead12acb0b22"
 DEPENDS = "lzo openssl iproute2 ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
 
 inherit autotools systemd update-rc.d
@@ -11,14 +11,11 @@ SRC_URI = "http://swupdate.openvpn.org/community/releases/${BP}.tar.gz \
            file://openvpn \
            file://openvpn@.service \
            file://openvpn-volatile.conf \
-           file://CVE-2024-24974.patch \
-           file://CVE-2024-27459.patch \
-           file://CVE-2024-27903.patch \
            "
 
 UPSTREAM_CHECK_URI = "https://openvpn.net/community-downloads"
 
-SRC_URI[sha256sum] = "333a7ef3d5b317968aca2c77bdc29aa7c6d6bb3316eb3f79743b59c53242ad3d"
+SRC_URI[sha256sum] = "7e2672119bd4639819d560f332a8b9b7e28f562425c77899f36d419fe4265f56"
 
 # CVE-2020-7224 and CVE-2020-27569 are for Aviatrix OpenVPN client, not for openvpn.
 CVE_CHECK_IGNORE += "CVE-2020-7224 CVE-2020-27569"
-- 
2.34.1


