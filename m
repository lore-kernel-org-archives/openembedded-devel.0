Return-Path: <johannes.schneider@leica-geosystems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6423C71135
	for <webhook@archiver.kernel.org>; Mon, 16 Jun 2025 05:54:41 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.19])
 by mx.groups.io with SMTP id smtpd.web11.23952.1750053278613310619
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 15 Jun 2025 22:54:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@leica-geosystems.com header.s=selector1 header.b=IrOFp8lW;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: leica-geosystems.com, ip: 52.101.66.19, mailfrom: johannes.schneider@leica-geosystems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TKoSqss4Zz297wSpWq+omWSrJ48nA+j165083C+nOAAuto9yVEzheN8AwfRow6EwwaS6ueenUIk5Yj8cdbIk4Eh0rZx86qA5Cdgza88O8Q/YOa2yZHix4HxE3PMulhEhWUdT4+2xuXnQDcpdMWzsIKrlN3+gbgBUNoN28+G308E2E1I3KDN+hW4b8utxqvCdznFj+h2nD5myCmm80w7YcFnsOSB9Dj3X8W5xNunxdkSRqb1awsHYLb2G7Xy2fAVWkTl/SuYDbK74ZEU92ApR+qO4JHedfpbXuQl4vgyggmLiNqQbL6qEKyP76l7hQQPC76ho8+OeyCoXmqv4wqcYvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HaZfQ2S6iSISMi77o+60jRzvgIk+vjDVOPbKNIrrzkU=;
 b=FvfU8lPHqYruzDu445IxphTuJ4UF8UkXwfFxGjNZJZleauWylxblpQ305o5LLs5u0oNM++SIvcJugPr/xPYO33D6QfiF7Rk/7zvpm56aGRlxfXSb/rAitR4eBge4btFnJspa2oW0x+IlHhXpXQxJICPb/rJn+Fp1j5QmaolhBrNgcnhaH9JS0KSitQWAZbVXo244iBnlHhvPUdLdyjMA21c5cZIeaDhW0ms7savZ4TgccUr0LgfczyN+xRf1Ybj9le1VW9ChsywQO562xXZZM4LXdS0S7CjELuWDSGVw6u5hy/I4h+QpIpILZ9MkdmX+3E1T/dZcw1TiQuAxTVMSSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=leica-geosystems.com; dmarc=pass action=none
 header.from=leica-geosystems.com; dkim=pass header.d=leica-geosystems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=leica-geosystems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HaZfQ2S6iSISMi77o+60jRzvgIk+vjDVOPbKNIrrzkU=;
 b=IrOFp8lWlKNhQPcfptZFJRZxS7+YAhEsigJnwfGx2j9/YCbDuNkpfR42/Kk+hcMwOPKHQZcoBp3mSqBSvxTlnTX6wGfPSllzY4iynoMg3uVsj6S7WrTrSktFz7wXKseFe/bqh1K1MftrgJsiE5bg8fHKWl/awoPMDSng1p0qfM4=
Received: from AM8PR06MB7521.eurprd06.prod.outlook.com (2603:10a6:20b:355::8)
 by DUZPR06MB8624.eurprd06.prod.outlook.com (2603:10a6:10:4dc::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Mon, 16 Jun
 2025 05:54:35 +0000
Received: from AM8PR06MB7521.eurprd06.prod.outlook.com
 ([fe80::570d:8853:c13b:c7d3]) by AM8PR06MB7521.eurprd06.prod.outlook.com
 ([fe80::570d:8853:c13b:c7d3%4]) with mapi id 15.20.8835.027; Mon, 16 Jun 2025
 05:54:35 +0000
From: SCHNEIDER Johannes <johannes.schneider@leica-geosystems.com>
To: =?iso-8859-1?Q?Jan_L=FCbbe?= <jlu@pengutronix.de>
CC: GEO-CHHER-bsp-development <bsp-development.geo@leica-geosystems.com>,
	"raj.khem@gmail.com" <raj.khem@gmail.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] [meta-oe][PATCH v2 1/6] signing.bbclass: refactor
 signing_import_cert_from_*
Thread-Topic: [oe] [meta-oe][PATCH v2 1/6] signing.bbclass: refactor
 signing_import_cert_from_*
