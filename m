Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE258C678DB
	for <webhook@archiver.kernel.org>; Sat,  4 Mar 2023 11:12:04 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com [195.245.230.66])
 by mx.groups.io with SMTP id smtpd.web10.7031.1677928315349781085
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 04 Mar 2023 03:11:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=wP06mNCi;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.66, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1677928313; i=@fujitsu.com;
	bh=6y0glOA1tx9OxjPXEsAEwB9JddUiWNGbDptrvRXrU98=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=wP06mNCicfIHEHgLctKIWDNU2sBQskbJGQLG1gJ8u9gXVFjUhBvEr+Rj5CrvByQ6r
	 R1zhLH2hTSa9j3YKe36xjeab+GsYtKjEYG+sgwKfF4JfC1IRBuVC3Ef6eEW5C+aIhk
	 TecQNU3RMVJNhuhKk+qDlyY2QzUSL+10wA0g+U0NlWpx05AVWyJ1Apj4DHtAzdfjB1
	 J/v6/SZJvJy1UiWKk/8/j/dbSWMETOOsR0xDSXQk38onUxwEkC+6YHva6A5X2VcqPn
	 JVNRMb5H8wt9kGz8/y/w0Zdf75H8fxF/PxkMvKTsUJ+VMQzL1PgBqefxO5cFKnalPk
	 uAIk2L4o8q3wA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrCIsWRWlGSWpSXmKPExsViZ8ORqFuuzpx
  isHW3mcXFw0uZHRg9zm1cwRjAGMWamZeUX5HAmtH1dx17wWruil39T9gaGDdxdTFycQgJPGGU
  +PBvJxOEc4NJYv6UYyxdjJxAzh5GiVVTmEFsNgEpiRv3/7OB2CIC+hJLZ+8BizMLqEi8+N3DD
  mILC3hLPPv2kLWLkYODBSi++3c4SJhXwEmio/E72EgJAQWJKQ/fg7VyCjhLXJpziBViFVDNlQ
  5WiHpBiZMzn7BAjJeQOPjiBTNEr6LE7MvNUHMqJVo//IKy1SSuntvEPIFRcBaS9llI2hcwMq1
  iNC1OLSpLLdI110sqykzPKMlNzMzRS6zSTdRLLdUtTy0u0TXUSywv1kstLtYrrsxNzknRy0st
  2cQIDNyUYqZ3OxiX9/3VO8QoycGkJMo7iZUhRYgvKT+lMiOxOCO+qDQntfgQowwHh5IEr4wqc
  4qQYFFqempFWmYOMIpg0hIcPEoivFtEgNK8xQWJucWZ6RCpU4yKUuK8AspACQGQREZpHlwbLH
  IvMcpKCfMyMjAwCPEUpBblZpagyr9iFOdgVBLm3aICNIUnM68EbvoroMVMQIs1TjOALC5JREh
  JNTCtluI/nfboDcul63rvvqbPs+ned7hghuy0ExMPfGS/E1IqaTv1Y6L0uc64ywxfuy20TuxX
  X2jsKeXsWssiwq3gmDN9xfv47oiijefKJSuE456Ky1+YPm+BbcHjOMML3iGZxYEr3y0Sftb8q
  Es5Y31RY6nHjrjaIwn9Vxbc9XC/p7Yuo+yBv+mHLYvfmak1fJ/R1nXyjZSQiJFHWHk8Y46N0P
  Mmn6CkF+dj5toJHFLV/9p1ahnnRIFvXpNmPUq6L8vr0nfOuej1ySUWPM8qM5ozMi/Okjn5qyB
  pH4dj2EzN863dvt1NrmfEHme8n3YjqjuozenQ6ZkL51VvsP9wijlxJd/Llge1koyfTjlunqTE
  UpyRaKjFXFScCADiMjJtVwMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-18.tower-587.messagelabs.com!1677928311!150164!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.103.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 2962 invoked from network); 4 Mar 2023 11:11:51 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-18.tower-587.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 4 Mar 2023 11:11:51 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 7683910019F
	for <openembedded-devel@lists.openembedded.org>; Sat,  4 Mar 2023 11:11:51 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 5CD3B100043
	for <openembedded-devel@lists.openembedded.org>; Sat,  4 Mar 2023 11:11:51 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Sat, 4 Mar 2023 11:11:50 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-wrapt: upgrade 1.14.1 -> 1.15.0
Date: Sat, 4 Mar 2023 19:11:34 +0800
Message-ID: <1677928294-23089-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1677928294-23089-1-git-send-email-wangmy@fujitsu.com>
References: <1677928294-23089-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 04 Mar 2023 11:12:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101378

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
https://wrapt.readthedocs.io/en/latest/changes.html

License-Update: Copyright year updated to 2023.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-wrapt_1.14.1.bb => python3-wrapt_1.15.0.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-wrapt_1.14.1.bb => python3-wrapt_1.15.0.bb} (66%)

diff --git a/meta-python/recipes-devtools/python/python3-wrapt_1.14.1.bb b/meta-python/recipes-devtools/python/python3-wrapt_1.15.0.bb
similarity index 66%
rename from meta-python/recipes-devtools/python/python3-wrapt_1.14.1.bb
rename to meta-python/recipes-devtools/python/python3-wrapt_1.15.0.bb
index 54bf1ee99..e35e1f7a7 100644
--- a/meta-python/recipes-devtools/python/python3-wrapt_1.14.1.bb
+++ b/meta-python/recipes-devtools/python/python3-wrapt_1.15.0.bb
@@ -2,9 +2,9 @@ SUMMARY = "A Python module for decorators, wrappers and monkey patching."
 HOMEPAGE = "http://wrapt.readthedocs.org/"
 LICENSE = "BSD-2-Clause"
 SECTION = "devel/python"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=7a4e084dbc322d180bc74f26cdf8236e"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=dc34cbad60bc961452eb7ade801d25f7"
 
-SRC_URI[sha256sum] = "380a85cf89e0e69b7cfbe2ea9f765f004ff419f34194018a6827ac0e3edfed4d"
+SRC_URI[sha256sum] = "d06730c6aed78cee4126234cf2d071e01b44b915e725a6cb439a879ec9754a3a"
 
 inherit pypi setuptools3 
 
-- 
2.34.1


