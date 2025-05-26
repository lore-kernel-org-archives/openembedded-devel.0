Return-Path: <san@skov.dk>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 621F7C54FB3
	for <webhook@archiver.kernel.org>; Mon, 26 May 2025 13:51:32 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.132])
 by mx.groups.io with SMTP id smtpd.web10.28941.1748267490146272748
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 26 May 2025 06:51:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@skov.dk header.s=selector1 header.b=fQMrI64J;
 spf=pass (domain: skov.dk, ip: 40.107.22.132, mailfrom: san@skov.dk)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DFvpgeWaA3SqMUJMjAY5INAG3h2jdA1uqcaeYkYzpnYNdNU0yEZImX/byBC/fb63fEz7CUO6PRLL3gQc/ZL9t8Teut5BJJrpiYAPdnn4vuSCSsCt2fuTFAv6N3B8aU78Y+EQibQTN8jKzOoVNGMsj47Kf9aB2oHFZhZdF+8zg7+djgbZgVOzrt7rQkO58rt7uB5Jae8QdVypkwx1xOL6n7z7fTPaqp6nch6tyoz0fTylYxHH3CFNsIcwLXgTkQslP0yTYE7qGgKdgs1WR1auBJKkhdnKVRtq6s/x8QA/lOk+8AsbSnObl71A7CIjuXDbaulpAnQaYD0UEX1AWRAnMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ek+T7B1XXrjXSLUBcNO/sqajshI3iDAJKL4s+aZRGRo=;
 b=YSsA+trMy0n5Jj7QqdFbKxyWz/zLGHtJCJ9PTKvRAoIWNyYy8tT9CjCR2JeY7T4NMNDv7uQsGV5Qg7nJe2cqCYWFeFZrjMF3FIBMrGFr2grvutZlBYzB3mEnAfGhTs564H4cTcDQQRGX1veMPVkrI2pBnA+SPlfHdQP87nAHNU8ttWsUipsP3XMw/VtP8Ax3spaABLcGyJ2XJ4HhzNWcxCUT6fvt2WDB8XKlMEv7/qks5Twl/DwvYC4V6uy4qv3l5X8fCFax2Rku74MpD5fqsmXbWfH6NGE6iOhx7d+NzWjZ/0ALWMU9DxMEiF+X23adUhVcUm6zY5xgxOJuUXWByA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=skov.dk; dmarc=pass action=none header.from=skov.dk; dkim=pass
 header.d=skov.dk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=skov.dk; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ek+T7B1XXrjXSLUBcNO/sqajshI3iDAJKL4s+aZRGRo=;
 b=fQMrI64JvBj/MKLz29CW2GkNyA6qxLat+qRMYCCiHzslivrI6mnbMpjBVFuiszUtiT1RmUddTDSG/kXOrs8PHJq2Z1nyUAejnywDIQjDmsA0JDktnNJrtl+1flM8b4rWKtvhk/tMaQTyAFJoa/0wp75gkSgUjbe5uUST+1Op4A8=
