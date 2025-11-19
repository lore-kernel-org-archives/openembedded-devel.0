Return-Path: <hsimeliere.opensource@witekio.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94D02CF34B7
	for <webhook@archiver.kernel.org>; Wed, 19 Nov 2025 14:42:57 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.138])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8549.1763563375608028969
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 19 Nov 2025 06:42:56 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@witekio.com header.s=selector1 header.b=FZHrJZRy;
 spf=pass (domain: witekio.com, ip: 52.101.69.138, mailfrom: hsimeliere@witekio.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eRVynA2dnfOvXhfGEPpTasn1mu9Ohk5xFsLpFNdzrszORvmd5w6+A7puP0XKv9IGq9vgyu4irnWZYEMb+wUL5RQr09PscSNC0ewp1CTr99teEUO1aZfmZ9SNjbZEjbfx0AayUZNNAjH/PWv8GIIy2L8BtCmi6WhjjWlZPodxzHM10Qswwvu44dFcQi77mKKDlcXqmgRGIQsDCFImmG5pJhPCCuil8y4qkpaXB4wl/Ae+HntADqdyzi9oo8253IDTTKYSJE0ke8EGvE9cZcnW2B2e/InJ6iq8MvVM+2lO887YNLwsoPKOp/FS8N+Vgw3W+eB3qEjHifZVBoJ37gPS2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AG+VfuGwJ1FyEfKBwloyQfVu/hLln26jVfV4d9Qk8RU=;
 b=NGypWORe1PwalhLsb8Pm9P+5cXlgB9vhu//Sxk+RXxJZ/TjS6GY7dIKaX/XGjKr58o9uxHMj8MIddQRx/W2/gedJP+wrCxm92djoPnz+dqSAA2t9yFDEfoQUj2xz7zgw6j0eq/IlV6smnhTSMe/z8kU1pZOVad/O6o29+h7aDyNqPHCdPfJmhL2aR2YToT+UZKYyBaH/pAqAWJP8hU1d6DhXHm6pJMEWO7HLiWIeCzF1y2072uTwtqdU5Ql7Hx2k33zdVd12KnHy46Ws5iNRbhLDQ0EroPRQhuVBFussM7qVIZ0Dn+Bi28abFNSp5/zyOyRu9dkQXp6pAu81FIBlMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=witekio.com; dmarc=pass action=none header.from=witekio.com;
 dkim=pass header.d=witekio.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=witekio.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AG+VfuGwJ1FyEfKBwloyQfVu/hLln26jVfV4d9Qk8RU=;
 b=FZHrJZRyTiBcTXOiHMnzQsgYPxWrdWQod3mu3KIu5x+bKw1SiWkG889MizLYqWoUocRE01eTzXzpT5DoYnfTAT9+1DJlL/05OqKuFuVRnsT33o/V2iGq43gHmHmdUlU4ScpPgjMo0f0R8QGvnTjTJd//RvGEK4JdEHzA+7K6goHwli+eoURYgYMo3m/qhAZbuwIhViFoBOGgSwk1KS/9SGezDHh7qafTT+y8D0a5sN2ISqWSYHR3KDWPunmXKwD2rIc4xJRNB4zjdh2w3o0YTOnR9NwJvwLGE79YiixCNIuCwc8pdcUOXf33/kmVC3ow7ZS89g1jdWt1lqJ2C2vGng==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=witekio.com;
Received: from DB7P192MB0330.EURP192.PROD.OUTLOOK.COM (2603:10a6:5:b::27) by
 DU0P192MB1844.EURP192.PROD.OUTLOOK.COM (2603:10a6:10:3b3::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.10; Wed, 19 Nov 2025 14:42:51 +0000
Received: from DB7P192MB0330.EURP192.PROD.OUTLOOK.COM
 ([fe80::3489:ba4d:8522:3e40]) by DB7P192MB0330.EURP192.PROD.OUTLOOK.COM
 ([fe80::3489:ba4d:8522:3e40%7]) with mapi id 15.20.9320.021; Wed, 19 Nov 2025
 14:42:51 +0000
From: hsimeliere.opensource@witekio.com
To: openembedded-devel@lists.openembedded.org
CC: Hugo SIMELIERE <hsimeliere.opensource@witekio.com>,
	Bruno VERNAY <bruno.vernay@se.com>
Subject: [oe][meta-oe][scarthgap][PATCH 2/2] libwebsockets: fix CVE-2025-11678
Date: Wed, 19 Nov 2025 15:42:26 +0100
Message-ID: <20251119144226.2084112-2-hsimeliere.opensource@witekio.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251119144226.2084112-1-hsimeliere.opensource@witekio.com>
References: <20251119144226.2084112-1-hsimeliere.opensource@witekio.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0062.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2af::18) To DB7P192MB0330.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:5:b::27)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB7P192MB0330:EE_|DU0P192MB1844:EE_
X-MS-Office365-Filtering-Correlation-Id: d1ad31c9-193c-4575-f8a8-08de2779eac5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|10070799003|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?iSwb3BlUmb1/YzQhFB5BVq3gkzEPPBKf0zY7PpSJUaw9zkeKk/ozVSKj8M/n?=
 =?us-ascii?Q?MfhG/+LkxE1XXD53LHXlooOdodmLnDx0kkG0hZq+EG0aY22Aq8zjMwTsP9TU?=
 =?us-ascii?Q?cxBN80yFA7N8VL9H8UaRW3IVzSUFi4RKLZhRRutGeySftZyoq1MpEC07zLf9?=
 =?us-ascii?Q?lcTZTgq5q/PN2t3T8eMBCjmY51elw/pSA1uVK8xK5Gi4mmokk3jB6XC806Vn?=
 =?us-ascii?Q?QvGCB/Nwv4nVsvG0vIqNRYff2vvpav3FukJHS/S+2GRQ2PzEWA3YgH6QiHH7?=
 =?us-ascii?Q?1SOt3ZJXSOBvHoBBPryRCxuEZTLS4bK1d5JiRbM3SDPGkSub6ufMutkFZSm4?=
 =?us-ascii?Q?UZHgZO2ZHHiVA98XdoccAOwzXebw9VlBIEg/1TAVOmm05nm/HELR3iXui8bs?=
 =?us-ascii?Q?HZMHfB8s6HcqLZEgCmu7KalZtdrQC/Xp81k6KuznLUgTPF816rviwSIZLKK2?=
 =?us-ascii?Q?IrCSkytO4GyWWk+5maZfKeRKF8nTBZ1+ILQ8g9sLCu8PmkzteXh1PoOXOpHu?=
 =?us-ascii?Q?wBWks7zW09fDVHG77YD9OM3P1nFDeLCV3bVQjdllFPzqDkwAsdmfmLTPYm4M?=
 =?us-ascii?Q?BpyXO3RXFMDeJb5oSWuRod/LkH2nlLowW9n3TSxUPsCggd3/PMnJqVlxdNAY?=
 =?us-ascii?Q?djcDFwBdP/HyAG38Tln/4uPYL8dWZfoO14TR1go3uMObYWiWhJjVtvyWC16v?=
 =?us-ascii?Q?2UecJSpr0cM0nJCIc3ekj1zUZu0YuzYHYj28xsHZ/FBvU6cKVVTkM0lnyLCx?=
 =?us-ascii?Q?q/7XKRorwHxGHv75k/7EALbSR2Sn4o0MiWS9H1aTtFBNX2EshRHTgl4uHBH1?=
 =?us-ascii?Q?4L2hxR1s+9Nmrfg2x0Xny1VaYsa9rGjCZCY+r36Qd9bjk8FXDaDH8/n4LOOc?=
 =?us-ascii?Q?uGm3eBMURzFnYcCyRaD7YMgzUg5P78Qbd1YOD+/0qOhoqJix2wgzG//dS0ap?=
 =?us-ascii?Q?MD6Ezjhei8CteZYLIG0Vaum/VtxchEQKaGnGFjD7OSz99IgCQNxBg+v2SZSr?=
 =?us-ascii?Q?Oxzxm/uU6KP4THxM5j+jkN66PAkTkd1QF7JuyIYWAQDiZGTqrMQv6I8LmPDb?=
 =?us-ascii?Q?+i9qPB8w/aP05kUj2FYKEOOFwrEND41tV4LIMfWxoP0mODPh7AqRrtH1PK2i?=
 =?us-ascii?Q?lPVkQhhX+XaewZ6MTvKIMESGuUg17EOpVEaH+Rb87hzVkg9okDsnTvR+iT5e?=
 =?us-ascii?Q?qDaheHsyu9i9xcNXpomzOjJR2PCsA/nCwQA3DvKwFLlDJh5vLgoV6eZeEe4o?=
 =?us-ascii?Q?icbBb8zV0rfPkT19ZIfFzIfwaRTiuoTseVnoUkhkOiKZpC+DohgFwraL8D1G?=
 =?us-ascii?Q?rYZ4gnQMqcvC42PIw4EMf2H7AKAn1PmspQItZ7GXLwrPF9DnUlTn9UqQWkbk?=
 =?us-ascii?Q?oigjNhwRpc7kcX/cqgb0oXnFMIM2q66DY7I4Mkog3t1+mR8HmA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7P192MB0330.EURP192.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(10070799003)(13003099007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?sQOWKfSCrGC73YybuBpvQ12Pc64dmK05amKR9WrWFzbEloiG+BIA1dYUg82+?=
 =?us-ascii?Q?O3XvKxy9fs1XrB+bo/Pa7LcFnWXPn31MgTXKOWt1NQnYdZZLMm0hMmMZVX1n?=
 =?us-ascii?Q?LCnFeH1texrVqs1OQvarDvmZtBGs3X5sHoukoBm9/NkX3rCDEZjbnuZDozAP?=
 =?us-ascii?Q?LZXrhQsqWNlJ9eY4nlESv+onsXNRgjJ1rzxw44Fle1XdP1o6R9vQa2En96Pi?=
 =?us-ascii?Q?unTkn3Kq29hzUbnFD1UeuoG5VEhfQOO1HfemTegot0vjWImroJsTO8UjGRHc?=
 =?us-ascii?Q?U3Vbj6ouZGrc/86pvDc1AA/pkxi4YhwVcqyWihvyPtkJPPn2cE0zKecxOaAf?=
 =?us-ascii?Q?5rIuwGm6Y14La/WQUEqzhXLhX887A7QRJyLit9nNpvdBE52VsmYAGdSDjbf3?=
 =?us-ascii?Q?SpDV+s4ihkAId9JleVYC1xHYrrpVK1+LuE6o3unutiJ1TCKGeCTOrTh2OUaE?=
 =?us-ascii?Q?jWLWAx7vyCK4359yRC0Ubs7BmOzpUBOYJaEFr424fiOgziv/vOrpTyRcv7hv?=
 =?us-ascii?Q?zcRJzqJ3hWEynelL3db8ZNNXuFBtUQdxqpoVg9lXqXSD2nWKfxMN+87kzeFl?=
 =?us-ascii?Q?IXzd/z322UvZ0HLxTAcTIZotRwXMjJN9oo8srCBPqKDrL5u7JBXqOmlJRcaY?=
 =?us-ascii?Q?O3WV8oT2AHNRI7bHqSzZ71aEyN8IwhXnF9Q/iNXFENR00bfj1nDPqfU++qEO?=
 =?us-ascii?Q?RfuifdKI32+DveGvi5X6Mb4Vvig3fhvsFxuAtYuQVCmXDKA+KxexYT9rSxfZ?=
 =?us-ascii?Q?aDD5N4Y+PPWngVAJ3JoVguzf07+ykDPXYxam5sEK9yN986SIDu8DDkEvNDy3?=
 =?us-ascii?Q?gNopbCpwwhFBXGLplHfQ+JG4Ekl/1K5Na6Q58AvlWd/PkGxR2eKP/0t+nKb3?=
 =?us-ascii?Q?znq0lhQt9pk571OLqDWhA1OLZ5htQN2MWtHYKf9zTE3cFS5Pcid7r4d+fxDQ?=
 =?us-ascii?Q?SbZZ8URnXAHaKnZlYQ/SagD1gKw91BJZdI/nQgOFlHJFE3ZirbzfZrc7W42c?=
 =?us-ascii?Q?C+cIQY2R/1q2AXBghRC8QeNn5+LDAjlCzt1aoBastloKGXZ+dRSkU7lDRqYJ?=
 =?us-ascii?Q?rihJKhItaqR+EoL5C1XgZ/IMxViMPRSlyXPLk4bZymPMgwNZ6Eq/EXBlMxaR?=
 =?us-ascii?Q?ti/9aYjsQk1qqQ/v4uaVKR3xUdvq+jqFtbSXz7gEhk/O09sVf4xQw26FX031?=
 =?us-ascii?Q?m+tSmUxeiKxp1E3K8vJux3ZI4YG4sSP85O/A3JA8YIhosAnGD/tv5KfeF9N/?=
 =?us-ascii?Q?kEw2ceoWf0ElGt0VHRIXvzFEhZ5R2/cHzPb6zuauZq5Pgl6U14Bse+BofNP7?=
 =?us-ascii?Q?aYsLXe7Ixdt/4Na2+4PwjehN+Z7aEDRBVFar9MJJcIMk8/Bxuv+39bs0wCcB?=
 =?us-ascii?Q?d0yhSh0hu9RwgUqw8DMyZwRFqrSv/1QMyqDTrp8cb8f9z/3dzcZAtJjNdQON?=
 =?us-ascii?Q?kdFSAo92Jwk1RUr4oCSMmHS5LqDD54MTKOIZh4DqRxMsrtcaWnbt4QjCWyqp?=
 =?us-ascii?Q?WejOT+cBOUp375XRK8oNPUpmJgXvoKIL6YJOM1TP4383PQDq2MRDB+uDpupD?=
 =?us-ascii?Q?vpybKFI3r4c+YZwsLiLhGoDTkXich1ufjR3ZybI0R/+ieUAD5rwSQK3IFD0A?=
 =?us-ascii?Q?rPG7fp+BHIFbq0BPGE6mvSFWGmarUtJOQl66oAEVRIy3JNufw80M6i4xInYr?=
 =?us-ascii?Q?Dv0iKQ=3D=3D?=
X-OriginatorOrg: witekio.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d1ad31c9-193c-4575-f8a8-08de2779eac5
X-MS-Exchange-CrossTenant-AuthSource: DB7P192MB0330.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2025 14:42:51.7870
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 317e086a-301a-49af-9ea4-48a1c458b903
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yarRSnER2H/4/tGG3WnUFr3wB8+Zo59xl2FUUxq6v5+Ws1plciSI99+cTd+ebMEFOvbyO7dRAbcLJBYljPDnAg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0P192MB1844
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 19 Nov 2025 14:42:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121906

From: Hugo SIMELIERE <hsimeliere.opensource@witekio.com>

Backport a fix from Debian:
https://sources.debian.org/patches/libwebsockets/4.3.5-1+deb13u1/CVE-2025-1=
1678.patch
Upstream commit:
https://github.com/warmcat/libwebsockets/commit/2bb9598562b37c942ba5b04bcde=
3f7fdf66a9d3a

Signed-off-by: Bruno VERNAY <bruno.vernay@se.com>
Signed-off-by: Hugo SIMELIERE <hsimeliere.opensource@witekio.com>
---
 .../libwebsockets/CVE-2025-11678.patch        | 128 ++++++++++++++++++
 .../libwebsockets/libwebsockets_4.3.3.bb      |   1 +
 2 files changed, 129 insertions(+)
 create mode 100644 meta-oe/recipes-connectivity/libwebsockets/libwebsocket=
s/CVE-2025-11678.patch

diff --git a/meta-oe/recipes-connectivity/libwebsockets/libwebsockets/CVE-2=
025-11678.patch b/meta-oe/recipes-connectivity/libwebsockets/libwebsockets/=
CVE-2025-11678.patch
new file mode 100644
index 0000000000..3489a7e6a1
--- /dev/null
+++ b/meta-oe/recipes-connectivity/libwebsockets/libwebsockets/CVE-2025-116=
78.patch
@@ -0,0 +1,128 @@
+From e1d4c32bf773b8cf01eb5e368a4a21679e0b670a Mon Sep 17 00:00:00 2001
+From: Hugo SIMELIERE <hsimeliere.opensource@witekio.com>
+Date: Tue, 18 Nov 2025 17:03:33 +0100
+Subject: [PATCH] NN-2025-0103: ADNS crafted response overflow
+
+This document contains sensitive information collected during our
+security research activities related with the Libwebsockets library made
+by Andy Green (warmcat).
+
++-------------------------------------------------------------------------=
------------------------------+
+| Report information                                                      =
                              |
++:=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D:+:=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
:+
+| Vendor                              | warmcat                           =
                              |
++-------------------------------------+-----------------------------------=
------------------------------+
+| Vendor URL                          | https://libwebsockets.org/git/libw=
ebsockets                     |
++-------------------------------------+-----------------------------------=
------------------------------+
+| Affected component                  | Ecostruxure Automation Expert     =
                              |
++-------------------------------------+-----------------------------------=
------------------------------+
+| Affected version                    | 4.4                               =
                              |
++-------------------------------------+-----------------------------------=
------------------------------+
+| Vulnerability                       | CWE-121: Stack-based Buffer Overfl=
ow                            |
++-------------------------------------+-----------------------------------=
------------------------------+
+| Proposed CVSS v3.1 Base Score       | 7.5                               =
                              |
++-------------------------------------+-----------------------------------=
------------------------------+
+| Proposed CVSS v3.1 Vector           | CVSS:4.0/AV:A/AC:L/AT:P/PR:N/UI:P/=
VC:H/VI:H/VA:H/SC:N/SI:N/SA:N |
++-------------------------------------+-----------------------------------=
------------------------------+
+
++-------------------------------------------------------------------------=
----+
+| Security Researcher(s)                                                  =
    |
++:=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D:+:=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D:+
+| Name                                | **Email address**                 =
    |
++-------------------------------------+-----------------------------------=
----+
+| Raffaele Bova                       | labs-advisory@nozominetworks.com  =
    |
++-------------------------------------+-----------------------------------=
----+
+
+**\**
+
+Libwebsockes is a C library that provides client and server
+implementation for various protocols (e.g., HTTP, websockets, MQTT) and
+more.
+
+Nozomi Networks Lab discovered a "CWE-121: Stack-based Buffer Overflow"
+in the latest software version of libwebsockets, specifically in the
+async-dns component.
+
+The vulnerability allows an attacker that can inspect DNS requests made
+by the victim (e.g. being in the same wireless network) to forge a DNS
+response packet that overflows the stack and may lead to arbitrary code
+execution (depending on the platform and compiler options).
+
+The issue resides in `lws_adns_parse_label` function in
+`lib/system/async-dns/async-dns-parse.c`; this function iteratively parses
+a label however it does not correctly check the number of bytes written
+in the destination buffer.
+
+Specifically, the size of the dest output buffer is specified in the `dl`
+argument, however during the read of each substring of the label only
+the length of the current substring of the label is accounted for not
+overflowing the destination buffer, but previous reads are not accounted
+for.
+
+This means that a label of arbitrary size and content can be supplied
+and is copied onto the stack, however it must be split into substrings
+of size less than `dl`.
+
+To trigger the vulnerability an attacker must be able to sniff the DNS
+request packet to send a response with a matching identifier, otherwise
+the implantation correctly ignores the response.
+
+We have provided a harness for testing, for ease of use copy the harness
+in a subdirectory, for example in minimal-examples-lowlevel/api-tests/,
+and build it
+
+```
+cmake -B build -DLWS_WITH_SYS_ASYNC_DNS=3D1 -DLWS_WITH_SSL=3D0
+-DCMAKE_C_FLAGS=3D"-fsanitize=3Daddress" . && make -C build lws-test-async=
-dns
+```
+
+Then it can be run `./build/bin/lws-test-async-dns < poc_stackbof`
+
+![Address sanitizer report of stack buffer overflow](./NN-2025-0103_image.=
png)
+
+We suggest keeping track of the number of bytes currently written on the
+dest buffer, this could be done by saving the original dest pointer,
+decrementing dl on each substring memcpy, or using an auxiliary
+variable.
+
+CVE: CVE-2025-11678
+Upstream-Status: Backport [https://github.com/warmcat/libwebsockets/commit=
/2bb9598562b37c942ba5b04bcde3f7fdf66a9d3a]
+
+Signed-off-by: Hugo SIMELIERE <hsimeliere.opensource@witekio.com>
+---
+ lib/system/async-dns/async-dns-parse.c | 5 +++--
+ 1 file changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/lib/system/async-dns/async-dns-parse.c b/lib/system/async-dns=
/async-dns-parse.c
+index bdfe2050..81743b3f 100644
+--- a/lib/system/async-dns/async-dns-parse.c
++++ b/lib/system/async-dns/async-dns-parse.c
+@@ -35,7 +35,7 @@ lws_adns_parse_label(const uint8_t *pkt, int len, const =
uint8_t *ls, int budget,
+ 	const uint8_t *e =3D pkt + len, *ols =3D ls;
+ 	char pointer =3D 0, first =3D 1;
+ 	uint8_t ll;
+-	int n;
++	int n, readsize =3D 0;
+=20
+ 	if (budget < 1)
+ 		return 0;
+@@ -88,7 +88,7 @@ again1:
+ 		return -1;
+ 	}
+=20
+-	if ((unsigned int)ll + 2 > dl) {
++	if ((unsigned int)(ll + 2 + readsize) > dl) {
+ 		lwsl_notice("%s: qname too large\n", __func__);
+=20
+ 		return -1;
+@@ -101,6 +101,7 @@ again1:
+ 	(*dest)[ll + 1] =3D '\0';
+ 	*dest +=3D ll + 1;
+ 	ls +=3D ll;
++	readsize +=3D ll + 1;
+=20
+ 	if (pointer) {
+ 		if (*ls)
+--=20
+2.43.0
+
diff --git a/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_4.3.3=
.bb b/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_4.3.3.bb
index d0a2aa0923..90ac0c3eb3 100644
--- a/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_4.3.3.bb
+++ b/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_4.3.3.bb
@@ -10,6 +10,7 @@ S =3D "${WORKDIR}/git"
 SRCREV =3D "4415e84c095857629863804e941b9e1c2e9347ef"
 SRC_URI =3D "git://github.com/warmcat/libwebsockets.git;protocol=3Dhttps;b=
ranch=3Dv4.3-stable \
           file://CVE-2025-11677.patch \
+          file://CVE-2025-11678.patch \
           "
=20
 UPSTREAM_CHECK_URI =3D "https://github.com/warmcat/${BPN}/releases"
--=20
2.43.0


