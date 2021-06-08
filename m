Received: from IND01-BO1-obe.outbound.protection.outlook.com (IND01-BO1-obe.outbound.protection.outlook.com [40.107.139.83])
 by mx.groups.io with SMTP id smtpd.web09.8500.1623128740383398534
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Jun 2021 22:05:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kpit.com header.s=selector1 header.b=uZaaalw7;
 spf=pass (domain: kpit.com, ip: 40.107.139.83, mailfrom: akash.hadke@kpit.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z0ourVv/wVFNXlYiArhtOskGnOdvTgGNdfaGcngOo0oq8Puc6dCNNwtGHRFYns1lt74XavQURwuYA9ad4zLkZnQz9B/2P4Sx1J2N3mMf/VJQn8cOG/4SSnpHK0RvGRkbfIB0GQPzgmv02Y0camGGfxCcbXqYwovZc8l6SdXLEMt2NB9uutHX4mrvk1oGAvp33lPviz+BNd9RsB+rgGG7gXeJNcf0MErT7GIKFMkfH/2ExrcrFJO9uTNuKcgiHKpAWObiVdeLeoxpSuLRGMITSb9eczG8E6YieDeiL3wc75gqwzvm13zlwt1u3J2lKlLr1DoMRLUQubcKbQ1PVM50wA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vExj78Vsxc3Xj1ilL7lkBilvAaiQFpuNge+YBj4We2I=;
 b=PvjEiY6Y0mSLzBXn/yS786DEiWtkcNco7VgA2cPh9oVJVwrtZDGpiAch2gfp3ZCLAwy31u8OKCAv63QxlC3oRNoy6fHBQelDgdsGa5amcgimkPSra+DXMI2uz/ZnAFZyC7AWtx7rgpQlbCACFh8afhdc1YDF/UYlRdNYEy1+cNtP5Al91dordRenKoHr0bau5CDpAf4rI2T+C5CGnjWWBkrUZ3WoqQeZgMEV4PfXgJ4Kz+aJ+/OLf3oz78IpEazZr3LmgmlljQEil6nwZI3YHAnLdzhLqCgyN9ExPm+trz02p8wS0esJoIYRMKfetMmjLTcvS2N4sqAEvF2q7gYe1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kpit.com; dmarc=pass action=none header.from=kpit.com;
 dkim=pass header.d=kpit.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kpit.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vExj78Vsxc3Xj1ilL7lkBilvAaiQFpuNge+YBj4We2I=;
 b=uZaaalw7oYSnzwfWup4Ki1EUHAG8ElvT0SD3+iv/2npfRzGiLwVWDRh0hY/n5i4P+Z6VIGjnfiqQ16WY5n20lv0LYXHch0MOqF9CTz1UVZKYDedYZLmfXhlWwbSyibL/OObF7CJJvmyzQTnlyVjj1L8XxCNBMgUFmp1SLID4WtY=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=kpit.com;
Received: from PN2PR01MB4619.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:a::14)
 by PNZPR01MB5038.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:5f::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.23; Tue, 8 Jun
 2021 05:05:35 +0000
Received: from PN2PR01MB4619.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::c962:e30e:1f2:44e7]) by PN2PR01MB4619.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::c962:e30e:1f2:44e7%7]) with mapi id 15.20.4195.030; Tue, 8 Jun 2021
 05:05:35 +0000
From: "akash hadke" <akash.hadke@kpit.com>
To: openembedded-devel@lists.openembedded.org
Cc: nisha.parrakat@kpit.com,
	harpritkaur.bhandari@kpit.com,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][dunfell][PATCH] libdevmapper,lvm2: Do not inherit license
