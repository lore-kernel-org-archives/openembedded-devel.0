Return-Path: <ra43240@vinca.am.freescale.net>
X-Greylist: delayed 1064 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 06 Sep 2016 22:32:42 UTC
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
	(mail-co1nam03on0058.outbound.protection.outlook.com [104.47.40.58])
	by mail.openembedded.org (Postfix) with ESMTP id 8585A77731
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  6 Sep 2016 22:32:42 +0000 (UTC)
Received: from BY2PR03CA067.namprd03.prod.outlook.com (10.141.249.40) by
	CY1PR0301MB2009.namprd03.prod.outlook.com (10.164.2.15) with Microsoft
	SMTP Server (version=TLS1_0,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA_P384) id
	15.1.599.9; Tue, 6 Sep 2016 22:00:10 +0000
Received: from BY2FFO11FD052.protection.gbl (2a01:111:f400:7c0c::183) by
	BY2PR03CA067.outlook.office365.com (2a01:111:e400:2c5d::40) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA_P384)
	id 15.1.609.9 via Frontend Transport; Tue, 6 Sep 2016 22:00:10 +0000
Authentication-Results: spf=none (sender IP is 192.88.158.2)
	smtp.mailfrom=vinca.am.freescale.net; nxp.com;
	dkim=none (message not signed)
	header.d=none; nxp.com; dmarc=fail action=none header.from=nxp.com;
	nxp.com; dkim=none (message not signed) header.d=none;
Received-SPF: None (protection.outlook.com: vinca.am.freescale.net does not
	designate permitted sender hosts)
Received: from az84smr01.freescale.net (192.88.158.2) by
	BY2FFO11FD052.mail.protection.outlook.com (10.1.15.189) with Microsoft
	SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.587.6
	via Frontend Transport; Tue, 6 Sep 2016 22:00:10 +0000
Received: from vinca.am.freescale.net (vinca.am.freescale.net [10.81.16.111])
	by az84smr01.freescale.net (8.14.3/8.14.0) with ESMTP id
	u86M09eG020621; Tue, 6 Sep 2016 15:00:09 -0700
Received: from vinca.am.freescale.net (localhost [127.0.0.1])
	by vinca.am.freescale.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP
	id u86LvOh5025163; Tue, 6 Sep 2016 16:57:25 -0500
Received: (from ra43240@localhost)
	by vinca.am.freescale.net (8.14.4/8.14.4/Submit) id u86LvObw025162;
	Tue, 6 Sep 2016 16:57:24 -0500
From: Ann Thornton <ann.thornton@nxp.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 6 Sep 2016 16:56:57 -0500
Message-ID: <1473199017-25123-1-git-send-email-ann.thornton@nxp.com>
X-Mailer: git-send-email 1.9.1
X-EOPAttributedMessage: 0
X-Matching-Connectors: 131176728103438604;
	(91ab9b29-cfa4-454e-5278-08d120cd25b8); ()
