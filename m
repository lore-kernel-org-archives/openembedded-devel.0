Return-Path: <tom.hochstein@nxp.com>
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
	(mail-db5eur01on0041.outbound.protection.outlook.com [104.47.2.41])
	by mail.openembedded.org (Postfix) with ESMTP id 3483A771BE
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  8 Aug 2016 18:16:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=dGsWOC5u0o4aIBnKT176eL2ZFtcYMqFfxTCXhgicd3Q=;
	b=LrIeksWnYZ9cM41ZstMUAjGlaGUmDFbIub7bIJErXiuAI8KB/0LzwfvkGuuzFz3M5xujRwdDJbofH3jW0hCven7LzqxsIaQul9D1n6kQbpkX1CdXGW9WxiqOznaiHXzcwlQKkKy20sdNJLycFbHAKt0KlOFVyRQMZV62maWNoco=
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=tom.hochstein@nxp.com; 
Received: from tx30imx-01.am.freescale.net (192.88.168.49) by
	DBXPR04MB317.eurprd04.prod.outlook.com (10.141.232.12) with Microsoft
	SMTP Server (version=TLS1_0,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA_P384) id
	15.1.557.8; Mon, 8 Aug 2016 16:44:18 +0000
From: Tom Hochstein <tom.hochstein@nxp.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 8 Aug 2016 11:39:54 -0500
Message-ID: <1470674395-3076-1-git-send-email-tom.hochstein@nxp.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [192.88.168.49]
X-ClientProxiedBy: CY1PR13CA0002.namprd13.prod.outlook.com (10.162.30.140) To
	DBXPR04MB317.eurprd04.prod.outlook.com (10.141.232.12)
X-MS-Office365-Filtering-Correlation-Id: 43ca89bc-ad63-42d3-eb8a-08d3bfab3dd3
X-Microsoft-Exchange-Diagnostics: 1; DBXPR04MB317;
	2:9fxIy0oxvcneYvyg9YELd/BOEzmzihLr2Bejxd3zl+hJUzroHb63R6TV2jEcTC43RZ6BH5TKWeU5i5qvSrRQlo9Z8F2E7FTnRmRsu8r9g8WmBJ3r0JmZBtnpIwcRKcrl4tTQvqi3mJjEAVjXx6H8Rh52/aoaeelOwtdWtyOkZeq1VulGt2PjhA08vTShUDG6;
	3:N+lHVcgkjZl5MsLD9iTYbGWKLxW/R+LXvKVKw5YMngrS2+rIey75YhyoiRId49q4kHLbL9HCRR56h5RPYshGQL3T1i8Q5PVXdM7xHMW0To4jy5Se8fUj+3h3jDI5qEgi
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:DBXPR04MB317;
X-Microsoft-Exchange-Diagnostics: 1; DBXPR04MB317;
	25:CV6oFuijZgg5JAGUwQWwXVbDT2/NMZA/dcsmnFHWf2DteF85q+H2XZrGudC87iJpD/wchWHqSk0zisn2WssR1xdkTaREsutxY2t5MuyoyfzT3lLYDeoErMCU9Lryxfri3QlRtCWdch2WaY3ommSL2v7ySBk5Oas7ziHU0GFGaJv3XQVlI5+86kAwKLoS0XSlXAvUhuLWdZvv0oe18FM549LRwXDaEDP7FkqUbgVMrPApA5A5hKLoyvkkj8D9ZTkrZNpZH2q/KokJaB9U6tbsl3fEcUH0aAJCv4q8P8uPJsZNlMHVWf3isMEq3yDP8HrHmFjRPsr9zbuWtZBPLrdVMRi0KCYa1yQ31aT0l3q9NN3uOzn/w0MM9USawXCr/1riYpcZ4JKNsHbYB6r1Kz8RCxxd+5oM0WC8LskDjrNiDbL3q+XLL9pkgVMZkYcdygq/pqEV1zC/yzb12SzeaoNcRa4+umMVhg9jQdGDHJbmE8qNMs0wjsY1Ibyk3SpsRWTA9mB7iv5DH8I2bZbOrh/LtObW4xhmjg3k4ZzHGVyeAjcMqwUFQ9L4umrZPP3N4vGpNKqobqrsXwrE3umAIGyson+RcOlOCRTUzKIpGVm4JUAj8Dxf3wHuvMjeOhxNCsF8nA65UuCxVaHUUL98/FWlUq7V56egdH62kw+ru3ASbkvNXOr6wZapA9Oj0dka6aKI25u4/D3xWfs33xOkW4V+7KjwK1QsJV/2QmPyEfsYpTaBsfzKau6vywWkZm6DQ3lMU/F17dhqRqdhGmvvSxQT3w==
