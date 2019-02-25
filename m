Return-Path: <ckalluri@xilinx.com>
X-Greylist: delayed 79588 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 25 Feb 2019 23:28:01 UTC
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
	(mail-eopbgr740043.outbound.protection.outlook.com [40.107.74.43])
	by mail.openembedded.org (Postfix) with ESMTP id 5B3EC7BED9
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Feb 2019 23:28:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=Q+s7XMLkmEhRRyffar7cgflkD2Xwn1WGh5RtTBO1IzM=;
	b=HKMm/wNmfBa6+5IAKFh4gjLhAPjFzhfvHCid/O2kLygvN0T4e3dAPuUaipcFpVBt7IGuwCxAocIy1Tof2RE9z4CPe5fhaZvkzggfgCkBMHHkMRWQajWviscElowVGNFKNrRS+keTxiPebUqAs5QNd/X6pe79WlHRzrAbN2xnOoE=
Received: from DM6PR02CA0017.namprd02.prod.outlook.com (2603:10b6:5:1c::30) by
	CY1PR02MB1303.namprd02.prod.outlook.com (2a01:111:e400:50f0::18) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1643.16;
	Mon, 25 Feb 2019 21:55:44 +0000
Received: from CY1NAM02FT030.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e45::208) by DM6PR02CA0017.outlook.office365.com
	(2603:10b6:5:1c::30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1643.18 via
	Frontend Transport; Mon, 25 Feb 2019 21:55:43 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
	smtp.mailfrom=xilinx.com; lists.openembedded.org; dkim=none (message not
	signed) header.d=none; lists.openembedded.org;
	dmarc=bestguesspass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.83 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
	CY1NAM02FT030.mail.protection.outlook.com (10.152.75.163) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.1643.11
	via Frontend Transport; Mon, 25 Feb 2019 21:55:43 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
	by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <chandana.kalluri@xilinx.com>) id 1gyODv-00080w-5K
	for openembedded-devel@lists.openembedded.org;
	Mon, 25 Feb 2019 13:55:43 -0800
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <chandana.kalluri@xilinx.com>) id 1gyODp-0003Lh-N8
	for openembedded-devel@lists.openembedded.org;
	Mon, 25 Feb 2019 13:55:37 -0800
