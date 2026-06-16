Return-Path: <xiaozhan.li.cn@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9BCACD98DA
	for <webhook@archiver.kernel.org>; Tue, 16 Jun 2026 01:54:46 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.145259.1781574882936435485
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 Jun 2026 18:54:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=hKVbTRi6;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=0627c5ce3e=xiaozhan.li.cn@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65G1GOFx2560328
	for <openembedded-devel@lists.openembedded.org>; Mon, 15 Jun 2026 18:54:42 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=EpiT8ZAKN
	iHgyxgaWjORQ2p6FnahFUbvvfHQG2YP420=; b=hKVbTRi6am0N+BWDcHaRjgV1d
	e8Q/3XbkPZhaMLdTeke88e1JYuFLfYQqvYZ+dcBrS2XhxYpiM++BcrC/QF4hPKNY
	BzHyA95y08470KmldHqp6eXb/2d/92TZjBgKqa/y+nlB/DIkk7q6nP5VcPtFGQ7Q
	Syk2hBGMCjcsl0+fQ5JPgXV7vgrgV5gosqg/oOw+E8ggjrCUMx7BxlJcxvIgBv4A
	I+h0utpDdTPWYAbE1gH7hTzte+HljXlDMYrntQUBz2FfEw0DI9SQzBSznj0MzhVe
	HWWAmgFW1spdfV6C+qRTcFmAtBdk2l3YuzyFtVFRTddjKHiPTdOuNsPLv3DPw==
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11010060.outbound.protection.outlook.com [52.101.46.60])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4es6qduer3-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 15 Jun 2026 18:54:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cBFgA5qYD8wUkQbxM+lKm8OFPwGdCb7mkCj8sRbJlqRrtbREqI71K5Qnc0DAeXrYEkAYFppLu0C2hbx8Rddrt9Ak1hR7Tfrn1+MmeUt+NbLqQaZEc+CCpAuQ69sOlyUEm91UxbR0pQ1fiuDxuZWbpen8polOVEkRSX/H51zSwNv6EvRBfRtY/8aJDwJQ52Y4gzgVl47ddKB9CgbKNy/NbH2mSDJDL9/nEkOiRQgdxoyaLoEWmnmmz38rVUzI2OZe/Xp1lDfF9UWSkau0Kr3Ev6wiBh44XZaHrEgUSZecQFzLeRB1TPnVYNjyGcvIFiFIE2bQR052RpsRwW3adaqSSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EpiT8ZAKNiHgyxgaWjORQ2p6FnahFUbvvfHQG2YP420=;
 b=d5hSE6kapPZqy6qcLqVWRv91bBteHz2SH1HfG3k/Y5ySvnj4FR3SQ+sMGuAO01ENcrHfzK/zD7lRT3B6g9AQ88/HpdsOUUG82sgRaA7kUPMlYa2tlKh7pUL+J4jZ3biSEqm12vSSVCH7/UfzeQIlJdIkOhcFummkb/XKysudXcGGMWbPGtiXe7OBoP7Hpe0KCZcjLCcbBl6LztPUeMRZb09GAHu4l0NUuB2JSH/kEsOWk2zzV1JhC4fFYvogzn4ZleYFO4wBmFfdB4douJJl4JipN3V0uk4bpS4hwfGpGwOvnMrnJzNZW0gxT0SlMmwW0B03qG88Ni722prYR3NziQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8344.namprd11.prod.outlook.com (2603:10b6:610:17f::13)
 by DSVPR11MB9767.namprd11.prod.outlook.com (2603:10b6:8:34c::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Tue, 16 Jun
 2026 01:54:40 +0000
Received: from CH3PR11MB8344.namprd11.prod.outlook.com
 ([fe80::5596:e734:3fd5:4fc4]) by CH3PR11MB8344.namprd11.prod.outlook.com
 ([fe80::5596:e734:3fd5:4fc4%5]) with mapi id 15.21.0113.015; Tue, 16 Jun 2026
 01:54:40 +0000
From: Xiaozhan Li <Xiaozhan.Li.CN@windriver.com>
To: openembedded-devel@lists.openembedded.org
Cc: xiaozhan.li.cn@windriver.com
Subject: [oe][meta-networking][PATCH] radvd: upgrade radvd from 2.20 to 2.21
Date: Tue, 16 Jun 2026 09:54:28 +0800
Message-ID: <20260616015428.1031834-1-Xiaozhan.Li.CN@windriver.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY6P286CA0013.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:3b8::14) To CH3PR11MB8344.namprd11.prod.outlook.com
 (2603:10b6:610:17f::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8344:EE_|DSVPR11MB9767:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e13adab-310c-435d-f725-08decb4a3a30
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|1800799024|366016|52116014|376014|12006099003|18002099003|38350700014|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: 
	E6eWjcaxX2tY5bTAsHuPHdNbZyJL3ggEQm71r66pzD0KrXwBZ8MU0tg/kqnIFH6j3BuAD1WZ2IpEdgJPNCf3drPcLAGY0oAyCGAWttObk6BkkZmvKoFTDruA02tcMs93MqWq7BndzqskWwJwpQj9suEUXnIpi7e3JW3Uj++xVIrdjZcTjhtgQYvXufmIzJcT5+wT57h+kBb8FzWnPlpBXG71v936n+ykNrKRNRwFpLqnBoyMEGaxCdlEo+J5uEDbaG6y8WJfiXXj+A3ghh3YCtEvsskJwin32AzZzwhpBlxoqdXb0CgiNxkIn0mGF2gJdnvTwdcqsiYMx6dJj4CdnVksiXWSKhFrn71x66fvRKXn29Rlnikg7Dlp3SM+31gSJ9SVSKargNeMPqnIssTuKoPZw3401CA9pZbwO3pkl94/vhWVqgglL+zDN6KCHpq7lMAAg6/dbhaFykS7BO1G9zgQoAmTdURfhQgcWTXbEpYORO0Gqnk0MKScbY0UUIJRlCjxwkDp4InwUAJaX/Ig66bPCQp5nKGI/G16zy9qL7xDcWBfbe3MlRTxnw9g9zFGiFlWNvOr2AQ8j45dq+1sI87NPRi1FTBm49BO5rLC78GQtkiIDmvKG+/3QEGXKd9jrRLbxkfOwYKEBEd3PRPGQeBV7BP/ai+HgmcgvXFDdaY7EsHLErYO0E0m+ObF3qM7p2J18E0i13ge+yvWvSaQZBwZqpZWu3JAMwrWBtE6Gj5vQIolrHE+tcWiofM0eFR6
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8344.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(52116014)(376014)(12006099003)(18002099003)(38350700014)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?agVrVoU0M8mx/l8+E170GaaUFbnjICVbFuvdsPpElR4AF2+k0y67Dr4tsVOD?=
 =?us-ascii?Q?7sbOHEzVl/78Aj88MLKZfKDLwge/0ybawZuvhLoX1gQCUVV8JJChfytkQsJg?=
 =?us-ascii?Q?ZWxUVCrh8b3dlHJiO3ii6N8fbFdfJXHv4upiAsrHoso1ESkmZJg1imU8Tai4?=
 =?us-ascii?Q?3FIlLBbALvGwyQS1SzOMQrMvgipn/GC7howHPim0r4BiA2oqQCyWvpxp6ayW?=
 =?us-ascii?Q?YPsNfK5UV3Vjb3UXRqRoou34pOr2dvFmx2XYbyKeObNAXwizbFgbCml7sJPc?=
 =?us-ascii?Q?WeCxYcB0j1pOIUelkiSOxmpRgmWpN4W+OCO9NCFQOtUycG44uB59xh8+BaZ7?=
 =?us-ascii?Q?LMFzr2t4ZyQGHDm24ymzXaK0Gu3Slz6oxBMY1OpUtf+hiQRLoDzCJ7zY4upF?=
 =?us-ascii?Q?led7jc8dNcJJL9oGs3O6mefkUc5fCxA7WZ8uISgq/DXHJiZKdnpSBnLOsJ4x?=
 =?us-ascii?Q?PapI9QHvWP9hob9uLCGmZzNGXM3WG7u3tW1LItEVjZkxZS0TWETM7AXWClpJ?=
 =?us-ascii?Q?Yd7WC73QPM9L5fTYcTLka1HGku0nlad/1JBME/zIYNfTD9qbd4fUr53Czbcy?=
 =?us-ascii?Q?SR8MNeyP1DaqaPpRjxYap0ll9+CslnmY2dFkK2HeRp27oJ4Id0xUkeQVYMmP?=
 =?us-ascii?Q?erLB50Q3p04gCnLR3eULlINcUSFdSWSHUdKM10AARUIx3Mxh41lll/dShbn/?=
 =?us-ascii?Q?HXG4ajvKZcwmm3AruVDooQYaRwiYq2dgDdgUaS4V8zq7523Kzp/ez3g6caRf?=
 =?us-ascii?Q?hIC0akawvKEiN5o2FHw37C9Q2Nt2uPJLNH+RF11rya1GaaQyhM+bftFkBc+X?=
 =?us-ascii?Q?HGpDTt1hAww6a/IhQUdA3p+EypMkCBZbvvF+GjL2BaDd07TcR5THcIYnvErd?=
 =?us-ascii?Q?kXXI2A6ikCi59E6itPJbJM6PCffD4w70xFVvrcMyfSAmwe1NV0QGHDEyXe9j?=
 =?us-ascii?Q?xfXd/RNuNu3oFzddPswu6aatMWSPAY6JJqJgou+CePd56+d6NKHHV76en+PZ?=
 =?us-ascii?Q?2JBOvIs4rcKnxgPW2yL6L02MfrQSBGd95jWYjZ0rc/YXWxE7IXbTVsfkLk+m?=
 =?us-ascii?Q?eSj2h4xoSqMj7AbqO6oeBnY8fjNwbEpMvombE4sl69acsNJ5/hlkQAIUGJD+?=
 =?us-ascii?Q?XrHQJ6OfzeGxzPOmWtgW5MrnjZohHOb2Ge7Fm2KL6yvo70yNieriXqDZ6z20?=
 =?us-ascii?Q?AzWaHoS6O44taLAIkxyH3GDUV4qCPMr2bGMjgO6fos24oOETIe5qmQhbVlLK?=
 =?us-ascii?Q?dM57SD0UgpHKlOp9OflQPilUh9onzGOZdc+DdNdBwDu17nodFd5EwOpJT0/X?=
 =?us-ascii?Q?xATywAV5uWffLp9YtqYM2pI+Xd7zpWl4+K7xhfrqg1LJ41w+n3YtjxgsmW5V?=
 =?us-ascii?Q?EJhRbQQDzIfK39pVXlHnytpCsymE04UgSOxG5NHbDWX69RuYYf+wnahNJtgo?=
 =?us-ascii?Q?/6HVPa6E0BdPk6QToHV1KknDT1Qpf6FiGTd3q0V5dO8NLK4FtgQmWFIhn1N3?=
 =?us-ascii?Q?wtEAxGZut4q513JwfGjLVaJR+y0zEgdjx0ekSL/tvKewqjruaScNMHl0asli?=
 =?us-ascii?Q?qpDoH/GYLpgPe/MQYm8idQO2azEk+6lWlV627qYGF3/00I6tg7hm3/v8E5Xr?=
 =?us-ascii?Q?LJlh9MV1KFmr3N9qytjjqaCLemr7UEV0DV78OjRhjuaUhqO49YF1jBc/qieB?=
 =?us-ascii?Q?17IDwqB2KfTtScvAIrXVRUo8tvJqOKyUo8+yfBIA6Rz5m+HMpeXsgCO7R0XC?=
 =?us-ascii?Q?p1uCUiwXrXOeSUZB4uTbC3bApQIxcys=3D?=
X-Exchange-RoutingPolicyChecked: 
	dpm6oKT8+KCAENERnLD3kCPaS7gSTkYW/mzpnH4d5PXpBMW0PEtMG/rNby9FAxjpzc1E924CRjkhD29gPB6Tc14APWz6h/tMNWFvif4YLsYMqrobX//Yfg9QeOjVQlwOhu6G0bBw4LBdZE+9r1U4vrrDP8/gizEAAbFzsS9bohI824z83iqUJvuJbAtEVYj9DdHNjBY78k4ZFfa/NtejKHp6Qd6AwDyf/gRQ5jZecGS+Xd2hgvkGR9aGhfRqOQ5vAYvbKzq3n1t18m5W1aisbc/pDFd0lP+vgkeOG3+tKDteMCODLitcGAoD9qR4cdIrVD5JSrRi8+ZUetWIOZ0YAA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e13adab-310c-435d-f725-08decb4a3a30
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8344.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2026 01:54:40.0121
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: db8DE9Zx2UBJagNmv9cdBkP0xkwY1jXfDqstPsaljk0Fi+Ds6ZIGhiPU9pwVa21D6utYW7RUHpizbUR59y3MmuAOVycLFmk9hRYBcDnOLUY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSVPR11MB9767
X-Authority-Analysis: v=2.4 cv=DLq/JSNb c=1 sm=1 tr=0 ts=6a30ace2 cx=c_pps
 a=fY0JyvE1RNjZr0fjhzOn9Q==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22 a=n05QOZIoAAAA:20
 a=k8RB6--xAAAA:8 a=t7CeM3EgAAAA:8 a=tFWjk6kdHDyyzFrq6ecA:9
 a=Bk4fAJMWwHb4EYOhdZbW:22 a=FdTzh2GWekK77mhwV6Dw:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-GUID: 05RsDQsuULuAOKOMOKDAAGV48nIZDlHu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDAxNiBTYWx0ZWRfX2w/roAjkHRE3
 w7wtAKY51l4xdY7BrPpLyPbG9yNaO9OXI6icKaHFDToRJHi5AKDxmMTAVl/tw42I6qVeP75ceJ4
 C51xjUxtGMBhaoHm2eu+QPTZ4gQLUpQZkbRjeWWGyW/aTW57K5M4fPq3M3ayxVIfQInYRj/b6DS
 Vao4DAOQLlr+RSI8SwSYUk4LlYkr4F394rpfWKeml1VFVBFnCjyhZXAFpOvtmq7Z0uU97pSpl9+
 eL6wWU+6MNk4duarcp/R+GGYVAlelVUPC6Z+n9u1XZyRxkKx/mNv/U5Wl/z1hc/GWosvGpEG7P8
 VAa+nR2zCUZxjT+F928DOPJkjNwAQPH6vo8R1iK75JXGd6LhMCII63BfUkWXz0xmqckxmIU2SxR
 N52x2KU+yed72rOVz751p+ubv3Eqs8n9jbjcBjLS9jbWghS2SgnH+sVU/+LgtJ2IcNqq6leZv9D
 GSfGz4W653LhQ7DE/5g==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDAxNiBTYWx0ZWRfXxu9e2NKg7aYw
 NbyJQDSql3zeOD1kPd2LY2TU9R6mb0NLlhoGnEMp0l5So8IpGSh27IPbb7yG1JIIhM+KAghdtj0
 H/NFQrTL6vr9SHv5D3tlEkERVU8pqKXduABlBW3mkhbO0+i7yp7A
X-Proofpoint-ORIG-GUID: 05RsDQsuULuAOKOMOKDAAGV48nIZDlHu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_01,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 suspectscore=0 phishscore=0 adultscore=0
 impostorscore=0 spamscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606160016
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 16 Jun 2026 01:54:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127598

Release notes: https://github.com/radvd-project/radvd/releases/tag/v2.21

Signed-off-by: Xiaozhan Li <Xiaozhan.Li.CN@windriver.com>
---
 .../recipes-daemons/radvd/{radvd_2.20.bb => radvd_2.21.bb}  | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-networking/recipes-daemons/radvd/{radvd_2.20.bb => radvd_2.21.bb} (92%)

diff --git a/meta-networking/recipes-daemons/radvd/radvd_2.20.bb b/meta-networking/recipes-daemons/radvd/radvd_2.21.bb
similarity index 92%
rename from meta-networking/recipes-daemons/radvd/radvd_2.20.bb
rename to meta-networking/recipes-daemons/radvd/radvd_2.21.bb
index d02433c5ec..01dc6fd8e7 100644
--- a/meta-networking/recipes-daemons/radvd/radvd_2.20.bb
+++ b/meta-networking/recipes-daemons/radvd/radvd_2.21.bb
@@ -14,14 +14,14 @@ DEPENDS = "flex-native bison-native libdaemon libbsd"
 LICENSE = "radvd"
 LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=73ebbf7182ae996e65e8fadc9a8c45db"
 
-SRC_URI = "http://v6web.litech.org/radvd/dist/radvd-${PV}.tar.gz \
+SRC_URI = "https://github.com/radvd-project/radvd/releases/download/v${PV}/radvd-${PV}.tar.gz \
            file://radvd.init \
            file://radvd.service \
            file://volatiles.03_radvd \
            file://radvd.default \
            file://radvd.conf \
            "
-SRC_URI[sha256sum] = "af37c5a81d59f3bdc00d83056606ffa1810d4550beed6caa4f81181246494220"
+SRC_URI[sha256sum] = "09e5cf7712397463fd35ebca71f3c05f7d31cff9246513f12d03a359c40b089c"
 
 UPSTREAM_CHECK_URI = "https://github.com/radvd-project/radvd/releases"
 UPSTREAM_CHECK_REGEX = "releases/tag/v(?P<pver>\d+(\.\d+)+)"
@@ -60,7 +60,7 @@ do_install:append () {
 
     # Documentation
     install -m 0755 -d ${D}${docdir}/radvd
-    for i in radvd.conf.example README; do \
+    for i in radvd.conf.example README.md; do \
         install -m 0644 ${S}/$i ${D}${docdir}/radvd; \
     done
 }
-- 
2.43.0


