Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44BE3D3514C
	for <webhook@archiver.kernel.org>; Wed,  1 Apr 2026 07:31:13 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7546.1775028669413064848
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 Apr 2026 00:31:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=Lyhu5Qx6;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=8551c190ca=yi.zhao@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6314J099776229
	for <openembedded-devel@lists.openembedded.org>; Wed, 1 Apr 2026 00:31:09 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=D2+PvmFHx9uEClidGT9c
	plD5NpcEElYo4rDHB1JCTJU=; b=Lyhu5Qx6FTD6QiZ/T4HTDGkllp6b6KVWeBmo
	Bz7hspfuFNKzZSt74KGcmphqQnwkk64X0TTyfj5krTlW6wEX9QThBiZ0K9sFcAPw
	QDXSuMmHKisEUcU0Ei3deKkxB7a7cKvQpYmZgSEjldM58dgfpuu+khzsJ0dKfKAa
	5J56CxkvcRcPw57lnn6/YzViTE84k3w2mushCTFJUhdOlk/HOQwoxTctwuCthhT6
	cabur27EXdfc03NhGknAzxZK3KO8df3k+tT9N2RIUgrvIV56K2K/2IwCbyLOoXyt
	15jvVowMzR7AViaTJgF+wgcwOG6ZUOGZQesM8vVDgQhEet36vg==
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazon11010011.outbound.protection.outlook.com [52.101.193.11])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4d6a8vcxpj-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 01 Apr 2026 00:31:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ob+tsauQce6WnFP1on2Ihtltl6agt5XD0tRR9JRpVM/+9MJmZTDyLb5EQpyAgK/JJxtenlzWDu3k9gNZnfgZcXzGFxYfMK1XSp8oMQDqj0fXtFPOnE5w7NpCj5J0ngBX5VkICAIQ+4ycf+6lvY3fFlER91qQaPnut1bXY4R2jRdJqPnYNnOFwAT/fV0A8vWK19Ns/BwdY9qCgTDgEWNiDrxjQbNh5PrLzC10L6WTZ06DeAOgUfKjd2gqgO0EVD39DVICeZosq+1OtQD69J0JgZwhIbo35gVYYJk778vDlSefcLP5M6R+eX3xKwEFWoY/BCZ3E21dPFHKqRhDVFZ6TQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D2+PvmFHx9uEClidGT9cplD5NpcEElYo4rDHB1JCTJU=;
 b=EBlT0pQjBNLPfdZl88Sm3Tn4gciZCavK1TwyuWpGP514JV6Hv7mVfdLeixWJbCKgQ6NA7p1NH0PiepgZdG8pPovAjHK6VqaIYy6l4SDgEns0iiSx8N3xbgRnZLaotHniBF/t9kDUgWKNJpsa635UzB7PEd/zSUAPqcXCdG67mLF25hvB3dIa+knigHx2rig5JU/ClSLuYmPEoMg2a6/5hxd2grTdIN2/PJ9jUBOauA/VnKLWMwV0zj483bfydgBR1gE8GfSKTG4CaPTa3rS3Mq7IZHfoIXSVXVNktc7687ycARuP6H8NXA1gYYDLNmQUCHuk9iDY2TqTl6f9Q+309Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 IA3PR11MB9037.namprd11.prod.outlook.com (2603:10b6:208:580::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.15; Wed, 1 Apr
 2026 07:31:06 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::3432:2eb3:d0a5:7831]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::3432:2eb3:d0a5:7831%6]) with mapi id 15.20.9769.014; Wed, 1 Apr 2026
 07:31:06 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH] freeradius: fix radiusd startup failure due to missing openssl legacy provider
Date: Wed,  1 Apr 2026 15:30:40 +0800
Message-Id: <20260401073040.1903993-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SL2PR03CA0012.apcprd03.prod.outlook.com
 (2603:1096:100:55::24) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|IA3PR11MB9037:EE_
