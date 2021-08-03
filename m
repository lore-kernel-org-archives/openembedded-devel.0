Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.1118.1627966673042009949
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 02 Aug 2021 21:57:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=caFz+9pS;
 spf=pass (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=38491ef679=yi.zhao@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1734fvLm030901
	for <openembedded-devel@lists.openembedded.org>; Tue, 3 Aug 2021 04:57:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=G+GGLDW7AJJ4MTvAkmA1a3A5kxid7/AyCqjzWXyHJPs=;
 b=caFz+9pSg+muJ8QXvIwGghLFLboh/ZXjNRCfnIv7knCRKjh5zK6/NChYkJ2jgvLlv9Kz
 tOPq5ANgKKNreY6vWUPDF0mqDD+PFqZTYSJ+EvRAWW/puv/KQqIsJU6pIbBQhXghPpwM
 T0jyllq054/QTbWGYbDuyFYasK4DPS6rApwjVBgGYgfVlMef4BSb2IJkKHTgfO/Nm2/Y
 VK6AwkRdl/Ttijf+oPLZVKaI0tDYhg9hBobPWAOZhaL0a+htufWen9u7Eeryzy+BCDui
 wu6nnYz88UgD2bItD1SzRQeGptOhtxfHOuZ7jbhsnohlPEzLBDP1nvLqzz0m71F/6rXQ tQ== 
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2175.outbound.protection.outlook.com [104.47.59.175])
	by mx0a-0064b401.pphosted.com with ESMTP id 3a62carxv3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 03 Aug 2021 04:57:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hPIhib3msqd1T9hCnI/EW5vBBR0jYusp8/Oo7vzwlApFzzjC1HapSQbhVAMfXl41MXRfDAdQtLYLb7xtvzzhRiWXCtehVMpBpZWZTINuvIxRgl6rq06lSRzSduVUfBbWvYjvd5EHRNcg17NKFfcXEn2Ga9mrskUuU3sizG0CQrcD4plYCfb8g95vBe+nhJzm/xCA4rjppmtQPEu0T1CeysXXMqmHdeXxlYniQ7fOTPmFqWrShc3OH8KdtHLUHvGUpkRocITs4Gep5xYJMRA1mTCxF1aH0+lhD3XTG3qcNDMijNV3glwv4jfuYQYEj2EsmKmHZOIyEqC8AQov62+OQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G+GGLDW7AJJ4MTvAkmA1a3A5kxid7/AyCqjzWXyHJPs=;
 b=gUywUjsG23eikQr8tzi6Q5cbIbQRIFG1BgLUVKeV1UoyfXEcGAv/asvLLIvrJHOBRY/kMBy9qvEDoL8c6p/X4+N8EU3/n88o12TNXVHsDmv/8amnL/Atv0s7/7av/I+nx2S4VmWV9ZZxIULwE0pWOTP43WoCTOtbFvkQFkZLJNAsdFoXgCJ6mdukWklAY6aPoQ+Vk092esBycBChe2o30XVm15IrPhhVAaphZrDdlGDVvXyAJwI2KH41Dtuct53ZSNfqXPv7brKPg+bGj3BC0K6mlxXLbFkwVDfjHJL8Qa4L/Cnts0MIoyC43WOVmdInUzWyi+J/g5bdvJPp2KQkJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by MWHPR11MB1854.namprd11.prod.outlook.com (2603:10b6:300:10c::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.21; Tue, 3 Aug
 2021 04:57:50 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::6ca0:3d02:dcd0:626c]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::6ca0:3d02:dcd0:626c%6]) with mapi id 15.20.4373.026; Tue, 3 Aug 2021
 04:57:50 +0000
