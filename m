Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DAC9CAC581
	for <webhook@archiver.kernel.org>; Sat,  6 Sep 2025 13:03:39 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.8402.1757163811288948158
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 06 Sep 2025 06:03:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=TK0OVxxw;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=13443ff8d3=yi.zhao@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 586D0VBY3418748
	for <openembedded-devel@lists.openembedded.org>; Sat, 6 Sep 2025 06:03:31 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=rN4s/ZZXIzMysACkhdMU
	pL4z81rTPGjelotY4gtykS8=; b=TK0OVxxwthMKcWrCucv+qOaA5dTCMK6YR7Oy
	M14dBCYUny7OaXrtLSPtDfSRBdNg+LAWU2TaEIUWaH6Q0Wh/JbBj/gVLhZsZ/MX3
	OjYa+8J3T9Dt3ZqAqq8pn6Eg/yCDPLEq3AXuct051eirqXCzJjMm+lD3FjuVFTUD
	kXx/XsSrgVhg8C/8KaOFFxPe1ExfKFJ4UxLxK5sf9ztiHSNndwCxa/Pj7T/kLvmW
	GiGYNdxjB76SWtoSKYAJKYvtStyOtSUEn2dG0CdSqwU2MmSBo6RGuH4jMzZ2jTDa
	AJn47K+PltiCNwCQu6qOcZTpsdzaGRPCdZVfEvS5lMLS4pS7Ow==
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12on2060.outbound.protection.outlook.com [40.107.243.60])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 490mfg00xr-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Sat, 06 Sep 2025 06:03:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UHonlao43tQnPgZxO1l7v0IVYoknC45XrQ+R7ekHYgDEQeBP6QC90pXlnqETjl+vs6wtEU6VEFEy7MGPecKbW5/EfXarzFID2alMspdbOmJptirlR090C+b0oOqT35Bdk8wGz0Wb5BWju+ikewwivIpTZDQsqR2KjQz2QipE5t1RfSR4hkrUBRWSeC/O+ZtWFBH0Qljv2KC3VNNy/0zvQQ2vi1/NweiCvSClWXN+ghN6BNQrWSVmja2r5BZ2uT7pReLSwW3WLRZDwOqNXjm121Fs4LDg0fcjVIAa6TY4FPvpWR5jM+fF3dPco+w4zoSnj4D5QDm+IqG5Qbc3D8akjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rN4s/ZZXIzMysACkhdMUpL4z81rTPGjelotY4gtykS8=;
 b=yxwkz9dOkhsRTEkZkdtdL+Kdc5d/rUup0wKu25WpdCMDMxlrqL+ysQ+on9Mipy/40wkf/CshcIqCncwe0Ziy7whjfEHlKg/Bc5h4FbmYjbj3FUX5FT13TCLalsn3pg/cN1BWUkI4Kn7clOb7d1RivCIIiqNEzLtm05/tHQ82iZhGbe1X9Q8oKQnBCRgieeHnM+K/mq009kT+9jWVSKGRcn8MHjz95s1Ct3QbW8hmy3IQdJcM3q2vSBNJX8DEyqBvCHmpUTTOWrp+L/PFUcIFGcD5mMrosG4miVWsoYtWcwNnjEMqWg9p35DOlsGxCqEaH2/z1kJ864st0l7mG620bQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 CO1PR11MB5028.namprd11.prod.outlook.com (2603:10b6:303:9a::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9094.19; Sat, 6 Sep 2025 13:03:27 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%4]) with mapi id 15.20.9094.018; Sat, 6 Sep 2025
 13:03:27 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] audit: upgrade 4.0.5 -> 4.1.2
