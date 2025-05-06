Return-Path: <thomas.noack@iris-sensing.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5AAEC3ABBC
	for <webhook@archiver.kernel.org>; Tue,  6 May 2025 14:50:35 +0000 (UTC)
Received: from BEUP281CU002.outbound.protection.outlook.com (BEUP281CU002.outbound.protection.outlook.com [52.101.169.131])
 by mx.groups.io with SMTP id smtpd.web11.78181.1746543034568490926
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 06 May 2025 07:50:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@iris-sensing.com header.s=selector1 header.b=on2oMtwS;
 spf=pass (domain: iris-sensing.com, ip: 52.101.169.131, mailfrom: thomas.noack@iris-sensing.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cShoxtDL5ywfuhZkLVbxF7JQUvJ+WHUmmepVq7B1kR2FyvNtig6mfeFPqpdK7lL9Na/YCek9e3YfmMFC4y76sq67FMFUE+EKj6XBWmB624km/AlY0H4p7XcHDbrRnAQc/p1OsP73bktMhKN/WtieTHibRhtQx2dZDTKFmjb15YtQnzCWPstwZkkvGKs0iFWVfr6tOue8OOYnNcYy4KBvTSbsV90m6AGWLgwXKbMvFblA5wROsXmrZ/xoQCbzquOytKjo5byKuwhSEFSTlz62MPJAZYXWku5JtFgqrAv1RwGSh0hflrqCWLhffZcVT5A6AIO4rxNAK02yB7vqWevN+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QIcRym36FCVW5OPdE6NsJiyqL+Kk3EDN1a5TMxZ1CLc=;
 b=Kp7Us6az0A1qUu7mTip/ZFbBjN/eK1QVhTk5MyHtSZKVpfP5+AIALOb+7yT2FTmukIQOObbjrBkJ2/h8cfT+l1aV8mQQu4H7P8T30+aD1D4bPu8jTc4hrgjOy9O/W/+S6jUK0ZiYRzEHgdGlMsMCAZ8wfofUe8695LXJZAj1FOAVQK7C7JU6xm/uu0wtbExL9AqiVll12CTh4kD9PdKu2VwMP0KDYxwn56XEVJhKXOle/rhRf4jKYU2pR2z6R0rcj8fqUzFDLmb8RNrRagpYfYa92ngd3iHWPxU03KaQjbfaemwjZyY6/mka0yqSA8Lstq4sYIV1Ysmo6lAgQsw6yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=iris-sensing.com; dmarc=pass action=none
 header.from=iris-sensing.com; dkim=pass header.d=iris-sensing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iris-sensing.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QIcRym36FCVW5OPdE6NsJiyqL+Kk3EDN1a5TMxZ1CLc=;
 b=on2oMtwSmqjHy+Jp5yawVkBWyOncnmP/hdf8THdyt4XsOhEqeBrbYS0cKHCvDdi/8YyQaR1nTlie3gw4TUO6BkHlnPCONR4ifmoRPCaeOj5Q9QI00yzTdsWBmJ1VLzfZ0NnhKNE+j4MkGLLGXdSNoSOySEdi34hLTmbIGvqLqz0ULAja6B/nc0LIqtLdrw7QusN89woOlHji3mDJ0hGC/0GilO2bHoO5+cbmbIgrm/s5qY+P7+rCKScZXJR0kU4SNDnLxHtsAxnNUAqvLFhu9RpTsPH7sQgVU8UrIR9YgB41ZUUU9cgeNBMSFvTQx841hQDvUsu8rfF1TZfgMXsAKg==
Received: from FR2P281MB0121.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:11::7) by
 FR1PPF3BFBDFDBD.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d18::f38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8699.24; Tue, 6 May 2025 14:50:30 +0000
Received: from FR2P281MB0121.DEUP281.PROD.OUTLOOK.COM
 ([fe80::be21:ed94:e834:92d9]) by FR2P281MB0121.DEUP281.PROD.OUTLOOK.COM
 ([fe80::be21:ed94:e834:92d9%4]) with mapi id 15.20.8699.022; Tue, 6 May 2025
 14:50:30 +0000
From: Thomas Noack <Thomas.Noack@iris-sensing.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH v2] sdbus-c++: Upgrade to 2.1.0 release
Thread-Topic: [meta-oe][PATCH v2] sdbus-c++: Upgrade to 2.1.0 release
Thread-Index: Adu+le8lqD4xVRcjTbGQ3+zhoE5TOw==
Date: Tue, 6 May 2025 14:50:30 +0000
Message-ID: 
 <FR2P281MB01211BEEC81D93CA439952B5B889A@FR2P281MB0121.DEUP281.PROD.OUTLOOK.COM>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iris-sensing.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: FR2P281MB0121:EE_|FR1PPF3BFBDFDBD:EE_
