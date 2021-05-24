Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web09.24733.1621870179651150478
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 24 May 2021 08:29:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=ERNNhYNI;
 spf=pass (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=0778c2e939=saul.wold@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 14OFB5lX011856;
	Mon, 24 May 2021 15:29:38 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2109.outbound.protection.outlook.com [104.47.55.109])
	by mx0a-0064b401.pphosted.com with ESMTP id 38qjghrtu2-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 24 May 2021 15:29:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W522P69iHbFr/kgSlVXqFw1Cg0ylb7EjzX7JwFPAIHi3bgWwI1FpvjaXb8ATmR4Ww6N38qauyxSv4RHF2KjdsKhhkQxQ+6OHHBan+7GLCExJZCqrHNK97X0k5byz0ckFtGhKVYbI6WPIDPv0c+vwDd/KN0PhwUQ0vdGOiEPtg04sJ49edcRdUS1QsDbEjk4OtZTOZTMyn2fTyv7JqPW+WVLGfhWiBuKltaqNiDSeIBXOI7dSwoSicjMHfAcBDE7QQ47V49xEXX9Vib7zxKiMjde8FT2Hs/S5WNiypSENrMrK2lHOXXDtvFDjYBTT7Dggu4kSyJ2lDuSgvwPinm298Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iiOY/02nTS5A8eKtJjFemGpNEZH20zWuPTY5NVCrkOE=;
 b=KVZKz6cxgzY3SJYXrmlNXNWoWVpYeOFAu6tNQnXUiWo/Gri5Ca9u8VGmoFMVtWQYoxWZ2uLXcNQ0Miuo0EulyJwl6xgbTGr0REL/SsbillQetg7CPGvKyNkRb1TzSVGU4AOk8VlFwD+IQUH/o+21R/RmIg029LuZ5ERyTblZb2bLic0Z8gLDQh644L6xKNtKWYBPoBsizJg1lpJ95JU3flX6To2S41BgMKk7mI4xV4rNLMxQHiotZTPqUEqzXP87BiIfw4NYcfDsy6+kewkXAwY1hBJczzI8jjgjAtdzTLcboZnXJNf8bDO/FpgLI5U9pt1mZnF9HKY5aShqLundxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iiOY/02nTS5A8eKtJjFemGpNEZH20zWuPTY5NVCrkOE=;
 b=ERNNhYNIUMOsYAyLM5O+W8G6n1myM2k8t4iFc2IpGkesLcFLJxK86vUmSkpUDDnreVuZoOf10JzOvW8Pdp3t6z8/emkjolXTIYPetBDuH2RMIdKOf+9Yk2s8/wHN4bUJ9L3me68zJ6D0CQ7MBilLdJmqdRxMvPIICBp2Heg2mGA=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from CO1PR11MB5076.namprd11.prod.outlook.com (2603:10b6:303:90::7)
 by CO1PR11MB5073.namprd11.prod.outlook.com (2603:10b6:303:92::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.23; Mon, 24 May
 2021 15:29:34 +0000
Received: from CO1PR11MB5076.namprd11.prod.outlook.com
 ([fe80::fda5:ca87:9468:ad8]) by CO1PR11MB5076.namprd11.prod.outlook.com
 ([fe80::fda5:ca87:9468:ad8%8]) with mapi id 15.20.4150.027; Mon, 24 May 2021
 15:29:34 +0000
From: "Saul Wold" <Saul.Wold@windriver.com>
To: openembedded-devel@lists.openembedded.org, akuster808@gmail.com
Cc: Saul Wold <Saul.Wold@windriver.com>, Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][hardknott 2/2] sysdig: disable building for ppc
Date: Mon, 24 May 2021 08:29:23 -0700
Message-Id: <20210524152923.3299258-2-saul.wold@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210524152923.3299258-1-saul.wold@windriver.com>
References: <20210524152923.3299258-1-saul.wold@windriver.com>
X-Originating-IP: [71.238.119.71]
X-ClientProxiedBy: MW4PR03CA0123.namprd03.prod.outlook.com
 (2603:10b6:303:8c::8) To CO1PR11MB5076.namprd11.prod.outlook.com
 (2603:10b6:303:90::7)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from yocto-hs.bigsur.com.bigsur.com (71.238.119.71) by MW4PR03CA0123.namprd03.prod.outlook.com (2603:10b6:303:8c::8) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.26 via Frontend Transport; Mon, 24 May 2021 15:29:34 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b525c99f-2dbb-44e2-4efe-08d91ec8bbfa
