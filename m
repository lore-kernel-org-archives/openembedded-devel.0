Return-Path: <Jiaying.Song.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B57C9E77188
	for <webhook@archiver.kernel.org>; Mon, 13 Jan 2025 03:38:53 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.9715.1736739525937977413
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 12 Jan 2025 19:38:45 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=31087dc864=jiaying.song.cn@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50D2ugCR017158
	for <openembedded-devel@lists.openembedded.org>; Sun, 12 Jan 2025 19:38:45 -0800
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2173.outbound.protection.outlook.com [104.47.58.173])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 443mt71783-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Sun, 12 Jan 2025 19:38:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OORN+d/G2ZBh2tPB24KXPFhWQoSGgwExfKd6UEC+6soldJrBRiM1D5ws0p2+CmEXLwgy9tniaK7k/d2aBEmrOkmzj3PR1GvELpDP90050g7luI6As8MJDto77ajc/t74hbMKP5wBKLh43pOsbp6nEBTxTwhPg8wmhrGaUqx06nZxPFH2whKOtHTSJOsfoPxVpfsh9GoOFnIW++BL6SpLZrO/KqbhOc8/9bhmj2vL8xFGype/QGd6hXprFO4W4l0S0mt5U+xbeTYH+6sD2DQcpdy37ZkeN17Cr5bPsmZBrerDFskxbkEYm4OU0Rs2D/5HBeu2hKuOxa9uxNSCEd9Rrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mOZmoahtp+ShXzYEyOQUxhOAXB42bliQf64bzI70HFc=;
 b=yfpec+KWEZyXPGDEb0qzy5X388fdxgTumseZqdOlnyPv4lnKnqIkwYO9HKth1jj7cOi0tr+Kv/7/OEYMRXWIXpDxYGMbLuDS0EYpHBleYndQjtTi6PIyONQGYK8iW1j9JmwWRaBHIn8L2FQ5i408IK6aVdvP9D8HJFoSOy2io+RZ/H0nVXQ5gv0zuM4NEfVJuNLoXdbHXjsHLsQlj3EMXQI0LBvE2jgHD3XuCuTAd9RB78sT3Wd/IZDzFC0aPXnhZg2w2cMhUppUGfixsnQQu9P42EP+KxNui1PjtaJ8TZYhPkJbf0xlBEFwHWb/4d+6OaUWwyjlxiBXb7NhKQO8Mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH8PR11MB6928.namprd11.prod.outlook.com (2603:10b6:510:224::12)
 by DS7PR11MB7689.namprd11.prod.outlook.com (2603:10b6:8:e2::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.17; Mon, 13 Jan
 2025 03:38:43 +0000
Received: from PH8PR11MB6928.namprd11.prod.outlook.com
 ([fe80::4f5d:1d96:e74c:2840]) by PH8PR11MB6928.namprd11.prod.outlook.com
 ([fe80::4f5d:1d96:e74c:2840%2]) with mapi id 15.20.8335.015; Mon, 13 Jan 2025
 03:38:43 +0000
From: "Song, Jiaying (CN)" <Jiaying.Song.CN@windriver.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: RE: [oe] [meta-python][scarthgap][PATCH] python3-pylint: fix do_fetch
 error
Thread-Topic: [oe] [meta-python][scarthgap][PATCH] python3-pylint: fix
 do_fetch error
Thread-Index: AQHbXYmcSR9XwZJuGkuAmjbpG4WmibMUHhCw
Date: Mon, 13 Jan 2025 03:38:43 +0000
Message-ID: 
 <PH8PR11MB692830F9689CDC91A16DDE3FB81F2@PH8PR11MB6928.namprd11.prod.outlook.com>
References: <18170EB1DC0CE9D7.21892@lists.openembedded.org>
In-Reply-To: <18170EB1DC0CE9D7.21892@lists.openembedded.org>
Accept-Language: en-AS, zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH8PR11MB6928:EE_|DS7PR11MB7689:EE_
x-ms-office365-filtering-correlation-id: bccc9c01-1df8-47d8-ecc4-08dd3383c720
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|1800799024|376014|366016|7053199007|38070700018;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?MUaUaQIDLLt0V348V8a+J+3wPDeozhP4xHNSAXTKGUFem3D/R8JJsQNWnRTT?=
 =?us-ascii?Q?IP/J9H1SRgQa6JgohNArlngyh1M9PgAlBWSo92RIZpJjk/CnsIHrn5T4V6hI?=
 =?us-ascii?Q?sxGCKAMqe+OywNSxPI6/xOi1SXZ+X/iWWSQp6Xzj1a6mIlg7v2oqc4X38kEe?=
 =?us-ascii?Q?NOTTHLeLg0nih2IBUHe/6S0f8R5revQp2QTssSE0d1zk7kmZkwdoKXs6zPp9?=
 =?us-ascii?Q?3A17K8VDB9bRvSZbkq68ZpxrszkmCl2LMgB6Ji66mjYKzQtI8Fuqb6QVuibK?=
 =?us-ascii?Q?dt9bdkVfL67jTHfPOVPEPP44WVd7RFyYO5FBa8WXm+ENkOOHpzWZ81IXJIL+?=
 =?us-ascii?Q?djmIxGAsgRs1adHD01+d5hOAuxemLqDyiUWjzst+EMQ3L6W/sZl78rCGMCoz?=
 =?us-ascii?Q?i31hS7eOEiF/WesjjJzmOZSN+5HnfuqqH++A4iOu0BXJ9KgwXYhdHvIAbq5z?=
 =?us-ascii?Q?1uU8H81RlRwMw9oFiO4ITAZ8U8w1y9B2qHxMSf6uY9aUCUbzcTw0o2lAbERN?=
 =?us-ascii?Q?74eR8RJVddMYsBvSwBOwY857D04QwIlNLNkTUo2olWtjwEvuEVJfaO+KwrhI?=
 =?us-ascii?Q?TvfeD7mACgKlHzQzaAnAXV3T27+KjG2vExlwt4UBap93CcgJHekr1LXA6ZkJ?=
 =?us-ascii?Q?DqaLOhBc0HH0A4PRTGXlpDFR0y3v/rZj8+JNoekw3XB6CY0YAtMovc2qwcn5?=
 =?us-ascii?Q?NIiEpAkK/nr4eZcv7jdile7sMPZNWvGqa3b8riKeujVc8Zck1fkwjAk0i+Bu?=
 =?us-ascii?Q?GWqBBXBQ1Su39lliKEE6vtsI/5/A68g9rJJzw4qNkFg//zvhVqmMRt2g0otf?=
 =?us-ascii?Q?YNTozkLvuLX0WDNmhoR5KiQi6HdShaG41z7f1xIdeL1HX9Fwv2TXb/wZvTk6?=
 =?us-ascii?Q?/eqcxbdLsdLAcFCTA8zuvhGYeW92BY5MxfEk+Fi1MXFNcwZZyfBvZptvibeZ?=
 =?us-ascii?Q?dDUZ4oRCORDIrL54nDBDoNko6fqnO5tB4IJFqkrKacR1xgQnAdwzqXCpt4xS?=
 =?us-ascii?Q?mwfx5P+7qvHP89+oZJppIwfpzZ363H7kxApnXF9ZWhYGsmeYXKUechpmCCOn?=
 =?us-ascii?Q?qQ1Tsqjgx1f2d3mBTBejnMEPzoV1dMsg1lT0jvRYQoejSsGq3JsD3hlVd+F9?=
 =?us-ascii?Q?JqorgRIRGeWDh3OZxoMOn/i6P8SZcrY/8ZUCpiI1jcc/3MtshnojoEN5nsB3?=
 =?us-ascii?Q?IDjiiS5x+gZrQ5ahv1e7wQphAgGuH0vJWTGwfpy7bZxlqrWzLlMc2Y6Dcv/Z?=
 =?us-ascii?Q?b1cgfWfBHJ81bqtpo+S3fOCoGn58sb9wYs3Sl8pJ6yufjJMD1Eb6Vx9exw6R?=
 =?us-ascii?Q?bYxzAoAejSyx6JT1ciNo7RXxC8Cq05PoMt3GEjjnLY2guYJ12LZpQik/aK4k?=
 =?us-ascii?Q?SkRVX9qYo05/KzLxmT5RSSmkC//U?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR11MB6928.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7053199007)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?KbRe7B1nYPxnnT9E+5QnuXqSfwmjiFBMC9j/wJgVAHhvva85vzMDuZndStvm?=
 =?us-ascii?Q?lsgN/gGm0Z4YkzEMFuFpUvpkezgS8TjtfOxW9SmanuDf8f2VB4zxUAE3AMIx?=
 =?us-ascii?Q?aPwZS3FoxWkw4EBz9jMVZvYFNzmZXCVIaAknnY5+Xva8fgpheBQE3ZqxSEwT?=
 =?us-ascii?Q?cfnAVTy9IMIcZ7Dtu3UyUCM8L8bNWcW9gJJz3xGp1/wU93+oZer6nAjhnIrJ?=
 =?us-ascii?Q?0Vr+aUU9spCcYlQid/dgA3kwwaGgEmG3TChU9XB/DcFmvSUsnBGasOQK1ZrS?=
 =?us-ascii?Q?trqg1OdoOQ+bmwJ9nvMUc/pphLr5HHwZRg9BFIZDfH3vH4sLpWJBM/9Us3ku?=
 =?us-ascii?Q?LZ0wDU0Rp+9tjadjYKVR5Tzd05sX6TtC9uK592/eJFtdQnhu/iKkv3gjUD7D?=
 =?us-ascii?Q?gFUWbGBXCmXSMFZ/eJdvnQQ6d2wdBvhjrXbUl+2L/h7LUO2SJtXnbj3jQcSE?=
 =?us-ascii?Q?sA/ETFPjDi4UQa8+PFrAGV0DtckxLZwvxI9gNPmDXLftKXX5TFp3Atnsaf6F?=
 =?us-ascii?Q?nadLH2LaIZjVVeo5sIjzv7CHVsz7r2dctFeemzZsCMxfYlCbVMztPyjtf289?=
 =?us-ascii?Q?K6Cm1otINEtlwMYv9t/lzCarRaB0bjkeFfCY57yd0OPZTrrNfZgQS6odXG5B?=
 =?us-ascii?Q?TgStHKj4OKm3j6t2PyV3y7dWe1Y42SYsByGcJM1tJSd+QbdupH34WPJyZoig?=
 =?us-ascii?Q?iYVoSlkRI5Oslohr3uNBR7J71yJ7st1J+B3LCWVqFGTFIkFGfJ2h8bKoEZ+S?=
 =?us-ascii?Q?sjH7R4WMIisrcbOuj5VHLgsTFKgPMCEM0bOHYF91649cm04mb1lpmUoco/2k?=
 =?us-ascii?Q?qT+zl+0hdr95vx0FFEA/y8fFc79EheoDKQydm5ChGbMAJudRGKsNfSDieuPx?=
 =?us-ascii?Q?Jpuwui1c2hJvGH7JbXcsd2+0XB0P9lgXjG2f9teENucGt6tv607h79t+ZAGH?=
 =?us-ascii?Q?JvsA1EtU2L5/rqm1PhOEzT5Dlsj7PxjFEIMW2vTvBLzLzeQJfvnd6COnQ5Fa?=
 =?us-ascii?Q?hNfoXNKtwsufrYCuSUQn1pw9/B/W7w8D+evQ7arXgIqgOrW9c97uZDttSOJG?=
 =?us-ascii?Q?rZUlBhx3vJcxhP1ZbzfymQt4grg0lU6SFSZTMh5ijuK6gbAmCeo4QqLj/DvV?=
 =?us-ascii?Q?SjhMt+QifLTR5pea5FgJBLkW7H+bsGucY5jG3qRUeAYY5GOdZQN0MIZ9P++e?=
 =?us-ascii?Q?7E5/NoXm1QYmMaqorxG0GB+Yfi341IbUyFPo5g46PQCmO7dFLcbi9sUlRPZr?=
 =?us-ascii?Q?I8/Q0F4bDtBxy6u/wBaAyoA0ns9+HGmHxRwaLq2e0M4/7W3gAKCO0W6JNcWT?=
 =?us-ascii?Q?+to9GRWFAEH7/KQ0V3sOoghRBHZ4h+SYHFo4VZ2//aOg45s8tS5THYbEhaqF?=
 =?us-ascii?Q?yZDvR1jAYx0JQQbZxw9vl67qClWHlMlM9oPFoGGkx1+GtQDEjiGyjQ9P4UVF?=
 =?us-ascii?Q?fYdMKHdhnCOAXtH+k+chAaveaO27Nw3Q/8tT6WGTanyOrBCfzqMneoHxYEBY?=
 =?us-ascii?Q?s1t+zsLbUaORyORzOT+tuO59os4Y8Ew2bZ+GEvDAEjQvKEgdtwPKDZ7haPxO?=
 =?us-ascii?Q?DLf7EyYYPMbd+KZ1x/Q2kVD5fC6varIJQB7cONdSf1RQSAkE58al9YrIPdSR?=
 =?us-ascii?Q?og=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6928.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bccc9c01-1df8-47d8-ecc4-08dd3383c720
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jan 2025 03:38:43.0943
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kqBoOAC51c5hGGX+tybRG7gPYK9GcKnfccAnyIfCCpNMrQC3p8E/K4A4H5BoFGmQWL/avg5g4m8bdYXmY3DBcNTTgK9PLf2iimCx2hnBTSc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7689
X-Proofpoint-ORIG-GUID: raUjndj3DqIEX7XuCxrmxoriify4brb6
X-Authority-Analysis: v=2.4 cv=SeoNduRu c=1 sm=1 tr=0 ts=67848ac5 cx=c_pps a=19K1aDEwnJ0RahI1emVHDw==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=VdSt8ZQiCzkA:10 a=bRTqI5nwn0kA:10
 a=XHfBerL2AAAA:8 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=bLZqKDXHAAAA:8 a=NEAV23lmAAAA:8 a=hfkZIEdAkf5ywNToyOsA:9 a=CjuIK1q_8ugA:10 a=qb9JOAHM4hE5jB-puYrx:22 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22 a=SM0NOtVXJcAQk9PFKD3C:22
X-Proofpoint-GUID: raUjndj3DqIEX7XuCxrmxoriify4brb6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-13_01,2025-01-10_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 clxscore=1015
 mlxlogscore=999 mlxscore=0 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 malwarescore=0 phishscore=0 suspectscore=0
 adultscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2411120000 definitions=main-2501130029
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 13 Jan 2025 03:38:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114818

Kindly ping for scarthgap branch.
-----Original Message-----
From: openembedded-devel@lists.openembedded.org <openembedded-devel@lists.o=
penembedded.org> On Behalf Of Song, Jiaying (CN) via lists.openembedded.org
Sent: Friday, January 3, 2025 10:46 AM
To: openembedded-devel@lists.openembedded.org
Cc: Li, Changqing <Changqing.Li@windriver.com>
Subject: [oe] [meta-python][scarthgap][PATCH] python3-pylint: fix do_fetch =
error

From: Jiaying Song <jsong-cn@ala-lpggp7.wrs.com>

Change the SRC_URI to the correct value due to the following error:
WARNING: python3-pylint-3.1.0-r0 do_fetch: Failed to fetch URL git://github=
.com/pylint-dev/pylint;branch=3Dmaintenance/3.1.x;protocol=3Dhttps, attempt=
ing MIRRORS if available

Signed-off-by: Jiaying Song <jsong-cn@ala-lpggp7.wrs.com>
---
 meta-python/recipes-devtools/python/python3-pylint_3.1.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-pylint_3.1.0.bb b/=
meta-python/recipes-devtools/python/python3-pylint_3.1.0.bb
index 12f4f908a..4c49acaf1 100644
--- a/meta-python/recipes-devtools/python/python3-pylint_3.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pylint_3.1.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE=3D "http://www.pylint.org/"
 LICENSE =3D "GPL-2.0-only"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dc107cf754550e65755c42985a5d4e9c=
9"
=20
-SRC_URI +=3D "git://github.com/pylint-dev/pylint;branch=3Dmaintenance/3.1.=
x;protocol=3Dhttps \
+SRC_URI +=3D "git://github.com/pylint-dev/pylint;branch=3Dmain;protocol=3D=
https \
            file://0001-Adjust-test-expectations-for-ptest.patch \
            file://run-ptest \
            "
--=20
2.25.1


