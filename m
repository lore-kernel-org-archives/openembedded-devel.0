Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13002.1795504718295171716
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Nov 2026 23:18:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=yfXdswp/;
 spf=pass (domain: siemens.com, ip: 52.101.84.45, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fDN1/MTasMF9Pg102wv8b5mYqKGp03/C2vhY/z0iCk8i8kgAwM/yT0ptuMgJOGA6SdK1xyu0tGhu5O8LEil8jyfGeTHlsfdmLPqeJJ8+qxnLuhfXV7aZ30bZgtTn2KOI3CKBxhOpNE2AjqF5Ga279EkhA9rymtAn0Zp0GOk3iiwqR2Zngh9cgI3p3e7iaVamalSxjd9UHpcfhuHPadkjzn0WQpudmORXSJarlMd0WI92YD7F6/01l5NQL/ta7g6mtcpMT60Brh/8wmbcVsLGNL9njLElJi+lYRCDW/N13ftvk7DaU5t7CD6Ped3esONHitsF6hug1ZGwTlL8FU87cA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fDqeqLdSj1pVswDjneTAGiKtjAESSidEOPWsEHetvEk=;
 b=Frjzjm/yf6DYgnJ5XnmGJmItyYJkcDLdgUT0HsyThtpQn8JmzrN1yvJRKK3+2zb6sVfQTDdpYFFUvphJc5Cz32A/p9Ihynh/KFoIgwvHhsxPNGedQ7CQXoOSC8vBnJMoM1yce6iUIMaA0PXzgCP20sXQkz11YvrgJAZjLhXefkdjFWcviDToX2e4ypJmfhJj94DWL+UVwBPfAi3FFZCvrSGCx5jTzH0kdGHVSj8jWZ+IHMyO39F1BWg7QihGuEkHGnzVB3je8tlbdHeXcbXDNgywDW/FGP8FAE2105cicx1LvmW+UPXSKQixYYeFQSqll6RYS/9TN7O+IGGraHkX9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fDqeqLdSj1pVswDjneTAGiKtjAESSidEOPWsEHetvEk=;
 b=yfXdswp/oSazxQRRotQZfS97cnL2zAE/lOFoFX1mkAIoHRbAXtY7cavTBalbBi6w/Dh+tA7o23HNoFDq3aTa80b8Is5Ke0X5bvKbp17VzLfSQLOHqTVgupud12tydt5zA60GCxBHra210fnhdE4UEri5Xq/afMhcAh1DQTNjE2hhx7eR+LNPP7kLu1mk555PXT1BJkfJTteThtc5H6BwqZ18c5MXPp2Hzup3pygDUcoPeQHX8B4+sFSb+OGy8wIoNd2VpG2slgwHClymDOW11I5nuLrDEWbt9UzbjkiWd7c//MdWG0rJDv3nw9AxlfPTPF2u49EWiqj+xenhCwyiiw==
Received: from AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:420::16)
 by GVXPR10MB5864.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:6::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.4; Tue, 24 Nov
 2026 07:18:30 +0000
Received: from AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::a905:57e5:8858:d008]) by AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::a905:57e5:8858:d008%6]) with mapi id 15.21.0662.001; Tue, 24 Nov 2026
 07:18:29 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>, Anuj Mittal
	<anuj.mittal@oss.qualcomm.com>
