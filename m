Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCF38EF99C5
	for <webhook@archiver.kernel.org>; Fri, 13 Feb 2026 18:14:34 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.70])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.78312.1771006471206502149
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 13 Feb 2026 10:14:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=selector1 header.b=bssojI+/;
 spf=pass (domain: axis.com, ip: 52.101.84.70, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uCBCrnEzSrwypOTwBmRLUBqCC6XSL1uofCAtoc9Til4SZH7s/YyeYl+tu/qXLFjsolytbapvKyfLP48obxOvq4mcgYOjMwm1ule9lFPnkLsLP0cjof2VSxEEWeIMwAtgrqiI3qtTZ9hwMBI3dY8vquWUQeumpJVBumFP/LS4a75l32xjvZZatDPXKne2pIePixlw0NJ+fOBzilNElAGtrhBteEzrXtikg+YVuBlnKVVEUEzUpvU0lWMo/0HYh6De+cA8U/HeVE/CkzTVZBJB0vmFaX9DUJ2Rku6Y3W5BYmGhiyDVmxVdcgbryb0UTPJIqICuvXTtDrhSNIm0L78e0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L0Ejs09ZYJy8SSgZMjotO8lcbw8jZqu10en0Q0nY7BM=;
 b=AaaJREMTk2T22QmOa/u3AIpD1/517vb3mqyFpgsQx1ufxrXfTZjWf2xz0pD9XesAq+ckgBpluSOidC9tFlsI+dE/S4ADBuUSVZi8W3AOFWrxnlWEoAP04doKszfsekY9EzdclyqDQrPmXlnv2IoEMRssZ7ulZUtpMZi8SWR9sRsGNqhkzJsDITTDoEcY3Xf/JKQFJfrN3Zsd24kFjq+Ydblo9eldOjmOtND5SNfeUCS/yOnlwpk0QvWVTtZ9QhVzGh1AD0JHGsH9ScwQTHy1jUe8pAKH3/KnGfuYl38uI2SH6sPYLySzfObBAuo0AdJ2ScVodrEJhd1nQ7bILrj1xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L0Ejs09ZYJy8SSgZMjotO8lcbw8jZqu10en0Q0nY7BM=;
 b=bssojI+/L6xkNLuJG9UyVOP+8MGREp01YR/bzndp+qbBL26lKDaALCkYVPy6O0G09KBtbPCGRDMQqQj9Kkg9VP+xQA2U/yuL/D+/5A0n4+IkwcwRg2Zv2gp3GKo9lNArWSXP3gIk78WctgHsBey90XLr8fBtsC3KjAXwF32QL3E=
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com (2603:10a6:10:4a8::17)
 by VI0PR02MB11092.eurprd02.prod.outlook.com (2603:10a6:800:268::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Fri, 13 Feb
 2026 18:14:27 +0000
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::e5b6:b9a8:2a5d:e0cd]) by DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::e5b6:b9a8:2a5d:e0cd%5]) with mapi id 15.20.9611.008; Fri, 13 Feb 2026
 18:14:27 +0000
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: "dmitry.baryshkov@oss.qualcomm.com" <dmitry.baryshkov@oss.qualcomm.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: RE: [oe] [meta-oe][PATCH 1/2] vk-gl-cts: ensure that the SRCREV is
 correct
Thread-Topic: [oe] [meta-oe][PATCH 1/2] vk-gl-cts: ensure that the SRCREV is
 correct
Thread-Index: AQHcnM1anLyUeyKhC0eJ5TNUvSgDBLWA7xkg
Date: Fri, 13 Feb 2026 18:14:27 +0000
Message-ID: 
 <DB5PR02MB102130EB65B242ECC4DB71118EF61A@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: <20260213094416.88437-1-dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <20260213094416.88437-1-dmitry.baryshkov@oss.qualcomm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB5PR02MB10213:EE_|VI0PR02MB11092:EE_
