Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D55CC4332F
	for <webhook@archiver.kernel.org>; Tue, 15 Feb 2022 07:38:03 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.1])
 by mx.groups.io with SMTP id smtpd.web12.6928.1644910679512860219
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 14 Feb 2022 23:38:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=XrwLYCus;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.1,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1644910677; i=@fujitsu.com;
	bh=mceGZwlpzhBKom6dkea3YO9ptMzhafkyEuPKnYOW6SQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=XrwLYCusamGcADMtK3rHbYdEhtsavZEbVEw7B1KM0pE9T/iSxiY/CuDqD8tiVGQN3
	 iWZANYWhy52JIa0WLuKuo4+fP0GTaNlHYmHD/aon0gt5sMuP79RFXqCXFRUMfzvaGF
	 2UyiCuuQ/DEvl1dMgX0GVNYdPFUUBrYhmYOyeRUaCd1FJ3zTyM5ys82uiL8A24Socx
	 Mk0+LA8oc7OqCM1uZh6exhms1Cz3+YDUHa6CoW2IBrnlQiDwUbC1DiKAoyqF3ULsZM
	 7keL2/GQXsrc3yEXfwMvcQ4SWkEpUSq7yyTcXXP5DHNG6mnxLwuV7J31z/k8TjYWG2
	 P6ey8vx8GdqBQ==
Received: from [100.115.7.136] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-1.bemta.az-a.eu-west-1.aws.ess.symcld.net id AE/72-13236-5585B026;
 Tue, 15 Feb 2022 07:37:57 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrBIsWRWlGSWpSXmKPExsViZ8MxSTc0gjv
  J4MgxZouLh5cyOzB6nNu4gjGAMYo1My8pvyKBNaPngUpBh2jFj2tyDYxNwl2MXBxCAk8YJS5u
  vMsO4Vxgkmje0soK4ZxglJiy6QZjFyMnB5uAmsT0WzdYQWwRAX2JpbP3MIPYzAIqEi9+97CD2
  MICvhJty/+C1bMIqEocnN4BFOfg4BVwlJizswgkLCGgIDHl4XuwVk4BJ4m7C/+CtQoBlVzd8Q
  zM5hUQlDg58wkLxHgJiYMvXjBD9CpKzL7czAJhV0jMmtXGBGGrSVw9t4l5AqPgLCTts5C0L2B
  kWsVolVSUmZ5RkpuYmaNraGCga2hoqmuma2hmqZdYpZuol1qqW55aXKJrqJdYXqyXWlysV1yZ
  m5yTopeXWrKJERjAKcVsK3cwruz7qXeIUZKDSUmU11ufO0mILyk/pTIjsTgjvqg0J7X4EKMMB
  4eSBO+zMKCcYFFqempFWmYOMJpg0hIcPEoivPP9gNK8xQWJucWZ6RCpU4yKUuK8ZuFACQGQRE
  ZpHlwbLIIvMcpKCfMyMjAwCPEUpBblZpagyr9iFOdgVBLmnQ4yhSczrwRu+iugxUxAixUbuUA
  WlyQipKQamCzfbp/xcPHKC02iPFdfhi2Z08L0qHyh30E+Vx3e6lP38gR9/4dG66zga3V/pHrN
  zkvzWJXsrfnVhcyt7x2eGLVfDPU+5jLPev6bbyEte0J/vKv0sNK69WR2kk5V9vfFjG1dkYUZ8
  0X9brw+wMSwlUVn5t6GiF0OPZNY7OVvKU1g7imYrcW+ZpuRePaJpPCMY3N6JshMmNle0+4sGR
  7XuItDa8KuByr76hbVnFuTJ+DHdP2E44rLwXmqUccmHDnY57X4p9gZOWWBGWobluz2WvJ/ioZ
  2toHvVen1edN11jPFat6/d/za1uJwPtOsTQGhxZ0/rvNPO8Ia3Z/09nGNHcOlY4/u/eHbcO1R
  z/eXOUosxRmJhlrMRcWJAP3VO0ZbAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-8.tower-587.messagelabs.com!1644910676!55371!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 14294 invoked from network); 15 Feb 2022 07:37:57 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-8.tower-587.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 15 Feb 2022 07:37:57 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 943A3100450
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 15 Feb 2022 07:37:56 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 876C0100359
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 15 Feb 2022 07:37:56 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.28; Tue, 15 Feb 2022 07:37:36 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-twisted: upgrade 21.7.0 -> 22.1.0
Date: Tue, 15 Feb 2022 15:37:26 +0800
Message-ID: <1644910647-5613-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1644910647-5613-1-git-send-email-wangmy@fujitsu.com>
References: <1644910647-5613-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 15 Feb 2022 07:38:03 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95311

License-Update: year updated to 2022

Changelog:
=========
Features
--------
-Python 3.10 is now a supported platform (#10224)
-Type annotations have been added to the twisted.python.fakepwd module. (#10287)

Bugfixes
--------
-twisted.internet.defer.inlineCallbacks has an improved type annotation, to
 avoid typing errors when it is used on a function which returns a non-None
 result. (#10231)
-twisted.internet.base.DelayedCall.__repr__ and
 twisted.internet.task.LoopingCall.__repr__ had the changes from #10155
 reverted to accept non-function callables. (#10235)
-Revert the removal of .whl building that was done as part of #10177. (#10236)
-The type annotation of the host parameter to
 twisted.internet.interfaces.IReactorTCP.connectTCP has been corrected from
 bytes to str. (#10251)
-Deprecated twisted.python.threading.ThreadPool.currentThread() in favor of
 threading.current_thread().
-Switched twisted.python.threading.ThreadPool.currentThread() and
 twisted.python.threadable.getThreadID() to use 'threading.current_thread() to
 avoid the deprecation warnings introduced forthreading.currentThread()'
 in Python 3.10. (#10273)

Improved Documentation
----------------------
-twisted.internet.utils.runWithWarningsSupressed behavior of waiting on
 deferreds has been documented. (#10238)
-Sync API docs templates with pydoctor 21.9.0 release, using new theming
 capabilities. (#10267)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-twisted_21.7.0.bb => python3-twisted_22.1.0.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-twisted_21.7.0.bb => python3-twisted_22.1.0.bb} (98%)

diff --git a/meta-python/recipes-devtools/python/python3-twisted_21.7.0.bb b/meta-python/recipes-devtools/python/python3-twisted_22.1.0.bb
similarity index 98%
rename from meta-python/recipes-devtools/python/python3-twisted_21.7.0.bb
rename to meta-python/recipes-devtools/python/python3-twisted_22.1.0.bb
index 4e9472793b..8fd7801c35 100644
--- a/meta-python/recipes-devtools/python/python3-twisted_21.7.0.bb
+++ b/meta-python/recipes-devtools/python/python3-twisted_22.1.0.bb
@@ -5,9 +5,9 @@ HOMEPAGE = "http://www.twistedmatrix.com"
 
 #twisted/topfiles/NEWS:655: - Relicensed: Now under the MIT license, rather than LGPL.
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=e33c411c0b86b1f3ca299091ed51ca31"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=0f8d67f84b6e178c92d471011b2245fc"
 
-SRC_URI[sha256sum] = "2cd652542463277378b0d349f47c62f20d9306e57d1247baabd6d1d38a109006"
+SRC_URI[sha256sum] = "b7971ec9805b0f80e1dcb1a3721d7bfad636d5f909de687430ce373979d67b61"
 
 PYPI_PACKAGE = "Twisted"
 
-- 
2.25.1


