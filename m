Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E25EACF9C71
	for <webhook@archiver.kernel.org>; Mon, 23 Sep 2024 19:03:07 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.80])
 by mx.groups.io with SMTP id smtpd.web11.2856.1727118178524513324
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Sep 2024 12:02:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=selector1 header.b=Ma/jaIHo;
 spf=pass (domain: axis.com, ip: 40.107.20.80, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TdU2ipPlbu2uxAmSMgGSDbnIKM3lTlOlR7m76V1CGUDEZ4RWwuCEVMmJdJiyOaMKTNsKid31nsQAXKE/5A5qj5J0pxEOqWNU0HTkXqlkyX0ZGmYu+ivj2pR9AGM+EBXcLhl9RQ6Cm6sk9jE2v2DSdZ//rw/EHLcdmpIaJJm3vTa/cXKYkWKZwW7kHV86MjMBY6ftB88kggDnH4z9QrnBQy6ZJcGaoRWwOl+l1NGMXbxHHDm2YzVCv8F2S6ttR63i/0LyMycdzGQSrTVi71O3Q4YEmznLGvOP/IlfMcdyY/AFbkCfaLZNolvcpSfdsfm0mvplhVqAGcNuVDL6YXCVUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MhXpoAKKzfiBLli6rsyb+EnVHdiWnZbgFJue4IVsFHI=;
 b=JyrE5ZOn8mHswK0947fa9dM+qB202erORYVRz/F1/uJRMlkisSlK+v5Gx7NO/YoYBefLWDZrRaR6p3rD13oRblRxNMnNHVasMTkHVwIdY1DJU+84+ZkQDh0MOnWFCR73KGEyz1aa3vmF+/5CqcACnE4eXAR3AWOKbON/u8TcmMYnmxUkYzoT09Qm6yEVrovxMQxL1nXqMZ+gTbUguSpqkjoyLfXTcHeyX/DE0XjPgs9cm9gWKJr2cbpI7u1XsIl0Zr3UHZlug5KggRc4p3FEeBd0goTQ6cY+xi2QK3m5Bf7rnFGX6eh4jwGi7x77d5bNmLET5FA2v5aW8ucumA/2aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MhXpoAKKzfiBLli6rsyb+EnVHdiWnZbgFJue4IVsFHI=;
 b=Ma/jaIHoW+sHfZoQ6Q8uye91jMryCiBrWjZMOBYqDm2fsIohqo2hp3YOUaNtpaBP0hP93G2ZlF7sDT6zCdJ9XBEuS5cmAuZ8tcc9+qfmWIOQK2N27FOdnbuFGO7+X7yVCMJXb9jC0eYCyTMb2Mfd80Dz2FtUMZNA0GC6939iOI4=
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com (2603:10a6:10:4a8::17)
 by DB9PR02MB6827.eurprd02.prod.outlook.com (2603:10a6:10:1fb::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.25; Mon, 23 Sep
 2024 19:02:48 +0000
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::1bee:3174:a078:5af9]) by DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::1bee:3174:a078:5af9%4]) with mapi id 15.20.7982.022; Mon, 23 Sep 2024
 19:02:48 +0000
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Yi Zhao <yi.zhao@eng.windriver.com>
CC: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: RE: [oe] [meta-oe][PATCH 1/2] protobuf: add abseil-cpp to RDEPENDS
Thread-Topic: [oe] [meta-oe][PATCH 1/2] protobuf: add abseil-cpp to RDEPENDS
Thread-Index: AQHbDMIrdnc2MU/Dx0qg4q2/DYsKrbJludqQ
Date: Mon, 23 Sep 2024 19:02:48 +0000
Message-ID: 
 <DB5PR02MB102135305A71D2997E959868FEF6F2@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: <20240922073618.1359707-1-yi.zhao@windriver.com>