X-Microsoft-Exchange-Diagnostics: 1; DBXPR04MB317;
	31:t89IRDMFg71vji0hu6wP0W6Ls9Ld5+9goAff81KBH2hZczRk1yaVmCW8cicFVi1JTb4fPpNYfJ3U10un6rkUHOQ5Fu1QMDOwrB5UMZ9zqkABWzWCesu51K39A+GT0YrYBxnnRgywVlNK6Kmt7GjcenTEn5gplecShWqR/WTY7HuR1aJQ1cu0eLVedO5WPk13UCUy2EFH/R09gTOq5VYxVP/TdHU+iRnA5t76AGpGHVI=;
	20:+Ki6XAG6N147ITflNEY2UX9qEi1qni1HgaI5mzjiLYqkOAZ57bGTXULINtZtIwrpWZRa/+bHY0ytzgUn9NqemFoqYOi4XQ0FhFMfENJAHtKrEy5CnWUJcA4m75E1cxvThhufbwB0Gen6z9aAWhWcoaUE8sJ1znGKfSTE5ls4Wo0Zu71jDXqdwhNKgAizowjLdNj6MO6LKgIh4CULKylHSC42+em/lIqwLuL3wRS3y0B0nPR98kWuixvTLIczxYYpDnYLnj+avmqqwlSkQHAgR5k/htJ58lYTwony7zm/zZwShgB599Ylvko7nEMYWLocO5ixZlp6b/n9KuJBbYDk+2+8p3txlc84vlB3B1U5t12aQ3FVTcfvA8D6YAN+aFTw+kMpGdFXkLTbwBh4fwwIR9K9USt2HzZk+lxMRgTgxAapplqnOs+2Ql/MAa+mPev2/sf+DG20VwCYBFxlTIfC1Dpu47POM9ERaHnZ0uobTSCLWt12FFAoNZH3l5vn1Ocb/A4CR8/WS4YNWNkLHANzTnB8PrFguTu1okcvrw6Rmfx8Y5p0zqQLOZP6wSIfeI7yh6Elz1Pj8YNA3G7BAO5SNofGpnF38j9cF8WoOOIUSMQ=
X-NIPS-smtp-INBOUND: xFSL-EDGE
X-Microsoft-Antispam-PRVS: <DBXPR04MB317B014AE118CBAF5CD0533E21B0@DBXPR04MB317.eurprd04.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(166708455590820)(185117386973197);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(2401047)(5005006)(8121501046)(3002001)(10201501046)(6055026);
	SRVR:DBXPR04MB317; BCL:0; PCL:0; RULEID:; SRVR:DBXPR04MB317; 
X-Microsoft-Exchange-Diagnostics: 1; DBXPR04MB317;
	4:CbZ5YhZlrtgyvKSwskPkO3o65rau6vMm0nDafObK54fJM/zCh5HWDrFjpaSAidAWdxMnUkJL7ne/UNwZJPFiPEPes4gPRJSuAqOBiy4284aL3Mgdw3N7slK56X4M+eDzI0HmMCVGDaVECfCYiQ3sAIPPrkjd8Q+SwA0aIHGEHRYgO54x4wnWq6QAs0J3jMQRrpJISBbaTyG6FlygcRoZwwWPJNhyyJRNvhkRQ/cAMeiaIzdBusHjz6w0DDgx+1AqiTK4oHyZzQb0oTi8aM7S+XGzh/Svmm/v3vk6ukP0ynyHPXQ5fdVuP9VpnicTSzaISUovK+5sdCZLXhkUwSM9ihHXwGXEEYA+jSEA552xmkI8W9oyyVwUWcBtOJarAO47jK9qSKc7PQXk3QW/w3yrAzLkmNBMHV8R10OBeexTqNxEEHKGzZg6SlaiuKHra1jmZQkO+q9LsbFv64HMfEteJA==
X-Forefront-PRVS: 00286C0CA6
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10009020)(4630300001)(6009001)(7916002)(189002)(199003)(377424004)(19580405001)(105586002)(50466002)(4326007)(66066001)(7736002)(81166006)(92566002)(110136002)(189998001)(42186005)(48376002)(50226002)(47776003)(50986999)(19580395003)(5003940100001)(2351001)(68736007)(3846002)(6116002)(450100001)(86362001)(15975445007)(101416001)(36756003)(2906002)(97736004)(33646002)(8676002)(77096005)(586003)(229853001)(106356001)(81156014)(7846002)(305945005);
	DIR:OUT; SFP:1101; SCL:1; SRVR:DBXPR04MB317;
	H:tx30imx-01.am.freescale.net; FPR:; SPF:None; PTR:InfoNoRecords;
	MX:1; A:1; LANG:en; 
