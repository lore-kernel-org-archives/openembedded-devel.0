Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3278C4345F
	for <webhook@archiver.kernel.org>; Mon, 29 Apr 2024 11:58:07 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.69])
 by mx.groups.io with SMTP id smtpd.web10.18983.1714391883024354074
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 29 Apr 2024 04:58:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=qQ5NMo00;
 spf=pass (domain: siemens.com, ip: 40.107.21.69, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AKTy4Lt+SjtdbT3opIJyoFiP8BSjpPDyZnNEkp/8iESX11AlFaZI3cY8acFBVrULBuypqGSPGP7ji02bnkmvZwI8nBEm0HX6xoPZQZjD5o8Uw4MTxBz6vVvThuLrTxQm9ZkxJunvI3dpPkp0ZLTPOZoFptMPCfLpXjj7621acIqqZUkkK99DZDbBcSgw8PnMdhCrlDt3mLZvfNhNQs34ZYwMuIj/EPYrw/r+rLepHzhfQH3SZevjnpvuzf20ijNGFccrWkfPvSiAkauA1ma44WmveK4LABTvSNQLVKXKOpyh/7/lk4NvryvD5QUJT/a+OtFTyWUADRavSa7bypUI9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C5MfkjqwcqDrnJxFvZcg8IEvEqfekbPN05IMpwdYSC8=;
 b=C02MbLULIMi8xm9pkwAGwDeXrZ0TB9uXQQUbaPLI30HxhUY9JllvWqp7qMklXRygHfxakwe0iMJ0OJSLkgL8FaB0gJfLDgf55D6notZV/+Ys3uDyKolCv4+BajHaLRruAMJp+9RGWwu+i2w4Llpinfb9kOT+klIAyHKqnQXmCgVQOBEAMzjkdPwJeQtcdyt6F8xW+XjglNoQGJ6erbsPX6YKZ2wnny0dwJ+qIm2NPf4cTZM3OxVTJNoTuxFZAEvLKfmgoQyXiNGyKhDLbllAnhZ2bRxcevejSD3n7kFG6YIQfXYTtr4ou7ZxhfnK9/lkF8c+zzCHUVz/kFKBqBK8ng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C5MfkjqwcqDrnJxFvZcg8IEvEqfekbPN05IMpwdYSC8=;
 b=qQ5NMo00P2lAjhvnwGK3JHKt43496Xup6dBTltYDywiWYycpJPZJSD41BBqrfDh83MFEwE5w+wadx+DJeX9ro9Q2DtlO8YShbiVr4qwyrtRaQvlMnkWyURk/wS/3WJMwNg61iD33gzQyhmpVZ7g/V/8dh2JWTWbByyj8dq7rjn1Ll+iFhgz5mhpWAobC1+ddABWmC6WXYAtB119PrSDi/OxYRISqzkrygQV+Snl6OodEjIztoRmd5kRunX3f//M/knZ8fqqIC7ZfG5xI0kS0vBY5McmmFKzWiPgspnFmA9LOHkwe33ndyLhDaYGPmjV1FvqXLa0tZO9ZYmfD8wJQZQ==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by GV2PR10MB6693.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:c2::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.34; Mon, 29 Apr
 2024 11:58:00 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2%6]) with mapi id 15.20.7519.031; Mon, 29 Apr 2024
 11:58:00 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: "ninette@thehoodiefirm.com" <ninette@thehoodiefirm.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
CC: "engineering@neighbourhood.ie" <engineering@neighbourhood.ie>
Subject: RE: [oe] [PATCH 1/1] open-vm-tools: Update status for CVE-2014-4199
 and CVE-2014-4200
Thread-Topic: [oe] [PATCH 1/1] open-vm-tools: Update status for CVE-2014-4199
 and CVE-2014-4200
