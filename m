Return-Path: <yi.zhao@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35FA7C433EF
	for <webhook@archiver.kernel.org>; Tue, 21 Dec 2021 05:07:07 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.2452.1640063225931927338
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 20 Dec 2021 21:07:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=Txe/9qly;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=798982f4ee=yi.zhao@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 1BL51B6i031820
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 21 Dec 2021 05:07:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=paKGN4Uyn1a12whMWlbBoRBlBEdZL/IoH7VKLsNV4ao=;
 b=Txe/9qly1zyGl91PfvQVB1xA8fWIwaGU3Pa3PD6RvKe+AEHeU+kccEzCxcsUqXMaTzCw
 extaaBZORV4tod9uwn5376GmhovFnqzHFiTrj1bvGPocyzR4svf/dvtv0CSBs24xZFVN
 qeMUlv/f9mjVXOS3D0INXQ3/ZZYT/uDN0JHrLYB5DCmaniobQjL8RKmP231ueB10EN5B
 UBcj1UfYn7ukjBftlaOOML0FIluGvwKuKzurafNnCTEIq2lVH/YfsodH19xqcESnvtZO
 pXISd26Nk0xKsN9yuJqEfwSosl1dR86dfgHASqpNhqqJpNBgLGuvWeS+j+p7S9RcWInC 3Q==
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2171.outbound.protection.outlook.com [104.47.56.171])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3d2gb2ryrc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 21 Dec 2021 05:07:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MJ7j5455HIeX13OKS4cPj7XiN4ZRD27RcmtQySNLohYE9yaRni6qgrzW+RnOB5T/bL+ae9KPXu/NKNw1wyyhFMabKcJch5NFqHkzbfIXip4EuhxiHQisemBPG6bg6btHswh183BS5Em6kM6/c+u8Lfnazsx8Bi0oz9dyofGlGk6feK7aT5OPCaa/G8OJDeMVS16iUvFr8P4Wgu1LL9QfNQ9qsFZRVDKg1cklD6P5ZJO80+P1V520j+AeyDVSXd2hfesymKZsKBl+JC0AHrqUQkr+QtAxGm514Z7ACAARNm/wZ+cZOSsCoTQjJmPg2bO3+ADuK2qMOhseRF1K2EBmZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=paKGN4Uyn1a12whMWlbBoRBlBEdZL/IoH7VKLsNV4ao=;
 b=moSI2OiNirmZQVLaKnHC+deXE0MjLiDsi+GCmffjRbQA/Hy4hOI25SRwwUVVPwBm2jpOlmBQPQtTfZQj2bTSjXiWEDa/F7bUEGlmh71WLoBkq0x3VL11VJTwV9A+78Cw1wpZWgTTMf3y34mDSXhKVhRHioj5FUcrIlPzrBswfj1pNJjazmxsChO9cKZV8unQM9MjcLsul+JorHfqwa/Kt8macKW2P025qPX9eiH7jrvbpBCZSdAV+pObBGNrlciZAGGdowHxHwZabweed0ZfF9OmIoR/srFdvWoyiD53IjhaqGERl33tDvR+zYzrhySdLTrzzw8Z9FM3YvWVvpB4WQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by MWHPR11MB1263.namprd11.prod.outlook.com (2603:10b6:300:2a::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.15; Tue, 21 Dec
 2021 05:07:03 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::8962:26c6:20fe:eaa4]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::8962:26c6:20fe:eaa4%6]) with mapi id 15.20.4801.020; Tue, 21 Dec 2021
 05:07:03 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH] openipmi: upgrade 2.0.31 -> 2.0.32