x-ms-office365-filtering-correlation-id: 5f13cda5-bded-4e88-c7ca-08de6b2bb99f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700021;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?2hfvmO/zEwXWarFcb3eOZiS2rsCd68PScAKWeZXiw5Q/1BVAynOWFsNMmqT+?=
 =?us-ascii?Q?Rt17BsB/PrhUZyWyBuUy2H3sDnJ1GjKlO64mRunpXO0+3Kk9PN5hyBic5ehL?=
 =?us-ascii?Q?YC9AnvaGI2Lt/FilFhwBVjIDXqx1lUsMV0IS3x0O4f1BzKwmoIZ0/E/BcWxx?=
 =?us-ascii?Q?LxqUlQlejSyeiPzd+7tapBW9IyC6iyYh3zCV9hDpT7rf+f1Cv0v6gs/XqrMW?=
 =?us-ascii?Q?qYIY3eiGTQA2cmCyuo4Vi4JAbOR4YdI6agGpL34EhhMvU8nkT+tpKltGUXBY?=
 =?us-ascii?Q?rRYPEXDvIBik8aEyZ5XJdalKwecsFb3/KbuDGAxnV1BRu080ttfrIN6/hc52?=
 =?us-ascii?Q?PTGzfM/8wW6bh/qZ6rU84G72bgQumbjOd5QPe1EPaP+KkBNMl157HwsKQuDk?=
 =?us-ascii?Q?gRNpsLBn1MBrgl2NuZGKn4mb/1AkItkWnyVA4wfQRFekZ4omIGfEUiLOcFhh?=
 =?us-ascii?Q?OfDuYnCzjBVEhf+I5SQQoguJ+X8Dqz6IqThL8admLIH2GT9Zy668n5er8pvf?=
 =?us-ascii?Q?QeYafl8rlXox85XiY4NiyNkGmO8fT/ElycInMc+eVvBUMJcUq80z42gh09Er?=
 =?us-ascii?Q?tNnHV5mTdk46RJa3TkB9fHaJ/7LMmQohe/yatH6iLehnmpS+6Hvu9z9DZ0qh?=
 =?us-ascii?Q?IsEDu0sn1svRpnhY9iNn8luUrLTsEXy1CA1XjuBtpOOhZY5hxZp5pZvbBVcY?=
 =?us-ascii?Q?T0xaM/7clF9kh1HlRKnCf/eHfbRCkjvmUvPtphMi9tLymAPF5BvqF0AjWUpc?=
 =?us-ascii?Q?9W6+VqsQ0YpQNFdNQ2MxvGX3/1FcwikquVpuX2c5iI+u7XgIgz37DbeVODOJ?=
 =?us-ascii?Q?YXRWpntiM5Cns9exk3Wkmn3ZFYIBPmyHjd/LTchRD227BOUjLN0JMuBqFMC0?=
 =?us-ascii?Q?sLUNMCZ4LIu+vZOYI8ZZbteKmx5i5o0tsPJZpnYQ7eNVtYwiESEadMloUVjK?=
 =?us-ascii?Q?FY6VDvw8dKlfNZGmT8mV41NKc+yWoL/4nS3BUZYXHW/tHXZNr5yw1UbIni1b?=
 =?us-ascii?Q?NtTXJWys+grsZUyYeoU1chuYiuZRk6g+b5Tqwp4egxl8c+T3xr37qOXVQkLE?=
 =?us-ascii?Q?69MeXhzlssgatX+upgD5+kUfDPPJXuzn+hxBeRE+fVND2V7hrH/ZmmB5GD3A?=
 =?us-ascii?Q?2fcJwlNxpv42tsgBA/lR3JtuvZCT+7+doTs/VZuYCaHuNJ4zkjn6+jo+00uX?=
 =?us-ascii?Q?dF8gmy7rawbFqTdCyvW3rUyO6g1BySlF59WXtYZfqPxxvA3c0R1lFqaIUUn8?=
 =?us-ascii?Q?2pP9saaVbYlE1HDkI2GrVWlIFQAsJtkMmt0ZYQs1nRizRBgX8G6i/Zgrs+Qq?=
 =?us-ascii?Q?cm7HM33g4BeekYalbY4BjcHRAQpEsKQ40jqAL1f2fmnYdQFbQiSb63mDdVdH?=
 =?us-ascii?Q?QAoLUhdyz8ktzIbRMGnZip09U5iKUWKMdlNQ2ITMiV7pAFJmo+JjyiVNETkC?=
 =?us-ascii?Q?M0ttPvpy3Qwxt7Sy21jLNaXVaAWIUWT2AQxPMWEDUwQij0DtEDCprxg5OK+8?=
 =?us-ascii?Q?a+7AEiZjedzwBMbo1LWLt4YGJ7CNJ2thURKVDwofg+1T+zVyuNyeEfVONEL3?=
 =?us-ascii?Q?cL5gmVjqSHu+rEXas+idxIsge8D0VZUgWcwS6Qzh00DK7qvddG0m3LOzQhhC?=
 =?us-ascii?Q?aLWReAUg06Up1Uz4QN+nsr0=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB5PR02MB10213.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?0q/+qHgSZIoA77zNlcvHnwRYRJcS+MWMY3QI6oJfJhKNlswP9yiH7FaleES4?=
 =?us-ascii?Q?CRwMMUpvTmESCRytwx2I5Axg4zklUw7c+gEVDRMA03B/1bKGKkExrGEgw6p7?=
 =?us-ascii?Q?26DNFk2HQEP2UgRKX2n9wMzHXUBpNgQl2f2h4cN6k7d6qDcwuLGo0MEl7430?=
 =?us-ascii?Q?Kl+hfB5o5aid9xc3oL0mEY8yRZ1gMTSVjyDzjTYPc7cx7g4wWO/eif+rxiUY?=
 =?us-ascii?Q?da+mMPOp7AO2rh1cP2tF9wum3YIuFe1khgXbMVIlKyDyyXB7aqupSro7qvmh?=
 =?us-ascii?Q?kGRZG7p1m5QMNseXLzUoXZXQ98m4EZKJdHwiZi/zPJ6RMQbI5LKU1SsBVNFi?=
 =?us-ascii?Q?8evo/6w3YJlGDZ5yP0mvIJTDRgDsSUAuzhgTnOIIFaeF7QRYtQLYX9wcTjYj?=
 =?us-ascii?Q?hQJw4V2/Y/JrpmRu43mXQmqKMgxMQLhytcVCG6FZQLR91IMiMQJjLooMvzQA?=
 =?us-ascii?Q?OYOa9F3ums2Tmlb2c4yVq7h8CdOJSxRUeozDFj0Oia3Wf9dYBM5U+3tX8mmF?=
 =?us-ascii?Q?Chrd4MUPK4W0+Dyi4zHSu0yWh1kuE/uMQRc2FDJj51in6NDMOgOMTh48Q5DG?=
 =?us-ascii?Q?tm8Q7SphcKu6rXyUgLqg3sguL6BJk7op+RF/WG/X728UieyrMAletWbubEED?=
 =?us-ascii?Q?uwpBp5EtBAb0ARi5V8Hq1QE8RlEtEOUnyqp60Gt7WOSixLcRH3jqzo12/+xJ?=
 =?us-ascii?Q?YFMYCYzthfrhd7m4D7eZ8gm+ez93Qx3drw+ykYvwa9opOxRM2tOgycq86qgt?=
 =?us-ascii?Q?KTsX5st3sfRPwaMOVI+uEAuqhodnJdycVRfUs1LQj1lKWGh5Ih+oB6CllzCT?=
 =?us-ascii?Q?pygXC5M82ekUdcDalBQ35JCnsPldej3X/B0qkjZkGjTdChrP1YPvwKLle7eo?=
 =?us-ascii?Q?0NxrKG7TZDAURg4cA8TOjEa3j1smsl6gxAJh2sl6tDgjfRDDWw64uAZqvVpc?=
 =?us-ascii?Q?4rF+H8DNqVXCxKDaT0UgHfK/Iphb1PHT5Rqt9285ZxlOX9uaFcgFp15bgdLd?=
 =?us-ascii?Q?FUzcW6BS5tY3SYSWajyW3D7OD/VG6P5FgxyYc/5loVEV8GJk+PQZvYzYyqbz?=
 =?us-ascii?Q?+59bwKJKWAHYueWQxb5vPnRnjT3hGYMQFdf8lcDYOcoxTd5RlIGc3Q9hZW2H?=
 =?us-ascii?Q?F1PPS5mR6MXa/CxblYx95Z/pIfToEXM6Xmcu2tZ+JkB/nEaQQnPa0+qT9QtO?=
 =?us-ascii?Q?bivaCQ0+9U1bU8maXPhbAwSNAX6mZeMMXORsE3KRF/pLwaTYt1/ufkwfTx7b?=
 =?us-ascii?Q?nTEOaM02+JPncbFokDalHyrlrMJISaNMtS58ggipfIXqXC2jaerueSZKuyn3?=
 =?us-ascii?Q?ZLYxS7DcAWZHVPPwqHS8DdEHSNj12DrYg/8NAh6fM3U6TKfyxTmBB56YXV7c?=
 =?us-ascii?Q?3LQcd4xWzYnairYTUNdXZBuDlkjfIom8bWTBQhzVAZ0dPkhCQbKpu+xeRO0q?=
 =?us-ascii?Q?T/OTJEXCFR9OJtBBOWLDhlHBTzTcP6WkrSrBdqfb5ygvE59PNwLLKVg/U/iO?=
 =?us-ascii?Q?t6291QGOYh43KmvPtolDhWL9hsTE2zc8fCJkcbpBRIHhC00Jbb1Co3kYlcpJ?=
 =?us-ascii?Q?S6aLOTonrWXea4FWyNcMIr9gulJlrXMt267/psNKgzjY7Qju/Bc8U8mgS3Ef?=
 =?us-ascii?Q?MFl2MlvilVRCyzIKSrmmzoXKUrIx91KuohbQkSFJAZfq24ua244hg8y9BjFd?=
 =?us-ascii?Q?AbqgUJxeW/LPJUiUy7v5NK6fDz4=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB5PR02MB10213.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f13cda5-bded-4e88-c7ca-08de6b2bb99f
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Feb 2026 18:14:27.4901
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UfYsKCORg0SHtuMjAXSDQRhhnQ3wmVvNzetuoNUgy0vif7pmAE2mHq8GuuujjiN9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR02MB11092
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 13 Feb 2026 18:14:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124395