Thread-Index: AQHamiXCfi/2w/akKkilcxcmGD3FD7F/JJEw
Date: Mon, 29 Apr 2024 11:58:00 +0000
Message-ID: 
 <AS1PR10MB5697918A4420D720F71CE2E0FD1B2@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20240429110937.55865-1-ninette@thehoodiefirm.com>
 <20240429110937.55865-2-ninette@thehoodiefirm.com>
In-Reply-To: <20240429110937.55865-2-ninette@thehoodiefirm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=9f5f7374-d498-41c8-bc11-c40a50a844dc;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2024-04-29T11:57:38Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|GV2PR10MB6693:EE_
x-ms-office365-filtering-correlation-id: 985ab097-4fcd-45e2-9022-08dc68439df9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230031|376005|1800799015|366007|38070700009;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?8L9KALNoPTY2xuvOXaYIEwOBmpser6nQi/boowRMQZDXzYYD70C7Y03xWEqY?=
 =?us-ascii?Q?Owg2jUzPyLE7yHN8GEpmhzkiWflANWlq7KerG9nyP3rbU9adDd/0PY8x+gr3?=
 =?us-ascii?Q?dQnmRWgVsWG7E80Gv7cqy/HLasTkFqV56uV70s7xsP8WchQSx26GXM8Ae6dQ?=
 =?us-ascii?Q?bUgSJPTRvEIpsdAPNKACN2OoYmmGePFwSyTjuNT++Kk3SR3FqEsKLjgbICE1?=
 =?us-ascii?Q?PQEE8t3tAaVWjzE+L7ZU8at82dGkk0ZMGGTgx5Jb3SsWWIR5z0qP7uFP9o7a?=
 =?us-ascii?Q?GQsNT6lDCHEcjFwBdWy+xfQrZLT8lHcJEDV1inSueB2Chk/m5sK/gNLGglRc?=
 =?us-ascii?Q?OZitpWp3zquXc3Gk/5bPFY0FTGy60nKRyJkK4fqjhKycQ+USkrfq6KS3Y3rI?=
 =?us-ascii?Q?tciOxJifm+Ex8LC42gCB1xJxjrxH+tBZp+htcHli40BP0tgs8ixE5lyvX0ap?=
 =?us-ascii?Q?k+YllMipKrku6MMm1TzZhq0RzJwotOLw17YdqRUZv+4jny3b8UK9+cgW6cZ4?=
 =?us-ascii?Q?Z4PpdPgBN5GWE5J74nZXc9t1z7JFFvwNRvGhxQmusdPDmA9Kz/g4lgtyOkUh?=
 =?us-ascii?Q?0VC/KKBNCg8S0tmJtQdEddtfhpRT7F9/+BV9ruAGHnxrKyqmtoDxgafEsg0P?=
 =?us-ascii?Q?jXK+QQqnyfN4Gl/TmxE+RRhtnrZJAYDgCfrfaWqKzxAhMc8KM1HForzrzLes?=
 =?us-ascii?Q?zW2M4mcIKHB2ZFwUoopoja6HFeRkxus7hLWo0hYM/TNhlYpuzKP5Cf2IZonL?=
 =?us-ascii?Q?FJNwY/QQIsX9VIuN5d8C/Yvf8geTrwwCUc4naXU1B5zqjBuqIOgwYLdSl6lN?=
 =?us-ascii?Q?UOVCBkJMFS154KrZ/ERvjCAg9ukZ0woREiEaKTwbRd0SXbJAUHTpvUIzrgZQ?=
 =?us-ascii?Q?PXLDRxgapjmUhAjJcE6dP9yutaHIJ7sWvM3OIcq/zy0IrwWK5W89Wa23PTZr?=
 =?us-ascii?Q?XT0x9kxdm4NKd7KRxrLkLQzXAcboZNq0Fjn52m6LPYYK6a238vpZf3iHYhx1?=
 =?us-ascii?Q?78b4FbeNGBUZiuW3jgjSLnYa3wpRguwd5WtQ6DETBeaWT+F9y1gsbURT9PiV?=
 =?us-ascii?Q?UhN4Pm+j/2rb3AUPDRRi/jELUUn/5hBNgkMAGkoSZm1ZhukSWCs38gl6NeoM?=
 =?us-ascii?Q?+3/1q7Ap0FeVyU3y8jC5KAF3+Rx9vewfjlYa165Jfe/wBn7Jtcsnm5BPmTWW?=
 =?us-ascii?Q?a0W1yzFnxCgm5PAqnv/YrJZgmyoEFmTMjSZuP3rGsuD/FKFBH2cSoMrTgXfm?=
 =?us-ascii?Q?HNZ/ypXJPjfMEPxmKTQ0vFIj+PmWYAs0FsHb4/BJew=3D=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015)(366007)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?ElBF6/nSPRrxd6QO97zXW8NUoqD6NnIYDtMUutPf3MdxM3u2qCVhdm01uBlU?=
 =?us-ascii?Q?/jRwWfJ9V9NfF4kLgAbfjKJFxFDSoxoigjvRdwAEhGu5xqXubeVBaUTvyMiC?=
 =?us-ascii?Q?iYcfXE+eqDaYe0kMfxdIvglekapaUxZpoO+u9hdCh8ghJqI5s0RC+wIoRr+Q?=
 =?us-ascii?Q?h89VfDVFfjr8w5qi5jdKXnxVADLr+rivz8U7858H7Ud7FnCzj5MHK41/uGnX?=
 =?us-ascii?Q?KYIYAs5Bh6iynWfQ9260sd+WGGLJ5apIqwOU7lkwoyofcGi15gOo4YAQVPFH?=
 =?us-ascii?Q?qbC1Rww4wMxyvPmlLrdZCw02cxkgKYBOU/wmOu6VAKAu7Orz67j2JFcYlFVM?=
 =?us-ascii?Q?r8Tek965GAdOkQEHeCpn+spxSm1I9YtmuHql07RPoBzgsoAeQhoznyuq0brP?=
 =?us-ascii?Q?TSG049gcxu7KOvFV1aWd7PxIy4PfRozPCSg1pfM3qgizaM0Owig4SHEOPL/C?=
 =?us-ascii?Q?PKc+SCZ7BB9YMitExiEzy3onUbvxmiU52HQHvNtvOprkjVRx5uquB9TeR+l6?=
 =?us-ascii?Q?xq4bjStWhatrfiy07Jr9TJUliLmUcvgnXPnC3SRdcZ39nAviptKxAKe4IGux?=
 =?us-ascii?Q?GwXOcCckjO9m92croqq5yIBPb47O1JTmpBSncVzKtk6CJVpEC8ZG7Hyc6uDK?=
 =?us-ascii?Q?KRyvizH0y9ek83nDR/sb31IP+noNiRPFKaeZBz/WJRa2PqagBP9g/r6cO7+U?=
 =?us-ascii?Q?cN/iGDIp7CrXlJzefzhYqxghegRwuiB8k0Bc6OukZZsgx/4fYgz50ugTcuxl?=
 =?us-ascii?Q?q/fEtc91kysAfoKsgEZ+6eDFdBFuxwpWv//Tx2bIIGwcmqt7MzjcFd0Otdt9?=
 =?us-ascii?Q?kKJ7wDBMbA1CcP5sB+FxgYMK7JMoStzPMtKoDibra3548gvUnrq1/dYltTVI?=
 =?us-ascii?Q?f80pw4WpCgLdKzu1+9/dV4XEMPMsrtjQtEyuqqAKBsMsyqdRe/4k9UlzoDAH?=
 =?us-ascii?Q?JXQPhD0XqfqTExWG0+SqP06VsnblBFEZsXRxrS/Rec7ywwFEI3zTCsFfqYA9?=
 =?us-ascii?Q?KdzDlJ7D2rh/NhO/nnx9CEzFrhVw5Lc6fde9tUeKXBwg2zXo9oFgXUt0lMm5?=
 =?us-ascii?Q?j46CQonEo4POvo9OtA1LKmFtvawT1xUJk3VR7stRdZf17CqzfGhcUsvXq3Ny?=
 =?us-ascii?Q?7+vVZxexn7IIEWFzU8Ma/t4TXUvPnin+XydJ3jDFIoLTYVFUJqk7DAggJOZV?=
 =?us-ascii?Q?4NtkUDr9VmjXnWcFXnSnsXEAEsrbi4zMOOMvrSGhjF1Rp/L//eeMhPfnyrvh?=
 =?us-ascii?Q?73uVwuA5zmCnuQ6xy1w0HdEGK/R0rhqS6vfqM85INGBLU6nVgnTvC4NKGTPh?=
 =?us-ascii?Q?SBttL7TIeRgpLa7XVY113+wH2cvKNNfAGePBlcOShxlPVKQ9sR5BRKV0cb22?=
 =?us-ascii?Q?PeiD49WeaAH0qX4F1PEUQgn3UxbGZqKDQBIpHmI54DiFjaNNaVlrEwPLBx3G?=
 =?us-ascii?Q?JEI0oRYSBVXj2r7hCVYo1Snh/R9pU9ScifoYE076ychQNmg/syxD+0yJiba6?=
 =?us-ascii?Q?3MYglwKtVOkt1pYqERGo8culHBqoGMEGsfnRhgdoBN36+oFD24y/vSlTomVj?=
 =?us-ascii?Q?uN5psxSfmxYCOqgTrWHK4ITIU2E0Jl0QVY9VK+9+?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 985ab097-4fcd-45e2-9022-08dc68439df9
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Apr 2024 11:58:00.1634
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jvnmjzJbUlphKGrWXISkOrWnSxyiZkOayAzXACJDBH8bUoEt/n93VSAxiWMXQ86QH1doXhSz1SSqJvYx3VaYMQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR10MB6693
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 29 Apr 2024 11:58:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110184

