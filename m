Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF3D9CCF9E3
	for <webhook@archiver.kernel.org>; Sat,  8 Nov 2025 02:28:44 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.69])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.933.1762568915314104321
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 07 Nov 2025 18:28:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=selector1 header.b=cke7Xy0/;
 spf=pass (domain: axis.com, ip: 40.107.130.69, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QbBtWweJc1X2J6WhCSjfUbNSp+CB1MDnBIUPpneWPhn8EQnCpHFxFA7vxcLez3tmyelaouw5QU5NWY1oxU5lbUJY0CzDkKszr7a73cJKs9dbuSwgqiP2l4OTIlqNTj5o0N9mt4oHOnBN4aniNOqfAn1n9bFxfKUlPNUifguHRKgasCXCOeJS8zUvFssnIK13IZCgHJ2JOWsrCm5UQ4DtLlCz3tRFfc8C1oeXwMr+9eiOh+EC5xmRXJbFh0eTScdH4v7b6O6S/IlPaV2ndFLnFehhuKorLVtTPMUjvGAsQwfr/CQTt8gX85TIzufYMVcfymmG0kXy5ywJuSRt0cWyQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l4zTtD+q4FKkwX3DIJl6wySA50ET8ZCtsASz1Wh101c=;
 b=CoaVAMnXLLcotVDvTJBI+8Qi3ptbqoy+teg46oL5kzKdT7ER7DENEyAZZXl3Lq6AGvwjKcxZRCzyA+MAxU0KTPDErIzrxOf798NI84RfaLt/fbmfUydU+E7bLQ8h7LYIJ5nirG+3SD3KMFATWearEXJAbDVhk7YRBM8mmAdoc1tNlGC1O4CylJ/tv3tFMNDWw3Z0w+IUnUEFgtRtgzG50zt1IzI8ihZddJyf4kyjFK7QP+WJ3JeTn9Mjmfc9990psCs7f/PgywOayLyWTDa6R08rtyR80/1AOZyFhaB0pHuBQqP/IFyqGzLkDPXJwPstlt+ec1p7fLI5IMqYm+m8Vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l4zTtD+q4FKkwX3DIJl6wySA50ET8ZCtsASz1Wh101c=;
 b=cke7Xy0/cxJ87j4JsuQa/U0wsCI6rjUb9+xddrZwje//65c767wUdKfdKhIi3GYH9EJmoDE3r/h1jmRPw1PsYB64XkBFdS61c980FajJy4vDXkRFgG5sosc6mpVPXz/6JQlM0MBAQnBEDGfT+oDh59k/WUm9W9NpFauIKuosgGM=
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com (2603:10a6:10:4a8::17)
 by AM7PR02MB5880.eurprd02.prod.outlook.com (2603:10a6:20b:105::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.13; Sat, 8 Nov
 2025 02:28:29 +0000
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::1bee:3174:a078:5af9]) by DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::1bee:3174:a078:5af9%7]) with mapi id 15.20.9298.012; Sat, 8 Nov 2025
 02:28:29 +0000
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: "wenyang.linux@foxmail.com" <wenyang.linux@foxmail.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>, Khem Raj <raj.khem@gmail.com>
Subject: RE: [oe] [meta-oe][PATCH v2] nethogs: add recipe
Thread-Topic: [oe] [meta-oe][PATCH v2] nethogs: add recipe
Thread-Index: AQHcUFH6+TxTTwbCG0epHWDSFeurp7ToClzg
Date: Sat, 8 Nov 2025 02:28:29 +0000
Message-ID: 
 <DB5PR02MB102135E5DE3FAB1543D477544EFC0A@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: <tencent_27FD029FC5AAAEA8AB837C276FD225996D09@qq.com>
