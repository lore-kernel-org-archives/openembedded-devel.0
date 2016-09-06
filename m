Return-Path: <ra43240@vinca.am.freescale.net>
X-Greylist: delayed 699 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 06 Sep 2016 22:11:49 UTC
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
	(mail-cys01nam02on0084.outbound.protection.outlook.com
	[104.47.37.84])
	by mail.openembedded.org (Postfix) with ESMTP id 567E976E5E
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  6 Sep 2016 22:11:49 +0000 (UTC)
Received: from DM2PR03CA0038.namprd03.prod.outlook.com (10.141.96.37) by
	SN1PR0301MB2013.namprd03.prod.outlook.com (10.163.225.30) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA_P384) id
	15.1.609.9; Tue, 6 Sep 2016 22:11:46 +0000
Received: from BN1BFFO11FD025.protection.gbl (2a01:111:f400:7c10::1:103) by
	DM2PR03CA0038.outlook.office365.com (2a01:111:e400:2428::37) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA_P384)
	id 15.1.609.9 via Frontend Transport; Tue, 6 Sep 2016 22:11:46 +0000
Authentication-Results: spf=none (sender IP is 192.88.158.2)
	smtp.mailfrom=vinca.am.freescale.net; nxp.com;
	dkim=none (message not signed)
	header.d=none; nxp.com; dmarc=fail action=none header.from=nxp.com;
	nxp.com; dkim=none (message not signed) header.d=none;
Received-SPF: None (protection.outlook.com: vinca.am.freescale.net does not
	designate permitted sender hosts)
Received: from az84smr01.freescale.net (192.88.158.2) by
	BN1BFFO11FD025.mail.protection.outlook.com (10.58.144.88) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.587.6
	via Frontend Transport; Tue, 6 Sep 2016 22:11:45 +0000
Received: from vinca.am.freescale.net (vinca.am.freescale.net [10.81.16.111])
	by az84smr01.freescale.net (8.14.3/8.14.0) with ESMTP id
	u86MBiom026278; Tue, 6 Sep 2016 15:11:44 -0700
Received: from vinca.am.freescale.net (localhost [127.0.0.1])
	by vinca.am.freescale.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP
	id u86M90qB016662; Tue, 6 Sep 2016 17:09:00 -0500
Received: (from ra43240@localhost)
	by vinca.am.freescale.net (8.14.4/8.14.4/Submit) id u86M8xwM016661;
	Tue, 6 Sep 2016 17:08:59 -0500
From: Ann Thornton <ann.thornton@nxp.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 6 Sep 2016 17:08:57 -0500
Message-ID: <1473199737-16623-1-git-send-email-ann.thornton@nxp.com>
X-Mailer: git-send-email 1.9.1
X-EOPAttributedMessage: 0
X-Matching-Connectors: 131176735064109596;
	(91ab9b29-cfa4-454e-5278-08d120cd25b8); ()
