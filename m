Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 653AAF4BB89
	for <webhook@archiver.kernel.org>; Tue, 24 Feb 2026 20:26:16 +0000 (UTC)
Received: from mx0b-000eb902.pphosted.com (mx0b-000eb902.pphosted.com [205.220.177.212])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.29756.1771964162767763539
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 Feb 2026 12:16:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@garmin.com header.s=pps1 header.b=R3ULD9bn;
 dkim=pass header.i=@garmin.com header.s=selector2 header.b=LLABvnbr;
 spf=pass (domain: garmin.com, ip: 205.220.177.212, mailfrom: prvs=7515d6ceb9=colin.mcallister@garmin.com)
Received: from pps.filterd (m0220298.ppops.net [127.0.0.1])
	by mx0a-000eb902.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61OHqARj3936071
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Feb 2026 14:16:01 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garmin.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pps1; bh=nL2KKbb/Gy1YUYIpwSLPkhVBSvB
	Dpfi2udU9Xkeix+k=; b=R3ULD9bnQ59yDO1ZuutdGGT0KmFnCvpwhvVSSiMZC65
	ofV0oQUX9OfpUrys2h99Fi3iax4i+nMnyZkjzaOAT6TUE2E6hLVI+94jiGod+8e4
	m+R5xkbvCDJLPMsDcNvDKxCQlf6KrWdlkGeTT8cdXYuIniCfXpWHXnktSvDVAkwe
	uWfC2TlggzaeQ8Wns1yQ0O/fJ2cmzugIVD/poodZXiXc+LERfRmZ4o5eHcfeZovR
	+uz+Zgtii1zI/LuwRgXu22yjzUkHZjaY6FUHMe0B3nDWpOjlosN7aEgBWJoXZjxI
	J+Xe6HHHWqRKyJrWVfxl920s1XN6jDXS4N1y6A/yZdg==
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11023121.outbound.protection.outlook.com [40.93.201.121])
	by mx0a-000eb902.pphosted.com (PPS) with ESMTPS id 4ch9cysacu-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Feb 2026 14:16:01 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gC4RnjJwfrgrS0ynDn2YAvPgAIF7eiyITe3TBJs2EynjNNyJoiwyHkEqnMdOPgpQrt0WsSvx3GqtsMbXjqmmrMa/MQwc7Gz9EEBK5wsXvT51n57WeiqxhpcF5+dk+tUJqZ7d2EUeeibLz1RUlM5AA1DxZJ6k9wfejobpDAKO3tkXrmdqtc3KubTYpsvxJZ0MbWjBwxhQrHSfKVoqmxqqGSPdb+t6/e3RFua359kdz2vVERvJ0kQJBLkSXQVBRpoHD7sC6ac4cpL0Rdca3iUW0jRirhN+7rDaGqehjttcEyhcm7I1lRQyjMaq4pmBmSdtwL+AFEc44Z8lT2tJWkEuAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nL2KKbb/Gy1YUYIpwSLPkhVBSvBDpfi2udU9Xkeix+k=;
 b=HaTRTi7JfTnh6qdAvczDX2opcyq9i0P+5hn2iRW8k3iOdXrBo8WyVe9Wu7eNA2vRQqF0x59dJjiEyXjmSDePdDX+aox2a+Z3XDSFixTS3AWpzsslr/fWH75clm5IQt0jKHJZs9Otx9jOFeFK7jB+zV9Y8Ux8DOdRxGlHfzkO1r4nVi+7JseFdA0DbHQ1pUfsalEFl4QmVHPs2Jejx9TpcMRZ21W5u7piVTIGgBbeYX/50jjtH6NpnIIAReB95a6vyj1LIucrU4u5vi7dxxM7+9Lqr1H+bBwUlmJf572UYmCdNrDhgMAee5uSOgaW/C9ssBkLfy8F3qSDjIjWmMc8og==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 204.77.163.244) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=garmin.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=garmin.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garmin.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nL2KKbb/Gy1YUYIpwSLPkhVBSvBDpfi2udU9Xkeix+k=;
 b=LLABvnbrjIimfT40xRU5xbYCCrDLHbcvgOsGbiPeI7twfGCgWDtmlZA3Ehvkp4UO+m8IO8pgYLMKD5JBYd1uA2/ywVDp5z3Uf40xhLBjCk1ggcc1as5yN2kvFfd/vwbXUMqIdopgMtgUHrGTzKXVRohCrJL/i5wx7q2Ha/LLPpTT/QjoDFjHHHVbX3zv1mhERJ11kBoFlHncOkyVk2w9/IBIAg15K7gI9zOWpvNT8HEEoarakTFDyxEfNaDRlRVMS1Z1XQii6IjsYrw0+RiIeW2fCkDROz2uw9hb8VamJCUedvgRlJJFvCfC5a6RYSJq5tumeCN4p+oeCpFdmoH7Bg==