X-Forefront-Antispam-Report: CIP:192.88.158.2; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(7916002)(2980300002)(428002)(199003)(189002)(377424004)(110136002)(5660300001)(189998001)(68736007)(229853001)(87936001)(7846002)(36756003)(4326007)(97736004)(5003940100001)(47776003)(305945005)(586003)(48376002)(42186005)(81166006)(105586002)(50466002)(626004)(8676002)(2351001)(8666005)(356003)(8936002)(19580395003)(81156014)(50226002)(106466001)(92566002)(69596002)(50986999)(101416001)(11100500001)(960300001)(19580405001)(33646002)(15975445007)(2906002)(7059030)(42882005)(87636001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:CY1PR0301MB2009;
	H:az84smr01.freescale.net; FPR:; SPF:None;
	PTR:InfoDomainNonexistent; A:0; MX:1; LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; BY2FFO11FD052;
	1:ROKOjMS3mEKLlIlhWoD2hPDM0ErhyQFO3ahePrIYti/tS8EiOUbotFZCSuzvcRNStyHbGnk4e6FfQO/lbIA3WKvW5lzMRK+/WA8gFN7PwAoy9nOOxTom+usmX6ud/es3ZsRUmuq6UgX89azeE2p5YgudcgwSud4BkBto/tQzY/2f2N7rQOEinCeXXhQzzfwlvZ4hvbdEucNiRo87VVeeAZZqkOa/zk2t7+QvnjJEdoLyc4qBnwfedccolchS/yXT5R3OT9U5VK97qK14fAcqzswk2y77q5LgEl5w1wKBQ2D9cjf08bRS+zePklH2cSIBbwKuWlJftiv0tTap67QnCCXPI1gB6/a9OjmRSBFq47U5qLdb+45hP14Y0/5tHnvVVKNykRhtIo2OOyrem70AH2CBX6kr+sXAFiUz/SP4hmO6xDipOwNoA2NZZs0+Ab1y9TaXYJioNQTXU94XhJz9HSNiwY1YpqpeaUF6x6d0tToM/WREGl0cDs8cTbSQqpfrp4ewuUc3uxRh0bRNLuar2gLG2oQvA0sslGkJ3UKOhxm3nL2DJ7R0fZNgudmqQsr4Exonk6hyYqRqhjjSb9NMCqTGzjZzl+i3a8HexbRZhlOKsud30psz0kjNBrsM3zojCrpaM/kTfSw91rZb7XROq9ZvHYuOI7hyyWgmaFJd3BScANs2PnnPraIevCVtaC+qV0M2gbb46M6kfIRbgQBdtGJ1hLSu5QU3e9xghex8cvY=
MIME-Version: 1.0
X-MS-Office365-Filtering-Correlation-Id: 209c755a-2df1-46df-dcb5-08d3d6a12bc8
X-Microsoft-Exchange-Diagnostics: 1; CY1PR0301MB2009;
	2:h+qcBtaer62Uc41At4dqtRFmkkQfk0PNxWkI5E6kF13hmD2qc355e3gb3S5y8r49/dzPSxb2rU/Q8CSKNG6rbZzFIiKXLyZJa6I933KYKaDiKA7oc3B+7XYEGU7gGUySapL+R5IU3nIKsfdVekT91NQFSt/bshJvq8U7lyvtAPNaMv84RSLw4JVwqXECVPhm;
	3:JfX+G3Obk/Q6OW02FMt0cPk0478oWX4hENojmW1dC4GZQYBc9cssLWWS2wUZrBhvca3rJEkiy8MOa5Vef6jHtxD9hxIC3oQGcwG0oFZe4zL6dY+Jn90r52hchTncKugiJqjGZ0jPJZy+fLSWaf33yr7llJOyD+7xKecpBKl5rM4X0CuU+f+8Lx+776q9dRCuKj59Unkrgd3tf7UKB4dyQTQ1r7mpioevVffKF4OuFGw=;
	25:cmXXyNOPwyVa3AS5Lyb32UdcFy6Xvh7GGn//50CIl/FdS1gfQb7SDOGOh04v5wv516yPpxeodDIccn4Vtt64D1Y4WwFpIOkixVq0A6C9mXPIY98CI5Aw7J23vis7SKasNhc1yMunKVUSsCXDyOL2tc9NcHKfsP2QFs9j5d6h3TrJRly5aBek9kJWq2V16UNQIUOcoYx2Qbe5wH7ew7xU5VgDweg02vtOW8HFAMyzYFKNnFbGEPN1gdMr6ha01K1MEwljIORMQrVDFqhZhHdcf/ypkhbIBSor4/syf8ZwYr3O+BG3EqWYrQ7kBOEhlKhj2uSvwB0E7MB218YwHRprwGRKTNDhNIC+ZLssTmmBxNBz5Zj3boV5nzUUCGiQlHz6Th29OyHntc9nqmGqxrJyV67q2No3R5lgCASgb4PAwpM=
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:CY1PR0301MB2009;
X-Microsoft-Exchange-Diagnostics: 1; CY1PR0301MB2009;
	31:zZ9eaKCRS6EIdrixq+Z0xs1pwO6WF6EMXYPSxRqzZ07qmcbDelPlUEotPSEhE4PFkLMnxsivtHkD02OSFNfrXlPgdwAaG65eT7YmIi6iD2N+kqLCz9kp7WzL2Kc/vBIVSAYQpApZ1pDH37eZFRGJw+wWP4Bh8AnNZnGHWm9GVAa5vp0oXLdsaT9BSc/Ph2aON6m7x3vqt83dgP8JFsY+gcOHZj29wytE4i0pAyq7fmU=;
	4:TEm36CEX5qdAKr1IOhIm2fCpvD5m8d3hKjb+Z1dGEgurYudJIsXBsWS/xpGaafn9cWB0AX6bY75HjjQSMIq+jrx4C1t1MOwYNvv2sbca/7cpbHdEiv8pazdMAHikXcBMdPfngrBcp0nl4MEd0eBptXpZxcp/xGIAmC4kW4Yez1TludCeMvxOfhUitR+llf8PV+UhMSAknkSIfKzq6rF5Zygze6Sx/OhVdQCfa5Mk0ygBRMiBGn8hlm5/huAqT8l2AbXUVjA8vX96iNchYBLcluI8EekZmj2xaDFTAse6/RYJ679vBQ9sMUSvMrg4vUQUpCsOs3ra0oKnZVRI2lw5DNqaX/ncwK9GBperGJXWPs5U6/sgjWzKNd+ltFetM++oG0wj/iizMJC1X7vsL9x+cruzwG3YI4WAHhjJpM7qUmt6m6ELRDcTviC6suwSUOI7W5jAa9kV7u1uQaUbw25nKvx3lheyX5tNBzST91UEpSA4FYcahjiPKBFlegLxSdzEXjbca71yTfRauoqc/KtoacULTUmuSoFtU8crPjYuwvrahZNb8wO5GbvRlZZ6URdG
X-Microsoft-Antispam-PRVS: <CY1PR0301MB2009E2D67F6E7ABAE0FA74479AF90@CY1PR0301MB2009.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(185117386973197)(24339691489775);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040176)(601004)(2401047)(8121501046)(5005006)(13015025)(13017025)(13024025)(13023025)(13018025)(10201501046)(3002001)(6055026);
	SRVR:CY1PR0301MB2009; BCL:0; PCL:0; RULEID:(400006);
	SRVR:CY1PR0301MB2009; 