Received: from AM6PR0402MB3429.eurprd04.prod.outlook.com (2603:10a6:209:6::22)
 by AM9PR04MB8890.eurprd04.prod.outlook.com (2603:10a6:20b:409::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.24; Mon, 26 May
 2025 13:51:25 +0000
Received: from AM6PR0402MB3429.eurprd04.prod.outlook.com
 ([fe80::9561:f7c4:dea8:ebcd]) by AM6PR0402MB3429.eurprd04.prod.outlook.com
 ([fe80::9561:f7c4:dea8:ebcd%4]) with mapi id 15.20.8769.025; Mon, 26 May 2025
 13:51:25 +0000
From: =?iso-8859-1?Q?S=F8ren_Andersen?= <san@skov.dk>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: [meta-python][PATCH 2/2] python3-canopen: Add recipe
Thread-Topic: [meta-python][PATCH 2/2] python3-canopen: Add recipe
Thread-Index: AdvOQ/J4MNutDCxcT/ObSG7AVd0MsQ==
Date: Mon, 26 May 2025 13:51:25 +0000
Message-ID: 
 <AM6PR0402MB34293AE8347092C51BCA8B92A665A@AM6PR0402MB3429.eurprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=skov.dk;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM6PR0402MB3429:EE_|AM9PR04MB8890:EE_
x-ms-office365-filtering-correlation-id: e6765c0b-a6a1-4492-34fb-08dd9c5c6807
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: 
 =?iso-8859-1?Q?H1vvMlFClEcQ8LbS9lpz9C+QI35qrIAyHhGvPTLyjoSU997dsa3fIbV+nW?=
 =?iso-8859-1?Q?nbUMle7RkRCKV5qA3d2QJlwWRT8c+nlHl5SK56+6acC05RP7cmmcdes/k1?=
 =?iso-8859-1?Q?fDd33dSsJOndttznSyxfkv3nMk5JuTueujihGuk+/WwR0jy7pbzcU+Pg7X?=
 =?iso-8859-1?Q?h9WaAkq4tyvKCYtWxjCeAOxF0oaBJQC+1pKTlhB43IeBfMoYsvoQGeuwCu?=
 =?iso-8859-1?Q?HhtIZG2FRAhgNQGMQObyaqcOmONGNtagfZCIEe0O/QJDxm0sV7E5iFtge6?=
 =?iso-8859-1?Q?sLLAc03/VN71Kbdh+ltYVsEeUAk4hSMPQ/9AI32fqwH/qBDihMIDrR7aoQ?=
 =?iso-8859-1?Q?p7FCLFAWyezR77lQ3kyq3Ae5Ngp3FYFRn7BY8GcfWSiFYhj9CqXhsHPEIO?=
 =?iso-8859-1?Q?mMJc/fef0y21IksgOtaEV9tiO69aPGq6WpApqqj0sY+dcqbWN2Ml/VyHK/?=
 =?iso-8859-1?Q?UaAlHm8bYD/QXiePfFEcIs3E8XOcgnFNeXB3yQtPErfWPGdWWf3tJ9NPRT?=
 =?iso-8859-1?Q?7nJrl5UYiptApxv5pWsPMUpnU45iaFXsLJ3Y7V9cazPHteF14iigOm28Gp?=
 =?iso-8859-1?Q?gaFpcJulAr/jM+n1xt/mvj901mUz0RBMx7zx1/CmZ6k0b+ZS9oGc2+Nr3T?=
 =?iso-8859-1?Q?cqpPgdj62WHyISFKHskNMDso9QqCpcppb6GyhdLIUZERxzjqVbguCpQ7o2?=
 =?iso-8859-1?Q?G9agbWz3wVc2NC3FzZFw0TGK+2iLNh9iajb99wx/MXNk2YEzZrP+soWaOn?=
 =?iso-8859-1?Q?6rFIg7HBoW8JeXaGa8TMnb7Zgg3igIPwt2pvNQS7g3iBp3C8YbapI3OvXU?=
 =?iso-8859-1?Q?syQVRp6Nzs3khpdMsDeiI6/8BX5O5excL6hCbhFnoCjtEj6YH50YRLeF72?=
 =?iso-8859-1?Q?x2aYEe6O7/6AYgiJ4q4gi2MGAVnlAMFq2vCr2YML/LaI++oqpGOLGwR2hc?=
 =?iso-8859-1?Q?aEdiG23u4J3eS/nsdOkK7i7YjFasyn5sbf1iBM8SeEYjxcuKQrZrX6aonu?=
 =?iso-8859-1?Q?rNS1+xOdpup+VRaAkbcj6yZMPZTwMVnox+Pt5VVuTkvikgiu7xjLXgJskJ?=
 =?iso-8859-1?Q?xwSV7wizg0AatjrpEF5xwlr59SguRk1cvS060hhraQGBkytkT/nmW8s+Js?=
 =?iso-8859-1?Q?rTr6SD3p7545xbAJvhoCl0IR60T50JnRh4L8kwP5i7qacnJyg+/Nyt5w/K?=
 =?iso-8859-1?Q?H9Fo6eYN7frJI7il9NaIfAWke1GShSdQFyLH0kQf96X231Hyw9kJ8TiuRe?=
 =?iso-8859-1?Q?pdLZIatHerlrXDhLgTxflXQHhozo227164qPNvA/Gm6CLutBDwIdfzVjC3?=
 =?iso-8859-1?Q?FbqaB+Mp5U6OGYBYTxYDm3mHOWXLSB8aB4IzM+cHw2c1k/4TFq+sLNVlS/?=
 =?iso-8859-1?Q?m+8B575wb4YVQPVxYvlRdKFRm7qyErFja+BeD6LcqKPX7WeoHSEerEjS4C?=
 =?iso-8859-1?Q?QzG7Bqh8NBD7zID9BiQxtF9l86y5Ip37TB7WyE9/dojzd2sxPvobNNGL7m?=
 =?iso-8859-1?Q?ZxqNAiFVQznXEbtSV5Bhye0Eaw5iBCgMR4f60GWtPffYxYPmQn7joIz7Xq?=
 =?iso-8859-1?Q?/SPuEWo=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR0402MB3429.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?65BvDg9JxpVbQNPj45aqS323JXVu82Q9XzmkzxpzbCGntoK8t7dm+GLCzi?=
 =?iso-8859-1?Q?z5S8F/7aVh3wUOVA8y81X/sTL5tRUmzmOUroIQvv296OLE4xoVLJBQSpFS?=
 =?iso-8859-1?Q?g2CSUrYTqGxV+E91KKO9csPhfMHDaMi4qVDeTpVx3HEJ8QeA+VwbXy6n11?=
 =?iso-8859-1?Q?xBmK9dhp+pREtR5jNuV4+Ckp2N41VEOT2tnj2I8n/19cBdJRSUuvG5AKjK?=
 =?iso-8859-1?Q?Fvu62AuZvLh3hCrV36KAa3V+dvchWtXN+TRNxzks7G8DaUt72AU7Kws/b8?=
 =?iso-8859-1?Q?8NoOWHUQK0e6rqZLN+PMUZa+7DEUGR2bpe+vnC77pE/F4J5ZknthLXUZ4A?=
 =?iso-8859-1?Q?uIJSVAu+8l+vtncdF+Dc5+qx6Pl8iEDtlKqX00s3M905CJpdDmzwlRGVY7?=
 =?iso-8859-1?Q?ynrEGUM2cRtQKgQjbxZgeAdlXD6NqMlmA6/sNW8uRHk8NtB7vA54BOxB+z?=
 =?iso-8859-1?Q?1vJEMzYormI/J3ck6QRHrFCB8TTiBKt8HEZTw19vNq2AggelzSCIzvaNfP?=
 =?iso-8859-1?Q?prWg2VVvJaTsp49Or+4Cti6AHU7Rg5wKIgsFVqRpz6M8SA8v8NPGGNcafE?=
 =?iso-8859-1?Q?OGWASjNn43+qWQFDhHVouJdp6xapP87IXmGVUgsAxqOkMYsxp8xw8O63At?=
 =?iso-8859-1?Q?8AcJIy6uKizP5A82ddW7pc3QhK8grLp5S77DUpnpFhlxNAcGdbm3K7A/oc?=
 =?iso-8859-1?Q?eaYqms543QDTLGWSkrzspZ0CohtEhRlPfGl0eHTcB8UBvylQFBAbNiWXsv?=
 =?iso-8859-1?Q?B/XSxs3OjBC90AvTN0Rv/jdy/bI+lxS17OCkFyz5/xeWNd1X3LPv6fq4JF?=
 =?iso-8859-1?Q?ij1A/YokHw9jceIdPcy1eoa1W+TCGXuxzJcuyNQgr6FERfE3Hbi9jBLH28?=
 =?iso-8859-1?Q?XpflbyXvmirphRNNb9VUSrAzriA+SaD4HwPnJQKnkhFk2FdpNhCvrDbffl?=
 =?iso-8859-1?Q?VajD8EaUw8SEt6rk6rpvczJi8PcSrLWlk9sbZtUvT94+PNmIDn735oVncb?=
 =?iso-8859-1?Q?ELABjLjXZeL6FsMa6qVIkmQiTolZNQ+mbvT8SXz7iaJpmt+c3MhxoqHJr5?=
 =?iso-8859-1?Q?z3yqT7ZeTRKLDpudfW4mC9UdX6fS1fNAcHwPAP9+LpdWe8qEEol0mXXrsj?=
 =?iso-8859-1?Q?PC7mLXFvstqUer3w0t11kWg0PfWaAixLpb54XqiMzUg/Fb+Q9dfXFdsrTK?=
 =?iso-8859-1?Q?lOkq/mkqaN2MKLDoDG+FgAF1qVmumbhSZdzbLQvh/KVykozM9W2sarSx//?=
 =?iso-8859-1?Q?pbz3euK+/NWSang5KR7qIkLau3ZI2pi0MPHR+tkAi2Awf5B+PskU9pQhNL?=
 =?iso-8859-1?Q?a89uw9fZQ9W+tcPOsv6LoJ32IXhhxzedVEHIKDNL+s1jN3K1soFb9hxt9n?=
 =?iso-8859-1?Q?P3huwmjYBkyVU83fGEBmwFCLRaKcPOyemCZ2wVbMicCZv6GMty2sTjrpmN?=
 =?iso-8859-1?Q?ebRvkqLr17/vrHrgzki15QTZ6mJFT7MPegg2OGqYzc4pn5+9QPB0rcIpd8?=
 =?iso-8859-1?Q?1u7p20ksbGTP12YSgxGSWwTYxGfPF5rJA9MDJoePTuK81ys1FyejyTpNqX?=
 =?iso-8859-1?Q?bvdPpY0UYdM8sbFl6e4IU1p3F0LOfMfurQaqCxX8JtL0qSzlqw=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: skov.dk
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM6PR0402MB3429.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e6765c0b-a6a1-4492-34fb-08dd9c5c6807
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 May 2025 13:51:25.2615
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 2bb8f3d2-db94-422a-b8ad-e4a4aa412414
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iBIjRXt5RJmtpr3Uk2Sp4xqmuTnqdw9OaKSyoSONybW2RFzQEMMvLk0xwmBNqQ4O
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8890
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 26 May 2025 13:51:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117627

Add the python based canopen protocol.
It make it easy to work with CANopen based devices

Signed-off-by: S=F8ren Andersen <san@skov.dk>
---
 .../python/python3-canopen_2.3.0.bb               | 15 +++++++++++++++
 1 file changed, 15 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-canopen_2.3=
.0.bb

diff --git a/meta-python/recipes-devtools/python/python3-canopen_2.3.0.bb b=
/meta-python/recipes-devtools/python/python3-canopen_2.3.0.bb
new file mode 100644
index 0000000000..6efd74baa9
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-canopen_2.3.0.bb
@@ -0,0 +1,15 @@
+SUMMARY =3D "CANopen for Python"
+HOMEPAGE =3D "https://github.com/christiansandberg/canopen"
+LICENSE =3D "MIT"
+LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3D97f135a6ee6f800c377b5512122=
c7a8d"
+
+SRC_URI[sha256sum] =3D "792084a93c138d5b2a406ddd2d4eb5ce208f03bd8fda60f81a=
d2bb8d56c6b827"
+
+PYPI_PACKAGE =3D "canopen"
+
+inherit pypi setuptools3
+
+RDEPENDS:${PN} +=3D "\
+  python3-can \
+  python3-canmatrix \
+"


