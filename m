Return-Path: <soren.brinkmann@xilinx.com>
Received: from na01-bn1-obe.outbound.protection.outlook.com
	(mail-bn1on0063.outbound.protection.outlook.com [157.56.110.63])
	by mail.openembedded.org (Postfix) with ESMTP id 922B371633
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Aug 2015 21:03:55 +0000 (UTC)
Received: from BL2FFO11OLC007.protection.gbl (10.173.160.33) by
	BL2FFO11HUB015.protection.gbl (10.173.160.107) with Microsoft SMTP
	Server (TLS) id 15.1.256.10; Fri, 28 Aug 2015 21:03:55 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.100)
	smtp.mailfrom=xilinx.com; gmail.com; dkim=none (message not signed)
	header.d=none;gmail.com; dmarc=bestguesspass action=none
	header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.100 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.100; helo=xsj-pvapsmtpgw02;
Received: from xsj-pvapsmtpgw02 (149.199.60.100) by
	BL2FFO11OLC007.mail.protection.outlook.com (10.173.160.142) with
	Microsoft SMTP Server (TLS) id 15.1.256.10 via Frontend Transport;
	Fri, 28 Aug 2015 21:03:54 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66]:53067
	helo=xsj-pvapsmtp01) by xsj-pvapsmtpgw02 with esmtp (Exim 4.63)
	(envelope-from <soren.brinkmann@xilinx.com>)
	id 1ZVQoT-0005Kf-UE; Fri, 28 Aug 2015 14:03:53 -0700
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <soren.brinkmann@xilinx.com>)
	id 1ZVQoT-0000c5-Pa; Fri, 28 Aug 2015 14:03:53 -0700
Received: from xsj-pvapsmtp01 (smtp.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp2.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	t7SL3IHb030335; Fri, 28 Aug 2015 14:03:18 -0700
Received: from [172.19.74.49] (helo=localhost)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <soren.brinkmann@xilinx.com>)
	id 1ZVQoJ-0000Zq-QP; Fri, 28 Aug 2015 14:03:43 -0700
From: Soren Brinkmann <soren.brinkmann@xilinx.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 28 Aug 2015 14:03:39 -0700
Message-ID: <1440795819-12741-1-git-send-email-soren.brinkmann@xilinx.com>
X-Mailer: git-send-email 2.5.0.3.g52d66ab
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.0.0.1202-21776.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-Microsoft-Exchange-Diagnostics: 1; BL2FFO11OLC007;
	1:B65uAk6I5DriBZFB8hira/PWfwYuoSSS8fUeBl3QcBqAxxeLVNPpoklHshCclWNLkoemcVtRKMbw9BQUYeIdkRfjvOce7mO0A3tozDIcopHfhh3A4MoltfhKktY4RXDe2OmO971RYwQU5Fjm1VdQrl/DrgAOy3o3xIYgmKOikLmd+utWMNfk0UbuZtxrzBsmxPgB/7UMs8MkAJDdrR7KWBYPXK2F0jgD81YB/zReTMLyyER3ndFcumhdiZzDhVwen3Tbab+np1/b1xGG8iOB9c0Tc/SZifc6OeUx7Yb/xQHP1eUsBSNnvI21koeuOSrQUma9kBPnj8I8oHiq95YAwQFi30Wig80ayy5CMBYEfHeiq25af0uUfvzBHM9OLSohhCKdHXT16SLlwX9RnWFkYg==
