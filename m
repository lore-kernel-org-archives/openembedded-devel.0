Return-Path: <kwangsub.kim@qt.io>
X-Greylist: delayed 85550 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 20 Feb 2018 13:38:01 UTC
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
	(mail-he1eur01on0119.outbound.protection.outlook.com [104.47.0.119])
	by mail.openembedded.org (Postfix) with ESMTP id 8F05F7885F
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Feb 2018 13:38:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=qtcompany.onmicrosoft.com; s=selector1-qt-io;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=/1KJOd9twj5ORRN0gNOFSp+WZG+2hSeG0GIceij1+9g=;
	b=rQNcAmFOgSP5nafTusbUDG9b/G2OpYD3satHSpwzY/Ghqt62X/+l3Pq3ko4QAunWXQZIOwmQGiNWvGIF2It9/2WwnB5wBTxhZNIqSAMdHy6qtJEt79Bqm73DP0KAoLA8TJle8YPSpYJyYAobad6SoZkDiVhkV/MeHpPjwi+WjyE=
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=kwangsub.kim@qt.io; 
Received: from localhost.localdomain (175.195.156.153) by
	DB6PR0202MB2487.eurprd02.prod.outlook.com (2603:10a6:4:1a::9) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.20.506.18;
	Tue, 20 Feb 2018 12:06:19 +0000
From: Kwangsub Kim <kwangsub.kim@qt.io>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 20 Feb 2018 21:04:33 +0900
Message-Id: <1519128273-22557-1-git-send-email-kwangsub.kim@qt.io>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [175.195.156.153]
X-ClientProxiedBy: SLXP216CA0029.KORP216.PROD.OUTLOOK.COM
	(2603:1096:100:4::15) To DB6PR0202MB2487.eurprd02.prod.outlook.com
	(2603:10a6:4:1a::9)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9eb3557b-3e27-4cda-284c-08d5785a5ab7
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652020)(5600026)(4604075)(4534165)(4627221)(201703031133081)(201702281549075)(2017052603307)(7153060)(7193020);
	SRVR:DB6PR0202MB2487; 
X-Microsoft-Exchange-Diagnostics: 1; DB6PR0202MB2487;
	3:VL0CHPCXUJ4wSdxfa1et04xgyQeL1EZYJSdXs/XPQMkh+x/4dxUQhQ/92r84VPVNIUe03efDkKOF7CAKAeIyx6xVm2wit9JWYOj+X8ZeEQSDBfLCcQa2hexM+y6NvFD010Trqac6nf1sdo/61b+nF0E+lEdqdTbFBiqqI01kl1NbjIlmoZtgMoxQtznekKTlOz4AXJSNQvujEsWHw4R4n1BAjm8qsQkuI9H7iJ1SBB/TKmWDPu3VpAS5XQ4Y6umS;
	25:fjM4ZTVJKOKXCoPcFcyhrXD2p7t25X/u/vfsyrWQpxEsKxgxadhtCfuUGOq7qzZguYwuunkm84umKQqJZ6H1cpRmbuDO9GF46/PhTsVPFAOE1aDcXyJG+xRHU4p7RinoUC4G6LyiOLt1QBF9SiIg+fBuU9m+SRg7fR9LJWCFgWVEdl8Ni7ycYDNIF1JO6VeVHOYQ7nKQT++Wq6KnC/eIDbpgXl5O+aRuV0ILzrimEZtFdpGujEtdRA0ltzTISYXADHkt6RgBMFCfbwu3AyQG1D/4VhcQFqeudb2YyYooj+LUlbQNOMOXmVCQNdBEfYanz316AZ+wZdPzvwqPzd3l4A==;
	31:TM4D4Ge3ASLUdLKi9ZjwRTQT2pAK1G16z5/Sim/a7YnLAH27VX6/oc7UXeOo6CRd4C00hX9Qw6iKz8riZ7dMQamsgbFPnT7f7rtUxFty2/I+gFJSODNlCpiHL0Dx8l5vm7xnEPEr3nJV2gCTwLlCtH96+i6KJkVlgmMBZ10dysR3+bwkLpYdstdIhj5O6MVm8SjX5gbl9Rc8AhEd+Y3rrm9XJ9UGqCuV4RL9uhA3Qp4=
