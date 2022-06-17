Return-Path: <dai-de.li@leica-geosystems.com.cn>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99FD1C433EF
	for <webhook@archiver.kernel.org>; Fri, 17 Jun 2022 02:31:37 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.118])
 by mx.groups.io with SMTP id smtpd.web11.26009.1655433088150010484
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Jun 2022 19:31:29 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@leica-geosystems.com.cn
 header.s=selector1 header.b=Zrwad5Zx;
 spf=permerror,
 err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}:
 invalid domain name (domain: leica-geosystems.com.cn, ip: 40.107.6.118,
 mailfrom: dai-de.li@leica-geosystems.com.cn)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WeyeMPfA6BDGRxDD0V3a7WgEHEaDITUxkVONWRx5I9N0/Nvnb1ksg4g/Cml5mKZo91eAGcdC9a/6WNW/ZBBkKzcnX1i4Y5wtBLUCi7bb+LlPF+iqwwMXpqHVwJH18AqJIXlFf65soXWDyk3oVXsfZijkL4FPGhZaPjdRmGelszD/HRakhHNlG1uz7TrtOau9lmTVMtqiCQUCl8jXw5GMkUcm2dLYiaEO8VdFA5M9f/TErc/MN0GctpxfIL6n35ate4pyFg1LybdkxHQ/J2H3eiBPpMBNZN6zK/XEje6G2Hlql5AY0fkS2AS3nemwGIsSFYXmq9kzk2KoADoELaPXyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dEv4QYvZe2wrHXw0lOU2MdYAZozUIUamSoA9wDwwZ5U=;
 b=V2j46v7AiE9XDbQBbqWiRfVi04bt3F418C/7lWu0C+wYHCnVjW2w/v216OyVWJA71DO+TAEYEWMA+o2yTRF87Fb33jdE0qr06OsyrAyxdUfq7RgrhhUJldE2vwtKvkPSn54werF4pPMU7z9XW5n4pjbSyZO+UzvGcxisVRcT5mFgSIo/aIqupW+GlQ0HjdiDEKucBjetElU6iwyK+MMoa1A5Qat9RrSH7DKdhvcDAAnal3C584+YcnZlyFgQjIDx3J1wvTfd/EuDFeOuKp28cVoSu6mvJZHyz0jyX/AVTdl3RHrO+XJOj2mB9rVAz+BEAEXerri29thrP3W0BpZJ0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 193.8.40.94) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=leica-geosystems.com.cn; dmarc=pass (p=quarantine sp=quarantine
 pct=100) action=none header.from=leica-geosystems.com.cn; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=leica-geosystems.com.cn; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dEv4QYvZe2wrHXw0lOU2MdYAZozUIUamSoA9wDwwZ5U=;
 b=Zrwad5ZxIUrB+Q/ek1ZM1E5y9o3ew7WDVP+UEygS3bcZ67DuNG0mdxQ2VBgG1gb5Jxz8VxTxNEn++3nbjv/h92rQkLpNCxrGSLKrC7c12W8sPWytkPPSxxZ28K0emrl7LLvNJz6W7nkaa2gzzv1zVCnrHecKoJ1jEHkTMgduzIc=
Received: from AM5PR1001CA0062.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:206:15::39) by AM8PR06MB7057.eurprd06.prod.outlook.com
 (2603:10a6:20b:1d9::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.15; Fri, 17 Jun
 2022 02:31:24 +0000
Received: from VE1EUR02FT031.eop-EUR02.prod.protection.outlook.com
 (2603:10a6:206:15:cafe::72) by AM5PR1001CA0062.outlook.office365.com
 (2603:10a6:206:15::39) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.14 via Frontend
 Transport; Fri, 17 Jun 2022 02:31:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 193.8.40.94)
 smtp.mailfrom=leica-geosystems.com.cn; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=leica-geosystems.com.cn;
Received-SPF: Pass (protection.outlook.com: domain of leica-geosystems.com.cn
 designates 193.8.40.94 as permitted sender) receiver=protection.outlook.com;
 client-ip=193.8.40.94; helo=aherlnxbspsrv01.lgs-net.com; pr=C
Received: from aherlnxbspsrv01.lgs-net.com (193.8.40.94) by
 VE1EUR02FT031.mail.protection.outlook.com (10.152.12.135) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5353.14 via Frontend Transport; Fri, 17 Jun 2022 02:31:24 +0000
From: Daide Li <dai-de.li@leica-geosystems.com.cn>
To: openembedded-devel@lists.openembedded.org
CC: ldd428@126.com,
	Daide Li <dai-de.li@leica-geosystems.com.cn>
