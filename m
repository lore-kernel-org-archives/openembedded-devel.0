Return-Path: <andrej.valek@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D98FC433EF
	for <webhook@archiver.kernel.org>; Tue, 19 Apr 2022 14:22:18 +0000 (UTC)
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (EUR02-AM5-obe.outbound.protection.outlook.com [40.107.0.61])
 by mx.groups.io with SMTP id smtpd.web09.1158.1650348295081084199
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Apr 2022 23:04:55 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@siemens.com
 header.s=selector2 header.b=nljfBN7f;
 spf=pass (domain: siemens.com, ip: 40.107.0.61,
 mailfrom: andrej.valek@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Hu4x2SBehKeFJnxhO4xZSXePRxbA5UQ8pBCtl97rHphcOh97+xdzNF4ypHPFWYra2WGEx7R95qHUb2Hiy1889u6WhOW0C4OrN35utoYpWTvLLQH+xcMJS8OF/oiZpn91dZv3T9fZVYRF/Y+pmG3flI2Dbydsvk2btuWPu3gxa9z6knkRO6V9BRGoQmWoqbv40jb5dno5HUIjbZ3tAX4wmSdaLwRVfCUY6YXpA+nz/02fG4PGqDfB6fIFDqf/9AtpSE8GHyG6t262ftzbCbrZtr6mAKvwPH4XLOWNJm7+9OcQFZQuiwB5aOHSRNnOwC6dsYjhXRKvt6yH/7b24kMsiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aIA/BiHZy6LsMC4mK+2gpcH2QEAdZJnxr9UXo0jhaoM=;
 b=Pa+fFAc6rBHQgWccYfl+QfVHyGgJSqNipxbV4xG4loYrg2u6pgjLbFngrBI8h8XTo4HnKN6gyG4dvcNJren2B8znJgRJoU2DYfRtiCS3XHPCHSKEvNMqz8wvSksbgibAfwNP2au6Xktbhad1JkJHuEHo9A9nS6+nciJf/jkh35TT4EMLrJrr6DKM+oQOnwgBNJssmHj22tJOtt4gA7tRPiHGC8sfYyOKgwZOuRtaey2kelIAz/HMjohrk/a8pn9UQC4c7zyyuv1i65fRHXI+KNkUZlBMLhtOUWb+qFgoezoVFwYnIjiEJSiO3TD1ZaQSV6udvZPc9HiP9Ue7oFrypA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 194.138.21.72) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=siemens.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=siemens.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aIA/BiHZy6LsMC4mK+2gpcH2QEAdZJnxr9UXo0jhaoM=;
 b=nljfBN7f9pb/0gMdWuiK5FrigFjFSFNA+jn7/xZAUoF0P6zuty37olDcRZTmWSttzfmi8hUEkl1EWCv7v7Vgu4b5khPv/IEn0Ft3oGOa0j0JgccDX9NRvJEH1CD5kN43+5bhhfWkyMLUKAFOtGEgZIo+CbguH15rpPO+8fomLUyuRy1OC8ziZpmUc2TUmGYfMtAIRiY9+ZN8526zAjlR1Rsq2PDNzNP2lVdwiGNuINMO3Fr2DcVM8CPxmsUffFakPwCiQV+EeSS8V3VczPA5g730SR8sfMs0DDmB13c+cKTuSvNhmQC22vylJmpny3Apk7X6x95UpnodGD1EC6jBTA==
Received: from DU2PR04CA0081.eurprd04.prod.outlook.com (2603:10a6:10:232::26)
 by AM7PR10MB3656.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:136::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20; Tue, 19 Apr
 2022 06:04:51 +0000
Received: from DB5EUR01FT042.eop-EUR01.prod.protection.outlook.com
 (2603:10a6:10:232:cafe::9f) by DU2PR04CA0081.outlook.office365.com
 (2603:10a6:10:232::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.13 via Frontend
 Transport; Tue, 19 Apr 2022 06:04:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 194.138.21.72)
 smtp.mailfrom=siemens.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=siemens.com;
Received-SPF: Pass (protection.outlook.com: domain of siemens.com designates
 194.138.21.72 as permitted sender) receiver=protection.outlook.com;
 client-ip=194.138.21.72; helo=hybrid.siemens.com;
Received: from hybrid.siemens.com (194.138.21.72) by
 DB5EUR01FT042.mail.protection.outlook.com (10.152.5.100) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5164.19 via Frontend Transport; Tue, 19 Apr 2022 06:04:51 +0000
