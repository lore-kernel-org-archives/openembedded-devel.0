Return-Path: <abhishek.bachiphale@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2A5BC61DD3
	for <webhook@archiver.kernel.org>; Tue,  1 Sep 2026 09:08:28 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3457.1788253698416476333
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 01 Sep 2026 02:08:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=jWKeOyQs;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=37045641a2=abhishek.bachiphale@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68179a5u1250916
	for <openembedded-devel@lists.openembedded.org>; Tue, 1 Sep 2026 02:08:10 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=qy8U9YiCY
	icIFrl3jwE36CC+Y9QHp7Ylia3/CQmlpbE=; b=jWKeOyQsaNbl2o9+YgFLqZ5eB
	9GH8xaBjg9N0cJd23u1osSjW+Z9ctgbhzpgH+72AD/OcaUyMp65CYF6my2gQTJVh
	4il/dp5De3S/ZMwO2yJxw6RuGc+hiqVoIlmihSPZydbD0j5vSsqLbMo2CygzsO4j
	nBK8g5LsT82rmWGdqcd/BD5UamLY+7rHcqYElt7itPZh/Sdw/x+DKnI7iZKk5RSy
	jiWNnKCTRzFqJaSM0VgPyGickjqNfa+wN+2KQtiBT4I3jILn0F4ooPBDDv/7d8NJ
	vK5p6HVw4o9NzTxSXG7hDf0ZA6p02FutFiEa/40oIzT8O+Ve/fxxBafSjJRHQ==
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11020112.outbound.protection.outlook.com [40.93.198.112])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4gbtpy41eg-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 01 Sep 2026 02:08:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b05juddWHrL/1PrYO/MrUS6KfR6jQreSkR68KaieK+HEMsCzGoGTZ8tLfchLUJlSTW+ckc1EYVs8H3+ksc/fys7qxTN6e+Y3CkinGuZEBPmfj+RpynP69j0OfPJJSw3S35tqomU21N0RGh3+t/oiOk9q2Y9x67V6xJQQ2A8+CT5BKhSIpbfCs91Dzhb43BJMRbfAfuRUI+V3omfh5m7BNvSkDxOaKh19PttV3sJy2I2HvjZy1xX7JVumFfrulrAt40l5QJVmz8cFVNE6FPolCbrDMV/FyeaA4Rf1/87r5wD+S76nKnrQOlevsL+AmYzTS2YqOtwT8VAdAqRtAV3Cjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qy8U9YiCYicIFrl3jwE36CC+Y9QHp7Ylia3/CQmlpbE=;
 b=Tdjot+uFNO2TBfK2Uin0r1/ggXad0ASW2w0XkqzqiIfVzjlIe34SL/na4WotfxlO/kwKgoWuAVJLvjPDD4YKPqKoEUeeZwx0F07j5ui4j33AEqiWEIJZwUieFZKIOfy5V9jp7Zufc4K4o446DsJk7g5yM5z71rCC+Djv48aWMDUhgR4FBU77aramWTA5MkeQQg/p1+EeUdaXdeNwKiqjQXT5GAUyuM1TOVHqd0JW4yh33knuPGAEHeVf5ZvjSEAqvljEhOBvhZFGboltJjhaOXKsVs09gaYvkWUSs/JLAkPKJnIkZzu3RmmElhk2iFn9Rx6N3oVmI9oP/q80uGsyPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from IA0PR11MB8399.namprd11.prod.outlook.com (2603:10b6:208:48d::9)
 by SA3PR11MB192006.namprd11.prod.outlook.com (2603:10b6:806:52d::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Tue, 1 Sep
 2026 09:08:07 +0000
Received: from IA0PR11MB8399.namprd11.prod.outlook.com
 ([fe80::ea10:3d10:93bf:f83c]) by IA0PR11MB8399.namprd11.prod.outlook.com
 ([fe80::ea10:3d10:93bf:f83c%4]) with mapi id 15.21.0360.008; Tue, 1 Sep 2026
 09:08:07 +0000
From: Abhishek Bachiphale <Abhishek.Bachiphale@windriver.com>
To: openembedded-devel@lists.openembedded.org
Cc: Abhishek.Bachiphale@windriver.com
Subject: [meta-oe][wrynose][PATCH] thrift: fix CVE-2026-58662
Date: Tue,  1 Sep 2026 14:37:27 +0530
Message-Id: <20260901090727.1384945-1-Abhishek.Bachiphale@windriver.com>
X-Mailer: git-send-email 2.40.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SEWP216CA0058.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2ba::11) To IA0PR11MB8399.namprd11.prod.outlook.com
 (2603:10b6:208:48d::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB8399:EE_|SA3PR11MB192006:EE_
X-MS-Office365-Filtering-Correlation-Id: 6650d13c-e31d-4cc6-85c8-08df0808895e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|23010399003|1800799024|366016|3023799007|38350700014|6133799003|10067099003|11063799006|56012099006|12006099003|18002099003|13003099007;
X-Microsoft-Antispam-Message-Info: 
	/6erLOf62tChbgiy4MDaDR9uN3qc1FjsceK34k+gUUvX0BcucaKtMwzWkPwnou8ZdpT9nYd4mZqQJL0GfX9+DgY2EZRunTSfNGy5ZFJ95wW0C8qrcp8h9xhBnitdJVNB1FTOVV0NN4HyQQcgkWTmkV4UjEdfb1ngfxlmh153LcwZ/Q3o4KJOZ+RHj87VNkLi+OTQ4e4zukHBuXjjU0DywMM9ADIAkL5F5eYXeOUB5BbNOwESHIA8A6yTLfN9gb6LgCv5O6bQlgGag4g/eJTaHFltxbKWDx7lwXkZc7Xvet3DfeyAg+TIpyVvSVQcc+xciejPWSCcxUtTyY8KEoPSiFQRmSUYFIPYfXA/eCJv/BvP8aJXRWaV0Mijm5g7o5HTss/Ia5zlOxJ0HH4SpGHF95Pt+LFHV4/hxvXtvjX4UUGbic+UYoiQKa7dSb28Hab1yh7h54yhdutLy2uNmH1PmiDhWpjvwQGnCe6Ps0laJkI4NeHqdYH3yyhD5C2rysU2QyU4ZMFn8c3+noYmURrlOuW3kwM+T1OmMEUui9l9RSkDzHGtR1nkfi0IXS9q38sssECQ8wUontvbZxWHMo7+vPuSHxIMZefk9pUxfm9P2PLoLBJ6q9TccqGtoGUNOnrvTmabp+K8YUpz3XTjBD5FA0gSqkkP2NL6PREnlgLEMh5+y7drWYu5hCI+PCP5hTjrR1IfWJFQnBFAJ0IgHjCZED7neBw3hRWvbpPzjr2K2xE=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR11MB8399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(23010399003)(1800799024)(366016)(3023799007)(38350700014)(6133799003)(10067099003)(11063799006)(56012099006)(12006099003)(18002099003)(13003099007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?1NP+nhCU/1vd6eq8dLiIZTzITM6YU7GJvixZ22ykrA4HFz0jbBlewrhXJJuA?=
 =?us-ascii?Q?kLbJf9AIUXJilTDRKt8oXi8jc7zEbDcoiI6HiqO6suBoSuS9pJwD9ke7ceDt?=
 =?us-ascii?Q?1EZIzE3LLk3hftUOq1f95JocVVbUUFx4IGmuJeTKOr8iJmLpd8qw0VHQ+O7k?=
 =?us-ascii?Q?vbiC8SaF5/IzJWjcVBWsXSvTog1uA9ehVgUj2+7Etf3E480DiJh1q4zBbdWr?=
 =?us-ascii?Q?jVo1sJNtmLjNEbByKIw3fLH2E6AVJWqy4okTgtbwZnbvIHlOI1KSAroEja9E?=
 =?us-ascii?Q?3ml4fDw9wNhGuaRkqVLJ8cZt5lIaVmG4P3KzA/iigrL64wwHBSfY810dUCnb?=
 =?us-ascii?Q?p2DsfE3oTSPioF0WazUsUQwlBPj/ohZiGl3ndJObAVX7mEBepJ/c4UCCtb4R?=
 =?us-ascii?Q?6z0Z/b4JVb0hDbyoVMIeZVGhY1K5I1BoDmE4KbAr1e/DDS+cDEtznfms2jwX?=
 =?us-ascii?Q?8tCRgvZi516I+2g+46w46SlFMXpz59OubEYlnGua8q2IR5pnZFpEF7xjqXfL?=
 =?us-ascii?Q?68ErnL6SrharVMP3HzPWGgOpOZ/h6VeRf0g3T9V5QjM4B1GP+o0zR+Xlz6x5?=
 =?us-ascii?Q?nHmJ6Xa37QqQe2roRksatdiQ1gYam1Dut6YhxrI5IlS7oCxMDKxTCA3TIAR0?=
 =?us-ascii?Q?whOxNnt7WExNsb5rzIrNQIJL5cbn475tvxRxhRPokfVCB56TIOd3tS67KMZ8?=
 =?us-ascii?Q?d1ooyvvQIN3+V955Frq08DVOpF9E6F84A4Aykx9mS0uxmsEeCuB+3JtNeoqA?=
 =?us-ascii?Q?PCTl7L5FEyj8MIluny2/QrA+e4rpyDMABdADjVADlJp3sL1IpZkzMBDVc4pM?=
 =?us-ascii?Q?dFfxF7hCK3zwbEHuPJkkaeyQXhqVeix0MqSW621rKFHN/QV1jWR975wmdY2/?=
 =?us-ascii?Q?zxkNu7YURagkTR5/9jW9If8X8CPpAQE+OCMlqqXxt2uGCgaQt5P4LOVTpzsJ?=
 =?us-ascii?Q?vmN4ffj1pVlRnVY7ZD206s3XyM+YpOweeD5c01B3phiEJ6WKczuBwx2IP9Wl?=
 =?us-ascii?Q?KVTpQISVT1BG0hKSAfs4r9TJ387qasGoII7T/OyeDhXQJOonSrh1Qwts5qvt?=
 =?us-ascii?Q?SYhJ/ya6HsFWuHjchbqmkylfQIr1uVAeBgABWtTUkSomTj8dIphSx0ZAfltL?=
 =?us-ascii?Q?9GUo2nd67NQm2MY7BFscoBeg439/TMvl0BRFmY8dkQ2jhOpaA5gRRhkjXzlE?=
 =?us-ascii?Q?4ipTgUXlA2cUEeW1uJuEueVs4+Og3EQnokIhZZTnpHUASkhafEYtzZHaWzhs?=
 =?us-ascii?Q?gr/Wg4hG2AxF8Z/t+QUNgrp0gwIvdBQLunRCkFvUJGOGOTPWkfPKBiOOS7ha?=
 =?us-ascii?Q?Au8+VYiYA1n3+Wl3U/lZY5nMAX/L+5RGTaH28Og6wSIvqszclXznRzrMZzLE?=
 =?us-ascii?Q?KNBef3OV+53tNYzULlk0iyMo8gqjYCPo3F+tg1J13B+18ShHPWaFXDw9CHYe?=
 =?us-ascii?Q?utBjoclgiGMXtkTH0yY9wfH1w6rVgIVpLcf1A4npdUB+At5c4Whc2Lu/dbqT?=
 =?us-ascii?Q?SftWsFo7ITGES5pPwQtpJeAtZ49vMIiA4rxGkTOFY7VGX8M5l0tWuYD6Sczf?=
 =?us-ascii?Q?yTHHssEiBzLMOTGubqFpDbT74cnXaV63AbslDwido40KCFltlpHaQIZmyzco?=
 =?us-ascii?Q?mSM14zuv9FybLX5DahvCUjJysxshEc8XQHuw7CP8zepn4tNAcf+dSEkBnVjr?=
 =?us-ascii?Q?8EUsRvK0t/uHchA/35QC6Bpg2RbPHuh2SEtcVEi4bqtshWKCnU7nsZET0UfU?=
 =?us-ascii?Q?Na/ICur1G4okDNdB2MRHqwOdt6N2lhHTWFv1pWln3sPsriTCt8SP?=
X-Exchange-RoutingPolicyChecked: 
	EeGrOY8DGZcSmlRj66ro4PfY2TWFtgXChoNR6I+ovyA4ZJIQfhD+WVEPU5EdkwQGEh5BuuS2RIFeXUxYYSAdQ+lQFfgiReItkxsFdq9CUzucWC5MUMnIJy0BgwshYb2Lnk0oEQFS13OPwP+k56MU56Hve78IxLmBIiDaYU2iMsbryjqVdpwPjd3dGuDeCCtNWFjeJZ7CSrVqh9yijXny8GXsfdCbu9r+lRrraAsga9lOFhCXU82T7ytd0+4MFA9SzCrV0yu14ZgLdunXONSYK97p5PXSsoR8cOvj4cSlI+kk7m+xEFMMN5TDGbK8TTDt+M5QZFIwHqLPVaSame/UbQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6650d13c-e31d-4cc6-85c8-08df0808895e
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB8399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2026 09:08:07.0255
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KEPZCTFxaQnW8QL7gyyGMR8GFmKIJgFS02tnO5KZFQLXk9hYj8mXTlhHtPSns5m9Mr/46w2nprPFkDLJb+4uRnmi4p8kbhsPNIYokmQyr0tvqZ059vpq0xxNXExMYdKw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB192006
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDA4MSBTYWx0ZWRfX1zLkIhQmb0dE
 AQo3VFuLRC2ITpHHAxQzFEK8dEBBEcOmknyccsxxlFs2Dd6t4hF7Ywrjcaz5+QvCcj7MGzTlmwb
 HecI9USB6T3jty3F9TwsFv43sgc2ogmwwtSJQFOl38CUhF/+ukLPpNsgXrnNEGJjqeW5m9DE5Qd
 uvuQQF/VZ280YiAxIlN9x+IN/iiU7vQ3nPG4xPkFXTA61SNChY9FuA6eXJhbvZTPGnqb1w6o7jP
 r05OwYzZW54gHDm6bmDIwdmInZi2sYPr4EkOe2fon6J+HfOuw6RDZKYH6X0y9JCpMA9rPLI5UUU
 v6pTAgfJwKK4svl2DJoHKbL7s52V3OWgSP8eYc66K8h9aFHruTrkGqPfjdEmN74pZZm1G7jnFjT
 bCxuU0iXaioZShWK62yVneyz1TmpjAUWo33TeE/PYNofYrqVZauGICwtSPotNzaEILDWrELSbsC
 CGxabvCvcexlS+6x+Gg==
X-Proofpoint-GUID: Td4t5ImAhHTjXcMz-s4eah9yvjlOLiWv
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDA4MSBTYWx0ZWRfX3Fhp2zdvEa9n
 8dRCA0Nvlfwd+gJZ99hmA7uTPLeOlnvwhbrshP1iHc2rfUdrmU37967zqul64ZPJESAjlD5kT3s
 IisppENGcNdJqEFMRt6+xlxF+uWXPX9Z2wHWpOeYuxTW7JIKD9mn
X-Authority-Analysis: v=2.4 cv=ANEnCIlm c=1 sm=1 tr=0 ts=6a9695fa cx=c_pps
 a=waeEY1lgPsvMgfEg+IY2ww==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22 a=PYnjg3YJAAAA:8
 a=NEAV23lmAAAA:8 a=mV9VRH-2AAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8
 a=6V7VhdXvKvEEmmVZ87QA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: Td4t5ImAhHTjXcMz-s4eah9yvjlOLiWv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_02,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 malwarescore=0 adultscore=0
 suspectscore=0 spamscore=0 priorityscore=1501 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609010081
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 01 Sep 2026 09:08:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129627

Improper Validation of Specified Quantity in Input, Out-of-bounds Read
vulnerability in Apache Thrift C++ bindings. This issue affects Apache
Thrift: before 0.24.0.

Backport patch to fix CVE-2026-58662.

Reference:
[https://nvd.nist.gov/vuln/detail/cve-2026-58662]

Upstream Patch:
[https://github.com/apache/thrift/commit/f961cdb44249c293fcce6a840ffa1f7419fd88d0]

Signed-off-by: Abhishek Bachiphale <Abhishek.Bachiphale@windriver.com>
---
 .../thrift/thrift/CVE-2026-58662.patch        | 120 ++++++++++++++++++
 .../thrift/thrift_0.22.0.bb                   |   1 +
 2 files changed, 121 insertions(+)
 create mode 100644 meta-oe/recipes-connectivity/thrift/thrift/CVE-2026-58662.patch

diff --git a/meta-oe/recipes-connectivity/thrift/thrift/CVE-2026-58662.patch b/meta-oe/recipes-connectivity/thrift/thrift/CVE-2026-58662.patch
new file mode 100644
index 0000000000..03eaccb17a
--- /dev/null
+++ b/meta-oe/recipes-connectivity/thrift/thrift/CVE-2026-58662.patch
@@ -0,0 +1,120 @@
+From b9fe622d3e3dd2e376fbb5ccf2acfbfaf498ddb1 Mon Sep 17 00:00:00 2001
+From: Javid Khan <dxbjavid@gmail.com>
+Date: Tue, 30 Jun 2026 16:34:47 +0200
+Subject: [PATCH] fix info-header string bound check in
+
+ THeaderTransport::readString Client: cpp Patch: Javid Khan
+ <dxbjavid@gmail.com>
+
+when reading the key/value info headers of a THeader frame, readString reads
+the length varint and then bounds it against the bytes left in the header
+section. the comparison uses ptr before it is moved past the varint, so the
+remaining count is overstated by the width of the length field, and a negative
+length (a varint with the high bit set) is not rejected at all. with a header
+section sized to fill the receive buffer, either case lets a wire-supplied
+length exceed the header bytes that are actually present.
+
+bound the length against the position that follows the varint, reject a
+negative length, and only advance ptr once those checks pass so the documented
+advance-on-success behaviour still holds. regression tests covering both the
+oversized and the negative length are added to ThrifttReadCheckTests.
+
+This closes #3610
+
+CVE: CVE-2026-58662
+Upstream-Status: Backport [https://github.com/apache/thrift/commit/f961cdb44249c293fcce6a840ffa1f7419fd88d0]
+Signed-off-by: Abhishek Bachiphale <Abhishek.Bachiphale@windriver.com>
+---
+ .../src/thrift/transport/THeaderTransport.cpp | 12 +++--
+ lib/cpp/test/ThrifttReadCheckTests.cpp        | 52 +++++++++++++++++++
+ 2 files changed, 60 insertions(+), 4 deletions(-)
+
+diff --git a/lib/cpp/src/thrift/transport/THeaderTransport.cpp b/lib/cpp/src/thrift/transport/THeaderTransport.cpp
+index 117c8ed..ba2fd5d 100644
+--- a/lib/cpp/src/thrift/transport/THeaderTransport.cpp
++++ b/lib/cpp/src/thrift/transport/THeaderTransport.cpp
+@@ -183,13 +183,17 @@ void THeaderTransport::readString(uint8_t*& ptr,
+   int32_t strLen;
+ 
+   uint32_t bytes = readVarint32(ptr, &strLen, headerBoundary);
+-  if (strLen > headerBoundary - ptr) {
++  // Bound the string against the header bytes that remain once the length varint
++  // itself is accounted for, and reject a negative length so the size_t
++  // conversion in assign() below stays within the buffer. ptr is only advanced
++  // once these checks pass, keeping the "advances on success" contract above.
++  uint8_t* strStart = ptr + bytes;
++  if (strLen < 0 || strLen > headerBoundary - strStart) {
+     throw TTransportException(TTransportException::CORRUPTED_DATA,
+                               "Info header length exceeds header size");
+   }
+-  ptr += bytes;
+-  str.assign(reinterpret_cast<const char*>(ptr), strLen);
+-  ptr += strLen;
++  str.assign(reinterpret_cast<const char*>(strStart), strLen);
++  ptr = strStart + strLen;
+ }
+ 
+ void THeaderTransport::readHeaderFormat(uint16_t headerSize, uint32_t sz) {
+diff --git a/lib/cpp/test/ThrifttReadCheckTests.cpp b/lib/cpp/test/ThrifttReadCheckTests.cpp
+index 9632861..2a92160 100644
+--- a/lib/cpp/test/ThrifttReadCheckTests.cpp
++++ b/lib/cpp/test/ThrifttReadCheckTests.cpp
+@@ -270,6 +270,58 @@ BOOST_AUTO_TEST_CASE(test_tthriftjsonprotocol_read_check_exception) {
+   protocol->readMapEnd();
+ }
+ 
++BOOST_AUTO_TEST_CASE(test_theadertransport_info_header_string_overrun) {
++  using apache::thrift::transport::THeaderTransport;
++  // Header-format frame whose info-header key length (4) does not fit within the
++  // header bytes that remain once the length varint itself is accounted for. The
++  // header section (8 bytes) exactly fills the frame, so the boundary sits at the
++  // buffer end; the key length has to be bounded against the remaining bytes and
++  // rejected.
++  uint8_t frame[] = {
++      0x00, 0x00, 0x00, 0x12, // frame length = 18
++      0x0F, 0xFF, 0x00, 0x00, // header magic
++      0x00, 0x00, 0x00, 0x00, // seqId
++      0x00, 0x02,             // header size field (2 -> 8 bytes)
++      0x02,                   // protocol id varint
++      0x00,                   // num transforms = 0
++      0x01,                   // info id = key/value
++      0x01,                   // one key/value pair
++      0x04,                   // key length = 4 (only 3 bytes remain)
++      0xAA, 0xBB, 0xCC        // key bytes
++  };
++  std::shared_ptr<TMemoryBuffer> buffer(new TMemoryBuffer(frame, sizeof(frame)));
++  std::shared_ptr<THeaderTransport> trans(new THeaderTransport(buffer));
++
++  uint8_t out[1];
++  BOOST_CHECK_THROW(trans->read(out, sizeof(out)), TTransportException);
++}
++
++BOOST_AUTO_TEST_CASE(test_theadertransport_info_header_string_negative_length) {
++  using apache::thrift::transport::THeaderTransport;
++  // Header-format frame whose info-header key length varint decodes to a
++  // negative int32 (top bit set). The length has to be treated as out of range
++  // rather than converted to a size_t, so the read is rejected instead of
++  // reaching the string assignment. The three trailing bytes only pad the
++  // header section out to its declared size and are never reached.
++  uint8_t frame[] = {
++      0x00, 0x00, 0x00, 0x16,       // frame length = 22
++      0x0F, 0xFF, 0x00, 0x00,       // header magic
++      0x00, 0x00, 0x00, 0x00,       // seqId
++      0x00, 0x03,                   // header size field (3 -> 12 bytes)
++      0x02,                         // protocol id varint
++      0x00,                         // num transforms = 0
++      0x01,                         // info id = key/value
++      0x01,                         // one key/value pair
++      0x80, 0x80, 0x80, 0x80, 0x08, // key length varint = INT32_MIN
++      0x00, 0x00, 0x00              // padding to fill the header section
++  };
++  std::shared_ptr<TMemoryBuffer> buffer(new TMemoryBuffer(frame, sizeof(frame)));
++  std::shared_ptr<THeaderTransport> trans(new THeaderTransport(buffer));
++
++  uint8_t out[1];
++  BOOST_CHECK_THROW(trans->read(out, sizeof(out)), TTransportException);
++}
++
+ BOOST_AUTO_TEST_CASE(test_theadertransport_zlib_roundtrip) {
+   using apache::thrift::transport::THeaderTransport;
+   // A run of identical bytes compresses to far fewer bytes than it occupies
diff --git a/meta-oe/recipes-connectivity/thrift/thrift_0.22.0.bb b/meta-oe/recipes-connectivity/thrift/thrift_0.22.0.bb
index 0128de8519..949ffc3e70 100644
--- a/meta-oe/recipes-connectivity/thrift/thrift_0.22.0.bb
+++ b/meta-oe/recipes-connectivity/thrift/thrift_0.22.0.bb
@@ -17,6 +17,7 @@ SRC_URI = "https://downloads.apache.org/${BPN}/${PV}/${BP}.tar.gz \
            file://CVE-2026-58023.patch \
            file://CVE-2026-48144.patch \
            file://CVE-2026-58389.patch \
+           file://CVE-2026-58662.patch \
            "
 SRC_URI[sha256sum] = "794a0e455787960d9f27ab92c38e34da27e8deeda7a5db0e59dc64a00df8a1e5"
 
-- 
2.40.0