X-Forefront-Antispam-Report: CIP:149.199.60.100; CTRY:US; IPV:NLI; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(2980300002)(438002)(3050300001)(189002)(199003)(76506005)(57986006)(575784001)(63266004)(229853001)(19580405001)(6806004)(86362001)(92566002)(47776003)(50226001)(50466002)(19580395003)(5001960100002)(48376002)(46102003)(189998001)(50986999)(107886002)(64706001)(4001540100001)(5003940100001)(81156007)(36386004)(5001830100001)(33646002)(36756003)(106466001)(62966003)(5007970100001)(2351001)(110136002)(77096005)(87936001)(5001860100001)(15975445007)(77156002)(107986001)(5001870100001)(4001430100001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BL2FFO11HUB015;
	H:xsj-pvapsmtpgw02; FPR:; SPF:Pass;
	PTR:unknown-60-100.xilinx.com,xapps1.xilinx.com; MX:1; A:1;
	LANG:en; 
MIME-Version: 1.0
X-Microsoft-Exchange-Diagnostics: 1; BL2FFO11HUB015;
	2:dgTwQ9Lnz+zVoOANB8n1Gm80qHQmh/LKF8NLbTJemXEyxhEjYGB2ZXiAtXWMY8D16vd9MKSo1SRa5lGp47/FlC1xb6myMqV62j4OB1a1P2rZyP/OAQ6anvjakDNcDgZHKYEJKSAbLiqPJrynF4zA/B7d69eltI8kcDMP6BrgmU0=;
	3:GT7zNmJihf2icSWydLZG5WblovUPAWu2CogkO6H2r+r2/OnAuNZh2O9lRjKDrAKptsY4imuTNQD1bHnDpCz0mYnvUZ5R9gMYPSvj2VW03ger/tppmpzi2dgBlfS/4hgd61JiVZk/8sZJW5gZuDVJUT13KUM9w8sYFY3UlzwAKW76m4SGp8jyTZCTkSI21z/sKGDJ7pFKqhzXhE7NjTyXjbvoJfCSk6ShhnOZS9iUSm6JaYkcuNb2XpT/owkk/BSWwGFQ9gu74bXXRD+fk4MFvw==;
	25:GcgVIlgAV+5Ql0TLf2cgeQ1A4qNYJjGTX+rcYhTeTj++Al433tpedZl93fGFY8cfsYLQmn979ZUgMiXXGsR6Lu5uHT5Y/ITOPmTKnCeOfQOdNfQjjl9AvdjrJ6o6fdEF6Y3V21Nzv/HyWOCaOge4u23SDzToPBdS57q62Q9S+X+oVrn9zeuBX0wAlYrFqdN/Qy6rvq3JJIhktfmJ/e1RkUDX35i5gTu6wG3A9scaGuFrqhWYjdRYSRFR4l1tP4+KxeHSoI0QyOxQ5Pn94ijT6Q==
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0; RULEID:(8251501001);
	SRVR:BL2FFO11HUB015; 
X-Microsoft-Exchange-Diagnostics: 1; BL2FFO11HUB015;
	20:C9V3PBh7RLqY1NKEgV7zN158uAehReaAMNWKe5IKfIzZINkpqTYauxD00s0qRbPOqRnaha+2ctRpFxLraVij3UBlwkm5bKY/Dz/zIFuggX1BGEqwBwYj6Gvh3OYJhZph1NZ+XfB3X8B9k/AEqvywgnAng3ZUiJQghgQUCmWZeHCc22eHqvjU6lsqmceDxG6OgAMZgwecL+KlscSe1JYMfQqHMBpjvP76wxWShMP+6Av+iBcm2UtE63h4+VPdb7/bqnRI5OEKej+F5ySnOVm4JLPgkZIJPJ99spI0I9uZDiWEHOIdRm1teHjrLq4ERPITYsCp///RPHMLlqed5P5kIDIX5YGC0e0Vvwr53J9qpH7Mst0s+DgD/bAigTDT4ytmMIt/9NjeCfkpRrGA18X02VOKjB8+Up2TA1x5udazysZNZN2W2qvaI+hpYNOvIecmBLMdQvwUuurJ3oBZuoekqOWkRnPwA53+Oid6hlz3aT7QJKSmDAgKN4VPYa4JBlpn;
	4:qBB6v3o3jZ8MX1+DBrH0wJLXSiClgb6ea9aGK+kTulv0crJaPWKUza/ARfanjn4e6OD9OGf72PGyUiilNq9qmzlDEHGMfx+LNul7OSCWzTmlUd5/Sy4cCdCL+qlmO3nQGoEk3PnPkGLyyludWEHRkdC3119cM3cnU3J8ficRfjCS1vjCyYdyyp98Q1ej9cPZVAOGTUAqhxOGmsr665JfAj7RHV5pOLlr6+vvhiXyeMET8AkZB+vQxRR5/XTWnJGUsgLY15Z8Xyefm+alfKzMCyO4y+/KTA+do9K5JSjgTVXkTKwlivg3i62Q0JJsRPSD
X-Microsoft-Antispam-PRVS: <BL2FFO11HUB015246F766E3F10022697C58C6E0@BL2FFO11HUB015.protection.gbl>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(5005006)(8121501046)(3002001);
	SRVR:BL2FFO11HUB015; BCL:0; PCL:0; RULEID:; SRVR:BL2FFO11HUB015;
X-Forefront-PRVS: 0682FC00E8
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BL2FFO11HUB015;
	23:9Eh//DTZas6pD5Ds8mLhqqIA4n8NaXTDKM6o2Ocb?=
	=?us-ascii?Q?09dQ1HG5s5t6MX6BVXKkJOmrAs08xlm8DVXu3V3aJhhsbnPaSNI/4iXnx6Ez?=
	=?us-ascii?Q?pfafWbl98XWKRbRY0PzVYvvcC/V75jwvmgC4zs+mLE06E2FYxfAM6BXOnD9l?=
	=?us-ascii?Q?2ZDC8git1MhPFc7cxfIKAvVWtSblW46Meki9zLiUMxixjHlZ3uJaoAEAdJ48?=
	=?us-ascii?Q?XiiE6SMf8rDohpLOCneqPhOK/ScAIxsdV69HwqOVHPwvk/V8tq7weFcgk/kt?=
	=?us-ascii?Q?3Tdx/5IfOhonWYQVzSbAw5Arkbzb4rwEKYZI4bgTs84s8lDIhEN/dd6zlAT9?=
	=?us-ascii?Q?NGstKikAOMqwJ58YXQaF2nKA9TKPT/9e7RDhSDs1UrGXrioThEz5220pE0L1?=
	=?us-ascii?Q?iW3fNr51K3FozVDEhrXEjfkab+V1kkew4jTD2SJiJLSHC6A5HMWIAH2v4G31?=
	=?us-ascii?Q?A+WhDqwr/Rfgt/Zy3LRrw+G59YBc3rESHhsiDa51G8QueyK/3Cdy3NA+/5K4?=
	=?us-ascii?Q?TMCtoiWHfNdOhAwKuWQidHY6jYlzkmiYhcUk/0RqdVrR0JxpqIlPR6dKbC4R?=
	=?us-ascii?Q?ieUKXFFyum0VMtM/WpU0/hHCp30Kzh0AXMjy8rEn/+5eowSlAGKd9ug4Yc79?=
	=?us-ascii?Q?V+Xus9jgx29+lNfugMz7BfGGUkddb25J/GRrMCDaDLl6hhVueWdNXZsu3t2q?=
	=?us-ascii?Q?WO+a6YCbPWNe+KEDwmf0HJVZ2DSOkuoiZu72OuUdYF7743X2riUGIRIjclre?=
	=?us-ascii?Q?DQQ5nrZFQmsByQoheA8vQdL3axTcq+h6LpgjjMwGU/N7Sjp9Nzttz/RW+TmX?=
	=?us-ascii?Q?S+flrOq6tF1JXF7yVPEeysB5ZvClk182Ee4CJ47Pm8t+oJAo2Q6i88rgJzaU?=
	=?us-ascii?Q?zIEo1w8a5BBagX/FxJTVFZ2ZOAWy8G8GAr1f3FAAhKQZ3RqUypC61wYtLE1Q?=
	=?us-ascii?Q?Noq1TM85gZWXQzQF7nI3ZJsv4s38ZPBnCMelLFiEu2US4e8MxmxfPOr1oRHd?=
	=?us-ascii?Q?L9v9g3z91hJ8cOT4jp5qwUY2nU1bGUogs8wwajzHTjnfH7EJbXjh2VHGFm8C?=
	=?us-ascii?Q?beg+APbPDLRKhR/5hfrqk+3EspUvme/rnHTXyejsnjQ6pMVDJpRrnF/HCg5A?=
	=?us-ascii?Q?U7APJ9vT50el6criLmgG6u7w1Zxsqb+3IgZ64AcRU86GNKrDTbw83+jx6uNG?=
	=?us-ascii?Q?1dPo9XbLcHzV9UwegtS1YJfdYFd2Ytx0xqovugVnwNYor2d0/apqaPOIiS5l?=
	=?us-ascii?Q?apCvPynHiaqaz/zEAIQ=3D?=
X-Microsoft-Exchange-Diagnostics: 1; BL2FFO11HUB015;
	5:6qrxJLBGVjuVVnBEy2VIBHJvF0piIHdrwB4LKwCd2fL6sJiKmQWSz5Td7rXL+D0NOq22VLbt2/1YIPFOJhn6YAVkFZi6pfkdSyIemfnmB2VQ0Wpvjep9hRkQ18GuVkAEZ1f8tKClEHn0KUd//O2Omg==;
	24:Wwea7RaZNbtRv6QHR4zRyDuoQvjWPIVBRpH93jVbjPSgsJVN+TcG08CG4Um8URm0LoWDX1p3GST+4XzPYL77vOUb3RTAu6nGQs+7LDLBvFs=
SpamDiagnosticOutput: 1:23
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2015 21:03:54.8533 (UTC)
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.100]; Helo=[xsj-pvapsmtpgw02]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL2FFO11HUB015
Subject: [meta-oe][PATCH v3] Add analyze-suspend
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
X-List-Received-Date: Fri, 28 Aug 2015 21:04:05 -0000
Content-Type: text/plain

