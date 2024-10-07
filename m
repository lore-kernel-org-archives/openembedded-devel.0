Return-Path: <daniel.dragomir@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 162FECFB440
	for <webhook@archiver.kernel.org>; Mon,  7 Oct 2024 08:31:12 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.48445.1728289871646951639
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Oct 2024 01:31:11 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=0010b67eb3=daniel.dragomir@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4978CubC013425
	for <openembedded-devel@lists.openembedded.org>; Mon, 7 Oct 2024 01:31:11 -0700
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2042.outbound.protection.outlook.com [104.47.66.42])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4234yksbde-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 07 Oct 2024 01:31:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vF+3dpsJiN6ZyHavO3DO1pA4GneuJYNVV5NG+mO+dWth0CgGk26Q4cQ1mp1t3fngR9ldOmABscdSEyFHVAqU6+SdB1pfLlu5RoO2ntD1vI9GFxc9aoP038td944eXK6sSrxOaKYXpblBfNrOCVLPGhF8gCBdLPyFp1Sjfeib8AVJlmGCBCQYFEd6lfSVu4uc3R8nIZ3VShXszwDmaUoHVBBjGcVa1vqk1MkKTWXx+7/XjDV3Ht5DSQUN74nOuM0gftBQhAkDqGeRO25p4fnfVl6BJHcw8GLQzPiWVlc9oVfuAXWKWt1jdrx7iT3YSru1FmFNU6VS7uVUW4maeygbaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vBv1m7ZhXtSWUWYpefBWVJKxZYgB5G0G+oDWGe4O6BY=;
 b=HdrBFbvH6353KJ3unS2pJHdUGA6nmMFiNkEEN5IFCS8z0efnYdGpjdRIqwaLLj9+ArbQzYgveuqmx3RcVt3CRcaz/qIqIWhLP0ITMfDPHoDl/sINOKqIpUBglYOCn/WAUhXHEohtKLuIjLyyiFBR2+731joRKQuWnpBBIntyWMN1E7n1RXXd+svuHw0d4NMOHzxjTF7UlO/eCKoLSVM2TNbxfN0QotpBYvb9aDbMUZS+4uRNIsHo9iEwR96z7AJjzhtb1eJSWhVtysWHAgVguSvwPmnIf+0jDnyckeRZXGYfEbpd2mVyM036juy0QeR07vbR5w/WXoGZW9KOh2omhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from BY1PR11MB7981.namprd11.prod.outlook.com (2603:10b6:a03:52f::12)
 by DM4PR11MB7376.namprd11.prod.outlook.com (2603:10b6:8:100::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.22; Mon, 7 Oct
 2024 08:31:07 +0000
Received: from BY1PR11MB7981.namprd11.prod.outlook.com
 ([fe80::4a4e:8d21:83b0:ab7e]) by BY1PR11MB7981.namprd11.prod.outlook.com
 ([fe80::4a4e:8d21:83b0:ab7e%7]) with mapi id 15.20.8026.020; Mon, 7 Oct 2024
 08:31:06 +0000
From: "Dragomir, Daniel" <Daniel.Dragomir@windriver.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] [meta-networking][PATCH 1/2] libldb: upgrade 2.8.0 -> 2.8.1
Thread-Topic: [oe] [meta-networking][PATCH 1/2] libldb: upgrade 2.8.0 -> 2.8.1
Thread-Index: AQHaw4Bp0qF17vCXfUK7p32k/I/OzLJ7ny/A
Date: Mon, 7 Oct 2024 08:31:06 +0000
Message-ID: 
 <BY1PR11MB7981407F0B654CDF4B61736EF77D2@BY1PR11MB7981.namprd11.prod.outlook.com>
