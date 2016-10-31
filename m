Return-Path: <ting.liu@nxp.com>
X-Greylist: delayed 4651 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 31 Oct 2016 05:46:02 UTC
Received: from NAM01-BY2-obe.outbound.protection.outlook.com
	(mail-by2nam01on0084.outbound.protection.outlook.com [104.47.34.84])
	by mail.openembedded.org (Postfix) with ESMTP id 80E5C71A49
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 31 Oct 2016 05:46:02 +0000 (UTC)
Received: from BN3PR0301CA0036.namprd03.prod.outlook.com (10.160.180.174) by
	BLUPR0301MB1618.namprd03.prod.outlook.com (10.162.214.28) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
	15.1.693.12; Mon, 31 Oct 2016 04:12:59 +0000
Received: from BY2FFO11FD053.protection.gbl (2a01:111:f400:7c0c::108) by
	BN3PR0301CA0036.outlook.office365.com (2a01:111:e400:4000::46) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.693.12 via
	Frontend Transport; Mon, 31 Oct 2016 04:12:59 +0000
Authentication-Results: spf=fail (sender IP is 192.88.168.50)
	smtp.mailfrom=nxp.com; ossystems.com.br; dkim=none (message not signed)
	header.d=none; ossystems.com.br;
	dmarc=fail action=none header.from=nxp.com; 