X-MS-TrafficTypeDiagnostic: CO1PR11MB5073:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<CO1PR11MB50730F642C0D14E3BB2CB75FEE269@CO1PR11MB5073.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1227;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	9KRe2P5oDqS3IimFqgrVC7P4c1R+ADyFQfWSHinq+rZbQ7v2SV5IXoPhYIJ+cIChVHkYz2gOtjOXw/w0aUuC3Q4RUcFM52OEDOMnU4G9Dy3AXEwiC1Wv/hMYbLoyJHvDoFXhzPB0zIxeXUd1UpVI7gvyOzyhZGZEIdYnKwmnB5VXD4VpzrLdmOuemDOi1NT4VTb2JeZVwAMAfM9T+7btDdhoACmj9YcnZvM+qyLMc5JN94EpF+Q/GVLwS9JfYLJS0VixUclVUz6bIMu2RdFUJCjvVaWYt27tL1CLPyrR7JUxau2J+4Hqzfl8u97TE3Ur16Ja95Zy2wm1FOp+gT3ZUK575E3oU8MEZrdYqvcpZwWDQiMc7vDLHT3PB/Bm5fLMd5g6sCerm9IFDjqWhcgapkBF7NYIafKNuNsD2fr3intuviXnRbdR0PJsCSV0Kle9U6jHVRzxy8+2np3binAK/HFBk5/ERvYWjf4ktAfpiJV35KS3TD47MSF+5bD/TwOjfftrU6152hkjyXiYTTxAq4Joh+S+HfkkjyyBj5dUI1J/qhx5ZWI5q3bEilP/OdxcUYbeN3jC3CtxxRgu3SEIc/UKFOVJoR7aa9CpbqFDUdv/m3Z+hBskVdWgN88k07UEAPnQ0JVNgJhyB25/zdFE8Lp47WXkNHqDCUaIjA3wjLg=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5076.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(39850400004)(366004)(346002)(376002)(396003)(26005)(16526019)(478600001)(186003)(4326008)(52116002)(6506007)(38100700002)(38350700002)(6486002)(2616005)(4744005)(8676002)(956004)(316002)(66556008)(5660300002)(1076003)(86362001)(44832011)(66946007)(2906002)(6666004)(6512007)(8936002)(66476007)(36756003)(54906003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?uf9rfw5bhOfnWNMjx9D0wyTGH1L7xKQO+8QczeCqUQKIhwGCqsKQgauitaiI?=
 =?us-ascii?Q?LkGjaI1o3fLlzqUnl+13JfYOD5bv4ovV5YPtLalNbN/dN4gN2S40Lx7Vf6Jk?=
 =?us-ascii?Q?m2jc4nWJvbn1GDbev8TWB//DoJxu/ic8rOFPEMNwMKTdbmcqdSD/AwooWUAl?=
 =?us-ascii?Q?hwLHpIA9R8rBKj51f+w6y7bgaJSH5lAqLRRGI1Ac87OsqTD8HRumZnXxbOnW?=
 =?us-ascii?Q?+q3XfH6ItCW4Od+U8kEqU2Ugp04Bpydgp/zlylgSitcaf22IqNaxHImYmfFk?=
 =?us-ascii?Q?sl3Sg4IDN0O8FbrAcxK5HIsFfOugf7HBSLW1spspB8kR2qaSG4qurOZtHewM?=
 =?us-ascii?Q?t0wCz4NIKh70edjEnKNk6EFWp1IOouYynV441UTP62/rFhy7cz+KlQIqGKKg?=
 =?us-ascii?Q?qeWbSizivEerzkb//78gnBh4eboBUE5gNFNQqdDxCunkz08iFTHf+AeeD5h1?=
 =?us-ascii?Q?LeEhWC9LHFoakfNiMCquzMHgJ4chP9sFa95SFUnm+suAAiyJb2mnlN3e1aRB?=
 =?us-ascii?Q?SKjCArclKenAgwVj/i8ktn3Zyvnri+imA1+RNFlBossK4gQgg3OUfIhPUZd8?=
 =?us-ascii?Q?/m12dr1Bpe1/cJuWOtJdOIGxzbpnhl2+ENRzqWtsh3LW9P0On7diAj7FDGHX?=
 =?us-ascii?Q?vVGObe2vZakN4z8hacJAd1IZTLUdvzRdZa4kkgtXQpXkmisl7vyGD4UuauZQ?=
 =?us-ascii?Q?oktcKEv7AjNWopsZmPtLZ3/WubbEbiTAA8+XFcmyqH40yAA58H4dR5wdjf1p?=
 =?us-ascii?Q?GijC7W4XqLqNSBQJdYGYB8dKv8s697HAcwVdpLv2Lb0F2FP+8J7HOFIU9D7W?=
 =?us-ascii?Q?NoNeHjErIozDGpenp3arT5gDdVyPvaq/obVEnJKIghJgovhF+yFTgwsRDWu5?=
 =?us-ascii?Q?9R3ti1cqCEgLrbXG8unxCL5K0eee8vwhn/99dbxsgO8uOBlIcs/zOkeFhUWy?=
 =?us-ascii?Q?U04QMUVHUerN3txYccpxtgT/xnYEnWTtDgfgjPJAQzXS8SpgLhtLogK1M7hK?=
 =?us-ascii?Q?mMN1nqfxJgRt5dNbiX2MLGhgvojlJ9HtM6ddbwFZebu0rMS4OnOj/3h8zeNz?=
 =?us-ascii?Q?HLy7n2lbN2nMdvrxpg52jAsB2RFiq8yBIIQidK7Fy2in+g6WG7V1xkr2Vbat?=
 =?us-ascii?Q?a89ijMHAnLDl6RZmk7rKtJ2Aor/TD5kfGRNwufcRH0qtMt3Deef4vaXoo+6E?=
 =?us-ascii?Q?FkmeSdASQ7qYmh0JZa+tvCb8Qs0JvdPzc71PWL+z037hH+bESzBLaignPCMu?=
 =?us-ascii?Q?N49aUe+irE0gvR1wS6O8kaB1FKLKMzdgkTBwL4DF0xlQGAwZvjCQP3Cp/LGF?=
 =?us-ascii?Q?hVnEHIozQ/cC9pO0A/y3CU2a?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b525c99f-2dbb-44e2-4efe-08d91ec8bbfa
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5076.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2021 15:29:34.6936
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xUNqailZxr6IR2ndrq35jB8VbDUAD2AGAEph4zdVP/Ale/6X3WidFGwMgsUPZYDvrTYbogmAUi7bLP2ser8qCQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5073
X-Proofpoint-GUID: 4DtRD7nvJ7eKGHgqaOjzuaZ7s6aLSGrp
X-Proofpoint-ORIG-GUID: 4DtRD7nvJ7eKGHgqaOjzuaZ7s6aLSGrp
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.761
 definitions=2021-05-24_08:2021-05-24,2021-05-24 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 suspectscore=0
 adultscore=0 bulkscore=0 mlxlogscore=529 spamscore=0 lowpriorityscore=0
 impostorscore=0 mlxscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2105240094
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Saul Wold <Saul.Wold@windriver.com>

Sysdig depends on tbb which no longer builds for powerpc

Signed-off-by: Saul Wold <saul.wold@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-extended/sysdig/sysdig_git.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-extended/sysdig/sysdig_git.bb b/meta-oe/recipes-extended/sysdig/sysdig_git.bb
index d9da19057..f1b77070c 100644
--- a/meta-oe/recipes-extended/sysdig/sysdig_git.bb
+++ b/meta-oe/recipes-extended/sysdig/sysdig_git.bb
@@ -14,6 +14,7 @@ JIT_mipsarchn32 = ""
 JIT_mipsarchn64 = ""
 JIT_riscv64 = ""
 JIT_riscv32 = ""
+JIT_powerpc = ""
 
 DEPENDS += "libb64 lua${JIT} zlib c-ares grpc-native grpc curl ncurses jsoncpp tbb jq openssl elfutils protobuf protobuf-native jq-native"
 RDEPENDS_${PN} = "bash"
@@ -49,3 +50,4 @@ COMPATIBLE_HOST_libc-musl = "null"
 COMPATIBLE_HOST_mips = "null"
 COMPATIBLE_HOST_riscv64 = "null"
 COMPATIBLE_HOST_riscv32 = "null"
+COMPATIBLE_HOST_powerpc = "null"
-- 
2.25.1