"ignored:" should not be used, see https://git.openembedded.org/openembedde=
d-core/tree/meta/conf/cve-check-map.conf#n17
When CPE matches wrong version, then use "fixed-version:".

Peter

-----Original Message-----
From: openembedded-devel@lists.openembedded.org <openembedded-devel@lists.o=
penembedded.org> On Behalf Of Ninette Adhikari via lists.openembedded.org
Sent: Monday, April 29, 2024 13:10
To: openembedded-devel@lists.openembedded.org
Cc: engineering@neighbourhood.ie; Ninette Adhikari <ninette@thehoodiefirm.c=
om>
Subject: [oe] [PATCH 1/1] open-vm-tools: Update status for CVE-2014-4199 an=
d CVE-2014-4200

> Current version 12.3.5 is not affected by the issue.
> Affected versions: Up to (incl) 10.0.3
>
> Signed-off-by: Ninette Adhikari <ninette@thehoodiefirm.com>
> ---
>  .../recipes-support/open-vm-tools/open-vm-tools_12.3.5.bb       | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meta-networking/recipes-support/open-vm-tools/open-vm-tools_=
12.3.5.bb b/meta-networking/recipes-support/open-vm-tools/open-vm-tools_12.=
3.5.bb
> index 6696e552c..90d97cf7a 100644
> --- a/meta-networking/recipes-support/open-vm-tools/open-vm-tools_12.3.5.=
bb
> +++ b/meta-networking/recipes-support/open-vm-tools/open-vm-tools_12.3.5.=
bb
> @@ -120,3 +120,5 @@ python() {
>  }
> =20
>  CVE_PRODUCT =3D "open-vm-tools vmware:tools"
> +CVE_STATUS[CVE-2014-4199] =3D "ignored: No action required. The current =
version (12.3.5) is not affected by the CVE which affects version 10.0.3."
> +CVE_STATUS[CVE-2014-4200] =3D "ignored: No action required. The current =
version (12.3.5) is not affected by the CVE which affects version 10.0.3."
> --=20
> 2.44.0