Subject: [meta-python][kirkstone][PATCH V1] python3-iperf: initial add 0.1.11
Date: Fri, 17 Jun 2022 02:31:21 +0000
Message-ID: <20220617023121.1403528-1-dai-de.li@leica-geosystems.com.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: d4dd9897-e8b5-429d-8612-08da50097900
X-MS-TrafficTypeDiagnostic: AM8PR06MB7057:EE_
X-Microsoft-Antispam-PRVS: 
	<AM8PR06MB7057F899EDF02DAA085A520EA9AF9@AM8PR06MB7057.eurprd06.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Yz70sqpi2EobySiI4f72/ObfKiOpJ7zFHSFsiinpdOOfwzPq6ZPQqdwjagD44+43FMwKUPuRIcaxE0PQXtuBSPLC2pr73uV95W18DaStA2taI/JDFJ73iO3jZTyWOkSad0VCQnjbQ+/2tqoKe9FSLWfJ5Ik0YKy6R5pXb/VyEScLolmzD/+oqlxVsyE0FhTEJX1wjeK2QDYUnvHUjevvZ11GuxpliqpVwJysmqclZEa88Sn+0QwamxJI3+mBOY/R9T1dZjHXUzWio9v4x2s8JtLqylE87m0I9bgwUR0AqwP8UQNNuduklsorbSYgLUScYl+LSJBEM7Kx09ccATizoYxMr40knkb8Og10CZ8n0GAoClVIAjhrEP6ef2FrkrgFb3xLyUWzNf2DHhHOdonH14Juf75WP2WNmOWLSXoKt6GZg0izkyEpptYMq9NidTvwds00EAJPTGNkgk/mIEzlwfcA8sLjym8ZRhZFWZnfQFeRT5I3NKGPF8GRoJSud+IqUd8Lxl0MPbpkuGPzALZKn4piRsUaT838hETyNuLJXl8ydEWpxnSjy38jwLSViDBBkURwWjFpm8rKsBL8jPnRpVj1HQCWU1LC/N8ijgC94DYGO9rv840rdie4msLqrCbJDHzAL1qmXHY0HZD5l5qYohuwK9+NfTPZ2CNpV0aOI7c3Xtb9aScRu5MeCdbISDmf1vltK1pYK8Z0DxljxljUAsMjoHz84vNUHBGlTj8jHrtkR6SDZW0yILkZ3+cy8NR/3wi07Y6EM+uiD56G2fZO1Q==
X-Forefront-Antispam-Report: 
	CIP:193.8.40.94;CTRY:CH;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:aherlnxbspsrv01.lgs-net.com;PTR:ahersrvdom50.leica-geosystems.com;CAT:NONE;SFS:(13230016)(4636009)(46966006)(40470700004)(36840700001)(316002)(118246002)(6916009)(36736006)(8936002)(82310400005)(81166007)(5660300002)(6506007)(336012)(6512007)(6666004)(47076005)(26005)(4744005)(186003)(1076003)(2906002)(107886003)(6486002)(40460700003)(36756003)(36860700001)(70586007)(8676002)(356005)(4326008)(70206006)(956004)(498600001)(86362001)(2616005);DIR:OUT;SFP:1102;
X-OriginatorOrg: leica-geosystems.com.cn
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2022 02:31:24.0414
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 d4dd9897-e8b5-429d-8612-08da50097900
X-MS-Exchange-CrossTenant-Id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a;Ip=[193.8.40.94];Helo=[aherlnxbspsrv01.lgs-net.com]
X-MS-Exchange-CrossTenant-AuthSource: 
 VE1EUR02FT031.eop-EUR02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR06MB7057
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 17 Jun 2022 02:31:37 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97532

Signed-off-by: Daide Li <dai-de.li@leica-geosystems.com.cn>
---
 .../recipes-devtools/python/python3-iperf_0.1.11.bb   | 11 +++++++++++
 1 file changed, 11 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-iperf_0.1.1=
1.bb

diff --git a/meta-python/recipes-devtools/python/python3-iperf_0.1.11.bb b/=
meta-python/recipes-devtools/python/python3-iperf_0.1.11.bb
new file mode 100644
index 000000000..36d646305
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-iperf_0.1.11.bb
@@ -0,0 +1,11 @@
+SUMMARY =3D "Python wrapper around iperf3"
+HOMEPAGE =3D "https://github.com/thiezn/iperf3-python"
+AUTHOR =3D "Mathijs Mortimer <mathijs@mortimer.nl>"
+LICENSE =3D "MIT"
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Df7d0900b3d30647cdda002c9549ca40=
f"
+
+PYPI_PACKAGE =3D "iperf3"
+
+SRC_URI[sha256sum] =3D "d50eebbf2dcf445a173f98a82f9c433e0302d3dfb7987e1f21=
b86b35ef63ce26"
+
+inherit setuptools3 pypi
--=20
2.25.1


