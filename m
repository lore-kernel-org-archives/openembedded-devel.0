Return-Path: <Saul.Wold@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C91A7C32774
	for <webhook@archiver.kernel.org>; Wed, 17 Aug 2022 15:09:35 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.29912.1660748967572349592
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Aug 2022 08:09:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=sGpeZOuu;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=522867605f=saul.wold@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 27HC2sML012276
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Aug 2022 08:09:27 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=PPS06212021;
 bh=1TFZbwAYv1ZzduxP3hVsR4l+q2+ivgPDWjWv73fxGto=;
 b=sGpeZOuuLc6rD4U5VdaiAa+tSyWSGXsQVlGbfP9H0dKZDEX9xNtmIzlAOfQ23yzzL9Vs
 MHpYCuZCnfrvcWWq+MJNzK0ros78YrpZ+H5ccvpV7DO7W7/HIp1poAqUjQ/m9z7lU07L
 S3vx7I0PJmu6mT75rLTPN3iELMW7E/w0+AIqr5hLL0bOcWrh34xeAh8grWxNpuqLXLUe
 KjbGYanG6Xp554P5O2k9x6c9CrZJrIx13ng3TsbAPQj10buNHGHTAUksdUIS+u/0zhTQ
 jFdWZfX4Uf4dqpmxlBHH8WxCrOYcprs+wv0fxhfw+AAgzmODy/3T8Q90bPWrzDQOFn7G /w==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3hxbfjk9gj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Aug 2022 08:09:27 -0700
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 27HF9Qae017296
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Aug 2022 08:09:26 -0700
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2173.outbound.protection.outlook.com [104.47.56.173])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3hxbfjk9gb-3
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 17 Aug 2022 08:09:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=liNrwqmHs0ImEBZXuMXehjsEUw9MRhtHuuStKUtdKqAmKClNvWZT2eamPdGebOm+IL3z7yPNAJmHXpGdX1ddb2DxKPlFrROEKixFqEDMLF0BEiMu1NVuI23QCyMGEWHAUtAuMyXt2m4jqIYZfUog8ogm0ZmSydiuZd2WZS0eBREYHFMXQGIVdHy+lm+2fG2XD3+DN450G80tHINYhY7N2s913TEsxTiT7VxsuoK2DH39OJCOqNMVStwPEk+mWQqzQvuK2fToHsolNgBALFipqj2okqHmH8pOZxszINc6nT4j8GmfyNQ0GMBcyr9oyPMdI69PoEQBLwSDOhLlWcLsiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1TFZbwAYv1ZzduxP3hVsR4l+q2+ivgPDWjWv73fxGto=;
 b=UwB1jBSt2g+/QPwnbut65WS0VgABOh5VmbubGgY8IgvvUWu/gzkyJarclDlk5r9h1dOwYUJyHQcgzpiNperdVArR8+rl9d6KNDwmp6gKRFfuAXiPEf2WIRTKchMvQnOoMxkJWiVmoS5yvBZJYaM/iqC+lwmsDAnlkAliHz7PrIxAs//l7tmimJaGPVp1lqBHCpndFSc3BLtTGDJHjXpZUFniBzp28f7RgzrZuw75J9Y5BYK0qiywfTaR0HWxpunrXrG0weEXNfJVbu6/v605weMvVOZT4Gyvd86APn4idgatzQUSEo/Gjh/1AiVvFiIPbtogvjxxWrcqoVT4ZXrLfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH7PR11MB5818.namprd11.prod.outlook.com (2603:10b6:510:132::11)
 by MN2PR11MB4493.namprd11.prod.outlook.com (2603:10b6:208:190::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.11; Wed, 17 Aug
 2022 15:09:14 +0000
Received: from PH7PR11MB5818.namprd11.prod.outlook.com
 ([fe80::2db4:2f02:b7de:e4d8]) by PH7PR11MB5818.namprd11.prod.outlook.com
 ([fe80::2db4:2f02:b7de:e4d8%8]) with mapi id 15.20.5504.027; Wed, 17 Aug 2022
 15:09:14 +0000
From: Saul Wold <saul.wold@windriver.com>
To: openembedded-devel@lists.openembedded.org, raj.khem@gmail.com
Subject: [oe][meta-perl][PATCH 01/10] libauthen-sasl-perl: Fix LICENSE string
Date: Wed, 17 Aug 2022 08:08:44 -0700
Message-Id: <20220817150853.2823101-2-saul.wold@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220817150853.2823101-1-saul.wold@windriver.com>
References: <20220817150853.2823101-1-saul.wold@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MW4PR04CA0035.namprd04.prod.outlook.com
 (2603:10b6:303:6a::10) To PH7PR11MB5818.namprd11.prod.outlook.com
 (2603:10b6:510:132::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a56c371a-0964-4677-5cd9-08da80626e29
X-MS-TrafficTypeDiagnostic: MN2PR11MB4493:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Mz3zqjtxMG9GboTzN7E4UxaHFRWvzSUDWGgIYd5xfZMIoOwJNsbwuJzV3aVWdcTbkcqocTvocTJ12SwsusgXrMizLRgckUSvi4SlmvHVy1ZM18j0wUkUu39tZRAXE5aqUtNqBrkatIOqe+2hR7WBY2tOJWYfx+upQWyxse+VRXW5KzNIAm55RKwYAOBzsbZMUHdwFESy6YJRvjB8cLYd00m4Tyh71RYG1xQvo+ZAlQKB1QM67gCn+QmnxLFh8C/UTHOMaMJrnntkvF8OL9Uw3cCRrezfOFTDq6Ane4kziUyJskXTuTcE/xKJIBrm/OhFtOtWL/4LeliJtBT3nfgIiGsgAY17XZxtEqFJ/0pcgpsxDP1M/32lCaXpmbPKeip06mc8bPspNCh559enMH55pJObrmia1she7WdYMedSNTTEsrmeFmLIu49/2W8RP16MhmEUm1r0D3H8IbuVikQ7v8VStjXbLt2UT22HxkTFyo/+ov89dUA/c3Jct9ew0pyxu0IkbgKt4udZP90S4eF+fdYtxPAkXkPh6OxzbqLRE8Vf8sU8ag7nSFvEqmuYk5KFklNgzggi6l+e3TuosGwJ6m4NkMzaDQmX6Hb14bcJKUqiYzYnXzx8DbU5sm5b29u/9LUa5pmpJzz3UgXJzVhrIFdMj///rDidf7ZAZverReT/d58xl0H6lfXOvCVXOq333sjiyAKoWX1l7X4mzzK/7a18dJPJkAq4gFIgEzy1NiVHW3sgfWs8r98XhAi7ER99fG0Jz0ZnmeFe2+ILCYmvBenlfRJayXWz0xpLHXkKwkoZT55NwgYAKDm+s/EUdjNB
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB5818.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(376002)(136003)(346002)(366004)(396003)(39850400004)(41300700001)(4744005)(316002)(478600001)(38350700002)(38100700002)(6486002)(66946007)(8676002)(5660300002)(66476007)(8936002)(66556008)(44832011)(26005)(2906002)(36756003)(186003)(86362001)(6506007)(1076003)(6666004)(2616005)(52116002)(83380400001)(6512007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?kcaZSsPxA5ft6IKxFJQlBnYfacLHhOohNUrgg/YXFsmBPuS6xwdgvekNcClg?=
 =?us-ascii?Q?AhPjJDDCZ9zwQI090A9a64lQyHgz70hpw12/NWSjBVxPi8jJwa4H/cf4VuhP?=
 =?us-ascii?Q?D98rW0NqUvRdHfvykBoPAgztyj8udRB8NP3sKeW0cMDAYfFSIULL/Nh/WPqj?=
 =?us-ascii?Q?3+izkHfAfcdq4FbM8toeBL+GLlBpPfD/rB/ajsrNPHKkfya1xlLgTIMn96VH?=
 =?us-ascii?Q?Pay4g2G8g9H4SsHqZgqlPp7KgS+VQNFlcjnz+SzJ9HZgXTSnCCRTViENfK9X?=
 =?us-ascii?Q?P9Iqh8NLCUCP23kMCYXm3G3rBdZ0KSWfpI1Uu9H831WWOfXrDhGx8yNyveO8?=
 =?us-ascii?Q?xLa0gBp0yP4WRAakc+2mm684Aw9bijEraHNBkGJjcRx6yJyrWV9LBKyO00ud?=
 =?us-ascii?Q?8knIb102S3o83K4lsz7ieRWflaWGaFA3bl9wNzFjTVFV+5xVNie+LxmJgAYs?=
 =?us-ascii?Q?n35BCc6AIT5tOWxP87K7YkE79RQno+on9yPxb4tdfnZsYeAoKoBe25BjRkcG?=
 =?us-ascii?Q?hYgAdBALChiF2TgBMlMDecjTLhl1tDcCXnwkqJGWvcd8j32SpxiNMawZwk4o?=
 =?us-ascii?Q?92tYtkfaB/gO+/rqlrmVn4Hj6huem2bmRbtqO/oN/EzQ8vKCiPvkI/H7kt/m?=
 =?us-ascii?Q?KMOAdf8ILhPlt80e0PEL6BVtFeszAcrCGPVH51/OFgfxhAtDxi5+SRU8gTV+?=
 =?us-ascii?Q?zekPoqs65kxMRCRc2NuN92HaFwYQLE+Di9PnmtPpKnbd7mk5PUdW/ti9Jvp5?=
 =?us-ascii?Q?lxzeTar7TyfneZsbcoXRxCqtZsRlo6sEMKi9JizbTxYaNSMfDjy/PePsTn/n?=
 =?us-ascii?Q?TeL2fy74wzllxP+4AHA7amwomIUHfchZZ90UhNtuFdD6FFxbnXJAOtGWBgbs?=
 =?us-ascii?Q?/vkKVvgUtSsX1HPUevtliGaLHop7TxnM8jQK5zXZjcfqdcCUKOqV+tbK/eYN?=
 =?us-ascii?Q?HC4oT8c4o5ULGLa7508Hmceq8q8cZgDGYjw7VVp6ZZLP8I73it/3R18klj9p?=
 =?us-ascii?Q?K++udgCtX01IGLZk00BHkJKy3zPmKhPDDwAfeSjfHvprUsDzYCb672fcf7Mj?=
 =?us-ascii?Q?vB5C9/kzpeSwHt3T2zQFfMfzoWqCu7QyvixVnhQzyn2VsS/nsWWXdOWi11Gg?=
 =?us-ascii?Q?aqVwLwd5X1s/0BAtAjd7oYV0yaiMEySLymQrpbOYU88o4SSdhpz9/FLTN/9x?=
 =?us-ascii?Q?B7XEBzi6AAcqDM6/3XEx2eoVnuguQz85rAYZL5gz2D5touQBtLe9X42+lO9h?=
 =?us-ascii?Q?cGNvAq5SZxaBUfdNZ1OAkBc0KeVAcFTwHSUnoXGi8p+3LkY051VlTNyHv25X?=
 =?us-ascii?Q?5ifaBtcE8qDplOmRTpHMj0uQE1vqVzi0WOUQiE8l22rEnLYs0czU9ErQN1BK?=
 =?us-ascii?Q?1lBpo6bKRg2fuyBafx/3JnaJFtyR/W+qo1sWrqd5r+tJCp7DAk95Kl1052fs?=
 =?us-ascii?Q?JP+PMV5SAaIz5qCQGsZU4Xdv62piuAsUyVjfPf5II6ktGteAu/eL8KvBTZP4?=
 =?us-ascii?Q?DMCAPUxJaskwLiBPwe1NhmvpXFr1eSNnlUICkCRc07coP1irF9+v73qXNTdU?=
 =?us-ascii?Q?rXThG9N6b2oQKvwBYIjA0ogBiEMPgxxko9VJ9JK0DcbVAoNd/epV2aoNBwY5?=
 =?us-ascii?Q?Rg=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 a56c371a-0964-4677-5cd9-08da80626e29
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB5818.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2022 15:09:07.3151
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 HL0r1+Vvn7LeHgYrWdUm9cc4uAZEAO6pKaFT6Iof1bfxJfxQMPmzWewy6n/tY3KUr8JVk2MAy6/uXPOOLTzDOA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4493
X-Proofpoint-GUID: 9KAoi67nQZIC1tXz-ABFkfuXJNLESPpB
X-Proofpoint-ORIG-GUID: AEiSYzhqedKrQ3orcjC0u14Ly08yGa2Z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-17_09,2022-08-16_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0
 mlxlogscore=999 clxscore=1015 phishscore=0 bulkscore=0 priorityscore=1501
 impostorscore=0 spamscore=0 lowpriorityscore=0 mlxscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2207270000
 definitions=main-2208170058
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 17 Aug 2022 15:09:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98296

The create_spdx bbclass does not currently handle the lack of
spaces around the op (| or &). For now fix the LICENSE string.

Signed-off-by: Saul Wold <saul.wold@windriver.com>
---
 meta-perl/recipes-perl/libauthen/libauthen-sasl-perl_2.16.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-perl/recipes-perl/libauthen/libauthen-sasl-perl_2.16.bb b/meta-perl/recipes-perl/libauthen/libauthen-sasl-perl_2.16.bb
index 8545eb50f..a9eec6950 100644
--- a/meta-perl/recipes-perl/libauthen/libauthen-sasl-perl_2.16.bb
+++ b/meta-perl/recipes-perl/libauthen/libauthen-sasl-perl_2.16.bb
@@ -5,7 +5,7 @@ protocols should be able to share."
 HOMEPAGE = "http://search.cpan.org/dist/Authen-SASL/"
 SECTION = "libs"
 
-LICENSE = "Artistic-1.0|GPL-1.0-or-later"
+LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
 LIC_FILES_CHKSUM = "file://lib/Authen/SASL/Perl.pm;beginline=1;endline=3;md5=17123315bbcda19f484c07227594a609"
 
 DEPENDS = "perl"
-- 
2.25.1