Thread-Index: AQHb0h/CeetVSD6UQEuFOD5ZHD/dVLPvn9gAgBXAbFg=
Date: Mon, 16 Jun 2025 05:54:35 +0000
Message-ID: 
 <AM8PR06MB752161D5026A4CE68CC049DDBC70A@AM8PR06MB7521.eurprd06.prod.outlook.com>
References: <20250531113252.3889951-1-johannes.schneider@leica-geosystems.com>
	 <20250531113252.3889951-2-johannes.schneider@leica-geosystems.com>
 <acd9f5dac0d1fd5b700d1a0a5b634ba509b2d3b0.camel@pengutronix.de>
In-Reply-To: <acd9f5dac0d1fd5b700d1a0a5b634ba509b2d3b0.camel@pengutronix.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=leica-geosystems.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM8PR06MB7521:EE_|DUZPR06MB8624:EE_
x-ms-office365-filtering-correlation-id: a1e8ae6f-e611-4f6e-19fc-08ddac9a45fd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|1800799024|376014|4022899009|38070700018;
x-microsoft-antispam-message-info: 
 =?iso-8859-1?Q?It09o+zxgUW49bN5sHnakEiU5ZIVobx2h+LxznD+3yDGO4hrbwbro4AL3u?=
 =?iso-8859-1?Q?ba5LSn9GNWKWRnZhW5ouwLeK76irl0RTMZrdxCIQ759560Wzb6ejlN7RF7?=
 =?iso-8859-1?Q?9qhyBA7G3tceX6t00El4HrGdNcJgXjZn7mLnL3RUyoIOOI6hM9ctCjmYNS?=
 =?iso-8859-1?Q?pC5320XGis8/Z53C90StXgsnkuQqqQhyoM3T+I0/k8oheT5doA5XDtriKx?=
 =?iso-8859-1?Q?LdAX9bGf5QCPZ9jLKYw9HAqz8Wd7QG5xcV+5WrkHwIv3HU9LZ3Klh2FOo9?=
 =?iso-8859-1?Q?mYuUPcuWBxQTvstG+aNjR2V2+qgLVx3hSt3I6Uz4d1itUSQiF419WgBgoO?=
 =?iso-8859-1?Q?e3TpOOXebnIn/ANDgW/sZQTUJdGXkSlWkBMFLBlgt3bPBRNQqPFQMAHB1p?=
 =?iso-8859-1?Q?cLbQxjuDWjeim/ae8G8RZBgJpjkjLISXcXjlVdkH0UK0sThRyQLYGT/J1V?=
 =?iso-8859-1?Q?1Uk3PEjcRYspPtWHiP8Dw1TXUemVi8ARUcaMJ6Sg6RRUlPQYAabeed9IiE?=
 =?iso-8859-1?Q?Zdy1R+FybWZnI9bLqm8chfClMDfrTGU5DS7Nw1t3SJ9TPsp58I6WLQ6xHR?=
 =?iso-8859-1?Q?VBO0A2yQYdcoj9npC1SnLWJN2OwMgkJAu6yaGTVG7vMjFMUINaLG17TxRv?=
 =?iso-8859-1?Q?n3bAmvZkuw812PwW4UP82F+Q7DdPAbBW0wEV6rF57bi1ihObvL3vAyyXxc?=
 =?iso-8859-1?Q?lyknTC6VBAJ/pHQ14jc0ADsgGs37Waqqlab6aWfCYKxUAm3w6a6wnwTXvd?=
 =?iso-8859-1?Q?pYYqDJzy5XIdhdSx2GYy5h7L6pDKgXhBqyVLtKyiolzAxqDkHKHaVNugqE?=
 =?iso-8859-1?Q?dPJa+U/CiHJm8hW6F+k3LikGFCIxWh4rRrKVC+yIt0oE6ebX7IMPQYskRN?=
 =?iso-8859-1?Q?r0F6BAEGt0sFJZSUoHJXJzXEjlgHflvIaANwmz8zCNn3G4YsmmX2FxLvd4?=
 =?iso-8859-1?Q?DY0FgqEvEpC2XfwxTrSf8HWG8SDf1UVFLU92w0xaxrsmZu94YbcgUGrVfE?=
 =?iso-8859-1?Q?m3piOqusGq/N/faY9UbBxc6EWA7neBs6IPETUi88Bu9y4oulM0Ae3xltcu?=
 =?iso-8859-1?Q?HLtpcg0I+h6dgz/YLiKUYcZQcuMlXoDxYUK6bAKVZQjuJCT+rRQueeUpTH?=
 =?iso-8859-1?Q?zR/GPpfT4PxAgQewj3Y/P6wFATQ4MZKQkAQ5HWh9Hj+FS+jjVNnU8E2q2i?=
 =?iso-8859-1?Q?NoPVhtTCXEk0Y96PGP22bo3PJMp3qOvSh2jcwwfgB76bPqV8C/3bXHHz0V?=
 =?iso-8859-1?Q?25j0I0EyplqlnHqUaN8I/fRrcTCs2XUmPxpwSwB/8o9dvZOsgteszE4ZZq?=
 =?iso-8859-1?Q?r2ZFploe/cN43nVeWIwpmL61n2pGZl1xTGZTLwe3vc/cvg/FD5M4QgJo3c?=
 =?iso-8859-1?Q?5quCEPAHnsRbfoW6JNafNZfGqHqZ6TFXFzdJWMHcTktpOxhKKTfK0zGrkW?=
 =?iso-8859-1?Q?eLoG1b5OPvePeM4/bbkkFAe34NFmPeDRHEztg/yS6uymxtjbBXe+ojTp44?=
 =?iso-8859-1?Q?Q=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR06MB7521.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(4022899009)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?GTvJ/RN7X1KSfrbB+LK2mLDxMcf6VESCEdQS7mosVXPLSniQdUDNP/K0k+?=
 =?iso-8859-1?Q?Iww/CZZJwVoPDP0qCXXVze1NE9bY/hSAxsAbGXPAIj0txImeufENxy4PXn?=
 =?iso-8859-1?Q?LKKOHU0o2M8ThlRXUbXky0V3szy9ocNXWoa9/JiDJqCNdcRtQA5Mj+5HaI?=
 =?iso-8859-1?Q?wQmYCT2DySqmslxfdn/IeVAzVPgVDNvVoCYAURjK6LqtGoAy58cwF3kOmS?=
 =?iso-8859-1?Q?iUHCf9HzSNCR7th7WckN643X8c/DZPO7KNjcx+E9vCVPYJiictNUVyt2Qr?=
 =?iso-8859-1?Q?Cws/bB+c6qeTDmLGl+K56X1vvr1/b8muD3xH1D8wJQMJM5WG/A7cWJvTpV?=
 =?iso-8859-1?Q?aw4VPawAr3u8pQJylrL6ou6zbxnkIDQgI7+FGkqJvNrw5rmv2tHlaVncyL?=
 =?iso-8859-1?Q?rsmkgvKqFDnbPLBU88rtBY+H10TMrGLOpOACiYbxaqeCVt2vmJRRyTxPs5?=
 =?iso-8859-1?Q?rU7ZqyqM/jCIGit9h8J+FxXH5hmRYr5ArhfpVPvQ2z/FdmKNmHsWhKM71C?=
 =?iso-8859-1?Q?bWxPoZYa11IqntTlyI7+zC9cAHKgfdg0hqjXv6ds68ziuLYmSoLDw9JBj9?=
 =?iso-8859-1?Q?lgUXOM+dhY0bHVmYQ6Lzo1NWEZ2GXyuxkDBVyC3DDmUQzZscEowBNqF4zV?=
 =?iso-8859-1?Q?IbCD+k5+xwvSkSqO+/0dnYLgiXfp93MJ4YmxN1N5tDjsCwyeNF/HWMkg5c?=
 =?iso-8859-1?Q?Nc1pXKS+/4ha+w1RIi/SB+y6TTD9NcYtTnyTSEcuwwRZk/qAw5RRBk8f3W?=
 =?iso-8859-1?Q?JwovsJVjVg6lwQVTAPuNYUFB3YVanIoWPFlh7XIfE60XC0wCbV68p7CEuP?=
 =?iso-8859-1?Q?4f0YP5gvfy3gNv2c1Kag5U5rosoNqt66wtB2OUfZlgrSLrOh+NhOaNzhJU?=
 =?iso-8859-1?Q?b0T0zJ4pska9SGE9PBGOLY+yYpq6Bt9SSCQJdkdR52zZSxEqHnSQ5Hjqd6?=
 =?iso-8859-1?Q?gCJF5b3TtQ38+hV47fNgL/Or/PSBBDHxq/oE9xT1uIFK1nnebHdk4Ysdt4?=
 =?iso-8859-1?Q?gDEGXklZVjTrOTDQCa7/4W66OGN1X/1VZrzPE5V7cYdzD7OC9HQjxCvanM?=
 =?iso-8859-1?Q?ZYesETs0GDKai/DahwfpsvuHx7ISP5HguMh0MHpA5PWQFjjd2rCIWb1kJG?=
 =?iso-8859-1?Q?Vig7YpYy8JSf1UDArNB1uFOMSZDq/WIYibbvjA05+a89EjJ8DSY38RwDCe?=
 =?iso-8859-1?Q?L278F0XwDv1UCjbksfWMo65BiTbSw8AHJ/gEqp9+JgvKKQSOsaoyTQpEEF?=
 =?iso-8859-1?Q?KvxqOvX4EG4Id/Qb5irSOz6i+WRX8QGrHTS//Basj5dJwqJI/13O4llG3r?=
 =?iso-8859-1?Q?4lllMU6K4La4UYEeDvbv6QYwnYTS3LKESWr5I4lRQZr781X9dnw27kJuU1?=
 =?iso-8859-1?Q?0cbhYMT36nWdGWjWURgoGASAcuMqkQMXHeVaqPh6eqEA2LXhe9LOxsSb2+?=
 =?iso-8859-1?Q?SPg/s87VRR4IBzAOdw028OU2qR793FGg1xXwzWVxrnr46BnWGq9FbiIelG?=
 =?iso-8859-1?Q?xkEmyqeCLSBXQyQ6NOTyJLc+7JEhY+CTBaQ7ptivntZ9ydUj1YWWUKLZo8?=
 =?iso-8859-1?Q?1pzsq9pVl7fCPC8ha7x7r2Mj9JUG2SeHwqMgxgjVICvvJYbnxza+mBpy2J?=
 =?iso-8859-1?Q?hNMD53klUG1DZPoWezarGJNOfDi24nPGkvu+UMdvCwMbhA0bDvx9fStbrL?=
 =?iso-8859-1?Q?zcFX1mv9RTNNa9Z4+WM=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: leica-geosystems.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM8PR06MB7521.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a1e8ae6f-e611-4f6e-19fc-08ddac9a45fd
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jun 2025 05:54:35.5287
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZBL76QG7LGPS9ZED7iH1ZOe8B+RQT3o80gHw5h3upvAXf+psmNGhgiptCXF4s6c1vjdwYJr1xUojtCFGGQ6XCUC2Yiryv5syqb23IydpVQPzZcI987OEUjdIEs6gzNet
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR06MB8624
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 16 Jun 2025 05:54:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117913

