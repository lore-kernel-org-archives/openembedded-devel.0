Received: from NAM11-CO1-obe.outbound.protection.outlook.com (NAM11-CO1-obe.outbound.protection.outlook.com [])
 by mx.groups.io with SMTP id smtpd.web12.31811.1606118286575060598
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 22 Nov 2020 23:58:07 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=CD9Zze5r;
 spf=softfail (domain: windriver.com, ip: <nil>, mailfrom: yi.zhao@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HqhL9gJ4a0yr5g6iK8rC5zbd/KlvBgjcb22ksp+qS9I2nC8KLw1OZLBvFiZaXos3bhinmHjGcxVAnHtUpGm2NpGQchGlTUeNx7EcO/73QYbJ6HYst6vOcPucIURDiMUpeYlr9JOmHt/+DS66oyL4NAXgwXLZid1zklZcUrprTWLO8oaQuzWjad1zKcZ9ObsutlsfFU4QY+ZJ/NgWvfhBrXm4qDFMeEHNiTBlQUtPI4G2K0SJZaXr/lX3/A3rFAOECe3f4E0zNm2LaFE7bBYNORWsx98lX2QmctbydiQ6HpvpMatxFOe8JM103q78xgGs+VdUZRBByLJeVphbQbEnng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z4XBP+SwaLlPDsUmGivedLAYr9TvLQ0fhg4gNrWuQ9g=;
 b=lEajfNolB2zB0ShfEvKWyiHBdGOT7NrO4lx0fYaWhcLg8gXgaSFoLrtUpCgetzn09yDzbj1jfC+ymJvE4eeXUtTUpvbLKQYfItoiBsgOLwVvV97yJ4lACScyZA+e9uZmcWXHKoMAuGjDscZsGPlqAHs8O3f4Tqe5X28XFIOS22QONoAbABUYVFe/GhzqcRjqh+t/PtUDVC9DN0aoVMV6RJrsceCJ59ejEQqlGriJTuHvaRliNRYLrBSVs4D8jenfBMTUZWXjclgfdcq6lwDEe4+octdwxgZ/eSK5i0QCx/R+LQ/xG/AguEYhzS6/stC+1jOe540dujb++YPKEuTATg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z4XBP+SwaLlPDsUmGivedLAYr9TvLQ0fhg4gNrWuQ9g=;
 b=CD9Zze5rzIlFF2Ys7yrLhL81cxgeZwssPGhhiWSg/RgJocsdpZFvnIZDMgYlSwH7cOCxkGkT5t4a8jK2td7+NBU/+gSagWPHaewH+hLh0LBy4UqevEgwoydez7cd12+SIuU5fqQcKTulFRUUH1X2fXdLRUxlE5m569xj8h/a8IU=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by MWHPR1101MB2240.namprd11.prod.outlook.com (2603:10b6:301:52::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.20; Mon, 23 Nov
 2020 07:58:06 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::d844:ac89:6b05:ed98]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::d844:ac89:6b05:ed98%6]) with mapi id 15.20.3589.029; Mon, 23 Nov 2020
 07:58:06 +0000
From: "Yi Zhao" <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 2/2] krb5: upgrade 1.17.1 -> 1.17.2
Date: Mon, 23 Nov 2020 15:57:54 +0800
Message-ID: <20201123075754.293074-2-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201123075754.293074-1-yi.zhao@windriver.com>
References: <20201123075754.293074-1-yi.zhao@windriver.com>
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HK2PR04CA0044.apcprd04.prod.outlook.com
 (2603:1096:202:14::12) To CO1PR11MB4867.namprd11.prod.outlook.com
 (2603:10b6:303:9a::13)