References: <20240621021138.2377160-1-yi.zhao@windriver.com>
In-Reply-To: <20240621021138.2377160-1-yi.zhao@windriver.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BY1PR11MB7981:EE_|DM4PR11MB7376:EE_
x-ms-office365-filtering-correlation-id: 8932f8a2-93e7-43fe-5dd1-08dce6aa6393
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: 
 =?iso-8859-1?Q?CXSHT7ZZ9CO5LMoLhYQIzjOpJwgC6Hjdv7dFXd2Q2jfqJ5SAwmD2o+rpaB?=
 =?iso-8859-1?Q?Ag5/FwDkncijiLp6J03wZsspfvYrNBleFHZlBtacJTKsHJFjyAt6jX1z8U?=
 =?iso-8859-1?Q?EJAEZB64zyO1gvZaxAHTNA0IDAHcN5ttP4zjEYkA7+shjz+5Pv8knZcaAe?=
 =?iso-8859-1?Q?FzN9gD9frmp1PHFuC+ohHdnS7h/XCvKxmjxZH4NTPWE+fYb5VuDzpvnPVB?=
 =?iso-8859-1?Q?HCRpD4NlyglM6i2Y3qitsOKz7ycl1DJPzGo0HYxOf0wc9a49MVbhY7ZOOI?=
 =?iso-8859-1?Q?VKOY6G7We3NdLPjTGODEa04DK4zskhR+0F9Hdi3+AZtyG1Csqo81tefZF/?=
 =?iso-8859-1?Q?41YAYLEXapb4VulouRPbYY4sv36DnP+QIUmsdGejD6y9kpy/wtllO6ZKx+?=
 =?iso-8859-1?Q?B1lgv5hiAIvy9M9ROyhsPI6X/w9tIcTf31s6wGc0etGuf0ux7FXlllC5+E?=
 =?iso-8859-1?Q?qwP+gW+3xI+ccgdTfCKGlqtRZY8nRZPnP9qUoxcX5wVzgA/ckU0GmdSAvo?=
 =?iso-8859-1?Q?C6DkA6kVPuDE6cOVi7dHXqYh1r58XeSo9pwKwBptmdw1rfEOGLv74eK6o+?=
 =?iso-8859-1?Q?2QfwwyDUG17LJuwpVPb/blomHd7FSvA9Dq1OZKo/iezLVNRU//X814xDiA?=
 =?iso-8859-1?Q?CrGOmAJgziL6gxV0r+lV4bp9sdaTbG8ElQcj77ygxFjUaZGNedRwWtL4Fc?=
 =?iso-8859-1?Q?6chQl4IETw0ogifcVPKwVHQw/TBbgVnkpcLoxSsPRfnNH0fLiugT/VNwK9?=
 =?iso-8859-1?Q?o7gM2Yu1wIMgeISZrwgjSuDcT5NbLdoBVop8RWo6UrTUBiHZ+JiFJF+GCp?=
 =?iso-8859-1?Q?4y9zVYxe2pz0t34sqd2FVzvdrl6WkEc/SDQF0xvbPKdwkBW7Hov2gktAR2?=
 =?iso-8859-1?Q?PBuE2XXgphZVsf1Hn7k+YRidt/tWIQy9mNHZvKSqAWcm6rxmJP4y0CZZR8?=
 =?iso-8859-1?Q?Bbcigt13Ll3RoKvSVsFIebSCPoqAMtE7ibFrEJqhnGxBmzyvsy120WMGkQ?=
 =?iso-8859-1?Q?RgCLm98ifjS9O2qiAsQU4SZvo/v+vHoT6AdaxBmXbeukNPloYaBj7EzGXT?=
 =?iso-8859-1?Q?saPhiPYPAfGSKJvD0hCJyX1o6xLO1HIRdBHPd1cmlXS2AsR0ozPJfBV0a6?=
 =?iso-8859-1?Q?Ey172WgDwH52FXtXZzdz8kw9zySakLbvjjjwOcB2RIFQe//Khzo6NLznDP?=
 =?iso-8859-1?Q?nUaPvAtjVdJ8P9Y852sLa3Q1iG/CUUsX5eKVytWrEO327YkfO95t4FDUFZ?=
 =?iso-8859-1?Q?hew3unGlNZoTZOgClwclv/T9pS+z9gCIzD4Gboraa9TXJV+BK9xO8XVPMw?=
 =?iso-8859-1?Q?6GpcurVj9CQoKCg5qeiuYCeKBpgEEvNVnxoN7119a/14bJCTe/l5+atDXY?=
 =?iso-8859-1?Q?RXWAJcQ+DGUBD7oi2PL8H1CVGSYbOTQg=3D=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY1PR11MB7981.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?f6yEFCXahyjmy/viy29SznmlP9EJnsCJCeg8ywUKztkAnFy5UxaTozS+f1?=
 =?iso-8859-1?Q?qw+fGtiu+8LrZ8ocZuPFM8OPmbeyl9+10MwAJWH+9brnytFRLRjftgdm4P?=
 =?iso-8859-1?Q?nStIuMDhyA6CK6nEos/VGIm/t/bZ16gOcbat5j2aaQV1LkrOgWKJwA1Q6I?=
 =?iso-8859-1?Q?KE7Vd9xy4jrTzHWmP0Kv5Ivq9b7xEao/+ZfLkjgpbVeLPAmbKc7nhmO4eP?=
 =?iso-8859-1?Q?bpJjHl342PFOmt1xguIF+vbRmJNV//lPZb+gRkrZAYkbCyXdF4fL1hEeRK?=
 =?iso-8859-1?Q?ID1vgK9/T4ZlwzQicKLGybzlyu/ZFquad/TEV9mVfZB8N2yTTqC/VClPG/?=
 =?iso-8859-1?Q?wyLSBd2JgrQGE5Z/UZechOXD7RSsiX3Hu4ehUW1+K1QYkl7PRQJmBv9w0R?=
 =?iso-8859-1?Q?lcBJFh2TlWJhxwEUGYTu2mtP6ZjULXdpfZ8B57CC+KS0JFidaGMzWEEdVn?=
 =?iso-8859-1?Q?HNGyg8YRzV6o/x9CDxAhjLtkw6SQI6A3BjFV0CZ+s7Ne4QjxRpQptctU7Q?=
 =?iso-8859-1?Q?zjkLfyivJs7TdiBmO3EINx7DJNn0g+XxNOaaYoZWx4CxTEXI8QlqBdRuaV?=
 =?iso-8859-1?Q?64hl/AHgIClxYN5w3jhQRy6PlqkdszS8t+4Ix3okCfMBz19UlMhrgAXfyq?=
 =?iso-8859-1?Q?tM58bdqXw86iB6AAuVGgxhRr7YZoWKi7yUAk4tOL+VOghanXvN7vJSRB+b?=
 =?iso-8859-1?Q?vxB7Gz6TnNywEmaOlHdN2OX/kldlyS5cfeLPS164RWV5PSTxiO//jZOc1m?=
 =?iso-8859-1?Q?Bx5Zdu7VpzvW/bH7jQbFIibxwuuDN2NIzDCl9mj7eS+dOrLsW07ifDg0n4?=
 =?iso-8859-1?Q?W0ukb4kSkkVgzb0lXsLSzdmQflZBA/+4P0hAYqtzIv/0HLXKnMG881i6f0?=
 =?iso-8859-1?Q?lN+3iJo3mvc37izau3WbgFdfn4qxl9yEoNYmtsfB3AdzZo1jgYBIdR3dcx?=
 =?iso-8859-1?Q?FboCRlz4QOVtOHt1JHI/KCP9vkKCLrLx1PXrzIc3QIAVZT7Fp1x4HZ47N+?=
 =?iso-8859-1?Q?HoqSk9suMvGohQoVsa09AH9UbtS/UWvOdcWo0djnxK3ZnTd4J+pGhRPWyl?=
 =?iso-8859-1?Q?TYaRoi16t274jpAdQsIv9dkJzEfJeR/5FEBdWH10rb6TEffvMe7aaWaATB?=
 =?iso-8859-1?Q?s46ahB7LU6fHftp5PaeXPRUPOaxUCAt8ntfHByEaJdHnM19WB7x2pRqjGj?=
 =?iso-8859-1?Q?/ZmiE3uP+PXrtAppeyGp11oEGVsH9CTzEtIhA/YXhY9ZwvyomORMENHz0t?=
 =?iso-8859-1?Q?x4+CHUza/bwARjlx4oliTsKo17O1auhDjO3C5JI7cKs96CQu5T3fu31GHc?=
 =?iso-8859-1?Q?mc+NKiBgcxzqib27s9ei9Xc0AR3MAQWGmmdx8214HqxU3KVBGJhgXh+YtW?=
 =?iso-8859-1?Q?YGXsWGP9yipFl+qZNqwLivVoStNRhv7JpaKN4xG+GH9NbYIEDOKjujUwgw?=
 =?iso-8859-1?Q?diBLRhslCbQK1foRE+yoTKjXmbvj4a2OkNzZT3vPUag/aU8+YI4qhBYsww?=
 =?iso-8859-1?Q?iRTjGdVTtHnLxD50nXy6ht8dPU058NvKme447rwEQ4SLvmjfsvaQ6Dk3o8?=
 =?iso-8859-1?Q?NEF1FoLhpEfWpCAWN80Dq3D9Jnh5JennbbAv+wYxFgsb3suInuB+Gf21TF?=
 =?iso-8859-1?Q?V3FfMqeKXC1Q+fdCkIA8vM/Ka9SZiu53xItkHYUKPDI13Sy8MHqLF5sw?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: multipart/alternative;
	boundary="_000_BY1PR11MB7981407F0B654CDF4B61736EF77D2BY1PR11MB7981namp_"
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY1PR11MB7981.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8932f8a2-93e7-43fe-5dd1-08dce6aa6393
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Oct 2024 08:31:06.9170
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +0/rE2utrI3m/Kyjl9aY8BgyxjOdJDtC3dbQTLsKVGD6ctC7kOvIQqWmwFrZ+RphBUFAyyOWtW+mAEBL7CUs0P/T1lkZli07tN0cRu7ucQ4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7376
X-Authority-Analysis: v=2.4 cv=AKB5nO5v c=1 sm=1 tr=0 ts=67039c4e cx=c_pps a=ZuQraZtzrhlqXEa35WAx3g==:117 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=DAUX931o1VcA:10 a=bRTqI5nwn0kA:10 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=s91oEvzxhj89oHtrKOMA:9
 a=wPNLvfGTeEIA:10 a=3dmtu77R2wwXv56TNd0A:9 a=1K5Bib3doAPMVDI2:21 a=frz4AuCg-hUA:10 a=_W_S_7VecoQA:10 a=lqcHg5cX4UMA:10 a=T1a-OTYGVawA:10 a=ImwWUX5h3JJ3gRE9moBe:22 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: Wz1Hyve41bkDuQDq2N6IBE9HuPkwy90K