x-ms-office365-filtering-correlation-id: 7ac93e90-a5de-4ed2-cefb-08dd8cad58b3
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?VJDxtFucFgHVsRXohuNLBwhWGCHmLnzt9xWuboZus1Nx6fl5GUwFfwVOVUPM?=
 =?us-ascii?Q?R//iPAxy9ADlRc6IfdwANwiCHSLBDrGJ7fjar88oHoQK5DQ/88x6INjUAiIx?=
 =?us-ascii?Q?7aJkbDUbZEgZCNyYRYGzr0uSZEnVkarNZaonBRPPR/22qAUBzQFcMi6ZGfk0?=
 =?us-ascii?Q?pp60lvipGN0IMpI2ty/snA2KScSBPmZ1FOG/fxaUIDrJYmxygi/OJvg6ZXuB?=
 =?us-ascii?Q?Kn2z6Nvl7cQLFcmuAzVagTpcLmCl/mzs80eeMIqPdp5nVmWdPkVeqVjoaaZN?=
 =?us-ascii?Q?Nzlv2dlY4iDa6xU4jRstwgxYQEjpEQfMYUs7hX6T7StBI3y/6OAyU5PhTWCV?=
 =?us-ascii?Q?xXseqA6tQyOncG9j7usaVK+d7G/r3CqcQ6PrZ2MGHOKznvt1NgmOYFcSG9On?=
 =?us-ascii?Q?IZ5rZ0PN1ZHzvayV6UC5jJh/hsBfZ6GEa6r10zBjkvnxYkfjvz1GWxyyeBEg?=
 =?us-ascii?Q?l0iOziW0fcBVmxLkRZ0zqADthPR0L8upkjkSC+fWbY8mkY0mZU+MV4nQRBPB?=
 =?us-ascii?Q?SOKjcYEs8CZm9otlFMga9r0fL192g4EqEBoK9bVOFA1YWWA+Bhf3XwvDkCOo?=
 =?us-ascii?Q?0UsVi7c7AZBBdMLpkF5FCpbTkxacLQEnVouyeYz9tL+wzdiJrFRjNd/nQoYq?=
 =?us-ascii?Q?rKfe04Z6Jwc0FJKSoGvYLauv29/eyyJLKVt6Npns4FwKQu+2n1KlkD9XA5sr?=
 =?us-ascii?Q?CYkNM3dBBE4I5uGPE/frTgi2I5hQe3+QJRdRCQMr4d6ezl6uC4iV4IX645LM?=
 =?us-ascii?Q?H9f7Jgw2hWxL2URjd96d71UEWEnf137cXhfiHAEDUrdk51dp8t4GpX2RYg5K?=
 =?us-ascii?Q?uV7XgoIRo7ibAJw2EnPi+MBlMAbbmi4kFoUt+oOKirrDblMCcgnqcLon6HvD?=
 =?us-ascii?Q?V75C0fZVWBgLestU52IfgvFYK4yclJWPifw2hyNMkK/8GVmb1HAb8GQkqRiK?=
 =?us-ascii?Q?1ooncbFL2gwR4+kVgpxo4M+h8VHnbJXfzcwEaESz2R1XxSAWjEbGZQMZtJ2H?=
 =?us-ascii?Q?PL2T3lWfZVZNDd8IU9JYc9vRBwfBe/74hA3LiFxutYGw7brsy1lP25IMXVOY?=
 =?us-ascii?Q?iA+GfT70e1mq6W/MR+4erRa7+ivEiGalNhyfT3kyir6JHtFyjy301WZHej9p?=
 =?us-ascii?Q?IqpewEoBQgrmdtaUW3B7RYV8qrpVJV9jmErEZQbxmV0YD06LsFdXfVBbq1id?=
 =?us-ascii?Q?zK4IRCDCv04UQuhXpTCASNGFRoIZYaXGkYj/oublGZsS80iNMCbqZgqZeBTs?=
 =?us-ascii?Q?ZM8y6z9fT93zNeyNX2qFG7k6B+bL2caJ+wKKu2vp3hDzeMKeDzcUel4Bwhjg?=
 =?us-ascii?Q?LeSZsbXo4wvMLRyAqn/T5MrHuVvtP8a+HyZ8cjYSEMFZ6IKqa+x2Ue8cNbp1?=
 =?us-ascii?Q?dtl59hjzucCtQVcOhXtCe6yPRdsuWTO/ZdLTaXmLMdD3e4pp20orctZW+6DI?=
 =?us-ascii?Q?hsFJLF281oi1aCpcDUqQYQVUUEDpLF8N9E1RZsFwdo88ZyvA/CXw/w=3D=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:FR2P281MB0121.DEUP281.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?a4hPAJPwY4NcFbnLQdjNLUhigTHIqDbHHGOpyN6C1zAQlRF7WfK47EFHohh6?=
 =?us-ascii?Q?GjGQtn3TC2d+fNFtU+r/AMuJmFG3teItuVBf+yy40osTjrIh9zX0BTEa1gpF?=
 =?us-ascii?Q?vii5YGAzKaFJ6zpAs//NX4EoUSct7omIfFifeAIMJrtxixLCMblFVpIlPFhT?=
 =?us-ascii?Q?4iOOBkHCJCvhKKKungQbyT3aBkTi8j/QRvsdH1C+BEpZTAuJaUnSMPs7r/Jq?=
 =?us-ascii?Q?YAmSxaA5XnZX1C5+h7dX63PcMbCgrtw4WeEO+IyWS23ocEi6vy3tu/sW8lnZ?=
 =?us-ascii?Q?Ut/CXuJhcCgyb/HKDc2lEfYOi29XYMTOwD0jk6anb1XmNTBlu48wY2YddUHx?=
 =?us-ascii?Q?p8ZzL6L78I8U31JUv5vOAvCXuETP5yz3Wxz2JVbHe8ZFFblzhuvswfKhkL5T?=
 =?us-ascii?Q?SgENmdgmCiqKvVUF9YHaIlN0hUoQwO2bCD5T36E7QPoqpGstApgBN2UWaDiB?=
 =?us-ascii?Q?20EKiU+onjXZfm0i9pzE4ShpzMs5cz+xTGpCP6gLVvpYm/mZ6eJ6vpk8ixNl?=
 =?us-ascii?Q?IAG1UXcLFpYBUODawWLb+EElS5npHRJQWPuhrNWXjMV+jqhndVbHM0LKSQ4V?=
 =?us-ascii?Q?65Ymb3Ofrm5KSQ2xTIqWh4Dim4SXT5CgfizlM5R1IIrkU1BiQbQImLy0/uMI?=
 =?us-ascii?Q?TI0cUJp6oQr+attgYS7IIxWoevchNsxGNDs7UPwaZgoNlSuuEK36NqCWzwzZ?=
 =?us-ascii?Q?PDsVy1/iPTgwptKDnFIZSwxePjxc3zbs3iMC3Sf4+FVdoLwfijwS41kofRoV?=
 =?us-ascii?Q?rGxeevfinv3/0MEYwjIOLJotJIjWKfbWJMiTJmF5NNoPjs7MJzu7MpHujH+m?=
 =?us-ascii?Q?51f1fJA5eck5oyaCmVhgWvvSU1KYi++CtlslenQdTvwlpYGAMCfklQKs3RdP?=
 =?us-ascii?Q?OietTHfHktiWITn5/pqKvidSGncgaanvtOcitvZ4bL6VuYP8MrYXi8rE2+Ix?=
 =?us-ascii?Q?S85LOIBF9CmzDeqYKGXbUiUC8WtgiUJ3gBEhYuYH8EDnfBsyIs5xCfvOMbIU?=
 =?us-ascii?Q?woESC+ObaSNF8NfuXZaQc2yjcOxwoA0I2ljMaCIVAhbxW11mfao6k+15aQf+?=
 =?us-ascii?Q?he0NHnzdQDoYNKrqbfcBlKHg1+C+MVoxjVpGkI5rTsup1+AW+lM15UqMXRsF?=
 =?us-ascii?Q?noZIx7Unz4zENytdqr1NdfzZo6E3wijhGlxZ/P4nepx8GSuUcn+78FDum/xt?=
 =?us-ascii?Q?rHkcMwe2yagwFGfUmZ5+0enq+rHUWJeR4xsZKEkEJpClgTovPcz7WP7vLfYo?=
 =?us-ascii?Q?BLaqFaz05WXoHdbf2zuVXyipI7Cn72gKy7S61qCAGGXF3HK/5yvZvTFuk/5J?=
 =?us-ascii?Q?wgvCujZLDWncde6XizyWjlz8RJIVCdOXWO9T1jnE1dh++SYLsbuM3k5B4d6G?=
 =?us-ascii?Q?HGSfOLL5NVjXsbRWWS3W1bwmWKB73zjTQgqzyXEN3WFVtUNP97mlmNIqWxg2?=
 =?us-ascii?Q?fX9pGryhuj41UQ1RhF7w/lEv4mwcw+YXWCq1VurCJPf1EeTi56kHYidJ1F5H?=
 =?us-ascii?Q?dcpgXMWgU0euqJbKKog+Rq8YEOdADESuOwGUFpVfvGr/i0h6FKkhwHcn+qtF?=
 =?us-ascii?Q?8mQ7xBejVZmm+7UUqiCjhihQNHlhsRKd4dtbOUDKvs6CW6TwPgym4lYYYbYn?=
 =?us-ascii?Q?iA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: iris-sensing.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: FR2P281MB0121.DEUP281.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ac93e90-a5de-4ed2-cefb-08dd8cad58b3
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 May 2025 14:50:30.1288
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 963f3913-ffae-43fd-856b-2dfd3f6604e3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ay+Kwc2LEKlYWUzMkXQMtO7/1kPQ/AEVV3uT+NOnmisEzjhQH+wS0tyyF/Po+xZYYiQAZ1JZpW2b3LB5/WCL+hE5LJIuxc3E6iaY17ixm7o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FR1PPF3BFBDFDBD
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 06 May 2025 14:50:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117353