Return-Path: yi.zhao@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-yzhao1-d1.wrs.com (60.247.85.82) by HK2PR04CA0044.apcprd04.prod.outlook.com (2603:1096:202:14::12) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.20 via Frontend Transport; Mon, 23 Nov 2020 07:58:05 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4b09e4e6-27a9-4cc6-dbad-08d88f8582db
X-MS-TrafficTypeDiagnostic: MWHPR1101MB2240:
X-Microsoft-Antispam-PRVS: 
	<MWHPR1101MB224079657298F72F4AEFAE61F9FC0@MWHPR1101MB2240.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2582;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	sf8ilj6GfJrP28H7GTDvEpQkP1UzMrCyxQ9mN+4DaVlRb6gUir1cp4wXOI/JkHR+PShSt2z/AWWaPpBZBj4tDN6ZhCYm88BV+m2hc+yLM/GVEXVB75SxNz965qllL5EEqngd/lB+HR9AoRLFz1dPjEvad0jiWa3R5WpDPj9ip0pHbyYcXQmCgaXWBOwnW/QV3m+7f4SMVrUfxtZjvFClo7lnCOX5VB1FdEbofouuCik8FgcKH9f0ZRlfDsKgYGSeA0d9ddQ9enUJDAoCwUHveBMBzmL4mdLv9KGDsHyeF8/MOfgQVWEy7t43veOGxKXN9G7sHz1bLbYO2bhhH3n4leIsZ8YJDVcG3md3niG8K3ozossT9Jz2kUofAGOEZo0ezgPJpdxNp6mPYDLX57CbnA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(376002)(396003)(366004)(136003)(39840400004)(186003)(26005)(8936002)(6666004)(6486002)(66946007)(2616005)(956004)(44832011)(66556008)(66476007)(6512007)(52116002)(36756003)(2906002)(316002)(83380400001)(6916009)(8676002)(5660300002)(86362001)(6506007)(1076003)(478600001)(16526019);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	31a4n5se4Fzsjj2w+B6r5vqWnRNEXnJUKDK12lJoifeCZZOugCuvmFFFC4c69naCq5REII1Gq44QUo7uhxUfndfgpVEq3QztT4enBhp5lGV8qmlPk3AIYKe89PNGWeiJ+mvEnB4nHKa5i7wqxUIHFB1RrYMx503GDWk/klBgaVFpH5kmst0DMBVLJtxiMk3oSpr/RE05DsFLeIkKAS34o/dyfJnOb6JuuOrxZgZt9e23xOhyud8JEoRit3YzfYPO09BoLOtQ3PYh0lDOHO7udqURR/jFXoRQVBOVkhRQCJWrw7YeYEFCrMhJqxW1zv+TTlxQfROYG8otDo4bm8leSMsi2jpZVtpjLwkvsfjoz7dxEyTqfS8Pui82PRXP+moBTkak8nY2QkU1or4sSF3sNW0eV76dMDnYkGn0j7EXuQfhFEfXnaFuC2kJFuRBT7SRPiMz9qJTMRIYUQF9jaZGK8R0r13Six3BOUoo4QkoabFID2iFQwAzQzlYr6D8BxUXUyE1bzRzhxSbKiqOC8DpdBnn0moTIWM/B2bpibe/B++CPFLrk5VPaNztCKF2KqL1A0txKW0sSyijyr7syTuWjLoPensBRu8js2B2SMa2GkAsiXJa4kD9xI+5PoMWI6vJ2ffmRb7cAxJEqlNeifH0LA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b09e4e6-27a9-4cc6-dbad-08d88f8582db
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2020 07:58:06.3501
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mE0XdI7cPL4GVyiC/BZGUdcRQy1+JOoyO4WdYyAk9MJNPtJCS9UC7Moe0SZoPVkNsk4ztdxqJ5Utq7Lc6dkJ0g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1101MB2240
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

License-Update: Update copyright year to 2020.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../krb5/{krb5_1.17.1.bb =3D> krb5_1.17.2.bb}                 | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-connectivity/krb5/{krb5_1.17.1.bb =3D> krb5_1.17.2.=
bb} (97%)

diff --git a/meta-oe/recipes-connectivity/krb5/krb5_1.17.1.bb b/meta-oe/rec=
ipes-connectivity/krb5/krb5_1.17.2.bb
similarity index 97%
rename from meta-oe/recipes-connectivity/krb5/krb5_1.17.1.bb
rename to meta-oe/recipes-connectivity/krb5/krb5_1.17.2.bb
index 6164c8248..29bcb48b1 100644
--- a/meta-oe/recipes-connectivity/krb5/krb5_1.17.1.bb
+++ b/meta-oe/recipes-connectivity/krb5/krb5_1.17.2.bb
@@ -14,7 +14,7 @@ DESCRIPTION =3D "Kerberos is a system for authenticating =
users and services on a n
 HOMEPAGE =3D "http://web.mit.edu/Kerberos/"
 SECTION =3D "console/network"
 LICENSE =3D "MIT"
-LIC_FILES_CHKSUM =3D "file://${S}/../NOTICE;md5=3Daff541e7261f1926ac6a2a9a=
7bbab839"
+LIC_FILES_CHKSUM =3D "file://${S}/../NOTICE;md5=3Ddd4d0ad4c5e98abb58aa0d31=
2f276791"
 DEPENDS =3D "bison-native ncurses util-linux e2fsprogs e2fsprogs-native op=
enssl"
=20
 inherit autotools-brokensep binconfig perlnative systemd update-rc.d
@@ -31,8 +31,8 @@ SRC_URI =3D "http://web.mit.edu/kerberos/dist/${BPN}/${SH=
RT_VER}/${BP}.tar.gz \
            file://krb5-kdc.service \
            file://krb5-admin-server.service \
 "
-SRC_URI[md5sum] =3D "417d654c72526ac51466e7fe84608878"
-SRC_URI[sha256sum] =3D "3706d7ec2eaa773e0e32d3a87bf742ebaecae7d064e190443a=
3acddfd8afb181"
+SRC_URI[md5sum] =3D "aa4337fffa3b61f22dbd0167f708818f"
+SRC_URI[sha256sum] =3D "1a4bba94df92f6d39a197a10687653e8bfbc9a2076e129f6eb=
92766974f86134"
=20
 CVE_PRODUCT =3D "kerberos"
 CVE_VERSION =3D "5-${PV}"
--=20
2.25.1

