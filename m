Return-Path: <zhengrq.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC813C433EF
	for <webhook@archiver.kernel.org>; Mon, 27 Sep 2021 09:19:34 +0000 (UTC)
Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com
 [195.245.230.5])
 by mx.groups.io with SMTP id smtpd.web12.28824.1632734374134048789
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Sep 2021 02:19:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=oVb/+uva;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.5,
 mailfrom: zhengrq.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1632734371; i=@fujitsu.com;
	bh=QMjSYI/WfPS4vy4CQf1fqwiiSs6fA506uPDxoSLHIYI=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=oVb/+uvazSPAh0YYkGU9d+qOILD5pB5fBUAlyPCzcE5lc0x0uoWhgOV0EQOnQfIwc
	 4LmN4+FUIv4GNwGZnnkxVwpRrXIQgwQo9RGLjDExwQnOiYsu9kdaJlb5tncb97EzZo
	 TZxKwe8FgzDVqhyqijk6M9q1tD1q95xrkbw3i0jjEVP2ESdeEg8AiKAPD50D77J9A7
	 x6oTMSAIOEKMBx5WvQdgdsQyTdOYQqPxTFsddLRUjGLAaaiQdtT5CZvt8/TnUWrcTu
	 yKe66slSbZRK+BIyC4Ul5MMbcu3+eht777qoPso3XY61WoeA4z0jWkmrdbpT0gXt+W
	 0VChFVW5fH0Tw==
Received: from [100.112.192.69] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-5.bemta.az-a.eu-west-1.aws.symcld.net id C9/9A-01625-3AC81516;
 Mon, 27 Sep 2021 09:19:31 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupkkeJIrShJLcpLzFFi42Kxs+EI0V3cE5h
  o8PWDosXFw0uZHRg9zm1cwRjAGMWamZeUX5HAmjFv722Wgnahio0r5rI2MC4S6GLk4hASmM0k
  ca5vOnMXIyeQs4dRYtYnRhCbTUBX4tzjtewgtoiAvsTS2XvAaoQF/CSWbl7OBmKzCKhKnG1+C
  xbnFfCQmHJtAhOILSGgIDHl4XuouKDEyZlPWEBsZgEJiYMvXgDFOYBqFCVmT5eHKK+QeH34Ev
  MERp5ZSDpmIelYwMi0itE8qSgzPaMkNzEzR9fQwEDX0NBI19DSVNfETC+xSjdRL7VUtzy1uET
  XUC+xvFivuDI3OSdFLy+1ZBMjMIRSCg7r7WCc8OaD3iFGSQ4mJVFewaTARCG+pPyUyozE4oz4
  otKc1OJDjDIcHEoSvHpdQDnBotT01Iq0zBxgOMOkJTh4lER469uB0rzFBYm5xZnpEKlTjIpS4
  rw63UAJAZBERmkeXBsshi4xykoJ8zIyMDAI8RSkFuVmlqDKv2IU52BUEuY1AtnOk5lXAjf9Fd
  BiJqDFtZMCQBaXJCKkpBqYkpY4ijA7fJ5y+PVl8QPvnx1qlEp2cNuuf0klyPj01egfYutSsmz
  9NxWvufk92PTa202bqy86ivYn9F6/sPa2t6+owPwrRmcv3L4rpGQm8PRLpFfHZj6GeQV9OW6v
  DMsU2ZcmrdJWqNv1tPD2208sUwvX/5/4bm/h+qLATqVTu1iuf4vlOrC1XVlMVOHU8htNaqaGt
  fnBu7//veUVWvtjl8vO5908z4tfTJ3445TGtev6i+ZeF2dVXpYt+9jVLfrrezlW3Qvni6ffm8
  Ln/Mf7RB0H+7l/y5YGZ8cej+3Zd/2YQLPUlaKf994Wb5lVM1GqX/xMd+CzkI6lZg7XJ9bHt0j
  OXthTdqFK83ry690CZ5VYijMSDbWYi4oTAWA0YTgcAwAA
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-18.tower-267.messagelabs.com!1632734371!269280!1
X-Originating-IP: [62.60.8.84]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 19490 invoked from network); 27 Sep 2021 09:19:31 -0000
Received: from unknown (HELO mailhost3.uk.fujitsu.com) (62.60.8.84)
  by server-18.tower-267.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 27 Sep 2021 09:19:31 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost3.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 18R9JUPm002752
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Sep 2021 10:19:31 +0100
Received: from localhost.localdomain (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.23; Mon, 27 Sep 2021 10:19:29 +0100
From: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-humanfriendly: upgrade 9.2 -> 10.0
Date: Tue, 28 Sep 2021 02:19:23 +0800
Message-ID: <1632766763-92393-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 27 Sep 2021 09:19:34 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93140

`Release 10.0`_ (2021-09-17)
----------------------------
**Noteworthy changes:**

- Merged pull request `#45`_ to resolve the issue caused by the conditional
  :pypi:`pyreadline` requirement on Windows not supporting Python 3.9+.

- Updated the readme to use Python 3 in the example (reported in issue `#56`_).
  Also added a mention of the ``humanfriendly --demo`` command.

- Removed the ``humanfriendly.compat.unittest`` alias that presumably no-one is
  using at this point; it had been rendered useless quite a long time ago
  (requested in issue `#53`_).

**Internal changes:**

- Merged pull request `#54`_ which migrates the :pypi:`humanfriendly` project
  from Travis CI to GitHub Actions and from Coveralls.io to Codecov.

- Fixed a deprecation warning concerning ``setup.cfg`` and some Sphinx
  documentation errors.

.. _Release 10.0: https://github.com/xolox/python-humanfriendly/compare/9.2...10.0
.. _#45: https://github.com/xolox/python-humanfriendly/pull/45
.. _#53: https://github.com/xolox/python-humanfriendly/issues/53
.. _#54: https://github.com/xolox/python-humanfriendly/pull/54
.. _#56: https://github.com/xolox/python-humanfriendly/issues/56

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 ...thon3-humanfriendly_9.2.bb => python3-humanfriendly_10.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-humanfriendly_9.2.bb => python3-humanfriendly_10.0.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-humanfriendly_9.2.bb b/meta-python/recipes-devtools/python/python3-humanfriendly_10.0.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-humanfriendly_9.2.bb
rename to meta-python/recipes-devtools/python/python3-humanfriendly_10.0.bb
index d87ed4d2a2..b1ece1ac0f 100644
--- a/meta-python/recipes-devtools/python/python3-humanfriendly_9.2.bb
+++ b/meta-python/recipes-devtools/python/python3-humanfriendly_10.0.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=5d178009f806c2bdd498a19be0013a7a"
 
 PYPI_PACKAGE = "humanfriendly"
 
-SRC_URI[sha256sum] = "f7dba53ac7935fd0b4a2fc9a29e316ddd9ea135fb3052d3d0279d10c18ff9c48"
+SRC_URI[sha256sum] = "6b0b831ce8f15f7300721aa49829fc4e83921a9a301cc7f606be6686a2288ddc"
 
 inherit pypi setuptools3
 
-- 
2.25.1


