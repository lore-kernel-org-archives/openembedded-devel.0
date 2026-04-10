Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA408E99060
	for <webhook@archiver.kernel.org>; Fri, 10 Apr 2026 09:26:59 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.152251.1775813219221005445
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 10 Apr 2026 02:26:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=jr3NR8p8;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=85604dd2b6=changqing.li@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63A5bTV12768169
	for <openembedded-devel@lists.openembedded.org>; Fri, 10 Apr 2026 02:26:58 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=8uzFt69qiUh0GTFdB2GCtEJchDNChIkhwmfqwYRtRs4=; b=jr3NR8p8I0F0
	8g4k1kNCfUuy/QaKxU4UH3DajEZKUQnW00Q5hGRzFxlEkzPGJ+ybJAUlMaDl3t9f
	YrXwUozKBT/hAsbzHbJN7TXwWPj6MpdXJO+y+c6317O6eoyYGugSAFa83k67N50J
	A74g2ojQ+LbStl4+Jx+kBSC6pjp3T0hu/x2kbWiTQlPmcLEFNP4G9C2Pu5P3xZfN
	PWz+Q66p8C10UOQAbFKS6zk9+tvlhfwoLT49E+HmJ4MWSIuQ/uxFdz134cKVQog8
	SeSbdoU9YYW+GI/+Xku1xEqS8GLZexI3o6oyVbXAfMqsT0M49Z+BQfj6TteIeTG6
	B7oQS7F8Bw==
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11010034.outbound.protection.outlook.com [40.93.198.34])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4dcmryn8cj-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 10 Apr 2026 02:26:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RhS10+QZmU69JBAarb90MwSm0+fZHQRBo6eii4oqmGWp1x4QcwFjvp7DFkT4pIAOgmAMWi4A+8Os4p4sCSwiOpaCplAWOZZCGyqHKxyQFLhO4hP7Gos7k5Oz/dFmHxx1FoUw38mA2K8xCKwEjeGC/FtRgtDVAkUjH0tVOt0hHwSRKjYNfG1m8BTaRKFOGRz0qCK2gulhbmgFcfvMMj3zY1rdw3b+hEat3C82tVHilf9VCoGrU5Y/EkgdqAMs/9O60uocxntEZRF5FoO3K5Zely32oklKdiLorPhc7oe/0VEOWdE6Zn1GNbha8gT8P+m8KawevqMDy+3JOhaZIrhFsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8uzFt69qiUh0GTFdB2GCtEJchDNChIkhwmfqwYRtRs4=;
 b=DQKj60sqvVR9aBVxq5U+k5MkbrWy1OXT6wO68+r0pKTlE893Ou+nh4TjANjCwgPG45YFhQcP7KrRHMqlaFtq10DN26EzhovEVG1KJ8GcdWQ+MlX8cscbCjUWzX12vnXVKtG7yTLF8ghy8J8rHCRMPFM+JsstVZrmIwqf9cEMaBMwsTW+cTE/mWPwWvLUfCJ0oezEpARyRIsRek47JpteX4KV0qa8NxqpVLW8sZLrtLFRe6Fyo1h2f1w68yfGKLEqF5Jz/syhtSLEn1h3AuBShnxP5XpIYBUR29G1m+frNTJYiakwyWfMLyAl3wt8D8gGHQj5YsaIvLNPMPs56eqy7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7312.namprd11.prod.outlook.com (2603:10b6:8:11f::18)
 by SA2PR11MB5081.namprd11.prod.outlook.com (2603:10b6:806:118::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9791.34; Fri, 10 Apr
 2026 09:26:56 +0000
Received: from DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::531e:6ef5:812b:48f6]) by DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::531e:6ef5:812b:48f6%5]) with mapi id 15.20.9769.041; Fri, 10 Apr 2026
 09:26:56 +0000
