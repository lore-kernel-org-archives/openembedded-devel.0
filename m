Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2D0FC433EF
	for <webhook@archiver.kernel.org>; Mon,  3 Jan 2022 06:58:40 +0000 (UTC)
Received: from mail3.bemta32.messagelabs.com (mail3.bemta32.messagelabs.com
 [195.245.230.81])
 by mx.groups.io with SMTP id smtpd.web12.24545.1641193119347488057
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 02 Jan 2022 22:58:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=kWc3VL67;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.81,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1641193117; i=@fujitsu.com;
	bh=lIfJe/NRNuGP1Afe+te4qznvq9Ugw7g6uz1l5TVrz8Y=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=kWc3VL67XZ9ioNc3g7H8DKoyt9PBdwDBOA5b6EaD9OPw6iaIZ63pC3XJgq7cWK1/9
	 qaAOiMYpSM7zAdRrzG+JLS89bu021PRKHkVvHpzOw6UM5HrWA6BDiXi0BPnaEho+Lc
	 Rdf8pQ0/9lK7mEpwjRhLRB0Y+63rqLtz4Ki7rZxeP0pzZ0M/aloC7ViQ5wbEW0vgFQ
	 0pinfje/YC+LTVGNJFgMIrYSwZsYuwWUqE2Jnv4WC+CHWEjMhnB8ClKd0M3CtWdivB
	 DWm0/tGMCip44glPXTss2CQtLXMmo9N+QueABeqU6zxGpKqnlRwqO/oUAbuaZ39MqB
	 vCaFj221kO3tA==
Received: from [100.115.4.42] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-3.bemta.az-a.eu-west-1.aws.ess.symcld.net id AE/38-13695-C9E92D16;
 Mon, 03 Jan 2022 06:58:36 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrEIsWRWlGSWpSXmKPExsViZ8ORqDtn3qV
  Egz9vtSwuHl7K7MDocW7jCsYAxijWzLyk/IoE1oxJ/coF/3gqOqbvZ2lgvMrdxcjFISTwhFFi
  89ZHbBDOBSaJ/u5GZgjnOKPEpCUdrF2MnBxsAmoS02/dALNFBPQlls7ewwxiMwuoSLz43cMOY
  gsL+El8XDqPEcRmAYovazgPVsMr4CRxZ9cZNhBbQkBBYsrD91BxQYmTM5+wQMyRkDj44gUzRI
  2ixOzLzSwQdoXErFltTBC2msTVc5uYJzDyz0LSPgtJ+wJGplWMVklFmekZJbmJmTm6hgYGuoa
  GprqmukampnqJVbqJeqmluuWpxSW6hnqJ5cV6qcXFesWVuck5KXp5qSWbGIFBmVLM+n8HY3ff
  T71DjJIcTEqivJVKFxOF+JLyUyozEosz4otKc1KLDzHKcHAoSfB+mHUpUUiwKDU9tSItMwcYI
  TBpCQ4eJRHenVOA0rzFBYm5xZnpEKlTjIpS4rxcc4ESAiCJjNI8uDZYVF5ilJUS5mVkYGAQ4i
  lILcrNLEGVf8UozsGoJMyrNBtoCk9mXgnc9FdAi5mAFvNqnQdZXJKIkJJqYDpWG/Us8csaa/+
  CqrczLWfNFHjuKK21/vG096YbiuoCWLuNxVkXrTn8YcYCxqWnxfbc3nzSeM9elWeCTJ945L6Y
  vXGL1Ah54W929/slu+q3zK6vGKZuvHNvhuRHptlrWLy2FJgeNrOuso2tTaspTg9jPN3amPKpT
  ujjxWVxBg2sP3wqjunGORpUfFx8KnzOr4++izP4dsk9vP9b44ZmbKv57FuTXhmtmum3/Eros5
  anzt2Wa8rutuX5rOrJ25X5bJPF0wihuQ0Kv7jnJLQlTs2QrF5rqBomcE1rZf7j2+UOommHJd1
  1z7HtYBY25ri36XU7r2Z7T8DGIqFczq+iNZWdx9ym/N686YFrU4TsQiWW4oxEQy3mouJEAJPO
  O7FFAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-14.tower-585.messagelabs.com!1641193116!256334!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 16306 invoked from network); 3 Jan 2022 06:58:36 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-14.tower-585.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 3 Jan 2022 06:58:36 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 3E5B010018D
	for <openembedded-devel@lists.openembedded.org>;
 Mon,  3 Jan 2022 06:58:36 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 31AA9100181
	for <openembedded-devel@lists.openembedded.org>;
 Mon,  3 Jan 2022 06:58:36 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.26; Mon, 3 Jan 2022 06:58:14 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-pymisp: upgrade 2.4.148 -> 2.4.152
Date: Mon, 3 Jan 2022 14:58:03 +0800
Message-ID: <1641193083-41938-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 03 Jan 2022 06:58:40 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94648

Changelog:
==========
Changes
~~~~~~~
- Bump version.
- Bump deps, object templates.
- Bump objects templates.
- Bump misp-objects.
- Lief doesn't supports python 3.10.
- Debug poetry install, freezes on the GHA.
- Bump deps, use pytest.
- [feed-generator] support for distribution and sharing groups.

Fix
~~~
- Update live tests to support proper format of SGs.
- [sharinggroups] Fixes wrong model for SharingGroupOrg.
- [feed-generator] code style fixes.
- [feed-generator] keeping function compatibility.
- [feed-generator] fix missing except type.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-pymisp_2.4.148.bb => python3-pymisp_2.4.152.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pymisp_2.4.148.bb => python3-pymisp_2.4.152.bb} (92%)

diff --git a/meta-python/recipes-devtools/python/python3-pymisp_2.4.148.bb b/meta-python/recipes-devtools/python/python3-pymisp_2.4.152.bb
similarity index 92%
rename from meta-python/recipes-devtools/python/python3-pymisp_2.4.148.bb
rename to meta-python/recipes-devtools/python/python3-pymisp_2.4.152.bb
index e091e8757..254330bf5 100644
--- a/meta-python/recipes-devtools/python/python3-pymisp_2.4.148.bb
+++ b/meta-python/recipes-devtools/python/python3-pymisp_2.4.152.bb
@@ -4,7 +4,7 @@ LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a3639cf5780f71b125d3e9d1dc127c20"
 
 SRC_URI = "git://github.com/MISP/PyMISP.git;protocol=https;branch=main"
-SRCREV = "6f7157cf26a6b4ec102021c8f1197a40380b12e3"
+SRCREV = "d991e53f9a9641f454e116e83d2913edf405a53f"
 S = "${WORKDIR}/git"
 
 inherit setuptools3
-- 
2.25.1