Received: from DEMCHDC89XA.ad011.siemens.net (139.25.226.103) by
 DEMCHDC9SMA.ad011.siemens.net (194.138.21.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Tue, 19 Apr 2022 08:04:51 +0200
Received: from md3hr6tc.ad001.com (167.87.32.102) by
 DEMCHDC89XA.ad011.siemens.net (139.25.226.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Tue, 19 Apr 2022 08:04:50 +0200
From: Andrej Valek <andrej.valek@siemens.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Andrej Valek <andrej.valek@siemens.com>
Subject: [meta-oe][PATCH] poco: upgrade 1.11.1 -> 1.11.2
Date: Tue, 19 Apr 2022 08:04:36 +0200
Message-ID: <20220419060436.54655-1-andrej.valek@siemens.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Originating-IP: [167.87.32.102]
X-ClientProxiedBy: DEMCHDC89XA.ad011.siemens.net (139.25.226.103) To
 DEMCHDC89XA.ad011.siemens.net (139.25.226.103)
X-TM-AS-Product-Ver: SMEX-14.0.0.3080-8.6.1018-26680.007
X-TM-AS-Result: No-10--11.075300-8.000000
X-TMASE-MatchedRID: tExRu5704xH7QMAOnss9kxJwcdfSstcERQGu/DrNT7k/QdUh6LEl0NoK
	fgOoKJc2tmTuCy5+VUrg6pBZBTcH6zeWrdgSBjom+tm7QUoneAYiXL+V+zm5iXV7tdtvoibaEOS
	/art35UOXBXaJoB9JZxRFJJyf5BJe3QfwsVk0UbvdirxFVpmK9eVY180qd2BZoa3p6qihnfIcrn
	yKIc2GphTeZdTA/CUCAmnUqAbYhcc=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--11.075300-8.000000
X-TMASE-Version: SMEX-14.0.0.3080-8.6.1018-26680.007
X-TM-SNTS-SMTP: 
 796938BB187BCF3FBE533160757A5F736C56980D1B8A8EEE56D1EF4CC4E92AC62000:8
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cb97be25-1250-4831-ed05-08da21ca846c
X-MS-TrafficTypeDiagnostic: AM7PR10MB3656:EE_
X-Microsoft-Antispam-PRVS: 
	<AM7PR10MB36569997FAF9AFBC040C464292F29@AM7PR10MB3656.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	VqMH0VdZDTMxVeCCSqunYc43Zs8gxgN+xfsKqlgHNKT0zJ+VLIbnFq2qSeDwLkJ4XuPrQJzzYQVT2DbXmxvpUJ8CVq3rpUmrPRrUXXPZd10NnX4o2AfUmXOOjqkYcHiJ4/2WUo2Sh3tuSq3s7wjyuA02lQyiU9Hn/W520K0L2rnZYVc+TCID6o/ZgttI8YJ5DLM96WFfTlcBke9S+SrIB3iul4j1qASz47L88mCefAbZJO7ffgYZSxJxqX/491kFq6iHMJlBdHwJmQYxwMH2OCzTKoQQXEvxCxgbVEK1O5POha5lt9uQgRwQe5j5nEaf5rwO8y93JTJ7YOZyhcpws+4D+jRirM3zeWk8nktnxUWiLk2rkSYWfQMkb8rxBE6ZhihZm/jdwMjWLfN3Mbo0HoiaeVTk2lOgphVG/tqDesvlY1az8kkyiIgrLCzQVVnJ0nz9bKOMX2F0XOoTTpvDDgdFhoI8ifCaprZ0VMkhAbcSdrHqvMF5SRYARZTwqwOsg/V1DVwTTcXqxuaWDFNx9niIOOjboS1byOQAlTeIkPOPhHDR6bKzK9ZGoJoRTMFs27H0dCXW48kEFZ/G+raVBV9FWzOgnLMp98nw9AnIKFOwp/ii2Yu9ex3Vd0yT4rnMduoDHPoMUbj83iaIl218T7UiOeFRc6BloBzud7npJbNu/+tl2a5bRuPGgkiNxvAHPCXFtUz02NZnlSy+i9MIZA==
X-Forefront-Antispam-Report: 
	CIP:194.138.21.72;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:hybrid.siemens.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(36840700001)(46966006)(498600001)(47076005)(86362001)(8676002)(40460700003)(44832011)(8936002)(70206006)(70586007)(6916009)(16526019)(5660300002)(4326008)(107886003)(36756003)(2906002)(82960400001)(82310400005)(356005)(36860700001)(336012)(83380400001)(1076003)(956004)(186003)(2616005)(6666004)(26005)(81166007)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2022 06:04:51.4562
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 cb97be25-1250-4831-ed05-08da21ca846c
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;Ip=[194.138.21.72];Helo=[hybrid.siemens.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5EUR01FT042.eop-EUR01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR10MB3656
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 Apr 2022 14:22:18 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96689

Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
---
 .../recipes-support/poco/{poco_1.11.1.bb =3D> poco_1.11.2.bb}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/poco/{poco_1.11.1.bb =3D> poco_1.11.2.bb} (=
97%)

diff --git a/meta-oe/recipes-support/poco/poco_1.11.1.bb b/meta-oe/recipes-=
support/poco/poco_1.11.2.bb
similarity index 97%
rename from meta-oe/recipes-support/poco/poco_1.11.1.bb
rename to meta-oe/recipes-support/poco/poco_1.11.2.bb
index 3cfd49fcd..db762be44 100644
--- a/meta-oe/recipes-support/poco/poco_1.11.1.bb
+++ b/meta-oe/recipes-support/poco/poco_1.11.2.bb
@@ -9,10 +9,10 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D4267f48fc738f5=
0380cbeeb76f95cebc"
 DEPENDS =3D "libpcre zlib"
=20
 SRC_URI =3D " \
-    git://github.com/pocoproject/poco.git;branch=3Dmaster;protocol=3Dhttps=
 \
+    git://github.com/pocoproject/poco.git;branch=3Dpoco-1.11.2;protocol=3D=
https \
     file://run-ptest \
    "
-SRCREV =3D "de61f0049175a941cc83c2615c3bdc5e947b89f9"
+SRCREV =3D "96c0bf6d788f7a86a05c05a24b06e1b1393cb99f"
=20
 UPSTREAM_CHECK_GITTAGREGEX =3D "poco-(?P<pver>\d+(\.\d+)+)"
=20
--=20
2.34.1


