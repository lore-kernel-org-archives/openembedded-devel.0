Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CE10C4332F
	for <webhook@archiver.kernel.org>; Wed,  8 Nov 2023 21:39:40 +0000 (UTC)
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (FRA01-PR2-obe.outbound.protection.outlook.com [40.107.12.110])
 by mx.groups.io with SMTP id smtpd.web10.59168.1699287917140805288
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 06 Nov 2023 08:25:17 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ekinops.com header.s=selector2 header.b=nh8c3rZK;
 spf=pass (domain: ekinops.com, ip: 40.107.12.110, mailfrom: benjamin.bouvier@ekinops.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ibn7UI9oaZ7KPXI+5oS2AZhNC0EO9CQDcuJWfXkd3Dxhdv+Mgdvao8AnlWJ5Shv2g7Z0jOKLcrMwy1LcuFocOQzkG3zDkbTDcj8QnAjMvf8a5noNGWyRm8u/9snANcYJekzUeXjHzsJusNW7SrvBuAYXz8D9Ysfxxz65Z6ExmdsD/fPcHj2VFfcGQ1wKBeaNPO4/c4ooVfQq/q9nMUaNzHNe2N50HBSRy3RzIv7hobSX8o0WJyRw9VX81iJhle5hXg9t+MMFeyTGLCM7q0u6M6mgIpe6EQ3MD9qcWLcurSTsoAV3eOkohCokE093/yY+d+XTwzb0cqcIT5Lw2QwZ9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XgBo5repiJQyWtpsu2XfU62B1e3ztzBmqENzdmNkglY=;
 b=Aw7TRhXqOifA/jL/ECkWuq+/IdDVIO/3PuUg9O1stuZB3Q/xkPTgJoa8cNkf+TJ4BoohVbeYPb7KTGIxS9zR+dAF8DePYoDLqBheJe+0dDXEaKOqT/fZE6f8Vx2bhHXhy0UNooHjtGz6zp5wnHp8WoVQmgwUyNqbhnf2Vfjb+9MqW4vW/KGmBSejTzR12wie7p6XXsIlaXOL8qi5yLU2B1clJ178l+TQlicyRUIedzdk2pJ5URoPTNKz4DQaLWzebG71G8a71lhcZHDsgvpqaZQGo4mwalTXPEFiSlafj4tqV9QO6CjHxiorK+C4pRzHv58WAuNc2c6QwXmXAFk6Ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ekinops.com; dmarc=pass action=none header.from=ekinops.com;
 dkim=pass header.d=ekinops.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ekinops.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XgBo5repiJQyWtpsu2XfU62B1e3ztzBmqENzdmNkglY=;
 b=nh8c3rZKCsFHPwWEAk/OHTU21wTHgOESNJvTC3mv4/MANgfb3cXOiHIzXxVsR9iirDyM532w7KKZ/JLHBlafihXonG0o067Pn2BCOD6a3OEmFM218yR4UckS22I//q7jzcQTmpsxrVmdmrJIeIi5JCDsJVEDexGyqmIwIAERS9I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ekinops.com;
Received: from MRZP264MB1781.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:f::5) by
 MRZP264MB1752.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:8::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6977.16; Mon, 6 Nov 2023 16:25:13 +0000
Received: from MRZP264MB1781.FRAP264.PROD.OUTLOOK.COM
 ([fe80::5826:6cfa:9d9d:872d]) by MRZP264MB1781.FRAP264.PROD.OUTLOOK.COM
 ([fe80::5826:6cfa:9d9d:872d%4]) with mapi id 15.20.6977.016; Mon, 6 Nov 2023
 16:25:13 +0000
