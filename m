Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6974CC61DC6
	for <webhook@archiver.kernel.org>; Fri, 28 Aug 2026 08:00:44 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.8])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1514.1787904040132141795
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 28 Aug 2026 01:00:40 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=L4YM2eov;
 spf=pass (domain: est.tech, ip: 52.101.69.8, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IAikXpQocNDY8OqJ9zkJMCiImGEQ6rlOVKbO+JBwHAYxtmNW1OijLq+k9C5zwoxm2ijUZDwWbtiLyZfvzJEfucd9bTsBGilJ/TyymITNef0hjQxTebc5x4VKAub0ENOnogMsl0QSRZ7cR8QhkViEw2vddoet+Fxfw/DOQKhfq0mOpDAfJvsUXflU2iuAsjJT07CYN+Kdt1ewPE3efW7RDDC868Hph+xp4XYfF1ooSrOFFltRMgzfP4A4Nrj+4tm0BysB1ASv5sFlsKw2/6Uh6HgVlUwQjRd/GGBdfhYR87k5V/KgGlHpwo6loLbziqPr4gkgCNS9zHkNE9OhFFkFiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UDSlzcxTMvUbnmHYOGCE0850lcikd+nDhIq5XkuVxfo=;
 b=P3DFhGyyzuAhYSQJ1vP9RRXIWHngmaiW7zSbTp9PEWuTb4EiWMIejTdPLdsKGXoEMbdumPWsm9PdMpQKGXOdSxw5Bn99vuocWKxDHcYXzFBun7HLeN30nh+FMr5i6MkRE1M5qnNiY+vFAavHK7nwWaeB6yiQXhwcMie+pd/FA112Nf9BUt71NzOlt+4am/0fXYlSs+o1oWcc/CcmExPiqXIIaPYQvjpbn1lKy+/W7GwWCtVABi6tsNeQg3vdj+mqmdE0GkKKdwcxauUILjcww9xD9O5j/aG0RS2de7OJqHQ27kdGRvdatc/MT88iLNecZtdNeSSHwqyziovNcY0CjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UDSlzcxTMvUbnmHYOGCE0850lcikd+nDhIq5XkuVxfo=;
 b=L4YM2eovoCWinMtmlGfY9irCIVmfO75ZTgv2b23xSS5SXJNtLcuMmmvGl3aGkqs8RcoOMy/Lh6Yhmc2VXeL06CMSFOpVLkm/OtOcUnnu/Y4EA/wzOL9axQrntp/w8BnC99MNlCUL14233AzGT9Br6J0ekiOQWz+Y5GLRU3zdBhflh4SdRBi2eBlJb3THBz/8xDfX/JnPk7pHGJtiDgX8PU7UbB+3gLZMsPuKe2QVU6TzQCtSMwJfqcVUN5Y6qXAt2U29i1Lgdyt7mOeG4Z2F7BsmPnOTZ+Zoeiqx4/QN0AMJ/eSHjUnYEuCAhf3Cwawq+m1FGTkBLmcpjl8LOW5TuA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ad4)
 by DU4P189MB3750.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:617::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.11; Fri, 28 Aug
 2026 08:00:35 +0000
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85]) by DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85%7]) with mapi id 15.21.0360.008; Fri, 28 Aug 2026
 08:00:35 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-devel@lists.openembedded.org
