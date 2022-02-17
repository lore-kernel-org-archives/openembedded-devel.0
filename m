Return-Path: <ceggers@arri.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B51C1C433F5
	for <webhook@archiver.kernel.org>; Thu, 17 Feb 2022 15:42:12 +0000 (UTC)
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (EUR03-VE1-obe.outbound.protection.outlook.com [40.107.5.117])
 by mx.groups.io with SMTP id smtpd.web10.1354.1645112529015780252
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 17 Feb 2022 07:42:11 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify"
 header.i=@arrigroup.onmicrosoft.com
 header.s=selector1-arrigroup-onmicrosoft-com header.b=zLOvlGcl;
 spf=pass (domain: arri.de, ip: 40.107.5.117, mailfrom: ceggers@arri.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aZdN8eza3tWNbnAi/09dbCYtJyXb8EWXlTkKLEGqkcWL+jh/f7RPanfIN1vYwrfHJzLx4SLboXV/efdVtXjQCurfNC8m2yoHIsNfemLn+sjz8lm/uzKXDMgzL5vJIqiv/U8EO9RzUkP9hitbD+OeWtJ5l+ymfImhHu2I+eh1cxhRas8Qo7sIQj7quiymBdt287yhEowKoarUDjC0QKO33k1rBJywZfzsoO6rlTnVkvplskyhF30PZ/livkGaez8SB4Ei9+ypPXZ4lRSVLEusJfKxZ6uorC3Y9zX2edl3KbdCWc0ww6gzBh1MvgxZUGMbjwSp3T3vUIQwi6fypKpKXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CB5PFVN4kNv0TJYLcuIL8u9gs1CxXdal8eAPiYMiFjw=;
 b=avyrmXwpNVKG5zBgVLPfUG+s2yDRz3MS1JMQFZza2Pajx2JAQO5li5hNc1epNs5f1BFkHmLy3w4qBDh9hy8NMYTXbUr9SehdhxdkvuTqsrR+BpIz1HGVwVqfvtFdiE1HSilTF7MYJgFK933Kad7uAqPmFhUs5pXPXxuK2NqqIaO3orxC3j3gDTuBd/N8iF51ZItsZ2f20I8gqR17Nku51kiOkAszbMo1mzDkh/X3Qai8dHp+WQCyY8RMBV/Hv9vlLRrGszeQjxEnPD1kryVWFoIBVsVbFzKX+agnG4872FPUWFoZqJPWqJX7MVA1RgaJdqwIOMsEhGJXY+QWMPSZZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 217.111.95.7) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arri.de;
 dmarc=none action=none header.from=arri.de; dkim=none (message not signed);
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=arrigroup.onmicrosoft.com; s=selector1-arrigroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CB5PFVN4kNv0TJYLcuIL8u9gs1CxXdal8eAPiYMiFjw=;
 b=zLOvlGclFOBiV/PlKbXakEaCMOvCV3kVc6m4hgqMGqr4nf52vZuFdK9KkTi29WK8DF/JbnYxTVEqK7VAfeyMKWJpi4QMYMpZyN4ExOEcgy47jHm4ll9sBwtZAxE19wWzZqMrf9RlPcp7qGXV9Gd+ma+VUMlTSbeIIXi8NRPQ7yY=