> -----Original Message-----
> From: openembedded-devel@lists.openembedded.org <openembedded-devel@lists=
.openembedded.org> On Behalf Of Dmitry Baryshkov via lists.openembedded.org
> Sent: den 13 februari 2026 10:44
> To: openembedded-devel@lists.openembedded.org
> Subject: [oe] [meta-oe][PATCH 1/2] vk-gl-cts: ensure that the SRCREV is c=
orrect
>=20
> Use tag=3D${BPN}-${PV} in SRC_URI in order to ensure that the SRCREV is

You should use ${BP} instead of ${BPN}-${PV}, here and below.

> correctly updated together with the package version.
>=20
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  meta-oe/recipes-graphics/vk-gl-cts/khronos-cts.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta-oe/recipes-graphics/vk-gl-cts/khronos-cts.inc b/meta-oe=
/recipes-graphics/vk-gl-cts/khronos-cts.inc
> index 67a0dc564c22..d6484ecba0d8 100644
> --- a/meta-oe/recipes-graphics/vk-gl-cts/khronos-cts.inc
> +++ b/meta-oe/recipes-graphics/vk-gl-cts/khronos-cts.inc
> @@ -1,7 +1,7 @@
>  LICENSE =3D "Apache-2.0"
>  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D3b83ef96387f14655fc854ddc3c6b=
d57"
>=20
> -SRC_URI =3D "git://github.com/KhronosGroup/VK-GL-CTS.git;protocol=3Dhttp=
s;name=3Dvk-gl-cts;nobranch=3D1 \
> +SRC_URI =3D "git://github.com/KhronosGroup/VK-GL-CTS.git;protocol=3Dhttp=
s;name=3Dvk-gl-cts;nobranch=3D1;tag=3D${BPN}-${PV} \
>             file://0001-use-library-sonames-for-linking.patch \
>             file://generate-srcuri.py \
>             "
> --
> 2.47.3

//Peter


