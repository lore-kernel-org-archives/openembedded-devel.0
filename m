Return-Path: <xuhuan.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 502E5C43217
	for <webhook@archiver.kernel.org>; Wed,  2 Mar 2022 09:52:42 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.3])
 by mx.groups.io with SMTP id smtpd.web09.5714.1646214759496814162
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 02 Mar 2022 01:52:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=WiBweGtZ;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.3,
 mailfrom: xuhuan.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1646214757; i=@fujitsu.com;
	bh=RmF+VmNL2+yH5Ns06a9OEB50I43hZvsVy764RZcI0SE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=WiBweGtZbI7pS7/R4atsPt8YBfEIo0eB2wrWeXT49ETMYG/oUrFlYrYrHa925Y9lL
	 3G69lednWf/I/TluihmpDAeTAkY4KRfbPvS9For4lAG6HO4lB8ak/4SB4LKAMuAJXS
	 FKunYilPEj+xhYH1JD8lmp/z8JgYM77a/q1Fpyv1TLThpeItxUrKYN04VqwGgN8ooe
	 vKKWazYR6ehexSIXPKJDchFlY9CWi66VEdCOffLeC5lzdnwhT7lcsr6KXsthzRjwyy
	 gYkyDukzlcXOmSCA/SmIAMQpvXKpKFsxo0TsAZOilMwAMvxQ9mVmub7Za+6Mdx5irC
	 LY+frWEfAepPA==
Received: from [100.115.35.140] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-3.bemta.az-a.eu-west-2.aws.ess.symcld.net id AD/73-02429-56E3F126;
 Wed, 02 Mar 2022 09:52:37 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrDIsWRWlGSWpSXmKPExsViZ8MxSTfVTj7
  JoOu+pMXFw0uZHRg9zm1cwRjAGMWamZeUX5HAmvFnwQe2giXcFVeuPmRpYFzF1cXIxSEk8IRR
  omPvfRYI5wKTxMR3b5ggnBOMEg+u9jF3MXJysAmoSzy++ZoRxBYR0JdYOnsPWJxZQFWi++Iad
  hBbWCBU4veXH2wgNouAikTT4vNgcV4BV4kjZxeygtgSAgoSUx6+B+vlFHCTOLJ2OliNEFBN6/
  XlUPWCEidnPmGBmC8hcfDFC2aIXiWJEys+MkHYFRKvD1+CiqtJXD23iXkCo+AsJO2zkLQvYGR
  axWidVJSZnlGSm5iZo2toYKBraGiqa2yha2hkrpdYpZuol1qqW55aXKJrpJdYXqyXWlysV1yZ
  m5yTopeXWrKJERjIKcVq9TsYX6z8qXeIUZKDSUmUd7mYfJIQX1J+SmVGYnFGfFFpTmrxIUYZD
  g4lCV4Na6CcYFFqempFWmYOMKpg0hIcPEoivKtsgdK8xQWJucWZ6RCpU4yKUuK8S22AEgIgiY
  zSPLg2WCRfYpSVEuZlZGBgEOIpSC3KzSxBlX/FKM7BqCTM2wwyniczrwRu+iugxUxAi7d6yIE
  sLklESEk1MJk5SXI45kuezDr5xkq3wzPpbHRMpZHXpju5E3o3vnHZeYb3yq0Tl+xEdz1KdbGr
  kOfasWpiyuGU1XrJOy4d4znHMH/h8sXBqtFXOsKzrl1XiWm/H/O68+3+vglb3hldPRXOczSxr
  N94Fa+a/jW+wJ6nBy6/4/5h1h/049hC5/K0vXrl3NX/C2aw1E7/an9yReznyqmvC2+VeYYbu9
  w56PCJbWp374LXBYGbF/jc99pvUPJx49bO8vktX9adurPE5G2Q+LGJfE+dRCV7J8om8ayRn11
  +88JCq8uBu4t3Rt4rOZt9d7GD5sXb2zWUz3IzTV5+N3HZuzbvP68YH+y+taXzX8mdzkgL+erm
  0Nb9SVeVWIozEg21mIuKEwHnKaPIXwMAAA==
X-Env-Sender: xuhuan.fnst@fujitsu.com
X-Msg-Ref: server-20.tower-565.messagelabs.com!1646214757!3597!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.8; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 12399 invoked from network); 2 Mar 2022 09:52:37 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-20.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 2 Mar 2022 09:52:37 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 0747610044D
	for <openembedded-devel@lists.openembedded.org>;
 Wed,  2 Mar 2022 09:52:37 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id EC060100455
	for <openembedded-devel@lists.openembedded.org>;
 Wed,  2 Mar 2022 09:52:36 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.131) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.28; Wed, 2 Mar 2022 09:52:27 +0000
From: XU Huan <xuhuan.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Xu Huan <xuhuan.fnst@fujitsu.com>
Subject: [PATCH 3/3] [oe] [meta-python] [PATCH] python3-twine: upgrade 3.7.1
 -> 3.8.0
Date: Wed, 2 Mar 2022 17:52:52 +0800
Message-ID: <1646214772-692-3-git-send-email-xuhuan.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1646214772-692-1-git-send-email-xuhuan.fnst@fujitsu.com>
References: <1646214772-692-1-git-send-email-xuhuan.fnst@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.131]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 02 Mar 2022 09:52:42 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95685

From: Xu Huan <xuhuan.fnst@fujitsu.com>

changelog:
===============================================================================

Add --verbose logging for querying keyring credentials.
Log all upload responses with --verbose.
Show more helpful error message for invalid metadata.

-Bugfixes
Require a recent version of urllib3.

Signed-off-by: Xu Huan <xuhuan.fnst@fujitsu.com>
---
 .../python/{python3-twine_3.7.1.bb => python3-twine_3.8.0.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-twine_3.7.1.bb => python3-twine_3.8.0.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-twine_3.7.1.bb b/meta-python/recipes-devtools/python/python3-twine_3.8.0.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-twine_3.7.1.bb
rename to meta-python/recipes-devtools/python/python3-twine_3.8.0.bb
index bcc881e44..d9aa3dce9 100644
--- a/meta-python/recipes-devtools/python/python3-twine_3.7.1.bb
+++ b/meta-python/recipes-devtools/python/python3-twine_3.8.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://twine.readthedocs.io/"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a3d1106b253a8d50dd82a4202a045b4c"
 
-SRC_URI[sha256sum] = "28460a3db6b4532bde6a5db6755cf2dce6c5020bada8a641bb2c5c7a9b1f35b8"
+SRC_URI[sha256sum] = "8efa52658e0ae770686a13b675569328f1fba9837e5de1867bfe5f46a9aefe19"
 
 inherit pypi setuptools3
 
-- 
2.25.1