Hoi Jan,


> > Refactor the two methods to import certificates from PEM/DER to be
> > usable independently from keymaterial that is linked to a role.
> >
> > By having the import_cert_from methods create a storage location (aka
> > role) in the softhsm dynamically.  This way certificates can - but
> > don't have to - be linked to a key, or can stand on their own if chain
> > of certificates from a PKI has to be managed.
> >
> > Signed-off-by: Johannes Schneider <johannes.schneider@leica-geosystems.=
com>
> > ---
> >  meta-oe/classes/signing.bbclass | 42 +++++++++++++++++++++++++--------
> >  1 file changed, 32 insertions(+), 10 deletions(-)
> >
> > diff --git a/meta-oe/classes/signing.bbclass b/meta-oe/classes/signing.=
bbclass
> > index 8af7bbf8e0..c768371151 100644
> > --- a/meta-oe/classes/signing.bbclass
> > +++ b/meta-oe/classes/signing.bbclass
> > @@ -123,15 +123,26 @@ signing_import_define_role() {
> >      echo "_SIGNING_PKCS11_MODULE_${role}_=3D\"softhsm\"" >> $_SIGNING_=
ENV_FILE_
> >  }
> >
> > -# signing_import_cert_from_der <role> <der>
> > +# signing_import_cert_from_der <cert_name> <der>
> >  #
> > -# Import a certificate from DER file to a role. To be used
> > -# with SoftHSM.
> > +# Import a certificate from DER file to a cert_name.
> > +# Where the <cert_name> can either be a previously setup
> > +# signing_import_define_role linking the certificate to a signing key,
> > +# or a new identifier when dealing with a standalone certificate.
> > +#
> > +# To be used with SoftHSM.
> >  signing_import_cert_from_der() {
> > -    local role=3D"${1}"
> > +    local cert_name=3D"${1}"
> >      local der=3D"${2}"
> >
> > -    signing_pkcs11_tool --type cert --write-object "${der}" --label "$=
{role}"
> > +    # check wether the cert_name/role needs to be defined first,
> > +    # or do so otherwise
> > +    local uri=3D$(siging_get_uri $cert_name)
> > +    if [ -z "$uri" ]; then
> > +        signing_import_define_role "$cert_name"
>
> Semantically, this isn't a 'role' any more, but we can resolve the naming=
 of
> signing_import_define_role later.
>
> > +    fi
> > +
> > +    signing_pkcs11_tool --type cert --write-object "${der}" --label "$=
{cert_name}"
> >  }
> >
> >  # signing_import_cert_chain_from_pem <role> <pem>
> > @@ -164,17 +175,28 @@ signing_import_cert_chain_from_pem() {
> >          done
> >  }
> >
> > -# signing_import_cert_from_pem <role> <pem>
> > +# signing_import_cert_from_pem <cert_name> <pem>
> >  #
> > -# Import a certificate from PEM file to a role. To be used
> > -# with SoftHSM.
> > +# Import a certificate from PEM file to a cert_name.
> > +# Where the <cert_name> can either be a previously setup
> > +# signing_import_define_role linking the certificate to a signing key,
> > +# or a new identifier when dealing with a standalone certificate.
> > +#
> > +# To be used with SoftHSM.
> >  signing_import_cert_from_pem() {
> > -    local role=3D"${1}"
> > +    local cert_name=3D"${1}"
> >      local pem=3D"${2}"
> >
> > +    # check wether the cert_name/role needs to be defined first,
> > +    # or do so otherwise
> > +    local uri=3D$(siging_get_uri $cert_name)
> > +    if [ -z "$uri" ]; then
> > +        signing_import_define_role "$cert_name"
> > +    fi
> > +
> >      openssl x509 \
> >          -in "${pem}" -inform pem -outform der |
> > -    signing_pkcs11_tool --type cert --write-object /proc/self/fd/0 --l=
abel "${role}"
> > +    signing_pkcs11_tool --type cert --write-object /proc/self/fd/0 --l=
abel "${cert_name}"
>
> In the meantime, we found that we can also load PEMs with recent pkcs11-t=
ool, so
> Enrico will send a patch to simplify this.
>

is there already a subject to search for? or a link?

since this whole feature is motivated by the HSM limitation of one-cert-per=
-slot
(der), which could be sidestepped if multiple certificates in one pem file =
could
be handled... should we wait for the "patch to simplify this" and then drop=
 this
series?

>
> Reviewed-by: Jan Luebbe <jlu@pengutronix.de>
>

saw you placed a 'Reviewed-by' on the other patches too; should i already s=
end
out a v3 that pick up your suggested comment- and documentation changes, or=
 wait
(for whom/what)?

sidequestions: what tooling do you usually use to juggle patches?
and how should the Reviewed-by tags be handled?


gru=DF
Johannes

> >  }
> >
> >  # signing_import_pubkey_from_der <role> <der>
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#117687): https://lists.openembedded.org/g/openembed=
ded-devel/message/117687
> > Mute This Topic: https://lists.openembedded.org/mt/113394167/2167243
> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub =
[jlu@pengutronix.de]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>
> --
> Pengutronix e.K.                           |                             =
|
> Steuerwalder Str. 21                       | http://www.pengutronix.de/  =
|
> 31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    =
|
> Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 =
|
>