Date: Tue, 21 Dec 2021 13:06:48 +0800
Message-Id: <20211221050648.142998-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR06CA0124.apcprd06.prod.outlook.com
 (2603:1096:1:1d::26) To CO1PR11MB4867.namprd11.prod.outlook.com
 (2603:10b6:303:9a::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5e9e6a33-1687-44f8-0e59-08d9c43fb9b8
X-MS-TrafficTypeDiagnostic: MWHPR11MB1263:EE_
X-Microsoft-Antispam-PRVS: 
	<MWHPR11MB126331329ECE2350C3FCE50BF97C9@MWHPR11MB1263.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:421;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	mL9IC3nINiDSXTnAe9ODvTkPoAdBV/R7lO9nNr9tpOEZ3NNcQFFuKfuKFQ68pSPL0EbWnIJtDxdKa69ui8TE7fnmkc7woTZ6HbgtbMX1p8KeFRVSgxt7tc2HlL1j50y1q/vc8mNRNaRA8fWapSjSOKko3ZQR7391VvNpmt7zaQVhHVO95CRVl1+fMQZd7q21JiHwrlvF5Ij8EdIAmNZKXdok4xSApPWrybkP8qFcw2RqslxV6wQqLfF8lyH6+8iQOysUqWt5/4C2OovTvuSnQXa20Qj8w9NNskIu4rginGwSXzPmxloa26EYXcJ2nAkuJkthCQTiYFLGp4ml1CXTkvAOeRfwPdGjxF9YSNuaEBdjaFOw7JNLw4V1nUMzCVjXv/KBeOcIF9Crsq1vSsk7D0Jq0WN31iWwPvq+/ukOh16FQllyo9LWyTmChOm8zbVJlUonxLk5GtWYriPFU3HEqqH5M2Q+DdxAqlvn1xbpM+WBDPEHJnm9do+LFMdMDDT+QNyWqgVgZrCPbdnO6SwaN1CR+Pw3Ch+2fumOY9B9nitt5FwRgGLl0rqA8XqvxaOJinv0tKujySvkHXJczJnXhNnSWHNVnaaBOjgsMNUH5xqb5cdUGfWaaXxcSSRMcPB5I3QKyDXKxN3aPljssQKAx0LQmgZxzyOHi7AuxaAZxCQhJC8kizkWtiD6nZi5+DNUnOpgCV3NvGGXkYMWTOb/vw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(86362001)(52116002)(36756003)(6506007)(186003)(2616005)(6666004)(8936002)(6512007)(44832011)(316002)(6916009)(5660300002)(508600001)(83380400001)(2906002)(66476007)(66556008)(8676002)(26005)(38100700002)(66946007)(38350700002)(1076003)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?bmrGGHdIHW/u7wWpWKzCpwSsIt0iZ356GchHtlbwavFlmYqqRxfxazd/A/e8?=
 =?us-ascii?Q?qjfaEoUdmH957zijsH5YaLJg8L2l5N0tM+Nm8UWHpMppKcK5pgDJ8/KOe1rG?=
 =?us-ascii?Q?lewrwO+scIfNK6l8HqcL5uAtFjcWlnMBertjtGBbSMiI4IgScPRsvF8VV2q9?=
 =?us-ascii?Q?Z7yF5SwVB1Iz5i3ath7ZYuIF3U6olW78OjIJORZBgbWaSqhV0PbjDx1v0q8J?=
 =?us-ascii?Q?YZG6hiDOLluzfc+OU4LzVpkvC3xYGvUXMnar/NvkgS1V6pNoVMpbhdfv2kkk?=
 =?us-ascii?Q?3IBQmJC50C6odUMveT3lngr5wgi9gSbc+DGt5kzv0qhU2gAmt80lC4pg2JJ+?=
 =?us-ascii?Q?3/phecANFIf6u6vtAXajyBKFXqyjzBIBoQFb/T36L/6AVFKRgZwG8+jGcXk4?=
 =?us-ascii?Q?F9Rm7C/1Na8GogZK/1aRd8RMxJlmGAy3NHzCOwot4HBJsOqcqOHZQAjjGLxv?=
 =?us-ascii?Q?iv/ds6d3Vhx7OqDpJY4XMXuJBlcnCK/3a0E+IB0OaLDwP+doAMuyFsf747BK?=
 =?us-ascii?Q?NljRAnrjmyo979U0Aqx0r6fLQnGGMuWVmuNJ+ltNHwQqWnqr7t7YV17/+ZYV?=
 =?us-ascii?Q?hta15RBb7+9GaIC0gV+IEOxvK+vpKjMnUATbM6VY0cSuqjl2LrJj/iufw17j?=
 =?us-ascii?Q?V61t+l8bIZEKZw50D9geU1ifsEgqad8EdilFymcym6rqgE4MeqxASOFjdH2K?=
 =?us-ascii?Q?h47XW+3jJRjEwYTaGgK8lVDYyuneDdzLVJntmrmPSbvTe8CT6fkYLDQwWjrw?=
 =?us-ascii?Q?HZrC3djMoHdllSk5lcClfljFTCK2Y1b06uahggBXiVf/2EHl8YzYKhid/Ete?=
 =?us-ascii?Q?3/kIgLTc6zF6SY8EXw9jo74HBFsK+LsKxn0uYAVTKVcS8SlpW3tgU6Cx2QGJ?=
 =?us-ascii?Q?z3A3gCmhl64otuWO5S811oGQUdv/5B/ylw1qV5ZJhrpTFGsUBmxNNuXXfRxG?=
 =?us-ascii?Q?+yjssCtaw0TUHJaKsigZ1mdmmBLzqrqcjZQNa9AK8IiEXDslaqWCc48qKNrY?=
 =?us-ascii?Q?3/9uu1BHshn70Z9jJNg7PSUsR2ukJxIje4bI94xBMbWzGY8IYY0o27BjqAog?=
 =?us-ascii?Q?7LkQpOpfFiubdNwtSMG6QEjwd4/mTWLwpT/4ZHo9aHeZxeAomhZ+lnw9oDYN?=
 =?us-ascii?Q?N60vqgNvAQFYoIJWChCKSTI8coQK07MqM3iQlTNG/XD6JEY0wiLcIRDdGAIt?=
 =?us-ascii?Q?jM6ZfxnMBVw8wlTP2zt62pr1J1t9DZuTXa1WzmXJdfRRhjnUNs6rFhpJ99Za?=
 =?us-ascii?Q?L+EXkPNVVZzYDGXaQB3SDfcFFDNaXGBaZjbtg70TpYLaKl/eOcdnN5Hh9vC2?=
 =?us-ascii?Q?rYfAsdiFDp4MDHf9JqKwR0w7/rH2e+tVhwRz5pWwqKyhXBQV69DmO8a8wPxU?=
 =?us-ascii?Q?UAnkqxBNHBB2xZWptbTZ/cmAZswXW5FVqWPfcBn+eYIPMnFOyjCDgCx/IvJP?=
 =?us-ascii?Q?fpGJprG3FYr9qRixpJXNwkK4wRdoAkwwqgfbVj5dnnCmD90wsiGmAb1wRt6/?=
 =?us-ascii?Q?4davASMijVOT3Bc/zGmQvTa2dujV+/y8MYZ4vpj0gV2cJXgQE71LW1OKL24e?=
 =?us-ascii?Q?TS4VhVnN5pID9nBcguXwW2CiaDtZjDUYQgkCqdcuGgcaIHSXvsU1g4tvXRpv?=
 =?us-ascii?Q?+evGHOObXVH2SFD/IoE9DNk=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 5e9e6a33-1687-44f8-0e59-08d9c43fb9b8
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Dec 2021 05:07:03.0384
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 KVOmGoH5Agrf2p4YYWogk7go8p/K13towtAkPvfYn/U5SB+mBjj4LTPjpVJUpOUJeR1z49/MDAiB0FMm6v6SiQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1263
X-Proofpoint-ORIG-GUID: JDZfx6GM3InRnKEo8D9aSVs0CTEYJpka
X-Proofpoint-GUID: JDZfx6GM3InRnKEo8D9aSVs0CTEYJpka
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-21_01,2021-12-20_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 priorityscore=1501 phishscore=0 bulkscore=0 adultscore=0 mlxlogscore=622
 impostorscore=0 mlxscore=0 malwarescore=0 spamscore=0 clxscore=1015
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112210023
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 21 Dec 2021 05:07:07 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94462

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../openipmi/{openipmi_2.0.31.bb => openipmi_2.0.32.bb}       | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-support/openipmi/{openipmi_2.0.31.bb => openipmi_2.0.32.bb} (96%)

diff --git a/meta-networking/recipes-support/openipmi/openipmi_2.0.31.bb b/meta-networking/recipes-support/openipmi/openipmi_2.0.32.bb
similarity index 96%
rename from meta-networking/recipes-support/openipmi/openipmi_2.0.31.bb
rename to meta-networking/recipes-support/openipmi/openipmi_2.0.32.bb
index 4b85d9427..664b716ec 100644
--- a/meta-networking/recipes-support/openipmi/openipmi_2.0.31.bb
+++ b/meta-networking/recipes-support/openipmi/openipmi_2.0.32.bb
@@ -36,8 +36,8 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/openipmi/OpenIPMI-${PV}.tar.gz \
 
 S = "${WORKDIR}/OpenIPMI-${PV}"
 
-SRC_URI[md5sum] = "ce8eb27da016dcad7543d0128fcb3b0a"
-SRC_URI[sha256sum] = "7052f37726ff454b0dcac49f35dd030bc12c9570ca0ba5cd2d17774b8e9d9717"
+SRC_URI[md5sum] = "532404c9df7d0e8bde975b95b9e6775b"
+SRC_URI[sha256sum] = "f6d0fd4c0a74b05f80907229d0b270f54ca23294bcc11979f8b8d12766786945"
 
 inherit autotools-brokensep pkgconfig python3native perlnative update-rc.d systemd cpan-base python3targetconfig
 
-- 
2.25.1