From: "Yi Zhao" <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 1/2] audit: upgrade 3.0.2 -> 3.0.3
Date: Tue,  3 Aug 2021 12:57:38 +0800
Message-Id: <20210803045739.276613-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
X-ClientProxiedBy: HK2PR02CA0164.apcprd02.prod.outlook.com
 (2603:1096:201:1f::24) To CO1PR11MB4867.namprd11.prod.outlook.com
 (2603:10b6:303:9a::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-yzhao1-d1.wrs.com (60.247.85.82) by HK2PR02CA0164.apcprd02.prod.outlook.com (2603:1096:201:1f::24) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.18 via Frontend Transport; Tue, 3 Aug 2021 04:57:49 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 329b560f-6eaf-47e0-80bb-08d9563b3e61
X-MS-TrafficTypeDiagnostic: MWHPR11MB1854:
X-Microsoft-Antispam-PRVS: 
	<MWHPR11MB1854771A7DE0132EA14846F8F9F09@MWHPR11MB1854.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:421;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	uNsspAhRW7wIUFAKM0R9hOIOjEIC9Tb+Ow3JPY3CDLfyfkMb3xphC3opw66hr8zU7CcAqETLmJOo9dhVgQA1lu7ioMCMUcTyJunXFFoOulYTBE1hrv330/awJYWzB+HSWpJ04O8sDP+tZ2qgwvr2a60MS82iw4sxNt2Jovga50fmt+Q/s3Gz0tI4jNByGTkcOhZpMrYuMfGKIuTn57ak3SHVx/vCQqthHOQ2AiSDREQnKDriiRpDstpn8+Bl71SWNKuzkVp4m8JFTcHXLQEn1Zp0W/25uMxKwVugON2wps6XP2yZnr6TQatop9NBK/YcPfe+Jz1lxRMv+c0qBG/WtDs5sUAe55JHVO0oDMpj42nKpN2424ggazY2pC64iD4JrdJ+D71u/I7nxTGwQYC7Q3BsEaywzxR2R3BILroScgmzPpRLEvpwjXNsMetwZBhfSGEONcxyObSZn3QnKo6rjACQY/LXevoBMlUl/FiM+RBSnHFb/9jZy9+Dwi2az9oPtafe62thpSdUWCVX3hr2LmnT6eoEkyvSNYXQNHonXO7UEeGN9Mieed4HeYluoPVeDmgbqyE9Wf+APq+WWwDhkkzYHViCVzKENJE1K0ubCj1AP0sOPkNN33f5e97xyxYLgvvEM2XtK9NjI+/ECNP7enOQHbrCmiyj0whiYOKZsdoizKAHM12x4p1Q2/Ia4vEI3m6C9nobvBlNNmm84zC5Dg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(396003)(39850400004)(346002)(376002)(136003)(6486002)(36756003)(8936002)(86362001)(66556008)(66476007)(38100700002)(38350700002)(6512007)(44832011)(8676002)(5660300002)(6666004)(4744005)(316002)(2906002)(6506007)(956004)(2616005)(66946007)(26005)(6916009)(478600001)(1076003)(83380400001)(186003)(52116002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?TugadhgRrt1zQo4Fj47I+Alx50Vk1N+kEHXXLWoLfP8tEvO0S7TjHIq7Vh+U?=
 =?us-ascii?Q?fyPqS19xnoRcYmr+FrZbnAWxbJhvPtOjmpQawVge7JHVp8KtX+9eVVh6ilbA?=
 =?us-ascii?Q?tXcqRs6roVAV80+UHF0CCEcWO1krJHSrfdzEt8Km0un7LkW2TwlhlsBOa7K/?=
 =?us-ascii?Q?4iDRKYmQXjlDa2NsOUVcCiu32HYxCXq59APvzN/0aViAy6Fe498xHBccKTr3?=
 =?us-ascii?Q?4r/cCanInI+T+RLBGjXB2ZMYB7/82LqsKoDvmv9066YJrFJTBUUhBNWGWEws?=
 =?us-ascii?Q?x0MvcABBgsJ3xv7MMUeC1nEfvsgQiyJJoEq8mbhOZzuZts3TjN6BXmXxZmLd?=
 =?us-ascii?Q?iFBfLqPqu/ONCPtOTCMRvdCr3xx/gt6YTzpPAV3jeYn9rzrLCI7vpEbCOEt9?=
 =?us-ascii?Q?SoYv6qn8eY96NRn/2qFp284pzVKqBImXZwv1ePlP8Sa9ajmOG4E1yn33LCok?=
 =?us-ascii?Q?O43Xd/qSd5y8I4ioO5jePJGl7HhL8jWASsO2gMiXFRObm2tvW2yR3u1lmFzt?=
 =?us-ascii?Q?M/SvX+PQVq70Qg6fY8y++Pe09ORbUd8w5kAc6p93/Tvvl3k9mOYDZkE51Slv?=
 =?us-ascii?Q?j0RAFGmw7EP1qZHG75oNx1G/D7FfcmLjLA5pyJB1k6DT/iFk/I/D+BiKS18S?=
 =?us-ascii?Q?3XFmTKPwR0vjIJcGFyUlnRVlfT3bhW7EWsQLnL1f6V1W3nEUou4j+KrG5fMO?=
 =?us-ascii?Q?LgIET/yfcL3PT6YDt/O83Bn0X/zBbSYIqBa5yE2q4BXi6gTcr8dOfLTq470u?=
 =?us-ascii?Q?teAQXvs8YfYL0SPX4I1tinKJzBYoBeRE3udXFrEe1wFtac0VtlrZTxLxzOJx?=
 =?us-ascii?Q?FpfrZdBHFYsB2oHjnrx9bXIsLzgR8YsJFF9XjRVdz/XodNuHm9SHL76JkN4G?=
 =?us-ascii?Q?zDejelS4Zx28jazDFnHvkk9qgttFB2v4WuJQK2ddidIIQesA57bp2D2m8L4y?=
 =?us-ascii?Q?JmJ08BTERh64cnsJvxtJ7wpnC/YeLhwiEhNnmi/oNHsgt20244DQ7v+WTjg/?=
 =?us-ascii?Q?vSPJYqAirLPwy/HiR0XxJlw2pIJP7b4nVcQy/4+yUjHMQNcGYqlRJQXEh+PB?=
 =?us-ascii?Q?kYmPRrOLxepdhvEm8OKxaVllaOQFhqlqTeHZv19QcMnvA4xUc+Vdk32OnLOH?=
 =?us-ascii?Q?gS1lSgTCEE/drQ48iGtgJVUlEf+xO5xrYteIMDQcuaPG1UbdAbMMvSuICzRa?=
 =?us-ascii?Q?fHE15hwILP12uy27MLw0r6G6udjxAwduFuCqZe49jgPoOMXRSonFS2vw3/6P?=
 =?us-ascii?Q?lahL00L24mEfqU6yrwxDOprnAmAooCEgkkQjs1jpFbYYXZXxh/ogbEMFH115?=
 =?us-ascii?Q?RAoD1la2yie2z8zaQor+7cUo?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 329b560f-6eaf-47e0-80bb-08d9563b3e61
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2021 04:57:50.1890
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uDUyHKU6+nrK17v4MGGCHhn12lGp2SUmxPmsdo9W/gVJrjki5o0rA9aOfBI9CW/6cuaXo+kGFlrpFINHSlkYdw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1854
X-Proofpoint-ORIG-GUID: 7KB_6MBeEHOysbZecX-gsD-tDxLG9HuM
X-Proofpoint-GUID: 7KB_6MBeEHOysbZecX-gsD-tDxLG9HuM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-08-02_10,2021-08-02_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 impostorscore=0 malwarescore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 suspectscore=0 bulkscore=0 priorityscore=1501 clxscore=1015 phishscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2108030030
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../recipes-security/audit/{audit_3.0.2.bb => audit_3.0.3.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-security/audit/{audit_3.0.2.bb => audit_3.0.3.bb} (98%)

diff --git a/meta-oe/recipes-security/audit/audit_3.0.2.bb b/meta-oe/recipes-security/audit/audit_3.0.3.bb
similarity index 98%
rename from meta-oe/recipes-security/audit/audit_3.0.2.bb
rename to meta-oe/recipes-security/audit/audit_3.0.3.bb
index 7d2cec18b..c330c07f9 100644
--- a/meta-oe/recipes-security/audit/audit_3.0.2.bb
+++ b/meta-oe/recipes-security/audit/audit_3.0.3.bb
@@ -15,7 +15,7 @@ SRC_URI = "git://github.com/linux-audit/${BPN}-userspace.git;branch=master \
 "
 
 S = "${WORKDIR}/git"
-SRCREV = "40312ddee3035d13e287355544cd7bd7e49b5499"
+SRCREV = "17c100abcfef4cbd94a0a5be9b830c8386c3add6"
 
 inherit autotools python3native update-rc.d systemd
 
-- 
2.25.1

