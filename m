Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2708C55182
	for <webhook@archiver.kernel.org>; Mon,  3 Aug 2026 14:19:18 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.1])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.44172.1785766647382335015
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 03 Aug 2026 07:17:30 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=Gow5UhvI;
 spf=pass (domain: est.tech, ip: 52.101.66.1, mailfrom: adarsh.jagadish.kamini@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L23rabZmKerS+i6bg3a1Mq4L4f5/DQBegm/lSyrKRmisB92nK6Vz5BClOgJYdoj+/IngFEnVlzSl35DPMjHlfPjjvpAK6p1S+TXtuyl3X0qAmEucsfbB2sSXPnFuhN5dvSJlmryJsI4rVseqL6d55lI6EcLAy3wGaCIKz3Vw99aD0GZkrWZK1AgcgoqZB15cujKlwaueL35rGI2ROcp7Om5FrsMW6qEh8HtpA3alxKp5awfglwLZvJNNrUk/FqDikrwsjJia5MdaUoxevLNYgviTjrzAbu02LowXNAcn12ho1xWpKkwT5qpzp+SFZsdLOQ/rPcvoGp5kGsUx/coCqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+p8aK5fyo1zc6tdJjVXL+uIkz6vgTzzArLknJBePU/g=;
 b=yX9p0UgWXvliSRV5PP+FFqfdkNmIaLGTsaRyLxsngJLET/dzMJ6bdrBjOaOBy9LZgQb8Tp4+QRH5XffkXT6npc75pJZa/tkjkHdSzGfgnesPjprsPyNFfLZ6Dy+mZcBvhZX7JCza6k6FxiJ8+EZlnc+sphIINBDuWiTiRvr36gk7RRQof3RxnDy2CpJBwPNsJKxCovKAlOroqDcJwgTuvMg6w3REiKt0IQqhwlm0fmaHQ/iYVqCmJz8PM7Xo001lDfX0s+fmMjfhPKfGr16m29+DVq+T2sEEm2rQKOSH75X1cAbBeeztgeLImOgoRu9RdVUPM5vloha9rsfir2O8pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+p8aK5fyo1zc6tdJjVXL+uIkz6vgTzzArLknJBePU/g=;
 b=Gow5UhvIrz5tBuMOBE6hjxz3/Xm8HRxK1daVVgEA1sc2/h9j1SxzgEafWy6EvSLamespdBa21pHZAzSuXHfJsN5sR54yf46F1/QlKLtV80al7r33jhusYZwBxpbLiZwmUahgHAoqNghItui2KjcsiAsIrYNwTb+ZqUFPhnALS+p/HEVbMJO4d8Hnvp47gVy1Gn84d3xHTI/7FecBAHvVvkkAq4IVB2dvoJSh2MmyK9A24yb80u039XQgJhiMHVm+daoASM9m64A7KLPZp1zb/c3elCMJ6b3bPXiDCkpgDJ0/xQPS6iICd1g14nEM/n2Qos4JD1/EdIk5Pb6nRPanvA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AS8P189MB1672.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:396::9)
 by DU0P189MB1820.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:344::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.13; Mon, 3 Aug
 2026 14:17:26 +0000
Received: from AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 ([fe80::f147:85e5:34de:eeff]) by AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 ([fe80::f147:85e5:34de:eeff%4]) with mapi id 15.21.0292.012; Mon, 3 Aug 2026
 14:17:26 +0000
From: "Adarsh Jagadish Kamini" <adarsh.jagadish.kamini@est.tech>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][scarthgap][PATCH 3/3] thrift: fix CVE-2026-48144
Date: Mon,  3 Aug 2026 16:17:12 +0200
Message-ID: <20260803141716.853285-4-adarsh.jagadish.kamini@est.tech>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260803141716.853285-1-adarsh.jagadish.kamini@est.tech>
References: <20260803141716.853285-1-adarsh.jagadish.kamini@est.tech>
X-ClientProxiedBy: DU2PR04CA0326.eurprd04.prod.outlook.com
 (2603:10a6:10:2b5::31) To AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:396::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8P189MB1672:EE_|DU0P189MB1820:EE_
