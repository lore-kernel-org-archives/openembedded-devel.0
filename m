Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B0B0C77B76
	for <webhook@archiver.kernel.org>; Mon, 24 Apr 2023 03:21:59 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.2])
 by mx.groups.io with SMTP id smtpd.web11.42789.1682306516274477303
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 23 Apr 2023 20:21:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=tkcpRTJz;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.2, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1682306514; i=@fujitsu.com;
	bh=oCHn+XRj1xqQGT4zm779Z9i5uOZFho5ZTeZ6xG5TiAw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=tkcpRTJz4rXfmyEKIU3CQoF9gaSSE5fKJR7kJ1hvjsktsN4z7uexHyjhqpH8rapoz
	 hPDHwK0umjPC/F/5feA4uyN/SDP94+tfO5CHLbTHmcbtJYtstbtZEc+00dMpnxvOEw
	 nzsHZYG2CvkGmjZhSIBZXPmuVV/6TrQQQJp/ACkq0ygm/jtc2EDbl+9Tu+MXwuvyfo
	 ohyP+D+g0NrarsiX7OBQQYrV8w6rvs/JbHUl42vj5y0priaND83v5avhkDipGGj5rB
	 NL4YgMwF1JAsKdy0Qanp2qlgUnBlq8bF48bthnzCfGUU/zPkcw0/3U+KmJpgFsX5f+
	 uI3WBXSqsWe/A==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrCIsWRWlGSWpSXmKPExsViZ8OxWffiV9c
  Ug8079S0uHl7K7MDocW7jCsYAxijWzLyk/IoE1ozT/36yFZznqNh2aDpjA+Mn9i5GLg4hgYeM
  Etd6/zNBOFeZJJZuW8sM4exllPj5rAuojJODTUBK4sb9/2wgtoiAvsTS2XuYQWxmARWJF797g
  Go4OIQFAiR2TAQLswioSvx4fQMszCvgJNGwKgUkLCGgIDHl4XuwEk4BZ4l3K48zgthCQCUvZh
  wGi/MKCEqcnPmEBWK6hMTBFy+YIXoVJWZfbmaBsCslWj/8grLVJK6e28Q8gVFwFpL2WUjaFzA
  yrWI0LU4tKkst0jXVSyrKTM8oyU3MzNFLrNJN1Est1S1PLS7RNdJLLC/WSy0u1iuuzE3OSdHL
  Sy3ZxAgM3JRiRaMdjE92/tU7xCjJwaQkyrtkg0uKEF9SfkplRmJxRnxRaU5q8SFGGQ4OJQneo
  k+uKUKCRanpqRVpmTnAKIJJS3DwKInwLvsClOYtLkjMLc5Mh0idYlSUEucNBEkIgCQySvPg2m
  CRe4lRVkqYl5GBgUGIpyC1KDezBFX+FaM4B6OSMK/kB6ApPJl5JXDTXwEtZgJavIvbBWRxSSJ
  CSqqBqer0zbmVa8y/Way6e5Wj7FdMw96fNyWPH2Yq1v+2Nvz887cht04L+QndEo+dFnp4Qz/r
  4b+84Q/nH9K8XGCRPzln1Y/W1NnlFRyWL/PKxWpm1Sz1STJf3tjt8PXhFPeMBUc1Hs6K7WFyO
  Bhy4+GvhjvJDuwNmnMmK4WkaIdW/w8omptktfetr9kK9mu1jYejOs8/OvuXUW9G5ATj0q8/b0
  bVTmGIZzz+s8Y4wjCG5+3XokbPq0uEudVSH0kLd4osW3586Y/5yguPVYsvd/PJE2CXeaz/58J
  bvp+H1VUEX6yVPef+wSnL7+ufq0+8X4R/sX9ypmC2uwKDUdu97cxXWO6tOD7DZDU7z4XVFu8L
  8pVYijMSDbWYi4oTAeevkMdXAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-7.tower-548.messagelabs.com!1682306513!139741!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.105.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 26784 invoked from network); 24 Apr 2023 03:21:53 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-7.tower-548.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 24 Apr 2023 03:21:53 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id 789C8155
	for <openembedded-devel@lists.openembedded.org>; Mon, 24 Apr 2023 04:21:53 +0100 (BST)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id 6A251142
	for <openembedded-devel@lists.openembedded.org>; Mon, 24 Apr 2023 04:21:53 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 24 Apr 2023 04:21:52 +0100
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] opencl-headers: upgrade 2023.02.06 -> 2023.04.17
Date: Mon, 24 Apr 2023 11:21:26 +0800
Message-ID: <1682306487-11783-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1682306487-11783-1-git-send-email-wangmy@fujitsu.com>
References: <1682306487-11783-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 24 Apr 2023 03:21:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102157

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../opencl/{opencl-headers_git.bb => opencl-headers_04.17.bb}  | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-oe/recipes-core/opencl/{opencl-headers_git.bb => opencl-headers_04.17.bb} (88%)

diff --git a/meta-oe/recipes-core/opencl/opencl-headers_git.bb b/meta-oe/recipes-core/opencl/opencl-headers_04.17.bb
similarity index 88%
rename from meta-oe/recipes-core/opencl/opencl-headers_git.bb
rename to meta-oe/recipes-core/opencl/opencl-headers_04.17.bb
index 83ea6528c..6ffaf68ea 100644
--- a/meta-oe/recipes-core/opencl/opencl-headers_git.bb
+++ b/meta-oe/recipes-core/opencl/opencl-headers_04.17.bb
@@ -5,8 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 SECTION = "base"
 
 S = "${WORKDIR}/git"
-PV = "2023.02.06"
-SRCREV = "4c82e9cfaaad18c340f48af3cf5d09ff33e8c1b7"
+SRCREV = "4fdcfb0ae675f2f63a9add9552e0af62c2b4ed30"
 SRC_URI = "git://github.com/KhronosGroup/OpenCL-Headers.git;branch=main;protocol=https"
 
 do_configure[noexec] = "1"
-- 
2.34.1