X-Forefront-Antispam-Report: CIP:192.88.158.2; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(7916002)(2980300002)(428002)(199003)(377424004)(189002)(8676002)(87936001)(586003)(960300001)(305945005)(68736007)(15975445007)(92566002)(189998001)(626004)(11100500001)(48376002)(50466002)(5003940100001)(42186005)(2906002)(4326007)(97736004)(8666005)(105586002)(356003)(7846002)(101416001)(229853001)(110136002)(47776003)(106466001)(36756003)(2351001)(81156014)(33646002)(5660300001)(81166006)(50226002)(19580405001)(8936002)(50986999)(19580395003)(69596002)(7059030)(42882005)(87636001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:SN1PR0301MB2013;
	H:az84smr01.freescale.net; FPR:; SPF:None;
	PTR:InfoDomainNonexistent; A:0; MX:1; LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; BN1BFFO11FD025;
	1:oBpgn1ZFTe6GV4XUbSJn4wNdYkG5wgnJs+EwWGQce25sblwCUDTI9yAMeBsKjjPUak6iMsjwSZDUPRpA10NUD+W4mSB2A0e/3BdxI2bWHBbYzoQXc4jLEvxOT35Mwycs4goT8cwgRwJuKCTnZ2xocgoHUjVtp2qombP5XKEY6n7NYacLhZLe7nORU0g7dHsNIHF3xSi11XqGlp3YgY0tawNMiuIKrr7HL/0k9ZfZiLE5GZGMoyPr9FbR+5hVUlEoBQn1D5MxrJdNcW5LOmQY9NjIyuN8yk35dBshdCGUIqWeWht3Mv/WkUl0w7cvR4UAHCLerykdQK3Ad4Lun/u6fjBMHnNo+UZc5rZEmiVsHSZ5rUF7eQPHq5S1zcFG0Ju9xFEm2UJxsAdQLM3A3GXqkK/bLV4acle4F7Kdd2I0mAnJBPsM7UPiqiQ6DrSx7TdqP5pTTRvFv0JjoRd40TINpIgodoHRAIQvz9LpCS8JJfKeRZF2zXBDNib6tLRKokPGMYpNpABqxLWT/g+9eBrqAQc6IeCwwFHkIRFsrHz4wwMZ76bJmWsEujj+Vk18oUZrc1Qo9Di2JimtpHg7tNljVWrPj/S3sX6UXj3dzrenE91F4lkyGy4tNr0DbUYkdn59u9fSpd4IX5OmZO+nVeLm63ZmCSBF/mfhxpL3PRI1Wqg8Cl8iC0XJFZoKWdZTvn47H3PLJfcOumsn9B1W2Kt3/w5HOxhVfh9jT9gaLUirJRg=
MIME-Version: 1.0
X-MS-Office365-Filtering-Correlation-Id: 7e320038-9e5a-4491-b21c-08d3d6a2cac1
X-Microsoft-Exchange-Diagnostics: 1; SN1PR0301MB2013;
	2:GWAM7JHT5L6PJrbAVqmJCLwd+54YkwSm81XDrMljQcs9ZlLMH00jaCUuZrhK9lfdHcfNSpX4rc/9coAPT8Fug1WcEh31/MBcBJYAua/KtyZ9cwiJVdXzBsX0JnOxUvpItLIhcaNHMr7scK5jLYqQsf2G5Mtn6irbZKuL6axZ5NH6is9HNvQdCZZEnKud27ri;
	3:ixVxlFMd5Qca17dTiFU0rbMx5KufSXLiBAjehcg8rfXedXx8iLd0QmWSYKM8KmpfEQcuh95QDaHzU/xmQv8uHSQP32qC8MgnUvK6IIH5BGmOcoSbh1bvyh2ANT27F2rXOErjxoLXf4FH7OP5biu3axbniqZEvWZGG5wfX56rLOo1yOILlL7Tape0NGh7RtBt0mhvtS6dHb5e0qAwvZBi9oMsDwjdn1u3zUg9fhxKVsI=;
	25:5mo+5SJx+dCyXf7iof39l/5pOwL6QTUonFdHmk0szLTu1V9OUAz3eJCcEdmXkO64vz4XooeF1lW4sdXNBcEJpG+aosUhm16jcHhz9rBPESjrvtQu/Q2b3d+tAv843k4vA0zSNEw/kuo5r6tku/Yzx25b9Qyu7rJoBI6EQ0WGmPRKfRJ0+Wv+cKh8GMFFNR5B+CWFZZTSDmDJG/qXXMP3HDNjzFKb291qKmOj9EnkPPIca2Q8doPbiLA6N74umDg4RKbUObRw+o/2IXveFA/su09knhLaj0/NDaQUgVmvgAd5mav0aLCyWNU09E/repFRAz4uKLQPNxy9iJdG+jjQLxuWbVXVwRujKwqIqRRjNds+Yim3zgDWxuqmGPed0BUO8R8o/OO+N6ayRkaWOyF2opjPwJm0+zGpM1TLmM11BqM=
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:SN1PR0301MB2013;
X-Microsoft-Exchange-Diagnostics: 1; SN1PR0301MB2013;
	31:A1j0KDagKCIZIoie+vMO/NNP2uirCnkdb0RPvrY4hoGKac9Rc+bA5DTa/1BcySuwVeo5DsuQm6/Qt0H6BLjP4yhhXh6/0zmNo5dR47ylBebZ6zZwk059cLEqxLeYZdQa4HDX04TvxCfjlczHieTW4RemsxVZ4SgXULnDsEM+6XCaAqdIgClWuw8WE1BkucTk8cm+5nPcL4yjBWCXFeJjIYots0KbQ4y1Fj2/wxlsdBM=;
	4:2FxyHYT+zL7ng+qExsdiHTaBcg+WEZwtQLcdcH/BJRyr7JSOlzchvRfqRXsDPiCor9a1a994uorzZi6996zBRCxCyj0YPoi+XsPfCFZOlldFsRyZ7sTVqqPOuqWiU7rTOi33hMNMV5oPMWRj/wadV/aaEkeeRd4Oea3QlyzgRzdGyPJ8bBCpSLSSzXlos+BxhGHYLwlsolHsBWS3ZYz69biN2G2G5j+UW8ey5PDef4UEl2JlSN3q3pPVQ/GlDj5ynzIUnHcW1zD0nPXbn6yynsL5F8gAuBnDMYBlUIHFcsr0egpk6sZBp0skciaceSszn7xOd9xkRYgL4Kej6NJNDmWn24xfTAFwBEbhWnFBi9pYSRNjDFlxHi9ZorVn0VH2usPVLlkyNWg+gBUZziqwrU+N4DkVq5pAqjOJOR0FjMsFx51SxUTUg3OXPY7plEtF2RB/ShgpT+MidaoGcbGjaztxFKIELG7U66BHSNJXmh84CWoqMJbvARjT0hSKqH8+yXE6ZLdaEdEjHYrcMnT+TTyR0J0N+y/9XwXCaSorHGOItpZvUkpgMKCo7eGKOzMy
X-Microsoft-Antispam-PRVS: <SN1PR0301MB20137267E1FE02EBC534B2369AF90@SN1PR0301MB2013.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(185117386973197)(24339691489775);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040176)(601004)(2401047)(13017025)(13015025)(13023025)(13024025)(13018025)(8121501046)(5005006)(10201501046)(3002001)(6055026);
	SRVR:SN1PR0301MB2013; BCL:0; PCL:0; RULEID:(400006);
	SRVR:SN1PR0301MB2013; 