Signed-off-by: Soren Brinkmann <soren.brinkmann@xilinx.com>
---
v3:
 - define PV = "3.2+gitr${SRCPV}"
 - simplify do_install function
 - add DESCRIPTION
 - fix README file perms
v2:
 - replace 'boot'->'suspend' in commit message
 - document kernel dependencies in recipe
 - pin git commit
---
 .../analyze-suspend/analyze-suspend_git.bb         | 29 ++++++++++++++++++++++
 1 file changed, 29 insertions(+)
 create mode 100644 meta-oe/recipes-benchmark/analyze-suspend/analyze-suspend_git.bb

diff --git a/meta-oe/recipes-benchmark/analyze-suspend/analyze-suspend_git.bb b/meta-oe/recipes-benchmark/analyze-suspend/analyze-suspend_git.bb
new file mode 100644
index 000000000000..d97ff0a5bdd2
--- /dev/null
+++ b/meta-oe/recipes-benchmark/analyze-suspend/analyze-suspend_git.bb
@@ -0,0 +1,29 @@
+SUMMARY = "Analyze Suspend"
+DESCRIPTION = "analyze-suspend is a tool for system developers to visualize \
+the activity between suspend and resume, allowing them to identify \
+inefficiencies and bottlenecks."
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
+PV = "3.2+gitr${SRCPV}"
+SRCREV = "bce3cbec43bc2ce7a8c79b210314dd9d9ac1010b"
+SRC_URI = "git://github.com/01org/suspendresume.git;protocol=https"
+S = "${WORKDIR}/git"
+
+do_install() {
+	install -Dm 0755 analyze_suspend.py ${D}${bindir}/analyze_suspend.py
+	install -Dm 0644 README ${D}${docdir}/analyze-suspend/README
+}
+
+BBCLASSEXTEND = "native"
-- 
2.5.0.3.g52d66ab