X-MS-TrafficTypeDiagnostic: DB6PR0202MB2487:
X-Microsoft-Exchange-Diagnostics: 1; DB6PR0202MB2487;
	20:I6f+foxhOykx41F/0DrMssVD9RpSOhePbskf+wfELB8WifpOP10Ai9AWg5OGmH9jW4rj6luZkdqSyWgVq6mnb1JaC4CQNgThCEc3Q8yyuz2Jw/fWoQS5QoTg7QOig6hejDCNVaM803hU70rAnnoj1q1VsTec0hjbv63XAuEbuSLJe/XfjjeTAEpKZJu/IpUdPjD45CbgFditmR6YGsE9GJoDKsrkPfGbXpD+p4BsVZH5gQm6ma0YbvoNgjBZpxe2ZawTiOYizbM7MiMz84Unq7hWYpg3vgrgzn42bjie9X3AmotzvR7ll4eASwjKGPtfJ6uO0LKnn+GYrO20sT8kXL86jl3maSnHNMCNKBrAL46wrupADNGqYtnc7dBY0/ZtpXMNsyEBboqMR0C9k6/UHQR1Dg6MS5ir0JRqXO1fHk+3q0KgiBQIj+KZYXytdGNSxQXOh4jyxH2L236lpH912jCzc3b290N/e4iPzYR0xH9+Ij2BRM7yIeCcNGnfYZOM;
	4:5+vHUKR79nt/rLHHSlbaRZXJQ3mqxGL2VyV9imQkDUXWxn9EMRFtH7/A5rc6Ck2ZYRVUgtlV/KOnQwV+suocuyxejDY2F6CyI/i6ye4xAndkFY794X7VwCcHOu9bQmXbtnRkt8asxYh0aQUo9Iv8h59k3vtpyKTTOyZDcIY+dDg62l2HbkfTXkrjPY0mqIuOo8VFkJHaZsbmINkAMr2Xpc0Dx565Bj2tznuySYsBorg0VCsp/22eanT+zJEpmRQnPHVSEkfzvgQ2LKArE20C04sOGEysJWIkSW5Wuj1p0TEFOb5T3Jwn6yxpNMa5kca9
X-Microsoft-Antispam-PRVS: <DB6PR0202MB24875A6F7A0C1835E10B288386CF0@DB6PR0202MB2487.eurprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(278428928389397);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040501)(2401047)(5005006)(8121501046)(93006095)(93001095)(10201501046)(3002001)(3231101)(944501161)(6041288)(20161123562045)(20161123564045)(20161123560045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123558120)(6072148)(201708071742011);
	SRVR:DB6PR0202MB2487; BCL:0; PCL:0; RULEID:;
	SRVR:DB6PR0202MB2487; 
