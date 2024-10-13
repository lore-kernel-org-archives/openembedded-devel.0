Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFBCCCF2579
	for <webhook@archiver.kernel.org>; Sun, 13 Oct 2024 16:41:47 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.61])
 by mx.groups.io with SMTP id smtpd.web10.35064.1728837703497475851
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 13 Oct 2024 09:41:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=ctX19Q8e;
 spf=pass (domain: siemens.com, ip: 40.107.22.61, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iH5ehFj86N7lJx9bdw7BCTgZ25pi8X8j6dsT1xz+G8I1xjz+7IjxqM4MmNDC9GDyJOzDBy0Ex38DqnC6wS4s8nM1qSavfu8voS3cGxh3g/p0G4iiAQrgsj87HYhYuLPbiUCynEE111Q/vb4BbeB+snfd4pQXG6uptIBYm2qdl841oPfAONQ5rgZNpwFxPbq3MX4xTzQYAo1k7wr4DIaRW8W4BUXv2H5OyTmwPDzjpzJS7t4CkVJ6Y7ukbr+EKGDf/o9il27w4EXaUkMAgRWadThY22YeuHIer3tB9tIBOlCz8RlIh6afwoB056BNo0Q8/PfS/HZiATU6PSrju8B1sQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VI5DqyiPWF1y1K4AyoZN7gpADs+792v55TtJxtDAD5w=;
 b=FW/8ejZ03zxu+xXziqUDfHbl2A0njGxYRqB51arXLNtwJYQR4Ftz9dV+eHR5A095fHlZfGUEM7MaR5tjZF0+4OjMB0WAPkEGf9G3jR0PQTAz+fMRCrg8+UB7I037qEwa0aQfH2dzzoMiHjJpMWoZ6ANR8QkBQh3iL42Fh5lhf1aOGWxdcC2h0R/+N2onqJ26x+46iW0HvTCXKjtothvo6A1jvJd7k8zshsPvSibvNtSPuhyok1zh3gZetuD5s/uODbEWZ86R01YgPlLwM1RQTWHX4DaMxi+ydpmGxXVaB9Wf1pzjaFIm/vjjFVtX+esjmcfVw6oDr7ac9dbWipEl2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VI5DqyiPWF1y1K4AyoZN7gpADs+792v55TtJxtDAD5w=;
 b=ctX19Q8efviayzBHEVKM6X/RiXjORLplECcuHbi3mNoM6pOgckQV4yJufpntVmH4em7VcmNwDBw2MfEaFOqnCgbO7sg+7qYf8rCIw/yC3d6bM0aJ0SrH5l8Setwu7WvSsLPLJVOrKLo5/OB5XWydpteXZMgtMskLNKX96rB7ITk/ipfjzmD8yq16gp+e+YQqqODcriXbOU/fqSKf5yH0lHQ/TQJ+j3ninz2O58boGCzYTIkiPgO9SDHLaHAFEJiVv50lazGdEMInO3lCPiwSbk1icbaDpNnwfVZS34pk/vH8mIPrqnT0ANXUT5KWODVFfWqJwPznqmT8Z2zM50yKdw==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by DB9PR10MB6643.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:3d1::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.16; Sun, 13 Oct
 2024 16:41:38 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2%7]) with mapi id 15.20.8069.009; Sun, 13 Oct 2024
 16:41:38 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: RE: [meta-oe][kirkstone][scarthgap][PATCH 1/2] hostapd: Patch
 CVE-2024-3596
Thread-Topic: [meta-oe][kirkstone][scarthgap][PATCH 1/2] hostapd: Patch
 CVE-2024-3596
Thread-Index: AQHbEm9sohIiBrlOW0yqW9CTNB3UbLKE+Jqw
Date: Sun, 13 Oct 2024 16:41:38 +0000
Message-ID: 
 <AS1PR10MB5697B0C4DD15C28AA545D570FD7B2@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20240929125835.1055031-1-peter.marko@siemens.com>
