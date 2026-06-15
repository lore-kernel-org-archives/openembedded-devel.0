Return-Path: <thomas.noack@iris-sensing.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED9E8CD98C5
	for <webhook@archiver.kernel.org>; Mon, 15 Jun 2026 07:03:32 +0000 (UTC)
Received: from FR5P281CU006.outbound.protection.outlook.com (FR5P281CU006.outbound.protection.outlook.com [40.107.149.136])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.124195.1781507004090345436
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 Jun 2026 00:03:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@iris-sensing.com header.s=selector1 header.b=ub4kkoxC;
 spf=pass (domain: iris-sensing.com, ip: 40.107.149.136, mailfrom: thomas.noack@iris-sensing.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hFXgrkldjnnQkQRgl8szFgYqK+wJ7D/E9SQLlLR4wC+d48LvwZVHWBAYqIZ2b7qodw0vtwB4bq27IK+uQdJyq0dx/+xzhg7xsBM0UKIA/ebZI/cyfhM3T4f2qKRXn+YQIGyTicmiHDUrbpazMOEHVWyaGtKXQEUDlGtolD2y7F4rTpNVC2jiBhCUi8jeAvMMQQ1TIBFswVbTbow4JJLWcgi88WECfA9DOeKrGQaqR074Z1ZsNk4yriGA0g7d2cNqHDUzqVUBCvTDR36r8KOYMDvO6cgW8DcqwGwByLbGJP4Gvk8IP2nVNNyXpWASzDh2+LHjwS50xqivU1wgFvZSPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lMy93aO/IEByDeC3wolGX4OfIqueD2ZgXsLpdLbipxM=;
 b=f1acYLSb9wy/fzUDOhoN+TE2i4cJMMpNlF1Z8kiANhkveq9F+MMiGTk0GzY9477ycLMnNWvojIN1L7CDBM06KexVPbILZGk+KEzrpXe4owb/xKQijBIj28WBq37WbPppXldsgNMBIo7a1xZtr/7HVVrOYMA8e46BOHdbSBVPk5q96uMiSTzY2UiARP+HLkPeDM7MsWnmSm4ShK3dUa+bsom6vbZ05Mw/FtCVmx1+nmjeT/cFdg2ISj4uqdZ6ECOe2Cn9vqDkJbVxDV0zdTbIvfXAI7LTl47BH/oVsVzN6vzgvfijHPv/pbdvJwMkEWLkO7W7rGy0cyDdqZvgRPgIlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=iris-sensing.com; dmarc=pass action=none
 header.from=iris-sensing.com; dkim=pass header.d=iris-sensing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iris-sensing.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lMy93aO/IEByDeC3wolGX4OfIqueD2ZgXsLpdLbipxM=;
 b=ub4kkoxCHXUcbQWiBB2vM5egtduJqEw5h0XgNkbwTxYWVD8Yx+K3tq0EivgXs88Hu6gZ201O04K86zYsQFA7zZIN1atyTHK/OwBAkVMLN28x0LRJ4o9FOSTKRZBl9gzaw3OQvRalldBxs4ug8F5o7zOyajyU39iFamrC9Kp++eFDvoj/cTvMxulo0iyH2bPpM9aTXKEhVPvqyAzHp95lpBa91++Y6YjwjgUYtBfQNa09yp2hK5tE2AFdVkr9sCPZB9ErpqZLUyN4vcLvX7pcK1bNgYBwVEI4uj/g6mTcNoCYQFH1g9ZlqgY5FHpefvvOqDjIaj+Kmgl4MeA3PH0exQ==
Received: from FR2P281MB0121.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:11::7) by
 FR4P281MB4368.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:12a::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.113.18; Mon, 15 Jun 2026 07:03:19 +0000
Received: from FR2P281MB0121.DEUP281.PROD.OUTLOOK.COM
 ([fe80::55b4:62e0:6097:3723]) by FR2P281MB0121.DEUP281.PROD.OUTLOOK.COM
 ([fe80::55b4:62e0:6097:3723%6]) with mapi id 15.21.0113.015; Mon, 15 Jun 2026
 07:03:18 +0000
From: Thomas Noack <Thomas.Noack@iris-sensing.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH] sdbus-c++-tools: upgrade 2.2.1 -> 2.3.1
Thread-Topic: [meta-oe][PATCH] sdbus-c++-tools: upgrade 2.2.1 -> 2.3.1
Thread-Index: Adz8lKBCYS/Slw0wRVuIVDvc/oVdPg==
Date: Mon, 15 Jun 2026 07:03:18 +0000
Message-ID: 
 <FR2P281MB01218EC28D7CECA1E0A562A2B8E62@FR2P281MB0121.DEUP281.PROD.OUTLOOK.COM>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iris-sensing.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: FR2P281MB0121:EE_|FR4P281MB4368:EE_