Received: from xsj-pvapsmtp01 (xsj-smtp1.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp2.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	x1PLtaFb022774; Mon, 25 Feb 2019 13:55:36 -0800
Received: from [172.19.2.12] (helo=xsjckalluri50.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <chandana.kalluri@xilinx.com>)
	id 1gyODn-0003LN-Jy; Mon, 25 Feb 2019 13:55:35 -0800
From: Sai Hari Chandana Kalluri <chandana.kalluri@xilinx.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 25 Feb 2019 13:55:31 -0800
Message-ID: <1551131734-13486-1-git-send-email-chandana.kalluri@xilinx.com>
X-Mailer: git-send-email 2.7.4
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(979002)(136003)(346002)(39860400002)(376002)(396003)(2980300002)(199004)(189003)(107886003)(77096007)(26005)(316002)(106002)(4326008)(336012)(16586007)(126002)(426003)(486006)(356004)(2616005)(478600001)(2906002)(6666004)(476003)(48376002)(50466002)(5660300002)(186003)(106466001)(2351001)(63266004)(8676002)(6916009)(81156014)(36386004)(81166006)(9786002)(305945005)(47776003)(36756003)(7696005)(51416003)(50226002)(8936002)(107986001)(969003)(989001)(999001)(1009001)(1019001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:CY1PR02MB1303; H:xsj-pvapsmtpgw01;
	FPR:; SPF:Pass; LANG:en; PTR:unknown-60-83.xilinx.com; A:1; MX:1;
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 74665043-61db-4ef0-001b-08d69b6bfd8d
X-Microsoft-Antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600127)(711020)(4605104)(4608103)(4709054)(2017052603328)(7153060);
	SRVR:CY1PR02MB1303; 
X-MS-TrafficTypeDiagnostic: CY1PR02MB1303:
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-Microsoft-Exchange-Diagnostics: 1; CY1PR02MB1303;
	20:pI4xldy4wx/HAU2Lc4/PnaLyEHUwrercQ//qxjHHW/B/J8BV0bwHssCDnro3Q5RdJu+dDTgD7gfVtjLE0kN9arb8z5DtrZitta7MCh08KnQTp5hvkaRwOkkqqTk8F3pYVakq/+RJccvPzCj6ybrbbmUaxVjCaImKhNfS6DvBVQcr8jvFHIIWAMmaoJPBh5cnpoA2idflCJbmXgPxx/KlMMF54Kdpu/F9wxvCN1SJPjrIotsFDb5Q4g1nIvQqz1o33GrmidU37ycMDEuaxK3GD4XWKE7L4l1pnNZFeS5Y1EeUI2X/FXM7MjNzR8P6w70rtlJfgtH2xM7iipmMEHYA/AsNmL5eaHzhWQQq9HljaBkwxDOIYDFRn5/zcpkNcHuSIyaale/elyP1GGvToha74E8yvmmIARa1V8B+RkwLj7a6jgv3KjncuKMOIH0kDoyv9Fn+KQ93j9P22EQK90hmV9FG9ArzvBm9ngdkyMCTSfiz/ZO1GV2GcLz1ErOqe81a
X-Microsoft-Antispam-PRVS: <CY1PR02MB13038E9CF70CBE2F3497371BB07A0@CY1PR02MB1303.namprd02.prod.outlook.com>
X-Forefront-PRVS: 095972DF2F
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; CY1PR02MB1303;
	23:QyCJO3khBGTdWxlUarIQEsFzG+hMQ4jHawTxBHZlT?=
	=?us-ascii?Q?setrIYD3tBDecwuQtbJFcxX0tg3xZfBpaTzxivw+IzMRdrzG6RqmpFCTu92p?=
	=?us-ascii?Q?OB70Q+aBxNdlMQj4tRsj5z8NzO94A63hScygiCKXJUnuPMZPryGnZi46mFpW?=
	=?us-ascii?Q?s1ZmaHOKBLFjTQydLkUeQ8IJPybFs+mopQiiIWkn18ZVzBdLS+SQl87P1Q6B?=
	=?us-ascii?Q?2ful/F8GzBCWJt6rJz6OtJ6aHWLi+/kXoBt9eflwT5V0VSXLlkcZcpSAU4di?=
	=?us-ascii?Q?HGKyNR5ipDhWTKsUNN+lvsbTB7fSU9UW39Fb2qxkOrUik7QOJYql72cwFqj6?=
	=?us-ascii?Q?dc1mWFukjFTSPgeQJ/bKQEw8liVfX9ROmi6D/JsdcG2fN74Ki2/kot8+sqMS?=
	=?us-ascii?Q?e/PrUvSaHNo3W/i5rfBxEPPU/mQ4ExCJxLiHJdYVGvYjHbsOhPLkLh27EW/D?=
	=?us-ascii?Q?19vHA6DotbFLimjp0HG2ey6FBrmS1BgecUT+fddPNXdQxGtoAy3H3JYkKKQk?=
	=?us-ascii?Q?TN1SScmYgdGNJJ6T9+uTPC+7l10E1JSqY+kE9njtDRdnta5yrZITgr2sGuQ5?=
	=?us-ascii?Q?m9bnvc/CoW/8DW73Sug/ZDYJSjR3K0FTsFEPl0dS3/5F5idQN8tDkJWB/0cc?=
	=?us-ascii?Q?slPyIp/Ngg6Pi1dtHSJ2FlymoE1YUsnWsYZb4vv2ST3lPQkJXaz7rf1QrFlS?=
	=?us-ascii?Q?S00ZkxjAqGstOCXNq+JoRZgV+sw1QRKMIr0CzqRE2/Nr6XzgpGvcN2/+qJES?=
	=?us-ascii?Q?+nFnIJeZ8BzOzCC3TiASO+1AybKpiZ7aB4eRHPyPt7k2pZxwliKEejhOGrya?=
	=?us-ascii?Q?7zt6XefWbPj1xU1ajbAws+wpvKobN2ghP/GPMlckAxpv2n/MqWIIHkY/mRJm?=
	=?us-ascii?Q?5tuJbM2YHBFDdW8XSEYtkK4ay9HTWuUKW5s+08kl+tVFTSesuxrjuKDCxLHP?=
	=?us-ascii?Q?Lly602jDuujc3KvQOQH6ta0hJ+qOb3ztFyuPgPFBJYt6jjTttjS67uyvQUPP?=
	=?us-ascii?Q?uxzoxr0BVqIkQz/AC6zKbKLcItIu7u7ePYLpGdDswyGS5PgmB10FQNoYpZ9p?=
	=?us-ascii?Q?YyFROI1ff9Y71dFjgWSQ/72J1q4LtSMljNUEfFeRjx6vI6US/cpqxtSOeRGq?=
	=?us-ascii?Q?ll3mTgxb5o=3D?=
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: LgwQtudXHLPQLtoXkZG7C7y+l8QazqxYb+F/ecRb369Y40r0UTXszB47ma7WhDgAItXkpyBRsLIAVDJSg1CFc/gmYhIXM/Ic0QOZ98lRWoxy1Qk/rkkjOPtu91Vqpk6csd8yS9IChRxsM3M33viycDUrApdi6VYqSmdU8p809z+mQCiq5BNZCfZ1FCVLOyXU633rrlsIQ1m6ZxPEGU4phOwSrvQukVXytOgnJ0DmIXRfwK/6vFKB18ribOlvYDSO20/5U4MyFSVmNwrKOT78xVEss9BO2/KMH+ZVU6BKnZ06QAgmkgAFr+2bhB4Da9WuBuW3VPr/311QqAuctcXVWMJLUOq/pKhAFAepdfBih5iwX1xo4ACqreFYhSrZOTy8I+aWJIc0lHOl+lO0Dqs8Z03cG0YWsMnp57Mvt1Fp+DM=
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2019 21:55:43.5935 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 74665043-61db-4ef0-001b-08d69b6bfd8d
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.83]; Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR02MB1303
Subject: [thud 0/3] Backport python-module patches from master to thud
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
X-List-Received-Date: Mon, 25 Feb 2019 23:28:01 -0000
Content-Type: text/plain

   The following recipes are included in master:
   python3-twitter
   python-requests-oauthlib
   ace-cloud-editor