Received: from SA9PR10CA0030.namprd10.prod.outlook.com (2603:10b6:806:a7::35)
 by DS0PR04MB9344.namprd04.prod.outlook.com (2603:10b6:8:1fb::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.11; Tue, 24 Feb
 2026 20:15:58 +0000
Received: from SA2PEPF00003F65.namprd04.prod.outlook.com
 (2603:10b6:806:a7:cafe::55) by SA9PR10CA0030.outlook.office365.com
 (2603:10b6:806:a7::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.16 via Frontend Transport; Tue,
 24 Feb 2026 20:15:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 204.77.163.244)
 smtp.mailfrom=garmin.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=garmin.com;
Received-SPF: Pass (protection.outlook.com: domain of garmin.com designates
 204.77.163.244 as permitted sender) receiver=protection.outlook.com;
 client-ip=204.77.163.244; helo=edgetransport.garmin.com; pr=C
Received: from edgetransport.garmin.com (204.77.163.244) by
 SA2PEPF00003F65.mail.protection.outlook.com (10.167.248.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Tue, 24 Feb 2026 20:15:58 +0000
Received: from cv1wpa-exmb7.ad.garmin.com (10.5.144.77) by cv1wpa-edge1
 (10.60.4.251) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 24 Feb
 2026 14:15:37 -0600
Received: from cv1wpa-exmb1.ad.garmin.com (10.5.144.71) by
 cv1wpa-exmb7.ad.garmin.com (10.5.144.77) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 24 Feb 2026 14:15:40 -0600
Received: from cv1wpa-exmb1.ad.garmin.com (10.5.144.71) by
 CV1WPA-EXMB1.ad.garmin.com (10.5.144.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.57; Tue, 24 Feb 2026 14:15:40 -0600
Received: from ola-jnrkg73.ad.garmin.com (10.5.209.17) by smtp.garmin.com
 (10.5.144.71) with Microsoft SMTP Server id 15.1.2507.57 via Frontend
 Transport; Tue, 24 Feb 2026 14:15:40 -0600
From: "Colin McAllister" <colin.mcallister@garmin.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Colin Pinnell McAllister <colin.mcallister@garmin.com>
Subject: [PATCH] iperf2: Update CVE_PRODUCT
Date: Tue, 24 Feb 2026 14:15:14 -0600
Message-ID: <20260224201514.1337438-1-colin.mcallister@garmin.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003F65:EE_|DS0PR04MB9344:EE_
X-MS-Office365-Filtering-Correlation-Id: aa948e17-966f-4e85-d4e5-08de73e185f3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?ezU2Q5runIAG02ztE8OIL6IXJ3iVUJFBHlnQBMa/fnBZ7ywxyRu1056JVDwp?=
 =?us-ascii?Q?3QPe4ltJEAtZwFqBm2/FtEibaZXiDV7yTiBinbbc75vLt7+B3cAo4tRv34F5?=
 =?us-ascii?Q?kXpbqDlqvLyzN2kNvNgigsclLmQpKEew6Ek8yb8xxQb2yB/vtzlj5ciIUA4y?=
 =?us-ascii?Q?o9phFRPkT1ANeDLd5IyOXI7XhXVEqwJ8ZwfhXJrAYpGwjJDV87dvH5JPjsBS?=
 =?us-ascii?Q?7yVTt6bKBjfLrieM4GmHj675+9nsT/L7jIzx1Y30JHu6hrEzJu5PUG8e0YJn?=
 =?us-ascii?Q?eYl7zuzLlrS443+8sHdqPEZtxAXNfomd1UoDG+rvmJYojLsRMVKTd54fCzbZ?=
 =?us-ascii?Q?Q9ej9VbUj/BUZhwr0h+Jqr+ojiaV9yP+G1b5j5mHkLvQjdcYDiHxtPoE8Pwp?=
 =?us-ascii?Q?Oan6zNOJ7y17ntMPL6nPSzF0xUR8t0YtJp/Gr0uHaZafbnmuouHkAjY5Zyyn?=
 =?us-ascii?Q?hhUP28VUOzgxdgnWyyvtv91eYYaV4KpDNiZGVfvk1764Bi11OACs+klDciVW?=
 =?us-ascii?Q?igHI7v516f8jTi4KfoCDO0whvUSmJ98uvKEojJQpmZ2EWghk3nMNTHHaCzJD?=
 =?us-ascii?Q?osjw1aN3v4mPqy98Kv53xd8F4I7jWHRByHHp6ULjJEMalzzzNPv6dkcIIN4D?=
 =?us-ascii?Q?vHaoFVZicxj4laTZtsuiy2EE7U4kFCBwY2fDLZJocaPfBSfJIpwI6hQE3o5S?=
 =?us-ascii?Q?w+xh4+1BHP8ZI7HqwKHEkN1pEfj3AaMXsuu0FVbqykcEOTtOLV4vEo8A1gP6?=
 =?us-ascii?Q?I/q0REorjZCWSYC0mAqnmk9sJ8z8FtoNP0pvFR4vO9a/6bfsdzfFbr5a+rrU?=
 =?us-ascii?Q?VKlzA4SBKu+ctgS9y7/neIAjOjmf8iiJ7URH9nqbRMTz0DkB4ERuEakomQaS?=
 =?us-ascii?Q?8wPArKNvbZU4WiZTkY5RYK2Cn/WhubKnrCBrzPm/zdUyDbgUpMD28FhYDejy?=
 =?us-ascii?Q?VkvVObkjSYIUddTWsfMRXWNRrjgkX2PGAUJWANykU2bcJ1crwHx8WqGR42yl?=
 =?us-ascii?Q?nR9+Vj2SEd0uaVdPBlfUfDpuiJU/sWrCPiYDfn+0FAwgsfFJYwEb8cHsoQnE?=
 =?us-ascii?Q?hqoMiRtjkUOw9BQb5ZOH7Kxd54Z/i0vYXFTD8NrU4NDKbRJv48Ibzmu/P2fb?=
 =?us-ascii?Q?eBQ0YcOQEriq6aV5uqFqBCBiKzetVgHJM8JXzNzgpxyLxHJbHz8C0TifaHH5?=
 =?us-ascii?Q?7/z6pxvKf+y4F+WZykGEPZFlO8uzbclqD77zE7nZKIlPr4Jzz46pkYhmK+So?=
 =?us-ascii?Q?Da5jXs+ti+ZGoCY5gseb61wOCWfOq/PNd6Q7+nkf0ZTYeZ1PbEWhJUiHr/Ck?=
 =?us-ascii?Q?nTGODHiu4FHuyuINzVWzrW0Ag/tQJ2MubC3d/wu6tbcPbp5x5wDhGno7qPcW?=
 =?us-ascii?Q?xVC+jHjNReFixkwMCRKPYg5x8dqDenPOh3cQHAY/4kG8K5ER3C5JCQ+OQLME?=
 =?us-ascii?Q?V5LbpCEsvDADdzbqIX11Jp4pavb1RzJUqcVlOGOvPNiO0gE4/s0gOLzL6pW8?=
 =?us-ascii?Q?kZ2pf8eqMH5ZlHbfxaz/KKF8In+zLwW778KjlZ3P9Pl3aGadTAGgCSxwygVP?=
 =?us-ascii?Q?ecPsABJCECpMDztjOrsCUFdJx6/7+QJNzpQQSSK8hrRyHP6r3qTDmj3VXCe8?=
 =?us-ascii?Q?mVU+zQvrbq8Kzkbx+0fbXI4nOLm8YJ2CCi/YTW4cVqw6uU+psfO1cRBfeXzU?=
 =?us-ascii?Q?/B+C4xcvGkEXKdEz86Kgeg8JbgY=3D?=
X-Forefront-Antispam-Report: 
	CIP:204.77.163.244;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:edgetransport.garmin.com;PTR:extedge.garmin.com;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	ytuh1u9UTZ0JT+DXZzjkoKqkP+s+/9Gqhmyzti/B4zkaadUVdj8gbKV+c91tCNxy/lwW9aRPTbGSZ0pVZlLQgXvtlh0GJgGOxrLYrwGcCKYFXnx3sxoLV7FR4Y3jUTAecRUiC+TsLTrlYTJRRvGsAlE3IMmLgAy6IKLn4dGyJOLPdNTzvQ7yWmZArweDAaID2ynz2LHwHN6SscLXDOZ8bu8FZlb/kR+hRgpxD5Gttjif9ApDfsLuu2+LAvL3oC3/4tzuO/Cv11WG8AfpfTZpcaPps2ZwaRkZE4dXcbJbyrCphGmbyZOqWrtP2fZvbJFIdH3VpyQZT4TdS6xr2PEXFgQM+WHLy8PlXZzdk0fheHBoK972OHrz2leZzxGMZckyG/bTBBK0M0ar0BGMiwUyOi3E6OcuQ4GaiAXAc1414Tn+6BxOKARUuZR27a9+Oc6I
X-OriginatorOrg: garmin.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 20:15:58.4338
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: aa948e17-966f-4e85-d4e5-08de73e185f3
X-MS-Exchange-CrossTenant-Id: 38d0d425-ba52-4c0a-a03e-2a65c8e82e2d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=38d0d425-ba52-4c0a-a03e-2a65c8e82e2d;Ip=[204.77.163.244];Helo=[edgetransport.garmin.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SA2PEPF00003F65.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR04MB9344
X-Authority-Analysis: v=2.4 cv=TfibdBQh c=1 sm=1 tr=0 ts=699e0701 cx=c_pps
 a=0rRmVCaqev1jNxcJeZKYQQ==:117 a=YA0UzX50FYCGjWi3QxTvkg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=HzLeVaNsDn8A:10 a=qm69fr9Wx_0A:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=PYnjg3YJAAAA:8 a=NbHB2C0EAAAA:8 a=AI_AkaHtxNPz4VWEV_4A:9 cc=ntf
X-Proofpoint-GUID: iA1eh1zY8YHeZs86-OOCtawWtck1qOo_
X-Proofpoint-ORIG-GUID: iA1eh1zY8YHeZs86-OOCtawWtck1qOo_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI0MDE3MyBTYWx0ZWRfX/Gudj5Q8fe1O
 IZgkzz6RQhFSKgQLdDZHGY3De6X3xHv6lxsrTQuwxlE7XcIBeujufdT1HlKddPABci5BzL54JXl
 JTWBdyReeZK2enZZzIJlgh5APtRSf5VfdYwWuJiW++WMB3pEa6p/GyCsQ2l9Qlpy3Zf5y7/+jtT
 IzzPQ3a/gXIZZZAGcRp/tI5TWb7cT3ucl8mOCipZAm7i5ct/WdxDR+yNyQmFGgXGA6b9/XCXrTI
 n00Ldf3AtmiCbBAlftX1e4WLHAiKkcXWAEOp85wPaWaFfnGllyg+hMUSYE7F6okH3XwxcjiSQTW
 PLvZ7B4KhWnMtV5sUV9Xf0ZkgTctS7YeCIkZhIP42AeG+5Ujo7t7tR7adAUbpIcrIeFeVSdEfNA
 GjOKiAXplJfRwsQLgQy1JGwZX4+c6o7A7yyF4/SfFkT0tWe8ILJ0slmQpxdNkAU6colC4hoVxoQ
 1PYxFKnGQtZcQbkOQocBkCr41qZoG1tDg+GpU58w=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-24_02,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 phishscore=0 clxscore=1011 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc=notification route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602240173
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 24 Feb 2026 20:26:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124600

CPEs are registered for iperf_project2:iperf2 in addition to
iperf_project:iperf. By changing CVE_PRODUCT to an appends, this ensures
that both iperf and iperf2 CPEs are used for CVE matching.

Signed-off-by: Colin Pinnell McAllister <colin.mcallister@garmin.com>
---

Here are the links to see both CPEs registered in the NVD:
- https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Aiperf_project%3Aiperf
- https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&orderBy=2.3&keyword=cpe%3A2.3%3Aa%3Aiperf2_project&status=FINAL

 meta-oe/recipes-benchmark/iperf2/iperf2_2.2.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-benchmark/iperf2/iperf2_2.2.1.bb b/meta-oe/recipes-benchmark/iperf2/iperf2_2.2.1.bb
index d31f4ed634..cc7a1561df 100644
--- a/meta-oe/recipes-benchmark/iperf2/iperf2_2.2.1.bb
+++ b/meta-oe/recipes-benchmark/iperf2/iperf2_2.2.1.bb
@@ -19,7 +19,7 @@ EXTRA_OECONF = "--exec-prefix=${STAGING_DIR_HOST}${layout_exec_prefix}"
 PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'ipv6', 'ipv6', '', d)}"
 PACKAGECONFIG[ipv6] = "--enable-ipv6,--disable-ipv6,"
 
-CVE_PRODUCT = "iperf_project:iperf"
+CVE_PRODUCT:append = " iperf_project:iperf"
 CVE_STATUS[CVE-2025-54349] = "cpe-incorrect: the vulnerability is in iperf3, which is a different project"
 CVE_STATUS[CVE-2025-54350] = "cpe-incorrect: the vulnerability is in iperf3, which is a different project"
 CVE_STATUS[CVE-2025-54351] = "cpe-incorrect: the vulnerability is in iperf3, which is a different project"
-- 
2.53.0