x-ms-office365-filtering-correlation-id: 171fb04d-2a1b-4484-33c4-08decaac2e0c
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|55112099003|6133799003|56012099006|3023799007|11063799006|38070700021|18002099003;
x-microsoft-antispam-message-info: 
 oLEt6xllkDgZL8CNiBFGQshgtN+i5Jf/gKygFfM3HYd+GinaO26rMsCqWzMf/mdXUOVDg3nnhG5lgjIU6bwowOuP6mv9RAzEw+VT89kVru1GmtfvLM8SmAi0vvJY23RsdsVILOsyEm0hFs3xWpJqowqoaVBtnDrwNnUf86QfDEJlGG/IiO74kQbnuIuiSuNlgmtAUI5YzEqwKxxgkLc0NSMH+jteHwctTjl+bp+z1zvbchoycw5borD9/hivEuegyHWAvm/d3HLBm0ud8pybvPD2zxuvCqk2lDadNXIqGER7YisAEg9vKS+V4Zm2Ew2JZZqh1PnsZWW213YFIsdpAFHwuHvtZthkF7jmI52tAGS3kzwoBR5jmjQqNGtlbfc6UWcGeYpWq3JIctNCKUU4TkCXQmIotCo+gphm4okffJD/zv6iWEIqWKrQgYnip/uVSz/einF+n0VBWgrENe9GuJbCkUhJxDWmMbZ2e5+87CyDVDnl8xKHPzRKwIF+Tttwa5DMFaJxa91BMY9ZDYSSweLAnoA8X83Q30qQGCrSjYHRn3Dk9tGbFxaEICF6MA+Qm/1gKRjzksxvUqUHloe7Q+5Ndqo+u11ySooK8HCm8X+1IkrmB8dJQzhEeDPuTALHStALoTYxuQu4tpsqhmTizMmEFwnerSsdHSQBfazhEhnQlwwbP5qL7ug0L8jUpzz7URHvA2dyEOJs+e0jKgbaVWDqIYfhiQl4cAFTwyuf8feMQMfX9U1neFdpY3HU8fGI
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:FR2P281MB0121.DEUP281.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(55112099003)(6133799003)(56012099006)(3023799007)(11063799006)(38070700021)(18002099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?UZNWU5GmO7qw0wVNzsdF+KqXjaArKhSixw4P4O0NPrc8Qqd+gm1PHfSAakUH?=
 =?us-ascii?Q?sGxypb1E+vt+2L7vs39KCUCRu6IU2mB0Bp3KhR1hPUtTe2hwwiLLZSiGihkE?=
 =?us-ascii?Q?LjhiM2CJyby7BKLLWqpV59picnNyj6ZcTV+4bgqkuhoKPCkBVVZ1BJYMGO/E?=
 =?us-ascii?Q?VfoK+gLg4Gw90pMz2hq4loHlr0BI8wFZLGG1ZacjzzyJTXw0cqgKeLQ9IYAl?=
 =?us-ascii?Q?IGXQY8maOp70HmfC/CeITKQCafzaHqfq1sj7rrw9VOSebR5sbjPF8vQWN7GU?=
 =?us-ascii?Q?3ZirOrX6OSpDSkPmKJL16sIDm5R6zLQZA+y5sDUTdmgkqBnTNH/VWoEx7O5x?=
 =?us-ascii?Q?9A/z+LTRyM0Dk8tOFN8567bb9+PrLnR0OCxdAuCYWmAsvYcud+90mEscobOL?=
 =?us-ascii?Q?0WglPVfxaXZRHQw0HTxhkrGfwaey9ZPtFUyDGdXI3ctdFWORrk2aJL+pjowa?=
 =?us-ascii?Q?fAJe1qSZJrXxPu77cpNLMXBMwiQBEIOHd25FkYMyIjVTrxe6EzJHYnzldoik?=
 =?us-ascii?Q?74ErPpp1UY+6w2IqVngG+uQhORd7i/LAvw7dRqnAMtrGAImeyl3oNd9mm60W?=
 =?us-ascii?Q?O9dxA36K1e8/jFXos84AaeGPuppoK6ES2JiPoD6guE+UhuYVY28xiMz0E/01?=
 =?us-ascii?Q?NZWD9vLbu9OMRpXS0nehxa2LcRn/k/HuWREl+1PA4hwdJHp9El1+2adh5zD3?=
 =?us-ascii?Q?BoQOMrhh93vV/Gvuj32EuvBa+rNfAqMgcOuG0WrI2dfhpAD2ffW+nUGly9So?=
 =?us-ascii?Q?6ZtJwoVNWLbhI1NqUIVhVvXFAP26C++EMg2Jeq+BlW8LP54h3v83mCXh20c3?=
 =?us-ascii?Q?OEZLOhJTBcc+3jnRgvAt9lkCUaDnRE28i/8UrVSXaEg+WWawctglnYYs1Fi6?=
 =?us-ascii?Q?vW8GTH8aSyZl/NplQIm5khOrhuJtXCxTCOIWU7oSVNWuZSa3BqJFyuWeRNPF?=
 =?us-ascii?Q?puaiZGCYjq+rPk8XsOvEdbbn2TPC54wj1f9+Pv3yE/RLzyiVcddlwff4H5He?=
 =?us-ascii?Q?z6AjzzNYjiau9Nkd3WSVaE3u1ag+6RNE5/uJiuW80a2uwVxANJhstY10QY7R?=
 =?us-ascii?Q?ym31iTLBtE1p/qo/jRJ11r8MVDykuy3RDpLcyzv7r2ZRp+c8UOSNfcTtzo9u?=
 =?us-ascii?Q?tt2Orwrs9dnrVLLE5jjMFg12xdxx1gXOV8DSHtaAhM9Hv5nJ4ohmquikCeKW?=
 =?us-ascii?Q?MuQuYq2pbICQaBDAuMRscv7+xfZeYjWSubyPt3UGyU9PQvUzraC0/RmlIM5e?=
 =?us-ascii?Q?GUuaVNsS+U6bWkoYvjnTVQMHpY7JhGxJRZHLIDaaBzqhyWgYRXkPtt9O0ov9?=
 =?us-ascii?Q?9VCOjV60BUZzwYBTOgwl12EslJRHs0VQX5X59GqYWSq3d3HqITzlBTCZUxCM?=
 =?us-ascii?Q?rny5FiznLfl8tY0HcsERy6MwlecNWWUeOgQLUiC2tqsqZqjQBtaWpTASx5SY?=
 =?us-ascii?Q?YztiHxtVgC5gRPOk2a45w5jW3m+47DvaqjlWXH1qmzS2+RLBwh0LeUxW5U4d?=
 =?us-ascii?Q?IDqmUXAjlgIzXfyukW/Hg9kWJy7yiA+zEatsyHidr8ppZxjFq29AyGaZiNx+?=
 =?us-ascii?Q?B2Y7M9hPlkp66L112XgeXOOpgSZnKaHTdHrOYV1zwUy1P5kVgU8YWCeMHXjP?=
 =?us-ascii?Q?I77H9zGQ20zYe5MLPe1VSlwM5fFDwaGhLkZkxQU4/JT297a1JDserd8DXsA7?=
 =?us-ascii?Q?KSFQk7KJ+I7ZgnfPNIUNY+b16IKBJDKTB9ZCHp6/N3/L3LfUoo300ndO57uy?=
 =?us-ascii?Q?0ZrmZ80wl4lIkol75jIC/eUBAlqF9ng=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: iris-sensing.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: FR2P281MB0121.DEUP281.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 171fb04d-2a1b-4484-33c4-08decaac2e0c
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jun 2026 07:03:18.8640
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 963f3913-ffae-43fd-856b-2dfd3f6604e3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aWAxRfAoK11ehPD7KBgS/rY/rnR9pKyMpruCJ1nqG8K/VCQ6pXRH4ajC3nou1WtB8rutBrS5sUv3opRwIVq/6nCbybuYrhghlqzz2bGbf9E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FR4P281MB4368
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 15 Jun 2026 07:03:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127581


Changelog:
- https://github.com/Kistler-Group/sdbus-cpp/releases/tag/v2.3.0
- https://github.com/Kistler-Group/sdbus-cpp/releases/tag/v2.3.1

Signed-off-by: Thomas Noack <thomas.noack@iris-sensing.com>
---
 .../{sdbus-c++-tools_2.2.1.bb =3D> sdbus-c++-tools_2.3.1.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)  rename meta-oe/recipes-core=
/sdbus-c++/{sdbus-c++-tools_2.2.1.bb =3D> sdbus-c++-tools_2.3.1.bb} (89%)

diff --git a/meta-oe/recipes-core/sdbus-c++/sdbus-c++-tools_2.2.1.bb b/meta=
-oe/recipes-core/sdbus-c++/sdbus-c++-tools_2.3.1.bb
similarity index 89%
rename from meta-oe/recipes-core/sdbus-c++/sdbus-c++-tools_2.2.1.bb
rename to meta-oe/recipes-core/sdbus-c++/sdbus-c++-tools_2.3.1.bb
index 13a7b8a45e..56e8bd9234 100644
--- a/meta-oe/recipes-core/sdbus-c++/sdbus-c++-tools_2.2.1.bb
+++ b/meta-oe/recipes-core/sdbus-c++/sdbus-c++-tools_2.3.1.bb
@@ -8,7 +8,7 @@ inherit cmake
=20
 DEPENDS +=3D "expat"
=20
-SRCREV =3D "28b78822cfc5fbec4bd9906168493e9985f586ed"
+SRCREV =3D "ca073434d2c03c2b619f7e23f285cebbf32c7e46"
 SRC_URI =3D "git://github.com/Kistler-Group/sdbus-cpp.git;protocol=3Dhttps=
;branch=3Dmaster;tag=3Dv${PV};subpath=3Dtools"
=20
 S =3D "${UNPACKDIR}/tools"
--
2.53.0.dirty


