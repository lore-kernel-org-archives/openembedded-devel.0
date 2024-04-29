Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CEF2C4345F
	for <webhook@archiver.kernel.org>; Mon, 29 Apr 2024 11:56:38 +0000 (UTC)
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (EUR02-VI1-obe.outbound.protection.outlook.com [40.107.241.46])
 by mx.groups.io with SMTP id smtpd.web11.18780.1714391792663066965
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 29 Apr 2024 04:56:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=V0axkurZ;
 spf=pass (domain: siemens.com, ip: 40.107.241.46, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cxjkKV7WD5D+mRI2CcUG13kCcTpSVsVS7ZwKLHD4ZnmSX3JYReWJeEfVudA4fkF4/0BRSlL7+kUVnwEoGphpl140SrthecCjugGTL3+x5KL55P3T1HQ0RG1C+l1eP+th6Lk7iJLwrXqhgXlbFcu16OUTgiKUzrLWAc7BnF9YHWA4ea+UwupE1tK5Iu9N1FtlSiSg50aCQKEPvhBE0pUicaaUERq+ZeMYXbo552xo7+8L4PIp1nVFDpnWfXKyEHgDHLD1U5Z6Wn4/oz3lVG92Ua9GMOvRt2XqUrT4oEW2OCa3RuU3uN4vnMzMkAgY/vchzen7HaBY/2MNWH8IZ/L/CA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DkKJojYD8XiK/k9qilTjL+5uhx6iGr5fFMw0oBDmVyw=;
 b=N57ZIiDS/KqEz3DDKuALNPQaenSGKWomCny/9Iogk+Bl86zz8NrnsO4Xzdui4g9DfJF+w0I7/Uz7dDen9GxwJZwhc+du3Q8G3QsR8RFhdsD/wg/AAW8P6kw6tZgeQlbQX6wd6L2T6SFfo9nli9g4b/J/qw2YkAWuyxFRAIkQVkOnyUJof/zvSsLGi3S/8yVLDzQKo2wbQ9PSL+hdi/RdNLv+TrKC/35Y5/BRZKhk3MioR0JFWMsf/OyZCmUAP5P4C4MvqT1Gq3NI4wSwUb5uHpsoxeB/ujTQV6QZbGJ8nVlZu0ndHPNVs8BxrycslRqqxYqCiiF2uR99Xcwh1lxflA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DkKJojYD8XiK/k9qilTjL+5uhx6iGr5fFMw0oBDmVyw=;
 b=V0axkurZgefYVDS1Xgo9iPpL4TFM8xhyOXJnLzbmJbz8p/gFs9331j50gUPDBWhz2CeoxRxi6rEMnqVkIdY+TrSagbIt7nIPpMJZoFqBOvN/7bmyjCjQEAmdpMrN1Kw6LSSeMRFJnAWsQ/lqOauKBbG4zFj4YDRDgJnqpMeNj2dx/QZG6j6llPJetUaPEo8QdnH3+4v4bm/Dj+LpOSoyOQdfxLzXWbtbS4rSzb82a7sqWEjKnoCW8Fq8bgX/KrFgfaHgV9ZkQExsb9QmvcbNOXKu1B1fPMCiTLgjpPyLDfzsRkCkbf5wTClNeJxCpnmzaUZk3kksR9lz7jU+V/3Kdw==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by GV2PR10MB6693.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:c2::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.34; Mon, 29 Apr
 2024 11:56:28 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2%6]) with mapi id 15.20.7519.031; Mon, 29 Apr 2024
 11:56:28 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: "ninette@thehoodiefirm.com" <ninette@thehoodiefirm.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