From: "Benjamin Bouvier" <benjamin.bouvier@ekinops.com>
To: openembedded-devel@lists.openembedded.org
CC: Benjamin Bouvier <benjamin.bouvier@ekinops.com>
Subject: [meta-oe][PATCH] libsmi: enable native build
Date: Mon,  6 Nov 2023 17:24:47 +0100
Message-ID: <20231106162447.1120840-1-benjamin.bouvier@ekinops.com>
X-Mailer: git-send-email 2.34.1
X-ClientProxiedBy: PA7P264CA0069.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:2de::16) To MRZP264MB1781.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MRZP264MB1781:EE_|MRZP264MB1752:EE_
X-MS-Office365-Filtering-Correlation-Id: 16c78aa6-09db-4f64-067b-08dbdee4f3e2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	NskJvgy9fzJ5zuxTyk295ua6Yg+xFEz5eAl4i6yylVy8IBjU3grtzt0K7BXVS5ieyTYO9KUEOu4MGamrqyRdXYs98CcEAeh0MXXW5kVj571Iae9SW9699iiVAWSj5lwb25Tey7I1+YaNc1HpNzPYk2aKB/U9d7ENy+cvU10UCSTAsEypfgsMN7tU6Gs6rWbN3sxL4Y5TWjW9y80BU2nn2xo8J6fKNARrtqB1cvVvBCB22m/d+UvmELANGLKndqC1dyejVg6hh4IQeZQXxhrAEC0H4XmL8DMByP/UUdSlcKK1+VDWhl7iLtHAphB5fvfVCnkWzGAoc0orRbfdewVZBZOo21mb5GVFMOQq/Hi+0Bl7W8Al5DDYDSzhwalEuLHZP5WtikDbXH/e83Q5htykN3dxw1hAq12o136sbV/PH5p42kNAYCOnUsDzDJp7vp8H2/BlHj04Dt49/EMXpAWyTVB8HuFaZN7TnhVIwRVkVXH/Fapg2QYE/zQXFGu99IQFRuYfa3EQehQuvWiUKrHLZN3OtyZ1CJdkUJSYoXczyVsKWwyIYOb2JRPp7AtsR36GzK3gFqYdo9L9jCWK82ZuYuzeqiy397wFFhWBuzFtNtY=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB1781.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(39850400004)(366004)(136003)(346002)(376002)(396003)(230922051799003)(186009)(1800799009)(64100799003)(451199024)(83380400001)(316002)(6916009)(38100700002)(478600001)(6486002)(6666004)(52116002)(6506007)(26005)(66556008)(6512007)(66476007)(66946007)(2616005)(107886003)(1076003)(5660300002)(2906002)(8676002)(36756003)(4326008)(44832011)(41300700001)(86362001)(8936002)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?l9W6LwC5W5dIeLaudnc3r1N8+zDw+qfzR9lq2fy/odJvJLaWeki1A58znWeK?=
 =?us-ascii?Q?kmBQ+GGlucLCg8oJ2k5jxmixJjLVMXMgSd39S/bUhkvuu/geLGS6vg0NiUlX?=
 =?us-ascii?Q?Aqpc5zB/z8D60MFIRQJh2ksRB7b6LiXqfECxpk2E7lBbF8rkBC+rlK/o4dvt?=
 =?us-ascii?Q?el9ey7WDjyYR3vVD4gqzx8zoRPU2Ngk6yGO30qeFD+tF/aSi1ntd+fgdyBsz?=
 =?us-ascii?Q?ogXhRVehamXPRH6cwiNkoARfjpG/Urm8grFR/hrY/UjlmDGyEbiOjCin4UOB?=
 =?us-ascii?Q?fdrlkRL4gKRgIFy4hH9pIc5jR3pGEnkDCNg4pFC58Du2vw6Gs8o174vAMdED?=
 =?us-ascii?Q?U0NEPAoHfUXQFq5ds0QAdcs363koc/TTMhGbkvT4fUTZ7G1QQEo7fnFoaic0?=
 =?us-ascii?Q?nd1cRyLOTF2ryvIrHEC9+oHCFyGUcHAxqdnwlM+XQ5Ne5sxEim0hy+7nEqsg?=
 =?us-ascii?Q?M3Rf1CLFL9cn7N0RgZDpyKwTwNAJ88YHzjlPKZ2PsexoM7xiqiwjAVE97Gx8?=
 =?us-ascii?Q?NwTSaMAFkCwm3JjpYclrB/TPq8ROB9hmRs4+DkGolzEAZ6R40gUdGmjtBTug?=
 =?us-ascii?Q?uElLSu1ZHaD4chZruqFkiRI9z3wpcGd8bO9FaGEdBi9S5+4JjptwkoM5AplK?=
 =?us-ascii?Q?awMHAOHzfMyuzE79Ki6N82yLCEQ1B8XnNVckwQCYD0yZ/iYJUmrZVjuF0U9a?=
 =?us-ascii?Q?LjOPl1WA+g8P07zuXd+dR61ZaAs56X5xbTAxqkjM2RpVRj6njvMSoKX2bjgP?=
 =?us-ascii?Q?WjHkkW+hiUAQJWJhUMhfrYNxGUAxHTOz75QxId9oaB2RIfe5eqQYni2GK8Zj?=
 =?us-ascii?Q?smwQ4L+oeb1XOTBmnHoe0kfCDS5HIrlOhHRqFPi7PJYee6Ey3uPshrOykhcU?=
 =?us-ascii?Q?FQIvlM/MOs0eaqYSbmXmc8gDC5xiFGdMsFwJwFetxA44HdwZgjpgQmUyAJXG?=
 =?us-ascii?Q?nI3Czqs7eDn33U2F0V4/1TI/pfLCrcS56t2nk1Blkz1Mm0T7nb7awpMwAj8K?=
 =?us-ascii?Q?+TjND/0iVWC3MaXKbbhRf0rAoZIkhKZWVNYDxL32jhzvBrctLzg5sdgQXdJu?=
 =?us-ascii?Q?zh2JuFC6oMBqqaAAS00+sgz0dyY8RCf3g9IPqawYy1eZHpXfxOYFGexUa9Kl?=
 =?us-ascii?Q?c4Zh+b2bPt0EdPebD6joPkwLdXKm2AhXmSfpBvsEjEKBI6lBmrHD+RgNus1D?=
 =?us-ascii?Q?jlE605xDEeh0N1tQmxhhMFIsnziZar1/RE6CifyFWUlojHMu91BrN4xqEOEv?=
 =?us-ascii?Q?uIPNSutLaGTpCWtXHk6kinp+v1ujPSIUL9o3w/3qNUIQfLADhCToW5uGg0ba?=
 =?us-ascii?Q?HHgJuJNYqxuocMFRSq+KKEjuzVLzmEimoZHf13CsnrYGf2HS9iDqv4J9aGHL?=
 =?us-ascii?Q?2nxKWqStsPX0zbl2qtBRdQnpkBdHeA8pkrb2KpjP0emqJCU3gYjC+N05bcXe?=
 =?us-ascii?Q?KoAc4ZVAheg11nqQMO+kdtQE0bv+dVn8XAJQoIw0Vmz3rhY59s9ZyhdU9e1r?=
 =?us-ascii?Q?hxK+ucS+kzpxt098XtC1oOAbgh9pdGRkxbIhUghxMbsJu+6Aep2epSQ5IWnV?=
 =?us-ascii?Q?DNSVrwXvpUTl88+b6nmhF36nvYPDns1kWEVeg99cGe9c1OLEm3vo0kCdgAHN?=
 =?us-ascii?Q?ig=3D=3D?=
