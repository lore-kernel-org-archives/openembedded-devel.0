Received: from outbound-ip24a.ess.barracuda.com (outbound-ip24a.ess.barracuda.com [209.222.82.206])
 by mx.groups.io with SMTP id smtpd.web08.14530.1616973995398229867
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 28 Mar 2021 16:26:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@digi.com header.s=selector1 header.b=Q6z4BWer;
 spf=pass (domain: digi.com, ip: 209.222.82.206, mailfrom: ben.gampe@digi.com)
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1nam02lp2057.outbound.protection.outlook.com [104.47.36.57]) by mx-outbound42-72.us-east-2c.ess.aws.cudaops.com (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO); Sun, 28 Mar 2021 23:26:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E24fctzwzYE1LW3PF9vyeUUNfHdi1UZMsIUDJU/HpPV5KcVvZ9RFoJuzMysiIPA4d5WhEyXyNU9eC3NDd+jGbXd1OwpFsVTKvDyqtBAvO1IfLW5+ZSzohmCjhlaHbw6XvTiWLmfJHPKBUyX8sJuzvFD3rFET7uSq9nijXIEkacr7Hmpx8KseeO0AnwtaSawQdTbYLMgxMBzte4Oc2ueM7Lqfe6QmxcdUVBvhTv0L6cX4MGqf5FL0Zd2ZYzEWVTmAEgbOf5CHNktNPelmqfa9wOZM9e9MCMnVwuLBdiCJhEvzFmthqjVbHtktMeozEg9Iq87oV4K8V4hoJP+9chewFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/bgN4RXpsPPnQaMdY1KgwE8D/sxGN4O/PlevrVMqQoI=;
 b=I9XAJyr6JqDEE9reFjbM4SAriZnb/nTriU2oZbx+DugafgG/CSpoPh90UcLf8s3FVK/nnVz4Y65t7YDDHKmMZxZFMoHvqHzY4Nl7ADj4xNrCSClIjfTJQXeFuotUTgYy0RMJkYLmOKcD8lEfEykdQ261jmoUjqh0vNBv+mP78LhD8yKwbOQlsUg1fjHRVFnXUPTr0Vz5S0NJMMwCTrmDcTwA3ztnjm7yX3gfthnFofCB2APfkyVU3yEj5qc4H8KHYsJBStqqq/9/pylAitY5UfZ3ADlRdJR+04mnf0t+LTxAktYavdF8AK2dzUyxHXLaX1YzDGW4VoLz4G348D83nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=digi.com; dmarc=pass action=none header.from=digi.com;
 dkim=pass header.d=digi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=digi.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/bgN4RXpsPPnQaMdY1KgwE8D/sxGN4O/PlevrVMqQoI=;
 b=Q6z4BWer4rqML1k6bTs0CPw9mI/Mm3ImeGKWjg3rxZSG8prRAgebM10cnxxgqveTKGZu6OJZhmWii1cU+qsQ1KpPQbWilDLG5bpdexI1QVwwsHAH+Wd2AoQSjgAlRsjZRHZzJJjuJ0bQG4sJHMYbsNAR37euCVKB2xz4fER5I7E=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=digi.com;