Date: Sat,  6 Sep 2025 21:02:31 +0800
Message-Id: <20250906130231.2936481-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0237.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c7::15) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|CO1PR11MB5028:EE_
X-MS-Office365-Filtering-Correlation-Id: 4418861b-b034-46b2-8699-08dded45c4ef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?BNRm10MQ5TSrb6hTCYTsBxkizdT0d1Aqr5B9uKMK/we7vF1lnbjcwRChXBC2?=
 =?us-ascii?Q?Q4Mg6LkEAXIvAl1bc3FOi2WUbFn8dd+k8csce5UA7Rotgng6qggFsth8AUGO?=
 =?us-ascii?Q?9jqQCfXa0uy1xUzYrcdUno8lYpYboUiEKT2k1NanLu/UlGjBG9RB5fO/kXSM?=
 =?us-ascii?Q?IB5UvyHQMT6bjB6Rckf99ehTNr/WBuEVkxdEjRq/lbJeExclh62vuMNJvMKU?=
 =?us-ascii?Q?69yYyJQpShwRNT1LL9AN4dUDyQkOL3MR/NoHfoRhLnhYdGmeBUp47XeGw1n7?=
 =?us-ascii?Q?PGMBlMJj1yhCPFMYfWL7axaURddLwwdjluSU5DfsVeGNolU84jD9JBg3g16K?=
 =?us-ascii?Q?mfJs47vSqJcEw81gaXqcgFtemEHpXr4vzEweb8KDBJXTowdRn6rCUEtkdXQS?=
 =?us-ascii?Q?hO7aXr+tpn00Ct1wXWmWmZXaQuj3AfUeEZl9/lO+8/+xeymUqNm50tVhz4lM?=
 =?us-ascii?Q?AynrlbYsRvo7pzz7QSXU4r4iQi81qcCPCryak7rQOc8UmGmlHrFV/N8v0mRj?=
 =?us-ascii?Q?AuyWrb5Mz5xlMQlDu0drDp2EILuDKHORH7KNXEA8BVEPeFD+wKmLm+urQiWI?=
 =?us-ascii?Q?fWiDI8W3wpYN7hSZlOFWvEQ5EaLos/rJYwPwuYCpN+0DzwRWUsJe7BHBVZzC?=
 =?us-ascii?Q?umBGkaZP/TJWZ9NSHOGv4sOTg1an223ujvgugt3I5Yw/vnzFUwldXsEb3POC?=
 =?us-ascii?Q?niHlm6BrQe1qJrH9r/JVkrI1jU/OERpcrr1ULpp0CVM+iCTLJMQbw6Qx9h4z?=
 =?us-ascii?Q?vGdFJPqTbz/JzSmF9nocsBbsmDttpGH926lDE73XoLiS/5rFf6L5hHuHob9B?=
 =?us-ascii?Q?y98NVJQtVXSb6nFH5N/KsvHav73K94SR3VUjZoqKCrBcaybaQ3yN6QveGa/n?=
 =?us-ascii?Q?hBaPBT057nFyPlIeffHidGnWH99ub2KBmKs9R0Bv1D+Mkmfsl6szyRU7gMfN?=
 =?us-ascii?Q?yDpTG0EDtk+xCJhdEbO1dQ6nbp84nJqI65v2rvGoDMS5B8Hiad1DE1eeoAAr?=
 =?us-ascii?Q?FDKmmgqR7hFz7nGXfzpnd8kcyWzP61DJb8yxF7Qs9Rzalg5fPD8+HwJ1e3no?=
 =?us-ascii?Q?ytK/OLqMHlSrK1W5msqt4FGADYUKOgaIi/uy9mu4DHZPpjY5T6RaCj42fguC?=
 =?us-ascii?Q?zUVvAwbR5YmTmj5Qto7ZQeHe9e2AkwH1swqD/mmjkK/JkzbckyJyorvseoki?=
 =?us-ascii?Q?L3VkPSFbJ9Ug6LTLt31bpjEOUyqgcDAURvx5fgTsdN03++i2uExHSQmpcn/q?=
 =?us-ascii?Q?e5qD9sspSoalKaUXcS09xMdPA36ZG4s760Ia46ZcFOPuNu35t4uNwESB85RN?=
 =?us-ascii?Q?Enn59+/Lc/JoUMYGQqYTaUNI8AQbfLnuqAG28AkWlDKlgRO/bvr9ZUO12KMu?=
 =?us-ascii?Q?NuuN4ZEj9ocvqtU4sF2i95dIKOyjla6VFiH6R+onHGkYAUIS+G2d7oGwSmBZ?=
 =?us-ascii?Q?Hs/UH2kV2aq0Uxdbfl9q2H5Hf+eetnT8+TgCwWe0YGojAO1s/MZgvnGuEdsM?=
 =?us-ascii?Q?eoScwuvHaK6SdoQ=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?cm40FCXJCegsHXs2daFlmQfg0QnDk4m4XzoelD44GnETMN8zFlwljhF1y0xm?=
 =?us-ascii?Q?7/IwaYSkTp8g0dWrmjj8zqByUuIrsgWRdOxlylfLuyKzEIy720iOJcDPCVIm?=
 =?us-ascii?Q?yhaoWSOSc9yBNZKFjUysDrNoP4G/h5+MEkJ08wT09qQIRG+MG5BiOHpeNGQw?=
 =?us-ascii?Q?x8VoQbXBG71kqVzrQsMwYEKM8pgZ3ovDFo+A/mKy1j5qXECN5jRkdBlRCdMP?=
 =?us-ascii?Q?X5zNikE6IVssz0ZOndrAvN8x1a5A51jzpxAjUmsMkifei4pOUV7L4RDCs1hy?=
 =?us-ascii?Q?3ov1a3MbRdD43LUJAdwAWy5vj1rZF/AFIOgOSlOW6XFxZ36mSDdYzPyqFkSe?=
 =?us-ascii?Q?ngPyesf3KlpJCDnTK3eZrUfRPVUARsbxGP9ffnRqJXdn8xo1JFm62QGsrQ22?=
 =?us-ascii?Q?nJMpb9TwVigoR3JpZ2lMkmbdwyXXzx/UFrNIO3JvjE0hZEE8WG5B3mBIGMMN?=
 =?us-ascii?Q?/mOIUrN/gqWuua4BE7kSaGhdjG6wgCh8tq9IZ7vR/A6gjqmm8B07MqJ5T9IF?=
 =?us-ascii?Q?lUVgqmf88QLHr9Hp1ILlKeEOhQSlOUw0C2K48Ei9b+KelfZTTKHCXYCywT9G?=
 =?us-ascii?Q?KcjX4EY5EvoPRw0HRT1M9PdpJA91f7WkU9bSvJwC3EpEETmdL+AMEro71W2T?=
 =?us-ascii?Q?yk8Vlt0fWMrJgAGzrpMSi3k1Mknls3icZplR/T5PDcKmUvjXwBlC4ii1R56c?=
 =?us-ascii?Q?T7iUidXZFfLvqh7I5ZbCRdAG9KMyQZsYRLfwGfIa3td3Ed0WhjeGhzkK3QeZ?=
 =?us-ascii?Q?Kvd2j/F4zvfuRb/wDp8Y3QhI5j5w6KlqNWoQlbmHjjr0kMTrMoXe5gx7GsAH?=
 =?us-ascii?Q?G/oeDWTCF+ttevjNocyoSh3mmdQ7gukaOO5jQs+ylLFgd/Z0cutJA1cMvB5A?=
 =?us-ascii?Q?v6N0vgeD7LuvyxKLivGW6BFMD6K8xlxqA5CS0/rz57Q/D7Uw16njI+5LRHuN?=
 =?us-ascii?Q?H2JSOeqcvUI5ZWPDmbcgmsaotauCjEiaK9GzXdvm5PXFQyVZ5vkCirlVG0tb?=
 =?us-ascii?Q?s8EP8VIEXDj7hnxLFN3EMYearBgu3pexJ3gQN2skYN5Zh1lRoEMqW6bxJHDi?=
 =?us-ascii?Q?VDu1AcF+/YEMbLkwVOWMlW+KqkyhIZ40iu3obrRiEu+3E2QunEpooRY7YCBE?=
 =?us-ascii?Q?YgdYdwh0DaXKIuWiMzbjVI046eljSRXF/+6m22jCDfNg/lKzOKV4mwKjG8/V?=
 =?us-ascii?Q?s+st6fh52BwhEeGSG/3eJ/IN4mVDhIVgYIFEJqXI+4PqdlS0CmZZjUe49VOI?=
 =?us-ascii?Q?hepADSB0JIsvraRrOTHuvpnTlryMbTS8qHuEoiW4/9AWxzYbRld/uPBEcnEA?=
 =?us-ascii?Q?6IIqjZS4ErfJR3xkC6jr67AAwv29L0+8iViPsxERfJqGXGGuIW6Jhh0Gy7Y8?=
 =?us-ascii?Q?zvFy2PcokUIAdBvHBdKtJVokh8+ecS9NBKVQMXdqeb60NhDwfkWH73283b0h?=
 =?us-ascii?Q?Xf6yJaXnngpU4NNkP+4/deGtfHA4BTd7v3IHFcPgdnNG49PL/Sk9bp3QPpnf?=
 =?us-ascii?Q?u1W4tDDT8oDyiHBjzDYlGHB/aWK6R8dzYmVR/asyYIOolzfhDp1t9gBjNAGF?=
 =?us-ascii?Q?sOHUQ9FXkZtQV4cZsz6hfAJiODHTu20TSzL7eBSD?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4418861b-b034-46b2-8699-08dded45c4ef
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2025 13:03:27.1267
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mIYoO0PrKjTVbcgsdQxbwcWGMfxsyUpmbxPCfj30O8JhCeelbBBsY62LuS1rSvaZWaQogT0zZkmfVqLrx663AA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5028
X-Proofpoint-GUID: APtYwmmtPSYEeEBipVFq6kJdF-oOLBDg
X-Authority-Analysis: v=2.4 cv=d+v1yQjE c=1 sm=1 tr=0 ts=68bc3122 cx=c_pps
 a=OauewVb+WCGEzQNaE5WK7Q==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=yJojWOMRYYMA:10 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8
 a=zRBB-alRvS15xu-l-EUA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDEyNiBTYWx0ZWRfXzqtmoIg8ItZj
 zO0rvqieis/FsBJEjbDod9gle7fkU3mNgfHmA3EqQPhiQvyUZdvvXFG362qlUn/DBvhy0HO8bRt
 ntNoGF+svAItZRGFvUCPIj7cfNxu4xwbJt5KO77EstoNDayE5xkI9mEN6FA+EFQ3BJ5/T7eoMkw
 lDrdGOePuaYCXBb/wTO3kQHfgT3zxzQYIGMu7gszJY2QP34uYGokgizxE4n9X8V5pwCrjZHteTn
 OpU3IB8rb8A05k8wSxpuN+ey/abDOtX2Y7fkzabWrmCkm2nOk5w6zzp6Q2BImLewwwtaIV5vfNZ
 lvPzHrcAGs9s77wNklAV1ZGIXpu988grYO+oUU+d2eL3OrJJZkAjZrpBSQNnok=