X-MS-Office365-Filtering-Correlation-Id: d519952d-71d0-4e58-cfba-08def169f188
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|23010399003|366016|1800799024|13003099007|56012099006|10067099003|11063799006|12006099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	fyorCwcEdCN7huLlzBgzkqZahl0Has6+X8CULAg2YbxgYjIZ6FIGOaQv4M/vWZ8cU755uPkBmTt+7y0fVdqd/3VMSHv45FmwhqQqk5d0dily6xx0m2NzMMVTPJrsTzGI98oU0ElHuYMDpiJvapaIWAdz7f/ZxLKZFycFW+sC5m7nGu0H2h+HV2ISN9f+83Q1fJzxmqpn6wHKpWsiL7Q8hC8LoRH5XXGVSzdW5Bqor6NiSkOJFL76Hj29EJqPxYApbAh6zRZxMP71gA2MMfO8QvgNf2OOXqKJOrrY+vrHU2WAADQNtgbP+ypA6VXTN5GdlRe2gYdI3EaVu542O+Fjgy0xQIyUQiuxyodF9LK3tFoIguSTcOubKLvL5gcMNDALoZ4Kana0L3/GO9VVKwYe9/lD5jxi9wFO2sKcEOMTRrqI4whDb/GW/qFMYcc/6EwFsUP4iScwWd6hI8SqqG/kStgAuy0xc1JMKkbh1OsbTnycyD+lyaTqFrhDExqj+bpDTrZ507zKNCA8GaZYIltfKwoGn+rt7DdgYXaVflv7mO5HhmBd6cqkpXf7qnqZ8Lw7y1fS5CSQefZJyAFp+/Fa7z60mr8PWX6moWebrr9+3mAHJUYDFDjkGddp8qgZ0C/3UOwpvK2PkrL+YdHq89TjGhriYLTX3Z6ws2D07klB6w0=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8P189MB1672.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(13003099007)(56012099006)(10067099003)(11063799006)(12006099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?cEkMXPQXX/7/ckJMhBNWZnaOkUMulEtBxR2Be44VdfZAcvKm8qizTnX94Nn1?=
 =?us-ascii?Q?CzdhkNCb9Iw1EvjkKQTFyBicjyZ/gnSOSvhEcJfmgjQV87Uyt6J+mPqmF10F?=
 =?us-ascii?Q?6MQNyJqhhvlhChJVNfsuni+5Dm75u+SQqQ5SWBWpa+8GBsN9ZmR7MJYOGjwx?=
 =?us-ascii?Q?MPAYQj9o96hxh37hO5YLvSm5ileZ0UUtvnBPbtTDFgVTpYzsKMWvcTkyvBoz?=
 =?us-ascii?Q?XOGkVWZlDUpp1imQxjY3sy8NGG3sHpcqEFrOjHmKomyYA+nNDErcXH4McRpM?=
 =?us-ascii?Q?WZNg5/rZT5cT71LglqOwY0+vXEm3RSEK094/6t7NbHQJNPva1AbeG5T7NOEc?=
 =?us-ascii?Q?Ncyl+Vq5+YkiR7dKJV/55wP2rvoSdh6KvlQ9Ra6aT6J0djXX5PIYqEoxWhqD?=
 =?us-ascii?Q?bvdDi2XMUMzQknOcHW4dlhWB02VJm3LdvhlspspE4SRXG4YTMsYENtTRElRp?=
 =?us-ascii?Q?jTcj4z4f4QYAL/jzE+uMVfwxLL2VgenrzXZTwF7P20jWY8NCGgU64DOPZpIy?=
 =?us-ascii?Q?2GO7JshMLPApXJ30CRi+d/4pyZlB5xXf6WfCoPjCkBp6bAz2ycozmp33Fw5r?=
 =?us-ascii?Q?SvCRBoDZ6QdF+xZcmnzf50nA2dY1+RZu5A1By8auRCns0bwQHvg/b8SP0VM1?=
 =?us-ascii?Q?X8JggLOieLxIJOUimBdE81STAfR7JuMOT+BtR3JxWWLUj5ooocq9GAUR+kXc?=
 =?us-ascii?Q?m2Yg9ydn7mukpm1AXc+aE5dLg/3uHEOxxmL44ZX28o05tbYwZQfxWbRIqHwD?=
 =?us-ascii?Q?OaESXddggSJVHt9vNgRL+8RAVkoOqmU18bmRKFr1L2Tuh3Pi3qNztmIDaYyg?=
 =?us-ascii?Q?uhUrvle+zOz1xL/4CQuChsBL8E/YHmds+DA0HmZ1pKHlTe7LX56sStXqD/gq?=
 =?us-ascii?Q?WDvZtJFDnUntoaMtsNo8qYrroMej6nQLP5RprolW8Y33madVt8Er5cdrFp8E?=
 =?us-ascii?Q?Aut+eJe6wibh2EFW5/wtnD4qvxdIMBzVIggXPxfZwKj0w0Rr2Mgr2czuq5Az?=
 =?us-ascii?Q?gjXLfJFfjG3VWccS7VWk9o4xBQlOO0oNDFOOyuZ4Bji2SbK59xbCqdE+8O+m?=
 =?us-ascii?Q?+nPeEDGXqpgPonSIU83NuncpUpEtrdnuYSRPTIMCqnlwLZ1kCInLOBSx7Uzw?=
 =?us-ascii?Q?7/dilqijcTfXu5KR2IHFzEmYt66H5O1qeYSFngaek/+76IyMReCy2Q5d+Cll?=
 =?us-ascii?Q?FYXm+tZOjJx87jmQK2jg6fh1ZlTT2pe44D3KmuOKVqJz1W9fwk2NNc/1dbcJ?=
 =?us-ascii?Q?P1AjMhL09mqjdVyleki3tzANXLyz/MfOKSkqqo3PaYr4Pc49aXbRgWIKa51N?=
 =?us-ascii?Q?pIGLfXBJz0HyY1bVTSHy5RzLdxz9PfHQL4ItL9drVra1PsqYQ8lVn9lfBtLR?=
 =?us-ascii?Q?vO5rTyJ2w4lK/ORzlZRhCjqtKzEXh5GF+FYDys1KxMvUnU4BtzdFokDid1Px?=
 =?us-ascii?Q?I1E4qjjHbKmlKZqhpQiL0sGZU06pTpIzTBm6xBmZmAA5B85p305biY3rtWuE?=
 =?us-ascii?Q?L8+pE1oKYGfbD1C/co3DeX4X1EU+Df3WyJUh99B1r8JVBf+wa69GUPtj2RRA?=
 =?us-ascii?Q?RLOjXdrJCZh4d6b75IFCa4V+sua2iiwa3GN+sTjV9R/fhew9FFgEP18++ffe?=
 =?us-ascii?Q?abBoFTqHnQBsG3tpum2ehKSMwlVMxRDSVfVZ49ewDGZ+RUf4lEVnbtiE6cxX?=
 =?us-ascii?Q?g3/J+vST9mVNj22eLh31Y/K0Dh+lvzvsje3zLsbCw6TjqCGx/GnjJR3tOiDr?=
 =?us-ascii?Q?Rue5MOB883ta+tvhAGo73qkG/1IEO6CdaTzvTIqk87USmpDjiRG8?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: d519952d-71d0-4e58-cfba-08def169f188
X-MS-Exchange-CrossTenant-AuthSource: AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2026 14:17:25.9943
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Mvck6JUtML1Xq8/3c9cFzU20LQuLoPYe1Gf+N3eAIBCJNzvPT2JPLrnrgwtr//bIShxC1YoHLiN8hUql3QTj3VA3CToGo5CvsjGSRLjaWGk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0P189MB1820
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 03 Aug 2026 14:19:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128692

From: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>

Backport patch to fix CVE-2026-48144.

References:
  https://nvd.nist.gov/vuln/detail/CVE-2026-48144

Upstream fix:
  https://github.com/apache/thrift/commit/2b8baabc9be52807b08825e825bc0cd26=
568a193

Signed-off-by: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
---
 .../thrift/thrift/CVE-2026-48144.patch        | 36 +++++++++++++++++++
 .../thrift/thrift_0.20.0.bb                   |  1 +
 2 files changed, 37 insertions(+)
 create mode 100644 meta-oe/recipes-connectivity/thrift/thrift/CVE-2026-481=
44.patch

diff --git a/meta-oe/recipes-connectivity/thrift/thrift/CVE-2026-48144.patc=
h b/meta-oe/recipes-connectivity/thrift/thrift/CVE-2026-48144.patch
new file mode 100644
index 0000000000..531fb5a52e
--- /dev/null
+++ b/meta-oe/recipes-connectivity/thrift/thrift/CVE-2026-48144.patch
@@ -0,0 +1,36 @@
+From 392027cd14deaa7b37d72e1608b57024a1056757 Mon Sep 17 00:00:00 2001
+From: Jens Geyer <jensg@apache.org>
+Date: Thu, 21 May 2026 03:05:53 +0200
+Subject: [PATCH] Add peer hostname validation to c_glib TLS client Client:
+ c_glib
+
+Sets SSL_set1_host() before SSL_connect() so the peer certificate CN/SAN
+is validated against the hostname. Guarded with OPENSSL_VERSION_NUMBER
+>=3D 0x10100000L since SSL_set1_host() was introduced in OpenSSL 1.1.0.
+
+Co-Authored-By: Claude Sonnet 4.6 <noreply@anthropic.com>
+
+CVE: CVE-2026-48144
+Upstream-Status: Backport [https://github.com/apache/thrift/commit/2b8baab=
c9be52807b08825e825bc0cd26568a193]
+
+Signed-off-by: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
+---
+ lib/c_glib/src/thrift/c_glib/transport/thrift_ssl_socket.c | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/lib/c_glib/src/thrift/c_glib/transport/thrift_ssl_socket.c b/=
lib/c_glib/src/thrift/c_glib/transport/thrift_ssl_socket.c
+index 0afcb1b8f..4423a781c 100644
+--- a/lib/c_glib/src/thrift/c_glib/transport/thrift_ssl_socket.c
++++ b/lib/c_glib/src/thrift/c_glib/transport/thrift_ssl_socket.c
+@@ -422,6 +422,11 @@ thrift_ssl_socket_handle_handshake(ThriftTransport * =
transport, GError **error)
+       if(ssl_socket->server){
+ 	  rc =3D SSL_accept(ssl_socket->ssl);
+       }else{
++#if OPENSSL_VERSION_NUMBER >=3D 0x10100000L
++	  if (socket->hostname !=3D NULL) {
++	      SSL_set1_host(ssl_socket->ssl, socket->hostname);
++	  }
++#endif
+ 	  rc =3D SSL_connect(ssl_socket->ssl);
+       }
+       if (rc <=3D 0) {
diff --git a/meta-oe/recipes-connectivity/thrift/thrift_0.20.0.bb b/meta-oe=
/recipes-connectivity/thrift/thrift_0.20.0.bb
index 35482d2471..20afa8ce59 100644
--- a/meta-oe/recipes-connectivity/thrift/thrift_0.20.0.bb
+++ b/meta-oe/recipes-connectivity/thrift/thrift_0.20.0.bb
@@ -14,6 +14,7 @@ SRC_URI =3D "https://archive.apache.org/dist/${BPN}/${PV}=
/${BP}.tar.gz \
            file://0001-THRIFT-5842-Add-missing-cstdint-include-for-int64_t=
-.patch \
            file://CVE-2026-55971.patch \
            file://CVE-2026-58023.patch \
+           file://CVE-2026-48144.patch \
            "
 SRC_URI[sha256sum] =3D "b5d8311a779470e1502c027f428a1db542f5c051c8e1280ccd=
2163fa935ff2d6"
=20