X-MS-Office365-Filtering-Correlation-Id: b6411234-29e1-4073-87a1-08de8fc0a262
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|56012099003|18002099003|38350700014;
X-Microsoft-Antispam-Message-Info: 
	+IR6otGwTspIESCRWNUP+Arp9rX4OxNma9EugJtYQqvCOkwH+zcR8HYE+/uY0d5Qk5Dy/A/vvIt0umvTXmEre1uDtAVVptrC8A7YJPOh0pWM1Kzx9Eycuv3VWEOdhbEwhTpBROnAhytmzEaPJ7KsPngQt7srIIemmNj3timoVwvBz34qnK9XEfVFE0+wflQIFTALqi38OyxbN2fd2Okz3AKv5T53fYxnPCT10YoVcyTWCY2+lZKoIypl5Z4vfuqQuEk3LhnPNrnmkh9eXWw3wmzmbtBF+xks+nH4Rgy2yWzv8gCTouhQnkHVrP4zl9tbzIqjBoyFoBLIfsblQMIQMnkGTOHQf/Z6qWFGXcorkA24A199fxJElEEe1FzRA9HjCKg1+nE3oy9LQ4FHBackr+zeVk/K4bIHt/8nuq5Q/iKpdamyWRnumQgBtmfWydIHVd5r75Cx6EPPdcLp9HX84yWJfy5rqz6gqKHYV875j5OgQ0jykC4SH3np12W/KznbiCEU8J+1743z2fLWeaYBCFzQbbzK/zTsSehLC+knx00ST83sPEr42fZKJ9XI9DLY/YYx19l4bemz9YTHr5SkwedA/XNH8XtL0lhTsCXKTK+AJU3AXi+bLFI3LuJ5K9fD4llepXA/bKhZ6S4YwEd93+B+I+OaBE1ukTkjsgRL9PySv0DRo/Zvf8wvaDUvT+98yInGgHacN+5bfIwAL7cip+1y8qMvgrligzTLlg8NuQhFV20qtZUEuq1tJqDzXs8s5qjxSDndo93eovpYKBYTwOEpfu+IBTt5iCEtCAj/q2FZ47YhRj8LDd5K+4UxsxYb
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(56012099003)(18002099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?O9Wjq4xlH5B2045iZtm/HD0vcjLMKI8No9VVqBrFo0PvU4ah5r+sPPapHuy2?=
 =?us-ascii?Q?wrBeMj/V0EvChvtXUjUDJT6UbKx0fdo6ah56rIzaZpKJ5wno2OPA3uuOLe9L?=
 =?us-ascii?Q?zPelNQS/c3ig3Of+SalJkVtjoXDArKu5t2yGr7wRR4kQTFqmz/ZSc4+Ekx5F?=
 =?us-ascii?Q?Pibe5deHvXtC5bJ5H3Qimky23pw+Lur2pGgzxgss9iPL3WQN5muoEGON0LAH?=
 =?us-ascii?Q?Ec62mHvrfikkhnlKJivRWErs+mCtOQNDK62i0oFwY5OtUSrCvhkNnuOd6wx6?=
 =?us-ascii?Q?hyxuYPLAYMyOKqLsO/ZHviFYKhvPixif5k4KINQ+0eDrl3mqfxeYAiGLesNX?=
 =?us-ascii?Q?dVcTbIXgPkGCCf7fFCR1XcFyIim5oEwwbBbvo+Qp1VhdkpeHLApVh6TIusmB?=
 =?us-ascii?Q?b+3Zpb9uyuGiX1thHMw1PokvuiJizOgFs7gOJnql8AHQ0ebJ3VDGna0BDmK6?=
 =?us-ascii?Q?P4UktUr1lGXJjFBw6liXl7FzM1v9OUxGzwSzv44iseA7hFO1BJ9N7ktP44un?=
 =?us-ascii?Q?sg8fGSY0yH6CLVf/g1zlN0Koues+qVRsmW1k5o0CexBe3DDOXMBkibNJ1N4O?=
 =?us-ascii?Q?4B13jDzRYpI/sLMKsjCEPDs8WnW0TmEZZiPgOHLUVTsb8A8lcE+DXmIMSITu?=
 =?us-ascii?Q?SMQjzIpkTbopj9uUzTWShlNeoaxBaOOQci4XYbG0t4TbqWrTKkBatl9Dtgdr?=
 =?us-ascii?Q?sud/0Q8dLJ92ALrZfkTTwj49Rucsi67mP88n0J5zpFXhJtk2vzSUjRbTdO2S?=
 =?us-ascii?Q?Zc+iALgVE5NevBb4iB5+jEvIdKQCCJGrRhQ5Q5WwvX9CHyl8kHUM1Yuodx8l?=
 =?us-ascii?Q?VEwhSe8DFJNBXfzSmeiCuuPux+2G+0i5a8fNGUwQbLL1aIJnnFCm15uNprqc?=
 =?us-ascii?Q?5S6dc3FKqI7qGg+GlPiUu2axIiwo2knspjLiKo6wYIAHLJx0DrIK2Hq/Z3lc?=
 =?us-ascii?Q?RuCcg5EVSZJ1Ogx0Oz8bnKmRozv7f5pcBqZyP18SmHcsyVzdxedmBGsBwOVQ?=
 =?us-ascii?Q?upUF4l/2GSZc3MAq07gGPUwGO/oRT0VLQIODU3siLhC7HEymeVTjKI8AbjJC?=
 =?us-ascii?Q?alVZHE6eWDOJCufFDohc1Bs7rjFn/uVXcLYFKecXYtnDpeQ7jWMXgMW5Rs1Q?=
 =?us-ascii?Q?iICkPtDYLJvIKP40vCPOB0I9cpX0IaWTAmbp3qQnHMjP2rHPf9BvOZZ9FIv0?=
 =?us-ascii?Q?t80ZCxEfgtln9Mw09sYyEkhkfl+Fu/KXMHoQepeXxOYzpbPZVFEfs0p/L7p/?=
 =?us-ascii?Q?kY1IPvnx43u+ejaHyxEdBa05KI28BDRB/bIJDNYNLFPcW5aZJCkzY10XRNAo?=
 =?us-ascii?Q?NE+LHo1t4FtwX5asZmtbn2C2g0IBPOsyNiBkBO7POda8L70Ol21iSri99guv?=
 =?us-ascii?Q?ciweJgnJx0j4lWFkaRSXThvWyzdj2KHsNH/7TP9T3y/HuHvGIZ8WNMqRfDvj?=
 =?us-ascii?Q?nXUdM2M0p069orO0C/mY1vaDYg6+tVDUbzv1NBUNzqq+/7KjKJppanTIX43c?=
 =?us-ascii?Q?90bNPuDkOooq+3/c/oO7eXg/VYS4ZbYlSgRxNVXZA+lNrWm84zysHKEoLuTH?=
 =?us-ascii?Q?LwSmM2CYVFttsnd6FWZ34dD0fqfcHbaXKR/q9cuirtg/gsJ/Sh4GA2pIrxv/?=
 =?us-ascii?Q?CVrJpIS3P4ZEQD4JYBQwgcnoylffDfuJUAJeB9g13ekToRNHMAfwA11xRRja?=
 =?us-ascii?Q?Lw9P5W4N5Z/ajOpLXzlghyJe4GJObRHu8PC64B7eQaF2p6u9f0x7cqsz2bUT?=
 =?us-ascii?Q?Re0pGAWJIw=3D=3D?=
X-Exchange-RoutingPolicyChecked: 
	GnnxoCZBjE20Hqn1D7vjjAvJxG5ANZU2M3QGeLIV/ScWxvlWwDN+uXcUEnNgYiHw1i2KyyPcoczgGZbCWtRsioRRkR8ZAxt2Snb6LFptx5Xpg9Nf2f1atP5XV5CUWsRHVOM6BZDoOQRqgeSqlQ9LUndPONQa+DUFsTHbXDaQUATCyHsD8iBwYDga7d2FB8XeShJjsmOAyIVw4/dSNYE3YYoWMr0Tigqq9UQD1RT+fds3meKL+rDWwIfGqP4loluwlbFlvzTtY3s3k3He6luAE0c/GvIfAdjQ2Pk8TxR/VRNEI5W6yU0givauDDlvgReywlUuSs6KbmFSnNCbMNe3iA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b6411234-29e1-4073-87a1-08de8fc0a262
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2026 07:31:05.6371
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ddwEN64YMEAUn2WRzo4PFCedqRVrn1Qb2SJXFQ+bn02XlXTdjZO/C7AEpOWesQEv3FZ11i8IxeuwTchOOT1jLQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB9037
X-Proofpoint-GUID: 1tJBkNS1DJFgaDJ9vompyUjdK1o-VdlS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAxMDA2NiBTYWx0ZWRfX2LbeJPT1UWp2
 bemIFJnT36EDZlZ4y9n/WY+zxw+EVbfT31eUSkUar8OPiKIKmKKgBv8zybElysWmeDlTkKSuKjz
 BjFOwMosKRjiee/zdivnHk+oIUivHu1wbraK0+W82ZHP50tFqC9njT85GM5xQp8cEtHUgzggwcp
 9BmEfY1o57/ThlJ9PsmzoLqH5qB2FbiGf14VHlAIWuV+4FT6CE4yxzWr2Y4akmunLCk3Nk7sbE4
 ejjV72b7eFn6xnQWl3hInP662IUExPw7SwVoeluECy5UJtRdlZXQposXNHzgJob8wzfMZj859Hy
 eollmGkM88b6RzWSY+toGqGvsfbr3c6K0fdDSrtNrcOlhkbPAY5Pdqu2xWSmOKrW2xPC9tv70NT
 zd0Kigc1te8M9RjDXiF5jgE2zJV9xNRTcHXqK07qfvqXrhGIkYKP0B4REzmhnafVspbFeIoI8lk
 ShkulUFi/PguWD0KAFQ==
X-Proofpoint-ORIG-GUID: 1tJBkNS1DJFgaDJ9vompyUjdK1o-VdlS
X-Authority-Analysis: v=2.4 cv=ZKHaWH7b c=1 sm=1 tr=0 ts=69ccc9bc cx=c_pps
 a=OswsEo8IlqVTC7zrgcx7Gg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22 a=Q4-j1AaZAAAA:8
 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=FcTRRU_JAAAA:8 a=RxigYUuTqU1AEabf68cA:9
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22 a=24chkg8mTlgNITX-x-SQ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-01_02,2026-04-01_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 adultscore=0 clxscore=1015 impostorscore=0
 malwarescore=0 bulkscore=0 phishscore=0 lowpriorityscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604010066
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 01 Apr 2026 07:31:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125899

Radiusd fails to start because the openssl legacy provider is no longer
built by default[1]:

$ radiusd -C -X
FreeRADIUS Version 3.2.8
[snip]
(TLS) Failed loading legacy provider

Add PACKAGECONFIG[legacy-openssl] to enable openssl legacy provider
support. When disabled, pass --enable-fips-workaround to configure
instead.

Backport two patches to fix the --enable-fips-workaround option.

[1] https://git.openembedded.org/openembedded-core/commit/?id=a150c3580f7f4962152444272c0fe07cfdb72df5

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 ...y-provider-on-enable-fips-workaround.patch |  62 +++++++++++
 ...y-provider-on-enable-fips-workaround.patch | 104 ++++++++++++++++++
 .../freeradius/freeradius_3.2.8.bb            |   3 +
 3 files changed, 169 insertions(+)
 create mode 100644 meta-networking/recipes-connectivity/freeradius/files/0001-don-t-load-legacy-provider-on-enable-fips-workaround.patch
 create mode 100644 meta-networking/recipes-connectivity/freeradius/files/0002-don-t-load-legacy-provider-on-enable-fips-workaround.patch

diff --git a/meta-networking/recipes-connectivity/freeradius/files/0001-don-t-load-legacy-provider-on-enable-fips-workaround.patch b/meta-networking/recipes-connectivity/freeradius/files/0001-don-t-load-legacy-provider-on-enable-fips-workaround.patch
new file mode 100644
index 0000000000..594286cdcf
--- /dev/null
+++ b/meta-networking/recipes-connectivity/freeradius/files/0001-don-t-load-legacy-provider-on-enable-fips-workaround.patch
@@ -0,0 +1,62 @@
+From 2c2c6a460ae8cc655df83c8964595581389676c1 Mon Sep 17 00:00:00 2001
+From: "Alan T. DeKok" <aland@freeradius.org>
+Date: Tue, 9 Sep 2025 07:03:21 -0400
+Subject: [PATCH] don't load legacy provider on --enable-fips-workaround. 
+ Fixes #5644
+
+Upstream-Status: Backport
+[https://github.com/FreeRADIUS/freeradius-server/commit/2c2c6a460ae8cc655df83c8964595581389676c1]
+
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+---
+ src/main/tls.c | 7 +++++++
+ 1 file changed, 7 insertions(+)
+
+diff --git a/src/main/tls.c b/src/main/tls.c
+index ba267983b1..c04f3228e4 100644
+--- a/src/main/tls.c
++++ b/src/main/tls.c
+@@ -64,8 +64,11 @@ USES_APPLE_DEPRECATED_API	/* OpenSSL API has been deprecated by Apple */
+ #  include <openssl/provider.h>
+ 
+ static OSSL_PROVIDER *openssl_default_provider = NULL;
++
++#ifndef WITH_FIPS
+ static OSSL_PROVIDER *openssl_legacy_provider = NULL;
+ #endif
++#endif
+ 
+ #define LOG_PREFIX "tls"
+ 
+@@ -3693,6 +3696,7 @@ int tls_global_init(TLS_UNUSED bool spawn_flag, TLS_UNUSED bool check)
+ 		return -1;
+ 	}
+ 
++#ifndef WITH_FIPS
+ 	/*
+ 	 *	Needed for MD4
+ 	 *
+@@ -3703,6 +3707,7 @@ int tls_global_init(TLS_UNUSED bool spawn_flag, TLS_UNUSED bool check)
+ 		ERROR("(TLS) Failed loading legacy provider");
+ 		return -1;
+ 	}
++#endif
+ #endif
+ 
+ 	return 0;
+@@ -3777,10 +3782,12 @@ void tls_global_cleanup(void)
+ 	}
+ 	openssl_default_provider = NULL;
+ 
++#ifndef WITH_FIPS
+ 	if (openssl_legacy_provider && !OSSL_PROVIDER_unload(openssl_legacy_provider)) {
+ 		ERROR("Failed unloading legacy provider");
+ 	}
+ 	openssl_legacy_provider = NULL;
++#endif
+ #endif
+ 
+ 	CONF_modules_unload(1);
+-- 
+2.43.0
+
diff --git a/meta-networking/recipes-connectivity/freeradius/files/0002-don-t-load-legacy-provider-on-enable-fips-workaround.patch b/meta-networking/recipes-connectivity/freeradius/files/0002-don-t-load-legacy-provider-on-enable-fips-workaround.patch
new file mode 100644
index 0000000000..84b78320c4
--- /dev/null
+++ b/meta-networking/recipes-connectivity/freeradius/files/0002-don-t-load-legacy-provider-on-enable-fips-workaround.patch
@@ -0,0 +1,104 @@
+From 2ff8eb44bb626e9e63f9bf06c3bcf3b34291c335 Mon Sep 17 00:00:00 2001
+From: Yi Zhao <yi.zhao@windriver.com>
+Date: Tue, 31 Mar 2026 07:45:16 -0400
+Subject: [PATCH] don't load legacy provider on --enable-fips-workaround. Fixes
+ #5775
+
+Upstream-Status: Backport
+[https://github.com/FreeRADIUS/freeradius-server/commit/2ff8eb44bb626e9e63f9bf06c3bcf3b34291c335]
+
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+---
+ src/main/radclient.c                | 6 ++++++
+ src/modules/rlm_mschap/smbencrypt.c | 6 ++++++
+ 2 files changed, 12 insertions(+)
+
+diff --git a/src/main/radclient.c b/src/main/radclient.c
+index ea64486dcf..52555603e1 100644
+--- a/src/main/radclient.c
++++ b/src/main/radclient.c
+@@ -168,7 +168,9 @@ static int _rc_request_free(rc_request_t *request)
+ #  include <openssl/provider.h>
+ 
+ static OSSL_PROVIDER *openssl_default_provider = NULL;
++#ifndef WITH_FIPS
+ static OSSL_PROVIDER *openssl_legacy_provider = NULL;
++#endif
+ 
+ static int openssl3_init(void)
+ {
+@@ -181,6 +183,7 @@ static int openssl3_init(void)
+ 		return -1;
+ 	}
+ 
++#ifndef WITH_FIPS
+ 	/*
+ 	 *	Needed for MD4
+ 	 *
+@@ -191,6 +194,7 @@ static int openssl3_init(void)
+ 		ERROR("(TLS) Failed loading legacy provider");
+ 		return -1;
+ 	}
++#endif
+ 
+ 	return 0;
+ }
+@@ -202,10 +206,12 @@ static void openssl3_free(void)
+ 	}
+ 	openssl_default_provider = NULL;
+ 
++#ifndef WITH_FIPS
+ 	if (openssl_legacy_provider && !OSSL_PROVIDER_unload(openssl_legacy_provider)) {
+ 		ERROR("Failed unloading legacy provider");
+ 	}
+ 	openssl_legacy_provider = NULL;
++#endif
+ }
+ #else
+ #define openssl3_init()
+diff --git a/src/modules/rlm_mschap/smbencrypt.c b/src/modules/rlm_mschap/smbencrypt.c
+index 9a8a5ab777..531c40ec26 100644
+--- a/src/modules/rlm_mschap/smbencrypt.c
++++ b/src/modules/rlm_mschap/smbencrypt.c
+@@ -43,7 +43,9 @@ static char const hex[] = "0123456789ABCDEF";
+ #  include <openssl/provider.h>
+ 
+ static OSSL_PROVIDER *openssl_default_provider = NULL;
++#ifndef WITH_FIPS
+ static OSSL_PROVIDER *openssl_legacy_provider = NULL;
++#endif
+ 
+ #define ERROR(_x) fprintf(stderr, _x)
+ 
+@@ -58,6 +60,7 @@ static int openssl3_init(void)
+ 		return -1;
+ 	}
+ 
++#ifndef WITH_FIPS
+ 	/*
+ 	 *	Needed for MD4
+ 	 *
+@@ -68,6 +71,7 @@ static int openssl3_init(void)
+ 		ERROR("(TLS) Failed loading legacy provider");
+ 		return -1;
+ 	}
++#endif
+ 
+ 	return 0;
+ }
+@@ -79,10 +83,12 @@ static void openssl3_free(void)
+ 	}
+ 	openssl_default_provider = NULL;
+ 
++#ifndef WITH_FIPS
+ 	if (openssl_legacy_provider && !OSSL_PROVIDER_unload(openssl_legacy_provider)) {
+ 		ERROR("Failed unloading legacy provider");
+ 	}
+ 	openssl_legacy_provider = NULL;
++#endif
+ }
+ #else
+ #define openssl3_init()
+-- 
+2.43.0
+
diff --git a/meta-networking/recipes-connectivity/freeradius/freeradius_3.2.8.bb b/meta-networking/recipes-connectivity/freeradius/freeradius_3.2.8.bb
index 9b05968638..4be127209b 100644
--- a/meta-networking/recipes-connectivity/freeradius/freeradius_3.2.8.bb
+++ b/meta-networking/recipes-connectivity/freeradius/freeradius_3.2.8.bb
@@ -40,6 +40,8 @@ SRC_URI = "git://github.com/FreeRADIUS/freeradius-server.git;branch=v3.2.x;lfs=0
     file://0018-update-license-1.patch \
     file://0019-update-license-2.patch \
     file://0020-update-license-3.patch \
+    file://0001-don-t-load-legacy-provider-on-enable-fips-workaround.patch \
+    file://0002-don-t-load-legacy-provider-on-enable-fips-workaround.patch \
 "
 
 raddbdir = "${sysconfdir}/${MLPREFIX}raddb"
@@ -114,6 +116,7 @@ PACKAGECONFIG[openssl] = "--with-openssl, --without-openssl"
 PACKAGECONFIG[rlm-eap-fast] = "--with-rlm_eap_fast, --without-rlm_eap_fast"
 PACKAGECONFIG[rlm-eap-pwd] = "--with-rlm_eap_pwd, --without-rlm_eap_pwd"
 PACKAGECONFIG[kafka] = "--with-rlm_kafka, --without-rlm_kafka, librdkafka"
+PACKAGECONFIG[legacy-openssl] = ",--enable-fips-workaround,,openssl-ossl-module-legacy"
 
 inherit useradd autotools-brokensep update-rc.d systemd multilib_script multilib_header
 
-- 
2.34.1


