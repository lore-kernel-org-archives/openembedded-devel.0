Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7551FF885A
	for <webhook@archiver.kernel.org>; Sun,  3 May 2026 04:36:15 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18626.1777782964280695996
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 02 May 2026 21:36:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=T8TvGi+q;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=95835b5179=yi.zhao@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6434RHGO1311432
	for <openembedded-devel@lists.openembedded.org>; Sat, 2 May 2026 21:36:03 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=ymFj0D6x36pgorMOzTf8
	ifRYUSMPXScU+QSfam4sCSQ=; b=T8TvGi+qB162VWIed6t50Vqo8GCSSx4vW1nn
	dYkSqRzguGkp4VOZrzbZHkCnkyq9BgV/9gOV+CHGrKgASkQGYu4F9xw+bJBPzSAU
	gZZu1Vkuh7bBzDV9BRkkQ2Z8NkN3WKpR81H1F3S4nxtJsDNoSQZ3rRuk3M8Kd9C7
	qjFhsDh27nHFQisN0xgnw5SzLUoyrgxzVj1aTSp/l/ek1ALDfhuNg0CKp/PmF+Sg
	IPcAXRAm8JMQ9rbqLAG4vs3nMgvFEueYLTdV8pSRUEXY9ZPiUJVLWUnecxLDDlhv
	aJrPpErWYCRzpp8MCKhIgVndeT63O0AHfS+rR41kyTHM6n4qsw==
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11010001.outbound.protection.outlook.com [52.101.56.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4dwchyrpwk-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Sat, 02 May 2026 21:36:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I+0Kgb0kAn4dIIAP+5xTkA8B1bIxvUorv+hS5xaKFQEjvj2v5+UQk5Soa//Ti6rgRZwoUUc+TW1wSoB6T14C8Vo1giqnHka65Lb/xx/Q6H5xyP55otywDrYJ4JSz8ZAAcSsMBUjr4+1tOUfqq5eXSeXbtsg6GQ0TRDf7sL+OdUK5761kGvxGgYOSrIoec4oFtJ0HQuHOrGBnPU9NFUGhgPvYLqNnpC2I8BObuGFco0N4YA0wPnIYBQo6lnRXrMc10qweAsMKqZeN2WA+crdoo+qOgSO6VaGXuhmD9m8jxQvvuMsfstJzKngoK5LJdtVo9deolCMb8finE3hxztbdkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ymFj0D6x36pgorMOzTf8ifRYUSMPXScU+QSfam4sCSQ=;
 b=ZBL2tKrLYSSWawbHMwcIUcEgzmgKohxREHrQTXux00IzQM+iFKFxZGS/+VqilvSqf4Dgs7ILTGfBJirA6jvOWqyI53HzlRQ4WC5mGlS4BKFna9LmUn3I1qOy3D2mZRQB0hJnggVZFPtvU2uujcbuoeAJO+Bv3rlA+BLpla2nYa4zGRHNre2V3jYjvBFY+2d8Go0TPH1CIeuAHRWvRYhvUsBPk/VbEYNZ0+p3Ti21yD5GykfhYeJVRTfUqDvD+OeRiPAGen5pcia8b3tOCpjWMWGZtFGdJvpSa+rBA+vG7DCTBU0sSFJAV32ZUbBcotdvyj4YHWKO0J8s3sZzz2K2Rw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 BL3PR11MB6506.namprd11.prod.outlook.com (2603:10b6:208:38d::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9870.24; Sun, 3 May 2026 04:36:01 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::3432:2eb3:d0a5:7831]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::3432:2eb3:d0a5:7831%6]) with mapi id 15.20.9870.022; Sun, 3 May 2026
 04:36:01 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH] proftpd: upgrade 1.3.9 -> 1.3.9a
