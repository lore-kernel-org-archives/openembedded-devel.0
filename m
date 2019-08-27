Return-Path: <chris.laplante@agilent.com>
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
	(mail-eopbgr690083.outbound.protection.outlook.com [40.107.69.83])
	by mail.openembedded.org (Postfix) with ESMTP id DBB837EC92
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Aug 2019 21:52:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=R/vl7MOIIWOJltjp/gR3tRwvoBi2nhRkHta9XqXKBtU39eZmN0cMx7bwfCkI8aF4K9VCjV+xUqtyNXpMavk7R9fgEItnz0ynwgBfRhhxX0HqgH8RD+mHVreE1lR2HM/OeqP23XpUXxy82iD2LytaTU9ccEQ+eMZ2jF63qXm9idBl8FauksLH6d2hh+YTDdrKr1w7mJShrQFDeUZbx0TcYSg1JxJxbtia4z9e0T7FcEhjiANDnGHjcTDNj9DiMyBDqh9XJZV1chWg43FD7DQAv3I4+FjpOikps0gpp1E+q4baTFdtYBXyHl5RzgZhltmVEsC7udJbIyoPsJzPTcaGwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=1zkEkJQRzs1zLweDAyAcCRELuDx3kYKPmXNfErPb3u0=;
	b=oZEQUd1+r7mW0pWw8n+I2lBhjPp8zjd5TU8gPoe16u6rzoDzHID17PmGJx0O6aRscGa7miKSIjUin/c7M4bx68W8n3SOvdspzz66l4VpuVE6XGeaEkOx+5urZ6iRvvcqEnpYNqQgdQ7wNd5J/FtIjEw8G1RjC9LWUJ1aT+K3yW9pBTfomfjXpMnf8nbjDjUB7x3G+iAYnc6QSvWua7CKnMAfAVOt6eMcz/LEQq7LQUlYb0mmMIQSjYuBRbT04SQOt33ChuxD26mb7Y6xKBUdyJOE0+OWP0JIG6CVe99S2XxtNWcSb7bSJLxULWjpjXFa7wK8D6jBgQjzgQbFHapBBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
	192.25.218.34) smtp.rcpttodomain=lists.openembedded.org
	smtp.mailfrom=agilent.com;
	dmarc=pass (p=reject sp=none pct=100) action=none
	header.from=agilent.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agilent.com;
	s=selector2;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=1zkEkJQRzs1zLweDAyAcCRELuDx3kYKPmXNfErPb3u0=;
	b=cA27jVzJPL82qhD6BVdjmgkUaAqoy6ex3qKKbXZdUFqhWkqTdRbQl1n5pPsVIoQB1FM5VAGVE3nbX18QUDHj1yRJVU85LD1zD69KwCF/FWutMbK9EBlCZui3Gzu2uXXWogVMMJdJSxGf9IQODFSIp2plkakyPY2PvP3ucX9/ebA=
Received: from DM3PR12CA0054.namprd12.prod.outlook.com (2603:10b6:0:56::22) by
	BN6PR12MB1652.namprd12.prod.outlook.com (2603:10b6:405:6::15) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2178.16; Tue, 27 Aug 2019 21:52:31 +0000
Received: from CO1NAM05FT030.eop-nam05.prod.protection.outlook.com
	(2a01:111:f400:7e50::206) by DM3PR12CA0054.outlook.office365.com
	(2603:10b6:0:56::22) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2199.14 via
	Frontend Transport; Tue, 27 Aug 2019 21:52:30 +0000
Authentication-Results: spf=pass (sender IP is 192.25.218.34)
	smtp.mailfrom=agilent.com; lists.openembedded.org;
	dkim=none (message not
	signed) header.d=none;lists.openembedded.org; dmarc=pass action=none
	header.from=agilent.com;
Received-SPF: Pass (protection.outlook.com: domain of agilent.com designates
	192.25.218.34 as permitted sender) receiver=protection.outlook.com;
	client-ip=192.25.218.34; helo=edgeappmail.agilent.com;
Received: from edgeappmail.agilent.com (192.25.218.34) by
	CO1NAM05FT030.mail.protection.outlook.com (10.152.96.141) with
	Microsoft SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2220.7 via Frontend Transport; Tue, 27 Aug 2019 21:52:30 +0000
Received: from localhost.localdomain (130.30.246.172) by
	edgeappmail.agilent.com (192.25.218.34) with Microsoft SMTP Server id
	15.1.1713.5; Tue, 27 Aug 2019 15:52:21 -0600
