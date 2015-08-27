Return-Path: <soren.brinkmann@xilinx.com>
X-Greylist: delayed 904 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 27 Aug 2015 22:05:16 UTC
Received: from na01-by2-obe.outbound.protection.outlook.com
	(mail-by2on0075.outbound.protection.outlook.com [207.46.100.75])
	by mail.openembedded.org (Postfix) with ESMTP id 1B90960043
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Aug 2015 22:05:16 +0000 (UTC)
Received: from BN1AFFO11FD010.protection.gbl (10.58.52.34) by
	BN1AFFO11HUB015.protection.gbl (10.58.52.125) with Microsoft SMTP
	Server (TLS) id 15.1.256.10; Thu, 27 Aug 2015 21:50:33 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.100)
	smtp.mailfrom=xilinx.com; gmail.com; dkim=none (message not signed)
	header.d=none;gmail.com; dmarc=bestguesspass action=none
	header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.100 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.100; helo=xsj-pvapsmtpgw02;
Received: from xsj-pvapsmtpgw02 (149.199.60.100) by
	BN1AFFO11FD010.mail.protection.outlook.com (10.58.52.70) with Microsoft
	SMTP Server (TLS) id 15.1.256.10 via Frontend Transport;
	Thu, 27 Aug 2015 21:50:32 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66]:37298
	helo=xsj-pvapsmtp01) by xsj-pvapsmtpgw02 with esmtp (Exim 4.63)
	(envelope-from <soren.brinkmann@xilinx.com>)
	id 1ZV544-0006BX-2E; Thu, 27 Aug 2015 14:50:32 -0700
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <soren.brinkmann@xilinx.com>)
	id 1ZV543-0001oh-RQ; Thu, 27 Aug 2015 14:50:31 -0700
Received: from xsj-pvapsmtp01 (mailman.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp2.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	t7RLo0cZ016801; Thu, 27 Aug 2015 14:50:00 -0700
Received: from [172.19.74.49] (helo=localhost)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <soren.brinkmann@xilinx.com>)
	id 1ZV53x-0001n5-8a; Thu, 27 Aug 2015 14:50:25 -0700
From: Soren Brinkmann <soren.brinkmann@xilinx.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 27 Aug 2015 14:50:14 -0700
Message-ID: <1440712214-30967-1-git-send-email-soren.brinkmann@xilinx.com>
X-Mailer: git-send-email 2.5.0.3.g52d66ab
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.0.0.1202-21774.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-Microsoft-Exchange-Diagnostics: 1; BN1AFFO11FD010;
	1:H/9Ywd+ahtggGnLirIW5s5Laq1wVFMGyX5KtrvOc6QG2x9jPqfohI249kDKzhvGMQ8ywRMKp+9gdH+DYkGjhTq31JguPoJGmJkxIJANJ+jurNfxh+5ACbEKku9X3g0C1WeWa/k1lLNWtjugILoVc2oF8YdIP+BCkDPXBwW1XKg3ERoSGKXsqonUEPuUydNOyTfjHTQsTjsLWTVlf1Eu5z6Gi93jYNUqFB8AizeBa+FLkvSlIL1RstPBoqNFQxfkycSFMvYXtB218va4XLfp/5wrxhSaBE9qSsssnhzpMRn9pKEOJaKQSuHoDjshPjc/PmgH2dGPb01Z5/0IwydeCoVinLImnhLvOZ//Fxm0XI1oHdXRVrpWOYWRcDCCMZSCDcFspyQ6gjm7snPZftwtaNQ==
