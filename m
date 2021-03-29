Received: from outbound-ip23b.ess.barracuda.com (outbound-ip23b.ess.barracuda.com [209.222.82.220])
 by mx.groups.io with SMTP id smtpd.web10.15435.1616980936121314547
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 28 Mar 2021 18:22:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@digi.com header.s=selector1 header.b=Q/ThHH6X;
 spf=pass (domain: digi.com, ip: 209.222.82.220, mailfrom: ben.gampe@digi.com)
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2102.outbound.protection.outlook.com [104.47.55.102]) by mx-outbound23-158.us-east-2b.ess.aws.cudaops.com (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO); Mon, 29 Mar 2021 01:22:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A0jp7LFiEVaMSUpk0Fq/ieodhFB9x6hhid4Zl+xzndnSNQzPWszc7+owa5G/kCt6zjDPnZaU1CkEMVhfReoaORzeS/9ajkuZ70KSq/Fk7fzuz5xyIUCJ00BoOm4Bsbd5JrbPf3YySo27CkhoC2kRqTsZQ0bepS3du0DZd/vqReqgdVHNhFKzsgk+/jt0vIT+/qF9BbLr490rksZycrrNtttoj4TMP2d+IPJVREtBb5zZQ9/jxIfhSoVufkYKw2zg79uega/lwthnLwlERplGTZZf9Br2+0uZM5hSGtfAFMjmUTTvs87mj46qkvwMwpJOL6fGtCpH6BxSVnbgsFqNBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=20PTG5OSSAam+u1sIxkXUT1boEd525+Rvz1xfGL4O1w=;
 b=F+AZiOMSsbhtryZ0ULX5gNnFyHAarahMdzncJLMyGyiXjfoWZJCokdFmFmzjl199SYA128UcvZFUPeRyWzlfHm7EsAQljCguxbjtpeOBitZcf43iTxIqNa1BeFIL7pQmesJTlJG96xhMMIbzaspQzO5AVoNuq+FLvx2ybwzvkFTuiQJsDc7ieootkJAYLfoBinQxQys8Cl6zww1L8siPSMvFQdqpJUVYfsyBcMlQ+dYrZZhktFAPTUu+MpMYpIz2Q3HeOP7urCMe+Wu527PRYK2rALMzYm6p0SX6r01/+5nmdB6dIsN+xhQQnn6KT8VdZYy/Pckhak8JUNVdNQF/Qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=digi.com; dmarc=pass action=none header.from=digi.com;
 dkim=pass header.d=digi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=digi.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=20PTG5OSSAam+u1sIxkXUT1boEd525+Rvz1xfGL4O1w=;
 b=Q/ThHH6XWqibNeFim1WLVSbHwxUJ62wCnMO/Y7ArtfJ+kunf7yiL20mJ2pzo/e2hXP4mLncjmgpEsJ0WqoBIsy2TYfaqFJO6G09a0TCw7+I6g2Fnz8nBIG96vfD6NHmdKdwu1mf7y5ZPrgD520j3E8P0aAIQTOoAB3DoX6FmkzY=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=digi.com;