CC: "engineering@neighbourhood.ie" <engineering@neighbourhood.ie>
Subject: RE: [oe] [PATCH 1/1] procmail: Update status for CVE-1999-0475
Thread-Topic: [oe] [PATCH 1/1] procmail: Update status for CVE-1999-0475
Thread-Index: AQHamiUh2mDBXcDr2EW97HwYUtUwoLF/I8yg
Date: Mon, 29 Apr 2024 11:56:27 +0000
Message-ID: 
 <AS1PR10MB569715FF87D60F790400FB2DFD1B2@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20240429110459.52299-1-ninette@thehoodiefirm.com>
 <20240429110459.52299-2-ninette@thehoodiefirm.com>
In-Reply-To: <20240429110459.52299-2-ninette@thehoodiefirm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=0a5015a9-2e2f-42cb-bd74-37ce6fd392d4;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2024-04-29T11:54:52Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|GV2PR10MB6693:EE_
x-ms-office365-filtering-correlation-id: d1726602-b0e9-42f0-9eb2-08dc68436706
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230031|376005|1800799015|366007|38070700009;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?hKfOdKqeDtMq64o80GCQR85ZsnW302bI0yPPMQHXlYFDc9KeQMPGIcKySnr1?=
 =?us-ascii?Q?rZ2Jr9wB+bNsU1Yy3M3MyQrD748cRxzD0FfX2nQnP8NY9Xiu8bmEATgOnOE1?=
 =?us-ascii?Q?AEEmNv++MRadzf9imdITiShRK0adERq2eVyoH97LnekDmCZGsTqGLeXaqgaR?=
 =?us-ascii?Q?7Z9TDt2UecyawvpIufqmp3ZhjY/7kx6UW2K4k3L3NLGE74P7l/ljcGI2mvYK?=
 =?us-ascii?Q?aYX9H2qtSTEkpkqfxT4HVO6P0JGuPDxvRNbHcoMnVi+YMiZE2PfX4YlJoRqL?=
 =?us-ascii?Q?0xGzzKYzjplY2gCv4l4ZyC9/B/LOfLVtUptox3vKy9dZP3aLgJo6fO9JFgay?=
 =?us-ascii?Q?cHetmm0Km//YjyHHKJROX7cF7IRhhP5yNmGRmu4EF3JaHSyM8RC1/NQacT9M?=
 =?us-ascii?Q?LTycX8srHpLsRcWMrtJwavFzjXH8fcFGenfJROWHbxY3py5NgOHoUflwkRF2?=
 =?us-ascii?Q?CNx8Jw84llslWLWQ3bTeAWxtAzrtaWlMb+8vqr6B1ORJy+YgCsAL7kekKeF0?=
 =?us-ascii?Q?yvo2cldxQgTwJsFdCdNjv8ktXjsPdDQ6uXOTHFegt8TaVnrhbsOifz65ZSCu?=
 =?us-ascii?Q?jq9ezzJz10G9jGWQPN7aJCY0bgS4irvzRKuF+HCbgaQXSJyyGcNhHFlrdjcb?=
 =?us-ascii?Q?MqbmqCOCtX4Q8gRTjthVTSKC5HbyBWbNKnoTxMKcMHZ31U9eSCl9w/zaEdmQ?=
 =?us-ascii?Q?asXniz4VB4NK9h7chXkvMCQuhXhLiT8nTf6yAaaKeMa8j6bzgqyYQJ/uQ+dL?=
 =?us-ascii?Q?/6nLX9C/RO7LgdOlI22xzJl/zoZf5/8U8pomajv5i+M2kGFFvEeWr4dAHgUw?=
 =?us-ascii?Q?fRGaWppuoBbUk/3+B2NJFnyOkiaO+EDnE1+tYoED2kY1mItKcErqrK0hikAU?=
 =?us-ascii?Q?40Bvq1FSf+KRrjoivUU5X/iFM7+e91lHRh6JMWgNUXlCfEHf+x5OIW20INaF?=
 =?us-ascii?Q?pZ1YJWZBk2oGXXAdWUkye+t2WvITUJ8zVQcNsh1/ZtKGUPEcgAp+je7tFTDn?=
 =?us-ascii?Q?+dnT8KOXBEar/a3sBPDcKJhdpp+NBZie1fB6dozTpJjgSI07IEA1/axOhpm7?=
 =?us-ascii?Q?Gby/H6gligLLyNziTU0uKCjMcCTPEv6Z/JaVrzWpDqsooMVyOox4JS+Zxi0u?=
 =?us-ascii?Q?6sTHa2XYaxuKSLzlLS+uP64PwXbozZ7WtslM5wCuXEh/iFEG60l5G5YEwATU?=
 =?us-ascii?Q?dl3CWAjvDh5zNi0lphbGGL3OjIPZhLVGkeMGXqBYb6LTEm8cFcgzWxAIlfV0?=
 =?us-ascii?Q?sxElcNouQEh+8Dw6JO+TnlQF33uXRSULnt+EBGD1ag=3D=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015)(366007)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?7Djt16lgmG4R/S8z5PNoDCnnBMtUpgEZAtOPWnyVQBeHKTN8zE4xCd5H9K8Y?=
 =?us-ascii?Q?bVP9cBZxOL3PE90SCYcVguvZWmJWZBp2maJEA2EoJKcR7PmikTIz+EZ4Skz7?=
 =?us-ascii?Q?YMfHP8i+KNrj3CvytO7upgIw0tEqwwvoDWEJRjZ78/3qovoYMAdLCOt5tMRu?=
 =?us-ascii?Q?hONAJkGGRa0GTtXwjfvpQoZhx2ydMMDH80h7LHy9JS5j6Ls5GLQWqMFi+CmO?=
 =?us-ascii?Q?RspElym6XHvKFZw3xjnBFp32eK3XuCIMOZ0nOF6+PihHVuCUmsB99wy9NxZK?=
 =?us-ascii?Q?Z72Pl73h7rLKkYismOHTc3otXTfp7VvFttmgLB0PsEGNy/KkfjJ66U1srPIh?=
 =?us-ascii?Q?S9APfRedO4MQJbHJyyFWrnTq/ZgAgHribcbZaMqRYjouHMYDHUcrjT66kn1c?=
 =?us-ascii?Q?GonBcvYhpFzO5hobZQQh9yTb5gvlXIUjOdnhNdwwytiQgElnRwJHPrQyQIge?=
 =?us-ascii?Q?ikaVYGyjh6bDTyZ2z1AvTz8pxiZ4LMgU/7C0Y5k/96rfhgYWXrX2uvfyWdVt?=
 =?us-ascii?Q?ww++dcdYytl9FLwmwzmSjOQEGIyuYET0pSOdljuJ+9zTZrV1RcAbYRPItTl1?=
 =?us-ascii?Q?imkVMoTDBIqo+rnhA4RsDeKWAWUWvadzD7pB8fZrJs8KS7R9ll8amQj7fZ6i?=
 =?us-ascii?Q?nVQ0Z6BOF2kdsXqP5t5islJQ8E02CyDqtV0iGC3NWSDtOU5bhYAJsXi54ltQ?=
 =?us-ascii?Q?xH4CCMjyQAlgm+MJUDoaBE72mueuOuIq6sHL+v+W8ACTRzoDJxvRw9t602w8?=
 =?us-ascii?Q?F2HjKS7C6Bs88U7nMn48WMOdIUN6Zkbb0C5CNL0fmDKM+EdCbZZomvBv76gu?=
 =?us-ascii?Q?BgMpzZV7X2Ngi0ZtVNj3FvCDkei9vXXx37l5XJfeoRtD/yly9yvoW69f3jq+?=
 =?us-ascii?Q?O+RkifdXUFFkOe2oN5C8irwZo1p8XUsUlk9YxIuwO9eYYV5CHoBeRlQ7u28Z?=
 =?us-ascii?Q?F3dSzrsztZI3BD8HL0W6XqdjAVagytLdupX4xUNwuZSWyKP0UMAJ9jIJQ5F9?=
 =?us-ascii?Q?MF3UvOcqyGXemHuOQdxEodMDFot+BhO3ip6lE5c60qWSooYsUHhSxB0MkaYD?=
 =?us-ascii?Q?fERKp89Z/0Uspg6rX0+Z97R7O+iDa8HDFiYM4piLq1sqCTPiNR0gBv1P0+O3?=
 =?us-ascii?Q?/CNatjrHS2I4gJZ4FSQW2gBfdwFsGOnrHRx8B1gTN/0yqf9E3bHhIODh5tVH?=
 =?us-ascii?Q?D2hqkdK8TQ/8aoKa0deQ+v1OT0xWvGytMYW2T6qJNUnN3Hajs+aZ4skx8fyU?=
 =?us-ascii?Q?CZuSd48pqEcsfdjDgINfor3BgzpInnninp/uTiMO+O1gNP4tW/kjOao3E9Ba?=
 =?us-ascii?Q?8w5D5vRmEFwhpNxt3qPmlyGyCqWa9HtBDGTxT85DzIYq18lyO+yU7i6yRPE/?=
 =?us-ascii?Q?w4V07mqweVx/vwwktJT9C7M46QeZeYZgNMUpnYa5QrdDdbfrieVT80qBG25E?=
 =?us-ascii?Q?nUKhNmB2AmkF0R3kZBWntRFhPHpG5cpTQFXkH+Dna90dki/VtWqtcThCt2YY?=
 =?us-ascii?Q?5eao/17pvOc+0UWNHUSWu9QCCvaVFgUarQKJntGKHBdiCH+tFIDLKFE9M3vB?=
 =?us-ascii?Q?8S+AgBFnYPeTkiapU2LHfmXl0By6OOzFQY07w5H3?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: d1726602-b0e9-42f0-9eb2-08dc68436706
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Apr 2024 11:56:28.0077
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hnpKP1Ln+7udws3YnCldJTgAyQjJqDm9T6s01GmM4qgCUlhaWoOOqAzD1WgohjWjOWj/Hz0dvCDS3570Q9SrXQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR10MB6693
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 29 Apr 2024 11:56:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110181

