Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC4B6CD128A
	for <webhook@archiver.kernel.org>; Wed, 10 Apr 2024 16:55:00 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.94])
 by mx.groups.io with SMTP id smtpd.web10.5270.1712768093865531114
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 Apr 2024 09:54:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=XMyWEMPn;
 spf=pass (domain: siemens.com, ip: 40.107.8.94, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PotA/Kp7QiaxyAGV2VqKVR4xfL0lxWLBaDNJ0fdPFJ1ZjRRdOwd9XmNBKy6TXzED3VcA7QGdaLLFqBOR2wwhqYZE3z7EfCmAnqoVPdPJ3yypt3+HR5nS1oLb/LUMUwmWv0AKpK1k3bhBAwAsgherbRHWBnpgP+155gAmuCvr6H+RvYKguothXUra5G4mTT8U3hJW3Qh19AFddbmIaPu6GMQwCEw2ysNOODHs9Spc9eErVnMw3TgUzow5kZoNQNb34k+pbK/hF2BIXEQXr5z74ZT2Eg1gTZpin/drO9xF2ndmpWPouAEZVpJa94upjkBePHiKe2CTd20hleDM3pK35g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v2Ex8GIhFKXlOU9YirhW0gZ74UZOL2OMNEVaqaCEU5c=;
 b=ndu0rC21MgC4aT4oDd+f0+UKiG+lHvw/ugc49GuBc8gkg+Py06ADmCl1qL3/l3H9p9k7ZO8uTlRh3yk5lET0b+oSd1+/SPpNd1UFR9JGDYD+aWEinytWiw1LrDTXYvd8aeHyQoHNJOq83JyztfZ+UgWXhwAK7vYSgGDMK90X+EWZEZYpiwBjQLKRCoOub7nt89kALJpt7llR4RpRxP4hAfzg7amo/b/eNHH8vFTHRs7wKYIRxGWhOHqXSHVmHGkuaKeCCelcsv1dWepJ87WAEp2+MgwamLqHncTPQ6cvfsPtqpDWV/63O7kqq31syLFwoyIZg+Io8Yoi5/KMh0BNvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v2Ex8GIhFKXlOU9YirhW0gZ74UZOL2OMNEVaqaCEU5c=;
 b=XMyWEMPnEJ915YBAXXV2y74QgiAIzVuXrVIDyUSXqEa4qtxuua2KPASixTMaztFWqxXzjFBUvUD+Pj4ud98aEF8foaIp5iaP3t0DoL+3uTQTiEjiL/XtQeT5ymtOmweZAjwOZKSMCXTS3Zigw6792mXsvX+1SoMwjwY+ZLEnCrR68wRxQWmlbw7bNE0SptUFIm5AtpQWGLoUCnhr80F+ay9MvXxdqwGwP5ZsHwPvScDiHe3EQcbpZp2fFZzagnw5m2rXGo9kREKD5Bgf1YeD6/61CklFzYyUGPtguVHrLhthXexCJ78mh0mao92bZipHfcBn46YnOmmc3gEa7m20nA==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by AS1PR10MB5747.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:47e::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46; Wed, 10 Apr
 2024 16:54:49 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::fd78:3502:7564:1891]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::fd78:3502:7564:1891%4]) with mapi id 15.20.7409.053; Wed, 10 Apr 2024
 16:54:49 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: "ninette@thehoodiefirm.com" <ninette@thehoodiefirm.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: RE: [oe] [PATCH 1/1] exiv2: Update CVE-2007-6353 status
Thread-Topic: [oe] [PATCH 1/1] exiv2: Update CVE-2007-6353 status
Thread-Index: AQHai1h8BBhMYJJ2JEC7/pVfAJRj6LFht51g
Date: Wed, 10 Apr 2024 16:54:49 +0000
Message-ID: 
 <AS1PR10MB5697292F84DCD4311F1227C7FD062@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20240410150453.12726-1-ninette@thehoodiefirm.com>
 <20240410150453.12726-2-ninette@thehoodiefirm.com>
