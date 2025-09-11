Return-Path: <Jiaying.Song.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9422CA1016
	for <webhook@archiver.kernel.org>; Thu, 11 Sep 2025 03:37:16 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.37835.1757561835266950234
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 Sep 2025 20:37:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=Dd/vQu4+;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=1349009e86=jiaying.song.cn@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 58B36P7p1915755
	for <openembedded-devel@lists.openembedded.org>; Thu, 11 Sep 2025 03:37:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=wbtwT62M+24vrQ2kFj8wk+YoGh18AKBJyEF/ff8oW8g=; b=Dd/vQu4+LZLX
	W0wi2N67Z1His/dU8ybdRhzP1JCpek5YAbR89RQZZ7VYRzMOh7vMkrx7tj3MI0cg
	ATbzmbLmIUr7n6mLfaaOcfPBg680GDNG0vMOjMyEkXYtWabQ8Vg9tHBPnqO0d4f6
	oJnElkHWhrFSd5OmemDZQ1EAFhHafLeYuUSSxFdIZwsZfbEe69avm93yYSpl2ri0
	iP5XA0UVs0UnOvR7remLUnEUGubp08hP2xQ3VsVd0TU5udlQlRQqfOg0ZJXHaMkt
	iIHTIhcWP5AiIXHpAmoCpRuLgc2z1VuVg0zW4qnamSXGkR134tOu2Vu+HBioNZ+b
	LGlhGk+BHQ==