X-OriginatorOrg: ekinops.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 16c78aa6-09db-4f64-067b-08dbdee4f3e2
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB1781.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2023 16:25:13.1033
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f57b78a6-c654-4771-a72f-837275f46179
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bYVzxQT+46TrztMa1WdfPBCXKml2H4C0wSt22Uxyn8/7uaO0EFsUZMobt9Sm5f3yXPB/5GiNz4oq6krB7MaFoNLCUIRmMFBzACk2u7i2TJU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRZP264MB1752
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 08 Nov 2023 21:39:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106487

Move wget and awk EXTRA_OECONF parameters into native dependencies to
not lock native build.
Add missing BBCLASSEXTENDS to build libsmi in native.

Signed-off-by: Benjamin Bouvier <benjamin.bouvier@ekinops.com>
---
 meta-oe/recipes-support/libsmi/libsmi_0.5.0.bb | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-oe/recipes-support/libsmi/libsmi_0.5.0.bb b/meta-oe/recip=
es-support/libsmi/libsmi_0.5.0.bb
index 33e1b6fab..07e2e2941 100644
--- a/meta-oe/recipes-support/libsmi/libsmi_0.5.0.bb
+++ b/meta-oe/recipes-support/libsmi/libsmi_0.5.0.bb
@@ -14,13 +14,11 @@ SRC_URI =3D "https://www.ibr.cs.tu-bs.de/projects/${BPN=
}/download/${BP}.tar.gz \
 SRC_URI[md5sum] =3D "4bf47483c06c9f07d1b10fbc74eddf11"
 SRC_URI[sha256sum] =3D "f21accdadb1bb328ea3f8a13fc34d715baac6e2db660658983=
46322c725754d3"
=20
-DEPENDS +=3D "bison-native flex-native"
-
-RDEPENDS:${PN} +=3D "wget"
+DEPENDS +=3D "bison-native flex-native wget-native gawk-native"
=20
 inherit autotools-brokensep
=20
-EXTRA_OECONF =3D "ac_cv_path_SH=3D/bin/sh ac_cv_path_WGET=3D${bindir}/wget=
 ac_cv_path_AWK=3D${bindir}/awk"
+EXTRA_OECONF =3D "ac_cv_path_SH=3D/bin/sh"
=20
 do_install:append () {
     install -d ${D}${sysconfdir}
@@ -34,3 +32,5 @@ FILES:${PN}-pibs +=3D "${datadir}/pibs"
 FILES:${PN}-yang +=3D "${datadir}/yang"
=20
 RRECOMMENDS:${PN} =3D "${BPN}-mibs"
+
+BBCLASSEXTEND =3D "native nativesdk"
--=20
2.34.1


