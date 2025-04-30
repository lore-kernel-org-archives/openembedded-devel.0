Return-Path: <thomas.noack@iris-sensing.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90133C369D9
	for <webhook@archiver.kernel.org>; Wed, 30 Apr 2025 12:11:00 +0000 (UTC)
Received: from FR6P281CU001.outbound.protection.outlook.com (FR6P281CU001.outbound.protection.outlook.com [52.101.171.107])
 by mx.groups.io with SMTP id smtpd.web10.15358.1746015052303788884
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 30 Apr 2025 05:10:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@iris-sensing.com header.s=selector1 header.b=mHTBtOh5;
 spf=pass (domain: iris-sensing.com, ip: 52.101.171.107, mailfrom: thomas.noack@iris-sensing.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZPANqR6g+rI7JwjIMk+V8vMhuzAqhDaqMwsxT86wt5pQFTpHqOYszwKC1RqpQ9dsfBM6wMNF2UYh4lzWTBTZ1oUKdN5eEMxydBSyhn8tf9kp1dORMUx9i+2bIlNAusRr+ZmXA3jTxDyh8YpntxRdpVli+efz86SUtgY8uE/I81qk2lxMg4NeS8LnYAvd3PCPgzP8icpnIqjuhevB+rsOPBoUBMafEAzYFIT9MmfUoWdA4sZaKS4EXWl0s8HdEezMO6iuAG4cuak+kbR7FHW8aqP2wgVWuSYoLvuAEldEYpVmmOXjQ4ftSTIWCNvankUcecZ/dzA/WnoRRrQ7H0t49w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Sp1q+GvVIWYHab3VvgsiZlmNV2uR3mUvFHztltJxRTE=;
 b=DS2Ga/8WS4XsFzD8U+yggHKin22K7z4CbetskD4JZxOgQn7sCP+0IaoUkq6FmiIFlVGw7RoDuJ4gTkBCx/7N8eQurUbUSqbbbXuHfTK0GwXRtpdF2RyZn8ZEp9YHf+4sE9Lc9gNiQoT/648A4FDy+a8e5MK2BXCf9qkZbFhbX8P2coosrS0nVNBA1hai7+0MvC56zaiY62QJp80JgoV6D/VtSSzp6+ZGoRL5bjzHRb5dhVaGmGLLdCXeub7UEWaoW3ybVO4Z044Ktci+Q+uZUNAbBhHZk2xFeHn9ZD6poMLqgmxk/EMgdC90mLYYMKYPUs2CA347IucxB6qoT5Fa2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=iris-sensing.com; dmarc=pass action=none
 header.from=iris-sensing.com; dkim=pass header.d=iris-sensing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iris-sensing.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Sp1q+GvVIWYHab3VvgsiZlmNV2uR3mUvFHztltJxRTE=;
 b=mHTBtOh5NVA3YTRKfxQjcJDAynZ1KFlK8JbNbrcUATJkgCF1u0TqxhtWTtt+vnIPh8QPzeyrCWk9DR1tZrnJ8NA9C0L0QJEcfZlL1ruo8VpaG7k1sC3jIq6Lt4bnEBEhr+y7BfPRIxij6lHGASDpqJxEA2GopghxVeFQczn89wlAZR+9xINC2lCMhhs/Fe6SH1oFZ08w1DO+oqWpN7zcCvvK4CyZVkXacn3aWm7MqXFzp5nvo7Q2mnLMUkn90asbiMM72M+3kRe5wBdfIBtkIX9604up2Nqhoge0ySw0N7dxHIO0dA2T8Cl6cdE5uGZf6YYNSZ/qywvoCdaOZ7I6BA==
Received: from FR2P281MB0121.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:11::7) by
 FR5P281MB4927.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:152::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8699.19; Wed, 30 Apr 2025 12:10:48 +0000
Received: from FR2P281MB0121.DEUP281.PROD.OUTLOOK.COM
 ([fe80::be21:ed94:e834:92d9]) by FR2P281MB0121.DEUP281.PROD.OUTLOOK.COM
 ([fe80::be21:ed94:e834:92d9%5]) with mapi id 15.20.8699.019; Wed, 30 Apr 2025
 12:10:48 +0000
From: Thomas Noack <Thomas.Noack@iris-sensing.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH] sdbus-c++: Upgrade to 2.1.0 release
Thread-Topic: [meta-oe][PATCH] sdbus-c++: Upgrade to 2.1.0 release
Thread-Index: Adu5yILqKIvrVlGiQf2TAGRvkxgivQ==
Date: Wed, 30 Apr 2025 12:10:48 +0000
Message-ID: 
 <FR2P281MB0121CBAFBE8CD25844976884B8832@FR2P281MB0121.DEUP281.PROD.OUTLOOK.COM>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iris-sensing.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: FR2P281MB0121:EE_|FR5P281MB4927:EE_
