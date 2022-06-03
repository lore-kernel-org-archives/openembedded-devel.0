Return-Path: <wolfgang.meyer@gossenmetrawatt.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A16CEC43334
	for <webhook@archiver.kernel.org>; Fri,  3 Jun 2022 14:25:37 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (EUR04-DB3-obe.outbound.protection.outlook.com [104.47.12.51])
 by mx.groups.io with SMTP id smtpd.web09.7803.1654266331966334874
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Jun 2022 07:25:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gossenmetrawatt.onmicrosoft.com
 header.s=selector1-gossenmetrawatt-onmicrosoft-com header.b=eRy5bb0y;
 spf=none, err=SPF record not found (domain: gossenmetrawatt.com,
 ip: 104.47.12.51, mailfrom: wolfgang.meyer@gossenmetrawatt.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B7aZaOCkyPC67zmw695SimE0kz2u8D4AFFr4Q5Sjw3+ApYyt22HfI402/KqpQGaUxPLfeq8vHX6QZuMlNl3VPrhqqhOEBGJ+u97LvqBahXDYqhttGvRgdjDuVpWhRZtbu5fK2Vi++HPfJRbH8xI8XtOkIuRped00VNl8zhhtVm6++lXx7tc6TpABM4zjLBvaliuuFK6lbUpB0I/92FcTxgTqLnQ2JI0dFnE+KoMF0AkFyAwhbgVFIlwOIO2KW83ATbnxNLMqMWZsWvXREe7jhqU0WnqyM4TlMrRg2BCu4G8hF2XjLc116m+QG0QyAoMjBvo/JmsbGuhcrQzN5fdRkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xmm8/x+vGk6OOT1MkVI69IfNYQWtZfM7RRm42HdR8S8=;
 b=Urbq39EVpAykKX9GAJB8HaJgiI281o8kwTrcmAX0VEjFhEa5C2FcYUlmQh/UXO2pypXSB1aP+ToWYbWTvyx2yk4QJBBStAsjok31Ev2fYJMv/xXO8cUSHKpBcUUbAgaOa+8hCDVS+oeqCBimmjILkBpeHXNCo1mL5lQAz9vkUHXyuMYX7Rcis9i+XPfilEekwL7CNPbzewJJhV2zFZ2uTlEqneY2ao27NlF8VPkU6+4jmUbNl4ypnqZKkJzdwYmIR+WPGIp1QO+t+SqN9AqFVu/OUldWYYVlsCZV9dD2aTpeuZcvIjw8vtdt32zE2leIk42YcMbX4t+yKlLX0gjlnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=gossenmetrawatt.com; dmarc=pass action=none
 header.from=gossenmetrawatt.com; dkim=pass header.d=gossenmetrawatt.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gossenmetrawatt.onmicrosoft.com;
 s=selector1-gossenmetrawatt-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xmm8/x+vGk6OOT1MkVI69IfNYQWtZfM7RRm42HdR8S8=;
 b=eRy5bb0yLu06/IzWXwDO03ccF2M+5zH1cAB1O3Si+3N7LidJYVTzvcTG405rkoVTcnvBqZJFbSd++jCBsjzC4sCdMSNR40FZr8N64inR0Jh0T1BLpjv99V3wXM+11s9I4xfpZmZXaQtsw3U9vvdMbUoziqpDxaBmPaP6eVg3wEs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=gossenmetrawatt.com;
Received: from VE1PR08MB5583.eurprd08.prod.outlook.com (2603:10a6:800:1ac::24)
 by DB8PR08MB5164.eurprd08.prod.outlook.com (2603:10a6:10:e7::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.15; Fri, 3 Jun
 2022 14:25:27 +0000
Received: from VE1PR08MB5583.eurprd08.prod.outlook.com
 ([fe80::d0f1:d547:5fd8:f78a]) by VE1PR08MB5583.eurprd08.prod.outlook.com
 ([fe80::d0f1:d547:5fd8:f78a%7]) with mapi id 15.20.5314.015; Fri, 3 Jun 2022
 14:25:27 +0000
From: Wolfgang Meyer <Wolfgang.Meyer@gossenmetrawatt.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wolfgang Meyer <Wolfgang.Meyer@gossenmetrawatt.com>
Subject: [meta-oe][PATCH] Basically reverts commit
 e7bd28f1f5e6374dee813e44a5218022367629a0 as the QA issue does not exist
 anymore. This is presumably the case since the file-rdeps check does not
 expand RDEPENDS recursively. There is no evidence in the fbida source code
 for a runtime dependency to bash.
Date: Fri,  3 Jun 2022 16:25:06 +0200
Message-Id: <20220603142506.360567-1-Wolfgang.Meyer@gossenmetrawatt.com>
X-Mailer: git-send-email 2.36.1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: AM5PR0502CA0003.eurprd05.prod.outlook.com
 (2603:10a6:203:91::13) To VE1PR08MB5583.eurprd08.prod.outlook.com
 (2603:10a6:800:1ac::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6b19a158-3eb4-4456-8525-08da456ce7c6
X-MS-TrafficTypeDiagnostic: DB8PR08MB5164:EE_
X-Microsoft-Antispam-PRVS: 
	<DB8PR08MB5164A0C8B2DF1CA995BEF04B9AA19@DB8PR08MB5164.eurprd08.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	rG3hhnnFOMvpw6zKZFt3qu3wivVXAWFB2ZRBcuO/Fg3SRSPdXP3Tq+Wf1GxVdxrM4eJnIjoLTUN24KlgzOXXXpv0/Zwxns5t8zkMPidHao5bnMWS9ZlzPh7GGgCIG/JnzF+4nnBzG3ozeIdsOPpddJLlc3UzK+gG24gN8RKIp4SYIWno48iWfIB1pK1R9T5NCwTtM35B/p5sD6VJz1T629PQ+Vfhr03S70HaTZuOkErDkAEXPRFTxV3B9QZAebrIBO1TGonTwKl6EWHGbKOnm7YN7iYolnPGL9t2+p14BTI0TkSRHSzACcUmOzTWzNHbaz88AjxzIj8NqN2/vsPk9RDt8uRyDheDwEXwfUwAwXHAIHMPmRGUDoIKVHBQ8hDou2TKiBR3BT2zxknnsfcJbzdrfCHuryfxj0tvPVa0LvC1PxPu2qe01mtkWecH2ZPkxoIoAuXM0H7aFctbMt9B04ijehBjSx75SYiDSNg/Qco75k6TXMvLC4vFG9/UhczerD8+Rt+j8g0af2WHJ39P4T6tjFum23Uaf0CH6x45rLgoMvnbCyVSp6qQ8k1qA2hM4Le8WFbrieIQ9hjUKiQYA5OwyFivJ5bmqPuNcAoU9mdk/6QjY4LsAC5/Rn4a27O6cbWMEw7t8BR7luDpmNw8qP1DTdqRmx4Cl1OGeQAyRaOcypWX3O55Dpc4zIpKWb9HdxK/35qQMU/T74kc2DQGpiqqDiYJOtIMIVg3OqBd+2Y=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR08MB5583.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(52116002)(6506007)(508600001)(4744005)(26005)(6512007)(5660300002)(966005)(6486002)(8936002)(2906002)(83380400001)(6666004)(2616005)(107886003)(86362001)(38350700002)(1076003)(186003)(38100700002)(6916009)(66476007)(66946007)(4326008)(66556008)(8676002)(316002)(36756003)(219693005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?UdICyJ5rkWGtjbf3ZciH+VGHZsNywEJ8tXKahvm4mG9Ttl1sQcOEiilHEMt4?=
 =?us-ascii?Q?/wON/FQhAAU+1zK4bUisENkHfFF9kjdAiK+nSh/KP0N+IUNcvTWWeFNV6SXM?=
 =?us-ascii?Q?ojA15BFY2sE7wWr82+P86FSK2c8ECjWBlCjmwD60S3+GjqIEQB26i/m2R1zD?=
 =?us-ascii?Q?kthA9KwMNdbR7Bq+LsCvb/E7ZWCjCUl5aRrYXe2zPA5Q0AEQ14BtsgwmXnhI?=
 =?us-ascii?Q?K6bpmN6E0th2KvUvC3IhGV3Y1F33e0JzLjcdQlFrC4uxF5Dgr/9UlPv3n9pg?=
 =?us-ascii?Q?x1VoMUaOGnoXtZsznmshs/tcuNlB/eSpi474PEFXLIbhlZcsTGZsq7Q2jmfU?=
 =?us-ascii?Q?QGYr4hwPit1EgG3U3Y/6cV0ZLwQ+kP85p3k2bxuIbknALpQ/UPtGtJZr8OJk?=
 =?us-ascii?Q?woX+8Z1q4Gy1D+JcafdCgzz+yHlmAQI3qxgm9eA8O5GW6JSH/hIbh++xp6Ef?=
 =?us-ascii?Q?fVHSjIGrZ0vHAWhbcpb1+PtqBUxBRM+df8RRNpTbvVC76BkHyabEo6R8PMST?=
 =?us-ascii?Q?wvi5yPJFgKnZ0SEo6/m6Z36QWbo3C6q4Wii1UYqzaWYZYn2MYQ5PXjCDghcz?=
 =?us-ascii?Q?c6az9wnCFNXpdEQMCRYJ5dguC1mbuAffKRSRcmGo6xj/rvT3aDY3nJlBq55m?=
 =?us-ascii?Q?wvXN+vkOmZZ6vSysDXSklBmeSzTLMPMu0MRnRUN06ODYYuvRHa4ExdSuZpba?=
 =?us-ascii?Q?rfcbd5Ic/KtnoaMWRIxwQsWNYIIGxB/W8AFGtx5p2hkvd0jua+Fkb7qA4xEQ?=
 =?us-ascii?Q?5N4sRb3TEcw01FnJ6KytO8IP0c5RYltWUuQVxxfnE+K69iDYTCv5CfGhSvdB?=
 =?us-ascii?Q?K5044Ryarliro05i4PSo2OrmS6OMJjqsar/96imdyatExjqRLlqW7iqmdxx+?=
 =?us-ascii?Q?S8QtOvUlO6txXdkjr5b2tzSXIWPW79XsZQRkJfPbdVVk4wxa1NW55F/8uwvZ?=
 =?us-ascii?Q?Lmrrx29cwkNcYv7M5SuF5NtPLtmP6BjgAyQWqw1l4l95hXKfJWXg8JPxhSyG?=
 =?us-ascii?Q?UezrfeME6ahwERZxt3yEgi7E9532cwxZ83pLxrgLl0z72tPy6oyQPI5gzJf/?=
 =?us-ascii?Q?spv0s7QxNG3AYl/GXPC9iBz1SKqjUTiwNGacUvvkmM/X+L+DhafUcPDVcCet?=
 =?us-ascii?Q?IZyX01AE51oOPVomKmrj3uz6nuaI0wRohi3syy5xFqrfXf+mjmQEEVL2kDY+?=
 =?us-ascii?Q?auLC7Uvf+EcCBzmRs/OnObek3BhPU+alGel+DrPwTmXKqGY9+7yLnQAj1Axa?=
 =?us-ascii?Q?vliElNo8SnlkjhzjTOsc7D3hgskXsdaWotHZtcs8A1nR6/PCcbopxeLYxAa4?=
 =?us-ascii?Q?a+IbI4+NJBNhApTyAZkg9fHVRt4FCgjlakdurTUarDOk+F1g+6l6HIcM3zja?=
 =?us-ascii?Q?J3H4YcxYj5dgCwhiY4421hILGa8OnyzlRu5rXQSTGiM7mzIQpcSLdJsvihci?=
 =?us-ascii?Q?CVMuh3ve8+YLDLgf/HayNg53INKI501ziNiBn0l9cY+MfbvKSGJM8KTPpoOX?=
 =?us-ascii?Q?gCroI1vMoIIBEhZYH1FDUhfBpwnJDm4Ou+qOY1z0V/bV1ObXhke4k8xdFYLo?=
 =?us-ascii?Q?/3t6yYQx4ydK6QGK9A2dxE0UZVidS9aeua5rlC6AcmGyxybGzysTCqNAJftG?=
 =?us-ascii?Q?xyuCwdAp1oGoPjSTQXdN4qHX6sV6IwJFhT/p1TCRNfYNyh+n06NL3snoqKf8?=
 =?us-ascii?Q?SYxJKRRIoaqtI+Gj0wU+BnHhxd/33E5fHZUEhWX4XWGEMRhX8APJ3KtLC7sT?=
 =?us-ascii?Q?baSO9yQ2NktuCC3GMZ2kB2xPd3bgaDGzVRMn1ubG97lVrx6200nZ?=
X-OriginatorOrg: gossenmetrawatt.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 6b19a158-3eb4-4456-8525-08da456ce7c6
X-MS-Exchange-CrossTenant-AuthSource: VE1PR08MB5583.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2022 14:25:27.5396
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 927cd455-6160-4d75-86b6-a6892a3b5317
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 TVq670G+lxoJUJPcj/IYgbMzoNKXj28zJV9rV8K2Yf8o1m7J9EburwyOfXgi0mj3wQXGxjpWak6g6cfK4wblZcf8B1WCGeuIxb5uPZE+Qw9ZvMNQSyYkMAeCksKr898B
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5164
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 03 Jun 2022 14:25:37 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97387

Signed-off-by: Wolfgang Meyer <Wolfgang.Meyer@gossenmetrawatt.com>
---
 meta-oe/recipes-graphics/fbida/fbida_2.14.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/fbida/fbida_2.14.bb b/meta-oe/recipes=
-graphics/fbida/fbida_2.14.bb
index bc6f021e6..3d65399cd 100644
--- a/meta-oe/recipes-graphics/fbida/fbida_2.14.bb
+++ b/meta-oe/recipes-graphics/fbida/fbida_2.14.bb
@@ -77,4 +77,4 @@ do_install() {
     oe_runmake 'DESTDIR=3D${D}' install
 }

-RDEPENDS:${PN} =3D "ttf-dejavu-sans-mono bash"
+RDEPENDS:${PN} =3D "ttf-dejavu-sans-mono"
--
2.36.1


Gossen Metrawatt GmbH

S=FCdwestpark 15
90449 N=FCrnberg
Germany

http://www.gossenmetrawatt.com
Amtsgericht N=FCrnberg HRB 24 602/USt-IdNr. DE815002769
Gesch=E4ftsf=FChrer: Marcel Hutka, Matthias Wist

Gossen Metrawatt GmbH is a member of GMC INSTRUMENTS-Group

[https://www.gmc-instruments.de/media/mailfooter/mailfooter.jpg]<http://www=
.gossenmetrawatt.com>