Subject: RE: [meta-oe][scarthgap][PATCH] zchunk: patch CVE-2026-117556
Thread-Topic: [meta-oe][scarthgap][PATCH] zchunk: patch CVE-2026-117556
Thread-Index: AQHdZ+TCGmvM2Z2VIkq5jmWi5+WDtLc899uA
Date: Tue, 24 Nov 2026 07:18:29 +0000
Message-ID: <AS8PR10MB50736F6F65C7B5C09F83BC97FD442@AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM>
References: <20261029203012.3210324-1-peter.marko@siemens.com>
In-Reply-To: <20261029203012.3210324-1-peter.marko@siemens.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=bc131259-0956-4d54-bf29-948315bc6e6e;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2026-11-24T07:17:10Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Tag=10,
 3, 0, 1;
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR10MB5073:EE_|GVXPR10MB5864:EE_
x-ms-office365-filtering-correlation-id: 364f6dc7-df3a-4224-ca67-08df49fb23fb
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|23010399003|1800799024|18002099003|22082099003|55112099003|3023799007|56012099006|11063799006|261021133027099003|261102123227099003|261028144727099003|261009223027099003|261026140227099003|261021121427099003|261022105027099003|261022075727099003|261021123027099003|261021135927099003|261021130227099003|261026135527099003|261022115727099003|261026130827099003|261022113327099003|261026121527099003|38070700021|10067099003;
x-microsoft-antispam-message-info: ExJuofXuzjbPIzZXI5C/uXNKaqNLMh4m0KIY0Yc3zqniDlMe3jdRRqNlHusP0xM8kOMb0QkPCE4N+97HPWFgH6TIevwXc6ciNPW4w2XZfm2X0AWW+CtktFUPbTWH+ABQghDstSzoC63atT+9ZGPzkqCxLlmUbhcMZ+uifRAyHHx0ZOCCmaX+5yXJFqRF/kGN4p9plYlxcNzdFFV8zfaUO6oMgXEkA8pizkNQ2F2RGefzlKhqE99q0gfpgIh+aywqLNRBiJwGBpRHf2oPj/8CpuDIFYSHw1yo6Gu4KnFaGMDjSJJTdBtyAesmJ93Y6wYJPeJRkWZj4zG3v39CBUCWWOmqoaCtYyElTnZosSpC3CdKOKtuM2bCjK1nQZGaINfGxnacvaXuBBOSiP+3oeZqkTX88xKtj8hZdRr5ushkj+RkJIFN+mYCp13m3GiUWHLccAF29/B4y5xHGTq9hjog9etZxVXUSed4gsqPXQut6J+G7ZxnxLWkRzb+JXQXUWHobNnPdtpBwTpx00a1+PIpQtnnPzX2Y3UEopcvEFpyDYgWzIWv5Mydr9fs6p+TTAWulfbk9BANkoA1/WNSJraUzm3FORQWybcBydmwSQXG+zOZnA3i50ORPWJFosldViNnbzVNcVPUv+rOBn6QfpozwG9yV26Y+mNzIa7ZjJ6WXgEJCm2kFVyE6wipdFnMBl7/VdBEUcC64fpX0OJTmOU7aE/kM68tN7Vji6LkJgITWF0=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(18002099003)(22082099003)(55112099003)(3023799007)(56012099006)(11063799006)(261021133027099003)(261102123227099003)(261028144727099003)(261009223027099003)(261026140227099003)(261021121427099003)(261022105027099003)(261022075727099003)(261021123027099003)(261021135927099003)(261021130227099003)(261026135527099003)(261022115727099003)(261026130827099003)(261022113327099003)(261026121527099003)(38070700021)(10067099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?FJRj7IgBijItYu5KB9sVDQr83TS7o/4FTEYusqEPbtb+WN10GWjPBnmJVFB4?=
 =?us-ascii?Q?AWgSw8jwmb2dm2ajX6EX+sNbO0sfcKd5+VCkMNUCxnQ/yMLS7puBy5pPZZ6o?=
 =?us-ascii?Q?xBVYigBkgQ9IyL1DK4indaJaGAzdU6xtSc/wHKLqpp0XKlnxpS0kqFkQ1Ldx?=
 =?us-ascii?Q?6F1woX0Ps9RhoofS+tVz7GZRFdtMmfNt71WAGdFYzYn5xECGXk/fOpyrYSSG?=
 =?us-ascii?Q?8QzX8kxX9iOM/Ew0qJ80Iu8kY2YPg92amZHHIoUQzvqXZtxgGqFadDvYgkeL?=
 =?us-ascii?Q?qELsjhybLYcAeKiWcBjgQX4m0kXs1+/mVluGIbomJopg+Y+D287339TkRNL5?=
 =?us-ascii?Q?gaMs0IzRvwv2oq7RLG8HZO+l2OBsAln9VfaN82b67p/id0vyXQVACh6n1sLL?=
 =?us-ascii?Q?G5sH7Oo/K2x33+NikAIXtFZSv9rMk9KX4OP5tWCUvn3SnmPv4655Cb3XScZK?=
 =?us-ascii?Q?WAfwO1412aAOJKPzS8M0k18uCOjKtWaialy8P9tP+oXwHgSQb6d1pSxylzot?=
 =?us-ascii?Q?99rQYCc7dANE9RKa/zxVYMpbFagMQNM97wb3MITmHixR7kflsaxwrVtXzalS?=
 =?us-ascii?Q?m4v+PbMNj0zJtIckOm5WEsj/4v64ynGxM5Njt0D5dpQLrQoA10LoVF0L03GT?=
 =?us-ascii?Q?53WoOCp8zp3ljDVKfDYaLFFfViGDXEr3xuBhe3PSrk9CA1fgdUm3Ki4OFA49?=
 =?us-ascii?Q?XaLq9MPS7NVcqmQtzl0248o3BKDJ06rkGyUsG+ocP2/uNIpYTmgq8nXxjRxF?=
 =?us-ascii?Q?0t4aSuTRuVMtbRJC8qI4fLE/j6T+5rvC7CSTFTjpofAKQTmyz7bdO2HCQax/?=
 =?us-ascii?Q?V0QVAoNG1EmMyEmhNxZfpFJX9dcpvOAlc7NOnkEW+nQyQONLUJB2Oj/og4ps?=
 =?us-ascii?Q?zoMq05syAQhq0dnEADdXu2amc+HDrgQVHG2cfV9WFZ0ujJYJ2QvWuc+LA1AA?=
 =?us-ascii?Q?B9IVVo46IJQSkYAVbHLZ/+OEc3Vg6ulAi3Rgc5TwtoozJqH47aYAKYj3JCGu?=
 =?us-ascii?Q?pP67EVhN4PH3jjyaygXGx80VetcPzsmykUiksERKmfaRoQxlQsxWWIkswq7g?=
 =?us-ascii?Q?QqGHX5+4fppHYP3eQ0HE5Mx6VFDaGA9rZmalxV6elE2ufO8cljsi7BF9yMKF?=
 =?us-ascii?Q?cNCfoQ+/rpE358EcBvz+DYz5X01UJnONDTrsY+07mToS9gjTvGWANSycHvcE?=
 =?us-ascii?Q?2sQcInYA7W+0htwXkvYI9qQzMclVbUmxg5Oc51YYocK5vXBWykAQtiDxAL5m?=
 =?us-ascii?Q?1FpmJzQF56vpeZLzXVKpvKOSByimeCPR2zK4EyG3NhEg2FhQPoaNnPtsy8rn?=
 =?us-ascii?Q?bET2qhMQzek7PDtHImOzp8gy6P9Sb0G453wVJHp7VsrX9JGg/6gyc8q8fO0h?=
 =?us-ascii?Q?7ueMOmBLPkHpUgxWdi1pWzRzvKiYJ/hpXbfnfIE9wDBvn8GDOTaSELNRtiLE?=
 =?us-ascii?Q?0fWEs+k4UufNfNxRZeYNYaGo+m6uj/eUtiSNJ77HKMDPdMJNfoYlVGaBrC1b?=
 =?us-ascii?Q?meXUFxD07p9M0L2OonSRNfAXhz0tN2V/jQx8ROzMLx59xcD/L2fHlxI1EHZ2?=
 =?us-ascii?Q?Uzb76R1qf5KZOdKVqIJ10TMvZ08Ir1OOJi/7vKfWPKH4Undpygzl3ocV41+4?=
 =?us-ascii?Q?OhL5ASdtKcU5zgb4dpzuuyMXw/kFYc96LBlqIwB/JGNy9pRE6BWRJl5j8KJ/?=
 =?us-ascii?Q?UmVIfOujGDx0Qsbtp1PpjLIgS0mEbujaZDvCG8YDyyzJxNMJcgobXrgYZJP4?=
 =?us-ascii?Q?XyvAOiqquQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 364f6dc7-df3a-4224-ca67-08df49fb23fb
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Nov 2026 07:18:29.8944
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZJWqOejAxg9Yr/G8z6JfaD2E/GisjsaqRZwUxhLqbb9VEwMesWvc1vNpPILVxp5bmvoqowV0nLrT8v7BzxUL1A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR10MB5864
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 24 Nov 2026 07:18:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132933

Gentle ping.
This one is missing in last scarthgap merge...

Peter

> -----Original Message-----
> From: Marko, Peter (FT D EU SK BFS1) <Peter.Marko@siemens.com>
> Sent: Thursday, October 29, 2026 9:30 PM
> To: openembedded-devel@lists.openembedded.org
> Cc: Marko, Peter (FT D EU SK BFS1) <Peter.Marko@siemens.com>
> Subject: [meta-oe][scarthgap][PATCH] zchunk: patch CVE-2026-117556
>=20
> From: Peter Marko <peter.marko@siemens.com>
>=20
> Pick patch per [1].
> Also pick related patch to apply it correctly.
>=20
> [1] https://security-tracker.debian.org/tracker/CVE-2026-117556
>=20
> Signed-off-by: Peter Marko <peter.marko@siemens.com>
> ---
>  .../zchunk/zchunk/CVE-2026-117556-01.patch    | 150 ++++++++
>  .../zchunk/zchunk/CVE-2026-117556-02.patch    | 329 ++++++++++++++++++
>  .../recipes-support/zchunk/zchunk_1.4.0.bb    |   6 +-
>  3 files changed, 484 insertions(+), 1 deletion(-)
>  create mode 100644 meta-oe/recipes-support/zchunk/zchunk/CVE-2026-
> 117556-01.patch
>  create mode 100644 meta-oe/recipes-support/zchunk/zchunk/CVE-2026-
> 117556-02.patch
>=20
> diff --git a/meta-oe/recipes-support/zchunk/zchunk/CVE-2026-117556-01.pat=
ch
> b/meta-oe/recipes-support/zchunk/zchunk/CVE-2026-117556-01.patch
> new file mode 100644
> index 00000000000..01ac3cca92f
> --- /dev/null
> +++ b/meta-oe/recipes-support/zchunk/zchunk/CVE-2026-117556-01.patch
> @@ -0,0 +1,150 @@
> +From ab6aedbe5a1e9597ba9b9e50462af476a0655f7a Mon Sep 17 00:00:00
> 2001
> +From: Jonathan Dieter <jonathan@dieter.ie>
> +Date: Thu, 30 Jul 2026 20:51:11 +0100
> +Subject: [PATCH] Fix a number of memory related bugs in zchunk
> +
> +Credit for this patch and for bringing these bugs to my attention goes t=
o
> +glitchfox.  Additionally, after glitchfox brought this to my attention, =
I
> +received a PR to fix the optional element bug from lilu5458.
> +
> +Authored-by: glitchfox@benjaminali.com
> +Signed-off-by: Jonathan Dieter <jonathan@dieter.ie>
> +
> +CVE: CVE-2026-117556
> +Upstream-Status: Backport
> [https://github.com/zchunk/zchunk/commit/ab6aedbe5a1e9597ba9b9e50462af47
> 6a0655f7a]
> +Signed-off-by: Peter Marko <peter.marko@siemens.com>
> +---
> + src/lib/comp/comp.c        |  8 +++++---
> + src/lib/dl/range.c         |  3 +++
> + src/lib/header.c           |  4 ++++
> + src/lib/index/index_read.c | 20 +++++++++++++++-----
> + 4 files changed, 27 insertions(+), 8 deletions(-)
> +
> +diff --git a/src/lib/comp/comp.c b/src/lib/comp/comp.c
> +index 414727d..1c116a6 100644
> +--- a/src/lib/comp/comp.c
> ++++ b/src/lib/comp/comp.c
> +@@ -101,7 +101,8 @@ static size_t comp_read_from_dc(zckCtx *zck, zckComp
> *comp, char *dst,
> +     size_t dl_size =3D dst_size;
> +     if(dl_size > comp->dc_data_size - comp->dc_data_loc)
> +         dl_size =3D comp->dc_data_size - comp->dc_data_loc;
> +-    memcpy(dst, comp->dc_data+comp->dc_data_loc, dl_size);
> ++    if(dl_size > 0)
> ++        memcpy(dst, comp->dc_data+comp->dc_data_loc, dl_size);
> +     comp->dc_data_loc +=3D dl_size;
> +     if(dl_size > 0)
> +         zck_log(ZCK_LOG_DEBUG, "Reading %llu bytes from decompressed
> buffer",
> +@@ -414,8 +415,9 @@ bool comp_add_to_dc(zckCtx *zck, zckComp *comp,
> const char *src,
> +                 (long long unsigned) comp->dc_data_loc);
> +     zck_log(ZCK_LOG_DEBUG, "Adding %llu bytes to decompressed buffer",
> +             (long long unsigned) src_size);
> +-    memcpy(temp, comp->dc_data + comp->dc_data_loc,
> +-           comp->dc_data_size - comp->dc_data_loc);
> ++    if(comp->dc_data_size > comp->dc_data_loc)
> ++        memcpy(temp, comp->dc_data + comp->dc_data_loc,
> ++               comp->dc_data_size - comp->dc_data_loc);
> +     free(comp->dc_data);
> +     comp->dc_data_size -=3D comp->dc_data_loc;
> +     comp->dc_data_loc =3D 0;
> +diff --git a/src/lib/dl/range.c b/src/lib/dl/range.c
> +index d4f7426..d786551 100644
> +--- a/src/lib/dl/range.c
> ++++ b/src/lib/dl/range.c
> +@@ -153,6 +153,9 @@ void ZCK_PUBLIC_API zck_range_free(zckRange
> **info) {
> + }
> +
> + char ZCK_PUBLIC_API *zck_get_range_char(zckCtx *zck, zckRange *range) {
> ++    if(range =3D=3D NULL || range->first =3D=3D NULL)
> ++        return zmalloc(1);
> ++
> +     int buf_size =3D BUF_SIZE;
> +     char *output =3D zmalloc(buf_size);
> +     if (!output) {
> +diff --git a/src/lib/header.c b/src/lib/header.c
> +index 57adc31..e28935d 100644
> +--- a/src/lib/header.c
> ++++ b/src/lib/header.c
> +@@ -195,6 +195,10 @@ static bool read_preface(zckCtx *zck) {
> +             if(!compint_to_size(zck, &data_size, header+length, &length=
,
> +                                 max_length))
> +                 return false;
> ++            if(data_size > max_length - length) {
> ++                set_fatal_error(zck, "Optional element exceeds header s=
ize");
> ++                return false;
> ++            }
> +             if(!read_optional_element(zck, id, data_size, header+length=
))
> +                 return false;
> +             length +=3D data_size;
> +diff --git a/src/lib/index/index_read.c b/src/lib/index/index_read.c
> +index 6ec0a8d..8f57f23 100644
> +--- a/src/lib/index/index_read.c
> ++++ b/src/lib/index/index_read.c
> +@@ -47,7 +47,7 @@ bool index_read(zckCtx *zck, char *data, size_t size,
> size_t max_length) {
> +
> +     /* Read and configure hash type */
> +     int hash_type =3D 0;
> +-    if(!compint_to_int(zck, &hash_type, data + length, &length, max_len=
gth)) {
> ++    if(!compint_to_int(zck, &hash_type, data + length, &length, size)) =
{
> +         set_fatal_error(zck, "Unable to read hash type");
> +         return false;
> +     }
> +@@ -59,7 +59,7 @@ bool index_read(zckCtx *zck, char *data, size_t size,
> size_t max_length) {
> +     /* Read number of index entries */
> +     size_t index_count;
> +     if(!compint_to_size(zck, &index_count, data + length, &length,
> +-                        max_length)) {
> ++                        size)) {
> +         set_fatal_error(zck, "Unable to read index count");
> +         return false;
> +     }
> +@@ -69,7 +69,7 @@ bool index_read(zckCtx *zck, char *data, size_t size,
> size_t max_length) {
> +     size_t idx_loc =3D 0;
> +     int count =3D 0;
> +     while(length < size) {
> +-        if(length + zck->index.digest_size > max_length) {
> ++        if(zck->index.digest_size > size - length) {
> +             set_fatal_error(zck, "Read past end of header");
> +             return false;
> +         }
> +@@ -99,6 +99,12 @@ bool index_read(zckCtx *zck, char *data, size_t size,
> size_t max_length) {
> +         /* Read uncompressed entry digest, if any */
> +         if (zck->has_uncompressed_source) {
> +             /* same size for digest as compressed */
> ++            if(zck->index.digest_size > size - length) {
> ++                set_fatal_error(zck, "Read past end of index");
> ++                free(new->digest);
> ++                free(new);
> ++                return false;
> ++            }
> +             new->digest_uncompressed =3D zmalloc(zck->index.digest_size=
);
> +             if (!new->digest_uncompressed) {
> +                 free(new->digest);
> +@@ -116,7 +122,7 @@ bool index_read(zckCtx *zck, char *data, size_t size=
,
> size_t max_length) {
> +         /* Read and store entry length */
> +         size_t chunk_length =3D 0;
> +         if(!compint_to_size(zck, &chunk_length, data+length, &length,
> +-                            max_length)) {
> ++                            size)) {
> +             set_fatal_error(zck, "Unable to read chunk %i compressed si=
ze",
> +                             count);
> +             return false;
> +@@ -127,7 +133,7 @@ bool index_read(zckCtx *zck, char *data, size_t size=
,
> size_t max_length) {
> +         /* Read and store uncompressed entry length */
> +         chunk_length =3D 0;
> +         if(!compint_to_size(zck, &chunk_length, data+length, &length,
> +-                            max_length)) {
> ++                            size)) {
> +             set_fatal_error(zck, "Unable to read chunk %i uncompressed =
size",
> +                             count);
> +             return false;
> +@@ -146,6 +152,10 @@ bool index_read(zckCtx *zck, char *data, size_t siz=
e,
> size_t max_length) {
> +             zck->index.first =3D new;
> +         prev =3D new;
> +     }
> ++    if(count =3D=3D 0 || (size_t)count !=3D index_count) {
> ++        set_fatal_error(zck, "Index entry count does not match index da=
ta");
> ++        return false;
> ++    }
> +     free(zck->index_string);
> +     zck->index_string =3D NULL;
> +     return true;
> diff --git a/meta-oe/recipes-support/zchunk/zchunk/CVE-2026-117556-02.pat=
ch
> b/meta-oe/recipes-support/zchunk/zchunk/CVE-2026-117556-02.patch
> new file mode 100644
> index 00000000000..968632cbeb8
> --- /dev/null
> +++ b/meta-oe/recipes-support/zchunk/zchunk/CVE-2026-117556-02.patch
> @@ -0,0 +1,329 @@
> +From 02b371a64bf98245df97315d07c684a0ca5ea1df Mon Sep 17 00:00:00
> 2001
> +From: Jonathan Dieter <jonathan@dieter.ie>
> +Date: Mon, 26 Oct 2026 18:07:06 +0000
> +Subject: [PATCH] Fix out-of-bounds read
> +
> +Also, add a flag for doing memory tests.
> +
> +Thanks to HaiND (Nguyen Dinh Hai), Post and Telecommunication Institute
> +of Technology, github.com/Haind03 for flagging up this issue
> +
> +Signed-off-by: Jonathan Dieter <jonathan@dieter.ie>
> +
> +CVE: CVE-2026-117556
> +Upstream-Status: Backport
> [https://github.com/zchunk/zchunk/commit/02b371a64bf98245df97315d07c684a0
> ca5ea1df]
> +Signed-off-by: Peter Marko <peter.marko@siemens.com>
> +---
> + src/lib/compint.c         |   4 +
> + src/lib/header.c          |  16 +--
> + test/meson.build          |  10 ++
> + test/read_header_bounds.c | 203
> ++++++++++++++++++++++++++++++++++++++
> + 4 files changed, 227 insertions(+), 6 deletions(-)
> + create mode 100644 test/read_header_bounds.c
> +
> +diff --git a/src/lib/compint.c b/src/lib/compint.c
> +index 5178559..7324d12 100644
> +--- a/src/lib/compint.c
> ++++ b/src/lib/compint.c
> +@@ -48,6 +48,10 @@ int compint_to_size(zckCtx *zck, size_t *val, const c=
har
> *compint,
> +     VALIDATE_BOOL(zck);
> +
> +     *val =3D 0;
> ++    if(max_length =3D=3D 0) {
> ++        set_fatal_error(zck, "Read past end of header");
> ++        return false;
> ++    }
> +     size_t old_val =3D 0;
> +     const unsigned char *i =3D (unsigned char *)compint;
> +     int count =3D 0;
> +diff --git a/src/lib/header.c b/src/lib/header.c
> +index e28935d..05f8895 100644
> +--- a/src/lib/header.c
> ++++ b/src/lib/header.c
> +@@ -164,7 +164,8 @@ static bool read_preface(zckCtx *zck) {
> +
> +     /* Read flags */
> +     size_t flags =3D 0;
> +-    if(!compint_to_size(zck, &flags, header+length, &length, max_length=
))
> ++    if(!compint_to_size(zck, &flags, header+length, &length,
> ++                        max_length - length))
> +         return false;
> +     if(!check_flags(zck, flags))
> +         return false;
> +@@ -174,7 +175,8 @@ static bool read_preface(zckCtx *zck) {
> +     int tmp =3D 0;
> +
> +     /* Read and initialize compression type */
> +-    if(!compint_to_int(zck, &tmp, header+length, &length, max_length))
> ++    if(!compint_to_int(zck, &tmp, header+length, &length,
> ++                       max_length - length))
> +         return false;
> +     if(!comp_ioption(zck, ZCK_COMP_TYPE, tmp))
> +         return false;
> +@@ -185,15 +187,16 @@ static bool read_preface(zckCtx *zck) {
> +     if(zck->has_optional_elems) {
> +         size_t opt_count =3D 0;
> +         if(!compint_to_size(zck, &opt_count, header+length, &length,
> +-                            max_length))
> ++                            max_length - length))
> +             return false;
> +         for(size_t i=3D0; i<opt_count; i++) {
> +             size_t id =3D 0;
> +             size_t data_size =3D 0;
> +-            if(!compint_to_size(zck, &id, header+length, &length, max_l=
ength))
> ++            if(!compint_to_size(zck, &id, header+length, &length,
> ++                                max_length - length))
> +                 return false;
> +             if(!compint_to_size(zck, &data_size, header+length, &length=
,
> +-                                max_length))
> ++                                max_length - length))
> +                 return false;
> +             if(data_size > max_length - length) {
> +                 set_fatal_error(zck, "Optional element exceeds header s=
ize");
> +@@ -206,7 +209,8 @@ static bool read_preface(zckCtx *zck) {
> +     }
> +
> +     /* Read and initialize index size */
> +-    if(!compint_to_int(zck, &tmp, header+length, &length, max_length))
> ++    if(!compint_to_int(zck, &tmp, header+length, &length,
> ++                       max_length - length))
> +         return false;
> +     zck->index_size =3D tmp;
> +
> +diff --git a/test/meson.build b/test/meson.build
> +index 66a1820..fc7a35f 100644
> +--- a/test/meson.build
> ++++ b/test/meson.build
> +@@ -52,6 +52,11 @@ exitcodecheck =3D executable('exitcodecheck',
> +                       include_directories: incdir,
> +                       dependencies: [zstd_dep, openssl_dep],
> +                       c_args: preprocessor_defines)
> ++read_header_bounds =3D executable('read_header_bounds',
> ++                      ['read_header_bounds.c'] + util_sources,
> ++                      include_directories: incdir,
> ++                      dependencies: [zstd_dep, openssl_dep],
> ++                      c_args: preprocessor_defines)
> + zck_cmp_uncomp =3D executable(
> +     'zck_cmp_uncomp',
> +     ['zck_cmp_uncomp.c'],
> +@@ -73,6 +78,11 @@ test(
> +     empty,
> +     is_parallel: false
> + )
> ++test(
> ++    'rejects truncated preface without over-reading',
> ++    read_header_bounds,
> ++    is_parallel: false
> ++)
> + test(
> +     'check version info in zck',
> +     zck,
> +diff --git a/test/read_header_bounds.c b/test/read_header_bounds.c
> +new file mode 100644
> +index 0000000..2162de6
> +--- /dev/null
> ++++ b/test/read_header_bounds.c
> +@@ -0,0 +1,203 @@
> ++/*
> ++ * Copyright 2026 Jonathan Dieter <jonathan@dieter.ie>
> ++ *
> ++ * Redistribution and use in source and binary forms, with or without
> ++ * modification, are permitted provided that the following conditions a=
re met:
> ++ *
> ++ *  1. Redistributions of source code must retain the above copyright n=
otice,
> ++ *     this list of conditions and the following disclaimer.
> ++ *
> ++ *  2. Redistributions in binary form must reproduce the above copyrigh=
t notice,
> ++ *     this list of conditions and the following disclaimer in the docu=
mentation
> ++ *     and/or other materials provided with the distribution.
> ++ *
> ++ * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND
> CONTRIBUTORS "AS IS"
> ++ * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
> LIMITED TO, THE
> ++ * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A
> PARTICULAR PURPOSE
> ++ * ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR
> CONTRIBUTORS BE
> ++ * LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
> EXEMPLARY, OR
> ++ * CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
> PROCUREMENT OF
> ++ * SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS;
> OR BUSINESS
> ++ * INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
> LIABILITY, WHETHER IN
> ++ * CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR
> OTHERWISE)
> ++ * ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF
> ADVISED OF THE
> ++ * POSSIBILITY OF SUCH DAMAGE.
> ++ */
> ++
> ++/* Regression test for the read_preface() out-of-bounds read - Only wil=
l
> ++ * report an issue when run under a sanitizer */
> ++
> ++#include <stdlib.h>
> ++#include <stdio.h>
> ++#include <string.h>
> ++#include <stdbool.h>
> ++#include <unistd.h>
> ++#include <sys/types.h>
> ++#include <sys/stat.h>
> ++#include <fcntl.h>
> ++#include <zck.h>
> ++#include "zck_private.h"
> ++#include "util.h"
> ++
> ++#ifndef O_BINARY
> ++#define O_BINARY 0
> ++#endif
> ++
> ++#define TEST_FILE "read_header_bounds.zck"
> ++
> ++/* Exit code that tells meson the test was skipped */
> ++#define SKIP 77
> ++
> ++/* The over-read is only caught by a memory checker, so only run under
> ++ * valgrind (which preloads its own libraries) or AddressSanitizer */
> ++static bool memory_checked(void) {
> ++#ifdef __SANITIZE_ADDRESS__
> ++    return true;
> ++#else
> ++    const char *preload =3D getenv("LD_PRELOAD");
> ++    return preload !=3D NULL && strstr(preload, "vgpreload") !=3D NULL;
> ++#endif
> ++}
> ++
> ++/* Compute the SHA-256 header digest over the given bytes, using libzck=
's own
> ++ * hashing so it matches what read_header_from_file() will calculate. *=
/
> ++static char *header_digest(const char *buf, size_t size) {
> ++    zckCtx *zck =3D zck_create();
> ++    if(zck =3D=3D NULL)
> ++        return NULL;
> ++
> ++    zckHashType ht;
> ++    zckHash hash;
> ++    memset(&hash, 0, sizeof(hash));  /* hash_init() closes it before us=
e */
> ++    if(!hash_setup(zck, &ht, ZCK_HASH_SHA256) ||
> ++       !hash_init(zck, &hash, &ht) ||
> ++       !hash_update(zck, &hash, buf, size)) {
> ++        zck_free(&zck);
> ++        return NULL;
> ++    }
> ++    char *digest =3D hash_finalize(zck, &hash);
> ++    zck_free(&zck);
> ++    return digest;
> ++}
> ++
> ++int main(void) {
> ++    if(!memory_checked()) {
> ++        printf("Skipping: needs valgrind or AddressSanitizer\n");
> ++        return SKIP;
> ++    }
> ++
> ++    char cibuf[MAX_COMP_SIZE];
> ++    size_t cilen;
> ++
> ++    /* SHA-256 digest size, read from libzck rather than hard-coded. */
> ++    zckHashType ht;
> ++    if(!hash_setup(NULL, &ht, ZCK_HASH_SHA256)) {
> ++        printf("ERROR: unable to set up SHA-256\n");
> ++        exit(1);
> ++    }
> ++    size_t digest_size =3D ht.digest_size;
> ++
> ++    /* --- Header body (the preface) ---
> ++     * full data digest (zero bytes) + flags(0) + a truncated compressi=
on-type
> ++     * compint.  The final byte has its high bit clear, so the reader b=
elieves
> ++     * the integer continues past the end of the header. */
> ++    char body[64];
> ++    size_t body_len =3D 0;
> ++
> ++    memset(body + body_len, 0, digest_size);         /* data digest */
> ++    body_len +=3D digest_size;
> ++
> ++    cilen =3D 0;
> ++    compint_from_size(cibuf, 0, &cilen);             /* flags =3D 0 */
> ++    memcpy(body + body_len, cibuf, cilen);
> ++    body_len +=3D cilen;
> ++
> ++    body[body_len++] =3D 0x00;  /* unterminated compression-type compin=
t */
> ++
> ++    /* --- Lead ---
> ++     * "\0ZCK1" + compint(hash type) + compint(header length).  The hea=
der
> ++     * digest that follows is computed over the lead prefix plus the bo=
dy,
> ++     * which is exactly the range read_header_from_file() hashes. */
> ++    char lead[16];
> ++    size_t lead_len =3D 0;
> ++
> ++    memcpy(lead, "\0ZCK1", 5);
> ++    lead_len =3D 5;
> ++
> ++    cilen =3D 0;
> ++    compint_from_size(cibuf, ZCK_HASH_SHA256, &cilen);
> ++    memcpy(lead + lead_len, cibuf, cilen);
> ++    lead_len +=3D cilen;
> ++
> ++    cilen =3D 0;
> ++    compint_from_size(cibuf, body_len, &cilen);
> ++    memcpy(lead + lead_len, cibuf, cilen);
> ++    lead_len +=3D cilen;
> ++
> ++    /* digest =3D SHA256(lead prefix + body) */
> ++    char *to_hash =3D zmalloc(lead_len + body_len);
> ++    if(to_hash =3D=3D NULL)
> ++        exit(1);
> ++    memcpy(to_hash, lead, lead_len);
> ++    memcpy(to_hash + lead_len, body, body_len);
> ++    char *digest =3D header_digest(to_hash, lead_len + body_len);
> ++    free(to_hash);
> ++    if(digest =3D=3D NULL) {
> ++        printf("ERROR: unable to compute header digest\n");
> ++        exit(1);
> ++    }
> ++
> ++    /* Write the file: lead, digest, body */
> ++    int out =3D open(TEST_FILE, O_WRONLY | O_CREAT | O_TRUNC |
> O_BINARY, 0666);
> ++    if(out < 0) {
> ++        perror("Unable to open " TEST_FILE " for writing");
> ++        free(digest);
> ++        exit(1);
> ++    }
> ++    if(write(out, lead, lead_len) !=3D (ssize_t)lead_len ||
> ++       write(out, digest, digest_size) !=3D (ssize_t)digest_size ||
> ++       write(out, body, body_len) !=3D (ssize_t)body_len) {
> ++        perror("Short write");
> ++        close(out);
> ++        free(digest);
> ++        exit(1);
> ++    }
> ++    close(out);
> ++    free(digest);
> ++
> ++    /* Read it back: the header must be rejected, not over-read */
> ++    int in =3D open(TEST_FILE, O_RDONLY | O_BINARY);
> ++    if(in < 0) {
> ++        perror("Unable to open " TEST_FILE " for reading");
> ++        exit(1);
> ++    }
> ++
> ++    /* Drive the read stages individually so the test targets the prefa=
ce */
> ++    zckCtx *zck =3D zck_create();
> ++    if(zck =3D=3D NULL) {
> ++        close(in);
> ++        exit(1);
> ++    }
> ++    if(!zck_init_adv_read(zck, in) || !zck_read_lead(zck)) {
> ++        printf("ERROR: lead parse failed unexpectedly: %s\n",
> ++               zck_get_error(zck));
> ++        zck_free(&zck);
> ++        close(in);
> ++        unlink(TEST_FILE);
> ++        exit(1);
> ++    }
> ++
> ++    int rc =3D 0;
> ++    if(zck_read_header(zck)) {
> ++        printf("ERROR: zck_read_header accepted a truncated preface\n")=
;
> ++        rc =3D 1;
> ++    } else {
> ++        printf("zck_read_header correctly rejected truncated preface: %=
s\n",
> ++               zck_get_error(zck));
> ++    }
> ++
> ++    zck_free(&zck);
> ++    close(in);
> ++    unlink(TEST_FILE);
> ++    return rc;
> ++}
> diff --git a/meta-oe/recipes-support/zchunk/zchunk_1.4.0.bb b/meta-oe/rec=
ipes-
> support/zchunk/zchunk_1.4.0.bb
> index 0c8a9c7a5f0..04476782d33 100644
> --- a/meta-oe/recipes-support/zchunk/zchunk_1.4.0.bb
> +++ b/meta-oe/recipes-support/zchunk/zchunk_1.4.0.bb
> @@ -3,7 +3,11 @@ DESCRIPTION =3D "A file format designed for highly effic=
ient
> deltas while maintain
>  LICENSE =3D "BSD-2-Clause"
>  LIC_FILES_CHKSUM =3D
> "file://LICENSE;md5=3Ddaf6e68539f564601a5a5869c31e5242"
>=20
> -SRC_URI =3D "git://github.com/zchunk/zchunk.git;protocol=3Dhttps;branch=
=3Dmain"
> +SRC_URI =3D " \
> +    git://github.com/zchunk/zchunk.git;protocol=3Dhttps;branch=3Dmain \
> +    file://CVE-2026-117556-01.patch \
> +    file://CVE-2026-117556-02.patch \
> +"
>=20
>  SRCREV =3D "4dd91d31157ede4a1b092721d944ae2fdd161cd9"
>  S =3D "${WORKDIR}/git"