x-ms-office365-filtering-correlation-id: 375146f3-d05e-4067-8c8e-08dd87e00b52
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?paZhlCleBTEBEIApjMCx7Wcv9P1aX7YWGoC5Uz2PK86ngWdBmhFI3KpI0nh6?=
 =?us-ascii?Q?hXqyE2mhsIDj+uqZqSpr/SrLp5V5z9F8q7pcJ1Ym1rZvscKFTGH8GljY3MHR?=
 =?us-ascii?Q?G2mX9HY1snPrvU2z8qQWnL8PDVWWoqjc4eiY1qA0D+XUOOBQfIgonrvYlvZU?=
 =?us-ascii?Q?F5Lug+b83BJx25FhABkLlEQbBHiW95LIehaFqHBkgCS1r40CDaNxUwmCy6W/?=
 =?us-ascii?Q?3a7alf7N9gfCFTMo0NzJAj+BrmIkLSQXu2SSn+zagpAtP9e5oU9to97GwOFF?=
 =?us-ascii?Q?p+ubIK/GY0jcIr0Tu6MuMTCAY7SBiM09Z/RzcKOiaKbLRcK/MAY2whEfecn5?=
 =?us-ascii?Q?fWu3K3hQ0ZeIe05jhWbEikjhTdWR1quNm8299imwmkX9CTCCcu2M/mCOvpVS?=
 =?us-ascii?Q?7AE0lGoS2OjptEd535hs/yOxnB85TUnJeGx6Sb3NAoVZh1hHsGhEeIGtKmTv?=
 =?us-ascii?Q?Z8g/ijegNj75M0CgICiGf/5eXhnqknTGxwVaabBTbrh4ODB7eAZrH19qXRdz?=
 =?us-ascii?Q?W7w7PUZRlhsQwICCZcweJkXLfDADZ4COmMAehorWpotRlCD+jmU7h7crkWHN?=
 =?us-ascii?Q?1RW1vj/eK+SwJ0Ac5a3Gt6MJhU6aKia8fvALtX7cATEr8q5d+mIpdjtL/TkY?=
 =?us-ascii?Q?W5uV43CvpET9dBlqwIPu9UTEyoMWvtQpglp5zw/lyLNqK5TmGO3cA/trME7e?=
 =?us-ascii?Q?248gSAKgtNKo07qHND4sJgBTpoehEIYWMev2JXTZ20MvijxzlgQR6IpK7mhf?=
 =?us-ascii?Q?CiMHjUanwfVYZxsWlH0wLr5p1NDSnmtJlemkMtmzCrXXEVE/rIMnyEpMK2cA?=
 =?us-ascii?Q?8lA7lXQaCySiPBLWw5EnO1SahPsBQ0hS0Yj+0puU6A+KY0l08CP1dZAawqCs?=
 =?us-ascii?Q?vxHZW3zZ+SIs6GqH12Lk+iq7nBdRjClJG/6n4EQGvcIHiu6riKCAd1kF2DfI?=
 =?us-ascii?Q?w5J6TcG8pPhlZd/7+MUUI3D2Xo21FqxdrVvq9cL38Px6O2cQakkeh4UNgPX9?=
 =?us-ascii?Q?g0EFIPoLBDd47HCG9V2tuqivhg25FWtx7nxzsp6Pylwhf8Am3i4EXrxT2kXo?=
 =?us-ascii?Q?QsjNJcZZNb0rR866yDko6DIFsbSGMHYhWg3RYOFfvdku0h9oN/FnvovljdzQ?=
 =?us-ascii?Q?IdlxHph2dkvseZHlFNawsRsdCp9VHNRTPOCY+eVZuDSH5rnj1WL0I+nhpaOv?=
 =?us-ascii?Q?1zXujKJZxPJ6jouDsxKzzzGBXe00QjjvPZiCINAU7jg20HFo7ri9Fz8gYwJZ?=
 =?us-ascii?Q?30Sx/SBIMqN//mY8SZPVjzTdquTsEaIv2hzxYzopADCK1G7XARbLu4Za5/Hy?=
 =?us-ascii?Q?QeQCEnZfDcbJ+MzDaJRTA4Lotbfn0L4Q0XXDYHkj6W8nrDK13Mk5mWgovzij?=
 =?us-ascii?Q?Fp3Tei0zsZSmLbzAPyIrV9hiJb93kxNs8XvQPY9ugUnJS5DG5wSfGim/1VIY?=
 =?us-ascii?Q?gF5nnaQFHEZH7TIyZ+diyuR38w7DJ3r59fhmNBTgdtbjF0/PFdwRmg=3D=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:FR2P281MB0121.DEUP281.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?naq8V8n7ZErJDMK57oVwwftwJj9ndZMsiWsOlG5zroE/SKUEdSeZTbFMID3S?=
 =?us-ascii?Q?xcPyej1DvMxVLhSU9oVQhv2M35Je9e/b3aDNfHMR4KBP16C37efKcOL0Uojm?=
 =?us-ascii?Q?VbaTvWsOEsPnjee9IWr2tHVHts8nNirjaqmIyQqHbpAQ6hCZ9FCqaRiP6Ofd?=
 =?us-ascii?Q?QcJkF/7QL86fgYRYUwfOaykf9zC2StdUuwhqlSGeZdSjTPJz6ft46ba5DQNn?=
 =?us-ascii?Q?L5H7MRKkEAehhSgxxxvIC5XqiPd5EcI7xgs4ha3IbnzYL3LQX4wFouENh6ro?=
 =?us-ascii?Q?hi16mFmdMlTrMHBA0VwRWZRQ8HhXcA1TkDbipVk/pnw4BrY2A8lgBjgUEeKm?=
 =?us-ascii?Q?wgaWmIuXCjdWRZEEXqjf9JXcYNrRzrGBrI/NkzWWjSzkzDWBzK3aNAjB7GKj?=
 =?us-ascii?Q?37f4+0G6CNlzazmCpR0gXV3QNzoZktWDFK2PddqRqD6fbYeAo4S1LJ2qFbj4?=
 =?us-ascii?Q?7RlZf+AYcefoRBHHJ45GqNE+cLh0EA7ECgZ0Uqvi0kDgp0ahCSfyVlpIdRkc?=
 =?us-ascii?Q?Am5SDdWbdsuBWn/B22o221ouktVlRY/yMCvE4NdMxRPLrRIdjnkEFpN1y/qH?=
 =?us-ascii?Q?1ngt9Yx7Dmoh8kxtz9wAN8NML38q88EcDDsC3WxKmet0r3J1zmP8R28t0u70?=
 =?us-ascii?Q?5EZSKDyYf9jkBlI1G8U0f+6NDSIc3i/TDNjtlrYwuHHlVYvA9k/RJhBEcK2c?=
 =?us-ascii?Q?Zmit8AgTiM0FV0Glt1uuuzexVbwZsyp7668GinqajXOYjXI4IS8DXJdN2qt3?=
 =?us-ascii?Q?KYmQnubm9DzOUZiZT6xmFqbgJSDkiHtMS9WN44UyP0nj1/qhBotjAxsSoNbJ?=
 =?us-ascii?Q?ElyG6vWK/BOa0U3akIfFvID651QPrd6g+bG8DFL9aBKl0Gcz6Son8icCMk1F?=
 =?us-ascii?Q?wj6oZWk+Flg/gcjvwHisrZQUh4WLUI/9eapMmQWVsKbU0innN/h6YENd4CfS?=
 =?us-ascii?Q?zouZKACTkaW6ooLk3VjI0Gj9Ur3nGBKpCeukdzVlv04cI655x/3LVNlUKOJj?=
 =?us-ascii?Q?d8OqyTH30ZbAuObFEqn4pbF5WAY4EGGO2W8e1hhnvWIMsJltlc5kdrfQ6cZP?=
 =?us-ascii?Q?D69P494t5wsnXZz3GBQZlHYNWgfOmZMbRC9sBET2xC+bwjKglus0CDT5ZfeA?=
 =?us-ascii?Q?jlavaanHgNEwF0M8tfzM5aXl2BcCx1lcH2jQH25Leriodu/Gdzj+oXLdO3lF?=
 =?us-ascii?Q?uOQU40oOiGRhhaZfnUKX6+VQWdO5tFPXw/xY4m3kGiFX0mwlUyDKmYeMq+FB?=
 =?us-ascii?Q?Hi+OXTmNKScZKawswLhUMcKkFNDkk4oA2cLIn+S65TxWyU171xrBhifM4EO5?=
 =?us-ascii?Q?hznxF6xuPe8FkvS5TtUVMzmS2LyLqjMQSbZymzJ/5ffVmdeKlbbngqbwPs+K?=
 =?us-ascii?Q?DskcAY0wIKrGS7YPTi6nKUOtFDmEYJhp0I1rbcfueYg0cMIoeRTwT+xAFEJB?=
 =?us-ascii?Q?yQbYHWZv4q+Vgo0N+pjL80lX4YetPqjGRar9gOqnHqnNK2TKrhn4qDhHB8C2?=
 =?us-ascii?Q?dFarm2kYhmWo0OqGfawChqV2dgWTopvY0CqyqlqhFue3bcKJ2gjDj1r0z9bu?=
 =?us-ascii?Q?pqy83EAIJ4YKI2UMnWnA7KoT4coifTcyGOXiYY11KVmuRdmMZY46JevK/J4c?=
 =?us-ascii?Q?zg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: iris-sensing.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: FR2P281MB0121.DEUP281.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 375146f3-d05e-4067-8c8e-08dd87e00b52
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Apr 2025 12:10:48.8721
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 963f3913-ffae-43fd-856b-2dfd3f6604e3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KTbhl09kE/S9Lr4Wt7YHgyUyuL7nu9zAyBEHvyTlNBn+zIG0j+lFEo9PCL9qvs6cgKarYheu6h32L87yUDz+w8shuTTsuJ0Zme24SzrWIPc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FR5P281MB4927
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 30 Apr 2025 12:11:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117252