Date: Sun,  3 May 2026 12:35:40 +0800
Message-Id: <20260503043540.4063775-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR06CA0239.apcprd06.prod.outlook.com
 (2603:1096:4:ac::23) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|BL3PR11MB6506:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d8157a3-8ed8-4e59-4612-08dea8cd7a73
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|56012099003|18002099003|38350700014;
X-Microsoft-Antispam-Message-Info: 
	aiXWrsuKLSLvrWmpJbE+HezBhoecELiHkTTRczDgre9jGYKSTCWDhr4rvv1ABPk6uIKwF8JT7+ULBrK6gMEUsHmIp59YtX3xYyv9gdToZvoDODzVemozwFytm048xiQlH5Ajw395GXpu/2ePUvq3cS1F4m+W00Osz3GSxcIIbB+umI9T7MQdXwLD36cmW7SATeoEZpsw3xFMNDzov1NztfiouMA72UmGf+PTApLA1JUJwEQpA7nWKO0GzdTvMOzRZeKQYXvEi2dZWwOM/S8Cw5QSPUuNyXJmqddv0cD30eu1UWNMjNMZMDr2Q3lgwuxllSWirro9smkiv08sRS+3mxDUBi8yl4CUXt6vToA2FQ2xWQQzDY3r3wHiQM+imhJR6NaC999+wb0hfadR9y+kyoFm26yEKWkOmr1jsk5kKbH07g34rWMsCAw2mMpZ0/wV+m01sXDAqm59PB0BZjjJsIPq70qfwdHrK3peDc1UAs/wsc9ZsLvOeXJlACsL9xRzbU5kp4hojbiwKAAbrr4ldfEYxt+TvUOCL9XWCEOdxRwXRxxjapFuvO7V1kUSzpSJjZiIW/H7b4sGxs+VlYZj1QXSoiCsW3Vcnk/yF9IVhJ76zQYcNxNpQkBFTe/oV461rhYTtcGTX56jzht871bAxT/pFlxQeAQXC7FGl6TMy9QBZek/vuWGUhBtq4utwPPdqdWfy44FCVdcflhJkL1s7A==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(56012099003)(18002099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?wsQOxNF1tfH0OO/A+xTOjR296TmOIKPibYaCKgEMgglcutuxvmUfvb18Avxg?=
 =?us-ascii?Q?b8fI4fcpAyNeq8rVCe8Rz/hY5clhQXND/FTf6b7d8L3Lbl874F+3eYOiaEnN?=
 =?us-ascii?Q?s0JILqoDPWAmdImUailJrqWaSQ1fyYdsOBGYOnE/Sfa/nJ7Tf/SDw+ItNvOX?=
 =?us-ascii?Q?lK28lrvr49BqzGvZAaJ05aDjMa+NtLGRMW6U9x7+0559g5pnAf9iugFNA24L?=
 =?us-ascii?Q?L/o3C6yaUfnEIJDWf2XX2x9/SNOyKoP9fa2N23Ln06VMKcyQhia5la40LtNl?=
 =?us-ascii?Q?k498eI3awILtuOvYSEwliedd54/+rO720A/o/Syb2dnYehK4niAOa1IEGhS7?=
 =?us-ascii?Q?pweGfE6RmZUOs0th9x5sESQhceDGfCpd/dQr+I0e6bDfzuUNBT65++WUB4ZA?=
 =?us-ascii?Q?BA8qgtRwTn93JNqD17JhGZVUjyIQuiP5M1LZy3quXZ0OPIh81PPB1gs7Nfhn?=
 =?us-ascii?Q?rprVAHX2TQhCPZPfsapkPLAGRLdWOKgB21xFvnCbVJWN23mhoz2GHYzGV0Gg?=
 =?us-ascii?Q?aufJjqrl04BtSd62Q6dKAl+GakB7H1ezxSCoDf70/72mg35Pq5wdfFjHq1vQ?=
 =?us-ascii?Q?QryfBK6gfN42OlprYt8ehggsi9juf8O/UShjlrPlOq+dfiLgLX4gtMmfg4QE?=
 =?us-ascii?Q?m2Dr7m5p2RWDXGO5CmnfKlqY7cU/48uGQwSmV1/96HYHgO3dUfjf2DtEg1jG?=
 =?us-ascii?Q?FRUWRPF1OyWs5VgNIVRjZj1DVtIis7hGlhGpDyC36YbpkkFbnSvwSpHLb246?=
 =?us-ascii?Q?RO3HuDi7G8NvvKGrHA8/c1OJzz1Dja3JwQQ2iTXxoB+eX6O0oC2M1WIb77nI?=
 =?us-ascii?Q?54w9Bw2GQYD3+c76DbBjNZhmkUZaXbHfnIcCsWZslMCfPyJJkznm//04Gjsb?=
 =?us-ascii?Q?GihtcFYxzSmb0SVH8kWjY+0MSJO2HwBYMNYmnZknKMsUBZj+Bfe1iOUbu6bk?=
 =?us-ascii?Q?wtXeYC4wVmfoP3+xBCw5mZhxAfgOZHz/XZQ1fe+4HBxa3LyHvf8e7hfShZG3?=
 =?us-ascii?Q?APzvFnWl33SAmlRvzEgbH3E1dN0nS7CGLcGnZgcbicN1p+3RkqtQ6dBDqHSQ?=
 =?us-ascii?Q?+FrR1/9w6YHPWdvZN89BBboL33kTLdRSF+0V9A/paLtQTWgXrIV5RobzhzTt?=
 =?us-ascii?Q?K/r2x35+ssBdqNRnKaE9mjMWWprD9ZGCwfzGG07E0piBfuHgbPbwhfkk+jtF?=
 =?us-ascii?Q?NheBOdoPyzuMUIXowo+yZSSHjGEDMWdi87MES8E8DymGDzdiZjp8ws0cSlln?=
 =?us-ascii?Q?xZvfiABr/6Z20ZXKLrZL9lKdYWVor71JwYguMnUgyx3nv51PvDGxXezpO6gX?=
 =?us-ascii?Q?zcU9JS8UtCVMVesNMSkYChKlM102Vx0AN+Z9OAXj2a8UQpwp9l9nOyPL53nk?=
 =?us-ascii?Q?Ac4fuH/JcHamPJT3gzqg0O4DhAdRKyBI8VZhEli1OAoFFGTLlBUhJjPcA41x?=
 =?us-ascii?Q?gmBYyAkDF8oasBrF6bFyla+HUqSHctbuKM+3fqjX6Ty3QCCTn5+n1ohN8Txg?=
 =?us-ascii?Q?Ig1C8sdIrOT1I3MZ1vfaryk05K+TXwi2erIWkus+W6LkbBneBXU7ZMvj45n8?=
 =?us-ascii?Q?8Cti1AH9ToWtnlMEoTVK13ZykRrmZJRA3ilkOrUUo+aqc6ufYsawU8j24gC+?=
 =?us-ascii?Q?XUJ7Dd9BI23B+KMjtRK9mvGl7sfB97QYEJYyfYCJe81HSqX17OzZLCgKf4/b?=
 =?us-ascii?Q?phujhH3yaTAgVUOBd5DJy2N7efDWmGvQPAuh9qHBOvqUxwxB/vtMXUxV1ba5?=
 =?us-ascii?Q?QJ0fYQFLMA=3D=3D?=
X-Exchange-RoutingPolicyChecked: 
	TPryepKQQhmLk25gJVN8BiVxY2MoAOILcbeMeA6LJ0Ipo3glb9y8rVT+d3LfCOEv++ZC7e17xG+qmXT0kXXUsWkXosK714XxcH/Io0QQFfK0cUXpSsRYzpS3zo8J2+60nCmpReIrdYFSEqwNbqyerSolIcEf4PUUE3Tam1YKwqF8vMhyNxqNi1ihsd9gD/GTxBif7PdqwsjcWMLpcGmdabg8HYpd0aXpnfP3xJDmfZznwePjSy9OsZS43SlG/arOrGR0Obqns+kwq0lOm9CkUDONRO/sUzAe8CnppBDGboBI86xI7kijEWWY2m2bShKgiOaO0X7sbkmsuVQ6Y2G9OQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d8157a3-8ed8-4e59-4612-08dea8cd7a73
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2026 04:36:01.2742
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: POz5B7Wqh2Qkk7u/2/h2r/ogMYqKMp7cUIEQNEh34djz0vUem8ehMeKoSCG9RASAWLvWZgqZiWygJ4GJ+RvdCA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6506
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTAzMDA0NCBTYWx0ZWRfX2ITHRLDLCvHo
 OaPMzjsLKiZZ65Il9P+I6u3wNbXzJ2zP7zHOvykVHz+UV8FAhp32SOemr4cymSGGgldezglEAxq
 ec4aLWLcUDRkhO3XSPgaBA1tKkhhPBmQj9TEukbI+3lIsoSgIt6bJmyQ0yGP0Y1cu3xwUbYif4K
 i3fBklZheihGQT0L1oPR34sNgfO3lSRguiwDdNP1t57uXfvBXZwWxKDWFOyTgxOMkPqSMcq9jUc
 VYbx0C9lltEGziXUts32B+lNpl6Z9rEzf23/2ZxZb74Jhox1AHefiPu9w/1RrvhiSspZ14cSbQE
 L5smpCD/MK7ZH35zAPbZiE70zk6cWuDLCTTL2UqvasTyEdOxtl2w4tB8P4smj4AkpESw9bFUefq
 rPMsjE/wR5fqiRtB3qqyld4U9rOIr94PnHmu4zGQQR8tZSizBowqlm69eXmM6YE9BtFC5Xuioww
 FwPFKv2iRz4UGzBru7Q==
X-Proofpoint-ORIG-GUID: BlIeopt_GRsPhtzGs9LzcerGL_FZlb_H
X-Authority-Analysis: v=2.4 cv=LsSiDHdc c=1 sm=1 tr=0 ts=69f6d0b3 cx=c_pps
 a=qHW1pi9L+1RZ0SKNcL3CYw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22 a=u_SgSZvrAAAA:20
 a=xHmGWb7dAAAA:8 a=t7CeM3EgAAAA:8 a=NEAV23lmAAAA:8 a=tRRMV1B-YeCg5jPVoS0A:9
 a=dUxtNc5KqGcdvnm1qQk7:22 a=FdTzh2GWekK77mhwV6Dw:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-GUID: BlIeopt_GRsPhtzGs9LzcerGL_FZlb_H
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-03_02,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0 suspectscore=0
 adultscore=0 clxscore=1015 malwarescore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605030044
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 03 May 2026 04:36:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126770

Security fix: CVE-2026-42167

ChangeLog:
https://github.com/proftpd/proftpd/blob/1.3.9/NEWS

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../proftpd/{proftpd_1.3.9.bb => proftpd_1.3.9a.bb}           | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-daemons/proftpd/{proftpd_1.3.9.bb => proftpd_1.3.9a.bb} (98%)

diff --git a/meta-networking/recipes-daemons/proftpd/proftpd_1.3.9.bb b/meta-networking/recipes-daemons/proftpd/proftpd_1.3.9a.bb
similarity index 98%
rename from meta-networking/recipes-daemons/proftpd/proftpd_1.3.9.bb
rename to meta-networking/recipes-daemons/proftpd/proftpd_1.3.9a.bb
index d64e0a0495..2e164a574b 100644
--- a/meta-networking/recipes-daemons/proftpd/proftpd_1.3.9.bb
+++ b/meta-networking/recipes-daemons/proftpd/proftpd_1.3.9a.bb
@@ -4,8 +4,8 @@ HOMEPAGE = "http://www.proftpd.org"
 LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=fb0d1484d11915fa88a6a7702f1dc184"
 
-SRCREV = "ae25959adb05ae1d6ebfa1f36bf778c9c34e9410"
-BRANCH = "${PV}"
+SRCREV = "ec8a5544e81df54e202f52f1f70d206439389577"
+BRANCH = "1.3.9"
 
 SRC_URI = "git://github.com/proftpd/proftpd.git;branch=${BRANCH};protocol=https;tag=v${PV} \
            file://basic.conf.patch \
-- 
2.34.1


