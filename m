Return-Path: <ceggers@arri.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7EC53C3DA7D
	for <webhook@archiver.kernel.org>; Thu,  5 Jan 2023 13:11:51 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.137])
 by mx.groups.io with SMTP id smtpd.web10.12337.1672924304603724495
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 05 Jan 2023 05:11:44 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@arrigroup.onmicrosoft.com header.s=selector1-arrigroup-onmicrosoft-com header.b=rulqwGas;
 spf=pass (domain: arri.de, ip: 40.107.20.137, mailfrom: ceggers@arri.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K/JtYocx59HdShrjNVIFJP2YFTeLXzMyM5iXw/zMeBiesFfvKn0kKqB2KRi5eVkoW/BJAbmmNtCQfOZtIUtI1LAEq8nDNlIA+XR/+YH5tq169AVN1b6ELFGA9I3FbYhTkYiBy6s2viBEpr0vPh4UswR1tmbD7TwsuGFQBYyhJywYRTdMB5zNjS0hOG106ERTTlTadxuCDV0/qr527C72WfV7/0FqFZb/cwLIU//1S0uK2TpSbsot/Am37rcYuGh+lBhJvYjXEunCRKQp326YMzwsk4rBEB4P1qHbcug3KuYOdmljFwJTInhepSy5CJwHSZhDq0CXfAxzOT/zD2Q0jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O6+MvOtJX/6ikMGZgoH//7FNB8TOEd/zxR9AzZAXkjM=;
 b=RVVwiMS8anKZbGKc40B1rUsLwCIs+/H9ZLdraemBk7gfk653dQu0FUFG4xc95On0zI4kS/8KI15D46M47oaB/52pUqQBpikkfnMnbFPp1ILsFRJSH6knttGsvRKsa4eBGiz5NJSPzNffNsshd+uIQ9sQbIrk3j+05flEifJ78GGAx6nI7T4YpkQiANM3HWC2zHyMctvVkdUD1IdwY8a6+7sQAih1gSRXDjGLi6LZ8hiitL4bvGnnwB1rK0lTFfaAy0SdBnE9U7bl+yH87UIcsBiD7+v6238lWV8I1qz/oO7+GlTkM18Vi6A6Ph3Tc8wE5WL8AkUYiMD2k7vyN1cBBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 217.111.95.7) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arri.de;
 dmarc=none action=none header.from=arri.de; dkim=none (message not signed);
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=arrigroup.onmicrosoft.com; s=selector1-arrigroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O6+MvOtJX/6ikMGZgoH//7FNB8TOEd/zxR9AzZAXkjM=;
 b=rulqwGaspvdsIw/4uSD1mCBmaWimSFAxnAbEGVSiKMEpOTwAaHLo6U9Mrw3YGeOmShYotahCOGCq1J7jyFziAMu06Zh1fOGVY6cPiEEWJxEtvoNC32RJ6vr1wesBZ35gDoMqIkmkCC9fN98xsmSsb8GQ9b6lCm6+lAE3U6Wq6eo=