In-Reply-To: <20240929125835.1055031-1-peter.marko@siemens.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=493898b0-45fc-480c-b8c0-3edd9e80d89e;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2024-10-13T16:41:22Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|DB9PR10MB6643:EE_
x-ms-office365-filtering-correlation-id: 665c6348-4265-453f-c0d5-08dceba5e881
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?DABThRCFzc/AeJ7r+FzhAnI3oQqXFn95g7yDmZASdjvBTVCz3bJiAjifMC2l?=
 =?us-ascii?Q?YWcTiJFUQSVyNJHCmNhu/7asKB3sLdRT7uMeCmvrgi5K9y5kSzQVUizKPL40?=
 =?us-ascii?Q?sPztfTf1DI2xyXcZB3n87p8EJOtG3CaWWkmp2BAaDM/EVDxMp9WAy4RHu18O?=
 =?us-ascii?Q?aOSf+7QTZpnnSBMOV2V+AJP6GQxzGAmHRT4bi2x1BJwc3pqz1nixL1jsIAFi?=
 =?us-ascii?Q?wRfgaPSKcu+OpDiJLc05Zda9xj2QtpbKZT8V+7psQPnL1h1jG1fAuwgxtMl9?=
 =?us-ascii?Q?aPisfsxYiHVV+1v8GlYf+6gvW3VkZw0UUjdYW5XqH+UE2L7+u8Dnw8slPB+K?=
 =?us-ascii?Q?27FuHxH2GpHvRn3jPuRwJbnXWUtFzvdqG7f++2x0znOMYEdlsd47jowaSZ3F?=
 =?us-ascii?Q?UWsOGeSvH4FCFJdgejFX2+XFw5lt2H2WDqvgctb0zcxjvQ5tXXHszyMuNZQM?=
 =?us-ascii?Q?WHvSrNsJbnh9U563sEn9K7mFCoG6yFLelCZtNwuDNHD86Yv4p4clMEdzLZcS?=
 =?us-ascii?Q?iMkg6iWBouHm5CXykuc7ulTX0w1Wj018IQ/S5rLYEVRxrvu4+RedvTLk3jjn?=
 =?us-ascii?Q?ESsZKXtJZAHkF8PQYtacQrPIaioUhU7a4Y7NpYmFyC/Sax9rXxUMwdJiMxpO?=
 =?us-ascii?Q?UTgR4MlAgfpJxgv0HFozNHoRTMumkytxh4F8hMW10C7ajZL40kqceu1VvQ3t?=
 =?us-ascii?Q?iy+cUK+H5PigRfXENch0QozVlcv22C8mKGHXZVV+OaaqVCPHX7bVaQOFD3F+?=
 =?us-ascii?Q?zP1HG/qoIJEtqgKjnh7PAxD0WKFdVLWsyelb23U9Coo1rdi+RH4iMUU0vtva?=
 =?us-ascii?Q?BV7HC6rtsks8S/10bZJzF+Di43Hvgu+nOd2FiuW0uMevEkpk/ndHNaNxq8TK?=
 =?us-ascii?Q?M7xLbyBTRvJu0D7/ck0zUVIEdnIhWIoQzyKbvuQZf5BgguMlDRBN0fhfJ/Zv?=
 =?us-ascii?Q?22DEUCRobpE+YIHwtgOcDQ6uHK0/bkb4xNbBq6Wu3RJCtSAi+pNFfP9H8apk?=
 =?us-ascii?Q?WPSNIqRK3GlqYXiFth13+ik5KsxSB/EJ9kcFIUZxIZhLPwrIPtSvrFescUdA?=
 =?us-ascii?Q?I5p4NC3mqDUF+TBnFSPBUKgCzCX9syNzhioaWPE9nuwPsKxP/6X3wNVzk6Ur?=
 =?us-ascii?Q?TSTBXdqh/2O8QW9QqdlWzkdxe+MfBGOOsN6pKjULQ7gWZkAljcUbWbNF++bM?=
 =?us-ascii?Q?I+RGJP8dID7gUyqSE613nts5KjLtaR1yJ3MtszZ4ochn62XaY55hsJ7RhtkP?=
 =?us-ascii?Q?fbv1LvsNJUGMnhQEVexBVAFEeYEhpR99mMGkoUjfxw=3D=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?7OBtChZFgpBTSHNOw34jkaEJsQoV3H3txwv09m6bnqjAbR7fQWaBkWt5gMIC?=
 =?us-ascii?Q?tI59nK2TX+93p05LsALGvbXJdTvgHQQzzKi17Y6DvMryhEv4Aw5i/3ChhRZI?=
 =?us-ascii?Q?n907RXPMbDEq64sdVANrN6a7BYuaqvQSwXEH8qE3RJ/sMdnPzjYK4dpd91Ma?=
 =?us-ascii?Q?8HeVVyNHEx7IafUEoG7YBTUqubW8nm66kTJH/GtRAaaVXT/nLupgsF3iaR5b?=
 =?us-ascii?Q?fe63oobeKJDUU2OJeZ4gj55XTtkqkzceNHRF+CC5XFZrx/aZwHbh7KqbF/+S?=
 =?us-ascii?Q?244u/DDCu1p0VKN2VgfDXMKxKSpRycpcPS8t1edTtosFqYEK9v+zJpn6CEK9?=
 =?us-ascii?Q?ca/AS2zRKTzKsZX57YKXzNMRPtdqBjRonSDgbquuvwJBPF8if6osDMOBRCXr?=
 =?us-ascii?Q?PjbPyGdCexXq7redAuJKWF59W0a7N1j+5ITvdhUSGyu4sKbJ4RTZ+D42Pc7d?=
 =?us-ascii?Q?G5xGoI2KjBdiPAkSCEMwTSyj0FJQvXDAEWL0dnCItLuw1mZrFYrr80yuVBqQ?=
 =?us-ascii?Q?72BTHylMKeJ31A3hSvFPiE1GpZtwDGD/NLkV6bVTw20wdPBz+3iPprNxW15x?=
 =?us-ascii?Q?l+lkLyXWNcFu84PGdwLqeJ0GGF2YU9GT9h1U2PRsRn7EyYjt+tpUyVgm0dlI?=
 =?us-ascii?Q?JxUUkbSJ2cMC3j6HYWekoHa7P6sK8MvZlNB2kMTWnS0M/ZnyfnboGwBEkuID?=
 =?us-ascii?Q?BlZg/wbbwnU1thInVy99rYn0Q9o3s1dbq4qtp+oB7/q5WTUgRMRs+/VaKSSm?=
 =?us-ascii?Q?7PZqBNrUJuSKBawE9W1Y7ZQtHl1Su5mjPXLN5d/53uU1mu4pxBOIq+JdRbQj?=
 =?us-ascii?Q?642bloQqDKJscEGegGVRoJk4xJm0bBiZdTzgQzeqNINs/hOh4VNwX6i25uuy?=
 =?us-ascii?Q?tsjvJIxk3pLkwoLj/rpdieU8ZZ/kEitOkbTaf59aK60c2zACT50LqI7iVS1Z?=
 =?us-ascii?Q?q/Nu46dCAn/t1mA6bp9KhIGPA17U4ke+jEQbSxRJPBpG283BFKogxt/uKbvd?=
 =?us-ascii?Q?smSMLxRECdW5bysiyiBV5H1zGZB+jrlsWDyonb2jhpELuQXk7laGYyfTN6v+?=
 =?us-ascii?Q?a8YX+3kfKJdKja/b8zkY78uGbxGHbcYsJSGkYFN2ZwSDKd841H0xGR0h7gEQ?=
 =?us-ascii?Q?1LmfAyuGXLe8mQSFp4655XYo+tT2ihsobgCK4JasXgBPCIB5M8zwP3pTKZbW?=
 =?us-ascii?Q?Y3OqVETUNeFP9SYeMmVWOqirpAMIq+T7JE4N0JTN+TTzeXbA0PRk0v8AsSJv?=
 =?us-ascii?Q?TJ3uAZ5VVIsBghr8uycs/EKuwuv/6PN6l/sQPhKbAenbX+7w5r3jS2ES2hsY?=
 =?us-ascii?Q?3RdSXCDQJ/wYcJi1q9V37L/+b1wDcGF/VZPwPptr78uRAy/3fP/DUUqKEDL5?=
 =?us-ascii?Q?Wsx4WQE64VGNxHLSLrFD9ohhRxuWJ5iqMRld8hpx88fj3lRW1m1KMRclgcZP?=
 =?us-ascii?Q?cH2ox7sCM2tpzh34Zfw5Gs7VGFsG95D3oKGuXSXxMsvogKA2nax9mtwlqt/8?=
 =?us-ascii?Q?Lfs3qccV0+Ds5sHAO+2JwqoAB/kolSJJ2OuG2+VpjdR7z1St+nWrbaf2SVT3?=
 =?us-ascii?Q?cY3PtaB1ECKl1T+IKf9lz3TS1y+molMIBGICUgou?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 665c6348-4265-453f-c0d5-08dceba5e881
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Oct 2024 16:41:38.2091
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HJ5GAhtx4HG7yEl3j9RM3EqSIUXnCWI4UczWy58zyD3qZZdqhikFgQHKCKDb9QyMANYbHVgO6F0mpjshShWXuA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR10MB6643
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 13 Oct 2024 16:41:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112840

Hi Armin,
Could you please take this series also to kirkstone?
Thanks a lot!