Received-SPF: Fail (protection.outlook.com: domain of nxp.com does not
	designate 192.88.168.50 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=192.88.168.50; helo=tx30smr01.am.freescale.net;
Received: from tx30smr01.am.freescale.net (192.88.168.50) by
	BY2FFO11FD053.mail.protection.outlook.com (10.1.15.190) with Microsoft
	SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.693.6
	via Frontend Transport; Mon, 31 Oct 2016 04:12:59 +0000
Received: from sun.ap.freescale.net (sun.ap.freescale.net [10.192.208.75])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	u9V4CulD025434; Sun, 30 Oct 2016 21:12:56 -0700
From: <ting.liu@nxp.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 31 Oct 2016 12:12:53 +0800
Message-ID: <1477887173-20915-1-git-send-email-ting.liu@nxp.com>
X-Mailer: git-send-email 1.9.0
X-EOPAttributedMessage: 0
X-Matching-Connectors: 131223607793961659;
	(91ab9b29-cfa4-454e-5278-08d120cd25b8); ()
X-Forefront-Antispam-Report: CIP:192.88.168.50; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(7916002)(2980300002)(1110001)(1109001)(339900001)(189002)(199003)(87936001)(11100500001)(7846002)(8666005)(85426001)(6666003)(47776003)(305945005)(356003)(5660300001)(86152002)(48376002)(6916009)(97736004)(575784001)(86362001)(110136003)(19580395003)(19580405001)(68736007)(229853001)(586003)(50466002)(4326007)(33646002)(626004)(189998001)(92566002)(50986999)(106466001)(105606002)(77096005)(104016004)(230783001)(5003940100001)(2876002)(50226002)(2906002)(8676002)(81166006)(81156014)(8936002)(36756003)(2351001)(7059030)(19627235001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BLUPR0301MB1618;
	H:tx30smr01.am.freescale.net; FPR:; SPF:Fail;
	PTR:InfoDomainNonexistent; MX:1; A:1; LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; BY2FFO11FD053;
	1:WFaAz9GbOoQZynN1EFOE074fyMTAZ7dnckwaJXLa5lzs91PvFcdTT0sevGnGkH2f9LJ6AP0ToLwQSbBR0UFCPUJ/xuvkYiGj6v9bJXE1lNlz0rECmEkpJgCD/fZO16j8ODDfa3h1xiUJMyne6jWEXj++YBNJJie9lWFLrGvoxOngE8M1A5NBp4mgG04ttnDrS1DMBldvr6+jpJ0XnaeTiQSGa7j15+E8fIgtSr77noCxhvlYo0BQ4yVvCZ447wka/DxTQtOYnDgDY1fGQxqMvBdjTVchaqeR0hrs+2OLkAvswXeTeW2+leSJBU+KnHREmB6cTZ+zNVJcpXcvSUIAOyJ/VHVx36GeBH17k4r4G5JP2hL79JE1dMdDfRtqUh96uhd0D9340AFuQuS+vucYugWHeVD64P9hEMhmLrZtccYG2LituLNpWan9X3eOrm09wBHLciAYWCaYouecM95rKONltRc4URJd5zVlv+CvH+EvatFDQX7Kc5/3tMmUeO+EgcCeuwXjfFOt4sAdlOIa0ctfbEo/+LqUTSf8qrbZawDsYDZVZXJEyiayHVjmdZ6BAlUkVTUodiABzCUzHdBoHE2IC3jjF5cZEaFBJvmRZkpdJk29//1AOBr3tv1G1Mm+
MIME-Version: 1.0
X-MS-Office365-Filtering-Correlation-Id: afd90093-06df-4c0e-4abb-08d40144332b
X-Microsoft-Exchange-Diagnostics: 1; BLUPR0301MB1618;
	2:eYmsBISjPe1agC5RZ4xkC15YiC/TqWXXFoh+FQMGJgRbdJhf9h3U+Mbwx1uyhr/dLaAebgtBw3Ltb7VPj/FTND0HbM58hiJum38ay6yxAlKf3Klvh6GYfYv1qj8vaKN3Fgc0j9HUSoYfpRfjGbETm7pBxVdrc8iPpQqo9qOBSgV8do4Oo9ZtVToq2hMT+cXln7Qm42PG5PRwenY71xuwVw==;
	3:y3WegeDVQk911xnvEpZdlaTDCm8En5lnuiC6nsbcDlZYBHqYRMmBmIGXaL2qXmLyCm/FKoHC5KpYu7UDXVH4VrYj57t9tzXWTh0TVwD34Br+yHwrb7ASxCC9tYhJBQLJRdNaXDp+lqHSmGTbPiPBgevJkdR3cB/36gQ/0FQ0soGwhG7w1RJcSEvqN0dFyjYZmRZJOQbo+amppozVPW1NKNmo/+5Ec0LUTgqcXJs1zzHd/Um4uE0v9UZ25NoEKpp9
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:BLUPR0301MB1618;
X-Microsoft-Exchange-Diagnostics: 1; BLUPR0301MB1618;
	25:yO14HkQMEYy1QA2W7iHaq0XsaoZ3A2wBb9+Q/bIySGrJwehFAp0bjgmkwUD9GCh63JLEWxklBcZTf5ICucMpDl6kjRvvEQ/ZD+NRZItSIwkmhKey69Bh/XlJEvk3qPWVKw+8A9D+2uca0qaT20IWJ+DQaftlTiExlN+CsS+L59xzpLFRx3Fc2RvxPv7HA8D+zKKwaQSw3QYcjo1kuC2sk3prpJ0enfvj5JOEhhOyGPs4UYki+WAQS3Up+dEt8oyAnoA8bqYktZ4tS8HS2M4PWSAXl+AhFHF6v+k0zEotHdsvptA9Jfd1dgDDWpDKm5GJEOZshUajvTcRjRDPcznsxm3uGal+KMRk3kNV1zRPZkkPUKWecBAT2bIr3qxSuNkttn7xq+R9/fRRrvxxUqfAo6RNXYEWzFK3nSWh1gf6SMuk1pJep5glCXTK+oXx+3U+xb7Arr8GRMFTKyGemqDX5A==;
	31:TtPY9kxLMmn2CIP4z1Et2nBeR5mbEFrGj4EFxTIFWmvai+RUNlP5SaFiPBi7h/RJ+X0sEHgtKzZVl3S1aCJF72bm2AXKqLgCP4dsuF8hm8dDB0gOoe+1IZbkCsZLNTn/Tq6YWvfasSkG5RNRzlU31oZhnVEj+ViyAzqT2XZGkIZ/0istk89XxkzQ1W7XXuVg9TobTLXTfDy+uC0JMjFeRIIj6e/WY7uAzrxae8kB3LflEXV82QEopaMckpcxiqchE91dInwoIFmimA0CsOmvyvtaIlyWkdrqSkORlXq7a1k=
X-Microsoft-Antispam-PRVS: <BLUPR0301MB16184B941279E88277CD770D99AE0@BLUPR0301MB1618.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(185117386973197);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040176)(601004)(2401047)(5005006)(8121501046)(13023025)(13018025)(13024025)(13015025)(13017025)(10201501046)(3002001)(6055026);
	SRVR:BLUPR0301MB1618; BCL:0; PCL:0; RULEID:(400006);
	SRVR:BLUPR0301MB1618; 
X-Microsoft-Exchange-Diagnostics: 1; BLUPR0301MB1618;
	4:56uu62bzEDnIKoNuYAvqE/i6ONat+IcV1VUyciV/ifadfnJMVO6r8Ns7f6cFVFLXboVdqK6wInVw9PVPREqo5jtY1jfW1mpeTj/uyCB/prvlZ/jl8ZKpmwR3j80R6V30bY4CHJxRLCOiO4EBwyInvs2PDsV1sd+HG5u8rUT58rDeo6FR3mIBobAYdvbUo1sDtwnD/A4Laud4VbquebRy9geH0GKvpgMcqlmzcOeKO2rTSugcDWf5/iJZuon4tU6db/d5jVQJjoqigNBpZ38cr0uzUBuWw0qSbhpvyZ4yL6mLnwirgxru8CAj1rVmvvZELdCaztzyhuPOX5JjrJyorM092z61DcfbKVODkIn5NOcB1iH6Qwz4nFCiLutM3HEd0m2bvh9IKa8HBR5spAFOY7/+MhMRUS4Fgt7Ux5/cC6Dgsy8s0zBSHALOsXISFbWIYwnDlLbphCIVvNQ9nlkNQxxsVfQai1+rzhegLwkslSqwzD1MLOnIUg+lGEI6osCiKGf3s2BcjlVv9nmXlP2ztNJ9tqazCEIBAiz1wBKldnaNOJSyFNY2jYO0MfVHSzjR
X-Forefront-PRVS: 01128BA907
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BLUPR0301MB1618;
	23:+0+WrmhFPpOpVXIpouIL0HEChGCLD4Mzw7KmR4b?=
	=?us-ascii?Q?XHQ88ii+IQYsW+mzCGlIMOlZMzjAgC31NyXOIJ30otGW5rSSGDUY7NGXEVVN?=
	=?us-ascii?Q?tf71JpNnPb3fU6/6oujN5mQFFtZ4KmFTjuxVFrJIWfJ3LYamsVUT5I//UZLE?=
	=?us-ascii?Q?7xE7PexvWvglhaaZW75HfnviJIaEThEwBUPodyEhYBqcCQ9xtApmdke7fh/F?=
	=?us-ascii?Q?mmR0teo6wzCWLnTU1pBM4L84P+0RhdwjAtHKq5S6QCGk8H/IEiYmc1V8w6xo?=
	=?us-ascii?Q?OmYWL1NcmhQBW5jQW8sbDkpNFN9LNHKvsHEHDtlJA2CgFmafvXLz1UkQflIJ?=
	=?us-ascii?Q?cEVCGo8GTvU8/nvLpl4bvtx66vq7WnLA3yqjY24DGx0RYQiKaiT5rgxdq1P4?=
	=?us-ascii?Q?fvs6G64PZ9jSLo97/E8pNiRv2WWGnviscn/QZZ78No27amMha/HiDS99TuZ9?=
	=?us-ascii?Q?VZT9jwLmKDUWwc4G5p5IKJ33IbAjQjby93QipiRC1UuLJXQlKg3MUOc5kYY/?=
	=?us-ascii?Q?tqCBZ8WzKIlEY5KxzBU3tZhmcDiPUp5f/Ud+5pho2UxJJph23RNNQ1Ew+Wdh?=
	=?us-ascii?Q?EhQ5vbE2xai3889vOs6A6b3gdT89n39BOfAXOLAqDnuQOa8VnYvqGq3nmZV5?=
	=?us-ascii?Q?9oliVEs8ogaaxfJBXA/3opZvpID49Wn0YC+m3751OlgS6qX3S1HlXvmOwwot?=
	=?us-ascii?Q?fO1RbW/680fWFcIS+FqYWIgq2iiEt+wiSDKDa7aadMUB+MPcaZqysiZJFBiT?=
	=?us-ascii?Q?I/ma5OOfeQjPCoEiSiP3Mo9emoLCnwSgJzjSHUR1P4l42tJOjaJj5Tk+u3qj?=
	=?us-ascii?Q?4apMMjddYKDlawOoF4bib2jHYvWsQ1dZ/djxhhH852ChAjifABRcBXWVFx0k?=
	=?us-ascii?Q?ysyrBYdU+2TGkuJAal4ir6MRCjP4JIUI9jSmwaPZbSbg8v80ABBq8G9SWeIV?=
	=?us-ascii?Q?QFxSUHRWWdJwHWQlYQG0YZHmvtCybo88+sepftNs/jC53a4UogMG0p81D136?=
	=?us-ascii?Q?9DpZhDFBRIm8AZd3JBOMjW9jsGGESdHw5OXLjXreMXjhC/O2/pxhDA7JwhPJ?=
	=?us-ascii?Q?eGI1ys3eqkZQ2Wm5YkMrYbN3EJdgXlrqElfwyKsjou+mPfQaal5Z9r1FPiRQ?=
	=?us-ascii?Q?IX+fJSIhaZ6QarpEyWdV3Dd9wrBcwPnCn8dib+igraEKVA5Ib27FuJqEk0yP?=
	=?us-ascii?Q?wSIrEjJLaq2CghRVL2GANENkEoD3MRZKSj4VREdL8csoqsarUGL7pYwfHJZS?=
	=?us-ascii?Q?YTrV5v7Ie2w0uw3pbZQ1y+kg2J7b6fLgHUD3vowx8?=
X-Microsoft-Exchange-Diagnostics: 1; BLUPR0301MB1618;
	6:gqOfL0qwwEkhoeIuj8H6IjYQqzZTLdfbMErD5bKMy8Wow6Mw4hyUEKzXcW4YxQudATmI3YLZSw1QBgV0Chp4ug5b84xIyALNO8ic5ieSXkUMa4VYFVizyNcy8a3+6Jm3PJPmkxsBNggJLzxY0g7bIA7Y9Khz0+QLo0ahpFLiHlCL/A6LAZ2GaSSqKWeL5XOiPmqI6950nJ+xGSIUV8Nj2bntTTevA1AU/rKeB5Q2rGAPy5W9WFxyz+3pXjcdQUpS8HY1otn+6NNKFaEJGa7m/4CghPDGJQ/A6fYB4oZ2ZpHUS64d64e/P2ADNnkQQs+n;
	5:stoZL7IKcoN5+MSvCh6cGvRA3+KNit6+4w/qiBwZ9EXjOklFzYQY46DoAZvSPlbn1cXiWbQ0RjS10sPBbRj63hmh33oBVhE4GOanWjTE2cEdadiKSiYVRYyDWEkwCydKINqsHVqodRCtOLEKy8D0MXo1HhUd+2WTKK10MKr50sxfAZSopEwVan2io0bCmu4+;
	24:GWH9Areg6x01tXafbPf4WWsPnEYWu5jQX+sBeaNBvNoKErK7W6Xsap1hjrMjbEqLkefcF4ynDXym+QuSBrjPP3TOQ6U2D7BKO7Jkn2JlnsE=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; BLUPR0301MB1618;
	7:lqtHEeL2R/tGRLUGPUAexu+h55aklBYKZ6DfQJ5u5/gYhY5C+Kf5f/RgWVJzZm1VZSWGG5iq95ZXHYiAqMjEFzCdDn4F4xddet7bobJK9nBrr6boJBmKgXDhsL1Yf1Q/pf59O3U1hCQPkHcO6Yye0iNaoKoRWwKQA3LJiyVn9NDP/BL8J3K9EBAdEhiHXJCo/pqetG+b7L+tt2O0qeu5ZDxIkp4z4m8kwIzKCLeEoaaLIhDiAYW6QiwGNUTWdUn5lMQG/DRpqSnVjvF7atc/8RMT64SyS9TBBMxBkg+xusOrQp91HcPBDPbIn8QF5E74e2sAF3V6sfE1GwjXO5is/9yrsB4PPtOdTWda29KQCBY=
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2016 04:12:59.2089 (UTC)
X-MS-Exchange-CrossTenant-Id: 5afe0b00-7697-4969-b663-5eab37d5f47e
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=5afe0b00-7697-4969-b663-5eab37d5f47e;
	Ip=[192.88.168.50]; Helo=[tx30smr01.am.freescale.net]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLUPR0301MB1618
Cc: otavio.salvador@ossystems.com.br
Subject: [meta-oe][PATCH] xterm: package /usr/lib/X11 to avoid installed-vs-shipped error on ppc64
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
X-List-Received-Date: Mon, 31 Oct 2016 05:46:05 -0000
Content-Type: text/plain

From: Ting Liu <ting.liu@nxp.com>

commit 'ad5d2ff6c782a3319aedc25cc641574e39328460 xterm: 308 -> 320' changed
FILES_${PN} from "/usr/lib/X11" to "${libdir}/X11". This leads to QA issue
on ppc64 which defines libdir as /usr/lib64:
ERROR: QA Issue: xterm: Files/directories were installed but not shipped in any package:
  /usr/lib
  /usr/lib/X11
  /usr/lib/X11/app-defaults
  /usr/lib/X11/app-defaults/UXTerm
  /usr/lib/X11/app-defaults/KOI8RXTerm-color
  /usr/lib/X11/app-defaults/XTerm-color
  /usr/lib/X11/app-defaults/UXTerm-color
  /usr/lib/X11/app-defaults/KOI8RXTerm
  /usr/lib/X11/app-defaults/XTerm

Restore the setting of FILES_${PN} to package the installed ASCII text files.

Signed-off-by: Ting Liu <ting.liu@nxp.com>
---
 meta-oe/recipes-graphics/xorg-app/xterm_325.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/xorg-app/xterm_325.bb b/meta-oe/recipes-graphics/xorg-app/xterm_325.bb
index e0baf3c..a627af0 100644
--- a/meta-oe/recipes-graphics/xorg-app/xterm_325.bb
+++ b/meta-oe/recipes-graphics/xorg-app/xterm_325.bb
@@ -27,4 +27,4 @@ do_configure() {
     oe_runconf
 }
 
-FILES_${PN} += "${libdir}/X11"
+FILES_${PN} += "/usr/lib/X11"
-- 
2.7.4


