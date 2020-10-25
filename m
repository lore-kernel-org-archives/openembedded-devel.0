Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.78])
 by mx.groups.io with SMTP id smtpd.web08.3279.1603656681029848738
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 25 Oct 2020 13:11:22 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@skidata.onmicrosoft.com header.s=selector2-skidata-onmicrosoft-com header.b=RNIaIsne;
 spf=pass (domain: skidata.com, ip: 40.107.22.78, mailfrom: richard.leitner@skidata.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P4acmBj1+3UwQlILdIe/Fc2Sz/FYmr/xJJdqBYrQ/aIYcDs26O7LHASY3pkPYICjJaVv+IGsJBvGkrz4b1YE0ppsFkuf2E4sRSAOfxCvPDAgYw+o+ihpQlpfgP2MpmR7jLGRvQmPW6R2vzULcnu17/nlk90BgxOe2amEOvWq9IysjowYWtxpxRnoal/2gqZtrhmoiPwCoiRjT8z0e0osCpc3OKeWgneJh2klbblngr2ngp7Hnz5rGFV2+seAUPyl1EBOWGYC6sG1n45Y7ZEw8v9wP5DDbW3w3AR6JxQ6Tbc0KEaPM6SBfkurvuTdPQbdKXmizayaBPHfChFtyiF0zA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I+die9HVd3bdFt+UkuJ5KzndJm0UNeEAmBJpejQwE7o=;
 b=IZ/fQ5KMOINMOPh5KC7TcccQ5QrfTEbqJaHjutTyMAuImoHBJkjVScdi7VeKLZ1lPyjPt6qkWtLN3POLIGN+aOKASmXz0VER3CpYcSgAGo9REkKrIu09505LUT43yK44e4fd4YeP7rDFJIO+DN3Q3ejLJ5yB2OcFEEJxjUCwAHTNcONUp7DaGNhSGThdsJbkQlwMm1D1GjhHGJqjMZaR7v+EV8TaRsuJA9dO0mG2tKdq2bUY0PRw8zgbc5KNV/lotm7q6wbRUeiWvGPAEBQ6OAGX2wIAT5FbZJSiol/hyOrz/dHIIHxAGc1Vx4uXtz5L/8stWv8J3EbQmxwjqoWvZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=skidata.com; dmarc=pass action=none header.from=skidata.com;
 dkim=pass header.d=skidata.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=skidata.onmicrosoft.com; s=selector2-skidata-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I+die9HVd3bdFt+UkuJ5KzndJm0UNeEAmBJpejQwE7o=;
 b=RNIaIsneJTuMdFmueWXWCHgDFbkDvHDVJdi4vXEglCaUnAHz8anwUTDWRVMq8nHRLk0Hmg9XYP3WaybbBuxcRVy89fpr7JCr7QLf3Qzmx8thj4+BZPFjjMFHk9D4sVdygZJS+mxoDpS4qCTL1DfZNi4se0elq1RFNrIIrB8BN6k=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=skidata.com;
Received: from VI1PR01MB5007.eurprd01.prod.exchangelabs.com
 (2603:10a6:803:9d::19) by VI1PR01MB2973.eurprd01.prod.exchangelabs.com
 (2603:10a6:802:e::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18; Sun, 25 Oct
 2020 20:11:19 +0000
Received: from VI1PR01MB5007.eurprd01.prod.exchangelabs.com
 ([fe80::a162:c96a:232:50ec]) by VI1PR01MB5007.eurprd01.prod.exchangelabs.com
 ([fe80::a162:c96a:232:50ec%3]) with mapi id 15.20.3477.028; Sun, 25 Oct 2020
 20:11:19 +0000
From: "Richard Leitner" <richard.leitner@skidata.com>
To: openembedded-devel@lists.openembedded.org
CC: Richard Leitner <richard.leitner@skidata.com>
Subject: [meta-java][PATCH 2/2] openjdk-8-cross: replace BB_NUMBER_THREADS with PARALLEL_MAKEINST
Date: Sun, 25 Oct 2020 21:10:41 +0100
Message-ID: <20201025201041.378088-2-richard.leitner@skidata.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201025201041.378088-1-richard.leitner@skidata.com>
References: <20201025201041.378088-1-richard.leitner@skidata.com>
X-Originating-IP: [83.215.125.121]
X-ClientProxiedBy: VI1PR0902CA0041.eurprd09.prod.outlook.com
 (2603:10a6:802:1::30) To VI1PR01MB5007.eurprd01.prod.exchangelabs.com
 (2603:10a6:803:9d::19)
Return-Path: richard.leitner@skidata.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from brokenbit.leitner (83.215.125.121) by VI1PR0902CA0041.eurprd09.prod.outlook.com (2603:10a6:802:1::30) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18 via Frontend Transport; Sun, 25 Oct 2020 20:11:18 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2f402910-f7b1-41c8-1e98-08d879222288
X-MS-TrafficTypeDiagnostic: VI1PR01MB2973:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<VI1PR01MB297312B173115904E7101CEBF0180@VI1PR01MB2973.eurprd01.prod.exchangelabs.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:376;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ECjV6T+nd/LMpPCKuw4csmE1fiwfxRoNddcNPZPgg/CEbGRJUpgimd3x2G+Q2vCVsA2zUuv8Gm5LuL/9NWJ5kJi5c4NfTQqVTcdkRbNwPutv+RnZeFsWiQso9mi4OoN4V3jFr+q+cihvfzk8RXckimLkwIzgf2ilz3ttQ65Ig9v5tChEVCIlqYLowiMsYiWoy5t9+aKYmfTcoOTny6jcxkeqDTfplbC6YocpQqytlJpd/LJ898Nd3F2/2vTMYR1CQ5I0trj7oP40nG2r/w5Znv/ow0Q+yDc5bDv99mS9kZs3vWx3dH9nwl1T/gAtoHVgwfn/rIO0pHFw/MXgGDBxBQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR01MB5007.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(346002)(366004)(376002)(136003)(396003)(39840400004)(6506007)(956004)(6512007)(107886003)(52116002)(8676002)(2616005)(186003)(86362001)(44832011)(1076003)(36756003)(4326008)(26005)(16526019)(2906002)(478600001)(6486002)(66556008)(6666004)(66946007)(316002)(5660300002)(83380400001)(6916009)(8936002)(66476007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	AP7ONeTxvExv7xlowcE8hCu7l53+qrxnq7pfAXSZgajytb6Gxg/We0kAjbltvtyB8UwAyFwlWcRP0g6HR75/fiOjGTMvdlUjwug69SL16+l7/DAd7XVY7g9gjGlA9eudDyes/N4jHUV6bWL9CBiXFDwBf7XsRXZ2UdGjwOw+LL4vEFS/nI//Jp2TsnFi9pwkacZ+EYsOZpnbUHtXDgMNiFtOtHe81pg4ycdFepZyhirMw2DkXKuuTAHuSkMaIy9nCReIRUL1IE9mf3oDUOvewumkgfrJYIv3GR50bUekXEBqcmegkIj7LQVzWRknedOG4tfTvxD5ticfurF/bwTIeJ0yP2Z9vhCd6Z9nIpjuSI1R8DWFQLNNneAKapHfBrTqSl2qt6KsnV+OGMrxolZ9ApRXaOWsYqvu4n0I2Z4LxTL72njz1rUNJ8/qgWtfldfW/ghmvWG3UoWGY3cvUDJJFaNMgJNhrq1+woVcWy0J3XSp4OTS6h0uzV/WKPfhlYFybcMw2uCwlJDWCil8Rn7sEtGpLHT1XFHytZjJvpWTKeMEhpE5iX/L9Y0bul4s//d71FFiZH+UuzCCADh65mgUSeNDki6ORK0qKZJNf2n63DsfwVh8oFxGIaQqqxVzpHzEFh9oucWTKVDZLcmumqyNKg==
X-OriginatorOrg: skidata.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f402910-f7b1-41c8-1e98-08d879222288
X-MS-Exchange-CrossTenant-AuthSource: VI1PR01MB5007.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2020 20:11:18.9539
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3d52ce8f-cef6-4b27-bace-cf9989cf3973
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M0g4zzK9BrRRN3//ta7ocDex9RorpcaRbzbrr8ZkWxg31TwQgr0NIjoUCiqv54k7uLDMNOjMZzKZNII+bMjSK0gJ0+4h77n7oGTZA47Om/M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR01MB2973
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

do_install_append of openjdk-8-cross should use PARALLEL_MAKEINST
instead of BB_NUMBER_THREADS.

Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
---
 recipes-core/openjdk/openjdk-8-cross.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-core/openjdk/openjdk-8-cross.inc b/recipes-core/openjd=
k/openjdk-8-cross.inc
index 9f68d08..04c7ae5 100644
--- a/recipes-core/openjdk/openjdk-8-cross.inc
+++ b/recipes-core/openjdk/openjdk-8-cross.inc
@@ -86,13 +86,13 @@ do_install_append() {
     if ${@bb.utils.contains('PACKAGECONFIG', 'repack', 'true', 'false', d)=
} ; then
       if [ -d ${D}${JDK_HOME} ] ; then
         find ${D}${JDK_HOME} -name "*.jar" -print0 | \
-          xargs -0 -n1 -P ${BB_NUMBER_THREADS} sh -c ' \
+          xargs -0 -n1 -P ${PARALLEL_MAKEINST} sh -c ' \
               echo "Repacking" "$0" ; \
               pack200 --repack --effort=3D9 --segment-limit=3D-1 --modific=
ation-time=3Dlatest --strip-debug "$0"'
       fi
       if [ -d ${D}${JRE_HOME} ] ; then
         find ${D}${JRE_HOME} -name "*.jar" -print0 | \
-          xargs -0 -n1 -P ${BB_NUMBER_THREADS} sh -c ' \
+          xargs -0 -n1 -P ${PARALLEL_MAKEINST} sh -c ' \
               echo "Repacking" "$0" ; \
               pack200 --repack --effort=3D9 --segment-limit=3D-1 --modific=
ation-time=3Dlatest --strip-debug "$0"'
       fi
--=20
2.28.0