Signed-off-by: Thomas Noack <thomas.noack@iris-sensing.com>
---
 .../{sdbus-c++-tools_2.0.0.bb =3D> sdbus-c++-tools_2.1.0.bb}      | 2 +-
 .../sdbus-c++/{sdbus-c++_2.0.0.bb =3D> sdbus-c++_2.1.0.bb}        | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-core/sdbus-c++/{sdbus-c++-tools_2.0.0.bb =3D> sdbus=
-c++-tools_2.1.0.bb} (88%)
 rename meta-oe/recipes-core/sdbus-c++/{sdbus-c++_2.0.0.bb =3D> sdbus-c++_2=
.1.0.bb} (97%)

diff --git a/meta-oe/recipes-core/sdbus-c++/sdbus-c++-tools_2.0.0.bb b/meta=
-oe/recipes-core/sdbus-c++/sdbus-c++-tools_2.1.0.bb
similarity index 88%
rename from meta-oe/recipes-core/sdbus-c++/sdbus-c++-tools_2.0.0.bb
rename to meta-oe/recipes-core/sdbus-c++/sdbus-c++-tools_2.1.0.bb
index af112ced88..10704a6cd3 100644
--- a/meta-oe/recipes-core/sdbus-c++/sdbus-c++-tools_2.0.0.bb
+++ b/meta-oe/recipes-core/sdbus-c++/sdbus-c++-tools_2.1.0.bb
@@ -8,7 +8,7 @@ inherit cmake
=20
 DEPENDS +=3D "expat"
