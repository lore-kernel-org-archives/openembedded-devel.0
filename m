Return-Path: <Yogita.Urade@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAC24C77B7A
	for <webhook@archiver.kernel.org>; Tue,  6 Jun 2023 12:05:30 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.6970.1686053123831145519
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 06 Jun 2023 05:05:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=DgadMakS;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=55213888e3=yogita.urade@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 356B1DJu027224
	for <openembedded-devel@lists.openembedded.org>; Tue, 6 Jun 2023 05:05:23 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : references : in-reply-to : content-type :
 mime-version; s=PPS06212021;
 bh=TMHKgld+hQhHc/qSJgvlWKeR1jEdZkTvkodgO8+PSsQ=;
 b=DgadMakSoJKj5ij5HhIKAJNIi7N874JvrS2f3wdULhGqfDWmwpuDGqO0cD9mymN9z2fs
 0SPbm/F5Fx8/HpUnKvjAAoW5RRGUZXXxRdZpEfE0I/q2l6UYWU6OO7olltdSskX2zy/a
 g3GHG7ql05x1mihXE1B/MQ8yeN7ftRna28H6A9nHBynbcwzahYDYu2V5Ok0/Wwf0ZfjV
 U70gqeMS/kbUReTHG6uOBrOXYkveGOPCv6qOjbGgyfUjQ/ZGMAlmWZ7I19aNAFhz4OAb
 JVytkfSTLfj+qIomU4gKPJrEq0iF2cf0SoDt8Zh5jUgQD3nQYGMytpzmoqLWgA1TCnSN rg== 