From: Chris Laplante <chris.laplante@agilent.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 27 Aug 2019 17:51:41 -0400
Message-ID: <1566942701-20679-1-git-send-email-chris.laplante@agilent.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Received-SPF: None (wpcosapexchedg3.windmz.agilent.com:
	chris.laplante@agilent.com does not designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:192.25.218.34; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(136003)(376002)(346002)(396003)(39860400002)(2980300002)(189003)(29502001)(199004)(50466002)(7636002)(70206006)(305945005)(51416003)(8676002)(356004)(6666004)(246002)(106002)(5660300002)(107886003)(4326008)(6916009)(16586007)(478600001)(36906005)(26005)(50226002)(49486002)(36756003)(336012)(2906002)(956004)(44832011)(426003)(476003)(8936002)(86362001)(2351001)(126002)(486006)(2616005)(14444005)(47776003)(48376002)(316002)(186003)(5001870100001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR12MB1652;
	H:edgeappmail.agilent.com; FPR:; SPF:Pass; LANG:en;
	PTR:wpcosapexchedg3.windmz.agilent.com,cos.smtp.agilent.com;
	MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bb7f9939-3aa5-4a98-b464-08d72b38dc11
X-Microsoft-Antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(4709080)(1401327)(2017052603328);
	SRVR:BN6PR12MB1652; 
X-MS-TrafficTypeDiagnostic: BN6PR12MB1652:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BN6PR12MB1652DC72DCC80D95AE05BABC8BA00@BN6PR12MB1652.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:454;
X-Forefront-PRVS: 0142F22657
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: QHqL26WLUrwrDtKni9SsssERUaR3D/KP80yNLtTMPNDQQYWhYTp/RfBGI5HH/0muaL7qzfYzMADsvkxIQMAiOzh9SsQI1FGhsHjza57oeXy5OYZaLFqkHUgcLKRLUp+dSFGBRYmjC5O80Pq0Q4nNp7FkH2AIfS665dr/l8C6mULfnz/QcU8UFSpjhN9Rx8O9SolD77h2mwJc+ZkffRgXHJdvhHbbdkYjUMHriK/3CIxGHsCCGxR0SmMhEnoMDuZoS8aC3xjsZENyuvLRH4xnfHHz/JUh8CQV2tpJoSSsAuvv9fUwlNN1RtiTvbv4IcZtOSUvvQTxckOYge8p2TNEpt27jMdKalQxBH8nnjiYkWlZlvXIGzw5AcYcBEUCfg6sWCfWVJYuFKbuHHTbmV9MoIWXVGbRZbK6w8B/xs2sxi4=
X-OriginatorOrg: agilent.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2019 21:52:30.5264 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bb7f9939-3aa5-4a98-b464-08d72b38dc11
X-MS-Exchange-CrossTenant-Id: a9c0bc09-8b46-4206-9351-2ba12fb4a5c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a9c0bc09-8b46-4206-9351-2ba12fb4a5c0;
	Ip=[192.25.218.34]; Helo=[edgeappmail.agilent.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1652
Subject: [meta-oe][PATCH] breakpad: fix patch striplevel to avoid 'devtool modify breakpad' error
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 27 Aug 2019 21:52:33 -0000
Content-Type: text/plain

Since the patch is modifying files in a self-contained git repo that is
.gitignored, git ends up thinking we have just touched a submodule.

This leads to 'devtool modify breakpad' failing with:

    Exception: bb.process.ExecutionError: Execution of 'git add .; git -c
    user.name="OpenEmbedded" -c user.email="oe.patch@oe" commit -a -m
    "Committing changes from do_patch

    %% ignore - from do_patch"' failed with exit code 1:
    On branch devtool
    Changes not staged for commit:
            modified:   src/third_party/lss (modified content)

            no changes added to commit

            ERROR: Function failed: patch_task_postfunc

Signed-off-by: Chris Laplante <chris.laplante@agilent.com>
---
 meta-oe/recipes-devtools/breakpad/breakpad_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/breakpad/breakpad_git.bb b/meta-oe/recipes-devtools/breakpad/breakpad_git.bb
index 5f9a72e..06f3ee8 100644
--- a/meta-oe/recipes-devtools/breakpad/breakpad_git.bb
+++ b/meta-oe/recipes-devtools/breakpad/breakpad_git.bb
@@ -42,7 +42,7 @@ SRC_URI = "git://github.com/google/breakpad;name=breakpad \
            file://0001-disable-calls-to-getcontext-with-musl.patch \
            file://0001-lss-Match-syscalls-to-match-musl.patch;patchdir=src/third_party/lss \
            file://mips_asm_sgidefs.patch;patchdir=src/third_party/lss \
-           file://dont-clobber-rsp.patch \
+           file://dont-clobber-rsp.patch;patchdir=src/third_party/lss;striplevel=4 \
 "
 S = "${WORKDIR}/git"
 
-- 
2.7.4