In-Reply-To: <20240922073618.1359707-1-yi.zhao@windriver.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB5PR02MB10213:EE_|DB9PR02MB6827:EE_
x-ms-office365-filtering-correlation-id: d9bf8dd7-aa54-463b-7ff6-08dcdc0250f4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?OmzB1cYMabXnouPq3kCqyczZHRwrk+qhyHDQZL7/ooscsA+tlVZmi6vHlxnC?=
 =?us-ascii?Q?u5ffapSpXQ6PX1txAaaniBEFT0wTcWayLJnv/wscIk77lzzK5BYRdka3WOwP?=
 =?us-ascii?Q?OrflLCfS8JOSuo3ub81VYfhBo9jdI1/61eYJu8NVneRT92E8BfwpVL58NEus?=
 =?us-ascii?Q?jTGLZTknJgRNAyGy8LD+/Ph8n9e+hFR3Y1e+1YcVB8c4SdodXkwEa15rMY02?=
 =?us-ascii?Q?z4Cj1XVnZLZG+1zZiu2KmBd0uZ4Rq2LbYUkXLC+dndU5h0/h+D73Yts+mXwc?=
 =?us-ascii?Q?/v0kUZwrYAfv2qT12uLaMHhhGjJXQlMGu1FJ6OAA/sQkGFTnD5EbF96cN3HX?=
 =?us-ascii?Q?lfrCCHx8PYDqkPAGSi/LZDhnB1HGURCoU7dgw0PrFAiRUtLmSGjbAK69HVLp?=
 =?us-ascii?Q?oSIzer2rQeevVO3t47AmBoRdMxXK+JG2jluLWa5VS1zjesDtIO4P3CxJI7o0?=
 =?us-ascii?Q?iHY6J24t/CcjQ1gree3JQCTChPRDMX9M/7nH2bg9ADHtidwnJZb2CzjzoReA?=
 =?us-ascii?Q?3NNTPVC5brOrGGmhg8FMiO77AApHJ51F/PuciOW3kmA8dl/cJnEQVRf6PSJB?=
 =?us-ascii?Q?vo0MtT5a4GzQe4gzC8enrtpHCbWj2qpOqoqdLAYxuAb1bZew1BewvMaC6kXG?=
 =?us-ascii?Q?N0oebxM28DHHlVnlkmZ22a0fRRll5o2ZQpoyYABEt8oR78c7XrFg1eq76zlN?=
 =?us-ascii?Q?uuKSD0U+2Wfc6warZOG7mquQZbkRr9OaCEy+M4cbm1gt8/lozgjLx6EYpDgm?=
 =?us-ascii?Q?V9zYLvuwlUuwT8qWJSStslspdhOxRRKl+UhIls/luaal9HRE5bcvm59Guql3?=
 =?us-ascii?Q?+OiGjeSj6PsBFQMiSjquwMUd+bvAxrma+CwkBGLR4fcuUPmQXy8kS7oQioM/?=
 =?us-ascii?Q?Xxv8zvUuSzIFahAQA8wgFQ/R0qa/xohAeFf3POKRxfp+7/OSW1MZrMLNbKgr?=
 =?us-ascii?Q?dmTIceO9YvjWiS5Es/wFAeuzJTpFPiDdftSJnXJ0Bc7pS3fw+N7MfCSIfltc?=
 =?us-ascii?Q?5d/PXfXxREJbIfG1N9LG++a02HnDIcduOUoWQvXSGQ7Ax1JdZ7eAGQ2SqQlL?=
 =?us-ascii?Q?ZpT1lfbR2naYgqnxm+ziFLX0LfdGtf9iJDOARk7RWMH8Q59ni13rQW4uctYj?=
 =?us-ascii?Q?sztvIiwChocnlhbFOU98TZN9Sl5GUj0i0Ajcbo5tMqA1E77bqBUuPGam3rj3?=
 =?us-ascii?Q?Hm9GsT80f6z6t+LfW0o8IzDnIAFTLbg4cbvspxxfl4o9Ox7F+iEpDsL6cuZ/?=
 =?us-ascii?Q?XEWp0pdyKe3/UIfvMDfbR4DOQtnS4+5yuDzJFYGbywhBBirvpYzOSxk3g/EC?=
 =?us-ascii?Q?E7yWxXXsUTkVsTMsvh/tu5iSQNXdS4jrvIb0YKQv5St1xg=3D=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB5PR02MB10213.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?4/Cmhcr763W97365aiINS8iJkzfy0OvOL6K72usjKqy8UXQL06y4ATK59f94?=
 =?us-ascii?Q?PBPa0b6udBjSBf52rMfXer7yL7zNuBm5WvOVeRH58M36Y94QAT8FAPFJUy/C?=
 =?us-ascii?Q?XyPDGW9cbwqVUwp/TOY5hCZq2tyxs2hFyPrg7W3W5HLWQRE5Ci0sDVpuHRUG?=
 =?us-ascii?Q?jRBqKfqSkff+jQK1oux3uVfQCvxN7zjNHlS+Q6kfvZYvrEjh5aDZ2qL/OluX?=
 =?us-ascii?Q?rnk0riqSJ8L/Ae5EMVQdcKSlRQpL2EH/V6Kny5yu1saGJna8bcc+ipU86ES5?=
 =?us-ascii?Q?yIsbos6gTNPJZbKYBXX34q9csk/qsetRJVPDTmDnuQcBgBf9r3MCarVkwDGR?=
 =?us-ascii?Q?RZohb4jHIaKUQe4RRwSu1u90Of2QErViUw73AMSynyTI6Fa1NlR2l/cZ915+?=
 =?us-ascii?Q?aQi4w2wmXLgBr9PUzaam9hCYSOHb4AyOPAYBe3OH+y/E1QEVZThiIP/8LtYi?=
 =?us-ascii?Q?83i9FzNh91FYJPPNJP1OKSnVEJfq5cyigNq6oohhu2Z6+CysmRHLgmOoIcmP?=
 =?us-ascii?Q?6n9oCz5355vSWOv5xDECDMC6rO3uzr35GIXW5Ca/BXrTJFQ5++XpEFdSYoRm?=
 =?us-ascii?Q?wo+0zR9U28fOeI0Ed14pmi0EDuAmv04jtxlVQX2DNtolHhWbUHB86f14RI1E?=
 =?us-ascii?Q?9N65x8/ADrBrPRmWDLiX4jCDv0OeFQwQxB1M5UakX8/++VEA52MLxqzSON0P?=
 =?us-ascii?Q?KhV2k9+sd8YW31tw7Jw+1RmqBPa3pd87rO5KR5KdmqbWLUTBNYQFfFc7CLJa?=
 =?us-ascii?Q?V6FiT+gG8OhiEL8cZ40rlia9iqZfymZnVjZcX8wJLDsU6jc5VYXz833smiih?=
 =?us-ascii?Q?dnMPSPhPc+eFg67/WqmroifdxEwYGVQKnJnVmvoTGwJTZk01EOR3B0dWHDyI?=
 =?us-ascii?Q?Jd15l3K6haz5v2ICklaMxJi/+FrLDhhwDFfRUh7uBX7Fudtu3J9o6vbXfit8?=
 =?us-ascii?Q?F6Tsykn5QLsBsetWjAbYL+e3EtnpfYc8z+hg9IyzGWqcWtZV5Nt8Bi4ZiZjW?=
 =?us-ascii?Q?WEGCXvcdflZFPrdNVDrzRreceOj69iD48RYFq3hxbBA4saHyvgRLFbOZhR6V?=
 =?us-ascii?Q?MKZEAj1o1wkM9JpXRkByuLcrEl+g95MG/vqZmMgZX//N9dQNehSoMacOimUw?=
 =?us-ascii?Q?CWfAzdfEmNgj1zACX5LN9s5kLtdHDQrYgSfGjTgS/yf519Ru6/KWF/0N7nCI?=
 =?us-ascii?Q?KKR/XEYqYNz9naCCOGb52An/5BDhwD8ud0CMVZVH76xzD1GZW9tWlTFvLbRs?=
 =?us-ascii?Q?Cx3EsHwedHq2gpQJZQ48S0v6hsc3ezp3Siavi5UdYSplq7RXsASSucByEkTr?=
 =?us-ascii?Q?LcKK2N+WU3JnnYtG6iT5DkpFnehE+kLYx/PDchIo0+d4rVlpit6ggu7JUHOc?=
 =?us-ascii?Q?xB84IIxqZm3d195fJh1H0cIYJao7kZ0ocvrk7FleItr42IZ+D34mUr1AJ+qD?=
 =?us-ascii?Q?k5XwobzNLdb+7X0oyS+riuKa5a+2tKd9VjiL4XEYj29dmt4qPz+JUbi6qtmu?=
 =?us-ascii?Q?jbPIV8EBVWwyv2v6oRBrOjqwlfJ6P92Y7VBc3F+VAaK0lupT0Qr9MCxgWhjD?=
 =?us-ascii?Q?qhiVRbLSrP7A2CFi1/A=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB5PR02MB10213.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d9bf8dd7-aa54-463b-7ff6-08dcdc0250f4
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Sep 2024 19:02:48.5664
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MOCYBs323feY8qFTsPrWTr8mOQP/FgE/G/xrTWxMbzWNRxA8tTAhUz3xBLmQw+Rg
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR02MB6827
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 23 Sep 2024 19:03:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112463