This patch series provides backport patches for the above recipes in thud.

Sai Hari Chandana Kalluri (3):
  Yocto recipes for easy to use python2 and python3 libraries for
    accessing twitter APIs
  Yocto recipes for Python Requests and Oauthlib libraries to provide   
     easy-to-use Python 2 and Python 3 interfaces for building OAuth1
    and     OAuth2 clients.
  Yocto recipe for Ace-code-editor an open source embeddable code editor
    written     in JavaScript. It can be easily embedded in any webpage
    and JavaScript     application.

 .../ace-cloud-editor/ace-cloud-editor_git.bb       | 22 ++++++++++++++++++++++
 .../python/python-requests-oauthlib.inc            |  7 +++++++
 .../python/python-requests-oauthlib_0.8.0.bb       |  3 +++
 .../recipes-devtools/python/python-twitter.inc     | 17 +++++++++++++++++
 .../python/python-twitter_3.7.0.bb                 |  3 +++
 .../python/python3-requests-oauthlib_0.8.0.bb      |  3 +++
 .../python/python3-twitter_3.7.0.bb                |  3 +++
 7 files changed, 58 insertions(+)
 create mode 100644 meta-oe/recipes-support/ace-cloud-editor/ace-cloud-editor_git.bb
 create mode 100644 meta-python/recipes-devtools/python/python-requests-oauthlib.inc
 create mode 100644 meta-python/recipes-devtools/python/python-requests-oauthlib_0.8.0.bb
 create mode 100644 meta-python/recipes-devtools/python/python-twitter.inc
 create mode 100644 meta-python/recipes-devtools/python/python-twitter_3.7.0.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-requests-oauthlib_0.8.0.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-twitter_3.7.0.bb

-- 
2.7.4