Received: from AS9PR06CA0779.eurprd06.prod.outlook.com (2603:10a6:20b:484::34)
 by AM7PR07MB6964.eurprd07.prod.outlook.com (2603:10a6:20b:1be::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Thu, 5 Jan
 2023 13:11:42 +0000
Received: from AM0EUR02FT041.eop-EUR02.prod.protection.outlook.com
 (2603:10a6:20b:484:cafe::81) by AS9PR06CA0779.outlook.office365.com
 (2603:10a6:20b:484::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.15 via Frontend
 Transport; Thu, 5 Jan 2023 13:11:41 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 217.111.95.7)
 smtp.mailfrom=arri.de; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arri.de;
Received-SPF: Fail (protection.outlook.com: domain of arri.de does not
 designate 217.111.95.7 as permitted sender) receiver=protection.outlook.com;
 client-ip=217.111.95.7; helo=mta.arri.de;
Received: from mta.arri.de (217.111.95.7) by
 AM0EUR02FT041.mail.protection.outlook.com (10.13.54.114) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5966.18 via Frontend Transport; Thu, 5 Jan 2023 13:11:41 +0000
Received: from N95HX1G2.arri.de (10.30.5.13) by mta.arri.de (10.10.18.5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 5 Jan
 2023 14:11:41 +0100
From: Christian Eggers <ceggers@arri.de>
To: <openembedded-devel@lists.openembedded.org>
CC: Christian Eggers <ceggers@arri.de>
Subject: [meta-oe][PATCH] boost-url: remove recipe
Date: Thu, 5 Jan 2023 14:11:26 +0100
Message-ID: <20230105131126.30175-1-ceggers@arri.de>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Originating-IP: [10.30.5.13]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0EUR02FT041:EE_|AM7PR07MB6964:EE_
X-MS-Office365-Filtering-Correlation-Id: e47bd024-aaa4-4136-e3a9-08daef1e6315
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	CCIF7s8FwQdF1FjKKAJsqHJdJPrXAN3+gkaGlpqYtFoGchX937Z1YS+twuver3IT2qNaLJHthpXmFng50kd2wCLfS+ZhPm46+Kd43RU/zt5XSITV5oJHhQMBxAxXYTSpM/NatX1nLrEAPjq0NYpPszzQW8cVP1QFK38I8j6sVA0viSdo9oo0ethWvCJwXu1wXu0uHx9n8i27JePp6kJn6msI6R3iFWdXqg0pRlzUju9toK95dZP0SdcmyPdcIYMdpVdvDUPza9v/a7wMSSItoRTLDOI7F2HdZr7UceXyQVhUum7Lk5bDFGeAFUTnXmPaqGMLry9wLgNpfa9eDPfxrX8N87eiKhSNWqJWLFTqVuvc2DAj06XkVOj2p2BY+xzEY/D1eFicSQJHfMx5I/D/jz2mzsQuPPL/Q9lBJCErcNIFNEaaSyJPilXSvU2hdmT+v+oImcsoiWk7wKpADoXnMSn2/Q1evYUZ/g9hp9N1/g+MeQPeXVDso0Z4A/NN+i15p5rsXs12O0BTEUKtpAoSQi+B1pml1jawgD6511cOVP66HnvXVIkrtaFX2vuoG6ctW0+Uug9LxWRVEE5u8n2Vb6nNwgFhNJ2YwnAxaJpu2ZExes2XlskgpValWnt774hPTHLtvFUFRNrIB8zJECDRt05pF2NHBzpGR0B/JIBsN+rNuRkJmCI85DtfOPD7L2WUQBc0hdUfYuD5SdsUHvPCf8uQFIaFUhyOPP9KrPD2kWBxSQeotSlmNmXQDNK2zZ2H7SFrxmB0cwXM2AfWoqPzlVwRvJvty2qzvs+7lYv/pII=
X-Forefront-Antispam-Report: 
	CIP:217.111.95.7;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mta.arri.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(346002)(136003)(39850400004)(376002)(396003)(451199015)(46966006)(36840700001)(2906002)(36860700001)(82740400003)(356005)(36756003)(40480700001)(2616005)(70586007)(316002)(16526019)(6916009)(82310400005)(81166007)(86362001)(4326008)(47076005)(83380400001)(5660300002)(41300700001)(426003)(8676002)(336012)(1076003)(7696005)(8936002)(478600001)(26005)(186003)(70206006)(6666004)(107886003)(36900700001);DIR:OUT;SFP:1102;
X-OriginatorOrg: arri.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2023 13:11:41.6314
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e47bd024-aaa4-4136-e3a9-08daef1e6315
X-MS-Exchange-CrossTenant-Id: e6a73a5a-614d-4c51-b3e3-53b660a9433a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e6a73a5a-614d-4c51-b3e3-53b660a9433a;Ip=[217.111.95.7];Helo=[mta.arri.de]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM0EUR02FT041.eop-EUR02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR07MB6964
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 05 Jan 2023 13:11:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100414

The boost recipe in oe-core has recently been updated to boost-1.81.0.
Starting with this release, boost-url is included in the boost
distribution.

As a prerequisite for creating the -url sub package from the boost
recipe, the boost-url recipe should be removed in order to avoid
conflicts with installed files.

Signed-off-by: Christian Eggers <ceggers@arri.de>
---
 .../boost-url/boost-url_git.bb                | 20 -------------------
 1 file changed, 20 deletions(-)
 delete mode 100644 meta-oe/recipes-devtools/boost-url/boost-url_git.bb

diff --git a/meta-oe/recipes-devtools/boost-url/boost-url_git.bb b/meta-oe/=
recipes-devtools/boost-url/boost-url_git.bb
deleted file mode 100644
index 14da3ca3f1af..000000000000
--- a/meta-oe/recipes-devtools/boost-url/boost-url_git.bb
+++ /dev/null
@@ -1,20 +0,0 @@
-DESCRIPTION =3D "Boost.URL is a library for manipulating Uniform Resource =
Identifiers (URI) and Locators (URL)"
-HOMEPAGE =3D "https://github.com/CPPAlliance/url"
-SECTION =3D "libs"
-LICENSE =3D "BSL-1.0"
-LIC_FILES_CHKSUM =3D "file://LICENSE_1_0.txt;md5=3De4224ccaecb14d942c71d31=
bef20d78c"
-
-SRC_URI =3D "git://github.com/CPPAlliance/url.git;branch=3Ddevelop;protoco=
l=3Dhttps"
-
-SRCREV =3D "d740a92d38e3a8f4d5b2153f53b82f1c98e312ab"
-
-S =3D "${WORKDIR}/git"
-
-DEPENDS =3D "boost"
-
-BBCLASSEXTEND =3D "native nativesdk"
-
-do_install() {
-    mkdir -p ${D}/${includedir}
-    cp -r ${S}/include/** ${D}/${includedir}/
-}
--=20
2.35.3