Date: Tue,  8 Jun 2021 10:35:24 +0530
Message-Id: <1623128724-11973-1-git-send-email-akash.hadke@kpit.com>
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [2402:3a80:cb1:1876:861f:8f19:371b:f6bc]
X-ClientProxiedBy: PN2PR01CA0110.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:27::25) To PN2PR01MB4619.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:a::14)
Return-Path: akash.hadke@kpit.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (2402:3a80:cb1:1876:861f:8f19:371b:f6bc) by PN2PR01CA0110.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:27::25) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.4195.21 via Frontend Transport; Tue, 8 Jun 2021 05:05:34 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 388299b3-c9fb-4a05-829b-08d92a3b0ca0
X-MS-TrafficTypeDiagnostic: PNZPR01MB5038:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<PNZPR01MB5038809192001AE4976BF1B88E379@PNZPR01MB5038.INDPRD01.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:1201;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	8u7TyjXQdUrO4itRyaz5e3/5spuR7bPrtmtRAr3lXIq48msU3NqjZ+LlDXip25jMk7dTLtfqXaM/cNaSItEhOXwRPW2QkpYwz2qRlv2jq7cqVXlZhjvtgM+4YHsxgHH8yyddgowseTLMNDZPrqa1C5MsHYN51cwW4KZ13J+KwwG1eD8wZFbB/jFTG5FnsimgpAAwl8kFPQSilfljuHw7LFwuG9H28qA/7mx5oRDbeaLRqDVMYM6bURWClerx4duIDOqKByvPRLiSagp5Ne+y1rPvlX88RWhcggOIja39vwIIKXXumFaQjf1HLQdshrDBNYAhgNjaio0vvmdJMVfglLBw8NORp5ZvEzzJaM5J2zkqsQMRB2ArJjA9AJjjZ95O5XG7ZaKXw6UG/9h7pOff1mbikNHXx1VpxiMo/41JbMoDGemSU0GtpyBAVLao9mmGat1rBLhGuPqGUQfXH0R+Yh/2Aa8KoZdtXkVPPIeOK8KOfoMDFoHOwcFU4xprstL2rJLHJCvc+TSL3JJNddS4hU5NIavI3QrKyFEyS+kqvElgNcGNM5eLfZSNMxU8jeGkh/xiQayCfI0TSD7LMk3LaJMsBgZI0gYzjd26QlbFSEMGZ+pBqEEBp0YEX8OYXFnhyNU1FYAsUOOmFicOMBy/gjSJ4AizxgyIaoB2TQodZDY=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN2PR01MB4619.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(396003)(39850400004)(366004)(376002)(136003)(346002)(36756003)(38100700002)(6916009)(6512007)(5660300002)(66946007)(86362001)(6486002)(6666004)(6506007)(66476007)(2906002)(83380400001)(52116002)(316002)(8936002)(8676002)(2616005)(16526019)(478600001)(186003)(66556008)(4326008)(69590400013);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?GosjplulWh/rrpvRVQfEVQzLaMnLbaCPWj0WZSpX7BdeZ2rgrt79MyuFP8Cn?=
 =?us-ascii?Q?HFjtUWrAtNGRV7+kky+dFOrydRBTOR6qdJxAiR+6sUVOqT5lqt35h09ZaSVt?=
 =?us-ascii?Q?5n9jVW0itdxOJAt9uwms5VsqUaMX76dK2A7IN5rnWLxGb3Am7Yo6/luXuily?=
 =?us-ascii?Q?9nTVVS4b7FI73Z2xeBGJDdavIkQv9ClbgOO0f+7F0Ufy26zXmgGxPr8w3jSW?=
 =?us-ascii?Q?CbO8LPLpVd1o77bSiaYTxtfJNcjy7UH152tzRypBc0HjjOkEoXcA9+h4wmdr?=
 =?us-ascii?Q?5uQbT9ey0XGGNUk4E1b6VVlmk/t7quyMG+6rVGzZKUmO6PGboh1YxIdgVTFl?=
 =?us-ascii?Q?erPkO4GoYlcZAjhjK26VtxMTqXfp26U8GO6YpvXrwlQDA7ITmlWP7i9YaFrc?=
 =?us-ascii?Q?xDDTe5XS5fBbLcSOf1jjiZdHvgORd5Q8V++ZdXoX5gJwQsHsrjGoyAYm8zcC?=
 =?us-ascii?Q?zIcSgZZMKUBEatnP1FvxNwKnCJkqh8IT1sTm/6PQsQN1gwKzTov4c3pOq1gm?=
 =?us-ascii?Q?eMLiPICqMGN7K57QQB6uKMsOEiRcDeDtSolX5T9v/3uMayyOxdz+ZSMnOohF?=
 =?us-ascii?Q?GJf5hakro8jS2wFUcCovVPDS08snUqTL5KfDacNAWV6S4H/UZCx3u6KD5rHM?=
 =?us-ascii?Q?kZ1rcgPikUwhPoYaTcWgn4jrfSj9HnbEaNq2on70+NCg9+EgJoefpDGdBm/d?=
 =?us-ascii?Q?6o5aZHiS0KtZKEuiTdNHDJhN5uUcDepFaykhuGmTb6gt1HGBVzlmLqP/CigT?=
 =?us-ascii?Q?MBIJOwau4SMZxjkdGIC6JHE3gQXCXfYitk6CPrkrzDRmoQK/4UXAXL4WjAj+?=
 =?us-ascii?Q?nAWOWvKfYGd2JIctbQBuOPahjsjgok7woCJ4cStO+hK3hJpw63ek2VVJ/8du?=
 =?us-ascii?Q?fvVQHLwfXFOK7R57Eyj1KVAGTShdYDQXWACYaBxjaLWkKazEk40xczbzGltp?=
 =?us-ascii?Q?fSwBFgnRV4JCU0hEpDFfHGcF5kFUsqBGhB+3a35IZvmKDr7HwvJ4/fhFjCWf?=
 =?us-ascii?Q?+GQcPejKiHXBFlakjyH/iBrE+Vfyiu4eKoO0TsLI4IhhdloLCMg/usF8pEXt?=
 =?us-ascii?Q?lkEQrQW3AgGOfxSNEKufGQvWCk55tkO2srtduAcZPxP47L8IDs9ZYixT5pr2?=
 =?us-ascii?Q?zg0B065kD43nxWcNQZT7IxZ+g/hhYuoSuveYn2knryGCRV8zNNoXINDzKRfA?=
 =?us-ascii?Q?QINNFPszMLNKUPrIqhC/bxRqi9sGOXBTCfUp9j0NY0Zp/V03y6uW2WZXv5ZL?=
 =?us-ascii?Q?2Uy3qvzT8okBJfLSBid3Phf/4LYUU+X+DC8LO4XP4AypyOUSPIVZ4h1lyMoR?=
 =?us-ascii?Q?UtQGGP5HndVuQxxqyyhB7EhPZ1aJCFN25hXmANs0E5zf2PSoz8DXqX8N2a1O?=
 =?us-ascii?Q?8Fr72WKQ64W/x4cUxlxqU0PAoisJ?=
