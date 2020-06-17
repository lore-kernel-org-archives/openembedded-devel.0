Received: from NAM10-DM6-obe.outbound.protection.outlook.com (NAM10-DM6-obe.outbound.protection.outlook.com [40.107.93.48])
 by mx.groups.io with SMTP id smtpd.web10.2427.1592355259063997845
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Jun 2020 17:54:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@uievolution.onmicrosoft.com header.s=selector2-uievolution-onmicrosoft-com header.b=VFhE72Dm;
 spf=pass (domain: xevo.com, ip: 40.107.93.48, mailfrom: rrowe@xevo.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C8WhF7Lk7r+P2Af7XnzyOjWxdWyUrWuzej8751OVq6EUPKZIvmHG+S24W7QYYL4IlNkaetnUDiBgNs/JbqL7S6FklT23u1Qo+gGAg9CZ0CztTNclkg4BGRBz/YI0xS1ota62AKmJMguM4tNaq0liUf3yH7m0QJ1r1kaG0fFYcS/XBc7yVV00Qd0NX0pDIBp2G4CXL/svx8euMIYUOsbLuDytv/1fdFNjyh/HaIXcnMud9bar+TOifsWUrOO4TRIRKsJHMpyov/GXWUxQrAwG1JlR01Eru0450k100neR7RPHOs+brksTYn1y9ovF3EbodTtAXIIt05+ua4ITtvkJHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XCVJ2dAtV4OeKu9uZDL13q5YeoYAx7DANbiB5HmSfkA=;
 b=j7HMdoceK/sV11VOGo2FJQQ4H/mPM9Ac0DW6JRx+w/UmBhGHEZHeMKzuxXhTmz1HoFE4t5516R8A3g16j0oaZVYdi55V6wn/732EIVBdWwm7AniDAdmIs9308aclRCJ+1kGGI50MJEZ9teeL7LGtuEQxtz2cyrpE/BuhskltyrrhqMlcX8XLh27mviQHlkGNEGW9BYFZ1tCE9vrbZ4XDTCFBkccfzAPst7+M0uevNO7cboUUNfSxnIYuLhiCOOGUv2MIehafNmnk/jcvkOg7ZtD+rCZ/RDGqqKpXbe8RE4shbPKBKyOcdmsm1/KFPv868kX/czqkdQbWSJCfkGL+Iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xevo.com; dmarc=pass action=none header.from=xevo.com;
 dkim=pass header.d=xevo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=uievolution.onmicrosoft.com; s=selector2-uievolution-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XCVJ2dAtV4OeKu9uZDL13q5YeoYAx7DANbiB5HmSfkA=;
 b=VFhE72DmzIr+5cBNaHyGZLWlxpEU7N4CEfxMAng9oNb8aDm2TMj86jWzHbR+AiRqEcPgjODiUb0D4wa8GOsnY69bPMlv3VQU1sWKPNkR2Yfu/iPVAhuwDvWr3zT4kL6Rn2o2/oElQFVPdrwtbhfaLvJUlNkwNDSl7NPWtOnyDL8=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=xevo.com;
Received: from MW3PR18MB3659.namprd18.prod.outlook.com (2603:10b6:303:53::19)
 by MWHPR1801MB1984.namprd18.prod.outlook.com (2603:10b6:301:6c::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.22; Wed, 17 Jun
 2020 00:54:15 +0000
Received: from MW3PR18MB3659.namprd18.prod.outlook.com
 ([fe80::3d7f:edb8:f540:5050]) by MW3PR18MB3659.namprd18.prod.outlook.com
 ([fe80::3d7f:edb8:f540:5050%5]) with mapi id 15.20.3109.021; Wed, 17 Jun 2020
 00:54:15 +0000
From: "Ryan Rowe" <rrowe@xevo.com>
To: openembedded-devel@lists.openembedded.org
Cc: jbroadus@xevo.com,
	mkelly@xevo.com,
	Ryan Rowe <rrowe@xevo.com>
Subject: [meta-python][PATCH] python3-typeguard: Upgrade 2.7.1 -> 2.9.1
Date: Tue, 16 Jun 2020 17:54:09 -0700
Message-Id: <20200617005409.44365-1-rrowe@xevo.com>
X-Mailer: git-send-email 2.17.2 (Apple Git-113)
X-ClientProxiedBy: MWHPR17CA0072.namprd17.prod.outlook.com
 (2603:10b6:300:93::34) To MW3PR18MB3659.namprd18.prod.outlook.com
 (2603:10b6:303:53::19)
Return-Path: rrowe@xevo.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from CASE.local.rynet.xyz (73.83.210.194) by MWHPR17CA0072.namprd17.prod.outlook.com (2603:10b6:300:93::34) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3109.22 via Frontend Transport; Wed, 17 Jun 2020 00:54:15 +0000
X-Mailer: git-send-email 2.17.2 (Apple Git-113)
X-Originating-IP: [73.83.210.194]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a495d06f-4f98-442a-722f-08d81258f524
X-MS-TrafficTypeDiagnostic: MWHPR1801MB1984:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<MWHPR1801MB198415F04554EEEFFBE20FD2CC9A0@MWHPR1801MB1984.namprd18.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-Forefront-PRVS: 04371797A5
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	iVzSsNL0oAgsDOmbRIJrVYTRm+3eLU0GAaIhbzn12L6TiUFpwsf7PNDmm7sQKfG80DTHuUH4Gp1gfc2eHG5E+O05PL6BZ0F1XFSd+Y4ujhnvAJyXqtoiHy6KqcI9F2soAHu6/AzlytwEbrRXtXSTVgDxmqIOUFocK9D9CyKsdj5OV8qI8SzdLvmnb+R6S7sGsrxtuJFRSmm5qBmOQqOxf7o9zu8rzun+Xfp7Ie8+rALHXCqMID/Jd1dpku0+G3qUEaayOGyUp1HJQWsjAtM5FN6vYsk5iXtADoJXxSofaa7ZBzr+EY5mIhl9Sc3bgJTvHKuthTQPqUvmJZ2JJwWXF0Ao0oK9eFM1hYJnDk6Xal3lDxqeGZsoFOnxkn7zlSAKWqGaTYJpkL0RpkE9/t3AU1cuBI+IYguyD7y/Fv0Kt3cpeO3f7Xerf6nHg3Ji/F07ELLINmIum18g65xv9AO1Fg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR18MB3659.namprd18.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(366004)(376002)(39840400004)(396003)(136003)(346002)(2906002)(26005)(16526019)(6666004)(186003)(66946007)(66476007)(66556008)(52116002)(6512007)(316002)(4326008)(5660300002)(107886003)(36756003)(6506007)(1076003)(478600001)(6486002)(956004)(2616005)(8936002)(86362001)(83380400001)(6916009)(8676002)(4730100016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	Bq6G5jTEeFoaIY4R1O4V0wspAvCjJ1Dab1RLa30XBbt8zwtIBSAO7XUMWdiIfy5jYgGhenEDiKSjJR9cF2HWLivWIdcUI8AxlV98tLKilIdz3DhyfwSMoPO0qCD35DGmS4ff15gkl1lJGnvg+ufqzc+yGP2nK0Xpfbi1Mhwekx1ijdVH00m2Ng+btK003cskB5pZPSnCfGd2xScUptHVjbMTrQoZ2H02JtDUhXp4ywQxxAGhoVGR+uENH6gik4X7qv6XH1FqcdGM4J+WQp9g7M0mu4Js+97iHj5wBIe27lfYp+7CFehZAc0BeeYg8azHudZwWnBh/1lwkTmt4h06JLkwi6b0lgX0k4vbeDp1E7D8G9/r73Jho1iplzV7I/zNx2RYqbgJEfzI6ndRkiParXRZQ1LrCt6iwVhON1UbzHnbm0q/PzZf/BNtBFKcyFQZirvRvqa0HiaEj2JCHIRoHhEHNxdxry/d+U+Cfj2tUMp0zbGVyYz+nvjl89kzlrA6
X-OriginatorOrg: xevo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a495d06f-4f98-442a-722f-08d81258f524
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2020 00:54:15.4274
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e0a7ca1f-2458-4cd6-a7c7-d733c07495ab
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NaE8ji1ULx9bQYMuw8DGGAPc6AMQGYu6Uh6ulzvc6fHvEo4Pk+M7r9BVyrwYLdsq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1801MB1984
Content-Type: text/plain

2.9.1 (2020-06-07)
- Fixed ImportError on Python < 3.8 when typing_extensions was not
  installed

2.9.0 (2020-06-06)
- Upped the minimum Python version from 3.5.2 to 3.5.3
- Added support for typing.NoReturn
- Added full support for typing_extensions (now equivalent to support
  of the typing module)
- Added the option of supplying check_type() with globals/locals for
  correct resolution of forward references
- Fixed erroneous TypeError when trying to check against non-runtime
  typing.Protocol (skips the check for now until a proper compatibility
  check has been implemented)
- Fixed forward references in TypedDict not being resolved
- Fixed checking against recursive types

2.8.0 (2020-06-02)
- Added support for the Mock and MagicMock types (PR by prescod)
- Added support for typing_extensions.Literal (PR by Ryan Rowe)
- Fixed unintended wrapping of untyped generators (PR by prescod)
- Fixed checking against bound type variables with check_type() without
  a call memo
- Fixed error message when checking against a Union containing a
  Literal

Signed-off-by: Ryan Rowe <rrowe@xevo.com>
---
 ...{python3-typeguard_2.7.1.bb => python3-typeguard_2.9.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-typeguard_2.7.1.bb => python3-typeguard_2.9.1.bb} (72%)

diff --git a/meta-python/recipes-devtools/python/python3-typeguard_2.7.1.bb b/meta-python/recipes-devtools/python/python3-typeguard_2.9.1.bb
similarity index 72%
rename from meta-python/recipes-devtools/python/python3-typeguard_2.7.1.bb
rename to meta-python/recipes-devtools/python/python3-typeguard_2.9.1.bb
index b62b60564..a0167cf03 100644
--- a/meta-python/recipes-devtools/python/python3-typeguard_2.7.1.bb
+++ b/meta-python/recipes-devtools/python/python3-typeguard_2.9.1.bb
@@ -3,8 +3,8 @@ HOMEPAGE = "https://pypi.org/project/typeguard/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=f0e423eea5c91e7aa21bdb70184b3e53"
 
-SRC_URI[md5sum] = "ef743359de59f8fe17e7c5e3af70e2c5"
-SRC_URI[sha256sum] = "2d545c71e9439c21bcd7c28f5f55b3606e6106f7031ab58375656a1aed483ef2"
+SRC_URI[md5sum] = "411df8eefd76ffa014328a46342bdf38"
+SRC_URI[sha256sum] = "529ef3d88189cc457f4340388028412f71be8091c2c943465146d4170fb67288"
 
 inherit pypi setuptools3
 
-- 
2.17.2 (Apple Git-113)