Received: from BYAPR10MB3320.namprd10.prod.outlook.com (2603:10b6:a03:15b::21)
 by BYAPR10MB2807.namprd10.prod.outlook.com (2603:10b6:a03:8e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.24; Sun, 28 Mar
 2021 23:26:31 +0000
Received: from BYAPR10MB3320.namprd10.prod.outlook.com
 ([fe80::3cd7:c100:494e:cecc]) by BYAPR10MB3320.namprd10.prod.outlook.com
 ([fe80::3cd7:c100:494e:cecc%7]) with mapi id 15.20.3977.033; Sun, 28 Mar 2021
 23:26:31 +0000
From: "Ben Gampe" <bgampe@digi.com>
To: openembedded-devel@lists.openembedded.org
Cc: Ben Gampe <bgampe@digi.com>
Subject: [meta-python][PATCH] python3-httptools: new package
Date: Mon, 29 Mar 2021 09:25:16 +1000
Message-Id: <20210328232516.2563896-1-bgampe@digi.com>
X-Mailer: git-send-email 2.25.1
X-Originating-IP: [60.241.24.90]
X-ClientProxiedBy: SYCPR01CA0033.ausprd01.prod.outlook.com
 (2603:10c6:10:e::21) To BYAPR10MB3320.namprd10.prod.outlook.com
 (2603:10b6:a03:15b::21)
Return-Path: bgampe@digi.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from beng-dev-laptop.beng.bne.opengear.com (60.241.24.90) by SYCPR01CA0033.ausprd01.prod.outlook.com (2603:10c6:10:e::21) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.25 via Frontend Transport; Sun, 28 Mar 2021 23:26:30 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 874516c0-8c7b-4fb5-ed68-08d8f240eb00
X-MS-TrafficTypeDiagnostic: BYAPR10MB2807:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<BYAPR10MB2807BAC5B8E9174A26107ACC8F7F9@BYAPR10MB2807.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:660;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	46t7Tk1aNlaXrUPJnA1391+rp85ILnv2aoXJOdqKPZ+SG60tcwTfyB26mmxmo4qEMBN1NvHJigc8IKFQYdVHxLZ4ysS644E9OZFm78U0f05vA3LbTpfOZfDLGi0n5ozfY88kILuVeH0p2RGm5CqV7hMfy8vjDWtmAWts3T+WJzN3bQd0fhf7D5kJ5V/PXT+gVLnDCVQVRw4RKo0PoBIremBiwSCJ34cO9XizB2ZdRspo573t07fitbQ5kh0l4D59Gezf+gkFFRy7RFiaoe6Du2bGd95kwncsI5a41lNdjBCFOODYyJ3FxARGf6WraDzbl2iqDvxQgEvTBT6cSe1Lli0Vr7kS9lGMXWgI1rUYtC5NDw+3/XZni4iV9Hc6R9Ormn27pNfjHs7QxwfFjFtp4CBwyVgtyeebRvxchcl575DouyT9MuqjK5rEWbTyeyiE6uwPEttCTCncLnjybFxvM48kTdjChBkwpVwBf98yw37PPxWR2pV402G63hw614cq091Hl0CBq5DPgjMkOqveMKLEHyPNSbLYQsiP9sYOqdbW315/z138zSSuuSomTTEcK4XKO30JvD6PIilvIjEHmlPvgztEUqGVAgi3enq1Tn4TJyKoQcZf9wgYt5O6EX1TmEp061M6EfIefNhcbJDsrT/yB+F+MVXKFfOZIXzfyIM63TnfScqVNlGA8VLEEHFW9/D5og1xkz+M02KGy9WiPbluaEDr7YLocPy8UpSds+M=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR10MB3320.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(136003)(396003)(376002)(346002)(39840400004)(478600001)(4326008)(26005)(6666004)(6512007)(107886003)(38100700001)(2906002)(16526019)(186003)(8936002)(6916009)(316002)(6506007)(52116002)(36756003)(4744005)(1076003)(5660300002)(8676002)(6486002)(2616005)(66946007)(956004)(66556008)(66476007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?jXIV9uW6EecoEzz42yOlx2K8zmnd+Pg/Y650b6G/vxIbjn1EibDmgqMGzUHk?=
 =?us-ascii?Q?VCi5M2Ihz9A6eTN/rlaEnUrJHgDmkhfNuW97ibpl9WDjh81HYvENGUMmx1OG?=
 =?us-ascii?Q?81VGoys/eLsYnQexxjPktxiEtSijbnXB9H/2Tc0qcpJOTjX7R3w1NXAiRpMu?=
 =?us-ascii?Q?ClkjBVHSBSBYlBXxIyNna1aK8Ocf8Gox3P+ag0W2x5dJ37Hku9ZAoAiKKjsK?=
 =?us-ascii?Q?0ih6VD8+JryW/Z+Sgv1pSkr8TT/6hMuw2MjMLCC8Dg/4vErM6h0w4bIcTWH2?=
 =?us-ascii?Q?+CSMCaTg5J5R+Y8vSIY5NNmt9oRiz1xyeulk552ML38JXCnc/t7BIntbepKt?=
 =?us-ascii?Q?0DTDiuGogGFl2yEJcEXe90zMCo1CXIaNaU/jAG5q/1Ez/9t/NvXOYcI9ogEr?=
 =?us-ascii?Q?/35OFbx6cumd+j9BGgJjLvXUgYVRETZPSvnawri6+bglzvCRaUHbUnWnClY+?=
 =?us-ascii?Q?Wc4OYKbvcgSoWuJ4mWv/tqMNQQWYrDU3l7ZS+HHcmM3d12WZOw03b4dr1iyl?=
 =?us-ascii?Q?ks6kCztzqw1dpRHvgdKFCanSGPdXZWI9Ze3n0hYxoa2M0q+t2dPdhxlfggAv?=
 =?us-ascii?Q?DYNGHPOJmm00HrZM1xOw0ktkggTQ5X9jbsj0I5tkDwkZRJKrJod5PTdUtYIz?=
 =?us-ascii?Q?kaa3d4dkqDW8XEBHghJQTTyWgXFcdNooyL0lOtLOrsybUoM+ZQvwZkev4NNr?=
 =?us-ascii?Q?vgyg8BNI7ZOZ4IapnhWIBJjInzn5ZFS0jBNPmAVsvaA60O9VufuA95NoCNx+?=
 =?us-ascii?Q?iwu/4C43yqH1XcrFKvwoxeu2Pj9Aj4Qfi014N+xe9xmFpdiOizx7SiNtvEil?=
 =?us-ascii?Q?7YADU1b46gPFS38jdsLn6rr/J/61E8Gg0kgLc32Dgi7pj6lVKtUIV2TScG8E?=
 =?us-ascii?Q?51jLd0fgYDEW56dChnpSBhLr6SEWXpda3mtpC//eqPsZ/bqRUPVLckO2ADQP?=
 =?us-ascii?Q?TG+99V1+japJd5fm56mX7eHeHVZ9lhFNYFo8RNMiwGxSPzqpzHfY9E1uvrsi?=
 =?us-ascii?Q?S56MLAsY92VndsHcflhFYqwHlNBzpa1XGEFHKtvGKKD3rHQzWUlwtcga24WZ?=
 =?us-ascii?Q?Ac+KRLDesjcSsPjpXUM2oapPPv3abJ+5oNkwwNeooEZobX8k+Npx9QMSDoNy?=
 =?us-ascii?Q?PaGKhm4SNJGQ+/zQQLoArqWAO5f15zQyu9zdtaUp0NWsxBISnSfMZKG3CXlr?=
 =?us-ascii?Q?mUGkVTC1dQ/y4hvHertw3Cy/jXc+aLesrub6PwqZFiYiUCURvbHak1f+ceFE?=
 =?us-ascii?Q?EIOa3i1FpezZ4mp3FqW/SpNgmg4dH55LZWii2QSVjznhtaenlRL1UBYdyiyp?=
 =?us-ascii?Q?nVbK8pPzZ7/ut9r+bsxiWygL?=
X-OriginatorOrg: digi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 874516c0-8c7b-4fb5-ed68-08d8f240eb00
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3320.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2021 23:26:31.0948
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: abb4cdb7-1b7e-483e-a143-7ebfd1184b9e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wW++5X/cYw34d5jQLxpZOq20Nid8FfekaJ0HTM4G4fGtY9vMM6H9hVb/wsuuJwE6
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR10MB2807
X-BESS-ID: 1616973993-110824-5432-11788-1
X-BESS-VER: 2019.1_20210325.2126
X-BESS-Apparent-Source-IP: 104.47.36.57
X-BESS-Outbound-Spam-Score: 0.50
X-BESS-Outbound-Spam-Report: Code version 3.2, rules version 3.2.2.231162 [from 
	cloudscan19-201.us-east-2b.ess.aws.cudaops.com]
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

Add recipe for python3-httptools: a collection of framework
independent HTTP protocol utils
---
 .../recipes-devtools/python/python3-httptools_0.1.1.bb    | 8 ++++++++
 1 file changed, 8 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-httptools_0.1.1.bb

diff --git a/meta-python/recipes-devtools/python/python3-httptools_0.1.1.bb b/meta-python/recipes-devtools/python/python3-httptools_0.1.1.bb
new file mode 100644
index 000000000..164a32d64
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-httptools_0.1.1.bb
@@ -0,0 +1,8 @@
+SUMMARY = "A collection of framework independent HTTP protocol utils"
+HOMEPAGE = "https://github.com/MagicStack/httptools"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=0a2d82955bf3facdf04cb882655e840e"
+
+inherit pypi setuptools3
+
+SRC_URI[sha256sum] = "41b573cf33f64a8f8f3400d0a7faf48e1888582b6f6e02b82b9bd4f0bf7497ce"
-- 
2.25.1

