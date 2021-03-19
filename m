Received: from mail3.bemta25.messagelabs.com (mail3.bemta25.messagelabs.com [195.245.230.83])
 by mx.groups.io with SMTP id smtpd.web11.457.1616117745621751326
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 18 Mar 2021 18:35:46 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 195.245.230.83, mailfrom: zhengrq.fnst@fujitsu.com)
Return-Path: <zhengrq.fnst@fujitsu.com>
Received: from [100.112.196.73] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-3.bemta.az-b.eu-west-1.aws.symcld.net id 2F/95-42200-0FFF3506; Fri, 19 Mar 2021 01:35:44 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrPIsWRWlGSWpSXmKPExsViZ8MRqvvuf3C
  CwYwjVhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8bs46+ZC16wV3zc1MnWwNjK3sXIxSEksIVJ
  ov3aXCYIZw+jxOHWR2xdjJwcbAIGEvvPXmAHsUUE9CWWzt7DDGILC9hJTNp4kgXEZhFQlTi+8
  RVQMwcHr4C3xPcp0iBhCQEFiSkP34OV8woISpyc+QSsnFlAQuLgixfMIOUSAooSs6fLQ5hVEk
  dmqk1g5JmFpGEWkoYFjEyrGC2SijLTM0pyEzNzdA0NDHQNDY10DS0tdA2NDfQSq3ST9FJLdct
  Ti0t0DfUSy4v1iitzk3NS9PJSSzYxAkMopeBY0w7Gk68/6B1ilORgUhLlPfo7OEGILyk/pTIj
  sTgjvqg0J7X4EKMMB4eSBK/KP6CcYFFqempFWmYOMJxh0hIcPEoivD/+AqV5iwsSc4sz0yFSp
  xjDOd6sXbKImeMtmGy7dxdItoPJmQsOrmbmmAUm77cfApIPQKQQS15+XqqUOG86yDYBkHEZpX
  lwy2DxeolRVkqYl5GBgUGIpyC1KDezBFX+FaM4B6OSMK8jyBSezLwSuJteAZ3LBHRuBH8QyLk
  liQgpqQamtd0LT35RO7jwvtHaI9e3v5Na1HGGPXfjyX3aq5fPL3bvW+ocP3G72lbem+feSSbo
  9SipN6WFTV7CtOfe9R/CPu3cW39kfFuQNruJy746x6dx86VJ5tMDbR7/Wd6wp+thwcnlG5+Fb
  TQvVf2uv6VRhzFg78P7bldimgQKduvWtKQ/S/Rb9auwrWrS65tfX/+vbZl4uPR+n8y//ueXGV
  sVE+40cM/7KL00Q7zmvliDfX1M60oWk55jlfcfbdqSs8un1WPbaV2Xw38z8tM3rVjBVMEZOK+
  lUT6TlSEr6IKVXcy6l5ZH75a6HzycylG6hcm56lj6ksP38hdMaT/n4e0Yw75r5621Fxwmbs+Z
  4Zs7U4mlOCPRUIu5qDgRAJLN9sFSAwAA
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-28.tower-285.messagelabs.com!1616117742!119569!1
X-Originating-IP: [62.60.8.85]
X-SYMC-ESS-Client-Auth: outbound-route-from=fail
X-StarScan-Received: 
X-StarScan-Version: 9.60.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 860 invoked from network); 19 Mar 2021 01:35:42 -0000
Received: from unknown (HELO mailhost4.uk.fujitsu.com) (62.60.8.85)
  by server-28.tower-285.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 19 Mar 2021 01:35:42 -0000
Received: from r01ukexcasm214.r01.fujitsu.local (ex2k13_214.fs.fujitsu.com [10.182.185.116])
	by mailhost4.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 12J1ZgZO023421
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Fri, 19 Mar 2021 01:35:42 GMT
Received: from localhost.localdomain (10.167.225.35) by
 r01ukexcasm214.r01.fujitsu.local (10.182.185.116) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 19 Mar 2021 01:35:40 +0000
From: "zhengruoqin" <zhengrq.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] grpc: upgrade 1.36.2 -> 1.26.3
Date: Fri, 19 Mar 2021 18:35:34 +0800
Message-ID: <1616150134-59388-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 r01ukexcasm214.r01.fujitsu.local (10.182.185.116)
Content-Type: text/plain

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 .../recipes-devtools/grpc/{grpc_1.36.2.bb => grpc_1.36.3.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/grpc/{grpc_1.36.2.bb => grpc_1.36.3.bb} (98%)

diff --git a/meta-oe/recipes-devtools/grpc/grpc_1.36.2.bb b/meta-oe/recipes-devtools/grpc/grpc_1.36.3.bb
similarity index 98%
rename from meta-oe/recipes-devtools/grpc/grpc_1.36.2.bb
rename to meta-oe/recipes-devtools/grpc/grpc_1.36.3.bb
index 17e70aebf..738d5e10b 100644
--- a/meta-oe/recipes-devtools/grpc/grpc_1.36.2.bb
+++ b/meta-oe/recipes-devtools/grpc/grpc_1.36.3.bb
@@ -16,7 +16,7 @@ RDEPENDS_${PN}-compiler = "${PN}"
 RDEPENDS_${PN}-dev += "${PN}-compiler"
 
 S = "${WORKDIR}/git"
-SRCREV_grpc = "c3438a0c5d7bc499eb31fd4853ca72c771f758a5"
+SRCREV_grpc = "ce05bf557ced2d311bad8ee520f9f8088f715bd8"
 BRANCH = "v1.36.x"
 SRC_URI = "git://github.com/grpc/grpc.git;protocol=https;name=grpc;branch=${BRANCH} \
            "
-- 
2.25.1