"ignored:" should not be used, see https://git.openembedded.org/openembedde=
d-core/tree/meta/conf/cve-check-map.conf#n17
When CPE matches wrong version, then use "fixed-version:".

Also add newline at end of file, please...

Peter

-----Original Message-----
From: openembedded-devel@lists.openembedded.org <openembedded-devel@lists.o=
penembedded.org> On Behalf Of Ninette Adhikari via lists.openembedded.org
Sent: Monday, April 29, 2024 13:05
To: openembedded-devel@lists.openembedded.org
Cc: engineering@neighbourhood.ie; Ninette Adhikari <ninette@thehoodiefirm.c=
om>
Subject: [oe] [PATCH 1/1] procmail: Update status for CVE-1999-0475

> Current version 3.22 is not affected by the issue.
> Affected versions: Up to (excl.) 3.2.1
>
> Signed-off-by: Ninette Adhikari <ninette@thehoodiefirm.com>
> ---
>  meta-oe/recipes-support/procmail/procmail_3.22.bb | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meta-oe/recipes-support/procmail/procmail_3.22.bb b/meta-oe/=
recipes-support/procmail/procmail_3.22.bb
> index ba268de0a..723e15d10 100644
> --- a/meta-oe/recipes-support/procmail/procmail_3.22.bb
> +++ b/meta-oe/recipes-support/procmail/procmail_3.22.bb
> @@ -43,3 +43,5 @@ do_install() {
>      oe_runmake -i BASENAME=3D${D}/usr MANDIR=3D${D}${mandir} install
>      install -m 0644 debian/mailstat.1 ${D}${mandir}/man1  }
> +
> +CVE_STATUS[CVE-1999-0475] =3D "ignored: No action required. The current =
version (3.22) is not affected by the CVE."
> \ No newline at end of file
> --
> 2.44.0


