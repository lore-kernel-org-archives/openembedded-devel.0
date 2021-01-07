Received: from EUR02-HE1-obe.outbound.protection.outlook.com (EUR02-HE1-obe.outbound.protection.outlook.com [])
 by mx.groups.io with SMTP id smtpd.web10.984.1610044824416483280
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 07 Jan 2021 10:40:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@spinetix.com header.s=selector2 header.b=ZmUpB6MR;
 spf=permerror, err=parse error for token &{10 18 spf.infomaniak.ch}: parse error for token &{10 18 app.mail.infomaniak.ch}: limit exceeded (domain: spinetix.com, ip: <nil>, mailfrom: diego.santacruz@spinetix.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HAGcrnkBHi8Cc/jUpYN8WHslv9yUqS/q+mjoT9CSu4R9nGDisI3+d5aAarrBtyP+WyaNwB45SbTaIoxwzfqDO03J3Kzjj4KXdtWDIat8yPYxlhBacY746/t68BEls9PBYf+7e1GSkfK0nxHVsjzeyiuDok5t4g1P+7TmgGps4xPYS0cUdGbTjIy8IclkO5AxRSNQkUQyK6Wi5qDnmWLCdLRt8ZVJRlH2qa1rKz52+paHvf9C0zZ/wPbRRsCxvd/L8nXaL5eZs5qbctoOftv6WFBdB0sSJx0eqSGXRIJbrnRqBxDlvdfsy6mJJ9R022nZU2sjp5P/DA/JdYlfn/CoBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bkxOT03NsYbIfgldP43cLNHHkhFek2rAOHtVDgz+RW0=;
 b=fhK8Gnt8bdHDQqE5gyXz6u1+P2hWUdxThClHI/qllDyRBBQceGNS4o6expKOQuF6c8363lfYFd96qGB0GDX+yzzqemRiCVSn9/4dNf2UgwyhgJEhPHoQodoAdPMV3lLCIvCTj4oP4DHJNpdSAOQQe7HFYbSm/PWo6zW++1pwH2+rq0+47EKTWeKK4ynqCuu6D0oWgUlNGT8SGW0enMy+dYOqoGxDLaOecIy9NLbyqycEMana+UQaXRkPTBHyrI3V/YmFIh/rmKcypnHOxQKCBdkMMHsV4zgosYivEbB9UePA8kgAspTQmByGPQmyz/J2JNADaqP0l9LIaSHL3aUD2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=spinetix.com; dmarc=pass action=none header.from=spinetix.com;
 dkim=pass header.d=spinetix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=spinetix.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bkxOT03NsYbIfgldP43cLNHHkhFek2rAOHtVDgz+RW0=;
 b=ZmUpB6MRcm22XRf41U2gN5Yt3/G7GwL4MGCqlIvCj/FciD/aeh5wjKvAPUJVe3C0Wpwll4sSgIWG87tMq1Z20385HNYB6uMq/0jGaQa7qh8ECJZzEzTi+tELkDLtnoJRft61ABXuockbEeFjaMruDbGre0ZuhJfoApjiPJLjNQU=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=spinetix.com;
Received: from DB6PR0102MB2630.eurprd01.prod.exchangelabs.com
 (2603:10a6:6:e::19) by DBAPR01MB6677.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:181::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Thu, 7 Jan
 2021 18:40:22 +0000
Received: from DB6PR0102MB2630.eurprd01.prod.exchangelabs.com
 ([fe80::c880:793c:c5b1:c7a8]) by
 DB6PR0102MB2630.eurprd01.prod.exchangelabs.com
 ([fe80::c880:793c:c5b1:c7a8%5]) with mapi id 15.20.3742.006; Thu, 7 Jan 2021
 18:40:22 +0000
From: "Diego Santa Cruz" <diego.santacruz@spinetix.com>
To: openembedded-devel@lists.openembedded.org
Cc: Diego Santa Cruz <Diego.SantaCruz@spinetix.com>
Subject: [dunfell][meta-multimedia][PATCH 2/2] gupnp: Upgrade to 1.2.2 -> 1.2.4
Date: Thu,  7 Jan 2021 19:39:58 +0100
Message-Id: <20210107183958.29151-2-Diego.SantaCruz@spinetix.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20210107183958.29151-1-Diego.SantaCruz@spinetix.com>
References: <20210107183958.29151-1-Diego.SantaCruz@spinetix.com>
X-Originating-IP: [46.14.255.78]
X-ClientProxiedBy: ZR0P278CA0073.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:22::6) To DB6PR0102MB2630.eurprd01.prod.exchangelabs.com
 (2603:10a6:6:e::19)
