Return-Path: <dai-de.li@leica-geosystems.com.cn>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C672BC43334
	for <webhook@archiver.kernel.org>; Mon, 20 Jun 2022 05:20:20 +0000 (UTC)
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (EUR03-DBA-obe.outbound.protection.outlook.com [40.107.104.98])
 by mx.groups.io with SMTP id smtpd.web10.26557.1655702412305734046
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 19 Jun 2022 22:20:15 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@leica-geosystems.com.cn
 header.s=selector1 header.b=iMi/FW0t;
 spf=permerror,
 err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}:
 invalid domain name (domain: leica-geosystems.com.cn, ip: 40.107.104.98,
 mailfrom: dai-de.li@leica-geosystems.com.cn)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g5xYNcr66LM+iJJUAI/UK00iK7x4uLwZ4EU3LWku0dG7EtYpo3/vCE8Z8698w3ZKroZ21XOZVVUoxtH+Ejk5avX4Brn0TdyPEomYxkMnWG1E/BseTd8VRYcE20B7M02NYCwruuGXMHCm8lfSp00VMgJ7A5eZDhAymIDYNJJGpNgq7vqwMH4T7JJW8dF0Hx8fyP6JtIp4uThvH+vW6pqSHxX7jzI06EJUsy3ra9C7UbWvBZMATtOWkpLTEzd0IQAjdeBfsDc8GpsadU36yo0S6P8f3QnRgGZJBjYB+85OLPT3fedKlzdbv6PjvbqybaIZVNxUkQ23bkZ023Gwz6PIlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dEv4QYvZe2wrHXw0lOU2MdYAZozUIUamSoA9wDwwZ5U=;
 b=hAdfowhA2YzOSy6QFhkRJkJqssO3HTcFPdHxgg9qYWJDZ2k9Yb0ldLPIUz1Xfr3Jg5PbVLhDKzf7QDsO7gjr0iEMuLH13794v4dbsg7eMI1tomXjCUpZEH+rRwGDYfpekISk8zIXPUY91eTLgpRJio/OjydF2CzFX/hqqevNwKb5NlP0/hR9fPqEavZ9gXSu3GJxewuVuPti2Q2UJ5Dj7vgLNyu+5NgK/jwzQXqALDPy4+GkyA9UXDOP6sCHTBz1uP8qXjFI1NCr+jVjxSSq2hgfcIXOqS2xT8/Ff++ZOS7FcdOQ68KulcTSZLnULuRhopdScreXVjkc+UpSoYSxrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 193.8.40.94) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=leica-geosystems.com.cn; dmarc=pass (p=quarantine sp=quarantine
 pct=100) action=none header.from=leica-geosystems.com.cn; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=leica-geosystems.com.cn; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dEv4QYvZe2wrHXw0lOU2MdYAZozUIUamSoA9wDwwZ5U=;
 b=iMi/FW0tHZbmcpufMuuUCqsUdhwBp0slc2MiPwFEnUC5UGObAGzyDAutvfxSuv4sCnsGkdLRBbiQar5mpQicHcE8LWlR0Xa/plF7ehd6Wxfr/WEEttQonzRnmwToDUbIUYzUcrhxMpKRKGdymRZc9IEif2t9tueKboUHGvG0oKc=