X-Forefront-PRVS: 0057EE387C
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; SN1PR0301MB2013;
	23:aOj62F6CnrMUeqPRBt78J4NE1KNmGKmBtSJcSJ6?=
	=?us-ascii?Q?xvuuWA37jgQYTScKZJCnqMZg8uMyBtSm/G8Ro2EGSRe73n5jhfNgannehkQf?=
	=?us-ascii?Q?LV8ioGp+FRFEaz+/6VQ3eRvQLJfgISYg4cR8n7aaGg3xMNTnJEKTxmKMPd+7?=
	=?us-ascii?Q?cMg/DiE1KIb+BIbMf1DcoXVHOfO5oXVAl/d69OV1U0ovA5VGMau/90tDmKUf?=
	=?us-ascii?Q?ihgiNtZzSO+qLucW+9kcYC8aIHJwaMpCDrjNnMhZOFXRx1fsr8pL/LUdBywL?=
	=?us-ascii?Q?S5iE0NyrrIteXi79lIRbkoSgrzb92ZZcQS4TysQH1jjFkrmFlHH2yrCAzIAr?=
	=?us-ascii?Q?hwWSEX6G/1ns/ADW2XOCYJPsBWL7gLeJO26XDYDOGEUZzD9J4HJBoPVr8kHA?=
	=?us-ascii?Q?YRdygU1FVdOUv7ozkhrrn1yhz3NBGIRmAN0B1askB79WN1PkHDRhYzJRXVPy?=
	=?us-ascii?Q?JbmpDXiuRrYtNsSD7F/fxP0p4NkxvB7h2jtIylLDiDWWpELm52tmSqn85C+W?=
	=?us-ascii?Q?QudUT3oaBnM1TpgxdJvEaHbM/DWm1ytkbKOMYC6fAV9YY86dLtyKBndnVrN7?=
	=?us-ascii?Q?TGFNpXDOvhpF1cWJzB1F2r52EQY96KIPpgretMIhUUcbSd8AXkTdO766NgxM?=
	=?us-ascii?Q?WNpOYKVw1P1w+R7ZS8OnA+SCiTyLd6Dkqo/vrBkwMaj3MPCCTdmsxPE3Gv2p?=
	=?us-ascii?Q?frC3akv/OF+61eYQ1wc5rA51VNjOk8r+PIUwH50LQTsvjncpuWVYMkzhjBc1?=
	=?us-ascii?Q?drXCTsGUmnrmggVV8vbD391pCNLmU1bb+D7fvfxDxIcEoNrF1+tmIp+I/u7V?=
	=?us-ascii?Q?Db67hZDe8wCXkjP65ZOOtepGhI34ppo6DFhD+93U07yLdLQpPb/JLD409g3N?=
	=?us-ascii?Q?VkoD1tmeUUUNnF/zju/vMMcXAkpTsw8nX2UcgkMwv9doMbh2GYsHafxAzU+1?=
	=?us-ascii?Q?TeRXXc+MDLdzyOYqBLS3SmddkxhxQ6RUHKRYzs8U9mwFoR02PF0U8sIo7FAh?=
	=?us-ascii?Q?iK2YXWg+Dp6k0Q9yZtg1bRC1UDH4CRxMOkKWfYnDxItkcVIIf9EYaopTlVRr?=
	=?us-ascii?Q?/A8DZ7W0/+7snn5+R25pYke271nsjoDWYkmPu/nZEnlmuFGIz0JMkmkpDhkF?=
	=?us-ascii?Q?Ek/iIBUsiIUelkCpnypW7ohtyU0edGDCCQVRUlsMxDjR7cAvvoL3cyFmgpV5?=
	=?us-ascii?Q?hoHw01KVPyAX0ghc=3D?=
