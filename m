Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.70])
 by mx.groups.io with SMTP id smtpd.web10.3327.1603656675227929612
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 25 Oct 2020 13:11:17 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@skidata.onmicrosoft.com header.s=selector2-skidata-onmicrosoft-com header.b=kuWwyrbd;
 spf=pass (domain: skidata.com, ip: 40.107.22.70, mailfrom: richard.leitner@skidata.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W5cloq/RqduuSfQE0F5+9RP4MIZTDpm85mS5tiH53JlpLSH8wszMeDFwhv93aJboy5+S4bjvMfv/t8WtcHH6G1+cIhPIc86+fV3HgN1drPzK4BXoQHO33qBAVC68utjScF9GD6nCB+nKuzIIl0983NP/bmCYxHf2Ua8LoWWWiafIKK71AiEfTqZR+Az9iCAXNXIyrF2BLc2feylAdKMtD7cKjCAxxo8wTQsv8ytPBpuDfuQDeIpzPJymn7ZrnnIuYUHyXROdQvzjdPPlenhB4ZhBAPlWdS5LCdn0qlqtcusiui3ZcvGRfjJ6DiSlFVpsHXu5RuwzUfdx1RDFx7ux4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zZs+xY8O3f/GC+hCCaw+bFoK6W7fyRAmM0a3PenY9P4=;
 b=ZRwddwbk3jBT6MNH9nG4eu6oTaHB1SDhpkVRsXaAybm8V7KX9eRnklNOtdmAbcQmkJnkfS2VDvO61ziCloQr4lZIEMCOiAdY3MK5z20smqMXBNYZIIhQXkpOla8JKeCvt80F1ShaRIE1tBzgOv7YiRp0vRv8puWb6Gyo38qXBKlhtU1Awdh17J/M5elaiu/Sq9QnOhrrK3fKnjzk7pDSNRWpUjF72PbCkYx/2BpdHKiqIhqJXbRvuKiRZjEbYuJwpr6P41HDoChv+h96rxESq7TJiOXAhC6B+9IuZBzmU2EMHmRllgkuqDoh60q1b7PvFYIARFYBFfLOW58JDmdVuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=skidata.com; dmarc=pass action=none header.from=skidata.com;
 dkim=pass header.d=skidata.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=skidata.onmicrosoft.com; s=selector2-skidata-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zZs+xY8O3f/GC+hCCaw+bFoK6W7fyRAmM0a3PenY9P4=;
 b=kuWwyrbdMjdvdQtxV1Ma1dh4zX/NSrFfTInjR0PbLUehLQeZ5KU4NUtQ08lvZ84mUzfE50knPhIvfA4egMeIpASx4IZ+yqAjWtJYOHFYSlBk/a7KW3KMnNgoEjpWN4KlBRXHW4kxGVCTWLRvDxdmdIAWU+8ExVeY0e2FVEn8GoY=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=skidata.com;
Received: from VI1PR01MB5007.eurprd01.prod.exchangelabs.com
 (2603:10a6:803:9d::19) by VI1PR01MB2973.eurprd01.prod.exchangelabs.com
 (2603:10a6:802:e::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18; Sun, 25 Oct
 2020 20:11:11 +0000
Received: from VI1PR01MB5007.eurprd01.prod.exchangelabs.com
 ([fe80::a162:c96a:232:50ec]) by VI1PR01MB5007.eurprd01.prod.exchangelabs.com
 ([fe80::a162:c96a:232:50ec%3]) with mapi id 15.20.3477.028; Sun, 25 Oct 2020
 20:11:11 +0000
From: "Richard Leitner" <richard.leitner@skidata.com>
To: openembedded-devel@lists.openembedded.org
CC: Richard Leitner <richard.leitner@skidata.com>
Subject: [meta-java][PATCH 1/2] libecj: replace BB_NUMBER_THREADS with PARALLEL_MAKE
Date: Sun, 25 Oct 2020 21:10:40 +0100
Message-ID: <20201025201041.378088-1-richard.leitner@skidata.com>
X-Mailer: git-send-email 2.28.0
X-Originating-IP: [83.215.125.121]
X-ClientProxiedBy: VI1PR0902CA0041.eurprd09.prod.outlook.com
 (2603:10a6:802:1::30) To VI1PR01MB5007.eurprd01.prod.exchangelabs.com
 (2603:10a6:803:9d::19)
Return-Path: richard.leitner@skidata.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from brokenbit.leitner (83.215.125.121) by VI1PR0902CA0041.eurprd09.prod.outlook.com (2603:10a6:802:1::30) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18 via Frontend Transport; Sun, 25 Oct 2020 20:11:10 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2f21842e-1318-4e6b-37a9-08d879221da4
X-MS-TrafficTypeDiagnostic: VI1PR01MB2973:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<VI1PR01MB2973464E0702351EB933F0F7F0180@VI1PR01MB2973.eurprd01.prod.exchangelabs.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3383;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	FNN9p1bZmtUHGkCXIdXrjUFt98WJwnjZvepaR+iB0R9ws9vS4+BYTHuSmYgvyIOEkWDTph6i0y2L3jXeNmRnh2pf0zofDNlvyIjCr2v8FBXxkiop3mwY/73rVAAelwAdF4FRmY2PrShYcsQ1Ed095IFNRlq/Wic6oFSa2/qFzzhw4CvwlTw6rp8N333tCjTkE/e4nRKmDI/VMgggww2LQqw6YHIuwt2teYF5DSkhktoQs14/B64aTg5BdTe1zsdsCgBxlAebWrU1iuwXpELcFWgI25cqnq4vNo3W9kDh3fssSNBiB4VPIOJ9fqfnsphj
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR01MB5007.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(346002)(366004)(376002)(136003)(396003)(39840400004)(6506007)(956004)(6512007)(4744005)(107886003)(52116002)(8676002)(2616005)(186003)(86362001)(44832011)(1076003)(36756003)(4326008)(26005)(16526019)(2906002)(478600001)(6486002)(66556008)(6666004)(66946007)(316002)(5660300002)(83380400001)(6916009)(8936002)(66476007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	5XPfaa7WwHc5yyDpjuavu1284B+a1GqBO1n3W4Qmr7Vkp+LvM8UuedL5peUUgAfLbuUuqM9AmkRJfPl++YyMSnh7U4BhY/T+azWnj4VsE7c72srVjQ0xCbyJBnQ1oUB9Metzr93VRY1gXeY+s7+r6x9ffmNsBzntt/lQIKQAAuoK4+vGUkpTH8SsgTEr3c/ZgesRevdBFxpDG/lwwA63tQ9fAmrUuYCFuYSPyNFM/MzrFUM6uz7W9GoLC1CS7eqjlkVRdM4OFOl+rwp0jB5MnIKBa/lkS5Lva+QAJET5ZnzUXZK3R1JfXpXGnTGphWYXxwf406JNbp7V7hx2kezeRcLtesNDb6KCfFS82yg7KDEbzOZnyiPo0fIKkBGuQs7tBdHmEUzyL0GfVdYswJCLTx8PpX2wXTPIHV5yIqQc8zdkFjiEoS3hxKlag7wQo3pdD80GxuFO+g64SrKWEJXaN8q66qGgnsTt2ud8U0IYmIZ7clq0gmx395apbqq5Uu81ujZjB1HYSHB6ignRBkQaKY+dQzEnki3t7yQbm8Acva4icIEbGyHkaI4gUmU1vzolZOqidS+oS1p+go2xZ3pNMTYDbADV93odYssS/9Cdm6HZEir/lATwVcMj5P6oMjFdLprgyIiLuLdChGVrt4WXig==
X-OriginatorOrg: skidata.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f21842e-1318-4e6b-37a9-08d879221da4
X-MS-Exchange-CrossTenant-AuthSource: VI1PR01MB5007.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2020 20:11:10.8844
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3d52ce8f-cef6-4b27-bace-cf9989cf3973
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gIlc2xbmJUzcfGPHdHR5tF5Na4IRLNAQv/c8zG44HTyXSjQ8Wz2q2rLyuGtni6mmZ051AFCEZ/+8wqr6G/W2KY3xNhDNwX90aUUifbSvn+Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR01MB2973
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

do_compile for libecj should use PARALLEL_MAKE instead of
BB_NUMBER_THREADS.

Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
---
 recipes-core/ecj/libecj-bootstrap.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-core/ecj/libecj-bootstrap.inc b/recipes-core/ecj/libec=
j-bootstrap.inc
index 04425f4..47e6a54 100644
--- a/recipes-core/ecj/libecj-bootstrap.inc
+++ b/recipes-core/ecj/libecj-bootstrap.inc
@@ -49,7 +49,7 @@ do_compile() {
   # property files which need to be available at runtime.
   find source -name '*.java' -print0 \
     | LC_ALL=3DC sort -z \
-    | xargs -0 -n25 -P ${BB_NUMBER_THREADS} \
+    | xargs -0 -n25 -P ${PARALLEL_MAKE} \
         jikes-initial -d build -source 1.4 -sourcepath source
=20
   fastjar -c -C build . -f ${JAR}
--=20
2.28.0

