Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D107EC4345F
	for <webhook@archiver.kernel.org>; Mon, 29 Apr 2024 11:57:37 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.88])
 by mx.groups.io with SMTP id smtpd.web11.18791.1714391855474341135
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 29 Apr 2024 04:57:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=ez5OeJjb;
 spf=pass (domain: siemens.com, ip: 40.107.21.88, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FY0E0pr1hDAW/7m0RS8oRZyorbDnWRpJdOPxiddAsEicjyPj98duoUYx1BD+a5XTukUM1ZBS9ilZZNoh7nvxSOzG01S8YZbNtG5lliIrTWITlcaqMgNLnyQx1bH/H+RBJVZPlXFKFOGGSc85c1nGxA5PcAZkq9gReqENvQ9BarKxvNjk9wOVuh4w70GPKSUcMSatd0wsv5biu3jPlIep+hxIJMemWoInRK47Pw4MEn/L9DdE6mHuDk2HF72KJNyxkuE3elOeqn4RdDyqRaJOz7HdHrqtQGBFQ5qNMWiJqUQKkD7wVSP+lNt1EHhJ/pOcuLpl4tQXIO887QENoAWEaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=93Nz92BQjA6JC8aqV5e6y7ECLp23DQkRtouiZtJMVIA=;
 b=LmD+1jweQu5+cr0KuNrVWEUfY1sQxrF2eY2NnKpXgaHDda5TRLaU915gk3rzKl1fj0ixB4WQyPaKC7D7YgWhGpoBX/edjcp59p3uh6RRzR9GJnBtBSXU8EgcAeD9wtSGXCjAIaGOIVhKi33u7sbkg3Dv4nncd0zOCrIzJv86Zo6Is54HHlho+jkYXbBZrpmpe3+ht40tyTtqJWaV7c7bfoPOKIGeuJjuW5G0o8kzUQxOc+HkxxExZUcs9gbJLOeNdDwdKdi49g513HTB10uN5dHVr1Qb66BAh4PBwDEV0BGlhOBwlF0wP8fqM88df6N1JjuHl4Zged8rs0T4aSfxRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=93Nz92BQjA6JC8aqV5e6y7ECLp23DQkRtouiZtJMVIA=;
 b=ez5OeJjbJ8ZqQ7zwhSb2L8gSdycl/Ckn1qPuDBI2a8JHtIurmcjF/qItbHkIGXQRcTZMs3W+ew0ft5ZHHw6xKdWdEqi73MCt39C805uVrLKzzsqrKPyOuZsCF3GAqDAMbgFATNsuLhphsx2cDOAvx9KIhsHtzNqUVXaTq7LwjQ5FjOhOAJu6l84Z/QwdafG5c4ZGP/Bbqc32UihhY3LXboqJbzvAQ2u32+YFkSh4jOnDayGyTqlkU5PXwIX3XdnEFZG8+Xnsq5LDHv2zuUkBpWDlLX2aaAeIvNd4OF9Wf/+LQdGexJB8El5TIUzZUHg26J2kKb6O4A15RJ4vNZjhtw==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by GV2PR10MB6693.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:c2::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.34; Mon, 29 Apr
 2024 11:57:32 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2%6]) with mapi id 15.20.7519.031; Mon, 29 Apr 2024
 11:57:32 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: "ninette@thehoodiefirm.com" <ninette@thehoodiefirm.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
CC: "engineering@neighbourhood.ie" <engineering@neighbourhood.ie>
Subject: RE: [oe] [PATCH 1/1] sthttpd: Update status for CVE-2017-10671
Thread-Topic: [oe] [PATCH 1/1] sthttpd: Update status for CVE-2017-10671
Thread-Index: AQHamiWfMPzX2maJ/0aWPMyVhDzLo7F/JGTw
Date: Mon, 29 Apr 2024 11:57:32 +0000
Message-ID: 
 <AS1PR10MB56973220F2C667576A4CAB35FD1B2@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20240429110835.55086-1-ninette@thehoodiefirm.com>
 <20240429110835.55086-2-ninette@thehoodiefirm.com>