Received: from OL1P279CA0028.NORP279.PROD.OUTLOOK.COM (2603:10a6:e10:13::15)
 by PR3PR06MB6634.eurprd06.prod.outlook.com (2603:10a6:102:6e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.14; Mon, 20 Jun
 2022 05:20:08 +0000
Received: from HE1EUR02FT086.eop-EUR02.prod.protection.outlook.com
 (2603:10a6:e10:13:cafe::b7) by OL1P279CA0028.outlook.office365.com
 (2603:10a6:e10:13::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.15 via Frontend
 Transport; Mon, 20 Jun 2022 05:20:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 193.8.40.94)
 smtp.mailfrom=leica-geosystems.com.cn; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=leica-geosystems.com.cn;
Received-SPF: Pass (protection.outlook.com: domain of leica-geosystems.com.cn
 designates 193.8.40.94 as permitted sender) receiver=protection.outlook.com;
 client-ip=193.8.40.94; helo=aherlnxbspsrv01.lgs-net.com; pr=C
Received: from aherlnxbspsrv01.lgs-net.com (193.8.40.94) by
 HE1EUR02FT086.mail.protection.outlook.com (10.152.11.240) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5353.14 via Frontend Transport; Mon, 20 Jun 2022 05:20:07 +0000
From: Daide Li <dai-de.li@leica-geosystems.com.cn>
To: openembedded-devel@lists.openembedded.org
CC: bsp-development.geo@leica-geosystems.com,
	Daide Li <dai-de.li@leica-geosystems.com.cn>
Subject: [meta-python][PATCH V1] python3-iperf: initial add 0.1.11
Date: Mon, 20 Jun 2022 05:20:04 +0000
Message-ID: <20220620052004.2482273-1-dai-de.li@leica-geosystems.com.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 76be2231-83c9-40ec-5231-08da527c8a3b
X-MS-TrafficTypeDiagnostic: PR3PR06MB6634:EE_
X-Microsoft-Antispam-PRVS: 
	<PR3PR06MB66341A2C24903C39C9A877E2A9B09@PR3PR06MB6634.eurprd06.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	8jV3DbRLFK9lBzTdcC3fCpn2Xg8aXUEJxGOeYGhpVV6Cs47ByT8qdW+BwXxmM721HxG0XVL2xyHr1NpLzTFzGu1eAB2YLM/+i6aIEmVuS4T2jHyGtgbJEy6kHbouTMN6LOyMpkeDT8nRmuyb1AtxslgpNdYt3Y2vMKcUP/KcZ/dhwpR3FvQjdAXJ8q307gqKQaEehVX7EUrr9BEPtI9mJ0wxSsfogpsT3MdHUCPRqffCdIv2yj65WYKM2xdXrKmNYjLcAsLBmoRAyNHr5/UWkLpLpIycUyO9VCGtjdXpuRLvEpg0DpRfz6X27C8ZvE40eoZkyiBFQfz0k8aaLJI1QmnpE6xc4OWVpyuAmWn2U90i12lncpn2kt+D2GnhmGfXtAGBU0mxjPwhkVqFXj32spFQgyoGVEJKJNj4REDKhb7U3ZmO87B6+iUUr+3u0lsR/LZrkhE7uhmPBQ3vRMMQIK/Dd6GE/d91K4QJn/iDlO+NmWTd9944W78jfw2rJcdah7JbCQjD58QEyKYp/+4pvAcYvgygPjPF+i0FrCh6pSddvpHkGaqFvAVjjkJHXnQ1hPl4pgemVgyfGTpCmfO06GP9du44QrlY2U7YWglNL1mrJUANp0lxv2umFyHYdr4Vo0qt3ju2r2CqPUS5J4FkvV8F0nbizSM4zS0dzNm+ga/A6wRLm2eFr2KL+Ncs9y1dXvJY6PyDsFISHQWNFdlYj+ZCOp2b3dH5cEy3s4A6rfYhkO1JMMFWsRBL4zh6IYDDp9WLnk+dKNunbETrziZ+wg==
X-Forefront-Antispam-Report: 
	CIP:193.8.40.94;CTRY:CH;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:aherlnxbspsrv01.lgs-net.com;PTR:ahersrvdom50.leica-geosystems.com;CAT:NONE;SFS:(13230016)(4636009)(36840700001)(46966006)(40470700004)(107886003)(47076005)(186003)(336012)(6666004)(6506007)(1076003)(81166007)(86362001)(2616005)(956004)(26005)(6512007)(36860700001)(356005)(5660300002)(8936002)(4744005)(118246002)(82310400005)(36756003)(4326008)(2906002)(40460700003)(316002)(6486002)(8676002)(6916009)(70586007)(498600001)(36736006)(70206006);DIR:OUT;SFP:1102;
X-OriginatorOrg: leica-geosystems.com.cn
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2022 05:20:07.3037
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 76be2231-83c9-40ec-5231-08da527c8a3b
X-MS-Exchange-CrossTenant-Id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a;Ip=[193.8.40.94];Helo=[aherlnxbspsrv01.lgs-net.com]
X-MS-Exchange-CrossTenant-AuthSource: 
 HE1EUR02FT086.eop-EUR02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR06MB6634
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 20 Jun 2022 05:20:20 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97545

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