> -----Original Message-----
> From: openembedded-devel@lists.openembedded.org <openembedded-devel@lists=
.openembedded.org> On Behalf Of Yi Zhao
> Sent: den 22 september 2024 09:36
> To: openembedded-devel@lists.openembedded.org
> Subject: [oe] [meta-oe][PATCH 1/2] protobuf: add abseil-cpp to RDEPENDS
>=20
> Since commit[1], the libraries of abseil-cpp have been splitted into
> separate packages. When protobuf is installed into the image, only 48
> abseil libraries are installed as runtime dependencies. But the output
> of 'pkg-config --libs protobuf' lists 66 abseil-cpp libraries are
> required. Add abseil-cpp to RDEPENDS to ensure that all required
> abseil-cpp libraries are installed.
>=20
> [1] https://git.openembedded.org/meta-openembedded/commit/?id=3Ddd6421e65=
eb75c35a904f4b487ba022075035ecc
>=20
> Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
> ---
>  meta-oe/recipes-devtools/protobuf/protobuf_4.25.4.bb | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/meta-oe/recipes-devtools/protobuf/protobuf_4.25.4.bb b/meta-=
oe/recipes-devtools/protobuf/protobuf_4.25.4.bb
> index cc5204de4..354b3213a 100644
> --- a/meta-oe/recipes-devtools/protobuf/protobuf_4.25.4.bb
> +++ b/meta-oe/recipes-devtools/protobuf/protobuf_4.25.4.bb
> @@ -106,6 +106,8 @@ FILES:${PN}-lite =3D "${libdir}/libprotobuf-lite${SOL=
IBS}"
>  # CMake requires protoc binary to exist in sysroot, even if it has wrong=
 architecture.
>  SYSROOT_DIRS +=3D "${bindir}"
>=20
> +RDEPENDS:${PN} =3D "abseil-cpp"
> +RDEPENDS:${PN}-lite =3D "abseil-cpp"

This defeats the whole purpose of splitting up the abseil=20
libraries. What triggered this change? Was it an actual=20
runtime error, or were you only looking at the output=20
from pkg-config --libs protobuf?

Since the .pc files are in the protobuf-dev package, which=20
depends on the abseil-cpp-dev package, all abseil libraries=20
should be available if you are actually building on target=20
or with an SDK.

>  RDEPENDS:${PN}-compiler =3D "${PN}"
>  RDEPENDS:${PN}-dev +=3D "${PN}-compiler"
>  RDEPENDS:${PN}-ptest =3D "bash ${@bb.utils.contains('PACKAGECONFIG', 'py=
thon', 'python3-protobuf', '', d)}"
> --
> 2.25.1

//Peter


