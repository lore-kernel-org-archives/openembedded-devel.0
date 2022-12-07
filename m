Return-Path: <zhe.he@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D19DC63706
	for <webhook@archiver.kernel.org>; Wed,  7 Dec 2022 11:40:01 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.13167.1670413200413705544
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 07 Dec 2022 03:40:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=s4dBUDxK;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=93402ee8fe=zhe.he@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2B7AxHcB009127
	for <openembedded-devel@lists.openembedded.org>; Wed, 7 Dec 2022 03:40:00 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=APhs3fOziocHwhhdSLjHE4mXpKlz/ReDM7Lu/9y6cpo=;
 b=s4dBUDxKT7xYBCwAiKH7Tubiw5NRS1dgAn6byZIN7vciHnZAHPXWK3EfD32heUUTlEJ0
 s6jhsQkj+h+mNaYF5bFYo110MJwWIaI3SiLj3i5nQsgFKi/h6mY6suuCXplw5uBo26VT
 +Z6h33zCImCE/OXE94GIYdW+QiPB1bc8ZZmriT52zuqxV+aomhfejjo2RfMhFmdauULx
 clBezmAZNlIjYwc7fpchl8HXkL3mf6CzQ3jL39aEtZDxpKijcDsqKCch74tuO1KE1Ehm
 ganVyV8Qeu6S4GESDaACAXOdZBueYlQsFUQZz57I/ORldgPZou3aLQpBpjEIiZrEAZgA qg== 
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2170.outbound.protection.outlook.com [104.47.56.170])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3m82m6u8k2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 07 Dec 2022 03:39:59 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y4odjXn92ToYdjIVBxUFr+3AsGWSeNWjHydcvETmfRPzPzvXr1yNVpmE6W4/kR+PJO8+SxVm12ue21U3okVnR+vUopnMDoTXzqRktLnK/PkQUuEzwehLE2zMxki4G9iNu8PjmERLbrfzcMWaV2R7qB41jgAYOXpfYK8SwVRMucItVcUNQPRoFJDHEO9nDnUamFe4axobf0XZwtEx+5ZWYQuHk5PXwf2Fuqwz9/6SVeQ+okNlIjH4lAlhb+sO8rBd78+Yl2vO2rWf6qNRsgT5VBKFuzxVEDmGpVbswTrwf3imSvtvX6F4XW+2J1F0WxBLLrVwIJCzwWHL6JFb3Xudhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=APhs3fOziocHwhhdSLjHE4mXpKlz/ReDM7Lu/9y6cpo=;
 b=eHyTPc+l/2DfmhisizghU/xN62ExGagfBV37PoYe0G2UQpgDY4WFcFuCqR950Ebrri8UemsCQbHJGu+ba1W6MwcF0wYUIXQdh7IV/nZWaqzuXmYATDhJe2EXYWlTDEYi5GlwJnvF17HRh/vXdVWOsL+9NuY+0VCf2dC9AVvJzjeFaovLij5Sw9AeLKsQIB4Cn+XHZdT38sKVnLTR+SzBbWEtbSJXXZQGycKFwvSFM4wTHFXKRTjOzGdEnO9vFVKACrLyR4oQ8sus0D5A3US2/datfFNG1Yezd9hgDuf7xjZ8/5hSoyZTlEYgkw36MDMOA5QeKglIgHfqjMH+hECj0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from MWHPR11MB1358.namprd11.prod.outlook.com (2603:10b6:300:23::8)
 by SJ0PR11MB6742.namprd11.prod.outlook.com (2603:10b6:a03:47b::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.14; Wed, 7 Dec
 2022 11:39:58 +0000
Received: from MWHPR11MB1358.namprd11.prod.outlook.com
 ([fe80::dfdc:1e8b:daa4:455c]) by MWHPR11MB1358.namprd11.prod.outlook.com
 ([fe80::dfdc:1e8b:daa4:455c%3]) with mapi id 15.20.5880.014; Wed, 7 Dec 2022
 11:39:57 +0000
From: He Zhe <zhe.he@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-oe][PATCH] protobuf: upgrade 3.21.5 -> 3.21.10
Date: Wed,  7 Dec 2022 19:39:43 +0800
Message-Id: <20221207113943.164379-1-zhe.he@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SL2P216CA0154.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:35::18) To MWHPR11MB1358.namprd11.prod.outlook.com
 (2603:10b6:300:23::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWHPR11MB1358:EE_|SJ0PR11MB6742:EE_
X-MS-Office365-Filtering-Correlation-Id: c31c3a7f-57da-42e4-4af1-08dad847c41e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	TL6KHQf4P9bhaWHlm7Ng3IbIcT2rPN6kf0t4dX7oH4P4wuFFfwwNL/kTfF0KGELlTDhnLqC9lvi2xlJn5zqcDoQ6pi/ZIGcpsWahozlCnIDcnF2WsHCREbnH9A/asFMeuN5cXV/cTk5p7j5v1UQ+sZctIE0PBN9UCsASMxBQ0EhfnPXIK6W6+Sn17OQvz0B64UysEpgQlicJz/qzisG+uT+HHr9g/7Iv1f9TOPvPbkBoSbWcGneT2yPTIEdxz8gjWIfPSzJ59LvHIB9B/qs0Lj+XFRjSgoPahbqxeUzrnCtOXPRXnqbpWOX59c9xMRvhaIderNbaX7lpM55odY0ieb6QNA1q9T/WyTOF8zg6V3QwHXnJYm8SfHdClQqlisDvQBttBXdy2+o4vAponYUbYjhDQxIqFJUt9uVZFgUgwyg34cPLf3wtFnPne4xQGRm9R0VL7AKirKwJc26VRNyhMn/Kyc2mVw7U/OX11I5YSfvsYKt5F65RA3EhPTm7jw0kXxp+u9DwgAsfFFje3Pi9wTogIeAaRpufoNqKW6Pe+gpqaTXHY6Cz7Yv1tcoGrk8TuOPGIqK6U13MzTJ7GShgrwQkvpoFrzimMyDOGyFbkZLpnMC6go4gUmTnvdr3Ty0xSIZi22kuy3fwllotEgjgBpr0Nt87Hy03oXTM73ya/kdb7h+TOX2jbYPdr3dHS3TCezn/oF2c0QZqGif9TDzY+w==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR11MB1358.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(346002)(39850400004)(136003)(396003)(376002)(451199015)(8936002)(83380400001)(5660300002)(41300700001)(66946007)(66476007)(66556008)(8676002)(2616005)(36756003)(38350700002)(38100700002)(2906002)(6666004)(1076003)(26005)(6512007)(86362001)(52116002)(6506007)(186003)(6486002)(316002)(478600001)(6916009);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?iuLV60w/aZkqF/7TexdUcsmmIqwk6vkpzmqEzweP389vgCYIZ4GLUgNYeLJy?=
 =?us-ascii?Q?fP9YeYuBKXefy2AY58jduPlbOg7OoqVro3FJsJi4iv2yh7rNrj4ls0a4q4b0?=
 =?us-ascii?Q?rdqG4yc68A8XHDFFxqehUFA8YS9x+DgiM6f35xcqsTI8E2/NyYS2/+kMgosb?=
 =?us-ascii?Q?FoXAV0yXcnbJ1YUctFPdFFEgSEoTNBhStv+zl4ic4xEe6xOyqxXtuZzTgGwl?=
 =?us-ascii?Q?8nWQmFzhMjwbWnzJVBXfRmpjwm+0jBfq0bMqk9OfWoCzl2qTIW8Js7f78bCM?=
 =?us-ascii?Q?oHYvGEORU8XjGh4PovfPmKYCMEux4MZluuVU2QeytLcjevVv3KD3bj/BF86B?=
 =?us-ascii?Q?97CCvHx7TaCuhA91tgrG1V7h6i5+eL8kdpuFQTNGe4zFtHR4ndlwMbFkLCng?=
 =?us-ascii?Q?Rw1nXtzqkrMsiLTnp2idaqurZezugFCgZwgrx5mbBnO4yxvAzV7cEXPQVxMC?=
 =?us-ascii?Q?sh8kIBPG5Dxg/dKfw7SPZ1DgRTlZv8b9aqggcbM4d4vTxbCd1tg7hfdYXNsC?=
 =?us-ascii?Q?JkpsE1tHTFNgtfEZTPR3mlAm3BJkw3mp407sGq36zlnEb/olkAhoxvy80QL6?=
 =?us-ascii?Q?2Z2+3uPz183k4HPcN6BR3wMFu3ZO7v9IWSrCGISCiS4jfufoMyfNp8gCmWN1?=
 =?us-ascii?Q?l62h1D1SuW5NQkIlvKCZV9+ofR1jSHVOPbJZIcYihofaMdOYcMpYWIUrRN04?=
 =?us-ascii?Q?Q7QbGxyFa6DR8C2O3ct2LKM95YT/vee1VOiMuOM//9dGP2F8XLK7vQhNH3az?=
 =?us-ascii?Q?gipshvPCgDeQi1LLecntGzMcV7j6wHrvsFVGcgSzdrhzyx02xPqtCLhtp7sN?=
 =?us-ascii?Q?Ak9xr6rIf8YMSs5MFl0khMVxEG8SOAq4rJQXiMiuS1VsscTVPDhw8pS5nsV7?=
 =?us-ascii?Q?IHrLc+qSVNW2GhZgMG0zfZnhWCcYOg+V2vMXH1q7XLCB3cA/Yw4EHBQW1pfE?=
 =?us-ascii?Q?yjCzLOYeHY8axcZxc6vemPpmI4qVtFat981LxIsO2bsZpiuOo6Ho2YROLwiN?=
 =?us-ascii?Q?LSbvt/XSpsrtngYPvjAkeWQJlammc7eiSCGQSL24Cx+OsS4CAvcoHeNKe6OV?=
 =?us-ascii?Q?HiXSBwrZnEirtyXfYixZvr9siCDPql0QhxzQlLB04+Hfb4PsC46KlQY+3uxd?=
 =?us-ascii?Q?U/dxv0yGxFu2ND14iPltYQedvYqn1hqZfMDrQDX6Nl5EBfQwsR8aTOIUfjrK?=
 =?us-ascii?Q?jwjpoXgnmIN/ZYugKeSYRON6ueDxLZLEwNFPkAddA18I053kBjUOfsidJnez?=
 =?us-ascii?Q?GzwqgreacA2mWy7Awe3b7G1K8iuXDwXccmLYyadcRbNlI6e4/jYTuXaPhzkI?=
 =?us-ascii?Q?qCaDdEWnaVcvpt50nvN+tAA8G1cO+85OERBFn6fDsdbZiQfNR2TXUmKe3aSP?=
 =?us-ascii?Q?8kjUI4liNiqC44VYv2HNxDkpbsMkI8GJG5RfBCUNLM/Y0pZFyx9VdhMXeopH?=
 =?us-ascii?Q?Vr6N3fBU7Li1UattQTbZI6KX9SrUytCLys9mDfVDt0zS/sisplGsA800oMSE?=
 =?us-ascii?Q?tEXDUDuHMOdAEpsC/HVM5Fi2QMvOA15AKVybwNjK8J5VaGmOgQOmcgX5Ozii?=
 =?us-ascii?Q?t2pS5NFoqHAeEfUm8YVcpqjUu3Cre7+Iw/H+x9yv?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c31c3a7f-57da-42e4-4af1-08dad847c41e
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB1358.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Dec 2022 11:39:57.4068
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 61leZDne1Q1prpoCi7y/I8KIxIRnS1tNkBMsWMO6a4ZjHbfPzQB1mNjjcCM14nhctgYeoV/YMjELcw/hg8+4Dw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6742
X-Proofpoint-ORIG-GUID: KKN_5lkkQNM8hjxhKMPpUXQKjeNQ56NK
X-Proofpoint-GUID: KKN_5lkkQNM8hjxhKMPpUXQKjeNQ56NK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-07_05,2022-12-07_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 lowpriorityscore=0 impostorscore=0 suspectscore=0 adultscore=0
 phishscore=0 clxscore=1015 malwarescore=0 priorityscore=1501 mlxscore=0
 bulkscore=0 mlxlogscore=589 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2210170000 definitions=main-2212070100
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 07 Dec 2022 11:40:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99973

Signed-off-by: He Zhe <zhe.he@windriver.com>
---
 .../protobuf/{protobuf_3.21.5.bb => protobuf_3.21.10.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/protobuf/{protobuf_3.21.5.bb => protobuf_3.21.10.bb} (98%)

diff --git a/meta-oe/recipes-devtools/protobuf/protobuf_3.21.5.bb b/meta-oe/recipes-devtools/protobuf/protobuf_3.21.10.bb
similarity index 98%
rename from meta-oe/recipes-devtools/protobuf/protobuf_3.21.5.bb
rename to meta-oe/recipes-devtools/protobuf/protobuf_3.21.10.bb
index 201908f3c..4c45c4a7e 100644
--- a/meta-oe/recipes-devtools/protobuf/protobuf_3.21.5.bb
+++ b/meta-oe/recipes-devtools/protobuf/protobuf_3.21.10.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=37b5762e07f0af8c74ce80a8bda4266b"
 DEPENDS = "zlib"
 DEPENDS:append:class-target = " protobuf-native"
 
-SRCREV = "ab840345966d0fa8e7100d771c92a73bfbadd25c"
+SRCREV = "11bc195441adfbc87ff0349f1c4be7a239d1daad"
 
 SRC_URI = "git://github.com/protocolbuffers/protobuf.git;branch=21.x;protocol=https \
            file://run-ptest \
-- 
2.25.1


