Return-Path: <xuhuan.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3639C433EF
	for <webhook@archiver.kernel.org>; Thu, 28 Apr 2022 07:03:54 +0000 (UTC)
Received: from mail1.bemta36.messagelabs.com (mail1.bemta36.messagelabs.com
 [85.158.142.113])
 by mx.groups.io with SMTP id smtpd.web12.7140.1651129424623196363
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 28 Apr 2022 00:03:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=YyDJgNxw;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.113,
 mailfrom: xuhuan.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1651129422; i=@fujitsu.com;
	bh=5mOTBaxqJMQK/UefB9e1TAzwxjqQlqTJt/1y+apWbuU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=YyDJgNxwuH0ZfHIuo8TF6gqFmsaulXod/XJ1essOcJBEvCGzL3NYlMvXm47Ej6fyE
	 NYR1GcSSpN/4NQjkVuvQ2zX8wR7ln+Rhur8094Tg3iKIrR3ksVstTZ5j3zfgiTBP56
	 1Ea5A1tEhvwmHcZC3bJcIBZKyVncEiA+VCe0fzuKNUFNLOb5mvjb2dQBNR/dAzhkFn
	 XuiGuLKRXWlLjn+sDW6TixldX1rVsadf7xnhBy4YmbYN8lfrakdck2WI/pkfzv19jt
	 LNyggaHUjmXu2PsFnhT/A3a/bgI9uVFKzNnloifh3Bp99udyJY271PJzFFTVP6CHG+
	 /TPPpHKxiLJdw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrLIsWRWlGSWpSXmKPExsViZ8MxSdfPJiv
  JYPZxcYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNeNXTwNrwU/uitkb9jA2MF7j6mLk4hASeMIo
  8eJ2KyOEc4FJom9rFyuEc5JR4u79D8xdjJwcbALqEo9vvmYEsUUE9CWWzt4DFmcWUJXovriGv
  YuRg0NYIEji838NkDALUPhs1zMWEJtXwE1i6/o1YLaEgILElIfvwVo5BdwlWm6uYAWxhYBqVl
  y+zwZRLyhxcuYTFojxEhIHX7xghuhVkjix4iMThF0h8frwJai4msTVc5uYJzAKzkLSPgtJ+wJ
  GplWMtklFmekZJbmJmTm6hgYGuoaGprpmZrqWZnqJVbqJeqmlusmpeSVFiUBZvcTyYr3U4mK9
  4src5JwUvbzUkk2MwFBOKXZK2MH4qO+n3iFGSQ4mJVFeK9OsJCG+pPyUyozE4oz4otKc1OJDj
  DIcHEoSvArWQDnBotT01Iq0zBxgXMGkJTh4lER4ZYyB0rzFBYm5xZnpEKlTjIpS4ryuIH0CII
  mM0jy4NlgsX2KUlRLmZWRgYBDiKUgtys0sQZV/xSjOwagkzGsGMoUnM68EbvoroMVMQItXFmW
  CLC5JREhJNTDNreNS6djezSsyc8fk71rH9/80ZXe/IK9nbCJ0slLh0+q/5V/enQ8uea2oxvXm
  Z++6iOUOEiLzXxx+pHxDIHVPl93v74nMMrEiElUPvLWVX/9qWLjbm/l+qPz3R0/3LwxqeWNVe
  DA7gqPtqrVPhK7HwdiAnbbPIg/qzPIuubneIXnFup4p1TFOxSzhxmsF3vekbm04YPbrxJGcee
  6/WI3WT30wpSti0ZmZevrOcS/u/FCYkH4q6t63rKLzjbfU1rxu4JtW4GBbrvJkrVDni9VHDyp
  OSbpXWxzx74J2ms2lghNiAhsiJu94HcG91G3lE//LGcy237/euZrnKMe6dLW70cXeed0G/g79
  G3/5umUrsRRnJBpqMRcVJwIAL6Vc82ADAAA=
X-Env-Sender: xuhuan.fnst@fujitsu.com
X-Msg-Ref: server-3.tower-545.messagelabs.com!1651129422!34096!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.85.8; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 15839 invoked from network); 28 Apr 2022 07:03:42 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-3.tower-545.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 28 Apr 2022 07:03:42 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id D8F4E1000F5
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 28 Apr 2022 08:03:41 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id CB4971000E9
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 28 Apr 2022 08:03:41 +0100 (BST)
Received: from localhost.localdomain.localdomain (10.167.225.131) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Thu, 28 Apr 2022 08:03:19 +0100
From: XU Huan <xuhuan.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Xu Huan <xuhuan.fnst@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-flask-socketio: upgrade 5.1.1 ->
 5.1.2
Date: Thu, 28 Apr 2022 15:03:34 +0800
Message-ID: <1651129416-8432-4-git-send-email-xuhuan.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1651129416-8432-1-git-send-email-xuhuan.fnst@fujitsu.com>
References: <1651129416-8432-1-git-send-email-xuhuan.fnst@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.131]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 28 Apr 2022 07:03:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96829

From: Xu Huan <xuhuan.fnst@fujitsu.com>

Changelog:
==========
    No need to push a new app context in the test client #1669
    Remove 3.6 and pypy-3.6 builds, add 3.10 and pypy-3.8
    Improve documentation on start_background_task() function
    changed room argument to to in documentation examples #1665
    Fix documentation typo #1793
    Fix example code in documentation #1787

Signed-off-by: Xu Huan <xuhuan.fnst@fujitsu.com>
---
 ...-flask-socketio_5.1.1.bb => python3-flask-socketio_5.1.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-flask-socketio_5.1.1.bb => python3-flask-socketio_5.1.2.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-flask-socketio_5.1.1.bb b/meta-python/recipes-devtools/python/python3-flask-socketio_5.1.2.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-flask-socketio_5.1.1.bb
rename to meta-python/recipes-devtools/python/python3-flask-socketio_5.1.2.bb
index 00e958022a..1e5d775b60 100644
--- a/meta-python/recipes-devtools/python/python3-flask-socketio_5.1.1.bb
+++ b/meta-python/recipes-devtools/python/python3-flask-socketio_5.1.2.bb
@@ -9,7 +9,7 @@ inherit pypi python_setuptools_build_meta
 
 PYPI_PACKAGE = "Flask-SocketIO"
 
-SRC_URI[sha256sum] = "1efdaacc7a26e94f2b197a80079b1058f6aa644a6094c0a322349e2b9c41f6b1"
+SRC_URI[sha256sum] = "933bcc887ef463a9b78d76f8f86174f63a32d12a5406b99f452cdf3b129ebba3"
 
 RDEPENDS:${PN} += "\
     ${PYTHON_PN}-flask \
-- 
2.25.1