X-Microsoft-Exchange-Diagnostics: 1; SN1PR0301MB2013;
	6:3IAYpTNJfQw2K4S9YDtai+hgol3z/r2qGpA69QWChuku2f6LJ1q1EoIlW7T0gC6QFvVM3BbtaC06bdNLpEzZIFDsDkhvdnMzlyr2yrtT8K6oQ2NTX9ocvzUFesab3QpmU1H4iID1dOZzUAUwyN9EQaqkd1J28JR+C/c1F5OCIdzmW/lsH9DgbRi40Vc6qIBnRYstmG36UvoD2zQ2KjUHavS7A1li17OVxjAXkJvRxCLr3xhJ00KmAWK4yni8X3VDsLLJk/hRQ95LUsNLfPgizLPT8mdemVapWhF9O6h4HBA=;
	5:VtIxzyf53jGczn73iTTk7xNODlbZ+gWIFcE4o4YbgmgOZsHFI8GeCBWDVclc9XQB7OJ65iQijYqxhnrlaKpBOankkuB1SUWsusBzLwapFyJcw4mo6ITbkWqNxKXDtvM91LyQIejwSPxroXG22aBf5ahiAaI87A+bDpVD2AQy9s8=;
	24:PdLgy44VyOXTI8aLSfePyLqh/IQIfEvqUE4p1T4WU/LPq3rpO7Hx3gg3Pk61wVzDO4cxt3NtE1baXDdv5NCeZN/AVY8VaR0ZkD4IU/5DKNw=;
	7:E7eKhcqmlmdFYewKJypUYEYuSp4MI8W9BTNZiR/MOGepBZaO+fq10iX5xLTlMRDNjVePFsv8l/d3X6I7NiNGfEuBVVYtZpSogBVS8j55SanzTwpXGEFzPfOdGb3zS66pbW22yyoi5ET5o2R2dLNmxgaR7ofQp5/HxXqwQyr0kaV7QR11P3Maptuss87698AY7X8N3onwS4ZS5zGq5XzI0KC5GkT7Vs8SEL1mGGVpxtws9YxeiavEYfQlxQ06SKSe
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2016 22:11:45.5061 (UTC)
X-MS-Exchange-CrossTenant-Id: 5afe0b00-7697-4969-b663-5eab37d5f47e
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=5afe0b00-7697-4969-b663-5eab37d5f47e; Ip=[192.88.158.2];
	Helo=[az84smr01.freescale.net]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1PR0301MB2013