In-Reply-To: <20240410150453.12726-2-ninette@thehoodiefirm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=4937f6b5-c492-4c09-928e-d4d075b7b920;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2024-04-10T16:50:11Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|AS1PR10MB5747:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 Dxh9b4ac3Ln9xfxa2LGlJbye7VUYwj7j+ay3iSgxlL1lbOGNb3JX9NexhJCoh83zeW1j3G+6+fNvludUEGwOeBs1pFPesG7MDs/hHY2wpD60GFitxenNwLtNlunXNB62srKQB6tUkoswZHrIncXNv9fZG1yWCRt4AJCVb0cj5iD/03vlWl7Z3cOdT2DznEdEdz6FWiiRN5BNMt4stxtpuF1Zfx4nBFbXLU99pvbeTojja9/Dq5W8Zu6GyLfQteUj1m7OaVzn8FT6btLxtrWfJ3kG427AyinRNHMh2FFdNTAhViz0/bwRbFnP3GungoxnjlMS+nZrTyhWWN3y7BJ9O76QoAFI6HLIWBVvsRGJVnXBLuINIZNXXpYrYU1wJbcsJFE94OdtEjzg1Ejo+0MBpXjRpczbhEY9Ew4HDeHCAufHQfKPcHypJ6yA0y+tbFPXsCwlDIxy+q5IcQiFdqFxGdME3iRLKI6wQQrBeEdduLBN4F3L82UmshJrJ7lxkyStZzlOkrJ/t0aOkrqNdD7tVgMEODbZlniZPY9bjRiDZTsnZV435CexgeUz8ea8fy+MaXKsi+dvQlz/l10ULu5jzVJ3ov0TaJXhUCGfu/t4qE9BJNR6ClAhMZ1ql+2tjtJc+ya8LEEhPVcYBQ8LUFFy9KwkkZzL3e7Pn1RBHajMRpo=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(376005)(366007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?lRz+WMTQhj05bXFjSrvHxREZKoLyVET3B9giQ5y6E5nvIrxxpvWyzJBJyJKH?=
 =?us-ascii?Q?EteDVyVpuIH0jgJP9HD/XSfaTRnzVhRirr3H9J4C3M1Ls5TR+XW34/PGoivu?=
 =?us-ascii?Q?AIE2VgFnItorGICqPpZCDvbyNIOsuM2HFPFEzkl7aBOxVT6afvLY6zLVd6JL?=
 =?us-ascii?Q?eu7cuZhHwux1hJgg2JxEuQyXQUOOqrrHkkUZIo28A4wYpl2Gs9oU7D4EIflY?=
 =?us-ascii?Q?sU434od/eOXzIHKEg50ZS3DUvAOcTzO706++eUetAbJQHxVE22fGf37/jacW?=
 =?us-ascii?Q?qbftHMnHejWkkIpnefjucUbZbfbm3G31uPJz01LCSlBbAgn+ONusqG9rmHHH?=
 =?us-ascii?Q?rVD0ujf6I5I/aTs6OQ3zhYGiDsRHcO8IPidzJRyb+mXLetR9qdG3diG+79Cl?=
 =?us-ascii?Q?F78V3u9fp4h1nKbOmD4A1vtl1PZyb+LQRONpujamLGjgZ4PizTYscf0fQT1S?=
 =?us-ascii?Q?N5ZGxVr/A4ouQ5xSr/d+aa7RhByhHBejhXXs1JamUQMEcftdy2VVxPJh1JUJ?=
 =?us-ascii?Q?nH+miJ9MAw3N/nccrkA0f1Ljbo0fG/Dog3W0oHwIw9YITEYR3IQ0U0wqr8VH?=
 =?us-ascii?Q?pS0rYg2HvrGK/4BNLIaxb/X7pyThM8grG6xKWmx9Pl/4A+wETPHzKpEmf15e?=
 =?us-ascii?Q?dDNev4AclIQfv/9T/tLEFm1sQ0aylSicQcmJmP9uS0PlBmuBEauD0ccDK4rB?=
 =?us-ascii?Q?xterh1KwgjWekSThNW4VDy7e0P6b1dWu+SMNPDg8s/lKkF0J0kqsZq5oZ+Y0?=
 =?us-ascii?Q?2YNA/blv9B8wSXiceW1z2ieozcn9Aqy4SZWiBV6EyxoAjuFvS3v/EyMNkaqd?=
 =?us-ascii?Q?F3brcLloW7lIssJBBq2q/LJzgBcvrN7AijXFkTO96OG2/eF+R3viYTNf+bGM?=
 =?us-ascii?Q?YvN70SW+fv8tCQcu+dL4KCgHjZdmAsUYQci29Z2AcoGopw6XzcjjPn75zO18?=
 =?us-ascii?Q?xhPLAPsyDWhNbxuerBzTjKnzFUE7GjrVGhK4ejYNS+0SklWJgtVYVgZp/3CT?=
 =?us-ascii?Q?JsQyVxzTptAIjMZmGvB4Yj3bJod+KVnCK1JbL8ZbwVRkPw8pgzLu0ZO88D+d?=
 =?us-ascii?Q?0yPT8vSzvWgPuxUaGoBI3KC3fw36LDQdGrIDew4EpC0G17tDYdJc1cdUq+oc?=
 =?us-ascii?Q?2xsQ4n8eYGgi3QafdF1T6iH6JJ+VXdX9cgozfUYgkUC2NzHCOOF1AIpyoM9z?=
 =?us-ascii?Q?Rgm/5Ffj7nRNRiX3eO7KEnGV5dz0ZKhvcDXBk2LCDJaA546hHEReiZJjuQew?=
 =?us-ascii?Q?2siN4JFW/0LZAsviThktBaKMriyNMUh6fCQXNy0emXlOWbhs8Bv9321Cp/Nj?=
 =?us-ascii?Q?rGiVT48sOSLTYPKu8ZlVTLcvm7C6UlE7ubXe6QO5HqdszA6p74MakD5iQ8SG?=
 =?us-ascii?Q?r9RWZ5zDjIyplsF9T43IqUuvfX1X3w/eEDJSj8zZrxmWcAgB/Fd8apEF72t9?=
 =?us-ascii?Q?ddnx8oSIZh73dZiAzpbqNaUvfg+WrnWJYMGBMxPhYeSAUk/lHFYqk+XCZjIR?=
 =?us-ascii?Q?scU5400Bdifkq3b9wnlAArjnIVGRFhGSvrNbrx+QByTEWN0NurYGW7h04V2T?=
 =?us-ascii?Q?oOItXrp/sT1VidE4AnwDi7gnAj3amHnvqIby9Bt5?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: cc12df29-2db2-44ee-ae1e-08dc597eef7b
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Apr 2024 16:54:49.7842
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wyait6Kahd0zqmxlHPQWHfEr/+K2/9kp6UtbpTKh8HTR20ahbjqRji46HxHleNYywbAgmZ9uTak2vL+Di4qDPA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR10MB5747
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 10 Apr 2024 16:55:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109905

Hello,

May I ask what are you trying to achieve?
These entries fix incorrect CPE mapping so they are still needed.
So by removing these 7 CVE_STATUS entries via your 7 contributions, you are=
 marking the CVEs as relevant for the components.
Basically direct opposite of what your commit messages are saying.

Peter

-----Original Message-----
From: openembedded-devel@lists.openembedded.org <openembedded-devel@lists.o=
penembedded.org> On Behalf Of Ninette Adhikari via lists.openembedded.org
Sent: Wednesday, April 10, 2024 17:05
To: openembedded-devel@lists.openembedded.org
Cc: Ninette Adhikari <ninette@thehoodiefirm.com>
Subject: [oe] [PATCH 1/1] exiv2: Update CVE-2007-6353 status

> Current version 0.28.0 is not affected by the issue.
> Affected version: < 0.13-r1
>
> Signed-off-by: Ninette Adhikari <ninette@thehoodiefirm.com>
> ---
>  meta-oe/recipes-support/exiv2/exiv2_0.28.0.bb | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meta-oe/recipes-support/exiv2/exiv2_0.28.0.bb b/meta-oe/reci=
pes-support/exiv2/exiv2_0.28.0.bb
> index 958810cf7..ad99d0bf4 100644
> --- a/meta-oe/recipes-support/exiv2/exiv2_0.28.0.bb
> +++ b/meta-oe/recipes-support/exiv2/exiv2_0.28.0.bb
> @@ -10,6 +10,8 @@ SRC_URI[sha256sum] =3D "89af3b5ef7277753ef7a7b5374ae017=
c6b9e304db3b688f1948e73e103
>  # inherit dos2unix
>  S =3D "${WORKDIR}/${BP}-Source"
> =20
> +CVE_STATUS[CVE-2007-6353] =3D "cpe-incorrect: Current version 0.28.0 is =
not affected by the issue."
> +
>  inherit cmake gettext
> =20
>  do_install:append:class-target() {
> --=20
> 2.44.0