X-OriginatorOrg: kpit.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 388299b3-c9fb-4a05-829b-08d92a3b0ca0
X-MS-Exchange-CrossTenant-AuthSource: PN2PR01MB4619.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2021 05:05:35.6736
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3539451e-b46e-4a26-a242-ff61502855c7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: scUkZ/Ul/07Zsp/iAkM2EJ2mCCT2ObodCqaGwaOK7ly//S3vP7mTuV8OxT1XI9oKdR7JIR8fvtO1x8uHIizt8g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PNZPR01MB5038
Content-Type: text/plain

From: Khem Raj <raj.khem@gmail.com>

inheriting license class which brings in
AVAILABLE_LICENSES into do_configure task checksums class since it wants to
enable thin-provisioning-tools if distro allows GPL-3 automatically, but this
brings issues when other layers which have additional licenses are
provided which ends up in signature mismatches so leave that setting to end-user and keep it disabled by
default with a comment in recipes stating that if needed then the user should enable it via
config metadata or bbappends.

This commit is cherry-picked from upstream/master to
fix the below yocto-check-layer error.

bitbake-diffsigs --task libdevmapper do_configure --signature
f6a95f0cfe6789254c94484dcd7d895e3a83c7d8e80f7a45e80328ed3d58e981
87aa98db4256768cf62c48703d9a857b878e257aaa6ee463ea17e5004215d5de
NOTE: Starting bitbake server...
basehash changed from
f4b6194b76e01b7dcb9e87f36156a9077b65f56e08f4841ad57321faec03a54c
to ba9681d39513fd8ed22438ac25811535401a56d9ec23a8553978cf421c268b88

Variable AVAILABLE_LICENSES value changed.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: akash hadke <akash.hadke@kpit.com>
---
 meta-oe/recipes-support/lvm2/lvm2.inc | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-support/lvm2/lvm2.inc b/meta-oe/recipes-support/lvm2/lvm2.inc
index 01c9df4..2fe97d5 100644
--- a/meta-oe/recipes-support/lvm2/lvm2.inc
+++ b/meta-oe/recipes-support/lvm2/lvm2.inc
@@ -19,12 +19,11 @@ SRC_URI = "git://sourceware.org/git/lvm2.git \
 SRCREV = "b9391b1b9f0b73303fa21f8f92574d17ce4c2b02"
 S = "${WORKDIR}/git"
 
-inherit autotools-brokensep pkgconfig systemd license
+inherit autotools-brokensep pkgconfig systemd
 
 LVM2_PACKAGECONFIG = "dmeventd"
 LVM2_PACKAGECONFIG_append_class-target = " \
     ${@bb.utils.filter('DISTRO_FEATURES', 'selinux', d)} \
-    ${@incompatible_license_contains('GPLv3', '', 'thin-provisioning-tools', d)} \
 "
 
 # odirect is always enabled because there currently is a bug in
@@ -37,6 +36,7 @@ PACKAGECONFIG[dmeventd] = "--enable-dmeventd,--disable-dmeventd"
 PACKAGECONFIG[odirect] = "--enable-o_direct,--disable-o_direct"
 PACKAGECONFIG[readline] = "--enable-readline,--disable-readline,readline"
 PACKAGECONFIG[selinux] = "--enable-selinux,--disable-selinux,libselinux"
+# NOTE: Add thin-provisioning-tools only if your distro policy allows GPL-3.0 license
 PACKAGECONFIG[thin-provisioning-tools] = "--with-thin=internal,--with-thin=none,,thin-provisioning-tools"
 
 # Unset user/group to unbreak install.
@@ -53,4 +53,3 @@ EXTRA_OECONF = "--with-user= \
                 --with-thin-repair=${sbindir}/thin_repair \
                 --with-thin-restore=${sbindir}/thin_restore \
 "
-
-- 
2.7.4

