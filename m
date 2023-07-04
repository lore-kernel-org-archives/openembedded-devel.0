Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E48D2EB64D9
	for <webhook@archiver.kernel.org>; Tue,  4 Jul 2023 16:12:49 +0000 (UTC)
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web11.62467.1688487165565424084
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 04 Jul 2023 09:12:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=lQsy0ie7;
 spf=pass (domain: axis.com, ip: 195.60.68.17, mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1688487166;
  x=1720023166;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=GbRCl1x50GsZMYDPjdo1/1EqQ7G/bSDxZ03a5xtoGoM=;
  b=lQsy0ie7Fqi88zoi9uWNnBu7ktDjZi53CCEIYdZHXJ0zffBxQ5y/dteJ
   xspmFJXz7nfotl3KuBpqBw4NjnILVOvm29zD/9yp7jPhYGI4LuektpacK
   91KXb59JBH/72nGwNiqjqwDlzP239bo9uIeyOu/LuSwnNwaUyuV41J4TS
   46dqBYqRbsdXy1GXe5jK8oWG/0UbfprBxeOYpUwfDgdue2JYpq0Ei8nda
   fVNnWe/s2DLJ2/o4dj7yhTrTbfaPdsOWHxnVC1CEoZr4jMr+/A3McuLCq
   3jP6FF1PRk3V7Vq0dx0X1CLUtmx67AyPw7pXTTul98hIkw4Zmujr/XXAd
   g==;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QhmhzfXuACxQXXpbyr8fZL8s5rbaDwxblDXREQxvELT4JH27DbZJ50HCNQpQWiWHFBELO2aLwhFn4xMKf/ezl/XCLyyx1SgCAi8bIH4oraaRgRduPELnEJXpV/XwvGyakmWtXenlIr5OV3tVJJlleyshUFc8xw9arhxEuVB9uaW7f7ZTlYPtX7Wg+rMoRLR4uMauGwkPwifXgZGrv8Vw/gc2ZgroPvUvc0NYtWWWF1hzE+A106H03lFrMHt9pWhp0HhaIpJ0sjuhEGoa8Gxc8U5EOktEfu2KmmhObpMMNw4VAQHU3tz5EUjObOp5frqIj190H29kS1B+vu4JogPWEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GbRCl1x50GsZMYDPjdo1/1EqQ7G/bSDxZ03a5xtoGoM=;
 b=OMqBoJ+pt7z6HGnRPELuNE8/qqjsVpAKF0/6Afj/QeqhZMAFbEskNBqrXE1ryYMcIln551KX+MLnqW8rKtc1Osb4AAUPm4Wr+478GN86E/HPEhbdlZRorbcW4Ze66VjutwzNsRx5e1p3KX6gcaBPNP+PqeDI+PxMWAMZsrPRYAR8kPPqmbQBXzBepS6om1Z57P3QR91+na6IdFk7PfZ2GjnnEOHnRIBwxxMOa/ERPPc++gBkhz/TCAP3nRMV/qMcTE3nFcU2fzV1WaoyQZVD7RutkCHVvRUZbDUfvXAmXLoXPvcrW2N2pbz5ppwRBE90aCTFDpiZFcVaOnZYHABSZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=axis365.onmicrosoft.com; s=selector2-axis365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GbRCl1x50GsZMYDPjdo1/1EqQ7G/bSDxZ03a5xtoGoM=;
 b=VD0eQ+RdHWrjynqO94GgntIMWSd6xgKYw8x/uHGCq3EgZJcVec5srUlu9cBa9hsK95XbHz2H5Zs1SStjeuFnLBCdsBOI7NbufqVHp6g6xs2MQpOQHqM9OUxM90v2yazYAnrpNHpJHs5GKniga8y3J3mTyUPhNWyOh6hjFtcfhtU=
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Armin Kuster <akuster808@gmail.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
CC: Luke Schaefer <lukeschafer17@gmail.com>
Subject: RE: [oe] [meta-oe][kirkstone][PATCH] webserver: nginx: Add stream
 Signed-off-by: Luke Schaefer <lukeschafer17@gmail.com>
Thread-Topic: [oe] [meta-oe][kirkstone][PATCH] webserver: nginx: Add stream
 Signed-off-by: Luke Schaefer <lukeschafer17@gmail.com>
Thread-Index: AQHZroPSXlfe0/eGQ0uJTLVgMyb1bK+px1Uw
Date: Tue, 4 Jul 2023 16:12:39 +0000
Message-ID: <DB5PR02MB102138E958E1A7EAA05282353EF2EA@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: <20230704142816.2295084-1-akuster808@gmail.com>
In-Reply-To: <20230704142816.2295084-1-akuster808@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB5PR02MB10213:EE_|DU0PR02MB7873:EE_
x-ms-office365-filtering-correlation-id: fd44f54c-c533-4afa-e593-08db7ca97cfe
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: kvxGXrX7XGHlH8dDBMNZTF49fb9184B3LeGgCiwDldr/xYB7rY3zxZSGTdaYYm2ZbIpX+dOEOa/Ty6g8fz5AeTaG1nW7aV55B4dTAonhB/CIBvXG5cGb3SBva06t1hfTBZ05XSd6m9bJZ0Dv749W4fZiOGD41I6x9uzB1QGR27TK4QQ6xPEWARmLOvXZeyThRwMuTI7j91W7N7BX5HPxlT6emub0+EaHCDr49TvcHWnhyAyTDRjJz1G8cioqGU6gLjOzTv1t76vz0kBynm9o6xSKPkmBF+JbnP77KufBGvQRgk3Dk9aGy6+5z1zVCxN/ns2GYbhovGK2IzfWMGMFHg5mk/IyA9Afu1E0Rv5Q7IQs5k0w1M3Y8djmqkWlGZnuJ5jG4z7lYX4y6BFdSxfha5xVDZigwEpqOp1N9+oGHxlt5n4WBUBpBrvh4QiizOy0F1dTjW8BnCi4ajSpNfIxPUpMTx5G4iVysVpBId9ZnfpMVwC6GTAmwpKc86XvtbffKH+CU+9MDzCnNFdXaacWn7k74u9KG3xr8XNveccMEWZeUPXykb6Wi6FLzbPdC/5lHj5RDSWGJGRYdr7k5YmiztBYiQyt5W4rmV4IHO/ylMsGwBe72cO9vPm8RQtlldBd
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB5PR02MB10213.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(366004)(376002)(396003)(39860400002)(136003)(451199021)(41300700001)(2906002)(7696005)(6506007)(71200400001)(38100700002)(122000001)(83380400001)(9686003)(53546011)(26005)(186003)(55016003)(86362001)(110136005)(478600001)(38070700005)(316002)(33656002)(76116006)(66556008)(66476007)(66446008)(64756008)(4326008)(66946007)(44832011)(8936002)(8676002)(5660300002)(52536014);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?dPVFAxBusLpUns1O7+krBH0Lc+bbreIuFLwC08Zgb8yeaGcwPP1FeD0Sf6eQ?=
 =?us-ascii?Q?vi6VzD3oYDWsHnrm/HEco4bLwb1c6gXfA5P66RQK1LMb8und1qgUTG96pjaA?=
 =?us-ascii?Q?T6QJ3GtCRvc66e6EG3/A01QTjAEQ+K7sApRy0zdqQFYog6N5xlHvufR0543h?=
 =?us-ascii?Q?Q/8gEmn79Tylaw2vXWrru4+ML8d20IDYo1FTrCj5FDBXh+jIZitsSleFQ2RD?=
 =?us-ascii?Q?av5SpRvjgxD8k+AKpH8EG081yiI8SKXmk5SGtvnzh1q98F4+p6Vd6T3d7igV?=
 =?us-ascii?Q?ttoYkW++LCLWPwADdqiCrVdVUsUC7r/SqnMxyIM3svf2q7gMw/PoPVOjc/vb?=
 =?us-ascii?Q?bvxiL3ujjFy0HBSjB5qo4v4eKK9qBnkNBT8nQHCJ97tGtgVntz/OphAPwSKl?=
 =?us-ascii?Q?XMbFduhPmzBS8YfgvPBYInkEyw7wvazBeNTCyatrrwkaIdVbzg/jDfjtu2hz?=
 =?us-ascii?Q?vJ20xHczq4kJDrnET5v7RnBu4bP16KfiAp7rtyAB6jOYOZwQRXXFbKuvTUqm?=
 =?us-ascii?Q?EMdRfUrKGZSp82uuFs6ANKgjQo5MWXswDF2qlybyw8PhFRwOTXd9grrSgpaL?=
 =?us-ascii?Q?azkS2tT55Tgag6AKPgcVfQ7MEwgKtBdN3QRGfvNHlFKAlwdIesJK5AZEoE+K?=
 =?us-ascii?Q?GhB0cySTfJOpmIX9962+hQ+2pS5QUhjRPKFpDumMkOGPs8QRj0t7aPCJ+jIj?=
 =?us-ascii?Q?q0MOqNb4ECacOlockisM1XUY/5q2bmJXAcxbcaAZ5PZ4duNyWgV0gyeC4qRp?=
 =?us-ascii?Q?dJ2Iaa4PQzC+Ykyyn32SXJFJd+JonNhm5cjL//wozHxYvvfbgi1+Os4TUyM/?=
 =?us-ascii?Q?ilb3mWeDicfaBIJ2RGpSlNvd0JXSMjh1l0gwUF6B6lMltM36uI6j5AbMVB3I?=
 =?us-ascii?Q?sAUwY92EFEpUNo6J4hlL1WnpYUoeypgVGH95Ems5fhAA7jcFQ9u4intLO7qe?=
 =?us-ascii?Q?wl3h0D1Amj6wqvSOe9XDIwj5dnrON60uJJv9hCMDtrkJnIitlWEkvBomDYKG?=
 =?us-ascii?Q?LctoszsVSUtNJRW4d3H8TTg0s7ga8/eyq6EuI0q3T2jhzWJAty35ApvEUoWZ?=
 =?us-ascii?Q?X55b2OWm+kaFER0MAlMtVGPDiprjgZ/cs/B2/awUPXA23Xk6+6LK9zsPFSms?=
 =?us-ascii?Q?tknIOZhB6NTJ/WYUs4egrGfoGjvMwQBnmw4TTiZaGiCcHYd8AS/3Qz3ofkcM?=
 =?us-ascii?Q?3GLVIbdr/DU3ilnmi6xLfXUQdPPR144cQS9rQrX9FGL78bje3/rGQe18+AvI?=
 =?us-ascii?Q?HOCRZe7iiZgBo1m7Mo3RNcmbhMeBWmtCp21jYz6ViUeXwZRO5a2ag1lEjJ74?=
 =?us-ascii?Q?7FbjXEjIJx+PAwdYdBp0oaIlHgqs+SuNKm0fkbVJ3RzdR5cXlNgq1qJl3KjV?=
 =?us-ascii?Q?ZR6XVVk3AgjlUx4lZOJoIhxnElCPP5qRKL4pBdssIyUOZVhQoL2czH1SnI10?=
 =?us-ascii?Q?Yq59y+DGv7f+P/JAgnwHBkLPTbxs27jKrrNgJOftExffk2PMNsoJjxcZkxEW?=
 =?us-ascii?Q?ePXSWBdbRn1UbfazD7hhhDtiVMNilhlnRJX1C4koPoUEBqIyBPpuoBfYK78U?=
 =?us-ascii?Q?bm7f7idgCBElgvxarNs=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB5PR02MB10213.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fd44f54c-c533-4afa-e593-08db7ca97cfe
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jul 2023 16:12:39.1424
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SNIQUMFZg9Anod6TaQJOaOJXtzQIoKW43cqxbg6fgKTrBA3gSMHLGcP7n2z3LzM2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR02MB7873
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 04 Jul 2023 16:12:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103660

> -----Original Message-----
> From: openembedded-devel@lists.openembedded.org <openembedded-
> devel@lists.openembedded.org> On Behalf Of Armin Kuster
> Sent: den 4 juli 2023 16:28
> To: openembedded-devel@lists.openembedded.org
> Cc: Luke Schaefer <lukeschafer17@gmail.com>
> Subject: [oe] [meta-oe][kirkstone][PATCH] webserver: nginx: Add stream Si=
gned-off-by: Luke Schaefer <lukeschafer17@gmail.com>

Why is the Signed-off-by in the subject?

>=20
> From: Luke Schaefer <lukeschafer17@gmail.com>
>=20
> Add stream support to nginx PACKAGECONFIG
>=20
> Signed-off-by: Armin Kuster <akuster808@gmail.com>
> ---
>  meta-webserver/recipes-httpd/nginx/nginx.inc | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/meta-webserver/recipes-httpd/nginx/nginx.inc b/meta-webserve=
r/recipes-httpd/nginx/nginx.inc
> index dfced33300..231c1d1ec9 100644
> --- a/meta-webserver/recipes-httpd/nginx/nginx.inc
> +++ b/meta-webserver/recipes-httpd/nginx/nginx.inc
> @@ -43,6 +43,7 @@ PACKAGECONFIG[gunzip] =3D "--with-http_gunzip_module,,"
>  PACKAGECONFIG[http2] =3D "--with-http_v2_module,,"
>  PACKAGECONFIG[ssl] =3D "--with-http_ssl_module,,openssl"
>  PACKAGECONFIG[http-auth-request] =3D "--with-http_auth_request_module,,"
> +PACKAGECONFIG[stream] =3D "--with-stream,,"
>=20
>  do_configure () {
>      if [ "${SITEINFO_BITS}" =3D "64" ]; then
> --
> 2.34.1