Signed-off-by: Thomas Noack <thomas.noack@iris-sensing.com>
---
v1 -> v2:
* removed "+git" from PV
* added tag to SRC_URI
---
 .../{sdbus-c++-tools_2.0.0.bb =3D> sdbus-c++-tools_2.1.0.bb}   | 4 ++--
 .../sdbus-c++/{sdbus-c++_2.0.0.bb =3D> sdbus-c++_2.1.0.bb}     | 5 ++---
 2 files changed, 4 insertions(+), 5 deletions(-)
 rename meta-oe/recipes-core/sdbus-c++/{sdbus-c++-tools_2.0.0.bb =3D> sdbus=
-c++-tools_2.1.0.bb} (79%)
 rename meta-oe/recipes-core/sdbus-c++/{sdbus-c++_2.0.0.bb =3D> sdbus-c++_2=
.1.0.bb} (95%)

diff --git a/meta-oe/recipes-core/sdbus-c++/sdbus-c++-tools_2.0.0.bb b/meta=
-oe/recipes-core/sdbus-c++/sdbus-c++-tools_2.1.0.bb
similarity index 79%
rename from meta-oe/recipes-core/sdbus-c++/sdbus-c++-tools_2.0.0.bb
rename to meta-oe/recipes-core/sdbus-c++/sdbus-c++-tools_2.1.0.bb
index af112ced88..c55c305611 100644
--- a/meta-oe/recipes-core/sdbus-c++/sdbus-c++-tools_2.0.0.bb
+++ b/meta-oe/recipes-core/sdbus-c++/sdbus-c++-tools_2.1.0.bb
@@ -8,8 +8,8 @@ inherit cmake
=20
 DEPENDS +=3D "expat"