Received: from nam02-bn1-obe.outbound.protection.outlook.com (mail-bn1nam02on2059.outbound.protection.outlook.com [40.107.212.59])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 490a5w5c1r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 11 Sep 2025 03:37:13 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tMZjKpgtUbLrMUhaLthB8OjHxt1UVoPXPi6Z4RYGiAsErzB6AcKMWy5rMHUGTzu9XtmL5nvzNw4MCkDRyEO3JWtmZylApz/g3t9RMiqQPHiwkoBetvNgFbF0aRmfyzPgAPUDRYgfKfpg+HTujPvZV2QvwYGkAESGcxvsHocql01Zp6XZEWnw/zQOmCt7vrZX9XUYWOdYrLup6+AluLuvvJz+S+tpsbSqDa4jGHmNMvBlwv0gzJWfjxFLNdyR3J26I8jz3L51AloSqoNtBYOXeVR++pBWwBG3WWpzLewLPKWk0QungsioIVTFshUrWW9UCR/FMl9efKzpykacvdfYpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wbtwT62M+24vrQ2kFj8wk+YoGh18AKBJyEF/ff8oW8g=;
 b=Em34V0HpPAmvvLA9CrVTaSgC8LR3ym11ZjjuAowA+kTXPftgHKkZoOknLOqHwI1SR0Pj/aJLXymPzHc/IyrMTxHo1TfWXQiZ9gN02JijKin378ukPdb6IqW1Eb6l7sHnpnn1t9pyobU0HyLcWTYMCttqx3oqifGeKLx1itgmOiIwpps+bSrHxushpsYSf8jXrIaMaxpRkAsOcf0Zo7E9vbQwL07uOgAC7q7mVGpbhc1m37CqAZAymLf9MZt48mBFY0UV+yDLwUTg//KnLzmA8bV6PjHxl2AsX6ywt7F8ZxvGT/e8z+h2glM00KOklXM337J/weCoqMhb4VSD4B9cwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from IA4PR11MB9420.namprd11.prod.outlook.com (2603:10b6:208:563::13)
 by CY8PR11MB6939.namprd11.prod.outlook.com (2603:10b6:930:59::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Thu, 11 Sep
 2025 03:37:11 +0000
Received: from IA4PR11MB9420.namprd11.prod.outlook.com
 ([fe80::2714:5169:aa4d:163e]) by IA4PR11MB9420.namprd11.prod.outlook.com
 ([fe80::2714:5169:aa4d:163e%4]) with mapi id 15.20.9094.021; Thu, 11 Sep 2025
 03:37:11 +0000
From: "Song, Jiaying (CN)" <Jiaying.Song.CN@windriver.com>
To: "Song, Jiaying (CN)" <Jiaying.Song.CN@windriver.com>,
        "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: RE: [oe] [meta-oe][scarthgap][PATCH] v4l-utils: Fix QA and build
 errors related to _TIME_BITS on 32-bit
Thread-Topic: [oe] [meta-oe][scarthgap][PATCH] v4l-utils: Fix QA and build
 errors related to _TIME_BITS on 32-bit
Thread-Index: AQHcARbIPPBKvk9NVkO5z67BzvZT2rSNmEvg
Date: Thu, 11 Sep 2025 03:37:11 +0000
Message-ID: 
 <IA4PR11MB9420E756535006CF3BBE0257B809A@IA4PR11MB9420.namprd11.prod.outlook.com>
References: <1856F1D0C1A68E13.8240@lists.openembedded.org>
In-Reply-To: <1856F1D0C1A68E13.8240@lists.openembedded.org>
Accept-Language: en-AS, zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_ActionId=2db3f0b2-0420-4fe9-9165-a96698a7f58c;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_ContentBits=0;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Enabled=true;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Method=Standard;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Name=INTERNAL;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_SetDate=2025-09-11T03:36:19Z;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_SiteId=8ddb2873-a1ad-4a18-ae4e-4644631433be;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Tag=10,
 3, 0, 1;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA4PR11MB9420:EE_|CY8PR11MB6939:EE_
x-ms-office365-filtering-correlation-id: d322da2e-d1a9-4b0e-ec9b-08ddf0e47de7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|1800799024|366016|376014|38070700021|7053199007;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?gvCpETBNhXUC4WoYkxZyJqotXNN7FCy1e2cJ2+fqPCmVid+WxMaR84L92thR?=
 =?us-ascii?Q?eWHXRHhz257HnqLdie8YngLeNWJ3dhwv14Wqtou+1TFNN4gQYRtJ+q/439pX?=
 =?us-ascii?Q?thJvxN+Z5MSfOYJ02herrS3O2IBafyarBKbWOa1ZI0PzvGSomUeZOGtTbl7X?=
 =?us-ascii?Q?oBCQIcydc4HrN38hBHNUFNM+BqVMUCy4vw+8esk9XvPJm2cZqQJngb4d/xg2?=
 =?us-ascii?Q?A9LJydTGEYuT0rP9oNinAWmu0XkUY3EmaoZgAzFwSm4K8T+npcqwDjZMBUVK?=
 =?us-ascii?Q?CKs2oPerTBGA4OrEAbIRu7hAGQuzR2CbXeI/z6+2S1h4UV+LBbXnEu767nEQ?=
 =?us-ascii?Q?+PEhabrwNuDzm2akFZaBxrc7Vh4jb20X/2TA5mjfW9J2CizhHWMwQ6ajKrjh?=
 =?us-ascii?Q?o4vFUES7/XCkkOqNwMW2kckARydBc9MUwQllZe2xoyZmZcf0DIbqgRG0/pJV?=
 =?us-ascii?Q?gabH57ymgLQTbW18Qq8B80AQiIQDBv6zHqbt5uvjd584ceh61SLiXYj9SOiH?=
 =?us-ascii?Q?ExIn1U63YJa76kYYUbL5y3/D6sU6XoxKmFgDynbqra0Nfezh82Qo5CbWDZGW?=
 =?us-ascii?Q?F7NyI5TSm6kdGjip6p8twtVxmgE2BThBWmfOCthiA4KRQTPmZGsGRvWxFMzo?=
 =?us-ascii?Q?Miy7rTqvqRYLx/tjECnk1L3sSm+9KO42gsjIdb+CpQhH6hSUX8Kzu0pUYB7h?=
 =?us-ascii?Q?VaPRzOKaXhg7d8QbzncvaYMTBUp9coGlGrfSTR+UHJQCZXz30guGO/sGcDH/?=
 =?us-ascii?Q?wlJtIuIocoiOD6HE924TpPko7YafoSXCQ9LeFqQMYNUIGlvcuq2t6Yh7SjjX?=
 =?us-ascii?Q?c/GYfi+b+EonF9FBuOYIB0UExVKuGEfaP2kULEBEd5Xyb56BIEh85CJe18eP?=
 =?us-ascii?Q?AjQzMF1P244Z+zDNwKNSsb4quAPQUi5lf8xQQilq1HD0NRr/SnyPDFGlNqLr?=
 =?us-ascii?Q?Tyd4IJ1OkdMYBwlGSsgcYDwiNXviaF5+O0Upv4DxVLzXAHt4sXnYv9Zl1Wbl?=
 =?us-ascii?Q?w/8vwT8TX1/ZLEQtDjeLoCKpIQnb9blPgqe4g6/gGjwn/5lqBSZnlLhbC8Hk?=
 =?us-ascii?Q?OFHS+uA2zFnjblWrP/IBMtymsj4Z4r3xgJVOesLNPMR6HTTb1tjHpgkRea3B?=
 =?us-ascii?Q?K25FuCW5gkneEl6TS4lpz1RzAEPnFaar/HCxA+JPKLCGXjvmYxXGF++PNIig?=
 =?us-ascii?Q?QVz+UfHPdIMxnILyWkdBx39C3ijI2y0/ybTIQqBg4ILcU0iqTY/1ZrD9qdH/?=
 =?us-ascii?Q?E1nAmCvefv9wivr98IRTlUIXykTzNQ5Fw36XOt/LMBsajUJechow7/MAfb5O?=
 =?us-ascii?Q?2Xlw5IprQKh1D0oGfYXW1BSyGJMkShIl+iRGU0eFmqm26oqXtrKtLcCl+v6N?=
 =?us-ascii?Q?djIw2LtZAQUloOTSarhLx6BUvpOSbdDK/t3a1Is+1WRVOSPRbzkrY++dMd0Q?=
 =?us-ascii?Q?6Msy6QzJHu8TnRv6YTgSA8PfsLl9xNl9+rwedJO4//wL4Ob0XgV0Kg=3D=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA4PR11MB9420.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700021)(7053199007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?pv+rynbh4jMfREGLw04INN8hp3j9LXFRx5VKp/YtdWet3zy6DooGlEbVEpPk?=
 =?us-ascii?Q?6raZvFJOGpj/LgD3n3ZrmDsyq2MB4+zGdgexb0pJWvO801aKY3d7/17rKMCq?=
 =?us-ascii?Q?7gKnqxztN/cxJ19bmggJ0uNh1qwvKc8+IRwHjJd3NvZezAe4uO/cmdHZa9Z7?=
 =?us-ascii?Q?J6TAx7LuDzmASPfFQZtnufj1VQUsgeX6SNd8GwumTeafkEoYrUnIjWRceNYK?=
 =?us-ascii?Q?EXo5sLqnk27xuu9EO2bYMFJE5MTl0kDvwrk0vucYsHGvql9GTdTY3dshA+I7?=
 =?us-ascii?Q?INAxalMnd5sbdhxrEAEWGph4J5Gljs/yUHKJ1Vd8r92EVX4l2Fjh1Q07LGyB?=
 =?us-ascii?Q?vX2tx/rYMNKvDrmtuilS9PAPPtaJMfo+Cc9HeQihILY56NiIgnJb3evHLCo7?=
 =?us-ascii?Q?p7vIekDriNZe9VKdICvVNtZHPDfOeAndUwEHCith8JpxDnf77DLVwDMIUiyG?=
 =?us-ascii?Q?/WfBTNYgCiEiPNQ4tiwGdG3j5LVcQveaw1rS3MiVnbQGX07/YptjuRoh8pqg?=
 =?us-ascii?Q?pt2pyhpCk/k8njjeOVRxoa8ZcKLM3OX4thYdXCLki7p71RzxVUusHVEc7LG2?=
 =?us-ascii?Q?nzIFYe4f1ZxIDplPW4wK2x/c7A4jfLXR4rmiHz4f1xsZwfApGgk+zDJmp29g?=
 =?us-ascii?Q?AjA/Q0iVhth2Uz4QHEJAY+T6M6+2ansjy9THHCg416vBAIx2/pHbsnzqHvN2?=
 =?us-ascii?Q?A2pJqxbJA9zr8nSHp+RcAGgGIAdOXV3zbcqtVd1TbTnceBFPnN9/0ABQnZdh?=
 =?us-ascii?Q?geV3lz0ucms/OKGTaxXjM+NSAOmQ32Q54lcz8oIs+qJn4An5W3ujkWmv/V/h?=
 =?us-ascii?Q?k3VePVVCkIw7x19pLIvBm/vA41HK0AIsrrDDem8SzwjPfUPPmz/aLxdUvqp8?=
 =?us-ascii?Q?vScYqbVZo5Ehuaj+5yqT7Tlt+7gFBj/fjgSaBtRfp+sSwLB3y1xAVp4Zf9CV?=
 =?us-ascii?Q?pLylNZ8Tw8TiaiRXHthedhy9MOEC7PxwIHCk/RsoVDRaWklmkFf6QDolxfrR?=
 =?us-ascii?Q?pXmTp4Uqj7fpwnlADgz8Xk/S4rQiO+w3ezR/GSA2l785PPr/5NVZllHuyAcF?=
 =?us-ascii?Q?tQHok2IQMwfON5qjbqXsSuOY/GJNkgnNkO6+yTvAQD0C0hev4Kby2uF0hYLZ?=
 =?us-ascii?Q?87F+IxXGrD/r01tLs0YVj7I5aStDtcqk2zZ3S6r8s+FcCYoU3qVsobwit/Jq?=
 =?us-ascii?Q?KUpgXSYymuN3lzVb87l4bn4fDtEuieums0w3AieKQZIbH0inYa06nwb79FK6?=
 =?us-ascii?Q?dN+TGdj3iUjnb8WbMyiOi3T5tnjJYFfOvCT13eu0mC1VVYEO5yFSycz96QX1?=
 =?us-ascii?Q?7WVRyxvWQETJ6YxfR9f+UYJdK3uLOeUa4ue4aSV3+wq7POXmfJpfDbirQGn+?=
 =?us-ascii?Q?CIOHLDmC1wrx96DjgB7ITjyVyrcTAa6ystOsR1o4WrhZ7YA3/q4nxpQRQSC6?=
 =?us-ascii?Q?Pm+dO4e6Jjy3vl+FBhR1vKxYbm1ZrOpobE7zGSDSQc+vAlRh42zsDFMD7vZM?=
 =?us-ascii?Q?MTbw4gRTEVR0g03S770tmJ74FCSJxUw94jgiH01Y0cYF7xoAYV0VeK2a67ro?=
 =?us-ascii?Q?zaQYe5wLb2NNbqbrF168R6CiGwq1Bb7Vq5HSvXFUALsrC7RfXU409ZQQ2I5j?=
 =?us-ascii?Q?yw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA4PR11MB9420.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d322da2e-d1a9-4b0e-ec9b-08ddf0e47de7
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Sep 2025 03:37:11.1670
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FhJpYwx4EZnyYQqz3zN/pmhysIHULx0TeWcUtYE9zJhGBKrQqpHj163h81CijIy7rfGhJShmmLL+gg5nz4Icbh22NjcdO30ubB1t4QfFSfE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB6939
X-Proofpoint-GUID: dx4ZYDYL8gMasfoq-0CyA5Qf6cHaueCQ
X-Proofpoint-ORIG-GUID: dx4ZYDYL8gMasfoq-0CyA5Qf6cHaueCQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTExMDAyOSBTYWx0ZWRfX6N3GubNxEUDR
 aajAsEz6UsZ5Fe218AmI4kOBA1/BfeU/nm1mfFBR9pGe9QOWKK8uQmCr2SWObjEQLA01NX+75i0
 M58ZI8bsQoweeLhlnU2YihQrsdaPzjyrAVWLiwFHNfIybyaJx7p/bprh79qGd1m8DcTrvJZil4F
 OaYeNwNlHmMMwZDfyskZefIhSGfKcmIp6NUt6MKHMSsew5xs5FmOtQCDmLBU3Wy+EcnAeSWAtnH
 0zn60J44gHYPF3gSc0sNXnI/oWPWEWMiSnFq5IkBvj+nje10B4scF72+MmDkYOQS79AtzqSrO4p
 LaC1a2Sw+z4CvjnqxZE6K5uX3qCBjD6eVQKdY3SQSJ1az1goh7tDEaQjldF4+s=
X-Authority-Analysis: v=2.4 cv=AMtZH25w c=1 sm=1 tr=0 ts=68c243e9 cx=c_pps
 a=0X41gtVjVlASHecNQXUhFQ==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=NEAV23lmAAAA:8 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8
 a=pGLkceISAAAA:8 a=xOd6jRPJAAAA:8 a=xq3W2uTSAAAA:8 a=9SK4O4xWsW977gvdxs4A:9
 a=CjuIK1q_8ugA:10 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
 a=P5L7wpMTXyg1GfFA3Gwx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-10_04,2025-09-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 priorityscore=1501 clxscore=1015 phishscore=0
 malwarescore=0 spamscore=0 adultscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2507300000 definitions=firstrun
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 11 Sep 2025 03:37:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119350


kindly ping for scarthgap branch.

-----Original Message-----
From: openembedded-devel@lists.openembedded.org <openembedded-devel@lists.o=
penembedded.org> On Behalf Of Song, Jiaying (CN) via lists.openembedded.org
Sent: Wednesday, July 30, 2025 1:56 PM
To: openembedded-devel@lists.openembedded.org
Subject: [oe] [meta-oe][scarthgap][PATCH] v4l-utils: Fix QA and build error=
s related to _TIME_BITS on 32-bit

From: Jiaying Song <jiaying.song.cn@windriver.com>

* Remove GLIBC_64BIT_TIME_FLAGS=3D"" to enable _TIME_BITS=3D64 by default,
  which avoids the following QA issue during builds on 32-bit systems:

  WARNING: lib32-v4l-utils-1.24.1+git-r0 do_package_qa: QA Issue: /usr/bin/=
cec-compliance uses 32-bit api 'time'

* Undefine _TIME_BITS to fix the build error:

  /usr/include/features-time64.h:26:5: error: #error "_TIME_BITS=3D64 is al=
lowed only with _FILE_OFFSET_BITS=3D64"

Signed-off-by: Jiaying Song <jiaying.song.cn@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...on.build-fix-arm-_TIME_BITS-64-error.patch | 38 +++++++++++++++++++
 .../v4l2apps/v4l-utils_1.26.1.bb              |  5 +--
 2 files changed, 39 insertions(+), 4 deletions(-)  create mode 100644 meta=
-oe/recipes-multimedia/v4l2apps/v4l-utils/0003-meson.build-fix-arm-_TIME_BI=
TS-64-error.patch

diff --git a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0003-meson.build=
-fix-arm-_TIME_BITS-64-error.patch b/meta-oe/recipes-multimedia/v4l2apps/v4=
l-utils/0003-meson.build-fix-arm-_TIME_BITS-64-error.patch
new file mode 100644
index 0000000000..f41dde0e16
--- /dev/null
+++ b/meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0003-meson.build-fix
+++ -arm-_TIME_BITS-64-error.patch
@@ -0,0 +1,38 @@
+From 5aabd01e415374fc97eebe80d4635c3bae728f81 Mon Sep 17 00:00:00 2001
+From: Hans Verkuil <hverkuil@xs4all.nl>
+Date: Sat, 12 Apr 2025 12:30:13 +0200
+Subject: [PATCH] meson.build: fix arm _TIME_BITS=3D64 error
+
+Undefine _TIME_BITS to avoid this error on 32-bit arm:
+
+/usr/include/features-time64.h:26:5: error: #error "_TIME_BITS=3D64 is all=
owed only with _FILE_OFFSET_BITS=3D64"
+
+Upstream-Status: Backport=20
+[https://github.com/gjasny/v4l-utils/commit/d517cfdcdc16533ab7e06e97c07
+ca089cf261aef]
+
+Signed-off-by: Hans Verkuil <hverkuil@xs4all.nl>
+Signed-off-by: Jiaying Song <jiaying.song.cn@windriver.com>
+---
+ meson.build | 6 +++++-
+ 1 file changed, 5 insertions(+), 1 deletion(-)
+
+diff --git a/meson.build b/meson.build
+index 269a9da7..31927cda 100644
+--- a/meson.build
++++ b/meson.build
+@@ -53,8 +53,12 @@ v4l2_wrapper_args =3D [
+     # As the library needs to provide both 32-bit and 64-bit versions
+     # of file operations, disable transparent large file support (fixes
+     # 'Error: symbol `open64/mmap64' is already defined' compile failure
+-    # otherwise)
++    # otherwise).
++    #
++    # Also disable _TIME_BITS=3D64 since this is allowed only with
++    # _FILE_OFFSET_BITS=3D64, which is now 32.
+     '-U_FILE_OFFSET_BITS',
++    '-U_TIME_BITS',
+     '-D_FILE_OFFSET_BITS=3D32',
+     '-D_LARGEFILE64_SOURCE',
+ ]
+--
+2.34.1
+
diff --git a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.26.1.bb b/meta=
-oe/recipes-multimedia/v4l2apps/v4l-utils_1.26.1.bb
index eb38d97132..97271908b5 100644
--- a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.26.1.bb
+++ b/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.26.1.bb
@@ -13,10 +13,6 @@ DEPENDS =3D "jpeg \
 DEPENDS:append:libc-musl =3D " argp-standalone"
 DEPENDS:append:class-target =3D " udev"
 LDFLAGS:append =3D " -pthread"
-# v4l2 explicitly sets _FILE_OFFSET_BITS=3D32 to get access to -# both 32 =
and 64 bit file APIs.  But it does not handle the time side?
-# Needs further investigation
-GLIBC_64BIT_TIME_FLAGS =3D ""
=20
 inherit meson gettext pkgconfig
=20
@@ -29,6 +25,7 @@ SRC_URI =3D "\
     git://git.linuxtv.org/v4l-utils.git;protocol=3Dhttps;branch=3Dstable-1=
.26 \
     file://0001-keytable-meson-Restrict-the-installation-of-50-rc_ke.patch=
 \
     file://0001-media-ctl-Install-media-ctl-header-and-library-files.patch=
 \
+    file://0003-meson.build-fix-arm-_TIME_BITS-64-error.patch \
 "
=20
 SRCREV =3D "4aee01a027923cab1e40969f56f8ba58d3e6c0d1"
--
2.34.1