X-Proofpoint-ORIG-GUID: Wz1Hyve41bkDuQDq2N6IBE9HuPkwy90K
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-06_21,2024-10-04_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 impostorscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0
 mlxlogscore=999 mlxscore=0 bulkscore=0 clxscore=1015 spamscore=0
 adultscore=0 priorityscore=1501 classifier=spam authscore=0 adjust=0
 reason=mlx scancount=1 engine=8.21.0-2409260000
 definitions=main-2410070059
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 07 Oct 2024 08:31:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112693

--_000_BY1PR11MB7981407F0B654CDF4B61736EF77D2BY1PR11MB7981namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi!

This patch should also be backported to scarthgap branch since the samba up=
grade to 4.19.7 was backported to scarthgap.
Samba fails to build with libldb 2.8.0:

| Checking for system pyldb-util (>=3D2.8.1 <=3D2.8.999)                   =
             : not found
| ERROR: System library pyldb-util of version 2.8.1 not found, and bundling=
 disabled

Regards,
Daniel

________________________________
From: openembedded-devel@lists.openembedded.org <openembedded-devel@lists.o=
penembedded.org> on behalf of Yi Zhao <yi.zhao@eng.windriver.com>
Sent: Friday, June 21, 2024 5:11 AM
To: openembedded-devel@lists.openembedded.org <openembedded-devel@lists.ope=
nembedded.org>
Subject: [oe] [meta-networking][PATCH 1/2] libldb: upgrade 2.8.0 -> 2.8.1

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../recipes-support/libldb/{libldb_2.8.0.bb =3D> libldb_2.8.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/libldb/{libldb_2.8.0.bb =3D> libldb=
_2.8.1.bb} (97%)

diff --git a/meta-networking/recipes-support/libldb/libldb_2.8.0.bb b/meta-=
networking/recipes-support/libldb/libldb_2.8.1.bb
similarity index 97%
rename from meta-networking/recipes-support/libldb/libldb_2.8.0.bb
rename to meta-networking/recipes-support/libldb/libldb_2.8.1.bb
index bdd87993d..29ff2cf6f 100644
--- a/meta-networking/recipes-support/libldb/libldb_2.8.0.bb
+++ b/meta-networking/recipes-support/libldb/libldb_2.8.1.bb
@@ -34,7 +34,7 @@ LIC_FILES_CHKSUM =3D "file://pyldb.h;endline=3D24;md5=3Dd=
fbd238cecad76957f7f860fbe9ada
                     file://man/ldb.3.xml;beginline=3D261;endline=3D262;md5=
=3D137f9fd61040c1505d1aa1019663fd08 \
                     file://tools/ldbdump.c;endline=3D19;md5=3Da7d4fc5d1f75=
676b49df491575a86a42"

-SRC_URI[sha256sum] =3D "358dca10fcd27207ac857a0d7f435a46dbc6cd1f7c10dbb840=
c1931bf1965f08"
+SRC_URI[sha256sum] =3D "b68ce6eb0ccd2870fa3c8c334f2028b5d16606fd41308696c1=
7b71959f7bf59f"

 inherit pkgconfig waf-samba ptest

--
2.25.1


--_000_BY1PR11MB7981407F0B654CDF4B61736EF77D2BY1PR11MB7981namp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"direction: ltr; font-size: 11pt; color: black;">Hi!</div>
<div style=3D"direction: ltr; font-size: 11pt; color: black;"><br>
</div>
<div style=3D"direction: ltr; font-size: 11pt; color: black;">This patch sh=
ould also be backported to scarthgap branch since the samba upgrade to 4.19=
.7 was backported to scarthgap.</div>
<div style=3D"direction: ltr; font-size: 11pt; color: black;" class=3D"elem=
entToProof">
Samba fails to build with libldb 2.8.0:</div>
<div style=3D"direction: ltr; font-size: 11pt; color: black;" class=3D"elem=
entToProof">
<br>
</div>
<div style=3D"direction: ltr; font-size: 11pt; color: black;">| Checking fo=
r system pyldb-util (&gt;=3D2.8.1 &lt;=3D2.8.999) &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp;: not found</div>
<div style=3D"direction: ltr; font-size: 11pt; color: black;">| ERROR: Syst=
em library pyldb-util of version 2.8.1 not found, and bundling disabled</di=
v>
<div style=3D"direction: ltr; font-size: 11pt; color: black;"><br>
</div>
<div style=3D"direction: ltr; font-size: 11pt; color: black;">Regards,</div=
>
<div style=3D"direction: ltr; font-size: 11pt; color: black;">Daniel</div>
<div id=3D"appendonsend" class=3D"elementToProof"><span style=3D"font-famil=
y: &quot;Segoe UI&quot;, &quot;Segoe UI Web (West European)&quot;, &quot;He=
lvetica Neue&quot;, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);"><br>
</span></div>
<hr style=3D"display: inline-block; width: 98%;">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><span style=3D"font-family: Calibri, =
sans-serif; font-size: 11pt; color: rgb(0, 0, 0);"><b>From:</b>&nbsp;openem=
bedded-devel@lists.openembedded.org &lt;openembedded-devel@lists.openembedd=
ed.org&gt; on behalf of Yi Zhao &lt;yi.zhao@eng.windriver.com&gt;<br>
<b>Sent:</b>&nbsp;Friday, June 21, 2024 5:11 AM<br>
<b>To:</b>&nbsp;openembedded-devel@lists.openembedded.org &lt;openembedded-=
devel@lists.openembedded.org&gt;<br>
<b>Subject:</b>&nbsp;[oe] [meta-networking][PATCH 1/2] libldb: upgrade 2.8.=
0 -&gt; 2.8.1</span>
<div>&nbsp;</div>
</div>
<div style=3D"font-size: 11pt;">Signed-off-by: Yi Zhao &lt;yi.zhao@windrive=
r.com&gt;<br>
---<br>
&nbsp;.../recipes-support/libldb/{libldb_2.8.0.bb =3D&gt; libldb_2.8.1.bb} =
| 2 +-<br>
&nbsp;1 file changed, 1 insertion(+), 1 deletion(-)<br>
&nbsp;rename meta-networking/recipes-support/libldb/{libldb_2.8.0.bb =3D&gt=
; libldb_2.8.1.bb} (97%)<br>
<br>
diff --git a/meta-networking/recipes-support/libldb/libldb_2.8.0.bb b/meta-=
networking/recipes-support/libldb/libldb_2.8.1.bb<br>
similarity index 97%<br>
rename from meta-networking/recipes-support/libldb/libldb_2.8.0.bb<br>
rename to meta-networking/recipes-support/libldb/libldb_2.8.1.bb<br>
index bdd87993d..29ff2cf6f 100644<br>
--- a/meta-networking/recipes-support/libldb/libldb_2.8.0.bb<br>
+++ b/meta-networking/recipes-support/libldb/libldb_2.8.1.bb<br>
@@ -34,7 +34,7 @@ LIC_FILES_CHKSUM =3D &quot;file://pyldb.h;endline=3D24;md=
5=3Ddfbd238cecad76957f7f860fbe9ada<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"file://man/ldb.3.x=
ml;beginline=3D261;endline=3D262;md5=3D137f9fd61040c1505d1aa1019663fd08" id=
=3D"OWAd8afb903-7b4e-3383-e4ed-661a04228e86" class=3D"OWAAutoLink" data-aut=
h=3D"NotApplicable">
file://man/ldb.3.xml;beginline=3D261;endline=3D262;md5=3D137f9fd61040c1505d=
1aa1019663fd08</a>&nbsp;\<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"file://tools/ldbdu=
mp.c;endline=3D19;md5=3Da7d4fc5d1f75676b49df491575a86a42&quot;" id=3D"OWAb8=
23c93e-b4d9-879f-75a6-7b2766397377" class=3D"OWAAutoLink" data-auth=3D"NotA=
pplicable">
file://tools/ldbdump.c;endline=3D19;md5=3Da7d4fc5d1f75676b49df491575a86a42&=
quot;</a><br>
&nbsp;<br>
-SRC_URI[sha256sum] =3D &quot;358dca10fcd27207ac857a0d7f435a46dbc6cd1f7c10d=
bb840c1931bf1965f08&quot;<br>
+SRC_URI[sha256sum] =3D &quot;b68ce6eb0ccd2870fa3c8c334f2028b5d16606fd41308=
696c17b71959f7bf59f&quot;<br>
&nbsp;<br>
&nbsp;inherit pkgconfig waf-samba ptest<br>
&nbsp;<br>
--<br>
2.25.1<br>
<br>
</div>
</body>
</html>

--_000_BY1PR11MB7981407F0B654CDF4B61736EF77D2BY1PR11MB7981namp_--