> -----Original Message-----
> From: Marko, Peter (ADV D EU SK BFS1) <Peter.Marko@siemens.com>
> Sent: Sunday, September 29, 2024 14:59
> To: openembedded-devel@lists.openembedded.org
> Cc: Marko, Peter (ADV D EU SK BFS1) <Peter.Marko@siemens.com>
> Subject: [meta-oe][kirkstone][scarthgap][PATCH 1/2] hostapd: Patch CVE-20=
24-
> 3596
>=20
> From: Peter Marko <peter.marko@siemens.com>
>=20
> Picked patches according to
> http://w1.fi/security/2024-1/hostapd-and-radius-protocol-forgery-attacks.=
txt
>=20
> First patch is style commit picked to have a clean cherry-pick of all
> mentioned commits without any conflict.
> Patch CVE-2024-3596_03.patch was removed as it only patched
> wpa_supplicant. The patch names were not changed so it is comparable
> with wpa_supplicant recipe.
>=20
> Signed-off-by: Peter Marko <peter.marko@siemens.com>
> ---
>  .../hostapd/hostapd/CVE-2024-3596_00.patch    |  82 +++++++++
>  .../hostapd/hostapd/CVE-2024-3596_01.patch    | 165 ++++++++++++++++++
>  .../hostapd/hostapd/CVE-2024-3596_02.patch    |  62 +++++++
>  .../hostapd/hostapd/CVE-2024-3596_04.patch    |  52 ++++++
>  .../hostapd/hostapd/CVE-2024-3596_05.patch    |  51 ++++++
>  .../hostapd/hostapd/CVE-2024-3596_06.patch    |  46 +++++
>  .../hostapd/hostapd/CVE-2024-3596_07.patch    | 105 +++++++++++
>  .../hostapd/hostapd/CVE-2024-3596_08.patch    |  47 +++++
>  .../hostapd/hostapd_2.10.bb                   |   8 +
>  9 files changed, 618 insertions(+)
>  create mode 100644 meta-oe/recipes-connectivity/hostapd/hostapd/CVE-2024=
-
> 3596_00.patch
>  create mode 100644 meta-oe/recipes-connectivity/hostapd/hostapd/CVE-2024=
-
> 3596_01.patch
>  create mode 100644 meta-oe/recipes-connectivity/hostapd/hostapd/CVE-2024=
-
> 3596_02.patch
>  create mode 100644 meta-oe/recipes-connectivity/hostapd/hostapd/CVE-2024=
-
> 3596_04.patch
>  create mode 100644 meta-oe/recipes-connectivity/hostapd/hostapd/CVE-2024=
-
> 3596_05.patch
>  create mode 100644 meta-oe/recipes-connectivity/hostapd/hostapd/CVE-2024=
-
> 3596_06.patch
>  create mode 100644 meta-oe/recipes-connectivity/hostapd/hostapd/CVE-2024=
-
> 3596_07.patch
>  create mode 100644 meta-oe/recipes-connectivity/hostapd/hostapd/CVE-2024=
-
> 3596_08.patch
>=20
> diff --git a/meta-oe/recipes-connectivity/hostapd/hostapd/CVE-2024-
> 3596_00.patch b/meta-oe/recipes-connectivity/hostapd/hostapd/CVE-2024-
> 3596_00.patch
> new file mode 100644
> index 0000000000..7a8197d2b4
> --- /dev/null
> +++ b/meta-oe/recipes-connectivity/hostapd/hostapd/CVE-2024-3596_00.patch
> @@ -0,0 +1,82 @@
> +From 945acf3ef06a6c312927da4fa055693dbac432d1 Mon Sep 17 00:00:00
> 2001
> +From: Jouni Malinen <j@w1.fi>
> +Date: Sat, 2 Apr 2022 16:28:12 +0300
> +Subject: [PATCH 1/9] ieee802_11_auth: Coding style cleanup - no string
> + constant splitting
> +
> +Signed-off-by: Jouni Malinen <j@w1.fi>
> +
> +Upstream-Status: Backport
> [https://w1.fi/cgit/hostap/commit/?id=3D945acf3ef06a6c312927da4fa055693db=
ac
> 432d1]
> +Signed-off-by: Peter Marko <peter.marko@siemens.com>
> +---
> + src/ap/ieee802_11_auth.c | 27 +++++++++++++++------------
> + 1 file changed, 15 insertions(+), 12 deletions(-)
> +
> +diff --git a/src/ap/ieee802_11_auth.c b/src/ap/ieee802_11_auth.c
> +index 783ee6dea..47cc625be 100644
> +--- a/src/ap/ieee802_11_auth.c
> ++++ b/src/ap/ieee802_11_auth.c
> +@@ -267,16 +267,16 @@ int hostapd_allowed_address(struct hostapd_data
> *hapd, const u8 *addr,
> + 		os_get_reltime(&query->timestamp);
> + 		os_memcpy(query->addr, addr, ETH_ALEN);
> + 		if (hostapd_radius_acl_query(hapd, addr, query)) {
> +-			wpa_printf(MSG_DEBUG, "Failed to send Access-
> Request "
> +-				   "for ACL query.");
> ++			wpa_printf(MSG_DEBUG,
> ++				   "Failed to send Access-Request for ACL
> query.");
> + 			hostapd_acl_query_free(query);
> + 			return HOSTAPD_ACL_REJECT;
> + 		}
> +
> + 		query->auth_msg =3D os_memdup(msg, len);
> + 		if (query->auth_msg =3D=3D NULL) {
> +-			wpa_printf(MSG_ERROR, "Failed to allocate memory for
> "
> +-				   "auth frame.");
> ++			wpa_printf(MSG_ERROR,
> ++				   "Failed to allocate memory for auth frame.");
> + 			hostapd_acl_query_free(query);
> + 			return HOSTAPD_ACL_REJECT;
> + 		}
> +@@ -467,19 +467,21 @@ hostapd_acl_recv_radius(struct radius_msg *msg,
> struct radius_msg *req,
> + 	if (query =3D=3D NULL)
> + 		return RADIUS_RX_UNKNOWN;
> +
> +-	wpa_printf(MSG_DEBUG, "Found matching Access-Request for RADIUS "
> +-		   "message (id=3D%d)", query->radius_id);
> ++	wpa_printf(MSG_DEBUG,
> ++		   "Found matching Access-Request for RADIUS message
> (id=3D%d)",
> ++		   query->radius_id);
> +
> + 	if (radius_msg_verify(msg, shared_secret, shared_secret_len, req, 0)) =
{
> +-		wpa_printf(MSG_INFO, "Incoming RADIUS packet did not have "
> +-			   "correct authenticator - dropped\n");
> ++		wpa_printf(MSG_INFO,
> ++			   "Incoming RADIUS packet did not have correct
> authenticator - dropped");
> + 		return RADIUS_RX_INVALID_AUTHENTICATOR;
> + 	}
> +
> + 	if (hdr->code !=3D RADIUS_CODE_ACCESS_ACCEPT &&
> + 	    hdr->code !=3D RADIUS_CODE_ACCESS_REJECT) {
> +-		wpa_printf(MSG_DEBUG, "Unknown RADIUS message code %d
> to ACL "
> +-			   "query", hdr->code);
> ++		wpa_printf(MSG_DEBUG,
> ++			   "Unknown RADIUS message code %d to ACL query",
> ++			   hdr->code);
> + 		return RADIUS_RX_UNKNOWN;
> + 	}
> +
> +@@ -506,8 +508,9 @@ hostapd_acl_recv_radius(struct radius_msg *msg,
> struct radius_msg *req,
> + 			    msg, RADIUS_ATTR_ACCT_INTERIM_INTERVAL,
> + 			    &info->acct_interim_interval) =3D=3D 0 &&
> + 		    info->acct_interim_interval < 60) {
> +-			wpa_printf(MSG_DEBUG, "Ignored too small "
> +-				   "Acct-Interim-Interval %d for STA " MACSTR,
> ++			wpa_printf(MSG_DEBUG,
> ++				   "Ignored too small Acct-Interim-Interval %d
> for STA "
> ++				   MACSTR,
> + 				   info->acct_interim_interval,
> + 				   MAC2STR(query->addr));
> + 			info->acct_interim_interval =3D 0;
> +--
> +2.30.2
> +
> diff --git a/meta-oe/recipes-connectivity/hostapd/hostapd/CVE-2024-
> 3596_01.patch b/meta-oe/recipes-connectivity/hostapd/hostapd/CVE-2024-
> 3596_01.patch
> new file mode 100644
> index 0000000000..dab2eedd6a
> --- /dev/null
> +++ b/meta-oe/recipes-connectivity/hostapd/hostapd/CVE-2024-3596_01.patch
> @@ -0,0 +1,165 @@
> +From adac846bd0e258a0aa50750bbd2b411fa0085c46 Mon Sep 17 00:00:00
> 2001
> +From: Jouni Malinen <j@w1.fi>
> +Date: Sat, 16 Mar 2024 11:11:44 +0200
> +Subject: [PATCH 2/9] RADIUS: Allow Message-Authenticator attribute as th=
e
> + first attribute
> +
> +If a Message-Authenticator attribute was already added to a RADIUS
> +message, use that attribute instead of adding a new one when finishing
> +message building. This allows the Message-Authenticator attribute to be
> +placed as the first attribute in the message.
> +
> +Signed-off-by: Jouni Malinen <j@w1.fi>
> +
> +CVE: CVE-2024-3596
> +Upstream-Status: Backport
> [https://w1.fi/cgit/hostap/commit/?id=3Dadac846bd0e258a0aa50750bbd2b411fa=
0
> 085c46]
> +Signed-off-by: Peter Marko <peter.marko@siemens.com>
> +---
> + src/radius/radius.c | 85 ++++++++++++++++++++++++++++-----------------
> + src/radius/radius.h |  1 +
> + 2 files changed, 54 insertions(+), 32 deletions(-)
> +
> +diff --git a/src/radius/radius.c b/src/radius/radius.c
> +index be16e27b9..2d2e00b5c 100644
> +--- a/src/radius/radius.c
> ++++ b/src/radius/radius.c
> +@@ -364,25 +364,54 @@ void radius_msg_dump(struct radius_msg *msg)
> + }
> +
> +
> ++u8 * radius_msg_add_msg_auth(struct radius_msg *msg)
> ++{
> ++	u8 auth[MD5_MAC_LEN];
> ++	struct radius_attr_hdr *attr;
> ++
> ++	os_memset(auth, 0, MD5_MAC_LEN);
> ++	attr =3D radius_msg_add_attr(msg,
> RADIUS_ATTR_MESSAGE_AUTHENTICATOR,
> ++				   auth, MD5_MAC_LEN);
> ++	if (!attr) {
> ++		wpa_printf(MSG_ERROR,
> ++			   "WARNING: Could not add Message-Authenticator");
> ++		return NULL;
> ++	}
> ++
> ++	return (u8 *) (attr + 1);
> ++}
> ++
> ++
> ++static u8 * radius_msg_auth_pos(struct radius_msg *msg)
> ++{
> ++	u8 *pos;
> ++	size_t alen;
> ++
> ++	if (radius_msg_get_attr_ptr(msg,
> RADIUS_ATTR_MESSAGE_AUTHENTICATOR,
> ++				    &pos, &alen, NULL) =3D=3D 0 &&
> ++	    alen =3D=3D MD5_MAC_LEN) {
> ++		/* Use already added Message-Authenticator attribute */
> ++		return pos;
> ++	}
> ++
> ++	/* Add a Message-Authenticator attribute */
> ++	return radius_msg_add_msg_auth(msg);
> ++}
> ++
> ++
> + int radius_msg_finish(struct radius_msg *msg, const u8 *secret,
> + 		      size_t secret_len)
> + {
> + 	if (secret) {
> +-		u8 auth[MD5_MAC_LEN];
> +-		struct radius_attr_hdr *attr;
> ++		u8 *pos;
> +
> +-		os_memset(auth, 0, MD5_MAC_LEN);
> +-		attr =3D radius_msg_add_attr(msg,
> +-
> RADIUS_ATTR_MESSAGE_AUTHENTICATOR,
> +-					   auth, MD5_MAC_LEN);
> +-		if (attr =3D=3D NULL) {
> +-			wpa_printf(MSG_WARNING, "RADIUS: Could not add "
> +-				   "Message-Authenticator");
> ++		pos =3D radius_msg_auth_pos(msg);
> ++		if (!pos)
> + 			return -1;
> +-		}
> + 		msg->hdr->length =3D host_to_be16(wpabuf_len(msg->buf));
> +-		hmac_md5(secret, secret_len, wpabuf_head(msg->buf),
> +-			 wpabuf_len(msg->buf), (u8 *) (attr + 1));
> ++		if (hmac_md5(secret, secret_len, wpabuf_head(msg->buf),
> ++			     wpabuf_len(msg->buf), pos) < 0)
> ++			return -1;
> + 	} else
> + 		msg->hdr->length =3D host_to_be16(wpabuf_len(msg->buf));
> +
> +@@ -398,23 +427,19 @@ int radius_msg_finish(struct radius_msg *msg, cons=
t
> u8 *secret,
> + int radius_msg_finish_srv(struct radius_msg *msg, const u8 *secret,
> + 			  size_t secret_len, const u8 *req_authenticator)
> + {
> +-	u8 auth[MD5_MAC_LEN];
> +-	struct radius_attr_hdr *attr;
> + 	const u8 *addr[4];
> + 	size_t len[4];
> ++	u8 *pos;
> +
> +-	os_memset(auth, 0, MD5_MAC_LEN);
> +-	attr =3D radius_msg_add_attr(msg,
> RADIUS_ATTR_MESSAGE_AUTHENTICATOR,
> +-				   auth, MD5_MAC_LEN);
> +-	if (attr =3D=3D NULL) {
> +-		wpa_printf(MSG_ERROR, "WARNING: Could not add Message-
> Authenticator");
> ++	pos =3D radius_msg_auth_pos(msg);
> ++	if (!pos)
> + 		return -1;
> +-	}
> + 	msg->hdr->length =3D host_to_be16(wpabuf_len(msg->buf));
> + 	os_memcpy(msg->hdr->authenticator, req_authenticator,
> + 		  sizeof(msg->hdr->authenticator));
> +-	hmac_md5(secret, secret_len, wpabuf_head(msg->buf),
> +-		 wpabuf_len(msg->buf), (u8 *) (attr + 1));
> ++	if (hmac_md5(secret, secret_len, wpabuf_head(msg->buf),
> ++		     wpabuf_len(msg->buf), pos) < 0)
> ++		return -1;
> +
> + 	/* ResponseAuth =3D
> MD5(Code+ID+Length+RequestAuth+Attributes+Secret) */
> + 	addr[0] =3D (u8 *) msg->hdr;
> +@@ -442,21 +467,17 @@ int radius_msg_finish_das_resp(struct radius_msg
> *msg, const u8 *secret,
> + {
> + 	const u8 *addr[2];
> + 	size_t len[2];
> +-	u8 auth[MD5_MAC_LEN];
> +-	struct radius_attr_hdr *attr;
> ++	u8 *pos;
> +
> +-	os_memset(auth, 0, MD5_MAC_LEN);
> +-	attr =3D radius_msg_add_attr(msg,
> RADIUS_ATTR_MESSAGE_AUTHENTICATOR,
> +-				   auth, MD5_MAC_LEN);
> +-	if (attr =3D=3D NULL) {
> +-		wpa_printf(MSG_WARNING, "Could not add Message-
> Authenticator");
> ++	pos =3D radius_msg_auth_pos(msg);
> ++	if (!pos)
> + 		return -1;
> +-	}
> +
> + 	msg->hdr->length =3D host_to_be16(wpabuf_len(msg->buf));
> + 	os_memcpy(msg->hdr->authenticator, req_hdr->authenticator, 16);
> +-	hmac_md5(secret, secret_len, wpabuf_head(msg->buf),
> +-		 wpabuf_len(msg->buf), (u8 *) (attr + 1));
> ++	if (hmac_md5(secret, secret_len, wpabuf_head(msg->buf),
> ++		     wpabuf_len(msg->buf), pos) < 0)
> ++		return -1;
> +
> + 	/* ResponseAuth =3D
> MD5(Code+ID+Length+RequestAuth+Attributes+Secret) */
> + 	addr[0] =3D wpabuf_head_u8(msg->buf);
> +diff --git a/src/radius/radius.h b/src/radius/radius.h
> +index fb8148180..6b9dfbca2 100644
> +--- a/src/radius/radius.h
> ++++ b/src/radius/radius.h
> +@@ -240,6 +240,7 @@ struct wpabuf * radius_msg_get_buf(struct radius_msg
> *msg);
> + struct radius_msg * radius_msg_new(u8 code, u8 identifier);
> + void radius_msg_free(struct radius_msg *msg);
> + void radius_msg_dump(struct radius_msg *msg);
> ++u8 * radius_msg_add_msg_auth(struct radius_msg *msg);
> + int radius_msg_finish(struct radius_msg *msg, const u8 *secret,
> + 		      size_t secret_len);
> + int radius_msg_finish_srv(struct radius_msg *msg, const u8 *secret,
> +--
> +2.30.2
> +
> diff --git a/meta-oe/recipes-connectivity/hostapd/hostapd/CVE-2024-
> 3596_02.patch b/meta-oe/recipes-connectivity/hostapd/hostapd/CVE-2024-
> 3596_02.patch
> new file mode 100644
> index 0000000000..02e35bd6de
> --- /dev/null
> +++ b/meta-oe/recipes-connectivity/hostapd/hostapd/CVE-2024-3596_02.patch
> @@ -0,0 +1,62 @@
> +From 54abb0d3cf35894e7d86e3f7555e95b106306803 Mon Sep 17 00:00:00
> 2001
> +From: Jouni Malinen <j@w1.fi>
> +Date: Sat, 16 Mar 2024 11:13:32 +0200
> +Subject: [PATCH 3/9] RADIUS server: Place Message-Authenticator attribut=
e as
> + the first one
> +
> +Move the Message-Authenticator attribute to be the first attribute in
> +the RADIUS messages. This mitigates certain MD5 attacks against
> +RADIUS/UDP.
> +
> +Signed-off-by: Jouni Malinen <j@w1.fi>
> +
> +CVE: CVE-2024-3596
> +Upstream-Status: Backport
> [https://w1.fi/cgit/hostap/commit/?id=3D54abb0d3cf35894e7d86e3f7555e95b10=
6
> 306803]
> +Signed-off-by: Peter Marko <peter.marko@siemens.com>
> +---
> + src/radius/radius_server.c | 15 +++++++++++++++
> + 1 file changed, 15 insertions(+)
> +
> +diff --git a/src/radius/radius_server.c b/src/radius/radius_server.c
> +index e02c21540..fa3691548 100644
> +--- a/src/radius/radius_server.c
> ++++ b/src/radius/radius_server.c
> +@@ -920,6 +920,11 @@ radius_server_encapsulate_eap(struct
> radius_server_data *data,
> + 		return NULL;
> + 	}
> +
> ++	if (!radius_msg_add_msg_auth(msg)) {
> ++		radius_msg_free(msg);
> ++		return NULL;
> ++	}
> ++
> + 	sess_id =3D htonl(sess->sess_id);
> + 	if (code =3D=3D RADIUS_CODE_ACCESS_CHALLENGE &&
> + 	    !radius_msg_add_attr(msg, RADIUS_ATTR_STATE,
> +@@ -1204,6 +1209,11 @@ radius_server_macacl(struct radius_server_data
> *data,
> + 		return NULL;
> + 	}
> +
> ++	if (!radius_msg_add_msg_auth(msg)) {
> ++		radius_msg_free(msg);
> ++		return NULL;
> ++	}
> ++
> + 	if (radius_msg_copy_attr(msg, request, RADIUS_ATTR_PROXY_STATE) < 0)
> {
> + 		RADIUS_DEBUG("Failed to copy Proxy-State attribute(s)");
> + 		radius_msg_free(msg);
> +@@ -1253,6 +1263,11 @@ static int radius_server_reject(struct
> radius_server_data *data,
> + 		return -1;
> + 	}
> +
> ++	if (!radius_msg_add_msg_auth(msg)) {
> ++		radius_msg_free(msg);
> ++		return -1;
> ++	}
> ++
> + 	os_memset(&eapfail, 0, sizeof(eapfail));
> + 	eapfail.code =3D EAP_CODE_FAILURE;
> + 	eapfail.identifier =3D 0;
> +--
> +2.30.2
> +
> diff --git a/meta-oe/recipes-connectivity/hostapd/hostapd/CVE-2024-
> 3596_04.patch b/meta-oe/recipes-connectivity/hostapd/hostapd/CVE-2024-
> 3596_04.patch
> new file mode 100644
> index 0000000000..ce499ce8b6
> --- /dev/null
> +++ b/meta-oe/recipes-connectivity/hostapd/hostapd/CVE-2024-3596_04.patch
> @@ -0,0 +1,52 @@
> +From 37fe8e48ab44d44fe3cf5dd8f52cb0a10be0cd17 Mon Sep 17 00:00:00 2001
> +From: Jouni Malinen <j@w1.fi>
> +Date: Sat, 16 Mar 2024 11:22:43 +0200
> +Subject: [PATCH 5/9] hostapd: Move Message-Authenticator attribute to be=
 the
> + first one in req
> +
> +Even if this is not strictly speaking necessary for mitigating certain
> +RADIUS protocol attacks, be consistent with the RADIUS server behavior
> +and move the Message-Authenticator attribute to be the first attribute
> +in the message from RADIUS client in hostapd.
> +
> +Signed-off-by: Jouni Malinen <j@w1.fi>
> +
> +CVE: CVE-2024-3596
> +Upstream-Status: Backport
> [https://w1.fi/cgit/hostap/commit/?id=3D37fe8e48ab44d44fe3cf5dd8f52cb0a10=
be
> 0cd17]
> +Signed-off-by: Peter Marko <peter.marko@siemens.com>
> +---
> + src/ap/ieee802_11_auth.c | 3 +++
> + src/ap/ieee802_1x.c      | 3 +++
> + 2 files changed, 6 insertions(+)
> +
> +diff --git a/src/ap/ieee802_11_auth.c b/src/ap/ieee802_11_auth.c
> +index 47cc625be..2a950cf7f 100644
> +--- a/src/ap/ieee802_11_auth.c
> ++++ b/src/ap/ieee802_11_auth.c
> +@@ -119,6 +119,9 @@ static int hostapd_radius_acl_query(struct
> hostapd_data *hapd, const u8 *addr,
> + 		goto fail;
> + 	}
> +
> ++	if (!radius_msg_add_msg_auth(msg))
> ++		goto fail;
> ++
> + 	os_snprintf(buf, sizeof(buf), RADIUS_ADDR_FORMAT, MAC2STR(addr));
> + 	if (!radius_msg_add_attr(msg, RADIUS_ATTR_USER_NAME, (u8 *) buf,
> + 				 os_strlen(buf))) {
> +diff --git a/src/ap/ieee802_1x.c b/src/ap/ieee802_1x.c
> +index 753c88335..89e3dd30e 100644
> +--- a/src/ap/ieee802_1x.c
> ++++ b/src/ap/ieee802_1x.c
> +@@ -702,6 +702,9 @@ void ieee802_1x_encapsulate_radius(struct
> hostapd_data *hapd,
> + 		goto fail;
> + 	}
> +
> ++	if (!radius_msg_add_msg_auth(msg))
> ++		goto fail;
> ++
> + 	if (sm->identity &&
> + 	    !radius_msg_add_attr(msg, RADIUS_ATTR_USER_NAME,
> + 				 sm->identity, sm->identity_len)) {
> +--
> +2.30.2
> +
> diff --git a/meta-oe/recipes-connectivity/hostapd/hostapd/CVE-2024-
> 3596_05.patch b/meta-oe/recipes-connectivity/hostapd/hostapd/CVE-2024-
> 3596_05.patch
> new file mode 100644
> index 0000000000..44113afd4a
> --- /dev/null
> +++ b/meta-oe/recipes-connectivity/hostapd/hostapd/CVE-2024-3596_05.patch
> @@ -0,0 +1,51 @@
> +From f54157077f799d84ce26bed6ad6b01c4a16e31cf Mon Sep 17 00:00:00
> 2001
> +From: Jouni Malinen <j@w1.fi>
> +Date: Sat, 16 Mar 2024 11:26:58 +0200
> +Subject: [PATCH 6/9] RADIUS DAS: Move Message-Authenticator attribute to=
 be
> + the first one
> +
> +Even if this might not be strictly speaking necessary for mitigating
> +certain RADIUS protocol attacks, be consistent with the RADIUS server
> +behavior and move the Message-Authenticator attribute to be the first
> +attribute in the RADIUS DAS responses from hostapd.
> +
> +Signed-off-by: Jouni Malinen <j@w1.fi>
> +
> +CVE: CVE-2024-3596
> +Upstream-Status: Backport
> [https://w1.fi/cgit/hostap/commit/?id=3Df54157077f799d84ce26bed6ad6b01c4a=
1
> 6e31cf]
> +Signed-off-by: Peter Marko <peter.marko@siemens.com>
> +---
> + src/radius/radius_das.c | 10 ++++++++++
> + 1 file changed, 10 insertions(+)
> +
> +diff --git a/src/radius/radius_das.c b/src/radius/radius_das.c
> +index aaa3fc267..8d7c9b4c4 100644
> +--- a/src/radius/radius_das.c
> ++++ b/src/radius/radius_das.c
> +@@ -177,6 +177,11 @@ fail:
> + 	if (reply =3D=3D NULL)
> + 		return NULL;
> +
> ++	if (!radius_msg_add_msg_auth(reply)) {
> ++		radius_msg_free(reply);
> ++		return NULL;
> ++	}
> ++
> + 	if (error) {
> + 		if (!radius_msg_add_attr_int32(reply,
> RADIUS_ATTR_ERROR_CAUSE,
> + 					       error)) {
> +@@ -368,6 +373,11 @@ fail:
> + 	if (!reply)
> + 		return NULL;
> +
> ++	if (!radius_msg_add_msg_auth(reply)) {
> ++		radius_msg_free(reply);
> ++		return NULL;
> ++	}
> ++
> + 	if (error &&
> + 	    !radius_msg_add_attr_int32(reply, RADIUS_ATTR_ERROR_CAUSE,
> error)) {
> + 		radius_msg_free(reply);
> +--
> +2.30.2
> +
> diff --git a/meta-oe/recipes-connectivity/hostapd/hostapd/CVE-2024-
> 3596_06.patch b/meta-oe/recipes-connectivity/hostapd/hostapd/CVE-2024-
> 3596_06.patch
> new file mode 100644
> index 0000000000..9a284b5261
> --- /dev/null
> +++ b/meta-oe/recipes-connectivity/hostapd/hostapd/CVE-2024-3596_06.patch
> @@ -0,0 +1,46 @@
> +From 934b0c3a45ce0726560ccefbd992a9d385c36385 Mon Sep 17 00:00:00
> 2001
> +From: Jouni Malinen <j@w1.fi>
> +Date: Sat, 16 Mar 2024 11:31:37 +0200
> +Subject: [PATCH 7/9] Require Message-Authenticator in Access-Reject even
> + without EAP-Message
> +
> +Do not allow the exception for missing Message-Authenticator in
> +Access-Reject without EAP-Message. While such exception is allowed in
> +RADIUS definition, there is no strong reason to maintain this since
> +Access-Reject is supposed to include EAP-Message and even if it doesn't,
> +discarding Access-Reject will result in the connection not completing.
> +
> +Signed-off-by: Jouni Malinen <j@w1.fi>
> +
> +CVE: CVE-2024-3596
> +Upstream-Status: Backport
> [https://w1.fi/cgit/hostap/commit/?id=3D934b0c3a45ce0726560ccefbd992a9d38=
5
> c36385]
> +Signed-off-by: Peter Marko <peter.marko@siemens.com>
> +---
> + src/ap/ieee802_1x.c | 11 +----------
> + 1 file changed, 1 insertion(+), 10 deletions(-)
> +
> +diff --git a/src/ap/ieee802_1x.c b/src/ap/ieee802_1x.c
> +index 89e3dd30e..6e7b75128 100644
> +--- a/src/ap/ieee802_1x.c
> ++++ b/src/ap/ieee802_1x.c
> +@@ -1939,16 +1939,7 @@ ieee802_1x_receive_auth(struct radius_msg *msg,
> struct radius_msg *req,
> + 	}
> + 	sta =3D sm->sta;
> +
> +-	/* RFC 2869, Ch. 5.13: valid Message-Authenticator attribute MUST be
> +-	 * present when packet contains an EAP-Message attribute */
> +-	if (hdr->code =3D=3D RADIUS_CODE_ACCESS_REJECT &&
> +-	    radius_msg_get_attr(msg, RADIUS_ATTR_MESSAGE_AUTHENTICATOR,
> NULL,
> +-				0) < 0 &&
> +-	    radius_msg_get_attr(msg, RADIUS_ATTR_EAP_MESSAGE, NULL, 0) < 0)
> {
> +-		wpa_printf(MSG_DEBUG,
> +-			   "Allowing RADIUS Access-Reject without Message-
> Authenticator since it does not include EAP-Message");
> +-	} else if (radius_msg_verify(msg, shared_secret, shared_secret_len,
> +-				     req, 1)) {
> ++	if (radius_msg_verify(msg, shared_secret, shared_secret_len, req, 1)) =
{
> + 		wpa_printf(MSG_INFO,
> + 			   "Incoming RADIUS packet did not have correct
> Message-Authenticator - dropped");
> + 		return RADIUS_RX_INVALID_AUTHENTICATOR;
> +--
> +2.30.2
> +
> diff --git a/meta-oe/recipes-connectivity/hostapd/hostapd/CVE-2024-
> 3596_07.patch b/meta-oe/recipes-connectivity/hostapd/hostapd/CVE-2024-
> 3596_07.patch
> new file mode 100644
> index 0000000000..78d3f5d591
> --- /dev/null
> +++ b/meta-oe/recipes-connectivity/hostapd/hostapd/CVE-2024-3596_07.patch
> @@ -0,0 +1,105 @@
> +From 58097123ec5ea6f8276b38cb9b07669ec368a6c1 Mon Sep 17 00:00:00
> 2001
> +From: Jouni Malinen <j@w1.fi>
> +Date: Sun, 17 Mar 2024 10:42:56 +0200
> +Subject: [PATCH 8/9] RADIUS: Require Message-Authenticator attribute in =
MAC
> + ACL cases
> +
> +hostapd required Message-Authenticator attribute to be included in EAP
> +authentication cases, but that requirement was not in place for MAC ACL
> +cases. Start requiring Message-Authenticator attribute for MAC ACL by
> +default. Unlike the EAP case, this can still be disabled with
> +radius_require_message_authenticator=3D1 to maintain compatibility with
> +some RADIUS servers when used in a network where the connection to such
> +a server is secure.
> +
> +Signed-off-by: Jouni Malinen <j@w1.fi>
> +
> +CVE: CVE-2024-3596
> +Upstream-Status: Backport
> [https://w1.fi/cgit/hostap/commit/?id=3D58097123ec5ea6f8276b38cb9b07669ec=
3
> 68a6c1]
> +Signed-off-by: Peter Marko <peter.marko@siemens.com>
> +---
> + hostapd/config_file.c    |  3 +++
> + hostapd/hostapd.conf     | 11 +++++++++++
> + src/ap/ap_config.c       |  1 +
> + src/ap/ap_config.h       |  1 +
> + src/ap/ieee802_11_auth.c |  4 +++-
> + 5 files changed, 19 insertions(+), 1 deletion(-)
> +
> +diff --git a/hostapd/config_file.c b/hostapd/config_file.c
> +index b14728d1b..af1e81d1d 100644
> +--- a/hostapd/config_file.c
> ++++ b/hostapd/config_file.c
> +@@ -2806,6 +2806,9 @@ static int hostapd_config_fill(struct hostapd_conf=
ig
> *conf,
> + 		bss->radius->acct_server->shared_secret_len =3D len;
> + 	} else if (os_strcmp(buf, "radius_retry_primary_interval") =3D=3D 0) {
> + 		bss->radius->retry_primary_interval =3D atoi(pos);
> ++	} else if (os_strcmp(buf,
> ++			     "radius_require_message_authenticator") =3D=3D 0) {
> ++		bss->radius_require_message_authenticator =3D atoi(pos);
> + 	} else if (os_strcmp(buf, "radius_acct_interim_interval") =3D=3D 0) {
> + 		bss->acct_interim_interval =3D atoi(pos);
> + 	} else if (os_strcmp(buf, "radius_request_cui") =3D=3D 0) {
> +diff --git a/hostapd/hostapd.conf b/hostapd/hostapd.conf
> +index 3c2019f73..c055946a6 100644
> +--- a/hostapd/hostapd.conf
> ++++ b/hostapd/hostapd.conf
> +@@ -1447,6 +1447,17 @@ own_ip_addr=3D127.0.0.1
> + # currently used secondary server is still working.
> + #radius_retry_primary_interval=3D600
> +
> ++# Message-Authenticator attribute requirement for non-EAP cases
> ++# hostapd requires Message-Authenticator attribute to be included in al=
l cases
> ++# where RADIUS is used for EAP authentication. This is also required fo=
r cases
> ++# where RADIUS is used for MAC ACL (macaddr_acl=3D2) by default, but th=
at case
> ++# can be configured to not require this for compatibility with RADIUS s=
ervers
> ++# that do not include the attribute. This is not recommended due to pot=
ential
> ++# security concerns, but can be used as a temporary workaround in netwo=
rks
> where
> ++# the connection to the RADIUS server is secure.
> ++# 0 =3D Do not require Message-Authenticator in MAC ACL response
> ++# 1 =3D Require Message-Authenticator in all authentication cases (defa=
ult)
> ++#radius_require_message_authenticator=3D1
> +
> + # Interim accounting update interval
> + # If this is set (larger than 0) and acct_server is configured, hostapd=
 will
> +diff --git a/src/ap/ap_config.c b/src/ap/ap_config.c
> +index 86b6e097c..cf497a180 100644
> +--- a/src/ap/ap_config.c
> ++++ b/src/ap/ap_config.c
> +@@ -120,6 +120,7 @@ void hostapd_config_defaults_bss(struct
> hostapd_bss_config *bss)
> + #endif /* CONFIG_IEEE80211R_AP */
> +
> + 	bss->radius_das_time_window =3D 300;
> ++	bss->radius_require_message_authenticator =3D 1;
> +
> + 	bss->anti_clogging_threshold =3D 5;
> + 	bss->sae_sync =3D 5;
> +diff --git a/src/ap/ap_config.h b/src/ap/ap_config.h
> +index 49cd3168a..22ad617f4 100644
> +--- a/src/ap/ap_config.h
> ++++ b/src/ap/ap_config.h
> +@@ -302,6 +302,7 @@ struct hostapd_bss_config {
> + 	struct hostapd_ip_addr own_ip_addr;
> + 	char *nas_identifier;
> + 	struct hostapd_radius_servers *radius;
> ++	int radius_require_message_authenticator;
> + 	int acct_interim_interval;
> + 	int radius_request_cui;
> + 	struct hostapd_radius_attr *radius_auth_req_attr;
> +diff --git a/src/ap/ieee802_11_auth.c b/src/ap/ieee802_11_auth.c
> +index 2a950cf7f..dab9bcde3 100644
> +--- a/src/ap/ieee802_11_auth.c
> ++++ b/src/ap/ieee802_11_auth.c
> +@@ -474,7 +474,9 @@ hostapd_acl_recv_radius(struct radius_msg *msg,
> struct radius_msg *req,
> + 		   "Found matching Access-Request for RADIUS message
> (id=3D%d)",
> + 		   query->radius_id);
> +
> +-	if (radius_msg_verify(msg, shared_secret, shared_secret_len, req, 0)) =
{
> ++	if (radius_msg_verify(
> ++		    msg, shared_secret, shared_secret_len, req,
> ++		    hapd->conf->radius_require_message_authenticator)) {
> + 		wpa_printf(MSG_INFO,
> + 			   "Incoming RADIUS packet did not have correct
> authenticator - dropped");
> + 		return RADIUS_RX_INVALID_AUTHENTICATOR;
> +--
> +2.30.2
> +
> diff --git a/meta-oe/recipes-connectivity/hostapd/hostapd/CVE-2024-
> 3596_08.patch b/meta-oe/recipes-connectivity/hostapd/hostapd/CVE-2024-
> 3596_08.patch
> new file mode 100644
> index 0000000000..e23d1e0047
> --- /dev/null
> +++ b/meta-oe/recipes-connectivity/hostapd/hostapd/CVE-2024-3596_08.patch
> @@ -0,0 +1,47 @@
> +From f302d9f9646704cce745734af21d540baa0da65f Mon Sep 17 00:00:00
> 2001
> +From: Jouni Malinen <j@w1.fi>
> +Date: Sun, 17 Mar 2024 10:47:58 +0200
> +Subject: [PATCH 9/9] RADIUS: Check Message-Authenticator if it is presen=
t even
> + if not required
> +
> +Always check the Message-Authenticator attribute in a received RADIUS
> +message if it is present. Previously, this would have been skipped if
> +the attribute was not required to be present.
> +
> +Signed-off-by: Jouni Malinen <j@w1.fi>
> +
> +CVE: CVE-2024-3596
> +Upstream-Status: Backport
> [https://w1.fi/cgit/hostap/commit/?id=3Df302d9f9646704cce745734af21d540ba=
a0
> da65f]
> +Signed-off-by: Peter Marko <peter.marko@siemens.com>
> +---
> + src/radius/radius.c | 14 ++++++++++++++
> + 1 file changed, 14 insertions(+)
> +
> +diff --git a/src/radius/radius.c b/src/radius/radius.c
> +index 2d2e00b5c..a0e3ce399 100644
> +--- a/src/radius/radius.c
> ++++ b/src/radius/radius.c
> +@@ -879,6 +879,20 @@ int radius_msg_verify(struct radius_msg *msg, const
> u8 *secret,
> + 		return 1;
> + 	}
> +
> ++	if (!auth) {
> ++		u8 *pos;
> ++		size_t alen;
> ++
> ++		if (radius_msg_get_attr_ptr(msg,
> ++
> RADIUS_ATTR_MESSAGE_AUTHENTICATOR,
> ++					    &pos, &alen, NULL) =3D=3D 0) {
> ++			/* Check the Message-Authenticator attribute since it
> ++			 * was included even if we are configured to not
> ++			 * require it. */
> ++			auth =3D 1;
> ++		}
> ++	}
> ++
> + 	if (auth &&
> + 	    radius_msg_verify_msg_auth(msg, secret, secret_len,
> + 				       sent_msg->hdr->authenticator)) {
> +--
> +2.30.2
> +
> diff --git a/meta-oe/recipes-connectivity/hostapd/hostapd_2.10.bb b/meta-
> oe/recipes-connectivity/hostapd/hostapd_2.10.bb
> index 3c5f78f91a..70fac06d89 100644
> --- a/meta-oe/recipes-connectivity/hostapd/hostapd_2.10.bb
> +++ b/meta-oe/recipes-connectivity/hostapd/hostapd_2.10.bb
> @@ -11,6 +11,14 @@ SRC_URI =3D " \
>      file://defconfig \
>      file://init \
>      file://hostapd.service \
> +    file://CVE-2024-3596_00.patch \
> +    file://CVE-2024-3596_01.patch \
> +    file://CVE-2024-3596_02.patch \
> +    file://CVE-2024-3596_04.patch \
> +    file://CVE-2024-3596_05.patch \
> +    file://CVE-2024-3596_06.patch \
> +    file://CVE-2024-3596_07.patch \
> +    file://CVE-2024-3596_08.patch \
>  "
>=20
>=20
> --
> 2.30.2