X-Proofpoint-ORIG-GUID: APtYwmmtPSYEeEBipVFq6kJdF-oOLBDg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-06_04,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 adultscore=0 phishscore=0 priorityscore=1501
 bulkscore=0 impostorscore=0 clxscore=1015 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2507300000 definitions=firstrun
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 06 Sep 2025 13:03:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119323

ChangeLog:
https://github.com/linux-audit/audit-userspace/releases/tag/v4.1.0
https://github.com/linux-audit/audit-userspace/releases/tag/v4.1.1
https://github.com/linux-audit/audit-userspace/releases/tag/v4.1.2

Disable some test cases in auparse/test as they can not be built with
--disable-static configuration.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 ...auparse-test-disable-some-test-cases.patch | 38 +++++++++++++++++++
 .../audit/{audit_4.0.5.bb => audit_4.1.2.bb}  |  3 +-
 2 files changed, 40 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-security/audit/audit/0001-auparse-test-disable-some-test-cases.patch
 rename meta-oe/recipes-security/audit/{audit_4.0.5.bb => audit_4.1.2.bb} (96%)

diff --git a/meta-oe/recipes-security/audit/audit/0001-auparse-test-disable-some-test-cases.patch b/meta-oe/recipes-security/audit/audit/0001-auparse-test-disable-some-test-cases.patch
new file mode 100644
index 0000000000..fb9a901f3c
--- /dev/null
+++ b/meta-oe/recipes-security/audit/audit/0001-auparse-test-disable-some-test-cases.patch
@@ -0,0 +1,38 @@
+From 003983a6e04a5e8d9373a96cb0a1c13caae9b193 Mon Sep 17 00:00:00 2001
+From: Yi Zhao <yi.zhao@windriver.com>
+Date: Sat, 6 Sep 2025 14:04:40 +0800
+Subject: [PATCH] auparse/test: disable some test cases
+
+Disable test cases databuf_test lru_cache_test and uid_name_wrap_test as
+they can not be built with --disable-static configuration. See [1].
+
+[1]: https://github.com/linux-audit/audit-userspace/issues/494
+
+Upstream-Status: Inappropriate [embedded specific]
+
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+---
+ auparse/test/Makefile.am | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/auparse/test/Makefile.am b/auparse/test/Makefile.am
+index 06928438..dad75e76 100644
+--- a/auparse/test/Makefile.am
++++ b/auparse/test/Makefile.am
+@@ -21,10 +21,10 @@
+ #
+ 
+ CONFIG_CLEAN_FILES = *.loT *.rej *.orig *.cur
+-noinst_PROGRAMS = auparse_test auparselol_test lookup_test databuf_test \
+-	auparse_extra_test lru_cache_test uid_name_wrap_test
++noinst_PROGRAMS = auparse_test auparselol_test lookup_test \
++	auparse_extra_test
+ TESTS = run_auparse_tests.sh run_auparselol_test.sh lookup_test \
+-	databuf_test auparse_extra_test lru_cache_test uid_name_wrap_test
++	auparse_extra_test
+ dist_check_SCRIPTS = run_auparse_tests.sh run_auparselol_test.sh
+ EXTRA_DIST = auparse_test.ref auparse_test.ref.py test.log test2.log test3.log test4.log auditd_raw.sed run_auparse_tests.sh auparse_test.py run_auparselol_test.sh
+ CLEANFILES = run_auparse_tests.sh run_auparselol_test.sh
+-- 
+2.34.1
+
diff --git a/meta-oe/recipes-security/audit/audit_4.0.5.bb b/meta-oe/recipes-security/audit/audit_4.1.2.bb
similarity index 96%
rename from meta-oe/recipes-security/audit/audit_4.0.5.bb
rename to meta-oe/recipes-security/audit/audit_4.1.2.bb
index 58100b206d..2cd28e85f1 100644
--- a/meta-oe/recipes-security/audit/audit_4.0.5.bb
+++ b/meta-oe/recipes-security/audit/audit_4.1.2.bb
@@ -9,10 +9,11 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
 SRC_URI = "git://github.com/linux-audit/${BPN}-userspace.git;branch=master;protocol=https \
            file://0001-Fixed-swig-host-contamination-issue.patch \
+           file://0001-auparse-test-disable-some-test-cases.patch \
            file://auditd \
           "
 
-SRCREV = "97c4ec3d68b5b199f2796d1e126c2144506bd228"
+SRCREV = "4db9c700b0c8b24a8113bc00d98101228e7d0212"
 
 inherit autotools python3targetconfig update-rc.d systemd
 
-- 
2.34.1


