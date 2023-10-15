Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BA43CDB497
	for <webhook@archiver.kernel.org>; Sun, 15 Oct 2023 15:06:28 +0000 (UTC)
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (EUR03-DBA-obe.outbound.protection.outlook.com [40.107.104.48])
 by mx.groups.io with SMTP id smtpd.web11.89878.1697367950849094118
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 15 Oct 2023 04:05:51 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@welotec.com header.s=selector1 header.b=lpJQF4Hj;
 spf=pass (domain: welotec.com, ip: 40.107.104.48, mailfrom: p.lobacz@welotec.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LfwyuDBI92M7I3RFcWSPkr97piLFNtj6WwaXw4h6ifjVXdGx95yQsv8dEV7R32H0RvX9B+eAHcI2bIXQ3TxORWaqkzAfvsPST4vDNY2EEZOSgVASsbHGNUrVdpKhRd/1UloqTRfmJ9uR7c5E+apTkTEjbeLaklZ2+/AjD9IZtM2sBWO92OfO0mbVvWxtIDu5St5D0h1BaPKC5vKUFqzr67VLxmrHSqj0ArlCRK27P/IAxbPjxvcz9Gg50VSSQqI97jNMNCqbIhocVVzNyLJrwPH5DXj1wtIax29u0MilWoQBCCLN6TtXPnzsIjEhB55VaGdR2Hdn7+dPDH/z9kYauQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eED+SE16zxfd5KCIEFI+rPVPpfJS2w3L2Q1srcPDrmM=;
 b=YIY0mxWfp2LRufUz+ZngCR3pr+cYixyeSSNhrMzNI9cT+unVPa32em/vTPX5elmMeRwcyTNcblZc5HRr/EEGLUpsE2ThwNt9YxMYL3KH7NptyhHvBTZbuYDi+7DbVVkS4PUPXfUstghA9u/JyQ/LbgDK6Da71M+gJJ+LDfpvsyXuSq4MpQB1FCIc4QY0B2aoS9iZkHvM5hohz4ngLvC0uSG5OWfOsqXkHEK+c+9Si8tsuS3eMczWVPuBdpqGXmNDGqOhKpcvacx7LTA03xQobafheZ8WT03xMVaz65Totb9qNfUJKfUk7bxthujE053fC7hkMF0bwqA2fFFnVe7XUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=welotec.com; dmarc=pass action=none header.from=welotec.com;
 dkim=pass header.d=welotec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=welotec.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eED+SE16zxfd5KCIEFI+rPVPpfJS2w3L2Q1srcPDrmM=;
 b=lpJQF4Hj/9g/fTQfhNiwmiIeRCebPFF2uWM4QNqtmsMj1+v3HcCc1sUtCLM8nnhPQ4zKPlt7yxnhzrolnwvPGARB3P4QuxonGAROLwMXUmXK8+Y43CtrByLK7mBy0kT3csWsf6ulIpRo6GhcOLbIcm+1hSLNe30w8eL5lG0Nhyi7gEODqhNHmjwsrTWWdDPJPs30W/gZAJBfrYosjawaKn/OSDUnB5noFoB+9seb7HFBPA8bVKQ994jJ1nwaCTN6xvL0m0Mx2sCnz0axbLw3XhEsBxMOfh4osjgTutOG6/v9O3OMRTFbhXJ7+S1vPRpphGJgUK+lggLY8cbW41aMtg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=welotec.com;
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com (2603:10a6:803:da::22)
 by AS8PR04MB7925.eurprd04.prod.outlook.com (2603:10a6:20b:2a2::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.34; Sun, 15 Oct
 2023 11:05:48 +0000
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::3090:4af6:ae14:b9c3]) by VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::3090:4af6:ae14:b9c3%6]) with mapi id 15.20.6886.034; Sun, 15 Oct 2023
 11:05:48 +0000