In-Reply-To: <20240429110835.55086-2-ninette@thehoodiefirm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=2b131167-e9ad-4589-97d3-e743dead7fbc;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2024-04-29T11:57:00Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|GV2PR10MB6693:EE_
x-ms-office365-filtering-correlation-id: f049d57d-e806-4729-a5cd-08dc68438d59
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230031|376005|1800799015|366007|38070700009;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?3p8tq3HhZgpTQSoQDqVL/4oLu6EWkdHpan2X2nrBWW/T4oAyP5cU9GfKFoQx?=
 =?us-ascii?Q?NxfrtZ7Tjr5sgFC3dXX4Lf/pIjI0mky560fzjX0g6gpk7kIDSxxpG/cVVXyX?=
 =?us-ascii?Q?lh4mpg50mMQd77b/7PycNDTHfG5SQhbRUZjQq1zV4VKU0SjVkYtoKVuxXtEk?=
 =?us-ascii?Q?CUnICnC1AFvJ/9iKfVWAC3Y6zEDOv8D+Xt2Y/fyzRpTNmfMf11SxWhiWVgMN?=
 =?us-ascii?Q?ee4AOE/undDLoLM/ozgSatl19+Ogd/l4knNBkR0nEWKykMpGylc0/5ofUDlc?=
 =?us-ascii?Q?56CX/lNVAomOu74gsMUPMzARalZ5VZgiXKQthtYzgu/4ATUr/lr7+pIRT+zI?=
 =?us-ascii?Q?kJ99wd+Zx6NPg8EEkEbRwhnNEGnZ9Osmpaj+F6ZvfjMvV02ASwEou0PaQGiG?=
 =?us-ascii?Q?lcTBDlk5XwkdZGKeDea0ZEihdLAoeawFied4Hvpxs9I/6OyxAL+l+I4jOMn/?=
 =?us-ascii?Q?tFs+z9Xr/QhQK5GHlk5GQMXng+MWZVumIAbTfZqXR9irr+AJ/ys3b+xbX3Ed?=
 =?us-ascii?Q?ify8rtPZPdxPJ+qiqapl/zcKgefHIKwmHR10aPiAK3q50S87CdqkU9PsSeYY?=
 =?us-ascii?Q?ZWlF7KrBgAnMxnmaMwvn3/I9abyfmw6JyeJEYWJmp5zBCpf3z7Hbl2VPT9Pk?=
 =?us-ascii?Q?tnCnKj4zAdRDu1InKNnzDz+zifEpAAu2zQhmSsWW1LG9ogbPtm3aZTbwIXuw?=
 =?us-ascii?Q?1flD8ZpjCj28233D1POfMPqpo+wClCLFUGnUDzq5grDKWy7UPTErMtKlCK6Y?=
 =?us-ascii?Q?pJlZMBIkKg701yuhY6KovPMpLEKoZH8i7ZI77V/h3a1j4YS+DmiV54Pm+h7m?=
 =?us-ascii?Q?2EiZ6iFPUIl7d5fc0rms3jol8SdIrUyGOcRAW13/9M+a7bhuUBrmqEUswRfA?=
 =?us-ascii?Q?MFUm6vcz7edltEQX7jem2Ih6Bcb7Zin5WUojNglNLDGDw4F5Yu3g99GwVB98?=
 =?us-ascii?Q?WaJIJ0pDiyB37hDE4Ol8ZD39bwxHXy+TBQj4Qj0SJnYP+X6gvpc8PD+lJgeO?=
 =?us-ascii?Q?vSrlxYcHuni5KhdpfeTfw7tfzebUVcMggpCFztMzgZzRHdg9COfiSzuP2AkV?=
 =?us-ascii?Q?LwGD0atg1UW5mIIFpsN9RnydLxkfcBiRGvYn8rlAFYlXk70HRUL2ItEFjXhV?=
 =?us-ascii?Q?i9hfqngETqz8h+RX3+3fE/K6XwB6a1RETkygCkm6rc5mnVxx3hqADx/w80p5?=
 =?us-ascii?Q?RTUiZuobsG2rBn7lwepZcAZfNZKml2VgwDvZwbrR9AG6VLhUWKLqrOXi7wRn?=
 =?us-ascii?Q?h2dgYrvZX+VUCis3/FQCo0/t3DDIAw5sA5xdJj+PYA=3D=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015)(366007)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?c0r8XwIH98R5hnfdLax1zwFLHXKlMVHIW4+pw63uhb+Y1Oylt01V2Ws9xkCV?=
 =?us-ascii?Q?ioj5+EJwX2hCSzEfa3CblpFbxDYKAkBjdeO3DxF/iQq2Uo7zSMSAAeW1uEjv?=
 =?us-ascii?Q?7spwBtoN48iRiSv3YrhEBtEVi4AGujjJr6sGYp8PdePk9n8iwxVqbtyHmML2?=
 =?us-ascii?Q?2214MgOt+1nvA6Fm8yCfSK6EK4GCjxLY+JF9B0ojjahRdzLBJRCpk8hcGFo0?=
 =?us-ascii?Q?BpDjtc28BquRld8t6G8KWzd/j+/DKlcdFGhKlvhtBjqwU70o+clSc7sDKH4F?=
 =?us-ascii?Q?RTkC33yV7Wx5rh5eqz6kE9j8GhEffjsgGXSj4yKEtAx37+jjHk8M0lhbX7vF?=
 =?us-ascii?Q?WM5dA+mCWS+s5BwGCqtguYrFlbDQ491x7Oa7eC8u72+42981juD8yAI4Y/oJ?=
 =?us-ascii?Q?vJqxN4F5Olhqh80RPYx2g3HwGZnv2iE86EtGoxfsJbY2Pq+Zi9MXsd7KSVEU?=
 =?us-ascii?Q?XmrftpUjROdVAoNxGsJNUgYNgFSZW6137QMlYzO+9dNPreYkEHtC8CUal4Rl?=
 =?us-ascii?Q?B72qTn3WfvS7/LyPMfzGechIa7HtbQihhLC+2mpnJ2gWbB46uQ+qX0FHGpxY?=
 =?us-ascii?Q?15adDOZofp5RD6uUhypOaVq93W8zUbeNMldzZwvt25gEJiFdL1VNKSH9FnWn?=
 =?us-ascii?Q?9fnhYxE0nJeHFYPSsl0fwUePZo0Ob4Th3cGkGwxnmqkafUlFmfNBnbtIEVd2?=
 =?us-ascii?Q?GgrX+niIJPc89JsobuVFDoYWWunP7LVELZ1zUEZLA5udJZY1KAWbgesxIspN?=
 =?us-ascii?Q?dk4WoVqDbe5pzLM1UF0zp4Z5atqt28sEC8m1O+rSnw1vnn3JINI5ba+PDYym?=
 =?us-ascii?Q?07+XXxGaWsetICSNoLiRaq9ANd9SdQ20OOFUA/lOdKaHSWcIepwMNv1DQJtM?=
 =?us-ascii?Q?Xxc41qtnprcYhoGsUcBQ8HBnVaVzO43gPTLTVOVB2H+Ib13rpxGlUCb/UHSq?=
 =?us-ascii?Q?jVDnUsEQ0+EBL3Y4zTRzs3+jP9CQR4erlBAt2nEpuP4ndKrhzuE116XXcI1A?=
 =?us-ascii?Q?4nF0l+KoxwWu4h9DZtmLy1aDL4fG7m9cskvoE6hGTAZiS60BaSLDJ1UnThIe?=
 =?us-ascii?Q?qewX/4Zu/UUkd/e7Bm9fX/eXmtpUWke+rHOB5uoSampXkGUyQyq4Fb9ocNp2?=
 =?us-ascii?Q?w6UT3ZObPyYdyYyr0xYnDQkyzwhAPYwFZjtg9ctwUYCNxdX9G5S8COrhnD+a?=
 =?us-ascii?Q?pHkqEytfTJTUn6Lxg9h1WxipZs17PphSoqdDCP+DhlAD2U1uABnfA1407k20?=
 =?us-ascii?Q?tvSSCm8iBJXzZcU3NprmNKIB/nT+gzaCcFr7FDC5C+ln1QlyXWpPaOGWaEM/?=
 =?us-ascii?Q?vqMp43cMVdlPTIOus4EbSQ67lj8bEniA+RjAD+IxlnIEvpjbGNm6jZSFlHW2?=
 =?us-ascii?Q?068N38LsnCckUGaS9hYkAV748SQhnNgRv7AWhdd0pisvqt51gFXT1FfHzA32?=
 =?us-ascii?Q?Xw5WxPgVUokoIF5qnPAzW6miES+snv+bRKGmBLmRpuDOiuM+QjJ+v41UhJq6?=
 =?us-ascii?Q?uc1q2mdK40sTPMbBLLxxBr2u2luNUKd6zATWSP+coEEpe03U2vBK1fuu3INh?=
 =?us-ascii?Q?i/Z799R5tLUbTzTDE+mDdWZfh6t8Xo314Bkdt9si?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: f049d57d-e806-4729-a5cd-08dc68438d59
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Apr 2024 11:57:32.2953
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5Yd7FjaHPi18npJKHDvnGKDR3b7upYseE/Dh/xx9hC9Zpreh7cJQizSxk6eAS4pvgSQfitkm9A3bbH2dEq/Ggg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR10MB6693
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 29 Apr 2024 11:57:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110183