X-Forefront-PRVS: 0057EE387C
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; CY1PR0301MB2009;
	23:2wWozxvCvZ2O95l75iE/T6/sXFr2+1MdhbloEB4?=
	=?us-ascii?Q?kDcZD4SWwdJnDbgY6dHwoaq7sS2Ei3jJVFBfBC2JXuC5vxMZoaTRvrcgElWz?=
	=?us-ascii?Q?qk/sHXMpK6pJWWjn8ATrmiWP1qcSZp+MHFeYcXJxM4zA0WqLWBqroC3yQV1a?=
	=?us-ascii?Q?7rM0npF1kGTEqB3ndYNn0ILt67X1r1Wgw5u7b+PL3res6IlP51hh9wfRudBG?=
	=?us-ascii?Q?Z9iOxik88MtYeodHJsFS0M1IvpVKK2tqPnIloEhyHjH2YiosjYGZ97PzQPOL?=
	=?us-ascii?Q?pyLotbdhcZSWwauhsUA/YYQyJC+2gr2NdsTf21itxugH4TjdOWqPfa97tQXX?=
	=?us-ascii?Q?IwxcluZVUWObBd2Dkh2EojHaVTM3j4YzArT1nB+lD3fCtgkOVb8oBY+sjt8w?=
	=?us-ascii?Q?bBUcTEdC2IUArxpKX6NbaU39anxhn/h1rlvRYqykkdoqhJNjGtOUCEEuZMJo?=
	=?us-ascii?Q?ijSrS8fRAu3EEGKHCw8mT7KpvjlvoPZEe3SBJlqv+QZEoaSMQlovZVzSLXuM?=
	=?us-ascii?Q?+SrWzPpNYutduiRKejX+8XTXEQTOMu/hBS2nqsLTttEm9iKN/xChYfmGU/tu?=
	=?us-ascii?Q?+/7weFiNnqgNa9VHZBtXNe3CEEMVKjAehXlijp0UxRkcm18NgPdmpN4l74Wv?=
	=?us-ascii?Q?W5pWxCWf+ZkrM6WDO9BU8i9rRGJWEQmOn/Q290A7g/oab0VkZyPenNrPyRyV?=
	=?us-ascii?Q?LNYfvVb8eo5oL1kHyqKax6W1ImsxBnxtwKAs+94Pq4NiR3vWK601vi/T8SES?=
	=?us-ascii?Q?cl4dX/Pn0qOWsz/DGOsDF/fsYZ0wvBTAsKmdECbbBCLWHSXWTgw/76q/4WZN?=
	=?us-ascii?Q?mS+H1ihLqB+ZNEGX2oRGhe+fQu+QbaSo2YiB8hN/jzWx49TmssXzjFTKFJYh?=
	=?us-ascii?Q?WmDRN0q74uzuaPq5VZn9nC3jKYtuNMK0C3+WzBpifpS7KlbiJw/FcGlNoCtT?=
	=?us-ascii?Q?Sxyh0s9dpJWT4LDXegkm0wNlja0pvBI62aqq4BpkQVZwxAaIke82Tyk1kV1+?=
	=?us-ascii?Q?veGEGy3fOodxFzVdgWxoT+GoWczCOk/IrqHLm+LXL7cw6/2LCbw7eQv3eB5X?=
	=?us-ascii?Q?2HKiGsxJoAbx4ype7jXrF64/s+JS5vvClE2QYFsz0l84j0POdU+z5Fs/YSry?=
	=?us-ascii?Q?b02O8o8RaLhlnttTNpd15/9TGLmRIvMT0qW0AmjSXkz+h3vMI5LKQwg+1p9W?=
	=?us-ascii?Q?vF4ITPYLN7NeznUg=3D?=