=20
-SRCREV =3D "e62472b210d9e7f06a5e611c23471d414c99a99c"
+SRCREV =3D "0261d0ec60b68c1f0a6ec9acf63d1379f7d569f8"
 SRC_URI =3D "git://github.com/Kistler-Group/sdbus-cpp.git;protocol=3Dhttps=
;branch=3Dmaster;subpath=3Dtools"
=20
 S =3D "${WORKDIR}/tools"
diff --git a/meta-oe/recipes-core/sdbus-c++/sdbus-c++_2.0.0.bb b/meta-oe/re=
cipes-core/sdbus-c++/sdbus-c++_2.1.0.bb
similarity index 97%
rename from meta-oe/recipes-core/sdbus-c++/sdbus-c++_2.0.0.bb
rename to meta-oe/recipes-core/sdbus-c++/sdbus-c++_2.1.0.bb
index a3e7c9ab54..a81d94d2aa 100644
--- a/meta-oe/recipes-core/sdbus-c++/sdbus-c++_2.0.0.bb
+++ b/meta-oe/recipes-core/sdbus-c++/sdbus-c++_2.1.0.bb
@@ -17,7 +17,7 @@ PACKAGECONFIG[with-tests] =3D "-DSDBUSCPP_BUILD_TESTS=3DO=
N -DSDBUSCPP_INSTALL_TESTS=3D
 DEPENDS +=3D "expat"
=20
 PV .=3D "+git"
-SRCREV =3D "e62472b210d9e7f06a5e611c23471d414c99a99c"
+SRCREV =3D "0261d0ec60b68c1f0a6ec9acf63d1379f7d569f8"
 SRC_URI =3D "git://github.com/Kistler-Group/sdbus-cpp.git;protocol=3Dhttps=
;branch=3Dmaster \
            file://run-ptest"