"ignored:" should not be used, see https://git.openembedded.org/openembedde=
d-core/tree/meta/conf/cve-check-map.conf#n17
When CPE matches wrong version, then use "fixed-version:".

Also add newline at end of file, please...

Peter

-----Original Message-----
From: openembedded-devel@lists.openembedded.org <openembedded-devel@lists.o=
penembedded.org> On Behalf Of Ninette Adhikari via lists.openembedded.org
Sent: Monday, April 29, 2024 13:09
To: openembedded-devel@lists.openembedded.org
Cc: engineering@neighbourhood.ie; Ninette Adhikari <ninette@thehoodiefirm.c=
om>
Subject: [oe] [PATCH 1/1] sthttpd: Update status for CVE-2017-10671

> Current version 2.27.1 is not affected by the issue.
> Affected versions: Up to (excl.) 2.27.1
>
> Signed-off-by: Ninette Adhikari <ninette@thehoodiefirm.com>
> ---
>  meta-webserver/recipes-httpd/sthttpd/sthttpd_2.27.1.bb | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meta-webserver/recipes-httpd/sthttpd/sthttpd_2.27.1.bb b/met=
a-webserver/recipes-httpd/sthttpd/sthttpd_2.27.1.bb
> index b40b14851..0a618c16c 100644
> --- a/meta-webserver/recipes-httpd/sthttpd/sthttpd_2.27.1.bb
> +++ b/meta-webserver/recipes-httpd/sthttpd/sthttpd_2.27.1.bb
> @@ -57,3 +57,5 @@ SYSTEMD_SERVICE:${PN} =3D "thttpd.service"
> =20
>  FILES:${PN} +=3D "${SRV_DIR}"
>  FILES:${PN}-dbg +=3D "${SRV_DIR}/cgi-bin/.debug"
> +
> +CVE_STATUS[CVE-2017-10671] =3D "ignored: No action required. The current=
 version (2.27.1) is not affected by the CVE."
> \ No newline at end of file
> --=20
> 2.44.0


