Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.134])
 by mx.groups.io with SMTP id smtpd.web08.22872.1628516786899773262
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 Aug 2021 06:46:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@skidata.com header.s=selector1 header.b=n7PvYxfJ;
 spf=pass (domain: skidata.com, ip: 40.107.8.134, mailfrom: richard.leitner@skidata.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MlH9cU4PzYbuvLvsBj+qpok6JZO4EcYeS70IfAGJLaWgA7JjKEVtY3D5CadbX2hjNSWebcWruue7l+uaVEq7QdY+NQCucB40VafLC8aTMIaL4eesa2weIswycDGPO8ZWd0LSG491Q3KwStgSWc2FKM7npyNG/9UEbVjQeiNMr2OJemI2jvpo4RT770+HXo6ScP54Rtho05vRFkKF28q/zHcFzoNg+JXi3n2zJ5SgaJyzR2F+3/mZ7ZyaeiQJVfVd7nBgUtAclmn0OLWDp9sUPMfU8mVyNA6vxzvwqPji9GWkVmaWlL9nsxzOqrQVoBz69gBezkZsbH2Mm4fAbSwvxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EWfI1gTIt6wa4DKTyN/qe0RaZbOUxW9w/GXKHbdPQpg=;
 b=MDMpaX0lKtXstFyQ0o9BRni16A3+uHRdDXIANlDuUXpFG14k1zlFdqP2Ka6ZIPX5JNX6+VaCKk+ct74BlS935tU2ccuX1gMmfkz39P2RwjzNF+8D8WX7f4ji8Zu5ozmgs7sVlNQxxoBw5d+lCHT29t2hRDYcCRTAHYc0FP4SlT+ykbi79Zud3cNDsVh86o+cPNWwQN6cdXVoru9l5BJLY1Elw6hNa5hkYP1sDCDaIOgbcwDKVSwtEFUUvap8crg1Vlce1NXNSboHURRXYnN0Eqgxvsi+OAsnceEW3DBybtjfnFmcBV/JFy8/ywNTeLSBTlHE+0drwBVnn1HtukY7vA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=skidata.com; dmarc=pass action=none header.from=skidata.com;
 dkim=pass header.d=skidata.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=skidata.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EWfI1gTIt6wa4DKTyN/qe0RaZbOUxW9w/GXKHbdPQpg=;
 b=n7PvYxfJuQK2hu2dSUNvPBUliW6EqAiWQBLeXNko5co8lXvsE4FidA7LX3ZEdUIcCTleJ6r3s/cBmsK69WMg4M53ZlhqTyUNCHlA9+GOipy+47Buenaix0rnUHt6jIQkOiBp6ZhdbL9nmlfEYXrHx6vqDiALO6JHgwIrdwfE0v+F5GbUbxzXjztSpIMwymAYGDMbUHZgkNrbvFga0M+7Mc9m77/HB33sA3fkXeBxaQSZOHp6M6oSoMPuDfRKqPXBnNstD2GM3p8Bc/tJJZKrrQwQWiWIONXr6W/Ta1Hx/XdpmTjUZqKLovyWHCtgcLCDN5LzZT9TJEsvu1cgnoFWww==
Received: from AM8PR05MB7363.eurprd05.prod.outlook.com (2603:10a6:20b:1df::7)
 by AM0PR05MB4657.eurprd05.prod.outlook.com (2603:10a6:208:b2::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.21; Mon, 9 Aug
 2021 13:46:24 +0000
Received: from AM8PR05MB7363.eurprd05.prod.outlook.com
 ([fe80::b49d:efb6:84f:798b]) by AM8PR05MB7363.eurprd05.prod.outlook.com
 ([fe80::b49d:efb6:84f:798b%5]) with mapi id 15.20.4394.022; Mon, 9 Aug 2021
 13:46:24 +0000
From: "Richard Leitner" <richard.leitner@skidata.com>
To: "aj.bagwell@gmail.com" <aj.bagwell@gmail.com>
CC: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>, AJ Bagwell
	<anthony.bagwell@hivehome.com>
Subject: Re: [oe] [meta-java][PATCH 0/2] Update to new override syntax
Thread-Topic: [oe] [meta-java][PATCH 0/2] Update to new override syntax
Thread-Index: AQHXjSDCvLffAptijEybilpTbAgODKtrL6EA
Date: Mon, 9 Aug 2021 13:46:24 +0000
Message-ID: <YRExsJjpV70+43Ez@ltleri2>
References: <20210809130938.12027-1-anthony.bagwell@hivehome.com>
In-Reply-To: <20210809130938.12027-1-anthony.bagwell@hivehome.com>
Accept-Language: en-AT, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=skidata.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 142e9e5b-4d89-4800-6ae6-08d95b3c1447
x-ms-traffictypediagnostic: AM0PR05MB4657:
x-microsoft-antispam-prvs: 
 <AM0PR05MB4657C866E2EEB9FA13E09AC1F0F69@AM0PR05MB4657.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 RoLNizsykmTcOfPJB3vqrjnILXrFjsmHXZ7cwHEfnsAX1R6N459VkeiX24p49p11XRNcOrrpYZq1At+1uMHwKtY8zwYuL0/3zANV/SYBP7++00F4sGbKnSClIMAGQUV4QqYo2Mz9Jwrum8DDj9HLk5kCMAV0YgbRdL0Yymop8kfIKeXtvAHzG6iLVCf62SsUATdn4sHz1YdrfcD0hg7SXsfFBIjyFK27Ee8jSCU2o7879QuNnSKD9IOrv24Mz/MydPV1sqrV5QTFZD/TZFwk3kLmXQrHHF4Bi6ebuXDWFdGXx/W8WEqJ3pv1iPektwgXBnI8e/SO8lS+hNpLNOJkD5uq+dug9Ff37HflJJBHm0fSWSdJA3CbaRSifblpjGP6xc5jSAScRL80TA3/zJp/SaJaeYsyUrf+MxkXkG26h+Ae3fkvYdvb2uhrwsHtBtW/eDTfp4YKadAufo1lS9Ake/EIFHLhEcSuVOLM//ZGHpJkOwcxSH0M9EzxsFjSwIf7B8jzyKN/tZr+Ts9BPELqOptVs12rbLysOHh7+zvIccNbJmGw+hoD5M7TG/1/tDt9QsPAtyWq3KegclkF0lbNNMnijTiyMslRSFADJBEUVSJ80Y77rBkIKZ5b+dB6keUt4rCBaikrqEq90vekCV0mlv9ka+F33FwhpLi3nCazVuKmbPnpPuAagUTiuRiM0CU0TE+uCF78o4s/ecUM1u9eVGmWXbNyqNBu/xW25cBinho=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR05MB7363.eurprd05.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(396003)(346002)(366004)(39850400004)(376002)(136003)(66946007)(122000001)(76116006)(8676002)(38070700005)(6506007)(71200400001)(54906003)(186003)(6486002)(478600001)(66556008)(64756008)(66446008)(66476007)(5660300002)(91956017)(38100700002)(9686003)(2906002)(6916009)(33716001)(6512007)(86362001)(316002)(26005)(4326008)(83380400001)(8936002)(67856001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?d2X62t65NGmLi0/hanlETNy8EigAhMcG0hauswnkK2GtJRxZFEddTCEg7Uvc?=
 =?us-ascii?Q?KPLhxh56LjMb4GfPYvrulhIqbhRBp7buIYgK0tWtlRJbl+hflfVc2bEIf+kM?=
 =?us-ascii?Q?IQOyMoHnSs5U1ifaZpasSrhHntxiyOexX8N6vmddC1w01jyxntm3nMeXN5Q8?=
 =?us-ascii?Q?i31YPxUQMxjDSor9KrwAgSIHhyrTvfD94jSDUsq+1GFCiN6XO+29H7b+NtwY?=
 =?us-ascii?Q?vvHuo3cbd8PaENsgwhYpWVZom0EOSrinGl/cKIjwhagf92Vi/VM+pxBfCZgH?=
 =?us-ascii?Q?SjTEXsBCLE75+KbR+lhUFTEVhH4Z9bNLnKEVqb3ejBB0luKdc0SK0paIxpGb?=
 =?us-ascii?Q?ymtrJEN13EvJRybZYWiSF3Z/D/NS5zHM6zR4vG69AKCkYtGXRZdW3II820cl?=
 =?us-ascii?Q?idmk44uXMr1G2TOS7RYU3KbQR0VMb4HczajSZpkbVNUm3G3B/3TOxCCEEAwo?=
 =?us-ascii?Q?L7nIFyG26bd3XwY3ISBjD6du7oziSVyA/WLWHSn+f5wk2KorpcZzXfpDnDj2?=
 =?us-ascii?Q?gb3D+Qc5MsbD+watkuI8LVcPXlyPJmpKa/1Lrn+aD8rH89NLZo/DXJ7BAPWm?=
 =?us-ascii?Q?h8ESCOXcAA3MVCG/l7WXLCoX2w1+hfIK3SSPQBE4/hCOYd0r0XpPrD6I6w+b?=
 =?us-ascii?Q?GYP2IE/9EVWXPeI3IrhDmai1Hz+gq2aq/ueIFPJV4wan+I11/vqsDg97Sj5q?=
 =?us-ascii?Q?YTPeYprUKiIr4sMCCuUY1OpM62apK7rh7myYmSwgYyuGjj/wDggSiYfPDpzH?=
 =?us-ascii?Q?efl90VBdefDXALRwY17gEmV9hiQ5WS6nTEi/ApzmTL+obqofrcmrJh7Edsr9?=
 =?us-ascii?Q?kgu7pMjHOyoZbP1Y4kDqVhg2+EZDTpnoSO7CB05xSytwCn3U1e+O1vzSylFP?=
 =?us-ascii?Q?bieH7q8PH1PeFR/LgAwR0dnziRG6xf0j7KccoWeehf/d+j/f4MFWmK1fW2FM?=
 =?us-ascii?Q?3DmtlEoPAtBDdH3TudIw5Mkq3r47FyMABVeAo5LAJL65Zx8gNR1Po55qxzcU?=
 =?us-ascii?Q?GJwZKpNDn+gABs04/Jxle0iGt4GMSQeWOBr/T1ODQQLiPNNn9oqh3GKdyw8y?=
 =?us-ascii?Q?OwtRCQmf4Uq+bQ8Whv08lnXUmmF3Y4cXugoFFFl2iL0tUaPDUCpI+44UZUuB?=
 =?us-ascii?Q?VDx+CHn0DTtANvb6oSSSRS5wuPKYu32wONN1vH6V2EO+5qTPN+VE09SjG+/s?=
 =?us-ascii?Q?A2y2pjuhk+tUis0WABIepcFk6acNSALA54+nExTP6m9CIct82eh7eLC0SZu1?=
 =?us-ascii?Q?Hj7X2OfbGgDuEWQ+QRn07Oq2gwRBqrf35VAYRYtc3g+4G6+xdomp+NqyEX+s?=
 =?us-ascii?Q?I2xu5FA9W/zDx3TLSgsXJlMs?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: skidata.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM8PR05MB7363.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 142e9e5b-4d89-4800-6ae6-08d95b3c1447
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Aug 2021 13:46:24.4980
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: e5733095-4425-4f08-b6ba-487b9a46a425
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ffgWTpnXp0wEI+oEx2dg1olqimUGw5qJ8cJHd2uDbFaP+l2orSxqrXUWONQxFTdMneqbS4E4YV4LZIHNM2c2A5h42sN2J1dNWFGsJVjGwpw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR05MB4657
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <C18184E787DC0249874525583F00F508@eurprd05.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 09, 2021 at 02:09:36PM +0100, Anthony Bagwell via lists.openemb=
edded.org wrote:
> This consists of two commits, the first is the result of running the
> automatic migration script, the second is cleaning up some places
> where it was over zealous.

Thanks for the patch.

For which releases does this new override syntax work? honister only?

regards;rl

>=20
> I also had to rename the do_remove* tasks to do_delete* as the _remove
> trips up the old syntax checker
>=20
> AJ Bagwell (2):
>   all: run convert-overrides (0.9.3) script to convert to new override
>     format
>   all: manual fixes for new override syntax
>=20
>  classes/java-library.bbclass                  | 10 +--
>  classes/openjdk-build-helper.bbclass          |  4 +-
>  classes/openjdk-test-image.bbclass            |  2 +-
>  classes/openjre-test-image.bbclass            |  2 +-
>  recipes-core/ant/ant-native_1.8.1.bb          |  6 +-
>  recipes-core/antlr/antlr_2.7.7.bb             |  6 +-
>  .../ca-certificates-java_20180516.bb          | 12 +--
>  .../cacao/cacao-initial-native_0.98.bb        |  2 +-
>  recipes-core/cacao/cacao_git.bb               | 24 +++---
>  .../classpath-initial-native_0.93.bb          |  2 +-
>  .../classpath/classpath-native_0.99.bb        |  2 +-
>  recipes-core/classpath/classpath.inc          | 38 +++++-----
>  recipes-core/cup/cup_0.10k.bb                 |  8 +-
>  recipes-core/fastjar/fastjar.inc              |  6 +-
>  recipes-core/icedtea/icedtea7-native.inc      | 20 ++---
>  .../icedtea/openjdk-7-release-03b147.inc      |  4 +-
>  .../commons-beanutils_1.8.0.bb                |  2 +-
>  .../commons-configuration_1.5.bb              |  2 +-
>  .../jakarta-commons/commons-digester_1.8.bb   |  2 +-
>  .../jakarta-commons/commons-discovery_0.4.bb  |  2 +-
>  .../jakarta-commons/commons-el_1.0.bb         |  2 +-
>  .../commons-fileupload_1.2.1.bb               |  2 +-
>  .../jakarta-commons/commons-httpclient_3.1.bb |  4 +-
>  .../jakarta-commons/commons-jxpath_1.3.bb     |  2 +-
>  .../jakarta-commons/commons-net_1.4.1.bb      |  4 +-
>  .../jamvm/jamvm-initial-native_1.4.5.bb       |  2 +-
>  recipes-core/jamvm/jamvm.inc                  | 28 +++----
>  recipes-core/jamvm/jamvm_git.bb               |  2 +-
>  .../javasqlite/javasqlite_20150419.bb         | 10 +--
>  recipes-core/jcraft/jsch_0.1.40.bb            |  4 +-
>  recipes-core/jikes/jikes_1.22.bb              | 10 +--
>  recipes-core/jlex/jlex_1.2.6.bb               |  8 +-
>  recipes-core/junit/junit_3.8.2.bb             |  4 +-
>  recipes-core/libmatthew/libmatthew.inc        | 22 +++---
>  recipes-core/openjdk/openjdk-7-common.inc     | 76 +++++++++----------
>  recipes-core/openjdk/openjdk-7_99b00-2.6.5.bb |  2 +-
>  recipes-core/openjdk/openjdk-8-common.inc     | 16 ++--
>  recipes-core/openjdk/openjdk-8-cross.inc      | 14 ++--
>  recipes-core/openjdk/openjdk-8-native.inc     | 18 ++---
>  .../openjdk/openjdk-8-release-aarch32.inc     | 30 ++++----
>  .../openjdk/openjdk-8-release-aarch64.inc     | 16 ++--
>  .../openjdk/openjdk-8-release-common.inc      | 53 ++++++-------
>  recipes-core/openjdk/openjdk-8-release.inc    |  4 +-
>  recipes-core/openjdk/openjdk-8_272.bb         | 24 +++---
>  recipes-core/openjdk/openjre-8_272.bb         | 16 ++--
>  recipes-core/rhino/rhino_1.7r4.bb             | 10 +--
>  recipes-core/servlet-api/jsp2.0_5.5.26.bb     |  2 +-
>  recipes-core/xalan-j/xalan-j_2.7.1.bb         |  4 +-
>  recipes-core/xerces-j/xerces-j_2.11.0.bb      |  4 +-
>  recipes-core/xml-commons/jaxme_0.5.2.bb       |  2 +-
>  recipes-core/xml-commons/xom_1.2.10.bb        |  2 +-
>  recipes-core/xml-commons/xpp3_1.1.3.4.O.bb    |  4 +-
>  recipes-extended/dbus/dbus-java_2.7.bb        | 14 ++--
>  recipes-extended/rxtx/rxtx_2.2.0.bb           | 18 ++---
>  recipes-images/images/openjdk-7-test-image.bb |  2 +-
>  recipes-images/images/openjdk-8-test-image.bb |  2 +-
>  recipes-images/images/openjre-7-test-image.bb |  2 +-
>  recipes-images/images/openjre-8-test-image.bb |  2 +-
>  58 files changed, 299 insertions(+), 298 deletions(-)
>=20
> --=20
> 2.17.1
> =