CC: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Subject: [meta-oe][PATCH] googletest: upgrade 1.17.0 -> 1.18.0
Date: Fri, 28 Aug 2026 10:00:28 +0200
Message-ID: <20260828080028.7645-1-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: LO3P123CA0017.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:ba::22) To DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:18:3::ad4)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PPF66507B2D7:EE_|DU4P189MB3750:EE_
X-MS-Office365-Filtering-Correlation-Id: 94b9a749-76a2-45f2-e922-08df04da709b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|23010399003|376014|1800799024|10067099003|3023799007|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: 
	TJTB3skH2n5bRnU7wK1rWZadBTZb639nlNmAmJpxdwala30sc+1drroZSu+Jm2xOZhK0AaH/+U1+OCv4QXhs3bMG/gMqr0+1S+DOcJEVYDjvOhXG+tToTo4lG25PSbk6jJMSgPhyvkSpUVC/GgLy/EQSPGhFhEQuoyHQKXS83ouPWXjtY3F6J4D+7PaLYJRZ56y+hEj1//xn7XsAR3IRBmu5r5s+783Fye50k/6aDQrdZnyeafQ3EKfMuMCjNaP3PvriqqtZp2veVRJKrI49HOn4M3O+GYnujbVl7gNaasS1N8TMfn8XrU0aVsuntXvHyt2Z9cYWKqQFEVbMS8NjO+QSgF9XHZmfaqPl5dAEzpqqLYTYrMwO3uv6PA72e0bUmFb/b2evHCJr/SnGEDYXKqoGtqOmF+dHJRCsA6Y40YsUOK0DXs+/zPnYmasR1hmUH2yI97BRR1zC/7NpJRepz8rK2EWvMLFd6S1F5BllQ/VAfgUg0SCUUfyUnWQ3b4WUmWJU+cRk1TmHo7SmjvER5HZ2pEUmLe5JGWl1DlzdobXsIDbCXuA7dK9JaSotGcAS7oeMtvDmz8D8Iaw9duwZaeT82Q6uvC/8gpmu0GBYG0xXE8A9jgkEJqQ8pit2sgN5vrSsiucwEVp8kcFosJ9ZMHjlD2d6iTb8laoUWURXlk8=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(10067099003)(3023799007)(18002099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?HhGpXwSwwow/VaLuBRgIUy+vCsZsqEn4obY2auX6+ZJ91QVcQYPDMD3BEOsr?=
 =?us-ascii?Q?WCQj+/8p/Wy58eWrXSqRdnwYm74WUU7f7OG3r51Q/DPeE0C+MMZK3HwLBLTQ?=
 =?us-ascii?Q?E9/qqu0pdomG4VUEv5ZIWY5nTHFOrMuFIRmCldM3d64ngmtU4p3KBoMjRuRJ?=
 =?us-ascii?Q?PlnsmDufm/Xg4bm1SqAtva3Dz9MazMwGILit0O4OVXiqIayJRYOT9dn7B030?=
 =?us-ascii?Q?BxfTk4svF+OAJjn7uH5K7DA/2sAJl3ne54SyYImntyVDnDPBczpin3BKf9Pa?=
 =?us-ascii?Q?OAySYrer3N+wwthCz/xrwMBkPvvtJKUXrRg5C/exnKdDtVMBre2jGnqRJLaU?=
 =?us-ascii?Q?ruzOSvkXbME7Grt3+WFMsrOp1V102KiTDZ9fokYk4RnuNgEIbFgy47ixEtfk?=
 =?us-ascii?Q?n3lZ6fcG/Y2d6FLaToF6FvGje0SGIY9INGxhODEuju1dKFwQnZpkU5X61JRE?=
 =?us-ascii?Q?H+18fdFjIIdLOSKAWlCeKFGSt9nFKTnTnJiyrRS72wZNHkh14NUorgVv7Lk3?=
 =?us-ascii?Q?BQxVT3xc3hAJDPZMknOl5vpAPhpw1ddtm/3pvauSiV2OcJLLMR3J9ScqPz6Y?=
 =?us-ascii?Q?7PsRCsgEDf0RgomJwsMIhJHC5MXBbgolv/2kePGRArzXoSmp5ZjHwWB/b+YX?=
 =?us-ascii?Q?BN0LhVTh8CJDHXKBEr3jmlvI6nv2vkcrSjbEOm/yDgkBxeggZT01VMl2DXmC?=
 =?us-ascii?Q?2RizL6lZH9t/GRNpQ/UQyd9usi6vDL2TJm2O9ymMdoaOg0ZGBx2jv8B8h4w+?=
 =?us-ascii?Q?8sRmWfDMJosbhj+sKu4BTxiSeYs8LiKlyS/TVQUBUtyi1L3lbR/5jFT1prOZ?=
 =?us-ascii?Q?XgABJpp7Xgx9NrTlM5mOk5OP03Y+2liTwfb0KqU2UAZwnbXSK5Thqv0DgHqy?=
 =?us-ascii?Q?46KOrSY1gc0LQcnZfjqrU7ybDxgxc7rYgdYH8He9qMJy6+A5LdTIsiIUWPgV?=
 =?us-ascii?Q?n4CXwgsRHu1dQeUh307UiyrpxEivRzGBzQusKoW6CcFNmy8c6yaUm0O4+8Sd?=
 =?us-ascii?Q?z6jNxk8GIvVxthqrSOxrVVBMWItu7akEMB4bjBlJwxEi81wj7mYgKzWSubnx?=
 =?us-ascii?Q?S+NZSqES0Fh7wbtHTUZh2j1bxQAXdYsgy17IZanaCO0CssWOZmLAP1i7qTOp?=
 =?us-ascii?Q?heFY7oaJiXv4nNdEoxECLdZpqVfFJgga+7M0VYRBEWtEbmesGAuJGDPWPPHh?=
 =?us-ascii?Q?rzmVv2nou/deGabNEA+wdpScvS0b6R9IilXq0Qeu0kydztgrGNnAkyqtJdBt?=
 =?us-ascii?Q?x4uqf+ZhFsbZ0KMH3vUNiFg0DnisIvdRjaG+cAqbSAFER8vVStL86y0+p0hR?=
 =?us-ascii?Q?Myg94CoJXsPmqh+DCpcZatqltfFZMyLAvKndJUu4Vs9DEPHqqwE8UkmdEdkq?=
 =?us-ascii?Q?DoCwEhUByVmmRsPfCDUOEnfybRMAH2W19ZqR4EJxoYb4n76/1skSFG0UfuP+?=
 =?us-ascii?Q?W/uCAlt04z5+wYqIzMfDze3XUnDSnUcgq7NF3vzYxkTBJbVFA7Czes3BvY3I?=
 =?us-ascii?Q?5xTAAGMpWAbRpG/zbyxWbBkfo0lwbVt64UaBaQ1J3x8ClfXp/cBMFu5FB2jS?=
 =?us-ascii?Q?TTisKd19m2A/hC2EkL4dubaKOgD0s1OFzU3vzI/Gtn2PZkF7XGKrHRon5ijZ?=
 =?us-ascii?Q?J3e6p5eW0FGEQtSXvVgCAKIOC00F/QugUyNH36TNCWAPdymD+StLXOrAUZP1?=
 =?us-ascii?Q?wEb5djUZIdMI8LuFJNPvHn0S+fc6ITivZ1d3SFM3i5NI04GPBYZZ4nFrSvf6?=
 =?us-ascii?Q?xF3ZNN6hCGCcOq8nZQYSBNKenGz6Myw=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 94b9a749-76a2-45f2-e922-08df04da709b