From: Changqing Li <changqing.li@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 2/2] dlt-daemon: disable DLT_USE_IPv6
Date: Fri, 10 Apr 2026 17:26:33 +0800
Message-Id: <20260410092633.3295675-2-changqing.li@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260410092633.3295675-1-changqing.li@windriver.com>
References: <20260410092633.3295675-1-changqing.li@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY4P286CA0030.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:2b2::8) To DS0PR11MB7312.namprd11.prod.outlook.com
 (2603:10b6:8:11f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7312:EE_|SA2PR11MB5081:EE_
X-MS-Office365-Filtering-Correlation-Id: bef16d78-16db-4024-5ba7-08de96e34f4b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|38350700014|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	1h1ahB3yhG7Rfm9ttRA79l6wgSx8AiaPqAoleOYx7mbBgpVP7GFYypI0jRUPzyyZHfpvRilRplwp4KA4PQ2nyoJkaOM3N3TwDPRRuebSzLgWeopvEch/l61Tz9GQTAMWHiaz3vpH9OHF8e+nOWifvcwOi1Kmmma9ZM1nBA5cqfCEcZ7L2xBo2wKQ29i7TXVzFj3NpEwlwmgY/WeOTJU4dzt9VHHuY2GGtj50AbsJ9iW+YYDA2+m0ZniZjhqRXGMJfq6rNFy4+Tr9lK6QvfswNrgD6MGVZx/g42jkZS2i33EDPeZqp7HXZRLfEpjfAhds2YW7wM+1xbYSKorS53RLK6wMSFCgHVF0mFyrjOu1kPSUdmgSOi3aeGSHl6zQQ7nexy/7hdvcZnPtMBXmBfbMX/40+QxMQGSIUkzz9r04JULjUUtMdRaSjR+Gw2nw9yMlCrJmJAHgSfFpQWzf6HNyUkulczkD0tH14G+UCjLeijFeZcRM/SpXUdSbAq7Ql4yhXTMTHnZVr+mVAV2CZaKVHN+wy/rPS2uOY56ljvsBU3nYFN9kcRTppO7NYvng8IJhR0uck+wXQZe05VECO6ZsTftDy0lRv2Te1xYJ48niOvmubuUeIs9org3kH3vFNCLy5WOrJDrYxpi4hJY8iPg3vQVaMK783Hksh0+etJYHsVwcxWkcsY//rbGJp/R6pQykD3nP+Il+jy30vW7zJvY8QD1nrYYPRWnDdTsb+qFuCpUB8Bd/QLorJ8j9mGIPgjdshrSXnjMctya7Hbrl4CwLi8qcAclGMn5apDsxQBpRnEo=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7312.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?D8J1TmoWQH7wzTqq6QJkR7giCapJ90gKDcsUvIu3MdDQ1yAAm3p/LEzGlmYl?=
 =?us-ascii?Q?M5I6+HOLRQf0EGPUf9WB2xr0iwyO6bJZ29Vxl5H1lOGbE2mRm7B0nG+uKm+x?=
 =?us-ascii?Q?qyBbYxaYPaJ2qDGGqfO8r/ut7+0uvXMMTKVTgoQIgtL2B3ilhG9ghKz79lWU?=
 =?us-ascii?Q?Yv2UdDyIY/I/762zzcOZCf85ds5KPmMx0umKdOVgDEFcqoAdoBAXr/BtZX0G?=
 =?us-ascii?Q?FH0fCu6V8HpB1xJKy02VJi7bRVz4P2R+XmFpQcYKFN59Ffm248RxkKbzxmwW?=
 =?us-ascii?Q?WVuiTRcJbhhhezQvRC7S/3/ceHUn+VaF0EzMgxtZCD/dd1oX37/puVw2Fh0G?=
 =?us-ascii?Q?hZJ1fKcZxMJ+9ARR8bMjaSuxgFyQJi3S9Wnk46k6pCkwmXXxVeE9BVjzbjmq?=
 =?us-ascii?Q?rcwrp50dKWOZSDJnAqPIfG/yHjTboem6rtJbrBIy+EDsVw2aNAAAU6jW+9IC?=
 =?us-ascii?Q?0+G52b5jLZvrH+oaF9Cl1gYGj0NU3OTVFjq3jEk2HNXcVsp+q2PCiuM32EjW?=
 =?us-ascii?Q?/khLB2aFiJ6dsA8J4DMCObCmM2DAPEpi4uzAAU/ovuigaDBJxjechrDRWdbR?=
 =?us-ascii?Q?yW6iMkX3Haj/3xCNtRtA1HzrrX/1HPd9th9DmYJbtE5wXkSqFMmcGVEiC5Tr?=
 =?us-ascii?Q?+KxeQ7CQk/ntBsmWJvSyaXES9NsarDzNbitZM8t3joAHKKk1sI4nuQB//2c4?=
 =?us-ascii?Q?vDi31OvI1LilNtlPQ0afXEL3Jwastqi2YfxHK9LL3gOPghpxSdXrSqC6v7sJ?=
 =?us-ascii?Q?wAXJfwct1HgU6ReiiVi8b37p8xA/v3551I5ELzM8PdCNEoDBgIpGtAuywuE+?=
 =?us-ascii?Q?0p1Ds3cssAsBWypE7MJq5mu95ZS/YW+VfaCIzlbSs/YRWSgUg3rnPDPrE+IR?=
 =?us-ascii?Q?kNMGGyFWUrcfWrPQEtbRv6mZTfcW1ccXuZwR4sf87sCgULOUPAhHF6eS2nen?=
 =?us-ascii?Q?6oA5kzMUePHvdeJIre+8P+EMK/nzy+oNqhD9UpdB9qktUg2nAY7jbzihvzN/?=
 =?us-ascii?Q?dKMGSEWYk00nuqT/qYgsCIczwYsBZU/8dRwK4buzTxMhFYovS+irThDD89wm?=
 =?us-ascii?Q?L4AUR1f3St4/tSm4w/zlZ1YFaG/zJE2yKoSPWpdXO2nxDxPiBJBlNEbeyPl1?=
 =?us-ascii?Q?5HOaSeGcsb7ry48QNAPsZe1XVCWn2jWh2PFKel4gzeUiRwTA5Agkl0Ro7r6V?=
 =?us-ascii?Q?pO4hAsqmoNRKSfzD7SZzkzv5YajXHXUxx5zridVyqIVMEOI37gqxzXTZyBS+?=
 =?us-ascii?Q?HsQ4wZcwnR6TfZaSSyS64SJtC5aAJHpx+Ceb8MvjUxmRm9RHdvyu2WUcUnuu?=
 =?us-ascii?Q?lz9Ww2e+lcta8PnaQsPTr0Um9VL38R/ITF0O1ISlas3nNv+3hd5mbxgLo3ub?=
 =?us-ascii?Q?/6h0fJ0Z+21RihHfvsXTw6L2dAOYy45i0HkbalPCrBhzq5JeQVwnDp2B0FMF?=
 =?us-ascii?Q?aNqJLAyCVwnWCOkCQli5w6MiRvwFzhDe1kVgwPKGmK439x6eQHwYcpxnxH/X?=
 =?us-ascii?Q?T0yReIDacOlJDvmXfwExyjm+hg0npOhu9xOXPsyetbndnK09NJec6IyFwb9H?=
 =?us-ascii?Q?JlPLTrCyKZ8ADomyth/548jY6JMGuEY0qLfigw3rhye95lVwgilP0xx2W3Ay?=
 =?us-ascii?Q?YvPtfZNSLOenOY9TyO+j/glFH0lDTvv5bMwDxoJSgmZN1bUAmm4IxjcizMRp?=
 =?us-ascii?Q?wmOqGjCjptAA/eY8wItu6oELNFdPYQ64FTOBowsx+jacThJn14p+uWmNhUfi?=
 =?us-ascii?Q?gihfJLGdvldY0BxC0SYzepiQjKwO4rE=3D?=
X-Exchange-RoutingPolicyChecked: 
	CbHUOa5Few//aSnHdIMxqtvM5Zf1Nz6hDAmurJCxRpj0WqaGaS/WgwAxWPERVJZ5ca7M19gvTcntB/qpys5RAicZps0Nr8iXz+XIW/+XUhOE2lxfwkZ4WIthTUDju2U2gwVENcCiIntns4Np+xyQFpYYbV7bRbXykHVSBcMhxRwG0HYd5EG+PqU1CbpsDHgLHHqJ8xQQDy1lpEx4a3BvSFMm8QWBdf77r6j5vqkamDTnaYv9gHgnVGIeBhf/ghz5G1elixRRlWld/X8rixJRfRbuiwwuxT0jo3oJ5v76LEmi52vuENe6sJ63jsvPKFhfY6XAqPekr5QodiO1EWXBHA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bef16d78-16db-4024-5ba7-08de96e34f4b
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2026 09:26:56.6819
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0zdTAARq2cURDRBR4jhnpmzweTkol+uPqGSYHHat9B2867DYeCH+K8n9ja5leJ+bMjhwMHPCx6JE9OTWRQPJVMAV9/l/RcNwcE1+DSeFqNU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5081
X-Proofpoint-ORIG-GUID: sHZ_clbGsBilUpG3U6PiMEAC0OxzTaon
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEwMDA4NiBTYWx0ZWRfX0SFmQA+goCfF
 qI9oBPNfumylk3r/kCl5zYaIzEz5NIO7ebBscwJzBxd+mEhUccb3bMffeeDatDL1NQV3Ze9bQu/
 3t5zmHkdswJg4AQ9O1vrt3vmG3abU7XeCyVqYsY7jrtAXiXVETcr8/iUfEjXjyMYmi2NOXm0VHH
 QVknwJvdB+bnZaSrh3f7NoEKxTZRoYEr77pSLURDHVqYCiBBTezDLCUCjE52u7wY7CUpRgzvfxJ
 q3UwaNP6C2BLYCKZZgGdeJBUZU3pKAQ/3JeTER+CcWEkAZt6aNQym0BqCrW8zJRRDSG2YFrkV7g
 X5JhXwEWCp/KF/v6mkQLhU2Y11DLL/lEHRjzk7BtcSI1CExe1qTqEL0wQObkbwdI2dy7VXFV55x
 m0qDCUlnfZ2wvVYGeIimPwV971P2CKIx3xPdBhIxiB6ww50RpI8gYOW/Zx6WUfA023todmd62gl
 y5rXyW6q4ql80yzattw==
X-Proofpoint-GUID: sHZ_clbGsBilUpG3U6PiMEAC0OxzTaon
X-Authority-Analysis: v=2.4 cv=Wcg8rUhX c=1 sm=1 tr=0 ts=69d8c262 cx=c_pps
 a=sh6lJpoQSmOZbBTv2jax/A==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22 a=NEAV23lmAAAA:8
 a=t7CeM3EgAAAA:8 a=uVDEK-M40w8wjXSG_7oA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-10_03,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 suspectscore=0 malwarescore=0 bulkscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604100086
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 10 Apr 2026 09:26:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126237

There is a bug when DLT_USE_IPv6 enabled, refer [1].  This make
dlt-adaptor-udp.service startup failed with error "Bind: Invalid
argument".  Disable DLT_USE_IPv6 to workaround the issue

[1] https://github.com/COVESA/dlt-daemon/issues/849

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 ...ix-build-failure-when-systemd-is-enabled.patch | 15 ++++++++++-----
 .../dlt-daemon/dlt-daemon_3.0.0.bb                |  2 +-
 2 files changed, 11 insertions(+), 6 deletions(-)

diff --git a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/0001-fix-build-failure-when-systemd-is-enabled.patch b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/0001-fix-build-failure-when-systemd-is-enabled.patch
index d19a23cd9c..b1ba08a7d3 100644
--- a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/0001-fix-build-failure-when-systemd-is-enabled.patch
+++ b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/0001-fix-build-failure-when-systemd-is-enabled.patch
@@ -1,4 +1,4 @@
-From 28322f951bb8510ddb4cf767426a67c81ce826ab Mon Sep 17 00:00:00 2001
+From 6a95cc20d3c5adfc5c16f269f6dca9f7e2305b4e Mon Sep 17 00:00:00 2001
 From: Changqing Li <changqing.li@windriver.com>
 Date: Tue, 17 Mar 2026 13:04:11 +0800
 Subject: [PATCH] fix build failure when systemd is enabled
@@ -42,10 +42,10 @@ Signed-off-by: Changqing Li <changqing.li@windriver.com>
  src/system/dlt-system-logfile.c          |  4 +--
  src/system/dlt-system-process-handling.c |  2 +-
  src/system/dlt-system-processes.c        |  2 +-
- src/system/dlt-system-syslog.c           |  6 ++--
+ src/system/dlt-system-syslog.c           |  8 ++---
  src/system/dlt-system-watchdog.c         |  8 ++---
  systemd/3rdparty/sd-daemon.c             |  5 +--
- 10 files changed, 40 insertions(+), 42 deletions(-)
+ 10 files changed, 41 insertions(+), 43 deletions(-)
 
 diff --git a/src/daemon/dlt-daemon.c b/src/daemon/dlt-daemon.c
 index ef42f89..8c318a4 100644
@@ -329,10 +329,10 @@ index c35596c..b17b8ee 100644
  
      /* go through all process files in directory */
 diff --git a/src/system/dlt-system-syslog.c b/src/system/dlt-system-syslog.c
-index 59e9d3f..d6b1b8a 100644
+index 59e9d3f..f0bf3dc 100644
 --- a/src/system/dlt-system-syslog.c
 +++ b/src/system/dlt-system-syslog.c
-@@ -88,7 +88,7 @@ int init_socket(SyslogOptions opts)
+@@ -88,11 +88,11 @@ int init_socket(SyslogOptions opts)
  #ifdef DLT_USE_IPv6
      syslog_addr.sin6_family = AF_INET6;
      syslog_addr.sin6_addr = in6addr_any;
@@ -341,6 +341,11 @@ index 59e9d3f..d6b1b8a 100644
  #else
      syslog_addr.sin_family = AF_INET;
      syslog_addr.sin_addr.s_addr = INADDR_ANY;
+-    syslog_addr.sin_port = htons(opts.Port);
++    syslog_addr.sin_port = htons((uint16_t)opts.Port);
+     memset(&(syslog_addr.sin_zero), 0, 8);
+ #endif
+ 
 @@ -117,7 +117,7 @@ int read_socket(int sock)
      struct sockaddr_in client_addr;
      socklen_t addr_len = sizeof(struct sockaddr_in);
diff --git a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon_3.0.0.bb b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon_3.0.0.bb
index 609566a1b3..1c15ef0483 100644
--- a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon_3.0.0.bb
+++ b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon_3.0.0.bb
@@ -54,7 +54,7 @@ inherit autotools gettext cmake pkgconfig systemd
 
 # -DWITH_DLT_COREDUMPHANDLER=ON this feature is too experimental, disable for now
 #FILES:${PN} += "${libdir}/sysctl.d"
-EXTRA_OECMAKE += "-DWITH_DLT_LOGSTORAGE_GZIP=ON -DWITH_EXTENDED_FILTERING=ON -DSYSTEMD_UNITDIR=${systemd_system_unitdir}"
+EXTRA_OECMAKE += "-DWITH_DLT_LOGSTORAGE_GZIP=ON -DWITH_EXTENDED_FILTERING=ON -DSYSTEMD_UNITDIR=${systemd_system_unitdir} -DWITH_DLT_USE_IPv6=OFF"
 
 PACKAGES += "${PN}-systemd"
 SYSTEMD_PACKAGES = "${PN} ${PN}-systemd"
-- 
2.34.1