=20
-SRCREV =3D "e62472b210d9e7f06a5e611c23471d414c99a99c"
-SRC_URI =3D "git://github.com/Kistler-Group/sdbus-cpp.git;protocol=3Dhttps=
;branch=3Dmaster;subpath=3Dtools"
+SRCREV =3D "0261d0ec60b68c1f0a6ec9acf63d1379f7d569f8"
+SRC_URI =3D "git://github.com/Kistler-Group/sdbus-cpp.git;protocol=3Dhttps=
;branch=3Dmaster;tag=3Dv${PV};subpath=3Dtools"
=20
 S =3D "${WORKDIR}/tools"
=20
diff --git a/meta-oe/recipes-core/sdbus-c++/sdbus-c++_2.0.0.bb b/meta-oe/re=
cipes-core/sdbus-c++/sdbus-c++_2.1.0.bb
similarity index 95%
rename from meta-oe/recipes-core/sdbus-c++/sdbus-c++_2.0.0.bb
rename to meta-oe/recipes-core/sdbus-c++/sdbus-c++_2.1.0.bb
index a3e7c9ab54..f3799adb3c 100644
--- a/meta-oe/recipes-core/sdbus-c++/sdbus-c++_2.0.0.bb
+++ b/meta-oe/recipes-core/sdbus-c++/sdbus-c++_2.1.0.bb
@@ -16,9 +16,8 @@ PACKAGECONFIG[with-tests] =3D "-DSDBUSCPP_BUILD_TESTS=3DO=
N -DSDBUSCPP_INSTALL_TESTS=3D
=20
 DEPENDS +=3D "expat"
=20
-PV .=3D "+git"
-SRCREV =3D "e62472b210d9e7f06a5e611c23471d414c99a99c"
-SRC_URI =3D "git://github.com/Kistler-Group/sdbus-cpp.git;protocol=3Dhttps=
;branch=3Dmaster \
+SRCREV =3D "0261d0ec60b68c1f0a6ec9acf63d1379f7d569f8"
+SRC_URI =3D "git://github.com/Kistler-Group/sdbus-cpp.git;protocol=3Dhttps=
;branch=3Dmaster;tag=3Dv${PV} \
            file://run-ptest"
=20
 EXTRA_OECMAKE =3D "-DSDBUSCPP_BUILD_CODEGEN=3DOFF \