From: =?UTF-8?B?UGlvdHIgxYFvYmFjeg==?= <p.lobacz@welotec.com>
To: openembedded-devel@lists.openembedded.org
CC: =?UTF-8?q?Piotr=20=C5=81obacz?= <p.lobacz@welotec.com>
Subject: [OE-Core][PATCH v14 01/11] package.bbclass: override tar with tar-native
Date: Sun, 15 Oct 2023 13:05:16 +0200
Message-ID: <20231015110526.53738-1-p.lobacz@welotec.com>
X-Mailer: git-send-email 2.42.0
X-ClientProxiedBy: FR4P281CA0049.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cc::13) To VI1PR04MB5373.eurprd04.prod.outlook.com
 (2603:10a6:803:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB5373:EE_|AS8PR04MB7925:EE_
X-MS-Office365-Filtering-Correlation-Id: e0adb662-0d3e-4e99-6dd8-08dbcd6eaf90
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	OgJVx7EuAcCD0g2TW6Ybf1O49csI+CAs+uNN+POi2i3FdXacSEtcVfAdwAHW7Gs0awalb4jdEwGyv0fiA78/cb6SWrpNaXWU8bxDu+rOUPVSNySIk48AubVy8R22l+aebx+iaA6fgCnbU3mXOwfdG5PpQ/KpDRoepxP2wHjQRP4/sN9Bx8e+BF69sJEYCzg/QNTtbaXk58bFnncD0P/5hHdqs7048PTjOFYSVUuKWwlDTOrg8kT7xMGJOUrQ310ThZmL/wsO9FeoV3mSApZI7XajU1yGZn2j+AdjTXufvFyjmKEvz6ptQW6Qh/Hyqw9/b4eSOrnBK2N3jqNr597Z7yUyc9d5RNK7jnP4tZYgXsgnDpuPmujNN5/Z4BdLpXC/kh5WvrvC7sWEBOB+8XoU42SWRgq41XvfdqZoGi+VtNW+zd6yGzsRZdT+WUQY5td64xUYOqCUfLfY7D1gcTlx8X6I11LW2BkyYEWVzgou0V7Osmq/NjW74FGo52t3rYrWTw9uyZRZ56uNvVvjKArzHO0oZewL58wtKFJydw6pH7tGGZglRBHuvtqJ0D3xQ8a7EeVamyKvSSDkfhlHIWeqGu8iLtHUJ7NECPrmNf6fHw0=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5373.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(346002)(376002)(39830400003)(136003)(396003)(186009)(1800799009)(64100799003)(451199024)(6666004)(6506007)(6512007)(52116002)(478600001)(966005)(6486002)(83380400001)(107886003)(1076003)(2616005)(66574015)(26005)(2906002)(6916009)(66476007)(5660300002)(66946007)(41300700001)(66556008)(316002)(8936002)(4326008)(8676002)(86362001)(36756003)(38100700002)(38350700005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?mtSO8aynniwZDZKtiVCNDFHNv3IUHpIttCJ+ekuA9N2a460OLZx+O16EfIzB?=
 =?us-ascii?Q?HlYx79d2PwSGEs/pZGUx+vUE62XG4c7K4hqpBcB3zKOcXSYDg6oSVYl5P6Yq?=
 =?us-ascii?Q?l6+W+qiIFBP3HWYnJXHHO/3XYw7R33XfnL3pXuOvEJu8vC6Ujzb5TBalFQFM?=
 =?us-ascii?Q?Dn+OZg2SlzrxX0BhXuWd4SFe6iPk5u4qllmJNSSJMeoB6YbTKcOLd6fT/WlP?=
 =?us-ascii?Q?o52YcrWcnl24CNDWqx1XASQPSObV7lk4I+ii8h+QOMijBoysHHQggyvdtLD0?=
 =?us-ascii?Q?NSqB+GiNZj0pQRQyaph/x8j86sqtUFDBuzp8CYMeLL6hOUNnXIjQ8tr0jqxe?=
 =?us-ascii?Q?RDTUUHhc23fUdoeBryj+/JZLP5VVzcfA/tz6zpO1kWQq17+leSiJIxpwD3tu?=
 =?us-ascii?Q?OaBe4TpyMi6REZ+h04xKcdxZ6XQetiRS+6sHsphc8rwtCT7nkratFkO7zDjo?=
 =?us-ascii?Q?eL/DbBLvcQXFTMmUrT1qOsrJmmZM069glU5SltpTYmDYDXmAQbCBEUJQ4Xbd?=
 =?us-ascii?Q?qFmK7ngeGZTGk2aeCKWauwyC+H6WoueDs9L97uL0QGJpFK4TblOby3kuPVjn?=
 =?us-ascii?Q?9+PzWNRJO7sV2M2G6qGkVOUeKwJktxGUXmaWaqumngRdK6EgQIfGrxqYGxgN?=
 =?us-ascii?Q?dSLzQYvoYT2HzpRarebJ5W3sdJ1756s/K+5iXqFkPAN+Ua826nEd62eh0hwu?=
 =?us-ascii?Q?eWJrR1YpC3mc0sGmk76zzdrLgyixpiruGsC8OG+c/JeRS9Ols6K5mjNXHJUq?=
 =?us-ascii?Q?DjgaEQvXM7hEBaTOcdUkZOIS1dmWJvCu3V+l6iV90OG8NaSzmpmhNLAwUvjw?=
 =?us-ascii?Q?1ZFZ2U+ul3dYOXZoTVazWomr1gQGplSCPQaiFXaBPHfvfXTz4XXZJiCm3e+N?=
 =?us-ascii?Q?9uaKfoYv5h23dB7qa3im6mgghf9afzb1qnFAbMxYZHhFevTK+gTHe7dcNC9t?=
 =?us-ascii?Q?BjBkxDSG0ryy1eWMmlHDAtx6/vSBw9Mx61nIaGvzqkDPxmW5u4x38XJCehof?=
 =?us-ascii?Q?S2eLW+60GI99fLIiCErFAfE20CqrHLd4YFFYtEHSUzcVT0rofm7KDBmzSVcr?=
 =?us-ascii?Q?gufsCEGTHt2t7ZS2lGzqGOUmU4MKsQjh1ti6b2U65fmgL0AEPQTY0UoL2Y4c?=
 =?us-ascii?Q?7sVaU48PzkVafnbIJj1cNUgbyND77y/OW88wREneayZW3NAPvLeN5gFUJZr5?=
 =?us-ascii?Q?AtuuzV+oNytbK5TLkHkUwhRro1t1+wun0unPoVZ6MOIPRi8VHeTxdaNIA1zj?=
 =?us-ascii?Q?yiC/CC8at9v7vIHx8yzu8uOP1o2qPaB33PzOV9VKnQkn2TfmsN8m4QrQuzqI?=
 =?us-ascii?Q?+iCmR47AMCF6cH29q63Wwab4LG8ol1BuOadx6RB2/Hjl49wpiySaWvMYNQKA?=
 =?us-ascii?Q?vHY6QlvyHF6dfgutl/C3tbBityyVPABJpKxMayDeuZNHNTKUU/+m7OEJArwI?=
 =?us-ascii?Q?5qhMCD5tcyCNKvwGdTHZ7SXiMDXGrP5Xei3UhZLnLFChlUVaNm5tj/unL7I1?=
 =?us-ascii?Q?y22SNTh2e9/qDwzGS5KAfSq4RDWuYxLaaoC8ew8Lpm2dW7bHCKYj+MwBWd2Y?=
 =?us-ascii?Q?OHrjMKuT+DMc2ndUe6oBXu30NbOCSgRCbA6TF+i6?=
X-OriginatorOrg: welotec.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e0adb662-0d3e-4e99-6dd8-08dbcd6eaf90
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5373.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2023 11:05:48.0357
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 25111a7f-1d5a-4c51-a4ca-7f8e44011b39
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TWSWdQIvcXvwec78FUWL/LcMQDqzRx34Mb3vM9HOQed1s066IXseksVyKp7LoLQz/nuR3dN8sCWy1kGfjrTLJQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7925
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 15 Oct 2023 15:06:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105518

Due to the bugs https://savannah.gnu.org/bugs/?61934 and
https://savannah.gnu.org/bugs/?59184, which are fixed in
tar version 1.35, we need to force yocto to use it instead
of the one provided by the host machine.

perform_packagecopy function and opkg-build script, will use
the tar provided by tar recipe, which is already in proper
version.

Signed-off-by: Piotr =C5=81obacz <p.lobacz@welotec.com>
---
 meta/classes-global/package.bbclass | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta/classes-global/package.bbclass b/meta/classes-global/pack=
age.bbclass
index 7787042e21..580884cd83 100644
--- a/meta/classes-global/package.bbclass
+++ b/meta/classes-global/package.bbclass
@@ -58,8 +58,11 @@ ALL_MULTILIB_PACKAGE_ARCHS =3D "${@all_multilib_tune_val=
ues(d, 'PACKAGE_ARCHS')}"
=20
 # rpm is used for the per-file dependency identification
 # dwarfsrcfiles is used to determine the list of debug source files
-PACKAGE_DEPENDS +=3D "rpm-native dwarfsrcfiles-native"
-
+# minimal tar version 1.35 is needed as it has fixed bugs for storing ACL =
entries in textual representation
+# and extracting files with xattrs that are read-only; this needs to work =
only if acl or xattr are turned on
+PACKAGE_DEPENDS +=3D "rpm-native dwarfsrcfiles-native ${@bb.utils.contains=
_any('DISTRO_FEATURES', 'acl xattr', 'tar-replacement-native', '', d)}"
+# perform_packagecopy and opkg-build require tar to be in the PATH
+EXTRANATIVEPATH +=3D "${@bb.utils.contains_any('DISTRO_FEATURES', 'acl xat=
tr', 'tar-native', '', d)}"
=20
 # If your postinstall can execute at rootfs creation time rather than on
 # target but depends on a native/cross tool in order to execute, you need =
to
--=20
2.42.0


