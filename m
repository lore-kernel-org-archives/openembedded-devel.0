Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A28F9C43217
	for <webhook@archiver.kernel.org>; Fri, 27 May 2022 01:36:35 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.65])
 by mx.groups.io with SMTP id smtpd.web09.2683.1653615389857667054
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 May 2022 18:36:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=cj6EPa2K;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.65,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1653615388; i=@fujitsu.com;
	bh=sc24ETgKFYGrW6e4jsLCyeZ/tcVG5Jam7YT3K/I764o=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=cj6EPa2KcUz4l6cSLe1Zw8979CbHVjk1NM5icwFKUmD5QS/9qrqy/BRu7VRQk1IXo
	 +Ozd9zw8kkr4MJLe7zXnEfvoFSrFUF9+kNNjOMBA61uoltJW9FFa6O6QpUFzrAMq6a
	 jCuGwE4yV5Ee8Y26cO7FRC0dWaSmVPQkQ+rzAjWGv33VIppal9fDK6B3CzuDKXmZCo
	 wkFFTkL/Vws52KqgwonL74RVN6NBKGM3G78jNy+dcMOcCkD97VqRC8Pt6Zhd81SykP
	 ySH07blNj3Z8K48rW+js8B5yZAbCt/A64NVc1rBSyOwc2Dj5W21Qqr3VdeUg7CvND7
	 ah0USFUjQhvjQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrBIsWRWlGSWpSXmKPExsViZ8ORqCutPSH
  J4FWLqMXFw0uZHRg9zm1cwRjAGMWamZeUX5HAmjF1qlXBY56KnvVL2BsY93N3MXJxCAk8YZR4
  +HAKE4RzgUli4pmZLBDOHkaJeZe/s3YxcnKwCahJTL91A8wWEdCXWDp7DzOIzSygIvHidw87i
  C0s4CPRN+EVYxcjBweLgKrE5+fWIGFeASeJmQ+vMoLYEgIKElMevgdr5RRwlli+dTNYXAio5t
  W9hSwQ9YISJ2c+YYEYLyFx8MULZoheRYnZl5tZIOwKiRkztrFB2GoSV89tYp7AKDgLSfssJO0
  LGJlWMVomFWWmZ5TkJmbm6BoaGOgaGprqGutamOklVukm6qWW6panFpfoGuollhfrpRYX6xVX
  5ibnpOjlpZZsYgQGcEoxc9gOxj+9P/UOMUpyMCmJ8mbe608S4kvKT6nMSCzOiC8qzUktPsQow
  8GhJMF7R21CkpBgUWp6akVaZg4wmmDSEhw8SiK8SjJAad7igsTc4sx0iNQpRkUpcd4rmkAJAZ
  BERmkeXBssgi8xykoJ8zIyMDAI8RSkFuVmlqDKv2IU52BUEuZ9CjKFJzOvBG76K6DFTECL83l
  7QRaXJCKkpBqYVi8W9yxyE541bf/txjJND0EeqZNvLeq2T24ruWWeIN7n/Nc4wS36MHu6zQ5z
  tUPJepdsN7XFHTadcG1n4zldruul7XVXEtbOyTp07f8bvmWKfv+u1Sc4bj7F+Hxrxvl95ROcy
  2TlpeQlzlsLfXpQP//Tvpxpe16veer6KvOXyjTtzs0h34otnk46MSHwbJ3I0tL+m+JHn4t1Nc
  V2Wi8WZkrliPsbNMfs1imxz31RT3v/u2qWTFi0btuUP9OyJcxvi+6atb1M2kyO5T7/gd93/YT
  P1/CISMSc8lt8JVJu2sbfS1QLWLVqd8lff7apS8R6yY/lUWo1fx9vnzHxsBCrEtPR32UX3HdG
  ysgwfuJkUWIpzkg01GIuKk4EAN5TH7ZbAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-18.tower-591.messagelabs.com!1653615387!20796!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 22741 invoked from network); 27 May 2022 01:36:27 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-18.tower-591.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 27 May 2022 01:36:27 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id D38DA100199
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 27 May 2022 02:36:26 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id C396A10018E
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 27 May 2022 02:36:26 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Fri, 27 May 2022 02:36:10 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-watchdog: upgrade 2.1.7 -> 2.1.8
Date: Fri, 27 May 2022 09:35:42 +0800
Message-ID: <1653615344-24799-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1653615344-24799-1-git-send-email-wangmy@fujitsu.com>
References: <1653615344-24799-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 27 May 2022 01:36:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97292

Changelog:
==========
  Fix adding failed emitters on observer schedule. (#872)
  [inotify] Fix hang when unscheduling watch on a path in an unmounted filesystem. (#869)
  [watchmedo] Fix broken parsing of --kill-after argument for the auto-restart command. (#870)
  [watchmedo] Fix broken parsing of boolean arguments. (#887)
  [watchmedo] Fix broken parsing of commands from auto-restart, and shell-command. (#888)
  [watchmedo] Support setting verbosity level via -q/--quiet and -v/--verbose arguments. (#889)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-watchdog_2.1.7.bb => python3-watchdog_2.1.8.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-watchdog_2.1.7.bb => python3-watchdog_2.1.8.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-watchdog_2.1.7.bb b/meta-python/recipes-devtools/python/python3-watchdog_2.1.8.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-watchdog_2.1.7.bb
rename to meta-python/recipes-devtools/python/python3-watchdog_2.1.8.bb
index 7e91295fb..70af95157 100644
--- a/meta-python/recipes-devtools/python/python3-watchdog_2.1.7.bb
+++ b/meta-python/recipes-devtools/python/python3-watchdog_2.1.8.bb
@@ -4,7 +4,7 @@ DEPENDS = "${PYTHON_PN}-argh"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-SRC_URI[sha256sum] = "3fd47815353be9c44eebc94cc28fe26b2b0c5bd889dafc4a5a7cbdf924143480"
+SRC_URI[sha256sum] = "6d03149126864abd32715d4e9267d2754cede25a69052901399356ad3bc5ecff"
 
 inherit pypi setuptools3
 
-- 
2.25.1