In-Reply-To: <tencent_27FD029FC5AAAEA8AB837C276FD225996D09@qq.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB5PR02MB10213:EE_|AM7PR02MB5880:EE_
x-ms-office365-filtering-correlation-id: 32be549f-722b-41a7-67a7-08de1e6e80e7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700021;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?yFiQ6cqW5ehIc0yFCPcXEzm3NSTP81Bsq6aRoi+3JaA9JIdZaeqkvAialXc1?=
 =?us-ascii?Q?Je2KsabboAnzMigsJ9B9SbHsrMYzyeCvTplHXaXRVW6pDm4PmQsug9mG+WeA?=
 =?us-ascii?Q?3uB+buduIF3i/wmqar7fZ5zRPlQctCrrTcATB44mAZPifR/cL+v/+WgCn/ln?=
 =?us-ascii?Q?s19r/zF3ONa4QsM3B4xcfa9NA+Qv4pf9qY8HpOjnIcdQosb/DTegBLtCvCYn?=
 =?us-ascii?Q?lW2+raOf2i+7/cD/uzRB21oQAa5LkLPzj9zY8anMRw5+GwrSCcXFYSVx8Cvp?=
 =?us-ascii?Q?fmUx7HMuof4bg9JzVZ+PGxZTVRrflHehk2fmwvMMHCcg4gZOl1Gm/wP0SEqN?=
 =?us-ascii?Q?ASnHHP2/FqAufaUDGG1AuwQMmWslZRzTN4Eed4CBT+6qJE288oPvXFTqowX2?=
 =?us-ascii?Q?h5w2AjoBgC7RfvLN+vA+Ms05MIJzUsk4eSz6XARk+49fOYrI8Nv1D05wqOxN?=
 =?us-ascii?Q?phCMcMHBOfiarRbJP2gxQUX0hNao+6L4LXbW+mt0bw0I3fQZOrbXqvZEF0kc?=
 =?us-ascii?Q?+BtojTN06onPgwHSFC0+denJZddO0M4ds/LagwolB0xmXsw6KdRivaqnK1ln?=
 =?us-ascii?Q?CA65G5Cl4Gy9QwYkxo2Bvyq4g7IrBzjlCLOBgA46N3DjCR5HniWNiB93rbL9?=
 =?us-ascii?Q?m/tcpn5p97EJ1s/Zmsk0GM+ORFQCqqVGX0HFRL0eX/usho6ZYCDyhEnaJp79?=
 =?us-ascii?Q?XuYObO9NFnmjkS+3m9JnLiHg3YVohwhapaSpxUs4D15OU5rycmGZHjuv7Vo7?=
 =?us-ascii?Q?TEOr9v7K0+qMlZqCsgHQZ2s1wipTxOQ3o5Pf6Xahzs7ygAMpay2Tl+lauiwY?=
 =?us-ascii?Q?6Lx5hNu4+b5hDj2B+xBr9CHMZrkdlui2Viwu71Vg6ktnUOtmuhdT1SjoK2o2?=
 =?us-ascii?Q?at/AsqE88/ASY3MA/PCCp/mfKNbJaLgLB7lI5lce02F8ummovEi2Nw/qHBzC?=
 =?us-ascii?Q?p/7+MUlEvyPtQaBoTiK7w5x5HLlbhIPqA+XC6ooYCPygnFHCTHnNz/U+RhMx?=
 =?us-ascii?Q?QMqhoNKomqMbbe68AeUIoOE+CoSZWXC+jPlNMzVz7OBflxnQwn5qXW+xsh3H?=
 =?us-ascii?Q?zjz5jTGh3KG1LDu2SOm8aOIGrVBHohCYYN89lRZNlgeEwtq/lLY5BTgCWdvw?=
 =?us-ascii?Q?P8+kTrzDjDpgl8Reer6mYCXTpUOZSHfeB7sQ66VhvYygFkJcFmXk5cSdJ/YU?=
 =?us-ascii?Q?3NoAAZhT/yEXl1MyPiEh87K194PLG5YKRjwUmRj3+xkWuSpjrlz8QiMTlbFZ?=
 =?us-ascii?Q?pPWXKCcfrYocpUNH4wIRWABNtl6jxJfH2WgX844rrWoS96399DDnHpSM2Yia?=
 =?us-ascii?Q?WBoxooVzXMwT9Y82As17yXY+HPSLE1n/6LFFhbrcQtIUk4hx2Kl5eYpfTRjG?=
 =?us-ascii?Q?Myftrdv4xzLyw0Ih8q/60LZLMSD96Prlk28ZDBXlontinaX2gxvpxWey1pwP?=
 =?us-ascii?Q?fPsbrn6cGvGeMAKTxdS0FwYbf/1l6lLtuPxvyYGyfHLdGljoitN56U1a+cHi?=
 =?us-ascii?Q?c3TJJR06x3B1AKNOgSKkGEtTFPzug9czENNu?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB5PR02MB10213.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?DAlz+uP5gPHYSCMHYjTHSp1dNciS1TQHqf6XJXufdkzMZiNqnYGjfbQk/M8W?=
 =?us-ascii?Q?CgnMqX2L8/WNtRHzDMUtSJ5fqXJkzEbyQ59PQyl1zyinJs5Mt/9ZJoqUQ346?=
 =?us-ascii?Q?I8TUOD+1ll/youUjAH15ZZXkejihCv+hZlnW8bStyHnm1/cMycjA+03+Ry4b?=
 =?us-ascii?Q?BFIi6yB9qpX9DBL69rP1/THI04yxFDUDM+LX/ZJVYEDpwIxc0RDcM+OiI73u?=
 =?us-ascii?Q?KZoSdI+rJri5COsw3H9g8uDHzcBkx1TNHDITlaVpmeiDzhtpf1OB6EmahaWy?=
 =?us-ascii?Q?5fM/cL0EjcnthJX+ezCs4wBGoMeQuH5NNNG/aeYj9z0kabBLirw/eW3oUu2J?=
 =?us-ascii?Q?4zEDQqYl5Rx9gc7DLjscbPChe8um0a6MtFX7n7B1eL3Eq52IaLfSv0R93lDw?=
 =?us-ascii?Q?tlViOywGYYOwL0zJv3MR/L4YgxlwpTgF21sYZlOo+NFRiPnB32KWbEnwUL3y?=
 =?us-ascii?Q?NCRIJIcPBbguK/Uf8sI51Dv1ZbFSKkUkGpTV+0GQeKF2DwMaie6ZTASEX2Y/?=
 =?us-ascii?Q?LXmNMqcmu1Ar6jx+iS5MtMO2A13h5eJP1dr9uLU3M+koPxuqwLg6U82wklDr?=
 =?us-ascii?Q?ITk6TeSFaZlVGvUkWk436q9ZaHBJbfWbShxOv2zgBnduinE+Ad4BAtFzRv/W?=
 =?us-ascii?Q?00ItJquJpn6/6W2DYvXAGzE2dM1hLxiL77SOzq26/Sk4AuT/P6LCwKQQ3Oa6?=
 =?us-ascii?Q?qpr0CmyFEYSdRRbPPRmkafE/N99Rx8S/T5E1lheWM5A/r9f89swsvYIYJMeS?=
 =?us-ascii?Q?KV5XeVpvG8VKp7XHLHuglnqv+ZgGN3Qa7ViGMT+u7EfIvsTm03mxCQlsoGed?=
 =?us-ascii?Q?V9BQAhzaGViAhzhqrFmXxZ0ktKSCuD9ie4mCT3zqZAJM5Mu5ZTbymha9RXWl?=
 =?us-ascii?Q?fi1d4//01emYL+5Pyra4jrhSGAEXROmZhBG/rBF0IfnmVxSYgTxNLKI0DbJR?=
 =?us-ascii?Q?UHxSuz8P+9M41X0n2wHolBQedaD/34KTrUHA3nV8cwaWQqip/FlNp3OKr7J7?=
 =?us-ascii?Q?2sFH+njaqfqQzZWmW7YJ9cjObI0ImmoC2rRcOa0dYdxUyngfx1YpzL12JEZo?=
 =?us-ascii?Q?0q53OaaxecxeAUmTHSfbTO+/sVYv+VuCDuGL1J/OQWFD7/vmhOsOAHBoGedu?=
 =?us-ascii?Q?OPIYySTFeWMO0I6zgg4RhXop4Y25/aLFe0yl/n5QnBaby8GBYveyt2BEkoZI?=
 =?us-ascii?Q?3mqVtTZMYS+QKdPqv6XbfhcrnwrrKeg96jjZbHVZt65m5baxnx2IWZvEIyFK?=
 =?us-ascii?Q?UNkRcUSRSNg1KYoZXnvbiDn75kX9DtzJzxvs63IsZdUY2koG6wftwYpXa8aW?=
 =?us-ascii?Q?EjvGkTVArZ09M2+2FJKUUP0E48dUtAeZMoef0G/Ww6585UYuW9IFNPhsCVM1?=
 =?us-ascii?Q?sRyRDW3oJ0iTJXMYSgC3832HptjTJGeLA8I1YPYp0pXsC3+YLQw+d9VzWUP5?=
 =?us-ascii?Q?kCxAi1RStEf0SeeJOuxPeqJQ0byVvTqz0sTl+HUCAIvXs/9RlmWDc/7jI8Nc?=
 =?us-ascii?Q?yxlMbq5fkKyqbchbUHYssbglMi+6EhQL7e7VJfsTrCn3qq8JSFuO9n0BIA?=
 =?us-ascii?Q?=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB5PR02MB10213.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 32be549f-722b-41a7-67a7-08de1e6e80e7
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Nov 2025 02:28:29.0818
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nNy5V8Ojp3tFOLjeGvZKPGG9l3hgaeam7qTq84mGdUQJOTT3T/JaI8WkKz3A4Bu+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR02MB5880
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 08 Nov 2025 02:28:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121378