X-Forefront-Antispam-Report: CIP:149.199.60.100; CTRY:US; IPV:NLI; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(2980300002)(438002)(3050300001)(189002)(199003)(64706001)(2351001)(5003940100001)(229853001)(46102003)(92566002)(33646002)(50986999)(19580395003)(19580405001)(76506005)(4001540100001)(81156007)(50466002)(6806004)(48376002)(36386004)(63266004)(106466001)(86362001)(5001920100001)(5001960100002)(107886002)(110136002)(50226001)(36756003)(5001830100001)(5007970100001)(57986006)(87936001)(189998001)(15975445007)(77156002)(47776003)(77096005)(5001860100001)(62966003)(107986001)(5001870100001)(4001430100001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BN1AFFO11HUB015;
	H:xsj-pvapsmtpgw02; FPR:; SPF:Pass;
	PTR:unknown-60-100.xilinx.com,xapps1.xilinx.com; MX:1; A:1;
	LANG:en; 
MIME-Version: 1.0
X-Microsoft-Exchange-Diagnostics: 1; BN1AFFO11HUB015;
	2:G43ce31SNBeELL2HLbXGbkMXsFn4/ulebHt/TctMLbyMpr9SH9jtQk+Cb5quButg31yRzBp7TJE8Ku3Pft76hGN28B8mNoKbjzaD1Ml9sCC9Z8UMvIS0Q5N8pBYA9qIJxcfeao33B3SiXNDY+SK3+twllqjm87/3/1rWLvCUB/0=;
	3:NHv2kXEXwAQhkYJ7x3FFR1XbB1iaBKIQhz4NKpdXUbvbBRjgvxg0aBsDNN1CtDUdYVBWpQvh+8cOlxtvKGQ0n1c7y3FINDBao2msEalQ1R0bvyrs50H5mABVWCUZnDwLY8vZ7O0XN7CZqmz7SieCq4K8w9s/BEGQNBdCcEMFPiQIcJfsk7vhTzJA+yuuVC6YhN9bPTC0L+cOIzv69OFngfGy5chzC2PpFhGIgk3k6ZREKVpdF9PkYt4sxCg87Q+JPdvoqbv3389cTKL5x8hbpw==;
	25:ovC0/kemKVqkQzJLPhp+0X0uvU9ibUoz554xQHLepfZt556aMMIwKrq+tt2DWzpYusM76g3YCHG5PV+DR5bqKSpiwMJo4v2K7n066bTjfIATDOBeAqm9swgb118iztdTqEu25KLOef7XC0orRUq3YQoKiQf6Va88WiFvlCcYlbzTRB7A4iWqaZ+lc8yvqdXpH9E5/9jEJu+tTZSEbmRCkRsmp9uiBvaiu5PGtmE+zCN/pAQVsnd5IOnWxXczm8SAw8RXVqsA57aPiL93qP96Xg==
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0; RULEID:(8251501001);
	SRVR:BN1AFFO11HUB015; 
X-Microsoft-Exchange-Diagnostics: 1; BN1AFFO11HUB015;
	20:eCs2swT+ywfhs4NsDbEaevyBPJY/ZcG3+Jh8SgLxMgRclDQXYTRRyqAjC3DggB5E+8joDORMXLQH26IF61H4RR0P40rSOnNTajHaJEz16G1m17EQtYSdAJ3jndtIZ2Jm/SXd98VrpyZQ8DM0rmxqRgLe6MNzpyBS51ZKEvREibc62bN2igb/Pq8QBq4VYRvuPRTHdBr9d9SvwaaJOJ6TnKBzthB+QDXAjV+IIutxZ96F2YOvuqIzYk9UaGGf2U7oPDXR8e89+18alDjhPgkwhiLQg2yEiGidpWmCvaEcR54HiCRLkQ2OTb9DhANUsO42FajiElBu21Byf69MZ8+LbKb4FZf9vAI3odsNoaU15dqJR11Gvnt1H7TgS7YJXwfXKUdpPlbdXGkGrdDvr4rB8dCMcWOgnmWJFOSpZ1pRC6g487dZFNXCoH0pXeChnsurMielXtdNMRdcfuJQXoeiSjDQj39tvK9LijfCimpzkOmatVZa94PYJoZCGei586hV;
	4:+JLrm+MxOgVYt+Asz4DkUSPm1WsJn5GScHXuEsI/0tfyFDBxezF99D3m9+IqYKk8DrHV0NIcvYARwhKxn1g4f2rOu+PaqjWiDAzynWWohie0wKA0RcsNBLH90MPDrHbuUS1Bd4hA/ZBt2rxVSnkRqfUgDLzir3qQhoM3AHZrc5Ot90P6kFqF8cz94Ov2WhHmUKYoYcMjW5oQlD/Ckpu+d4BoDfHEHUtEsa8J5zDRvaQDZpmiGH+7WfVou5+eJfUMWSWWFkOyoBCGv5Uv1WA22bQvPgcL6Zzjbv8slB5cBUlnVer9tn1ngavC0uvG7wue
X-Microsoft-Antispam-PRVS: <BN1AFFO11HUB01569BEE67A1752ADB924128C6F0@BN1AFFO11HUB015.protection.gbl>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(5005006)(8121501046)(3002001);
	SRVR:BN1AFFO11HUB015; BCL:0; PCL:0; RULEID:;
	SRVR:BN1AFFO11HUB015; 
X-Forefront-PRVS: 06818431B9
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BN1AFFO11HUB015;
	23:deZgIHL1iGxPUt85L6yYP74/CYCO5KOnTkUgtCC?=
	=?us-ascii?Q?c99q4ktxtb0vBM+a5DUh/JTH/QDqndsK9ffAToj0jmGe8TcsegOIEoST1oRp?=
	=?us-ascii?Q?6HsuFtAxbLZnbtxPEB1Qu61EU72ZeyTQMVQXeom7enxaXyE4gZjhQfJVsLtk?=
	=?us-ascii?Q?q1VNQ3gPvMuB6eJzU9sVmgCd+GkvRatgzhRgEAiPuGRjAgyG0cJK6BtYC6dr?=
	=?us-ascii?Q?XAqOcC+bhV5PmDLy4QdjYJWqYud5I9QULg+QOlBpV4IzVE+D0GvZIVMZn6Yt?=
	=?us-ascii?Q?6Dy0lA9bippNf+zlonja4n7YhIiiRzinpUBF9B6nQ6ZR/khSFcYu+VY8B1LG?=
	=?us-ascii?Q?/yhO4yTrJdwCHT7VEJI9pzIUlAeOib0E8kHLlHgtEfaZkVUO9dmN/zryc8PQ?=
	=?us-ascii?Q?dkf63HVhG0QkrrY2xMbnUDe3ipvbg2ofw4K62IqX1bKARFFkCrrYG+2xB0pI?=
	=?us-ascii?Q?/d1NLp+VtKMx3ygsSLnVllUqXZzXtl6rLIHO4XjtoUYeK8kgGKSxKnbZ4HcS?=
	=?us-ascii?Q?yO3tXm/weO/O+3gAQWaY3eDdphcCPlZz8m9xaYYV/kSUWEj+i7/Innm3il1d?=
	=?us-ascii?Q?N1tK7s4AytAzoe7eXx97IizvGOf1C08fVuE+v6wMkCkYlcA6GGVHNegOUeAG?=
	=?us-ascii?Q?lIMiq0O06vUfnoZDyFxHZ7g8myA1JgIvsBrxEsVxDvarRGiwFxM1jzEwTF5U?=
	=?us-ascii?Q?mZQwD1sXnpIKABIADupkgl4o1nJJqm/V5HeeY7PxS1NmnalIY+j/KA0SlTCw?=
	=?us-ascii?Q?cKps12GOifW8UiEpA8+YExrePJLq0DFm2kgazGDYRuJMskhX4kqmHDL4hWAg?=
	=?us-ascii?Q?La7J9iUFSfRlEX/Qsi1Hqk9ez7ruUCWQOIT8MkusaRRQ9bzQRHK78ZGTBa/T?=
	=?us-ascii?Q?yv30WkJweHU1eJue6fGRuuaoMoH2QPGeqkpQRGrIJ9fTelbUlepTjHej8T8K?=
	=?us-ascii?Q?SoW9Lpp31/m2GINiFWEgCqFAjaPgswE6TKSV3UXDiAL5CnQh4wcS8pUDejG3?=
	=?us-ascii?Q?T3Jp4d3nKkfdIIbQcj824tHqGqZ+0q8yWgNQNJXTtRu7WRCOKn2PYkgwfxMR?=
	=?us-ascii?Q?ovRLZ2tNAY/29/crZpFErpnkxBs2KmzFPgOn8AG7nbTt/aGj6+lYMnh/hsVi?=
	=?us-ascii?Q?25GMmypXeQe5E4ebdDfD7SHeKpztdIzQl4y4gnaFzVrKXOvkPdtc1c0++QD9?=
	=?us-ascii?Q?wQSOM1pCc90OZ5Oz5r6pmoZ9xYM3fncNZCXw6vmxs2VvNzWSsI1bgtgIIwvc?=
	=?us-ascii?Q?T4ez/O/3Gg42dVX3SAgw=3D?=
X-Microsoft-Exchange-Diagnostics: 1; BN1AFFO11HUB015;
	5:0s5MzD9fbmh49r3b0ZaYOgqKi41d6aWXtuU57vIjocxPUIzuS0QprtdGrB0WjxXf6fbXn4m1b2Y8B8I3L4MeWHbDhaAY4ey9YoLey2aPlS0S/9cnYhNyx3rU0JhYR3tVlP9e0pqXs4GcPN1Hw9sXAQ==;
	24:UtnjyIyc5uW4roB59sC0zUDRFT4VnEPRaq6YVRZupwCyoDk0dmdosYC4IFZGnL5Xm1T8bz/Aetu1lAigv6rwfhgP/8HX9ty+qQqYj1jNUzg=
SpamDiagnosticOutput: 1:23
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2015 21:50:32.9645 (UTC)
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.100]; Helo=[xsj-pvapsmtpgw02]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN1AFFO11HUB015
Subject: [meta-oe][PATCH v2] Add analyze-suspend
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 27 Aug 2015 22:05:24 -0000
Content-Type: text/plain