X-Forefront-PRVS: 05891FB07F
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(6069001)(366004)(39850400004)(376002)(396003)(346002)(39380400002)(199004)(189003)(26005)(4326008)(6506007)(2361001)(5660300001)(97736004)(2351001)(25786009)(33896004)(386003)(68736007)(106356001)(8936002)(74482002)(50226002)(8676002)(2906002)(105586002)(81156014)(50466002)(81166006)(6916009)(48376002)(305945005)(6666003)(3846002)(66066001)(47776003)(6116002)(7736002)(186003)(316002)(6512007)(36756003)(478600001)(16586007)(575784001)(52116002)(53936002)(86362001)(51416003)(16526019)(1857600001)(6486002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:DB6PR0202MB2487;
	H:localhost.localdomain; FPR:; SPF:None; PTR:InfoNoRecords; A:1;
	MX:1; LANG:en; 
Received-SPF: None (protection.outlook.com: qt.io does not designate permitted
	sender hosts)
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; DB6PR0202MB2487;
	23:PFNwIm+TWZlejfXXyhf/M3kv1SPKzSpk7SXijCn?=
	=?us-ascii?Q?KkhKgtKKS/uwee0uWdfUwNNb3E5ng0QqWsQt8CK9G3/kw/kftDD1W3i66cHw?=
	=?us-ascii?Q?Kow9N4wqh3G/09CnqRcTkhA7vCox3luRieNS6y5Q8FPnSW+nCNQGni/w7eWS?=
	=?us-ascii?Q?oPOcaZuJ+U8tDqXr3xLQ5xsuZc0d41K+lT7ZwdN4MMt2/QM4lpipnTRVE6G3?=
	=?us-ascii?Q?2kYRMo4/+ns4D1ymf0IjmQdv0VHAC6JvMAw5Tf/kyuB82Pdp5J10F7zM/Rzb?=
	=?us-ascii?Q?asq72bSa71ca8i84IjmbPv4xjSgLLE2WtM2OZWwwk/cu7ADbpEng+SACalEV?=
	=?us-ascii?Q?q/fwCc6ShEoSdXOBU0Rg9pnZOM64+a7I0/DUjSldtQVz4lXeXo284e4+8fID?=
	=?us-ascii?Q?sDJ17xVBonzVYaLpKAXnaE6hQ6/Gs3X15o8I938vuhWdLczpfX4Q2sHpgMs0?=
	=?us-ascii?Q?cJWDhZw8us/dXw6LZrldfYkshNQVhm7igF6UNqzZ0AnXaYxLhx5jNRn1SQQm?=
	=?us-ascii?Q?86w93d9CnBnaQB0rtEnmiHUIOQmBJU6mADln7aXGUTnBCzMP2kuG6C280d1w?=
	=?us-ascii?Q?6Kh9LG6CfwzH2xvots8ildWSKaCvT9sbmVVGw4fC/p7eNQDILoOZfLtgY2P/?=
	=?us-ascii?Q?3Vjgy3v+FtfauVOuXNDApP/cEm1UqRRr+LU6S772McBmzk1GFuBHtwZRtX6V?=
	=?us-ascii?Q?c5ZQd46Q+KNqijzKHIG6OLavO7RNlT0ry3DB4kzabMF8BYuv5D8jpKDE1N6I?=
	=?us-ascii?Q?5AXL8naL5B1/RAQ7LYVh8tsoQl+Bfm03D0OvHa1c0+NFS9rDvqCPprxDjs9h?=
	=?us-ascii?Q?MnmbNQeBodU2A2WGDSPxRcxcsqVGEfrYIglXm9PJd4OuXiLeXABTp+3kPoNs?=
	=?us-ascii?Q?PE4jU0M8A/+m48Ef7LE7oXG+xqqEhItMAwvkKghUlZ0S4iPpMFPwqJvKcwh5?=
	=?us-ascii?Q?wLV9bptNXz4qXEInaI8V+8QprXWM7ugRYEyq1OhLtZJ8xDT0S+UEWNyTQgsw?=
	=?us-ascii?Q?bXNxls5ccJcPe0f+50lqqym91GQXQBT0FA/yoXBIkwMt/qZPAYgpiRCyplyW?=
	=?us-ascii?Q?rHlSTngC7OMuS0esdXV6EZ733MtHJwnU+P60ZlK9wLb6VDi69y89851+/JdK?=
	=?us-ascii?Q?7H/Y5zpFIcmOhqsPVmQaXXDcsNOQSqOg2zzidUND8v1kQi76PC6V/lejTCGw?=
	=?us-ascii?Q?htlznGAIESo2IL1XUk2YEtB2QOPLtqyfcgfH2?=
X-Microsoft-Exchange-Diagnostics: 1; DB6PR0202MB2487;
	6:OIUwaNb1LpmDJsiP7xnGXoLfe42po195E7CQBuOxzPjy5U1wsv2ItSCcDLFnEP8NZAfquAI1tlG/n0I6xV4WfPcX3BumweZ9D6GZp2YPLd1R66DKcdBW6F/vBzK2WwiQ1JUj2KTSw69LUidgj5THoebHXRdUNZrm62oEdojaPCXIkhvB4qXMPOtuHbsE/g2q8K0C7pHY23koRPeqBK2mT0RPIWTMK8ak8n0RAQc5vBZm+fw44eqBugHwizfs8y376cvabN/EXTSCirR8TgzVWcvNOkruqgztKuyFByKSGeO0QLLUA08ips96g2T+TR7PboOhGB7jxohZRXfHiG/ah9dde2QZu+W4U7C27Uu2hyc=;
	5:92xwdu5nL7B19D8t6MmbjqGxU18FCh5nW57lCusaAFvO4wZJizFiq0pH07rlxEBtjatE1k2w7NwbYhHRvRaldKd/D2MoOxzv6A63zL1j2Wt+yGAYwr3fjgHTLp7ZILddxAcPYa04YXKtDysj7u/zaicedCGWS+vwcPZ15SRM3a0=;
	24:YtcFpCo4eT1MoLFufIhgBPSMDLWAKJqTbjkZmrS15BT1jsoRft8TiiFkerWEYwJ8ysrohocY3Xfvh8yBLpgPwSAZxImvMb6UcWFVCjkwBCU=;
	7:lKRAYwNuGE/IeBk+TuFRj0pb63reRIm8lmwpY5yNmeeZaRL9Bwl4ok4gcJ/i74FS2TPoBdmhi0oPy2TkMz8A/GnbockcSVuLsR4jMGvsDumhhkwZOgvGSytm78nO1xXzUlhJJ982isnPJ+cfTP8uP0k4ztB0GE9RP23YcSnBzduFGguoA44AQQkd+UMMYE0rPRKkkhPjHXhqBO9FUd2TZ7lCQ2meyvKofVhN7W2jgPBQaoG5x6oLcz5h0gkU72rd
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: qt.io
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2018 12:06:19.4948 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9eb3557b-3e27-4cda-284c-08d5785a5ab7
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 20d0b167-794d-448a-9d01-aaeccc1124ac
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0202MB2487
Subject: [meta-qt5][PATCH v3] qtbase: add a config option to optimize for size
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
X-List-Received-Date: Tue, 20 Feb 2018 13:38:02 -0000
Content-Type: text/plain

The '-optimize-size' option would enable the compiler to optimize
for size instead of speed. If the global compiler option already
included '-Os', this option would be enabled by default.

It would affect the whole Qt libraries and Qt applications as well.
This feature is available in Qt 5.9+.

Signed-off-by: Kwangsub Kim <kwangsub.kim@qt.io>
---
 recipes-qt/qt5/qtbase_git.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/recipes-qt/qt5/qtbase_git.bb b/recipes-qt/qt5/qtbase_git.bb
index 4f3ade2..85a2e0d 100644
--- a/recipes-qt/qt5/qtbase_git.bb
+++ b/recipes-qt/qt5/qtbase_git.bb
@@ -73,6 +73,7 @@ PACKAGECONFIG_RELEASE ?= "release"
 # This is in qt5.inc, because qtwebkit-examples are using it to enable ca-certificates dependency
 # PACKAGECONFIG_OPENSSL ?= "openssl"
 PACKAGECONFIG_DEFAULT ?= "dbus udev evdev widgets tools libs freetype tests"
+PACKAGECONFIG_DEFAULT += "${@bb.utils.contains('SELECTED_OPTIMIZATION', '-Os', 'optimize-size', '', d)}"
 
 PACKAGECONFIG ?= " \
     ${PACKAGECONFIG_RELEASE} \
@@ -90,6 +91,7 @@ PACKAGECONFIG[release] = "-release,-debug"
 PACKAGECONFIG[debug] = ""
 PACKAGECONFIG[developer] = "-developer-build"
 PACKAGECONFIG[qml-debug] = "-qml-debug,-no-qml-debug"
+PACKAGECONFIG[optimize-size] = "-optimize-size"
 PACKAGECONFIG[sm] = "-sm,-no-sm"
 PACKAGECONFIG[tests] = "-make tests,-nomake tests"
 PACKAGECONFIG[examples] = "-make examples -compile-examples,-nomake examples"
-- 
2.7.4