> -----Original Message-----
> From: openembedded-devel@lists.openembedded.org <openembedded-devel@lists=
.openembedded.org> On Behalf Of wenyang.linux via lists.openembedded.org
> Sent: den 7 november 2025 18:02
> To: openembedded-core@lists.openembedded.org; openembedded-devel@lists.op=
enembedded.org; Khem Raj <raj.khem@gmail.com>
> Cc: Wen Yang <wenyang.linux@foxmail.com>
> Subject: [oe] [meta-oe][PATCH v2] nethogs: add recipe
>=20
> From: Wen Yang <wenyang.linux@foxmail.com>
>=20
> NetHogs is a small 'net top' tool. Instead of breaking the traffic
> down per protocol or per subnet, like most tools do, it groups
> bandwidth by process.
>=20
> Signed-off-by: Wen Yang <wenyang.linux@foxmail.com>
> ---
>  .../recipes-connectivity/nethogs/nethogs_git.bb | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
>  create mode 100644 meta-oe/recipes-connectivity/nethogs/nethogs_git.bb
>=20
> diff --git a/meta-oe/recipes-connectivity/nethogs/nethogs_git.bb b/meta-o=
e/recipes-connectivity/nethogs/nethogs_git.bb
> new file mode 100644
> index 0000000000..29af14961c
> --- /dev/null
> +++ b/meta-oe/recipes-connectivity/nethogs/nethogs_git.bb

Change the version to "0.8.8".

> @@ -0,0 +1,17 @@
> +SUMMARY =3D "NetHogs is a small 'net top' tool that can group bandwidth =
by process"
> +HOMEPAGE =3D "https://github.com/raboof/nethogs"
> +SECTION =3D "console/network"
> +LICENSE =3D "GPL-2.0-only"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a4=
263"
> +
> +SRC_URI =3D "git://github.com/raboof/nethogs.git;branch=3Dmain;protocol=
=3Dhttps"
> +
> +DEPENDS =3D "ncurses libpcap"
> +
> +inherit meson pkgconfig
> +

Add:

PV .=3D "+git"

> +SRCREV =3D "08daf76d8123943392c84a07108beea3e23ea39b"
> +
> +FILES:${PN} =3D "${bindir}"
> +FILES:${PN}-dev =3D "${includedir} ${libdir}/lib*.so ${libdir}/lib*.so* =
${libdir}/*.la ${libdir}/pkgconfig/*.pc"

Remove the two FILES variables. The defaults work just fine.

> +
> --
> 2.25.1

//Peter