X-Microsoft-Exchange-Diagnostics: 1; CY1PR0301MB2009;
	6:viD/GizQt1o5dFH3XXLxgCNvaZcL3D5GFK9XGHL8+aH5dzyFN3zlo/gi3Lz4bkJKWGKefcvjWvKmVNGdobi7xauYe15JhanXG6SNWn8cT7t+a8Loi6q5iN7pvwi6GVGHoEZ0GjL+5ggYYM/WxLnIBUGYXUl+jvIrCvo55KJvuKJ07iDQgAMdIQDAqybFSxY4/ulEWyGN0uw6xc4akCKlqfvkAmvedqSM1TE19et5dpZZzibJThafFJs2FGqcCTt+Mknr8g6GnmA22hJh47Q4niBt7Y2LjkWmdRLv7zxspOs=;
	5:DHlbCyoaVfUNGNQ5jCHjZpmtJxRhMyUYlEWil2wcHmyt61vGo9E+jxMxC/4dslqyVIIONQSdiG48BsqgQ2HtSgnS9ce86+8FKotrCTcV+UACldXib4I25TdOlZfc5UxbAcSD6cA0vkfeIhr9KKsu2zpV9y7gUK23+HXpE9JgaDs=;
	24:O6LZ51humNB8A6Sfo6BHwncV4I+0If6IpyRfzJSOJJ92UaGuj5I2oqeaP3Hk8Abo0n/IMRbpw5w8Bg+SMnuqHb5lVtWW+ZQq8V0SQft1arc=;
	7:T5bUkI3871j0IjBtOjT23UF+5wC6GAgnq4lnHD0qhTj1Tee8z43JjGekGzDj62HCqybVqeRWEWi4O7JfpSs77+gxi0G+aL3VBODQ8Xpsgk6UMJjoJGDvjpLbyaLSvTqoNdjOdp97yCqQdeOU46k0adasjncLB2r+XqgSUXXhbPj3Nb/U+WqqboYaHaf2vLy6D65xhiaSYz6DqUWK8oCc61RaJi/9jv7QrgMongCcZybdmgsOM4u3XLOYqV5Fy7r2
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2016 22:00:10.0318 (UTC)
X-MS-Exchange-CrossTenant-Id: 5afe0b00-7697-4969-b663-5eab37d5f47e
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=5afe0b00-7697-4969-b663-5eab37d5f47e; Ip=[192.88.158.2];
	Helo=[az84smr01.freescale.net]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR0301MB2009
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
X-List-Received-Date: Tue, 06 Sep 2016 22:32:44 -0000
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


