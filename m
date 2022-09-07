Return-Path: <virendra.thakur@kpit.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0626DC38145
	for <webhook@archiver.kernel.org>; Wed,  7 Sep 2022 17:10:57 +0000 (UTC)
Received: from IND01-MAX-obe.outbound.protection.outlook.com
 (IND01-MAX-obe.outbound.protection.outlook.com [40.107.222.61])
 by mx.groups.io with SMTP id smtpd.web12.1379.1662570646187682699
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 07 Sep 2022 10:10:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kpit.com header.s=selector1 header.b=xO9BPzYA;
 spf=pass (domain: kpit.com, ip: 40.107.222.61,
 mailfrom: virendra.thakur@kpit.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J9xjQQHXWcvysbGtBShN3g2nfREv/roiTcT2vojby7fF1IbAShZ/lKIRLFh0Vw2OXHIjhUsnqX8R8Z5GGXiX1lMLEQM3D3p6qK5gQRcFgovrr4s9cyNkcDGsCHO5yXMKFbcMc7GsDAAjNJYh6MU7L1+2bi0Ua0IIaQw9sRE6x8k07e6irAryvLDgfbq8HcXTYXhsqahATH1AKvmhSZwZdBaOZOUyi0NOZMCEQgIFK56ytsbwbu1AkVdIZoGyEKdr5ciSFWYdIvO7KLN2MGjVvLiVn689os0vzAp9K8RB0Xg/GSvHkAwpwKBM9iIx0Am/6XaTCDAByTOxAUtYjLzzQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FrjDhFcc/UjRzQJ/GzieHTbqHSWUfiNOTGMPHvKPdlg=;
 b=DRB8MQtsxaLrk4NynP2O21FJGR8rT9YV/0ckCJO/BASzDWUGS2YEcnDIk+ZKonjSBuGEhLOiGQtpaBr20Yd7GuxxawXuwrnlIsCyIBlEbrINwX1KhZ1LUUOtFgo2FibBVd7E98y8E1NNEXZiUTojDGS1DNHFkFGAHe7tbwRFPnlX6GhP1OaFe/fE6rupbTOtliC7bQt20NNQ1LoHxc6PkbKS+MrFd75s1mkVq7XLX+aG6+AUb7+/zWEhpD5aaZMOHJGRrYRux6GExzLV07MHJfL+oz5Wu5xYmnQ1VzlsgimpAT+mhA9e7OboEZirwXDhn0bT9Phhn0Lj9L1e6jFMdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kpit.com; dmarc=pass action=none header.from=kpit.com;
 dkim=pass header.d=kpit.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kpit.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FrjDhFcc/UjRzQJ/GzieHTbqHSWUfiNOTGMPHvKPdlg=;
 b=xO9BPzYAjXOn4hhnPeaqNLfOp1vq5VAeYbnTSBs1g2bn0cTXhM1WCkd3gJ4+qt2sMtJdIGFlmZpRbV2iegQvqrB1DHgbVU8SDMq+uUuRMeArg+OErLtXRiExyv4MBn1tcRFfNUBLFwc6wuGsJ9rlGkfl8wJZgySHIccXMRT8Y8U=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kpit.com;
Received: from MAXPR01MB4327.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:3::12)
 by PN0PR01MB7848.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:c9::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.12; Wed, 7 Sep
 2022 17:10:41 +0000
Received: from MAXPR01MB4327.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::2427:1977:88:b63b]) by MAXPR01MB4327.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::2427:1977:88:b63b%3]) with mapi id 15.20.5612.014; Wed, 7 Sep 2022
 17:10:41 +0000
From: Virendra Thakur <virendra.thakur@kpit.com>
To: openembedded-devel@lists.openembedded.org
Cc: Virendra Thakur <virendrak@kpit.com>
Subject: [oe][meta-java][dunfell][PATCH ] cacao-initial-native: exclude
 BB_NUMBER_THREADS from sstate hash