X-MS-Exchange-CrossTenant-AuthSource: DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2026 08:00:35.1212
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1wm5IDMgYsTE7NxNAMh42qODHU9VK6jhKp3LniwvJUF97UlW6D55B4uEvKs+ofS9TrPLdFvjRh7iBNKH3GmW+a3VHaRem4A6P8uKgSUU590=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4P189MB3750
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 28 Aug 2026 08:00:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129557

Release Log: https://github.com/google/googletest/releases/tag/v1.18.0

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 .../{googletest_1.17.0.bb =3D> googletest_1.18.0.bb}          | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-test/googletest/{googletest_1.17.0.bb =3D> googlete=
st_1.18.0.bb} (96%)

diff --git a/meta-oe/recipes-test/googletest/googletest_1.17.0.bb b/meta-oe=
/recipes-test/googletest/googletest_1.18.0.bb
similarity index 96%
rename from meta-oe/recipes-test/googletest/googletest_1.17.0.bb
rename to meta-oe/recipes-test/googletest/googletest_1.18.0.bb
index 4d5340b994..3be3e37f72 100644
--- a/meta-oe/recipes-test/googletest/googletest_1.17.0.bb
+++ b/meta-oe/recipes-test/googletest/googletest_1.18.0.bb
@@ -6,10 +6,10 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dcbbd27594afd08=
9daa160d3a16dd515a"
=20
 PROVIDES +=3D "gmock gtest"
=20
-SRC_URI =3D "git://github.com/google/googletest.git;branch=3Dv1.17.x;proto=
col=3Dhttps \
+SRC_URI =3D "git://github.com/google/googletest.git;branch=3Dv1.18.x;proto=
col=3Dhttps \
            file://run-ptest \
-          "
-SRCREV =3D "52eb8108c5bdec04579160ae17225d66034bd723"
+           "
+SRCREV =3D "063de7e9578f82b369302001269680b4b1553359"
=20
 inherit cmake pkgconfig ptest
=20