Return-Path: Diego.SantaCruz@spinetix.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from prefix.spinetix.local (46.14.255.78) by ZR0P278CA0073.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:22::6) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6 via Frontend Transport; Thu, 7 Jan 2021 18:40:22 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 44602413-c7ff-413b-94d2-08d8b33bb0fd
X-MS-TrafficTypeDiagnostic: DBAPR01MB6677:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<DBAPR01MB667731FE813525C6BBCFAC8788AF0@DBAPR01MB6677.eurprd01.prod.exchangelabs.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1923;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	pYojfzAcABckIqe68bVIfAz2Qa5JPtNoUauWywrJ9MPEWmGs0vhhJuBkiyM033y9IYA2fPz4hjr9aHVlKITlsSeA5bsY45MqspQozcAJJXiNdUapQOXGpBaBmr887aJyELPvRMTKVXXkk+mMsufa3IJdHalOT+h6JmhtHRSNtdqNgcrd3CAIH7sTkt/sFn4qbXyAki+HAEh3zBCPUZQhXcMjiAnvJ9MsUVVEJV+uwWOUOop78RnCms9olugs+Cqzlv8LoDtqpZdZ0wLOMNpgz7lKA5YrLsNRg1DXTX+Sk70/setMDCJ9Zuoy1LG3rVpIs+CnP1EJqzofu4X0T9+ELtx9ZcKgxa78Lb27WjBcDnG5YHKlEhtiLNSjy8m+WD+vUQF1FxlgopqlNrl2c6ojGQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0102MB2630.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(376002)(39830400003)(136003)(366004)(346002)(8936002)(36756003)(52116002)(956004)(316002)(5660300002)(66476007)(66556008)(66946007)(6666004)(1076003)(478600001)(2906002)(6916009)(8676002)(83380400001)(16526019)(4326008)(6512007)(107886003)(6486002)(186003)(6506007)(86362001)(2616005)(26005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?gZJ1BGGv7HfaTrSFwYaq0e2Ew3qPJNtZD3WBjPsxetOyvAo95LVl3bdzhzwJ?=
 =?us-ascii?Q?eEsX8/+QuR9n75tmiIIvDmMtwX3aRgHB4Kss9VEVxL+kX9cbYFurt8m6CbGj?=
 =?us-ascii?Q?uf2ii9deMX5nYsEEp5yYbOvVw4r9ILthXqCsdd4/sZHK5o6ls1xCJUfb+uDc?=
 =?us-ascii?Q?KeDEa0fZrJzy4BNmpYbI8bdsUZrDmXNdtQfreQzJwMRt7hWKY8lZyHPWY9BM?=
 =?us-ascii?Q?k+C9VWZn3B5Z6CS5ctCQvs/6kdo814iRDBg2Fwo8QAKqCNDR226p+loq0fkM?=
 =?us-ascii?Q?Yewz+g0nMMlfELLkYlxqQT8OGmdrYyYyzh6noIxpI1Xwy+/sX5EEI8/d+BbK?=
 =?us-ascii?Q?Xnt2T/I4tFiAE9pFfIyk4kVI/A7mvX4QzQBHZjMkEvx+QOZTpdLc8GIE2KxX?=
 =?us-ascii?Q?FdCfsNdWo7MOoo9PEMMXQfxme2yXGNpJmCgikMfKHebjpb1/bvf5Ja172Pci?=
 =?us-ascii?Q?1VX3RIgJQlHYaLaZw/mC7RMmHPu8IodXbbVUIrPF4j7UJRXJfQO1TgkgETEY?=
 =?us-ascii?Q?6KCYkomTPG0mw0V3EOqhVyG+wske/NCbHraJbk4I8hxV8PtKBxmeEroxfdP/?=
 =?us-ascii?Q?iXnHZdOmkHdda+YlAbQk9BeeBLTNBRcCRDAyrUla3mwvisZ8TS/oHweVjSiL?=
 =?us-ascii?Q?wAjivdSFecFIQ+D/9Hb15KCT8JtUAfo/q1aSZqc1qsGUPBmn1KFv8LMTqPyx?=
 =?us-ascii?Q?i8oZ2ui3ews/8mNesTiIPp0WLqlsdZarAXxqAyfxkJhe4bIr2V2qgd/JQ83b?=
 =?us-ascii?Q?5TUFibK4XLpsXuFmHtFs4X+p2WQBJZ65k9FtKfuSYP+NTtNFKJkV4I0DA1Ia?=
 =?us-ascii?Q?ZcNeP1aAVgsggdMWOTASa+V7WPEmBmkg/WJDgtNHgZ8Y4D4bpm0Yexz+VnOz?=
 =?us-ascii?Q?Xefv7WZrNZWr+aPnDNXLtcJAr6QFML4oETi1FmRZ5nkUe3Sk8OiyaDWmypJ5?=
 =?us-ascii?Q?BDso1yB5M2nEZNOhpKvQ9vijDkNeNtFyq/YFzL0E5ty+Wj6/nbsp5FXzmtcN?=
 =?us-ascii?Q?72ri?=
X-OriginatorOrg: spinetix.com
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0102MB2630.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2021 18:40:22.5556
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5f4034fa-ed2d-4840-a93f-acb1e9633b93
X-MS-Exchange-CrossTenant-Network-Message-Id: 44602413-c7ff-413b-94d2-08d8b33bb0fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V9nwFwjpDDPzEBFiAscWfXswjD6mHKaL8GZYQiFcwzVXdRGVa+ZuH17I5/UV94o4Sca0+5DXJz+HnabasRWhgdm51yX+Y4A54TmE6B7Sb3E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR01MB6677
Content-Type: text/plain

gupnp 1.2.3 adds mitigation for CVE-2020-12695 (CallStranger)

Signed-off-by: Diego Santa Cruz <Diego.SantaCruz@spinetix.com>
---
 .../gupnp/{gupnp_1.2.2.bb => gupnp_1.2.4.bb}                  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-multimedia/recipes-connectivity/gupnp/{gupnp_1.2.2.bb => gupnp_1.2.4.bb} (64%)

diff --git a/meta-multimedia/recipes-connectivity/gupnp/gupnp_1.2.2.bb b/meta-multimedia/recipes-connectivity/gupnp/gupnp_1.2.4.bb
similarity index 64%
rename from meta-multimedia/recipes-connectivity/gupnp/gupnp_1.2.2.bb
rename to meta-multimedia/recipes-connectivity/gupnp/gupnp_1.2.4.bb
index e60349716..c7b330fa0 100644
--- a/meta-multimedia/recipes-connectivity/gupnp/gupnp_1.2.2.bb
+++ b/meta-multimedia/recipes-connectivity/gupnp/gupnp_1.2.4.bb
@@ -1,8 +1,8 @@
 require gupnp.inc
 
 SRC_URI = "${GNOME_MIRROR}/${BPN}/1.2/${BPN}-${PV}.tar.xz"
-SRC_URI[md5sum] = "2ade3d29c624ad98d70113e6e93908a5"
-SRC_URI[sha256sum] = "9a80bd953e5c8772ad26b72f8da01cbe7241a113edd6084903f413ce751c9989"
+SRC_URI[md5sum] = "7c9c7cd80e36d9fb1e5b0267571fc17d"
+SRC_URI[sha256sum] = "f7a0307ea51f5e44d1b832f493dd9045444a3a4e211ef85dfd9aa5dd6eaea7d1"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=3bf50002aefd002f49e7bb854063f7e7 \
                     file://libgupnp/gupnp.h;beginline=1;endline=20;md5=d78a69d9b6e63ee2dc72e7b674d97520"
-- 
2.18.4