Date: Wed,  7 Sep 2022 22:40:23 +0530
Message-Id: <20220907171023.31485-1-virendra.thakur@kpit.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-ClientProxiedBy: PN2PR01CA0014.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:25::19) To MAXPR01MB4327.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:3::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MAXPR01MB4327:EE_|PN0PR01MB7848:EE_
X-MS-Office365-Filtering-Correlation-Id: 8abe3f9b-e166-4bba-c56b-08da90f3e464
Content-Transfer-Encoding: quoted-printable
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	57ZJw50eYJM1LwkgvzA1NmKftygCQ8HxD/V7pgLkQ+lp2muzSINFlY/8hFgjTdxA+jm8oHT5HXYqKiGV5zr7kNRH/Plm0UFDWW3cv8gr8jOZbcIY0XubYAH3n96JGkRzVhARhS/IHerrHOxyRMCIB9qs7tsqIiVD1NONytAwIUR9mwQSilJ7S7a0Jh4gsfxHoyM1CLP73RG62Avm8gFUKQ/FBjb5+hBhjK0Mp2Yp7yuJRH2PG/6gBS5Ccb8zWf7iasFMzPPrr6W4NPPjWMnK0n48OaAMMuMzo/kT/36JPoIc/ITWdrcG6qfxAyXROw1oz0y2me+XRQQ0Hw/EfSnGhSKyYDi9gp2S5/uBjIhyr8aV6soHN/FgplvW/N6+SgmhUEZZw1nLWdHGW5VwI6YCRumyGclO0er07dEBYWvHhQZ9zpKLNavYbtI4GhbPu/CwRZs/0GrhRLltY0hiRVhXCxpsjOMCOS/AgzGP/lL54c61aw0Cul1PXclZo660/BOmpvfPN3mQj+cv8JRcROxwd7sM/xDXGWVipyzIc4YrmFjTevnvkS29x+s/dGkXG0013cChK2u1jlr9vIxkvyRYwWBu0AOmaE/UnQ1DoiyNGzdLdfuEOcCRaTfiLDdinxrBHJiNROVa44Xuf3NtEK3KeEg8Sp4MirKWV1JKw8duDOrVEFJ4RDmd4LH7tNnHV/Zb7vb0lXUmQUIRPqXHthaXbjyu3jEoOyqmmyxsZizTYVvhB1rhQmDJNPbHVuxZ6cNQiwY97Krqgc8yuJO05+6mcw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MAXPR01MB4327.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(4636009)(376002)(396003)(136003)(39850400004)(366004)(346002)(316002)(5660300002)(52116002)(66574015)(6916009)(83380400001)(6666004)(44832011)(2616005)(478600001)(107886003)(66946007)(66556008)(36756003)(2906002)(66476007)(41300700001)(8676002)(8936002)(4326008)(186003)(6486002)(86362001)(1076003)(26005)(6512007)(38100700002)(38350700002)(6506007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?IX5fo3pZny4lo9vYWRbfsxSAIHxGhjr4NARcPLUKutflzpywVzAEafRCetud?=
 =?us-ascii?Q?Mj76wM4q2wLwbWd6mWitHjC81luBfKQfPqyfrkCSW8OCPuhewH9CFiw9iB5I?=
 =?us-ascii?Q?sYMwkhxgDMDdAaCW/8Qvz1tpIZPNOzX5K7b1Ora7Xw67HeLnOn2n5fe1PvS7?=
 =?us-ascii?Q?3LLMpIzIFnJFZ210nmih2RTqoXtI7GBzA6JQNtxt4JkRlOEvuPW4CWEuXvCH?=
 =?us-ascii?Q?ipxK+++2I2RBTnIBOJTHjWHLJalS9jPkKr1qYCX4J6GAAjX3lN+W7EUwPhHV?=
 =?us-ascii?Q?6HYn3F6dTkD9ThCWpsguG2LJEwc6NcsfIoQHXYcAtFV9jz+FIy2DYKiUiyde?=
 =?us-ascii?Q?IfvCR+LUgr49wyGWrNi+Ryls/6q1tekOEqd5MxIcGuwlGo0/iWb1lVjjOMow?=
 =?us-ascii?Q?d/w229gS9VauenL4P28KOvdQboyUfut+4BsHyE0JwEvaRGdKEITfM5qrdRpn?=
 =?us-ascii?Q?WWG48H5E8GqXvkHZCY188srh70xQBlXWWkZTmI4F7a3k1ObyLxCwO6sjpSbZ?=
 =?us-ascii?Q?GueBzpRtOmfx7ONrLt5zjNTur84V6DQyJxyhfow7wpkwIsXuYFuFg4ucR997?=
 =?us-ascii?Q?ZHB4aTVXxTcPscucCJzk9l2vNJvtKBdQs3FbWwT/W7KLccpDGxvnV2WmFlWi?=
 =?us-ascii?Q?4sLrF/nACU0J2p8RWiHbL6IINbtFZxq4UMMMmet0PbfaOejksrX3f6avnhvI?=
 =?us-ascii?Q?TjHAQn7xgT3WwPsjQZfIw0qA3WH6/lh8wRgwKuBQoosucS9A8BKoBlJNFDHc?=
 =?us-ascii?Q?mxFxGEa5LyrN8iYW0Bj/YeF5ogFJcKr/3ydUaYmu4hAGBPgavx14TNf6RA0s?=
 =?us-ascii?Q?Dn+Fl9rQZpduArNSt2XrW72F8Wngz0mBIbiHufK/8EKkwVT3gG7WS5w7jXNk?=
 =?us-ascii?Q?6CFFR+A6v0AZdoH4dyw5fFZYGbQhx2BzdQZn6PXeLxUdmOezdoIzhFi6iipP?=
 =?us-ascii?Q?hI7kUoH9Qhgr8fz0ldgIFc2mCTO+RRT64KkCbqC/n/SZF66WLh023noFToG8?=
 =?us-ascii?Q?qnfnxUru0HN+u5XSBnHAWj0sNtBcWYd+kM4JErVvbLxImD/ax5lhyJfr0FE1?=
 =?us-ascii?Q?yQRNbbxxnPOdxombNmhfu16kIHBg42JXxYElOhzuIvoKevqZO3TAKXLP8++8?=
 =?us-ascii?Q?zSEOvhhbGp1yYx0gSxOzz++NBgwkU5VzgoqJsleJrd0wm8u4CcZ25quNAchE?=
 =?us-ascii?Q?f3uCCsAKgrCBWyphwjnbMj5oNrxMJZaSJcWu2lzQQjzwlTNqbjv/LZcYJ1DX?=
 =?us-ascii?Q?A07CIOmn4Q6gDHm+ekV0WmTJa4qqdqYsXYslznDrtwTFunpUxm8POxme9clp?=
 =?us-ascii?Q?w0tHXwwChwBZmNFNlTmAaY83RsBQMdkIZZRr9ezYzR3MS/eV4i9APdFXPDS+?=
 =?us-ascii?Q?OUckAxZQbFluRGsXUE+tB5oR9ASEqPdraYDWVXioi+Zou+YZh3LUJxykDnTZ?=
 =?us-ascii?Q?VqqXLz1SQ/5gZX5qlWXbuU/kRH2C3QaaCNxP1B55D4KYUn02trAd1JrrHrOh?=
 =?us-ascii?Q?BDnHB1LMpdKAi1XALKFDW/HwORSuNFrMtXm1FUtf3ny2ZGKFs29dv6Ux4cuk?=
 =?us-ascii?Q?w9UdTd8ioeN2ye9i7j52tPAgUyIp9Aak7CwRpWTJ?=
X-OriginatorOrg: kpit.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 8abe3f9b-e166-4bba-c56b-08da90f3e464
X-MS-Exchange-CrossTenant-AuthSource: MAXPR01MB4327.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2022 17:10:41.1201
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3539451e-b46e-4a26-a242-ff61502855c7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 +TqyZix5MHuTtfhjD2yW3Mm+Psyq+jbGugnM1fxqxS/xwkQ82ViZ5Ufr6zbN0Vc2+vfHqnJLOoj0MVFVtQgGfg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN0PR01MB7848
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 07 Sep 2022 17:10:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98690

From: Virendra Thakur <virendrak@kpit.com>

The sstate-cache for cacao-initial-native is not shareable across
multiple machines because the parallelisation configuration of Bitbake
is being embedded into the sstate hash of cacao-initial-native.

Exclude BB_NUMBER_THREADS from the do_install sstate hashing to avoid
this issue.

Commit message adapted from a5257d41f32812bc9426183cc8d2b6f07617b0d5.

Signed-off-by: Virendra Thakur <virendrak@kpit.com>
---
 recipes-core/cacao/cacao-initial-native_0.98.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/recipes-core/cacao/cacao-initial-native_0.98.bb b/recipes-core=
/cacao/cacao-initial-native_0.98.bb
index 8432456..1bf822d 100644
--- a/recipes-core/cacao/cacao-initial-native_0.98.bb
+++ b/recipes-core/cacao/cacao-initial-native_0.98.bb
@@ -40,5 +40,7 @@ do_configure:append() {
   sed -i -e "s|exec cacao \\$|exec cacao-initial \\$|" src/scripts/java.in
 }

+do_compile[vardepsexclude] +=3D "BB_NUMBER_THREADS"
+
 SRC_URI[md5sum] =3D "8b8907c8b925761c9410bcadb9705346"
 SRC_URI[sha256sum] =3D "cb9363add825cedf77764fc49a223aaf43f0a9f485b711ba8c=
92f16b13fff188"
--
2.17.1

This message contains information that may be privileged or confidential an=
d is the property of the KPIT Technologies Ltd. It is intended only for the=
 person to whom it is addressed. If you are not the intended recipient, you=
 are not authorized to read, print, retain copy, disseminate, distribute, o=
r use this message or any part thereof. If you receive this message in erro=
r, please notify the sender immediately and delete all copies of this messa=
ge. KPIT Technologies Ltd. does not accept any liability for virus infected=
 mails.