Received: from nam02-bn1-obe.outbound.protection.outlook.com (mail-bn1nam02lp2049.outbound.protection.outlook.com [104.47.51.49])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3r00t3a91m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 06 Jun 2023 05:05:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QLgwWvlQQam67bm6azTxXBRBBpZSaUNG5y32pTs0Lp1RLGOBMt+wqd/ae+bVjj3UkeAqc24dbMWtMUXXwL/QuEo1V/cFa1l4aLXAIm6naDhVx4EeXUHqTaof4lJzlUf3TX50V6UEhaegmV43KRxYhXDDlfV9QvlGpZ/FSLrw3MCU6Q4EZXLZIT8pUgWPaFpP5UIEGPZwmuBfZ0e1b3CHak0N4xW+pKq3yd5DOL2iXZGNMzutpHU58ie7kUSmUrnu5HMFE/HOZsxztB+UJe61A1tCunKYk91oX3JN/bFGCHiAzxoyvjlOChspF0VQBMmfDAIWzfdicpJiBReXx7aNFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TMHKgld+hQhHc/qSJgvlWKeR1jEdZkTvkodgO8+PSsQ=;
 b=KHOvrvzvmBD6LIa6wlqkZVsHZGpTEb5ghN2UfloqVOTlIzt+1x4/O1wCvh5WdHIrfmgdKP0pMgQV+ZeuQVBHUTmPFwy+3+IaBdSGbTYg9xi3uNCNZZdjANMqUCSp4T8UfUfOUl/dZP44I146k4pH3mU9VBET4pOL1yammUGKMG6/OXx5Bx3+KHdIinbCY2I8lGjWLYKVY3BWMSOLqKLBg+C9QkKP0f41dK65XXF8opuFKWxNL+whshfzzNrHkbd+uiNFdQ+PpuMNO0vGlzpTti73Zs2rZa4k3kEeXOvRCcV3SKFDFdbXw5nywCf9BIgINtWMN3O3vnP2NfdbF34JCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from BL0PR11MB3410.namprd11.prod.outlook.com (2603:10b6:208:33::33)
 by SJ0PR11MB7704.namprd11.prod.outlook.com (2603:10b6:a03:4e7::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.32; Tue, 6 Jun
 2023 12:05:17 +0000
Received: from BL0PR11MB3410.namprd11.prod.outlook.com
 ([fe80::5b2d:ae21:417:55d2]) by BL0PR11MB3410.namprd11.prod.outlook.com
 ([fe80::5b2d:ae21:417:55d2%6]) with mapi id 15.20.6455.030; Tue, 6 Jun 2023
 12:05:17 +0000
From: "Urade, Yogita" <Yogita.Urade@windriver.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [oe-core][kirkstone][PATCH 1/1] webkitgtk: fix CVE-2022-42867
Thread-Topic: [oe-core][kirkstone][PATCH 1/1] webkitgtk: fix CVE-2022-42867
Thread-Index: AQHZmDaiFWmPnTDEOEyHPaGukQn0aa99rWQQ
Date: Tue, 6 Jun 2023 12:05:17 +0000
Message-ID: 
 <BL0PR11MB34105C7AAA71C1792213DDCE9F52A@BL0PR11MB3410.namprd11.prod.outlook.com>
References: <20230606052015.314199-1-yogita.urade@windriver.com>
In-Reply-To: <20230606052015.314199-1-yogita.urade@windriver.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL0PR11MB3410:EE_|SJ0PR11MB7704:EE_
x-ms-office365-filtering-correlation-id: 60274575-cd1c-4dd4-0dad-08db66864b1c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 d4jWFA0HCQK2yALLM+H8xjn/bibDs03Vo7mYyKtHydTJmJXeeKtJRK2q8iSupMvGHKkpMRlzSKb1GSQODgVnaBTYYQnQ9XtrH5xt0w9qvHHR2n2Y9nyCA3qIOu1kQHgUiGaZG9WO0uZIPnVZLqfGYpuYJ2JxFzjBlBtyVXpe3QyPBkVvMXGFdC2IsyareXz7KbxV6Hy3TFmHv8KtR3TUc1lylsXofiv2HqO/QT8VjqnzshEgsRuISFpTLfCBu+2G68RoL5nYToT/n64squTIcG8o82Y0F3a9+cXkxowmJRK0tIyB+Gqf8iT9EwMFP9X3Vyagm25QEGY1Cn/uhiwb47PBIUzDmeFh7tyk+9s3caUg+faRs9HebUx+Dgl+sGq2VrpCt2VLYRaf2T8bZFw8ETXLmUuVPUwDzDbZJHP0P4PddNQItsf6+o5TSSPUDLus5gAB8I364pGPxjlyaHtWxkWxngoOr/fxzTdbScuj97uM2Khex8m4jKjbTVJNVm8Fg+BM2DuHwOR5VCWmKzKBtRJpEINYUTIkE8WDu6E1nNFplQv1YHmJIVVHNM0scsnVcZkcDP28D5EBb8SrkmtKmJ93ukycdP/TlW0b/kQzDKv6mQin83r5EgunJqgVQa1IDwMmPHwWI+hx+1Yc94uTfA==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR11MB3410.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(366004)(136003)(39850400004)(346002)(396003)(451199021)(19627405001)(6506007)(26005)(53546011)(9686003)(83380400001)(122000001)(18265965005)(186003)(2906002)(86362001)(52536014)(33656002)(166002)(316002)(5660300002)(8676002)(55016003)(8936002)(41300700001)(38070700005)(966005)(66476007)(66446008)(6916009)(64756008)(66556008)(76116006)(66946007)(91956017)(38100700002)(478600001)(71200400001)(7696005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?r58pXMXCb+h5rAD1qHNXUv7PQTkP78xF+1DAJC5+NzXu+OsEVUh9MzQLnzch?=
 =?us-ascii?Q?avK858Zn3/HPjeefN4pj/Vbxknhv0odAOzBzhq0++OafSllLeX8zTOSNYXOc?=
 =?us-ascii?Q?w88mb5efvmQCIHpmKvK568t3hfi1mngfLIJ4iCCOjNEa3y4P3GWP7dO2srNS?=
 =?us-ascii?Q?S5CbjgQ4ksy6dDk32dFHzrUH0LSXDn6nn9eEXPuzDqr4d8WTa/JEpPweSjGG?=
 =?us-ascii?Q?/0y5un7a/u1a1YTJgciGNqQ28EWTUAxgh3tZC9+3q43YV8mnj+r5UXfa3gfB?=
 =?us-ascii?Q?bE1aCuyRYAZ39rinIvovnMQsNwTYOtu7I7wtQ7jHfVcjpgkQRFEpTOgMQ5nZ?=
 =?us-ascii?Q?bDZOSZ3VzD1M+QGVqckMiPGTHbXHrjWuQHZ18Uvg6VrVy+XW+afK6iV6bwA8?=
 =?us-ascii?Q?fLNWIvlowjJ8RBk5QxEC5r3aeqqD1c4ERGfehWExtLOWhXrKBkozPKIBMG7a?=
 =?us-ascii?Q?Hzhb79ekY4Ug3IzLjB4GwO92uNQ8b4kjAZGA3/Ie0LiqZzrEI74U+njHBJNF?=
 =?us-ascii?Q?oB3sGWRNAmZga3Vt1V3q++WsO1R50O9gp4NWCDZ3P8CCWqO7tVxdqdd2fwzn?=
 =?us-ascii?Q?BI3h0lpoVFfrPSEPLtKweIJ/K0g6MAdfjK2qIVjYrWxCU6DNXkhj9KDxwPwG?=
 =?us-ascii?Q?fFXwNP1OOIfsokNmQyTuQnwRvVNB/Bs2FYPagolDEdJcAqC5YyofQMhkU8ZL?=
 =?us-ascii?Q?cHhbJ642GRnu3WnCW/wZFCs5PwDR4OWQ9RMzqjIq47T9AnTMgO8aiMKB6TXm?=
 =?us-ascii?Q?1HPY8HrSVXY7haL26OQfxPZtXF4ZLoUXWYMUngX+Ks5pt4c46ETqy8G08q4p?=
 =?us-ascii?Q?RhxJrbTgGul5cziKaXcPYXkY6bXmxUGHlsKYupMZS65E8Os6tiK0kPhxywMy?=
 =?us-ascii?Q?LPilzoV3jnRQ3Zk3Tdj0xZBMaf3a9PCsSX1pvICa4ls39Mc0McRaUpUugEqY?=
 =?us-ascii?Q?gshQiJhKfv9i557tbk3kTNDv+PSkR+YYK9gvtPlCBAKU1slqdJlAQvxPPOab?=
 =?us-ascii?Q?eSpGUkFdvzjlh4DzSMJu3P5evmomAWWApb3hD3DjAeSSisXKkz4IzKEQCWD+?=
 =?us-ascii?Q?WaNCrHCymsMWsIvn3CFApdeD1bLM/zzQLiLiALnCOLz0jdcIVkPiIU9woWLe?=
 =?us-ascii?Q?5wdtK6xn6jeCrcLae9Wnc+rPvr+EK9HMTj5SypQH4qZaZ/PMP9cpDL2pO4Jo?=
 =?us-ascii?Q?M0pZVU819AtxheBGCtcYo9YxaRAFkLrDA0u2CQ4nHYh7DxY0d6qJWUXV7B2R?=
 =?us-ascii?Q?SImgFUw9DmzRahDOLEQiZsqGd2UYBJu6DERMwixWK3PaFGHlCnb875u9ucH2?=
 =?us-ascii?Q?6f816jlq0U7lOU11Z8pt1+9JjFZWWr4gwJbwoDSjL840AgK/Zj5ykpX5YlIl?=
 =?us-ascii?Q?gS7jb4DJRbHlXVaIVbrZzc6+xJk1u5mQhMnHB3Xoa9A5vC6ZkUZzk+77hP5N?=
 =?us-ascii?Q?OtM3u8SgKyJeBxf5HALKU0ip+TKs5YAGP7/4MgQXeAUV1ON2mrM0gwCdM5Ie?=
 =?us-ascii?Q?RowiPa03yVc7+AN0b+hYJQySIWepQGcg8SXufKJoghG/opDM2szYgKn38Fmn?=
 =?us-ascii?Q?j6G3zWjPCdLwjRIs68rg4qmfkNsKtVqqa6Ynw4Y1?=
Content-Type: multipart/alternative;
	boundary="_000_BL0PR11MB34105C7AAA71C1792213DDCE9F52ABL0PR11MB3410namp_"
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL0PR11MB3410.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 60274575-cd1c-4dd4-0dad-08db66864b1c
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jun 2023 12:05:17.4811
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lVqOeIMVPodvGzeOjsOtQXzFzt74gVhhvS6asx+TTVj749B3u5vFPJaStb/wwH9keDirZEWyPKyL/PPDSCFa3McpZrrtwGPm2g51VGJDKm4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB7704
X-Proofpoint-GUID: G_EP_2G1lS6qBVi4qWr4HVBQxKCzR7M4
X-Proofpoint-ORIG-GUID: G_EP_2G1lS6qBVi4qWr4HVBQxKCzR7M4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-06_08,2023-06-06_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 mlxscore=0
 malwarescore=0 mlxlogscore=999 phishscore=0 clxscore=1015 adultscore=0
 bulkscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2306060101
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 06 Jun 2023 12:05:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103141

--_000_BL0PR11MB34105C7AAA71C1792213DDCE9F52ABL0PR11MB3410namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

By mistake, this patch sent to meta-oe.

Regards,
Yogita
________________________________
From: Urade, Yogita <Yogita.Urade@windriver.com>
Sent: Tuesday, June 6, 2023 10:50 AM
To: openembedded-devel@lists.openembedded.org <openembedded-devel@lists.ope=
nembedded.org>
Cc: G Pillai, Hari <Hari.GPillai@windriver.com>; Urade, Yogita <Yogita.Urad=
e@windriver.com>
Subject: [oe-core][kirkstone][PATCH 1/1] webkitgtk: fix CVE-2022-42867

A use after free issue was addressed with improved memory management. This =
issue is fixed in Safari 16.2, tvOS 16.2, macOS Ventura 13.1, iOS 16.2 and =
iPadOS 16.2, watchOS 9.2. Processing maliciously crafted web content may le=
ad to arbitrary code execution.

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2022-42867
https://support.apple.com/en-us/HT213537

Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
---
 .../webkit/webkitgtk/CVE-2022-42867.patch     | 104 ++++++++++++++++++
 meta/recipes-sato/webkit/webkitgtk_2.36.8.bb  |   1 +
 2 files changed, 105 insertions(+)
 create mode 100644 meta/recipes-sato/webkit/webkitgtk/CVE-2022-42867.patch

diff --git a/meta/recipes-sato/webkit/webkitgtk/CVE-2022-42867.patch b/meta=
/recipes-sato/webkit/webkitgtk/CVE-2022-42867.patch
new file mode 100644
index 0000000000..c7d684097d
--- /dev/null
+++ b/meta/recipes-sato/webkit/webkitgtk/CVE-2022-42867.patch
@@ -0,0 +1,104 @@
+From 8747a631dff858a27ab1a75edb7f21658c2962e2 Mon Sep 17 00:00:00 2001
+From: Yogita Urade <yogita.urade@windriver.com>
+Date: Fri, 2 Jun 2023 10:22:34 +0000
+Subject: [PATCH] RenderElement::updateFillImages should take pointer argum=
ents
+ like other similar functions https://bugs.webkit.org/show_bug.cgi?id=3D24=
7317
+ rdar://100273147
+
+Reviewed by Alan Baradlay.
+
+* Source/WebCore/rendering/RenderElement.cpp:
+(WebCore::RenderElement::updateFillImages):
+(WebCore::RenderElement::styleDidChange):
+* Source/WebCore/rendering/RenderElement.h:
+
+Canonical link: https://commits.webkit.org/256215@main
+
+CVE: CVE-2022-42867
+
+Upstream-Status: Backport
+[https://github.com/WebKit/WebKit/commit/091a04e55c801ac6ba13f4b328fbee2ee=
ce853fc]
+
+Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
+---
+ Source/WebCore/rendering/RenderElement.cpp | 27 ++++++++++++++--------
+ Source/WebCore/rendering/RenderElement.h   |  2 +-
+ 2 files changed, 19 insertions(+), 10 deletions(-)
+
+diff --git a/Source/WebCore/rendering/RenderElement.cpp b/Source/WebCore/r=
endering/RenderElement.cpp
+index da43bf3d..eb0a9b4c 100644
+--- a/Source/WebCore/rendering/RenderElement.cpp
++++ b/Source/WebCore/rendering/RenderElement.cpp
+@@ -358,7 +358,7 @@ inline bool RenderElement::shouldRepaintForStyleDiffer=
ence(StyleDifference diff)
+     return diff =3D=3D StyleDifference::Repaint || (diff =3D=3D StyleDiff=
erence::RepaintIfTextOrBorderOrOutline && hasImmediateNonWhitespaceTextChil=
dOrBorderOrOutline());
+ }
+
+-void RenderElement::updateFillImages(const FillLayer* oldLayers, const Fi=
llLayer& newLayers)
++void RenderElement::updateFillImages(const FillLayer* oldLayers, const Fi=
llLayer* newLayers)
+ {
+     auto fillImagesAreIdentical =3D [](const FillLayer* layer1, const Fil=
lLayer* layer2) -> bool {
+         if (layer1 =3D=3D layer2)
+@@ -379,7 +379,7 @@ void RenderElement::updateFillImages(const FillLayer* =
oldLayers, const FillLayer
+     };
+
+     auto isRegisteredWithNewFillImages =3D [&]() -> bool {
+-        for (auto* layer =3D &newLayers; layer; layer =3D layer->next()) =
{
++        for (auto* layer =3D newLayers; layer; layer =3D layer->next()) {
+             if (layer->image() && !layer->image()->hasClient(*this))
+                 return false;
+         }
+@@ -388,11 +388,11 @@ void RenderElement::updateFillImages(const FillLayer=
* oldLayers, const FillLayer
+
+     // If images have the same characteristics and this element is alread=
y registered as a
+     // client to the new images, there is nothing to do.
+-    if (fillImagesAreIdentical(oldLayers, &newLayers) && isRegisteredWith=
NewFillImages())
++    if (fillImagesAreIdentical(oldLayers, newLayers) && isRegisteredWithN=
ewFillImages())
+         return;
+
+     // Add before removing, to avoid removing all clients of an image tha=
t is in both sets.
+-    for (auto* layer =3D &newLayers; layer; layer =3D layer->next()) {
++    for (auto* layer =3D newLayers; layer; layer =3D layer->next()) {
+         if (layer->image())
+             layer->image()->addClient(*this);
+     }
+@@ -937,11 +937,20 @@ static inline bool areCursorsEqual(const RenderStyle=
* a, const RenderStyle* b)
+
+ void RenderElement::styleDidChange(StyleDifference diff, const RenderStyl=
e* oldStyle)
+ {
+-    updateFillImages(oldStyle ? &oldStyle->backgroundLayers() : nullptr, =
m_style.backgroundLayers());
+-    updateFillImages(oldStyle ? &oldStyle->maskLayers() : nullptr, m_styl=
e.maskLayers());
+-    updateImage(oldStyle ? oldStyle->borderImage().image() : nullptr, m_s=
tyle.borderImage().image());
+-    updateImage(oldStyle ? oldStyle->maskBoxImage().image() : nullptr, m_=
style.maskBoxImage().image());
+-    updateShapeImage(oldStyle ? oldStyle->shapeOutside() : nullptr, m_sty=
le.shapeOutside());
++    auto registerImages =3D [this](auto* style, auto* oldStyle) {
++        if (!style && !oldStyle)
++            return;
++        updateFillImages(oldStyle ? &oldStyle->backgroundLayers() : nullp=
tr, style ? &style->backgroundLayers() : nullptr);
++        updateFillImages(oldStyle ? &oldStyle->maskLayers() : nullptr, st=
yle ? &style->maskLayers() : nullptr);
++        updateImage(oldStyle ? oldStyle->borderImage().image() : nullptr,=
 style ? style->borderImage().image() : nullptr);
++        updateImage(oldStyle ? oldStyle->maskBoxImage().image() : nullptr=
, style ? style->maskBoxImage().image() : nullptr);
++        updateShapeImage(oldStyle ? oldStyle->shapeOutside() : nullptr, s=
tyle ? style->shapeOutside() : nullptr);
++    };
++
++    registerImages(&style(), oldStyle);
++
++    // Are there other pseudo-elements that need the resources to be regi=
stered?
++    registerImages(style().getCachedPseudoStyle(PseudoId::FirstLine), old=
Style ? oldStyle->getCachedPseudoStyle(PseudoId::FirstLine) : nullptr);
+
+     SVGRenderSupport::styleChanged(*this, oldStyle);
+
+diff --git a/Source/WebCore/rendering/RenderElement.h b/Source/WebCore/ren=
dering/RenderElement.h
+index f376cecb..d6ba2cdf 100644
+--- a/Source/WebCore/rendering/RenderElement.h
++++ b/Source/WebCore/rendering/RenderElement.h
+@@ -349,7 +349,7 @@ private:
+     bool shouldRepaintForStyleDifference(StyleDifference) const;
+     bool hasImmediateNonWhitespaceTextChildOrBorderOrOutline() const;
+
+-    void updateFillImages(const FillLayer*, const FillLayer&);
++    void updateFillImages(const FillLayer*, const FillLayer*);
+     void updateImage(StyleImage*, StyleImage*);
+     void updateShapeImage(const ShapeValue*, const ShapeValue*);
+
+--
+2.35.5
diff --git a/meta/recipes-sato/webkit/webkitgtk_2.36.8.bb b/meta/recipes-sa=
to/webkit/webkitgtk_2.36.8.bb
index 1dac4f5677..0fce7d0d6e 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.36.8.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.36.8.bb
@@ -17,6 +17,7 @@ SRC_URI =3D "https://www.webkitgtk.org/releases/${BP}.tar=
.xz \
            file://0001-When-building-introspection-files-do-not-quote-CFLA=
G.patch \
            file://CVE-2022-32888.patch \
            file://CVE-2022-32923.patch \
+           file://CVE-2022-42867.patch \
            "
 SRC_URI[sha256sum] =3D "0ad9fb6bf28308fe3889faf184bd179d13ac1b46835d2136ed=
bab2c133d00437"

--
2.40.0


--_000_BL0PR11MB34105C7AAA71C1792213DDCE9F52ABL0PR11MB3410namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
By mistake, this patch sent to meta-oe.</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
Regards,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
Yogita&nbsp;</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Urade, Yogita &lt;Yog=
ita.Urade@windriver.com&gt;<br>
<b>Sent:</b> Tuesday, June 6, 2023 10:50 AM<br>
<b>To:</b> openembedded-devel@lists.openembedded.org &lt;openembedded-devel=
@lists.openembedded.org&gt;<br>
<b>Cc:</b> G Pillai, Hari &lt;Hari.GPillai@windriver.com&gt;; Urade, Yogita=
 &lt;Yogita.Urade@windriver.com&gt;<br>
<b>Subject:</b> [oe-core][kirkstone][PATCH 1/1] webkitgtk: fix CVE-2022-428=
67</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">A use after free issue was addressed with improved=
 memory management. This issue is fixed in Safari 16.2, tvOS 16.2, macOS Ve=
ntura 13.1, iOS 16.2 and iPadOS 16.2, watchOS 9.2. Processing maliciously c=
rafted web content may lead to arbitrary
 code execution.<br>
<br>
Reference:<br>
<a href=3D"https://nvd.nist.gov/vuln/detail/CVE-2022-42867">https://nvd.nis=
t.gov/vuln/detail/CVE-2022-42867</a><br>
<a href=3D"https://support.apple.com/en-us/HT213537">https://support.apple.=
com/en-us/HT213537</a><br>
<br>
Signed-off-by: Yogita Urade &lt;yogita.urade@windriver.com&gt;<br>
---<br>
&nbsp;.../webkit/webkitgtk/CVE-2022-42867.patch&nbsp;&nbsp;&nbsp;&nbsp; | 1=
04 ++++++++++++++++++<br>
&nbsp;meta/recipes-sato/webkit/webkitgtk_2.36.8.bb&nbsp; |&nbsp;&nbsp; 1 +<=
br>
&nbsp;2 files changed, 105 insertions(+)<br>
&nbsp;create mode 100644 meta/recipes-sato/webkit/webkitgtk/CVE-2022-42867.=
patch<br>
<br>
diff --git a/meta/recipes-sato/webkit/webkitgtk/CVE-2022-42867.patch b/meta=
/recipes-sato/webkit/webkitgtk/CVE-2022-42867.patch<br>
new file mode 100644<br>
index 0000000000..c7d684097d<br>
--- /dev/null<br>
+++ b/meta/recipes-sato/webkit/webkitgtk/CVE-2022-42867.patch<br>
@@ -0,0 +1,104 @@<br>
+From 8747a631dff858a27ab1a75edb7f21658c2962e2 Mon Sep 17 00:00:00 2001<br>
+From: Yogita Urade &lt;yogita.urade@windriver.com&gt;<br>
+Date: Fri, 2 Jun 2023 10:22:34 +0000<br>
+Subject: [PATCH] RenderElement::updateFillImages should take pointer argum=
ents<br>
+ like other similar functions <a href=3D"https://bugs.webkit.org/show_bug.=
cgi?id=3D247317">
https://bugs.webkit.org/show_bug.cgi?id=3D247317</a><br>
+ rdar://100273147<br>
+<br>
+Reviewed by Alan Baradlay.<br>
+<br>
+* Source/WebCore/rendering/RenderElement.cpp:<br>
+(WebCore::RenderElement::updateFillImages):<br>
+(WebCore::RenderElement::styleDidChange):<br>
+* Source/WebCore/rendering/RenderElement.h:<br>
+<br>
+Canonical link: <a href=3D"https://commits.webkit.org/256215@main">https:/=
/commits.webkit.org/256215@main</a><br>
+<br>
+CVE: CVE-2022-42867<br>
+<br>
+Upstream-Status: Backport<br>
+[<a href=3D"https://github.com/WebKit/WebKit/commit/091a04e55c801ac6ba13f4=
b328fbee2eece853fc">https://github.com/WebKit/WebKit/commit/091a04e55c801ac=
6ba13f4b328fbee2eece853fc</a>]<br>
+<br>
+Signed-off-by: Yogita Urade &lt;yogita.urade@windriver.com&gt;<br>
+---<br>
+ Source/WebCore/rendering/RenderElement.cpp | 27 ++++++++++++++--------<br=
>
+ Source/WebCore/rendering/RenderElement.h&nbsp;&nbsp; |&nbsp; 2 +-<br>
+ 2 files changed, 19 insertions(+), 10 deletions(-)<br>
+<br>
+diff --git a/Source/WebCore/rendering/RenderElement.cpp b/Source/WebCore/r=
endering/RenderElement.cpp<br>
+index da43bf3d..eb0a9b4c 100644<br>
+--- a/Source/WebCore/rendering/RenderElement.cpp<br>
++++ b/Source/WebCore/rendering/RenderElement.cpp<br>
+@@ -358,7 +358,7 @@ inline bool RenderElement::shouldRepaintForStyleDiffer=
ence(StyleDifference diff)<br>
+&nbsp;&nbsp;&nbsp;&nbsp; return diff =3D=3D StyleDifference::Repaint || (d=
iff =3D=3D StyleDifference::RepaintIfTextOrBorderOrOutline &amp;&amp; hasIm=
mediateNonWhitespaceTextChildOrBorderOrOutline());<br>
+ }<br>
+<br>
+-void RenderElement::updateFillImages(const FillLayer* oldLayers, const Fi=
llLayer&amp; newLayers)<br>
++void RenderElement::updateFillImages(const FillLayer* oldLayers, const Fi=
llLayer* newLayers)<br>
+ {<br>
+&nbsp;&nbsp;&nbsp;&nbsp; auto fillImagesAreIdentical =3D [](const FillLaye=
r* layer1, const FillLayer* layer2) -&gt; bool {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (layer1 =3D=3D layer2)=
<br>
+@@ -379,7 +379,7 @@ void RenderElement::updateFillImages(const FillLayer* =
oldLayers, const FillLayer<br>
+&nbsp;&nbsp;&nbsp;&nbsp; };<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp; auto isRegisteredWithNewFillImages =3D [&amp;]() =
-&gt; bool {<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for (auto* layer =3D &amp;newL=
ayers; layer; layer =3D layer-&gt;next()) {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for (auto* layer =3D newLayers=
; layer; layer =3D layer-&gt;next()) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; i=
f (layer-&gt;image() &amp;&amp; !layer-&gt;image()-&gt;hasClient(*this))<br=
>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; return false;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+@@ -388,11 +388,11 @@ void RenderElement::updateFillImages(const FillLayer=
* oldLayers, const FillLayer<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp; // If images have the same characteristics and th=
is element is already registered as a<br>
+&nbsp;&nbsp;&nbsp;&nbsp; // client to the new images, there is nothing to =
do.<br>
+-&nbsp;&nbsp;&nbsp; if (fillImagesAreIdentical(oldLayers, &amp;newLayers) =
&amp;&amp; isRegisteredWithNewFillImages())<br>
++&nbsp;&nbsp;&nbsp; if (fillImagesAreIdentical(oldLayers, newLayers) &amp;=
&amp; isRegisteredWithNewFillImages())<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return;<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp; // Add before removing, to avoid removing all cli=
ents of an image that is in both sets.<br>
+-&nbsp;&nbsp;&nbsp; for (auto* layer =3D &amp;newLayers; layer; layer =3D =
layer-&gt;next()) {<br>
++&nbsp;&nbsp;&nbsp; for (auto* layer =3D newLayers; layer; layer =3D layer=
-&gt;next()) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (layer-&gt;image())<br=
>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; l=
ayer-&gt;image()-&gt;addClient(*this);<br>
+&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+@@ -937,11 +937,20 @@ static inline bool areCursorsEqual(const RenderStyle=
* a, const RenderStyle* b)<br>
+<br>
+ void RenderElement::styleDidChange(StyleDifference diff, const RenderStyl=
e* oldStyle)<br>
+ {<br>
+-&nbsp;&nbsp;&nbsp; updateFillImages(oldStyle ? &amp;oldStyle-&gt;backgrou=
ndLayers() : nullptr, m_style.backgroundLayers());<br>
+-&nbsp;&nbsp;&nbsp; updateFillImages(oldStyle ? &amp;oldStyle-&gt;maskLaye=
rs() : nullptr, m_style.maskLayers());<br>
+-&nbsp;&nbsp;&nbsp; updateImage(oldStyle ? oldStyle-&gt;borderImage().imag=
e() : nullptr, m_style.borderImage().image());<br>
+-&nbsp;&nbsp;&nbsp; updateImage(oldStyle ? oldStyle-&gt;maskBoxImage().ima=
ge() : nullptr, m_style.maskBoxImage().image());<br>
+-&nbsp;&nbsp;&nbsp; updateShapeImage(oldStyle ? oldStyle-&gt;shapeOutside(=
) : nullptr, m_style.shapeOutside());<br>
++&nbsp;&nbsp;&nbsp; auto registerImages =3D [this](auto* style, auto* oldS=
tyle) {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!style &amp;&amp; !oldStyl=
e)<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return=
;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; updateFillImages(oldStyle ? &a=
mp;oldStyle-&gt;backgroundLayers() : nullptr, style ? &amp;style-&gt;backgr=
oundLayers() : nullptr);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; updateFillImages(oldStyle ? &a=
mp;oldStyle-&gt;maskLayers() : nullptr, style ? &amp;style-&gt;maskLayers()=
 : nullptr);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; updateImage(oldStyle ? oldStyl=
e-&gt;borderImage().image() : nullptr, style ? style-&gt;borderImage().imag=
e() : nullptr);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; updateImage(oldStyle ? oldStyl=
e-&gt;maskBoxImage().image() : nullptr, style ? style-&gt;maskBoxImage().im=
age() : nullptr);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; updateShapeImage(oldStyle ? ol=
dStyle-&gt;shapeOutside() : nullptr, style ? style-&gt;shapeOutside() : nul=
lptr);<br>
++&nbsp;&nbsp;&nbsp; };<br>
++<br>
++&nbsp;&nbsp;&nbsp; registerImages(&amp;style(), oldStyle);<br>
++<br>
++&nbsp;&nbsp;&nbsp; // Are there other pseudo-elements that need the resou=
rces to be registered?<br>
++&nbsp;&nbsp;&nbsp; registerImages(style().getCachedPseudoStyle(PseudoId::=
FirstLine), oldStyle ? oldStyle-&gt;getCachedPseudoStyle(PseudoId::FirstLin=
e) : nullptr);<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp; SVGRenderSupport::styleChanged(*this, oldStyle);<=
br>
+<br>
+diff --git a/Source/WebCore/rendering/RenderElement.h b/Source/WebCore/ren=
dering/RenderElement.h<br>
+index f376cecb..d6ba2cdf 100644<br>
+--- a/Source/WebCore/rendering/RenderElement.h<br>
++++ b/Source/WebCore/rendering/RenderElement.h<br>
+@@ -349,7 +349,7 @@ private:<br>
+&nbsp;&nbsp;&nbsp;&nbsp; bool shouldRepaintForStyleDifference(StyleDiffere=
nce) const;<br>
+&nbsp;&nbsp;&nbsp;&nbsp; bool hasImmediateNonWhitespaceTextChildOrBorderOr=
Outline() const;<br>
+<br>
+-&nbsp;&nbsp;&nbsp; void updateFillImages(const FillLayer*, const FillLaye=
r&amp;);<br>
++&nbsp;&nbsp;&nbsp; void updateFillImages(const FillLayer*, const FillLaye=
r*);<br>
+&nbsp;&nbsp;&nbsp;&nbsp; void updateImage(StyleImage*, StyleImage*);<br>
+&nbsp;&nbsp;&nbsp;&nbsp; void updateShapeImage(const ShapeValue*, const Sh=
apeValue*);<br>
+<br>
+--<br>
+2.35.5<br>
diff --git a/meta/recipes-sato/webkit/webkitgtk_2.36.8.bb b/meta/recipes-sa=
to/webkit/webkitgtk_2.36.8.bb<br>
index 1dac4f5677..0fce7d0d6e 100644<br>
--- a/meta/recipes-sato/webkit/webkitgtk_2.36.8.bb<br>
+++ b/meta/recipes-sato/webkit/webkitgtk_2.36.8.bb<br>
@@ -17,6 +17,7 @@ SRC_URI =3D &quot;<a href=3D""></a>https://www.webkitgtk.=
org/releases/${BP}.tar.xz \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://0001-When-building-introspection-files-do-not-quote-CFLAG.patch"=
>
file://0001-When-building-introspection-files-do-not-quote-CFLAG.patch</a> =
\<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://CVE-2022-32888.patch">file://CVE-2022-32888.patch</a> \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://CVE-2022-32923.patch">file://CVE-2022-32923.patch</a> \<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"fi=
le://CVE-2022-42867.patch">file://CVE-2022-42867.patch</a> \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;<b=
r>
&nbsp;SRC_URI[sha256sum] =3D &quot;0ad9fb6bf28308fe3889faf184bd179d13ac1b46=
835d2136edbab2c133d00437&quot;<br>
&nbsp;<br>
-- <br>
2.40.0<br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_BL0PR11MB34105C7AAA71C1792213DDCE9F52ABL0PR11MB3410namp_--