Signed-off-by: Soren Brinkmann <soren.brinkmann@xilinx.com>
---
v2:
 - replace 'boot'->'suspend' in commit message
 - document kernel dependencies in recipe
 - pin git commit
---
 .../analyze-suspend/analyze-suspend_git.bb         | 28 ++++++++++++++++++++++
 1 file changed, 28 insertions(+)
 create mode 100644 meta-oe/recipes-benchmark/analyze-suspend/analyze-suspend_git.bb

diff --git a/meta-oe/recipes-benchmark/analyze-suspend/analyze-suspend_git.bb b/meta-oe/recipes-benchmark/analyze-suspend/analyze-suspend_git.bb
new file mode 100644
index 000000000000..6932e9fadfc4
--- /dev/null
+++ b/meta-oe/recipes-benchmark/analyze-suspend/analyze-suspend_git.bb
@@ -0,0 +1,28 @@
+SUMMARY = "Analyze Suspend"
+HOMEPAGE = "https://01.org/suspendresume"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=12f884d2ae1ff87c09e5b7ccc2c4ca7e"
+
+# Apart from the listed RDEPENDS, analyze-suspend depends on some features
+# provided by the kernel. These options are:
+#   - CONFIG_PM_DEBUG=y
+#   - CONFIG_PM_SLEEP_DEBUG=y
+#   - CONFIG_FTRACE=y
+#   - CONFIG_FUNCTION_TRACER=y
+#   - CONFIG_FUNCTION_GRAPH_TRACER=y
+
+RDEPENDS_${PN} += "python-core python-datetime python-stringold"
+
+SRCREV = "bce3cbec43bc2ce7a8c79b210314dd9d9ac1010b"
+SRC_URI = "git://github.com/01org/suspendresume.git;protocol=https"
+S = "${WORKDIR}/git"
+
+do_install() {
+	install -d -m 0755 ${D}${bindir}
+	install -m 0755 analyze_suspend.py ${D}${bindir}
+
+	install -d -m 0755 ${D}${docdir}/analyze-suspend
+	install -m 0755 README ${D}${docdir}/analyze-suspend
+}
+
+BBCLASSEXTEND = "native"
-- 
2.5.0.3.g52d66ab