Received-SPF: None (protection.outlook.com: nxp.com does not designate
	permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; DBXPR04MB317;
	23:6w/LHen1tS9H4Obj7gWDLL4o//OVp3BpDJ83I7jPVV?=
	=?us-ascii?Q?nCPXckBy9FtUsLc0ndruNidhDZC0+2vdxh2R8oTL62lFYuAgaDdhMCwxDliQ?=
	=?us-ascii?Q?f7amKwiPm4CmCnVLZGuco3cNDj3EB9quf/pd0CnmxAuqQGuboHQU4lrblvza?=
	=?us-ascii?Q?rbcaQDQQQHgt1yvj8QFtLJOIGmgzVe3PFp/hfQ4BT7+3At44E3E2OBIN3oh+?=
	=?us-ascii?Q?6z4DvUZHjV09HR2xTWHhUVXzUvDc7UcN9KfiYaVl+vEKSLG3rXn48MD7w+5A?=
	=?us-ascii?Q?muVxI+YWm958YCqToKLHVUTr2aogy6qiM2h7RE86tjkgdIvAO9YfDybt7GSd?=
	=?us-ascii?Q?GjX7mtgZ7pc9wlTuFkN/oK57qRwAmlGShyzxDv0gZDhyJfeJURuO83j0on8p?=
	=?us-ascii?Q?b2ADizv0J2DKGhqDaVSfgSX8qDbNx3hW0E1S3DSQsTJyAcC4AODuvgEjv7Av?=
	=?us-ascii?Q?0/Abzx2zE6r/oD6dt0UNGZEOaJjybuQ197JT2USeOIallKeZ/ZhmzTPGAqmS?=
	=?us-ascii?Q?Vhg2IqU6ivyxCD8ybgKBpLwK8pX/ka9Tp6CsUpQiRp1DgPsMM02C/L02M90P?=
	=?us-ascii?Q?Vd1o+R3MvkuNNVDdkM33A6Gi4MhIsSxqHYW2i/nGY7BdNF+UBCSrUgzom8qq?=
	=?us-ascii?Q?YgcYSCZ2C9R+6fHGj/bAsC4VQtPxmNu20Ly1HnqXJliJ38iqhsl/C1ZysujS?=
	=?us-ascii?Q?ef9KffP5leDJThSngXvmbN5LHZL77U/Arovdcx+mr7/7caGyY9VccbUu4jya?=
	=?us-ascii?Q?LQgzIT3q/h6NETNuSXMUZ2gNKHBcvOCOgOqx7yo1vSNTT64SKhTr4xlzM9wk?=
	=?us-ascii?Q?cSQKaRRGYpocrlJMRwrb3aH8sTK5Lhg9wDowxtHFoknbFF3jyuGwHEtpHpsi?=
	=?us-ascii?Q?PfT0BR6aRb6UZHC4bkRiG9qsH3LZ9C47qVRdGQQ3JiSb+VBL6X4sCXv71jk1?=
	=?us-ascii?Q?gZ/q1hnLG5pu2AeiL6fQrSvx5ywDZkrvhRQ/rXsLvCL53HMZGEZAm81v+mN6?=
	=?us-ascii?Q?4ep/BKTDTs+TJAZFnrw2yCKB/DJfVAvwkQVZloiAiqMnpXeadFaOoyM8Ufon?=
	=?us-ascii?Q?+A19EztgfA9USwKTFR9mcC0CuGGGYSE9FtkjHPsuYkVofleg=3D=3D?=
X-Microsoft-Exchange-Diagnostics: 1; DBXPR04MB317;
	6:eGapkJvwBkMmsMkCAChOJ9qrGCR4JXBJZ1Pvk/6t7huD5qUYDb8/aJuDNTFWHXRgq/9kdA9cz7mAgIEkNWjYtyXMizvPbMqKxkpCdWMG2z9FvCC+D6A8ZVEbATOr8V2jm0AVgqmOymS0TNqhrH2NBjQ/ikBCB4/7VGV5uVG1x1QHiZ4UKEKCLRt5kLQyedw/HgeGuFfYntJMwyUaFQx8lOZ1mWRgwYjN29HX7AOZTM0Utpbt26pxZ7eS+1/A7t/gumWO1+B1DSV1V1wLoWbzgneIyY6aVo1xUbqKga0R2F5CH27SMunSvI1aNx8lFWvk1zPwVR4ObybRxOOb+t5VKg==;
	5:S0e4BwoZ5tvwSgQ3TnrCu4kXZf0B+c5iK/HjFLNEuCMTCUrxiJ67BQVNVxDhaGy5OPBQyBwm5x8shdgHtj6N4vW/BOOYmCuXEh8eBTeTSFS2x0GuIIyQpfoQ0HA0R95DiKY3G7zHSLpp8W+wAfcDug==;
	24:Au5bhtzTqUDEf3cKJPcCppmNKQUypQhcP8canDEIL86w+yIZs96xwIb5788q8EeOBv+ZWQNAkOewWqonXlGUdcwAgzhKJ1/GA6DRQSIAaLI=;
	7:8tJsniybc9Wd2rbsZ9IJ+CJe10JPVXdKw3kdP+zX71uvEXRyUHr3rqJLPAKTFH39zkYsplr0CdrXTC1Wv3gj7qRRp9t32zvx+1cinJ4GUTyz9deuQ4udofOgNTmWM+51euYGO6oK9oyBWlNZS+vsQKrEhMd381bhu06GomSYnnXdkC8XFOWcrOaJ1r4K7hNkXFdI58DwUEK2yWnEnVHKCF4+ufkN4OqqseMw9V+w0Px80lpCo2bqVDLB6DEL7zBr
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2016 16:44:18.1089 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBXPR04MB317
Subject: [meta-oe][PATCH 1/2] glmark2: Fix gcc 6 configure error
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
X-List-Received-Date: Mon, 08 Aug 2016 18:16:41 -0000
Content-Type: text/plain

Remove the un-necessary check for sqrt and avoid a gcc 6 configure error.

Upstream-Status: Submitted [Pull request: a39907dd19726b2df3bac29a4bdc59d1bd0922a1]

Signed-off-by: Tom Hochstein <tom.hochstein@nxp.com>
---
 .../glmark2/files/Fix-configure-for-sqrt-check.patch        | 13 +++++++++++++
 meta-oe/recipes-benchmark/glmark2/glmark2_git.bb            |  5 ++---
 2 files changed, 15 insertions(+), 3 deletions(-)
 create mode 100644 meta-oe/recipes-benchmark/glmark2/files/Fix-configure-for-sqrt-check.patch

diff --git a/meta-oe/recipes-benchmark/glmark2/files/Fix-configure-for-sqrt-check.patch b/meta-oe/recipes-benchmark/glmark2/files/Fix-configure-for-sqrt-check.patch
new file mode 100644
index 0000000..fde8238
--- /dev/null
+++ b/meta-oe/recipes-benchmark/glmark2/files/Fix-configure-for-sqrt-check.patch
@@ -0,0 +1,13 @@
+Index: git/wscript
+===================================================================
+--- git.orig/wscript	2016-07-29 13:15:44.954249796 -0500
++++ git/wscript	2016-07-29 15:52:06.196768865 -0500
+@@ -90,7 +90,7 @@
+         ctx.check_cxx(lib = lib, uselib_store = uselib)
+ 
+     # Check required functions
+-    req_funcs = [('memset', 'string.h', []) ,('sqrt', 'math.h', ['m'])]
++    req_funcs = [('memset', 'string.h', [])]
+     for func, header, uselib in req_funcs:
+         ctx.check_cxx(function_name = func, header_name = header,
+                       uselib = uselib, mandatory = True)
diff --git a/meta-oe/recipes-benchmark/glmark2/glmark2_git.bb b/meta-oe/recipes-benchmark/glmark2/glmark2_git.bb
index 9c5ef18..18267e9 100644
--- a/meta-oe/recipes-benchmark/glmark2/glmark2_git.bb
+++ b/meta-oe/recipes-benchmark/glmark2/glmark2_git.bb
@@ -14,7 +14,8 @@ PV = "2014.03+${SRCPV}"
 
 SRC_URI = "git://github.com/glmark2/glmark2.git;protocol=https \
            file://build-Check-packages-to-be-used-by-the-enabled-flavo.patch \
-           file://0001-Fix-wl_surface-should-be-destoryed-after-the-wl_wind.patch"
+           file://0001-Fix-wl_surface-should-be-destoryed-after-the-wl_wind.patch \
+           file://Fix-configure-for-sqrt-check.patch"
 SRCREV = "fa71af2dfab711fac87b9504b6fc9862f44bf72a"
 
 S = "${WORKDIR}/git"
@@ -51,5 +52,3 @@ python __anonymous() {
         d.appendVar("EXTRA_OECONF", " --with-flavors=%s" % ",".join(flavors))
 }
 
-# http://errors.yoctoproject.org/Errors/Details/68626/
-PNBLACKLIST[glmark2] ?= "BROKEN: fails to build with gcc-6"
-- 
1.9.1