Received: from AM5PR0601CA0042.eurprd06.prod.outlook.com
 (2603:10a6:203:68::28) by PR3PR07MB8211.eurprd07.prod.outlook.com
 (2603:10a6:102:176::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.13; Thu, 17 Feb
 2022 15:42:04 +0000
Received: from VE1EUR02FT047.eop-EUR02.prod.protection.outlook.com
 (2603:10a6:203:68:cafe::74) by AM5PR0601CA0042.outlook.office365.com
 (2603:10a6:203:68::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.14 via Frontend
 Transport; Thu, 17 Feb 2022 15:42:04 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 217.111.95.7)
 smtp.mailfrom=arri.de; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arri.de;
Received-SPF: Fail (protection.outlook.com: domain of arri.de does not
 designate 217.111.95.7 as permitted sender) receiver=protection.outlook.com;
 client-ip=217.111.95.7; helo=mta.arri.de;
Received: from mta.arri.de (217.111.95.7) by
 VE1EUR02FT047.mail.protection.outlook.com (10.152.13.237) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4975.11 via Frontend Transport; Thu, 17 Feb 2022 15:42:03 +0000
Received: from MucEx01.arri.de (10.10.18.25) by MucEx01.arri.de (10.10.18.25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.7; Thu, 17 Feb
 2022 16:42:03 +0100
Received: from CASHUB3.arri.de (192.168.100.104) by MucEx01.arri.de
 (10.10.18.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2375.7 via Frontend
 Transport; Thu, 17 Feb 2022 16:42:03 +0100
Received: from dhcp-192-168-0-28.wgnetz.xx.de (192.168.55.37) by mta.arri.de
 (192.168.100.104) with Microsoft SMTP Server (TLS) id 14.3.498.0; Thu, 17 Feb
 2022 16:42:03 +0100
From: Christian Eggers <ceggers@arri.de>
To: <openembedded-devel@lists.openembedded.org>
CC: Christian Eggers <ceggers@arri.de>
Subject: [meta-oe][PATCH] boost-sml: add new recipe
Date: Thu, 17 Feb 2022 16:41:48 +0100
Message-ID: <20220217154148.31714-1-ceggers@arri.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Originating-IP: [192.168.55.37]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fe7b037c-83e4-4bd6-0987-08d9f22c0bc8
X-MS-TrafficTypeDiagnostic: PR3PR07MB8211:EE_
X-Microsoft-Antispam-PRVS: 
	<PR3PR07MB82116F5448BC717AE8C3D5D6BF369@PR3PR07MB8211.eurprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:221;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	BBhnGsf4aVt+UqiY1xsob0o1urhh9bS8um0qUCPvcHahBJxZpQpy5Byqecl+tjv9u8PYwcfq1gq3OHPb0I9+JITRg5ztb8pWpR1ctR4EYgNHYeSpFXp0VBhjXaVqa9+vqg3vcqvttHr48Tt2NlhkE4fpWv1MJWbMYhJ9b5/55UgactdKIi7L1hQg68YRWRbGrC6ikEJd++8z8o8qRQVvoStAb6pgcGcAr7sNc1NAkG1S6vbZkcLFI4Bg+HQ/BXOQrEbLC3UOY0uATayarx7cUY3YODFA4LyQrIsfcRfr84gFVBtMiKERY+rGdG907vMSgcxDH7ODUkBA5JEZPkX3df6LvSYfpzaVY5ZApN0jEOBob+YEuzQzngPBD3YxHmtqUstfx15bfhAZSdB1kTmmLAhx6QBSQ+heCmjelEN8GJ+95sCy9nUpEp3jR9N4k02HkJOB2Zgsq6emACb7RP4zkgKCIQt54V3CzHON27V51PcVXybOF7iiMVxU8SfSgIxnhpQHeA2Q6I8Zvu6hh/Fa/BUmacYLhL3z9XoYgPrlahvrue4DQtypmukUOxVD8i0Z1XiFHgNhxX8wu21Bam43R1gb5ZqxmzWf9I7csbk6mlNGwtcuiely4YoE989rlol3R6S0xVPCmWdzrgnBwRjpx4IoI8vIb3AdcF50FJz2Q09UVd9xx1CJvQLcGusdm9zYnUMwS6WtCP5WUqGKPlCjrhJuMYmA4NPHPvCl57RrFblaTSnAjQcxqy+6L2Z/iNSTX7jZGc263xhd1Hg1SrerxqAqfWlHds0flgiXTjYYoUdbgjMIQl4iRQP0L86ZvYuzUTDBW5XoAnpyyW3d39nGvQ==
X-Forefront-Antispam-Report: 
	CIP:217.111.95.7;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mta.arri.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(36840700001)(46966006)(8936002)(70206006)(316002)(36756003)(6916009)(2906002)(4326008)(6666004)(508600001)(86362001)(5660300002)(40460700003)(107886003)(336012)(36860700001)(82310400004)(1076003)(70586007)(2616005)(16526019)(356005)(426003)(81166007)(26005)(47076005)(186003)(8676002)(36900700001);DIR:OUT;SFP:1102;
X-OriginatorOrg: arri.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2022 15:42:03.9308
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 fe7b037c-83e4-4bd6-0987-08d9f22c0bc8
X-MS-Exchange-CrossTenant-Id: e6a73a5a-614d-4c51-b3e3-53b660a9433a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=e6a73a5a-614d-4c51-b3e3-53b660a9433a;Ip=[217.111.95.7];Helo=[mta.arri.de]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR02FT047.eop-EUR02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR07MB8211
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 17 Feb 2022 15:42:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95359

"Your scalable C++14 one header only State Machine Library with no
dependencies"

Signed-off-by: Christian Eggers <ceggers@arri.de>
---
 .../boost-sml/boost-sml_git.bb                | 27 +++++++++++++++++++
 1 file changed, 27 insertions(+)
 create mode 100644 meta-oe/recipes-support/boost-sml/boost-sml_git.bb

diff --git a/meta-oe/recipes-support/boost-sml/boost-sml_git.bb b/meta-oe/r=
ecipes-support/boost-sml/boost-sml_git.bb
new file mode 100644
index 000000000000..42b9f1ee3c5c
--- /dev/null
+++ b/meta-oe/recipes-support/boost-sml/boost-sml_git.bb
@@ -0,0 +1,27 @@
+SUMMARY =3D "[Boost::ext].SML (State Machine Language)"
+DESCRIPTION =3D "Your scalable C++14 one header only State Machine Library=
 with no dependencies"
+AUTHOR =3D "Krzysztof Jusiak"
+HOMEPAGE =3D "https://github.com/boost-ext/sml"
+BUGTRACKER =3D "https://github.com/boost-ext/sml/issues"
+SECTION =3D "libs"
+LICENSE =3D "BSL-1.0"
+LIC_FILES_CHKSUM =3D "file://LICENSE.md;md5=3De4224ccaecb14d942c71d31bef20=
d78c"
+
+DEPENDS +=3D "boost qemu-native"
+
+PV =3D "git${SRCPV}"
+
+SRC_URI =3D "git://github.com/boost-ext/sml.git;protocol=3Dhttps;branch=3D=
master"
+SRCREV =3D "bcc8dc7815c0d17ad3a8bd52b202f4e90d4d4ca1"
+
+S =3D "${WORKDIR}/git"
+
+inherit cmake
+
+# Building benchmarks takes a lot of time and requires additional headers =
(euml2.hpp)
+EXTRA_OECMAKE:append =3D " -DSML_BUILD_BENCHMARKS:bool=3DOFF"
+
+# [boost::ext].XML is a header only C++ library, so the main package will =
be empty.
+ALLOW_EMPTY:${PN} =3D "1"
+
+BBCLASSEXTEND =3D "nativesdk"
--=20
2.34.1