Subject: [meta-oe][PATCH] glcompbench: Fix issues causing failures in GCC6
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
X-List-Received-Date: Tue, 06 Sep 2016 22:11:49 -0000
Content-Type: text/plain

Signed-off-by: Ann Thornton <ann.thornton@nxp.com>
---
 .../glcompbench/Fix-configure-for-sqrt-check.patch | 14 +++++++++++++
 .../glcompbench/Fix_auto_ptr_deprecated.patch      | 24 ++++++++++++++++++++++
 .../glcompbench/glcompbench/Fix_space_issues.patch | 22 ++++++++++++++++++++
 .../glcompbench/glcompbench_2012.08.bb             |  8 ++++----
 4 files changed, 64 insertions(+), 4 deletions(-)
 create mode 100755 meta-oe/recipes-graphics/glcompbench/glcompbench/Fix-configure-for-sqrt-check.patch
 create mode 100755 meta-oe/recipes-graphics/glcompbench/glcompbench/Fix_auto_ptr_deprecated.patch
 create mode 100755 meta-oe/recipes-graphics/glcompbench/glcompbench/Fix_space_issues.patch
 mode change 100644 => 100755 meta-oe/recipes-graphics/glcompbench/glcompbench_2012.08.bb

diff --git a/meta-oe/recipes-graphics/glcompbench/glcompbench/Fix-configure-for-sqrt-check.patch b/meta-oe/recipes-graphics/glcompbench/glcompbench/Fix-configure-for-sqrt-check.patch
new file mode 100755
index 0000000..4831c40
--- /dev/null
+++ b/meta-oe/recipes-graphics/glcompbench/glcompbench/Fix-configure-for-sqrt-check.patch
@@ -0,0 +1,14 @@
+Index: git/wscript
+===================================================================
+--- git.orig/wscript	2016-07-29 13:15:44.954249796 -0500
++++ git/wscript	2016-07-29 15:52:06.196768865 -0500
+@@ -56,7 +56,7 @@
+         ctx.check_cxx(lib = lib, uselib_store = uselib)
+ 
+     # Check required functions
+-    req_funcs = [('gettimeofday', 'sys/time.h', []) ,('sqrt', 'math.h', ['m']),
++    req_funcs = [('gettimeofday', 'sys/time.h', []),
+                  ('strtol', 'stdlib.h', []), ('strtoul', 'stdlib.h', [])]
+     for func, header, uselib in req_funcs:
+         ctx.check_cxx(function_name = func, header_name = header, uselib = uselib, mandatory = True)
+
diff --git a/meta-oe/recipes-graphics/glcompbench/glcompbench/Fix_auto_ptr_deprecated.patch b/meta-oe/recipes-graphics/glcompbench/glcompbench/Fix_auto_ptr_deprecated.patch
new file mode 100755
index 0000000..930c7cb
--- /dev/null
+++ b/meta-oe/recipes-graphics/glcompbench/glcompbench/Fix_auto_ptr_deprecated.patch
@@ -0,0 +1,24 @@
+diff -aur glcompbench-2012.08/src/libmatrix/shader-source.cc Fixed/src/libmatrix/shader-source.cc
+--- glcompbench-2012.08/src/libmatrix/shader-source.cc	2012-08-22 13:41:36.000000000 -0500
++++ Fixed/src/libmatrix/shader-source.cc	2016-08-24 14:23:49.576023317 -0500
+@@ -34,7 +34,7 @@
+ bool
+ ShaderSource::load_file(const std::string& filename, std::string& str)
+ {
+-    std::auto_ptr<std::istream> is_ptr(Util::get_resource(filename));
++    std::unique_ptr<std::istream> is_ptr(Util::get_resource(filename));
+     std::istream& inputFile(*is_ptr);
+ 
+     if (!inputFile)
+diff -aur glcompbench-2012.08/src/texture.cc Fixed/src/texture.cc
+--- glcompbench-2012.08/src/texture.cc	2012-08-22 13:41:36.000000000 -0500
++++ Fixed/src/texture.cc	2016-08-24 14:23:28.223917438 -0500
+@@ -52,7 +52,7 @@
+ 
+         Log::debug("Reading PNG file %s\n", filename.c_str());
+ 
+-        const std::auto_ptr<std::istream> is_ptr(Util::get_resource(filename));
++        const std::unique_ptr<std::istream> is_ptr(Util::get_resource(filename));
+         if (!(*is_ptr)) {
+             Log::error("Cannot open file %s!\n", filename.c_str());
+             return false;
diff --git a/meta-oe/recipes-graphics/glcompbench/glcompbench/Fix_space_issues.patch b/meta-oe/recipes-graphics/glcompbench/glcompbench/Fix_space_issues.patch
new file mode 100755
index 0000000..516baad
--- /dev/null
+++ b/meta-oe/recipes-graphics/glcompbench/glcompbench/Fix_space_issues.patch
@@ -0,0 +1,22 @@
+diff -aur glcompbench-2012.08/src/composite-canvas.cc Fixed/src/composite-canvas.cc
+--- glcompbench-2012.08/src/composite-canvas.cc	2012-08-22 13:41:36.000000000 -0500
++++ Fixed/src/composite-canvas.cc	2016-08-24 14:05:28.970565709 -0500
+@@ -41,7 +41,7 @@
+ #include "log.h"
+ #include "profiler.h"
+ 
+-const std::string glcompbench_version_string("glcompbench "GLCOMPBENCH_VERSION);
++const std::string glcompbench_version_string("glcompbench " GLCOMPBENCH_VERSION);
+ 
+ /*******************
+  * Private methods *
+@@ -495,7 +495,7 @@
+     // When we complete an iteration, reset the count and tell the caller.
+ 
+     if (stats.total >= current_test_duration_) {
+-        Log::info("FPS: %"PRIu64"\n", (uint64_t)(1000 * stats.nsamples / stats.total));
++        Log::info("FPS: %" PRIu64 "\n", (uint64_t)(1000 * stats.nsamples / stats.total));
+ 
+         for (Profiler::Point p = 0; p < profiler.get_num_points(); p += 2) {
+             profiler.get_stats(p, p + 1, stats);
+
diff --git a/meta-oe/recipes-graphics/glcompbench/glcompbench_2012.08.bb b/meta-oe/recipes-graphics/glcompbench/glcompbench_2012.08.bb
old mode 100644
new mode 100755
index 0c5d7b5..35fb4ad
--- a/meta-oe/recipes-graphics/glcompbench/glcompbench_2012.08.bb
+++ b/meta-oe/recipes-graphics/glcompbench/glcompbench_2012.08.bb
@@ -6,7 +6,10 @@ DEPENDS = "virtual/libgl virtual/egl virtual/libgles1 virtual/libgles2 \
            virtual/libx11 libxcomposite pixman libxrender libpng12"
 
 SRC_URI = "https://launchpad.net/glcompbench/trunk/${PV}/+download/${BPN}-${PV}.tar.gz \
-           file://glbench-compile-fix.patch"
+           file://glbench-compile-fix.patch \
+           file://Fix-configure-for-sqrt-check.patch \
+           file://Fix_space_issues.patch \
+           file://Fix_auto_ptr_deprecated.patch"
 
 SRC_URI[md5sum] = "c939d9156fe940960098f38707fea827"
 SRC_URI[sha256sum] = "b04b738cec06c6786ceafa86e4735fd8b971c078265754854ef356b0379542ee"
@@ -14,6 +17,3 @@ SRC_URI[sha256sum] = "b04b738cec06c6786ceafa86e4735fd8b971c078265754854ef356b037
 inherit pkgconfig waf distro_features_check
 # depends on virtual/libx11
 REQUIRED_DISTRO_FEATURES = "x11"
-
-# http://errors.yoctoproject.org/Errors/Details/68631/
-PNBLACKLIST[glcompbench] ?= "BROKEN: fails to build with gcc-6"
-- 
1.9.1


