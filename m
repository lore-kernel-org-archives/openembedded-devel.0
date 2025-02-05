Return-Path: <Jiaying.Song.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9AFBC02192
	for <webhook@archiver.kernel.org>; Wed,  5 Feb 2025 09:43:46 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.8430.1738748624794363752
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 05 Feb 2025 01:43:45 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=4131e7fe3b=jiaying.song.cn@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5158ujE0016288
	for <openembedded-devel@lists.openembedded.org>; Wed, 5 Feb 2025 09:43:43 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 44hak8bx5v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 05 Feb 2025 09:43:43 +0000 (GMT)
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 5159hgmo019976
	for <openembedded-devel@lists.openembedded.org>; Wed, 5 Feb 2025 09:43:42 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2047.outbound.protection.outlook.com [104.47.70.47])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 44hak8bx5t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Feb 2025 09:43:42 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OkL1qlmyXUbYqvO5enfSne7tya8kLSiStxQk7AQPOOFyVfpqUFgc4v2+fsxvMZAe6WzxnbD1nJDA37RdR9GWklLjk2PjRYo8uws2LGQhIWuvrgYrpFqR5OL6q/Ydi1dRLcdn9Fqbl7I6eeL2fl9br0OYaQhRvYa1LVBniFuDKGo01JKoOE2ipu/2NhjVmSnLGuV8GMbIydiWrr1lJH+91P8eLIN1ecpiNVNb+euNLVzKEms1G5XYWloVgsnnjKzeLNZT9kx5MWT854G6on1PXn2n9mkbENRR8AX76LhKrP4elXRPEox2rAh6FUoF60ZLVwddt5POizPGtcbGg39CRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kcrwKYSJ/jxw4PjgUttTMeYjiZ6ONEDSgYmIy5v965E=;
 b=DjKjYwIuh5A3qHr1AuAvTzYgesSIUZGQzFxTXJoODPo5TdSWWkmpqkGevmYfuVn531vYXfnod3ji0xjGy25j+LMYbvpeiaJRhLRWlci/VqlUwsHZ9PTIZVZIg1j/Ebw4rVsPWk/s4cZjC1o2P/KFGW8Hqj3ZRIZgYIIrqD+Ik55pAVkTs3LseJQbWDNpT2hUPu1nFDVydRQRd8rvtvlAiF3TzBqRK+UmWBOAidXjZPxwCTHxLTHT7jAut8vfJmsMto5X9fLnKEMtbXNLZLAUPd6Nfi/7NKsSHjbDqzFvSU/IdzxuImPDbpI4oVYdiG32fpKQwI/XqQUv1x5RWw3SmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH8PR11MB6928.namprd11.prod.outlook.com (2603:10b6:510:224::12)
 by PH8PR11MB6779.namprd11.prod.outlook.com (2603:10b6:510:1ca::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.10; Wed, 5 Feb
 2025 09:43:38 +0000
Received: from PH8PR11MB6928.namprd11.prod.outlook.com
 ([fe80::4f5d:1d96:e74c:2840]) by PH8PR11MB6928.namprd11.prod.outlook.com
 ([fe80::4f5d:1d96:e74c:2840%2]) with mapi id 15.20.8398.021; Wed, 5 Feb 2025
 09:43:38 +0000
From: "Song, Jiaying (CN)" <Jiaying.Song.CN@windriver.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
CC: "steve@sakoman.com" <steve@sakoman.com>
Subject: RE: [oe] [meta-python][scarthgap][PATCH] python3-pylint: fix do_fetch
 error
Thread-Topic: [oe] [meta-python][scarthgap][PATCH] python3-pylint: fix
 do_fetch error
Thread-Index: AQHbXYmcSR9XwZJuGkuAmjbpG4WmibMUHhCwgCSLONA=
Date: Wed, 5 Feb 2025 09:43:38 +0000
Message-ID: 
 <PH8PR11MB69285BC794C6D4DBACFD2A0AB8F72@PH8PR11MB6928.namprd11.prod.outlook.com>
References: <18170EB1DC0CE9D7.21892@lists.openembedded.org>
 <181A2365B34DBCB1.21341@lists.openembedded.org>
In-Reply-To: <181A2365B34DBCB1.21341@lists.openembedded.org>
Accept-Language: en-AS, zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH8PR11MB6928:EE_|PH8PR11MB6779:EE_
x-ms-office365-filtering-correlation-id: 03ed34e7-f6a4-4c58-c1ae-08dd45c99120
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|1800799024|376014|38070700018|7053199007;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?zbITnw4LNyKrj7UJrXL1IBdmIZT7WxqEKQ0Ujy9qDbdHGSOnryG8tVeTuxer?=
 =?us-ascii?Q?k+2fGRelX9GUm+IgXw0LgBwUA+ZwZ4oJ06yoXedq+JnfCHMX1uhZG8veY4b8?=
 =?us-ascii?Q?Iz1nSx8yij2JlR5lp0LG5iIhoZnOhfzkHxmJbeMtCCUaR6hiuTuo0ANcdR8H?=
 =?us-ascii?Q?bhfLlN0PDJEceYlkbc5x4xcvEA3VW2XyOIogHsWtsb+bsf320zFuIo61uvMB?=
 =?us-ascii?Q?6GemQQSykspne9p3gw8ogWWpzqNcGlz0bfXVJkczocgtNaQpvww1nV3FGRIo?=
 =?us-ascii?Q?vdI4P2OtTJVEqD3Xsbeui0c/QFmqHvS9jUe1bsXaOEb+fkta0/9TUDaoPfaz?=
 =?us-ascii?Q?/+96y8aH2A+iZu0z/NafcJ4jv9DojTfoY65cMJyuN2Aw0oAr183LoJoaB6Rh?=
 =?us-ascii?Q?//WvH7xULQTtKIGDeN80eCpdVgEOt0PKc2hvafw8VAiTbkRyOnT55jTI51Qv?=
 =?us-ascii?Q?yWVw95HNqNW9aZ7AKCQmsgAutNrnjWnydNryzRqvmhLKaJRa+NMoDNKF1QRm?=
 =?us-ascii?Q?WSgYA33SU+5fww9cl2TN0laAb+leKpjSum2Nnr7bb9APa/Wli2QpIijRqiDv?=
 =?us-ascii?Q?SxejA7AMmfdhTeddw1B8R0ogvw6gyfxtKOZH7xyCOmrVFrVR9OAt3DO8WJdz?=
 =?us-ascii?Q?qPJxpRNURJy6k3PBkxQkznr0Tk+bWOBnoUaVmbnVJefK6HlyFB6KcHUyDNSF?=
 =?us-ascii?Q?6s7wcW1inEM+MAQ6vZgI9tk/Oz6emCthUZl2wn5BtIYFevC54Ytxbsvf/0z8?=
 =?us-ascii?Q?NJ0Eh4lpe9+r+LTre0Vu1eD6YSQrnUi7cMWrny+TzkDlpKeaOBjpG1rYkCRV?=
 =?us-ascii?Q?2OJSkxr/YTHLFswC1y0FTmTw/JkWx98/+eht4P1jsmMPlBrDWqKB5MPsnAe/?=
 =?us-ascii?Q?zq/4LRDVGmVAzMnDKke9MPGRbNJJILFG4tGUy8R+Y61F2oZX2PHo9RFwa10h?=
 =?us-ascii?Q?kO6I2lWNtrgrVjgnNpNlD5KJDWKw1n/jcB/lBRcIXUy2e2BIoHug6vhyE0Wo?=
 =?us-ascii?Q?2lhhL3QItsEXE9MM7e14Z0JMS+USijVeVnMEUa+WQbEL6trAIvsOrApXEOyr?=
 =?us-ascii?Q?j2y6wR786NgRNHFnKTDIT72aTfb8owzd7mwADy5snPZAsdT95Dyj0Mj/gwPb?=
 =?us-ascii?Q?lmuHHTHki4I81MGUsJcd0sviHkbHogJkjomRO67qGU0JYhECaUIYIwfY207O?=
 =?us-ascii?Q?rhLcBqidujY0/pDqaQUEF4bWCAkOvrBu4Fk6lvgs8Zaqr57rCrFl8mZjL/qW?=
 =?us-ascii?Q?02dZdIMvfqPD//iTG/F/Ekw6bow5HCFJkbA5aAG/fvuFZi1kY0ezR+/9+e1A?=
 =?us-ascii?Q?mC4hpQNvcW59567mF7MN6i41axbjHgr0fdWvCzRxEDFY1D/RoOIzlRJoz9ef?=
 =?us-ascii?Q?WW3r9hAucsnKclGZOhx8vN9F7/MU?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR11MB6928.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018)(7053199007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?uOky/9WLgQekuAsBNzmxLRnKyFho/Ex++DDd4+Sa8tRDmO//MI2qunJFJ/C8?=
 =?us-ascii?Q?kFdRZLd8mF2cxl0xmw4GCeyItoVL6Jtfit34N2QbYRLsMfmXnZeRUg0doUaX?=
 =?us-ascii?Q?WpApXoZvXhw67rqQ19qgMhoqDeOU21L91FWDqqWbRqZsEs/kee/MKw6ipjjz?=
 =?us-ascii?Q?7wxxzi30HzvLfmyEkCRGNheSRZe5U76tqa5vcIgNwFVH1GBoY17m6Ro26dpX?=
 =?us-ascii?Q?d4CVuEE1N6XeEjNq85bzemDcQCr0VAcdr3OOoDwDG2MGZJDc1+Y2rtJks3++?=
 =?us-ascii?Q?B7BqB3AGYKbSFeCZ4FvLtOVsUoqxUVn/g7SU9uCTfBrPeGdCpjW2JF50ODZs?=
 =?us-ascii?Q?othinmQo4BGy5jTdrFnQQ2TYLqCI/wte+Dd8SLa8E17j45ir+omYYMn3jc5T?=
 =?us-ascii?Q?m0hcBBmGdG0G7r/qyccf/N2grJF84v3jZ70xM+hJla8CuXzAP8R7RV4EYl8S?=
 =?us-ascii?Q?GquC2ugS1YIZPPX1rT2yIUV20EMvto8+9UlNBnM4idDfy0FlOU2T+iY9yE5B?=
 =?us-ascii?Q?SWAkYv1Jlqk4KVOVo7kGcPu4GJRyrfB8ZtbhQ5EB3DPKu7YVuC7QFLh6jzCr?=
 =?us-ascii?Q?Wk70+u0stqOio7ikTeQ5r4Y6A+SD5KhO71gz9lg8Teg8UvQS0K+pQLUYkWvB?=
 =?us-ascii?Q?8lQC4bkMHcHgIfatjkUa6oi5WEx4yxYLwWnRdDoX4p8yt25/sKpM/1U82uRe?=
 =?us-ascii?Q?2GoWNnbyVmDOx2TT7HgVlYxeILorH9WiQLtPqIXw04aUoveNZcGBAqlPAHsc?=
 =?us-ascii?Q?o8flUGMK6QGzfAWrQu+rDcmKpxL91ZMquP+1xmD2/pY4wveXtey6N10bbmgl?=
 =?us-ascii?Q?+S/KZeQPD3v1K6rnNRPWKrrOM+f+5vrT2czCG5IinwRnZdMUqTTD3SEqpmyq?=
 =?us-ascii?Q?4l9gFwIxxhwcZPC6k0QgSOYenphteG6v9XbglSGe6iX3pci9vUmZY3+wsx4G?=
 =?us-ascii?Q?tIjibacw5/LIsowtVAW+RLE+E+g//MqEPAycmiMDsuDE4whk2F/tSp3gIIbv?=
 =?us-ascii?Q?5A7b1Ea4wrjxLGml7j6DSycu68yw+vSD1aWIABMeVfYPxFr+MVdCdxtsewbp?=
 =?us-ascii?Q?8RFq/9SS1p8EgtRb3DKBmqEmox8N7WZgjbNdbtIJAco3bphtR8cxG5zy/6+c?=
 =?us-ascii?Q?aWRZWfEdHpRpQBXUw81uL6ibMEj/Z6Oe5rr9BrV5AxOuurC718jv+KOrSguo?=
 =?us-ascii?Q?w5/R0bCdDdSbcwuv2Od3IeL1CiWUADnghJ0DAYD+VGLSw7sx291DmY4O9Au1?=
 =?us-ascii?Q?mA8Uh3PGvTh10BQoXotzKnez+KQfq7Bs/MiFN0KcPALjRDQ4Sr65HwSpu9W4?=
 =?us-ascii?Q?79msPsVCb0Xp7vVWLSkvnhbg3+hzIUAgxhqJalgOpZOVnqZfiZSSumF8m09y?=
 =?us-ascii?Q?oGEOc2zOMFknPJIUYIw6mi+5Yc8VGV1wu8pnmW5C82sXja0aFapNCkHq9yQf?=
 =?us-ascii?Q?BH7HSdZvOp7upajh0molAfYPzm1vkS1h9h/U6pkpEKRm+Zn2V60q9QtxyAwH?=
 =?us-ascii?Q?rRO8uxGociTomNsENjg8SKoJGohzfd9lr5v+3oQTj64aBcaNBUMDdblSo4zn?=
 =?us-ascii?Q?zB8jvMrCzdXiglYFwys6ikx2fnNlbUGjEdPbjNrVQ1GlRQCpGRWogr1D/JTm?=
 =?us-ascii?Q?8A=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6928.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 03ed34e7-f6a4-4c58-c1ae-08dd45c99120
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Feb 2025 09:43:38.1759
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PWsDq/CSmcN/kGlmGz5gPdcKZ7Zs82ylupwQXaUXmmBFAJZCSJe71sbevokrg0Ks5n/c+OnKMAq8vx6N5Dj128yQj6hxXHJvyUaROVqtVJw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6779
X-Authority-Analysis: v=2.4 cv=ecXHf6EH c=1 sm=1 tr=0 ts=67a332cf cx=c_pps a=l9lnEPKonMfu/vbXsUzXcw==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=T2h4t0Lz3GQA:10 a=bRTqI5nwn0kA:10
 a=XHfBerL2AAAA:8 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=bLZqKDXHAAAA:8 a=NEAV23lmAAAA:8 a=3Oa8URDDJV4A4lnsPCwA:9 a=CjuIK1q_8ugA:10 a=qb9JOAHM4hE5jB-puYrx:22 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22 a=SM0NOtVXJcAQk9PFKD3C:22
X-Proofpoint-ORIG-GUID: qJGV6NxEko82dhSPTL4BPEj65W1KYwxa
X-Proofpoint-GUID: 1_1iPt4KzomsfM9ROVbNMK5OF6bovjcM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-05_04,2025-02-05_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 suspectscore=0
 adultscore=0 malwarescore=0 mlxlogscore=999 priorityscore=1501
 impostorscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0 bulkscore=0
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.21.0-2501170000
 definitions=main-2502050077
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 05 Feb 2025 09:43:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115283

Kindly ping for scarthgap branch.

-----Original Message-----
From: openembedded-devel@lists.openembedded.org <openembedded-devel@lists.o=
penembedded.org> On Behalf Of Song, Jiaying (CN) via lists.openembedded.org
Sent: Monday, January 13, 2025 11:39 AM
To: openembedded-devel@lists.openembedded.org
Subject: Re: [oe] [meta-python][scarthgap][PATCH] python3-pylint: fix do_fe=
tch error

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


