Received: from NAM11-BN8-obe.outbound.protection.outlook.com (NAM11-BN8-obe.outbound.protection.outlook.com [40.107.236.83])
 by mx.groups.io with SMTP id smtpd.web09.36924.1611584717219397471
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 Jan 2021 06:25:17 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=nw0CGwTU;
 spf=pass (domain: windriver.com, ip: 40.107.236.83, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O5QWiAdvxkGp9PZijDnpb2kynQTVD2pwunZGE6U0dDadlAE1qtS0Gtb8Fo1ROpiyEHMWhFtc9t2NYOoHOSsGRTV5vIinJC4MtGdaderuWKYddPlZ2gZCco2w0AzTSwd+7FMSyA5l2Wv3N4lz9kh02bHpS1Rbq1TL6OBJCX6psA6gEN0rD2IK+YOUiPLQkUJAlRA02Jx8KmttrbgCf0eQxRsP360fIRW/DyyQYBqwuF/m60krbVv4SIJuEi1Jg9K2PhE8PfmOSIoBdNPJJves5NS982ZO/tt3qJIarqV5W67FLSlKN+Y5/qcIQ+Oz9KXw1HKWU6Y6blNt69b93Qt1lA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yEPxmrKUj0R+muT5wwrKtdxpBnTD/pI8DXC825oQSAE=;
 b=YSLpX7eoWB9MULMwgU0fwSJCA6GYGflQ7k5LlJB+MRlqWQjBkCVI70Kq6XFC0rkIxSLvu7E2Ukjo6aiCkC16ObgOcupqFBMr3a9M4NM0HZhILfHrjnFpMvAJRlCOrbXFS84bytZ9A/e8IyoaGWl5VCDMDYQ9y8okn6AtK8BH21iTOd+xgKGIzxsmDiETQVnGB35042AaDf4do/wQLjh4XXkJae5SjD+mQg2KfwyPqNHnPxsrnqUjFdyArm64cRfkcGM+ZIoRz1Mvjr/zxiDxSmIFz8vlAaRjUOYU868ctHZqAZACwcPX2ER7QzYEf0V7uAK9ADbk2wI0wsS4ONDw3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yEPxmrKUj0R+muT5wwrKtdxpBnTD/pI8DXC825oQSAE=;
 b=nw0CGwTUwFR8ta6sGbe4KJg/vEpwAm2YQkwYD1QpRHcgihqRuH3iyrIYGd7rzqjxXqIriYDDCae42JpAQKwzwALQpBLSB1o11o4tC4FKlhvFWHXQlaiqcW8h+qtBYDj6PRNbYa4poggobYwzsp1GCkH1fMyn7hhv5tBQA6nLnB0=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from MN2PR11MB3919.namprd11.prod.outlook.com (2603:10b6:208:13b::27)
 by MN2PR11MB3871.namprd11.prod.outlook.com (2603:10b6:208:13c::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.13; Mon, 25 Jan
 2021 14:25:15 +0000
Received: from MN2PR11MB3919.namprd11.prod.outlook.com
 ([fe80::5462:9c04:72b3:6c44]) by MN2PR11MB3919.namprd11.prod.outlook.com
 ([fe80::5462:9c04:72b3:6c44%7]) with mapi id 15.20.3763.019; Mon, 25 Jan 2021
 14:25:15 +0000
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
To: openembedded-devel@lists.openembedded.org
CC: ticotimo@gmail.com,
	raj.khem@gmail.com
Subject: [meta-python][PATCH 2/2] packagegroup-meta-python: add ptest packages to ptest group
Date: Mon, 25 Jan 2021 09:25:00 -0500
Message-ID: <20210125142500.936815-2-trevor.gamblin@windriver.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210125142500.936815-1-trevor.gamblin@windriver.com>
References: <20210125142500.936815-1-trevor.gamblin@windriver.com>
X-Originating-IP: [128.224.252.2]
X-ClientProxiedBy: SJ0PR05CA0109.namprd05.prod.outlook.com
 (2603:10b6:a03:334::24) To MN2PR11MB3919.namprd11.prod.outlook.com
 (2603:10b6:208:13b::27)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from yow-tgamblin-fedora2.wrs.com (128.224.252.2) by SJ0PR05CA0109.namprd05.prod.outlook.com (2603:10b6:a03:334::24) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.7 via Frontend Transport; Mon, 25 Jan 2021 14:25:14 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: da3b59db-3f2a-4ffb-2853-08d8c13d0840
X-MS-TrafficTypeDiagnostic: MN2PR11MB3871:
X-Microsoft-Antispam-PRVS: 
	<MN2PR11MB3871298DA1BDF8C946F27F6A9FBD9@MN2PR11MB3871.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:407;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	6EockI97wOVCR6wMllkkh70+ydaHbcQUc3U7toGWc/GBuUCt557qGaJqeADfC0qykHWb6n8ZWJ1Dm71KNgRKte9Wi7nw9+pgaMrjvaJyaFZZ9uvRK7sZiHqEKe29S3o69YL+uS/3U5BafiF4Lt5rJ1xphGIVLVCNRFbrNomCDW23zld0Q7km6NM6GhTUeZPELdI6Q6EcAm3raVVxawsbWltdCbpd8qPEvc/snwUI+eZoGc71nrukOxtb1/PikKBbKDWrJkdbUwGF+XxC4orc2/jFUQcSCk4jgCmKBQV9ModchmXn+nmYzJ3UpvMeK6dt3G1c9NMj01GuUUbvYxV6ZgNlFRYL4sx9FAO0L/jSHZaQmEnXFpMuV/p9YyUhp6rv0/epy+cNMEBKmdj4l3f7TA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR11MB3919.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(376002)(346002)(396003)(136003)(366004)(2906002)(66946007)(6916009)(52116002)(66556008)(66476007)(6486002)(86362001)(8676002)(1076003)(8936002)(36756003)(186003)(956004)(316002)(16526019)(26005)(5660300002)(6666004)(478600001)(44832011)(2616005)(6506007)(83380400001)(4326008)(6512007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?t0Vkv23dMIivYnpj5SvuR0It230c9gL9XJM+bvZZ6drZ6PHpqh+ka9K0aJ7J?=
 =?us-ascii?Q?hVKWwemYNKSYswzYinNx8BeCCwSja4S4hDlXpCZfb9Qmm5etYBQFWsPq0Azf?=
 =?us-ascii?Q?wErZA7sq+sn6zRXnCfxzpiT+kJ/3JVc4hOFHqyhsFN8GU29tIjPXFhjYZXNW?=
 =?us-ascii?Q?fg3Xfz4+K1ZOJ6Coms0xET4Qu6aEseKRmLGWiW9SdFk0rxrxzJ1KETxh15qD?=
 =?us-ascii?Q?M+vvBazGOeL3iKidnnmF+fIs9kfozfuvqXN7t3raLZ+60qlhM71X+q395E2K?=
 =?us-ascii?Q?O+FE7DVPstF42jXf/R59neU0QxxkeK9+JWWW3axpnuERbYakfAQWEBeY0hyj?=
 =?us-ascii?Q?KtcnXb+x08VJHsO+l0/knmi9/EqU+3swDPW8Oy4uKsLnLZaXftyOp81Scyk9?=
 =?us-ascii?Q?AckiITMMKDRFTqvZdHqYCtilZeCWHmuxGtt2QJFJOnwdWTk/ycEVRUWdqnrf?=
 =?us-ascii?Q?AeCcjw1fzUVZa7Pp4Vj4bRspfKiQ0ETIQyxkzgGiGUhXgvDwdLryjFc2OWWq?=
 =?us-ascii?Q?0X+WQV5getkwf0YPPFimxQNPgBwXiPuQuPx4OjXq6qbaIvKcvN2GLbyZl4Pm?=
 =?us-ascii?Q?PVfTJzKXqgbSmk+Ve4+6gtAAGdo5JG/lC4pFgQpT/R+gCCFWbc6Y/D/vhk08?=
 =?us-ascii?Q?gn3lQ/OQblgduTlBrC6sVAs0Duvx5yBgjyHgSn6/iWW5TlWES1rz+xqJWMau?=
 =?us-ascii?Q?tm9+9UzTtlSNr8VJIX4RwnArY+/b/HXavyL16NC2oZswjsG2r21yrLajmMMQ?=
 =?us-ascii?Q?k9h47DUCJMWc9uIaT0s+WHeOAQkVbsOxvROXvZLxmgjTZXdeoWs025vPLttG?=
 =?us-ascii?Q?Pji6bvf2xrXHyf0MuRAxWMMYgaycSVjZ+qeenEreEHya261dCs+RiXS5/eW9?=
 =?us-ascii?Q?r7axBla+mWWJYU3iakEOeDR+hToMvxQb2pOzYw623hcM9clUcK2c7NCDjcj0?=
 =?us-ascii?Q?W4hFw+cU57pNLiW3dpjwXA9hJNBh7WViBcRd1HJqTEegovw/hE/9HVNkkc4w?=
 =?us-ascii?Q?G+Ac?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: da3b59db-3f2a-4ffb-2853-08d8c13d0840
X-MS-Exchange-CrossTenant-AuthSource: MN2PR11MB3919.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2021 14:25:15.5709
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0N307of/tymeTnTEgbOIwJ6mbkuKANVEQ4LxnfVRUFuYF+cFypG0OxsQIYnTznbs5baxHSvcB9aETqwIReX9XunIaKaKX5467n6weEG2Uoc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB3871
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

There were a large number of Python package recipes with ptests that
were not included in packagegroup-meta-python3-ptest, so add them.

Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
---
 .../packagegroups/packagegroup-meta-python.bb | 64 +++++++++++++++++++
 1 file changed, 64 insertions(+)

diff --git a/meta-python/recipes-core/packagegroups/packagegroup-meta-pytho=
n.bb b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
index bbc9a80b3..ea71d4cb4 100644
--- a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
+++ b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
@@ -442,6 +442,70 @@ RDEPENDS_packagegroup-meta-python3-ptest =3D "\
     python3-cryptography-ptest \
     python3-jinja2-ptest \
     python3-markupsafe-ptest \
+    python3-ansicolors-ptest \
+    python3-anyjson-ptest \
+    python3-appdirs-ptest \
+    python3-backports-functools-lru-cache-ptest \
+    python3-bcrypt-ptest \
+    python3-betamax-ptest \
+    python3-blinker-ptest \
+    python3-cachetools-ptest \
+    python3-cbor2-ptest \
+    python3-click-ptest \
+    python3-cryptography-ptest \
+    python3-dnspython-ptest \
+    python3-dominate-ptest \
+    python3-geojson-ptest \
+    python3-gunicorn-ptest \
+    python3-html2text-ptest \
+    python3-inflection-ptest \
+    python3-intervals-ptest \
+    python3-ipy-ptest \
+    python3-iso3166-ptest \
+    python3-jdcal-ptest \
+    python3-jinja2-ptest \
+    python3-jsmin-ptest \
+    python3-jsonpointer-ptest \
+    python3-license-expression-ptest \
+    python3-markupsafe-ptest \
+    python3-msgpack-ptest \
+    python3-multidict-ptest \
+    python3-ordered-set-ptest \
+    python3-parse-ptest \
+    python3-parse-type-ptest \
+    python3-pint-ptest \
+    python3-polyline-ptest \
+    python3-precise-runner-ptest \
+    python3-prettytable-ptest \
+    python3-ptyprocess-ptest \
+    python3-pyasn1-modules-ptest \
+    python3-pyroute2-ptest \
+    python3-pyserial-ptest \
+    python3-pytoml-ptest \
+    python3-pytz-ptest \
+    python3-requests-file-ptest \
+    python3-requests-toolbelt-ptest \
+    python3-scrypt-ptest \
+    python3-semver-ptest \
+    python3-serpent-ptest \
+    python3-simpleeval-ptest \
+    python3-smpplib-ptest \
+    python3-soupsieve-ptest \
+    python3-sqlparse-ptest \
+    python3-test-generator-ptest \
+    python3-typeguard-ptest \
+    python3-ujson-ptest \
+    python3-u-msgpack-python-ptest \
+    python3-unidiff-ptest \
+    python3-uritemplate-ptest \
+    python3-webcolors-ptest \
+    python3-whoosh-ptest \
+    python3-xlrd-ptest \
+    python3-xmltodict-ptest \
+    python3-xxhash-ptest \
+    python3-yappi-ptest \
+    python3-yarl-ptest \
+    python3-pyasn1-ptest \
 "
=20
 EXCLUDE_FROM_WORLD =3D "1"
--=20
2.29.2