Received: from BYAPR10MB3320.namprd10.prod.outlook.com (2603:10b6:a03:15b::21)
 by BYAPR10MB3703.namprd10.prod.outlook.com (2603:10b6:a03:122::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.25; Mon, 29 Mar
 2021 01:22:12 +0000
Received: from BYAPR10MB3320.namprd10.prod.outlook.com
 ([fe80::3cd7:c100:494e:cecc]) by BYAPR10MB3320.namprd10.prod.outlook.com
 ([fe80::3cd7:c100:494e:cecc%7]) with mapi id 15.20.3977.033; Mon, 29 Mar 2021
 01:22:11 +0000
From: "Ben Gampe" <bgampe@digi.com>
To: openembedded-devel@lists.openembedded.org
Cc: Ben Gampe <bgampe@digi.com>
Subject: [meta-python][PATCH v2 1/5] python3-h11: new package
Date: Mon, 29 Mar 2021 11:21:39 +1000
Message-Id: <20210329012143.2580564-1-bgampe@digi.com>
X-Mailer: git-send-email 2.25.1
X-Originating-IP: [60.241.24.90]
X-ClientProxiedBy: SYBPR01CA0170.ausprd01.prod.outlook.com
 (2603:10c6:10:52::14) To BYAPR10MB3320.namprd10.prod.outlook.com
 (2603:10b6:a03:15b::21)
Return-Path: bgampe@digi.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from beng-dev-laptop.beng.bne.opengear.com (60.241.24.90) by SYBPR01CA0170.ausprd01.prod.outlook.com (2603:10c6:10:52::14) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.24 via Frontend Transport; Mon, 29 Mar 2021 01:22:11 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 70e1941c-085b-4d3e-9bdb-08d8f251141e
X-MS-TrafficTypeDiagnostic: BYAPR10MB3703:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<BYAPR10MB37032089EC09FE14EA3D32B48F7E9@BYAPR10MB3703.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:425;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	FgA/lsXdKDeVzLdx42UNlTbsIF2/GUUwf3klR+VQ086woPIaaEAzleGcUsFIhm3sgvnnTWbBfszOVzgou0FLHdnxhgFlwtp1lLsX9d8y6ro4/nK9SYObN1yJCc8p9llvM+aqfedgthUqQShW/oRPbLlVkiZn7oZwDHwevf23L1ifQj2eDIovOHUkLZYqg24oXNzK5Q2AQPhKDnqMQgnCzFAQPuOH2xHquQXLLi+YSCRGjixtNFDKxGorbaDLxMGH2Zzad+3ZUOxxAzlp5M4Qg2oRBMrpnNIYNOL5f0Ngin6i7J6UGw5RknClH1zm2V4ta+A5VAUPiLPl+hdyIsGnJoRJCuKE79BcGp82hc+E9ixWN+YU/pdaHBqqrmr47UNdwM1azqMJzOyNgRIXy4xOPCaU2VeqnbfMJ1Pn3ARK9W4sbbEbl5vhlQzRdJHCLV/IsVpxzzU8pPIHAT+IUV0EwFofLp8DwtI3/1aKeg+lcP5nAl6E3c6TXTH6G49wsI3iGQ7A3K8WVy5H+baoBL0KWm1JyCNo803LH9UIYKHJa5n7461ESxrDeML/+AKWUjW9aCLjb5LVloHMsy5J+GK/TIEdinX5v2a+LUDDkBToeoH2h3RCRGH5W7IlTQ9O0Isz8NjarTvocnk7Ys3YltrzINmdB9LZgOhzwfzjdf5Ckp4YpS5Mc8TCNFYc7L3UgzBiM8frYbmAWLzqUvSATWOY+5neVWHET7PfOKIEC57EnGI=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR10MB3320.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(376002)(366004)(396003)(39840400004)(136003)(6506007)(1076003)(8936002)(956004)(2616005)(38100700001)(5660300002)(6666004)(66556008)(26005)(6512007)(66946007)(316002)(186003)(36756003)(66476007)(2906002)(16526019)(107886003)(52116002)(6916009)(6486002)(8676002)(478600001)(4326008);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?2grXqBkbYp4342jjbUihBTS4HKyzO2Mb3TdJzmkuBGMqz94JQn173c13xaUI?=
 =?us-ascii?Q?ZSzMDIeQQyaBfTePOk8lJURcpPeHlHCqvje+3KHe0httZTIKj5X487P6rHns?=
 =?us-ascii?Q?Vubrdyy3UyCBh1vggG57dAm0TbD/Ti4GySuSlbIzcWp33JsNRs3ru5317k2a?=
 =?us-ascii?Q?TY20xGk3BLDiWXr+Hxneswl5spQJrZ+ddCy+J5EuNC1hmku+V2t6Ik1EuiYC?=
 =?us-ascii?Q?/G9cAEmUJBa3HOWco7oqyAfbGwfyaeSQ6PEP/fXeCSV+zNdEWRaFnExGlZf7?=
 =?us-ascii?Q?E2bcn29uCwhu5M8MSxGE4fUYTW93x8yMdDxGshgNKkLa/nA2tRCkIqMBqqIA?=
 =?us-ascii?Q?omEViBW2B8H/9Hiv/BXXTpUudjXhALA3nIcuCcwfWpnqY7coX/kg7vEuRB2X?=
 =?us-ascii?Q?TDe+N+q7cWgj56DjoqNWudAwF5YvASziWEB5MfYdiRQnd3oRQHSf0H+t26Q5?=
 =?us-ascii?Q?yIncEI+s+xJRLI+SLwEQ3j/xAHUcCAP8oKAqGrdzzQ9onGrSul6l4SYZOc65?=
 =?us-ascii?Q?SBSHiNYzr9hcGh4Vj9UdDfW7oX+sA9wsAOanXE1klqnsJ1B1dzkS+d3H5kMw?=
 =?us-ascii?Q?bVNqkcjhV+GSPZ7aDz2WMPxwnqkLjYy6CnVP0/rUSvLqC7lduqXkKHCwH9yw?=
 =?us-ascii?Q?eQq+3VBWULlySwvE3JCUh2wft5b/9q8b/JSRDWozLF076W0dewhde9syf8d6?=
 =?us-ascii?Q?pbBbwkoXWfOVv1joPx2JTgd/475ly8rmTYZQic4Jj3dl4TxcT4tVJdE/B6W6?=
 =?us-ascii?Q?R09oEvGiKDBOGZqXKTjXm2LeRIKKVZzigih1gldYfcSHarszQnFPu+R+o/xM?=
 =?us-ascii?Q?B3kxK/PnomryeKJGS/aiX30Iz5dItsnhJKiB64Kpy+Z1qIXitYODrYTE3CrN?=
 =?us-ascii?Q?VZq1BGVyTf03ASZfGjtV32JQQoCFjgv32N7fk0uzIqq4bOC5Cj7adCHS8KzY?=
 =?us-ascii?Q?gZI9wfsa5geSpSOsrDmuTRQc5o+AiKE9oPbPuciBVKV2NM37w6ii7IECfazz?=
 =?us-ascii?Q?HLnhpsPE37VJJK/cRmNCYoWTka9dkVmw00L32t30Cc1h5xPahR8MmXyU58OT?=
 =?us-ascii?Q?gyFjUAefotgkyUb8tA5JKOFfFn/nF+9qCWyxVJelixtPayTa4D1U/Cs4IGEb?=
 =?us-ascii?Q?r6gn0zJtw24k+r6XOocw3clLA63XrdQibCfo3XQiee6ecvLxc//XJt72DWzf?=
 =?us-ascii?Q?eVuGC6YgPm8quDuf1UjfLOLircmSIICHOrER9mE2aetBofu0bo0xczPVpHLJ?=
 =?us-ascii?Q?e3KRwvZ/aJfsI29M1VpkAXsgdLMi6P5psu8axmCU9iNDNEqcO9qwvJ3mD5FD?=
 =?us-ascii?Q?V+fZ9Du3KeKcSHvtLO5vnA6q?=
X-OriginatorOrg: digi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 70e1941c-085b-4d3e-9bdb-08d8f251141e
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3320.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Mar 2021 01:22:11.8487
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: abb4cdb7-1b7e-483e-a143-7ebfd1184b9e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: euKO6UTotLd+hNG6/nwUdqNyc3uWt1Tmjj6joEbkFuy2IcWT4V4S0HKca4AEq7gb
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR10MB3703
X-BESS-ID: 1616980933-106046-5375-23341-1
X-BESS-VER: 2019.1_20210325.2126
X-BESS-Apparent-Source-IP: 104.47.55.102
X-BESS-Outbound-Spam-Score: 0.50
X-BESS-Outbound-Spam-Report: Code version 3.2, rules version 3.2.2.231164 [from 
	cloudscan8-34.us-east-2a.ess.aws.cudaops.com]
	Rule breakdown below
	 pts rule name              description
	---- ---------------------- --------------------------------
	0.00 MSGID_FROM_MTA_HEADER  META: Message-Id was added by a relay 
	0.50 BSF_RULE7568M          META: Custom Rule 7568M 
	0.00 BSF_BESS_OUTBOUND      META: BESS Outbound 
X-BESS-Outbound-Spam-Status: SCORE=0.50 using account:ESS112744 scores of KILL_LEVEL=7.0 tests=MSGID_FROM_MTA_HEADER, BSF_RULE7568M, BSF_BESS_OUTBOUND
X-BESS-BRTS-Status: 1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Add recipe for python3-h11: a pure-Python, bring-your-own-I/O
implementation of HTTP/1.1

Signed-off-by: Ben Gampe <bgampe@digi.com>
---
 .../packagegroups/packagegroup-meta-python.bb             | 1 +
 meta-python/recipes-devtools/python/python3-h11_0.12.0.bb | 8 ++++++++
 2 files changed, 9 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-h11_0.12.0.bb

diff --git a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
index e84bf225e..0418b5930 100644
--- a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
+++ b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
@@ -153,6 +153,7 @@ RDEPENDS_packagegroup-meta-python3 = "\
     python3-grpcio-tools \
     python3-gsocketpool \
     python3-gunicorn \
+    python3-h11 \
     python3-h2 \
     python3-h5py \
     python3-haversine \
diff --git a/meta-python/recipes-devtools/python/python3-h11_0.12.0.bb b/meta-python/recipes-devtools/python/python3-h11_0.12.0.bb
new file mode 100644
index 000000000..4cd0d4de7
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-h11_0.12.0.bb
@@ -0,0 +1,8 @@
+SUMMARY = "A pure-Python, bring-your-own-I/O implementation of HTTP/1.1"
+HOMEPAGE = "https://github.com/python-hyper/h11"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=f5501d19c3116f4aaeef89369f458693"
+
+inherit pypi setuptools3
+
+SRC_URI[sha256sum] = "47222cb6067e4a307d535814917cd98fd0a57b6788ce715755fa2b6c28b56042"
-- 
2.25.1

