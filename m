Return-Path: <hsimeliere.opensource@witekio.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0893E77182
	for <webhook@archiver.kernel.org>; Wed, 11 Dec 2024 08:56:23 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.136])
 by mx.groups.io with SMTP id smtpd.web11.6351.1733907380643502560
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 11 Dec 2024 00:56:21 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@witekio.com header.s=selector2 header.b=eWkjtq+Q;
 spf=pass (domain: witekio.com, ip: 40.107.22.136, mailfrom: hsimeliere@witekio.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WloEvz1460WUcTGpJJdVF+0L+2/od1Ju50Q93kEzc/BnR5xuVxkaT2kMm91x3Pjh0l8UvxD3YQRLMPd2V11+XPrW+/GA3Hu43JWpLucjWnE/QaxlyHnkIIW301cJKV9SnnyD43uCMtd6vj8eZKmEKk0Lamca5dZnnOatKgoYv0DlZBpgfJROldMClr2naz+gqU9qngZLBCKTUz7VCNZJ1LOVvFKK+mDP5JuYhbdXN84MSemeqR+u/ACsH9Vl3S0zi0l/WHIreMwyDqiweuI//a3UmnNQpgCGxrgu9WPOm9vnKrJQlrZYU/sFVw/mNFT53q18dYg7z1MIkPt5TPEiag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T9neh4DuMdi9d9svaP1QgcVKTN70UUFN2FGTT0qy+NE=;
 b=p2whQMwL5tGuYT22xD1qhgnoTP0A5bCEdmJwHbvdUYvBU7b3wTYeDj/CqQp8vIAKi/dWCycM70493zvxEyfp0EXR2GbYLvXVIE6ewvMP0yaBMs2BkMR5i1x8IF63EV6YwAWKCLc3710rBw4Uvqvsee/g1fDqI2fGWGjzfizQIKk7/iTp0j+cHDhkiwmR+xIGbIVe2fU+qHZVxXcaJSwqdDRyVV0DoSz82LgpoOV4DFZZbVEl4IR888p33ZKAdvRu58cmvGXlHaqDspYa0jw0slC/yxT8zupK61EoVVbYhD/ikqoI9sUtfbSwSi4COz1p1qSz5vw/XHu2yRK+WGJBHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=witekio.com; dmarc=pass action=none header.from=witekio.com;
 dkim=pass header.d=witekio.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=witekio.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T9neh4DuMdi9d9svaP1QgcVKTN70UUFN2FGTT0qy+NE=;
 b=eWkjtq+QzNLpgSceBM0Q3cw+lhApOA5J3G1YJSxOUfY9MyCcwqpsLGaHi8NnOBYo2kVIyxSIKZSeYDSWHOUYvPyijAVO9QniTLDT0nBa9eRHjMjwm+4qkWGLtqXksvfXcNkkbiMnqJSwZWGRD1F0Rb1iTs4gp1pkRPwp4CmlJOopetLrruZuBmbmXfCgY6P4xHogcKDMYzVBLNybVhQlifWcxlWjjfE6ST4ONcbyzr1gJm8eqiMEtGWRU3t/Pgv0xXgVTm7cLBdlJ33KXnu1vr/Q0r6Pi16Y63Uv8+PfTBDDb/0aL1DUkyuD7Xl2EfJxomB0vJaR7Yj499wbl4Zpgg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=witekio.com;
Received: from PR3P192MB0714.EURP192.PROD.OUTLOOK.COM (2603:10a6:102:48::10)
 by DBAP192MB0988.EURP192.PROD.OUTLOOK.COM (2603:10a6:10:1b4::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.15; Wed, 11 Dec
 2024 08:56:17 +0000
Received: from PR3P192MB0714.EURP192.PROD.OUTLOOK.COM
 ([fe80::345f:a9e9:d884:3091]) by PR3P192MB0714.EURP192.PROD.OUTLOOK.COM
 ([fe80::345f:a9e9:d884:3091%7]) with mapi id 15.20.8251.008; Wed, 11 Dec 2024
 08:56:17 +0000
From: hsimeliere.opensource@witekio.com
To: openembedded-devel@lists.openembedded.org
CC: Wang Mingyu <wangmy@fujitsu.com>,
	Khem Raj <raj.khem@gmail.com>,
	Bruno VERNAY <bruno.vernay@se.com>,
	Hugo SIMELIERE <hsimeliere.opensource@witekio.com>
Subject: [meta-networking][scarthgap][PATCH 2/2] mosquitto: upgrade 2.0.19 -> 2.0.20
Date: Wed, 11 Dec 2024 09:55:40 +0100
Message-ID: <20241211085540.6811-2-hsimeliere.opensource@witekio.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241211085540.6811-1-hsimeliere.opensource@witekio.com>
References: <20241211085540.6811-1-hsimeliere.opensource@witekio.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: PA7P264CA0240.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:372::17) To PR3P192MB0714.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:102:48::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PR3P192MB0714:EE_|DBAP192MB0988:EE_
X-MS-Office365-Filtering-Correlation-Id: 61021fe2-30de-40f1-9095-08dd19c1ac89
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|52116014|1800799024|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?7C9H2hChsxvhQ9dbwkteAKU3nH8uuLm3HVbGufOLI1r13Cg4MuYRAVFq86FY?=
 =?us-ascii?Q?AaFyQJ2UgzcGTj+InH6wZDXI4GZvLQPjUq8BpKZc2tbo9XZOlqUlf8VMhCsm?=
 =?us-ascii?Q?nk8hAcTx/c1Z0ZhEEtub8oIRYAQZwcAsKcxNObgq8cjV7cnR4cGv6LXmlqug?=
 =?us-ascii?Q?CMaG07W7SjHrf5h/TLoAvJuaN9CD39l1nmN9MkOtPt3WL+G1d3pttXUkoSwl?=
 =?us-ascii?Q?wppITCkpcVPvWNQNevI2fHR0b2A8U+761Q3xPmKggSBkNhv19/qITD8Si96Z?=
 =?us-ascii?Q?HmqGrEI4iwfoYUTTxkiwWWC26FN1cQt195DYTTswtdtqoflLyl02chH9Ag6u?=
 =?us-ascii?Q?u1PdQsi9Ej8VZRs9rFWdxSagAM9TItMJuZxjahpLo5XIQzF7iFArg3Fb1XPO?=
 =?us-ascii?Q?z4OFjSmUrsux3+37QS2GTCKn52f+JjhntJVGJLZCQXgl3gYpf028G8J9LsLK?=
 =?us-ascii?Q?rJnW36fTSfiYWsLmTfKsin3jXSU/0mwBAOtoXHKODd0L0SeMEj9KP4R/pVrB?=
 =?us-ascii?Q?14putw+W5LDrMYwlJWpf61VbjJISF8unvchsWnUE5lSGguBCj29vp5jhL9Za?=
 =?us-ascii?Q?JRAkAhrWo5UZu3DyRI6WdmzLH0eMBP6//le/GTL1ciUdtAMVPEt0EA7iHHz7?=
 =?us-ascii?Q?RXpURFwAkodUHf2lhGp7N+Vm8ZSyB3f5KZlMyKtcP7Ulnx2nR9rMdO+P6d5f?=
 =?us-ascii?Q?toGueBf3gzGzX/Icbdh84U9fVLalG4CxWKhRhM4j1rNdZpbLStkGnIYb2GYN?=
 =?us-ascii?Q?53+TuBn7m+Fogmq5x48oMC/Nrq0MNo5Fpw3RxfZFXM+fiBjRldg+8RPQOB/f?=
 =?us-ascii?Q?U5+NAGZ3vG0r+n7N7adVuhntdu8OosTA16JvLNwRD/Xv+EIVWAzxU3Z4MouT?=
 =?us-ascii?Q?oOTT/V4mi/GEWD57XmvKQOYDLygWcR06SWlC8X+sMwckHkXH3iqRBltJ9gzy?=
 =?us-ascii?Q?Q7YSvmkJBNZ2bYubFzs0nybnvgpgn/CYYZUCmny8WZChNG9GqwlCxM216QVV?=
 =?us-ascii?Q?lx0Z03xigBwKcdRZHKSYN0yK+Ok+i6NL8jtkVkP6tyu19tY0I/697xPkk0X1?=
 =?us-ascii?Q?BXYme64Jc7W6E0KV/4MUgMME12rr/FBLmsPMFzZqNP3IBTe+63S6ebShnfqe?=
 =?us-ascii?Q?eWl096H2M12NsjvPUVgv+k2de+mgdmI9tlHyL2HbmR2uOh/9jPpGeUeTaltk?=
 =?us-ascii?Q?hnke+OWoNaJ7ue2BhDVKlu9KlG7wfCbb5oxI/HgY9E/iuQSDLA6YF6rUUpkw?=
 =?us-ascii?Q?AAFt3uB8+c+it8hCv8GTdkr4/0VQcsjJUXpIDGQjYhGFBXyHP1mnFG3FSIEl?=
 =?us-ascii?Q?YEh1XGaxixqEa8IQ71DO+wJWErFvqx8OV9gcdOlYoUNG+egTowhX+TB6Bf4M?=
 =?us-ascii?Q?BfL8MmA=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PR3P192MB0714.EURP192.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(1800799024)(376014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?AmarYOaDKCmLdCjN+HimDcyOKI3uHx0DBR99w5XGZWxPnZHI+f5ihrSQnE5+?=
 =?us-ascii?Q?CBlyQxJKK5gO1ugU/iqqRl0gV6gA5yVZI/eIL57bxhMvhnGFlqJn14e78MeF?=
 =?us-ascii?Q?AqWjT7i4NcpocBoAWyfQHs1LYVStxguoqBq8XZrzHx5msZoMciw9QnzsWj0V?=
 =?us-ascii?Q?ulrnY5RqegAbHA3wxh7L6jfuSYD0vD4xn/bTg6bkLF3F9JWVga2mIRECwu3q?=
 =?us-ascii?Q?QvPhC+7Qx3GYsWrtxBT88GCZ5VX2Wr1Y50YdgTU8gyX0I0g2qr+YVqTfqKfT?=
 =?us-ascii?Q?f5wYBImqzfUFLJ5MwaSb8gU4T6J0tXpwxf1ez+UMF6Q0q6TjBjlwIFPBsMHr?=
 =?us-ascii?Q?AyzTNsiF8HIrGl5Szxh6IPUc/08ZDB/iR5bWVz/2WfMFIkyezuTPYTGcDq6R?=
 =?us-ascii?Q?D46ZjuEwOjPbyojclDAlmkFtPxVRe7cdPzms4AXlbOn88Z5B+9vh2mQe51QC?=
 =?us-ascii?Q?zTG0aIY86NChOPM8kcX22w8Z7HHlenQiHK5TKMYu0tbB+zmoAhqosDEXA08o?=
 =?us-ascii?Q?b2n0mElwmS2I4OhKF/qG4uI1x69d+eG09O+scT11WwFsChsdGbdR/Zpo5APY?=
 =?us-ascii?Q?eDRHDeATFNOyTMKUen/TLLEWzU4pNeSDwCYwnfkJYQPocTmzfxGt4KZ19azH?=
 =?us-ascii?Q?W6MpVwUx1/Ss4rkBVgVUkRX/7wxiwtcB6JyRSxYtcNRZx+MQ27WW6GU11hZf?=
 =?us-ascii?Q?HnNdo8C9mRZWonjF0hQ+m9xOeUbxPaSI0kc4puKiwd1ccDmdNxPAtplWMEv7?=
 =?us-ascii?Q?8ou3jswyYN6KalvxwYOk3hDS4jxWpeRCi0Ot88W0yjvTY1ces2Am+3OyMqSf?=
 =?us-ascii?Q?igzC8RGQ6WWSYzSMOht3FZJGIoehQaUuDrcEUpJ4tYYgPXf7fN4gNpgXdAZI?=
 =?us-ascii?Q?6mgKPhTK1UMy3JiBB2ek2qeCKMpk0FeVb7N+uC+cdut5yWwA3BV/MEh0Nzhi?=
 =?us-ascii?Q?Cu2jP2qe4BYVxxmWZqFhLadxAaVovYxaYEVHaJ3pnet2HnkJh8EQvjPAEPsy?=
 =?us-ascii?Q?vyBjkJyxKI1ngcmTusSv7C5/66KwNQsHt/LJEcP3l0iSZxuVIQmJkijrLDRg?=
 =?us-ascii?Q?nfEsBB0Yin6jSfO8jKV7QROXPPIeH4zKvbCz0ObRKRyiRxzAnLyJbA7ua6Il?=
 =?us-ascii?Q?D3BmjTDDDbjIt0GQTGzCcvYVIOA0Kn4Mq0Ra8iqIeyWITVA4ov3pMQCOSMV9?=
 =?us-ascii?Q?A3VumZ966Y5oTuw5aVIrDbHWouuaPMtu3UFsg1zfqy9CMa+fItpWvLy7qRiF?=
 =?us-ascii?Q?L2mXlkHbAq+ijH+KF0Tgs+pDuZceThuImEnGurYZ/ZB5uovz6AZZOgljDlTB?=
 =?us-ascii?Q?y1U9zHg1Xp3KQrgk7yUOaQq3mXmEm2tk/ld6DzN5StkHXxxlOX58lFurTuKW?=
 =?us-ascii?Q?UI4DjrS/zikDoeBuXjk4tgSrFTlbNSFe3eQ/v0Fr1F+VADfWjX+LkBnS9YrG?=
 =?us-ascii?Q?cJ/bSDTgmMrUkSrg3XrQI7htefBS+ElN2HZILb+KvK5BawFiAE1DmNCe5RkS?=
 =?us-ascii?Q?MJFH6FtPgdjHUEgsIvAn5/MgB752P/+yQhUsZ5yq6/hc1l9bs8EhFr7T4o2T?=
 =?us-ascii?Q?jWPIVGtPAC/OP2h/771gizhV9JzPAWO0a9b2f1Xv?=
X-OriginatorOrg: witekio.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 61021fe2-30de-40f1-9095-08dd19c1ac89
X-MS-Exchange-CrossTenant-AuthSource: PR3P192MB0714.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2024 08:56:17.6490
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 317e086a-301a-49af-9ea4-48a1c458b903
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gUqAKn0aVu0I/tSfS+bQ0VyyV4QknrpJ6ph4whOKhlNsCmCjcODAwKj2CZ3fZ5+fphUMZ3cLce1oT1fa1pFOXw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAP192MB0988
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 11 Dec 2024 08:56:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114276

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Broker:
- Fix QoS 1 / QoS 2 publish incorrectly returning "no subscribers".
  Closes #3128.
- Open files with appropriate access on Windows.
- Don't allow invalid response topic values.
- Fix some strict protocol compliance issues.

Client library:
- Fix cmake build on OS X.

Build:
- Fix build on NetBSD

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Bruno VERNAY <bruno.vernay@se.com>
Signed-off-by: Hugo SIMELIERE <hsimeliere.opensource@witekio.com>
---
 .../mosquitto/{mosquitto_2.0.19.bb =3D> mosquitto_2.0.20.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-connectivity/mosquitto/{mosquitto_2.0.19.bb=
 =3D> mosquitto_2.0.20.bb} (97%)

diff --git a/meta-networking/recipes-connectivity/mosquitto/mosquitto_2.0.1=
9.bb b/meta-networking/recipes-connectivity/mosquitto/mosquitto_2.0.20.bb
similarity index 97%
rename from meta-networking/recipes-connectivity/mosquitto/mosquitto_2.0.19=
.bb
rename to meta-networking/recipes-connectivity/mosquitto/mosquitto_2.0.20.b=
b
index c6ce2e095..2bc130318 100644
--- a/meta-networking/recipes-connectivity/mosquitto/mosquitto_2.0.19.bb
+++ b/meta-networking/recipes-connectivity/mosquitto/mosquitto_2.0.20.bb
@@ -19,7 +19,7 @@ SRC_URI =3D "http://mosquitto.org/files/source/mosquitto-=
${PV}.tar.gz \
            file://2895.patch \
 "
=20
-SRC_URI[sha256sum] =3D "33af3637f119a61c509c01d2f8f6cc3d8be76f49e850132f28=
60af142abf82a9"
+SRC_URI[sha256sum] =3D "ebd07d89d2a446a7f74100ad51272e4a8bf300b61634a7812e=
19f068f2759de8"
=20
 inherit systemd update-rc.d useradd cmake pkgconfig
=20
--=20
2.43.0


