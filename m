Return-Path: <leimaohui@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 084DEECAAD3
	for <webhook@archiver.kernel.org>; Thu, 15 Sep 2022 08:15:01 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com
 [85.158.142.113])
 by mx.groups.io with SMTP id smtpd.web11.7560.1663229696471334021
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 15 Sep 2022 01:14:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=QI85BC3Z;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.113,
 mailfrom: leimaohui@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1663229694; i=@fujitsu.com;
	bh=z10K070x/JsO7dWTFrbvIyM05CcU974RlmqV93qqVr8=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=QI85BC3Z6tbcX3bR2ZkFzddjpQZ40kiMpG9VgrOgun7sIxZOv/2+ACSlcq7LLtbKT
	 zyRBdsfLWSUerADMWegT6BanKSu8OC66x72T/JntO8Xf9LjsI3NuTeNt8zdcK8dPVq
	 EcBOOKJzVyM8x8d7vcgRyR/Ts6D4eyoXZABufOF7xcSQMDUl011B25Qje/jNu0OnCQ
	 WheR2hELjlKub16+HOpta12JUbtcuQ64Rt2yJ/TEDnMyqwEAguV2DgcFOBvE19mHg0
	 tGA7/2N8g4iT3Irkc64F13VEQdItG1Yv9EFrxE2uWE7h5mSOWCGkd5HaPXmDWdqWyj
	 lBp1iMtTpc2KA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrCIsWRWlGSWpSXmKPExsViZ8ORqPv3nlK
  ywbWbOhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8bN74cZC1bKVPz8ZNzAeE+yi5GLQ0jgCaPE
  8ltrWCGc60wS+4//YoFw9jJKNK48yN7FyMnBJqAhsXvqZWYQW0RAX2Lp7D1gNrOAmsTRlz/Bb
  GEBT4ljHz6wgtgsAqoSZ8/PZgKxeQVcJC5ebgGbIyGgIDHl4XtmiLigxMmZT1gg5khIHHzxgh
  miRkni7aU9jBB2hUTj9ENMELaaxNVzm5gnMPLPQtI+C0n7AkamVYw2SUWZ6RkluYmZObqGBga
  6hoamupZmuoaWxnqJVbqJeqmlunn5RSUZuoZ6ieXFeqnFxXrFlbnJOSl6eaklmxiBgZlSnHBw
  B+OKfb/0DjFKcjApifJePaqULMSXlJ9SmZFYnBFfVJqTWnyIUYaDQ0mCd+pdoJxgUWp6akVaZ
  g4wSmDSEhw8SiK8a0HSvMUFibnFmekQqVOMilLivOcvAiUEQBIZpXlwbbDIvMQoKyXMy8jAwC
  DEU5BalJtZgir/ilGcg1FJmHc7yHiezLwSuOmvgBYzAS02spYHWVySiJCSamCquvPi7z0nzzb
  2e+XzxK40z9g2846nmkvlnk/lmbPnTjwRMjusTHa7Ceu+cz3bJZWFDr/mMP37Yo+R5b7VLjEv
  lSY7lYheyt6XuzrtMGPCXd9IFqm6s13HjaQzZwdYH4xcnS2z7W7iL/u39cc+nHB79FH54tpq/
  ct2go8myC0xfB+5XYw7W99q0yvNw5bemhcMcny+Vu48Inv6v6L2hI7fNmmH2o87pcqXnV9tEP
  ct89ON634/ag8s0givDO24wRKyrLa030VieZfalDl8VypvMX1uvO1WwH9gq3B7eo7P+6PCEzh
  +vzt+RXWzn13thscVc9c1au9Szv3+Qjl+stZKrfI3S1bsacl8v4V58fZwJZbijERDLeai4kQA
  DBlKSEcDAAA=
X-Env-Sender: leimaohui@fujitsu.com
X-Msg-Ref: server-10.tower-745.messagelabs.com!1663229693!271764!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 10004 invoked from network); 15 Sep 2022 08:14:53 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-10.tower-745.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 15 Sep 2022 08:14:53 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 1AD1A10018D
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 15 Sep 2022 09:14:53 +0100 (BST)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121
 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 0E9CC100043
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 15 Sep 2022 09:14:53 +0100 (BST)
Received: from localhost.localdomain (10.167.225.227) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Thu, 15 Sep 2022 09:14:51 +0100
From: Lei Maohui <leimaohui@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Lei Maohui <leimaohui@fujitsu.com>
Subject: [oe] [meta-gnome][PATCH] tracker-miners: Fix buildpaths warning.
Date: Thu, 15 Sep 2022 16:14:42 +0800
Message-ID: <1663229682-9290-1-git-send-email-leimaohui@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.227]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 15 Sep 2022 08:15:01 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98816

Fix the following warning:
WARNING: tracker-miners-3.2.1-r0 do_package_qa: QA Issue: File
/usr/src/debug/tracker-miners/3.2.1-r0/src/libtracker-miners-common/tracker-miners-enum-types.c
in package tracker-miners-src contains reference to TMPDIR
File /usr/src/debug/tracker-miners/3.2.1-r0/src/libtracker-miner/tracker-miner-enum-types.c
in package tracker-miners-src contains reference to TMPDIR [buildpaths]

Signed-off-by: Lei Maohui <leimaohui@fujitsu.com>
---
 ...file-to-a-fixed-path-instead-of-a-host-pa.patch | 41 ++++++++++++++++++++++
 .../recipes-gnome/tracker/tracker-miners_3.2.1.bb  |  5 ++-
 2 files changed, 45 insertions(+), 1 deletion(-)
 create mode 100644 meta-gnome/recipes-gnome/tracker/tracker-miners/0001-Set-header-file-to-a-fixed-path-instead-of-a-host-pa.patch

diff --git a/meta-gnome/recipes-gnome/tracker/tracker-miners/0001-Set-header-file-to-a-fixed-path-instead-of-a-host-pa.patch b/meta-gnome/recipes-gnome/tracker/tracker-miners/0001-Set-header-file-to-a-fixed-path-instead-of-a-host-pa.patch
new file mode 100644
index 0000000..1332a95
--- /dev/null
+++ b/meta-gnome/recipes-gnome/tracker/tracker-miners/0001-Set-header-file-to-a-fixed-path-instead-of-a-host-pa.patch
@@ -0,0 +1,41 @@
+From 6f6d7e3995c370b8121206a7f9cc0d234553bbfe Mon Sep 17 00:00:00 2001
+From: Lei Maohui <leimaohui@fujitsu.com>
+Date: Thu, 15 Sep 2022 16:35:39 +0900
+Subject: [PATCH] Set header file to a fixed path instead of a host path.
+
+Upstream-Status: Inappropriate [embedded specific]
+
+Signed-off-by: Lei Maohui <leimaohui@fujitsu.com>
+---
+ src/libtracker-miner/tracker-miner-enum-types.c.template        | 2 +-
+ .../tracker-miners-enum-types.c.template                        | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/libtracker-miner/tracker-miner-enum-types.c.template b/src/libtracker-miner/tracker-miner-enum-types.c.template
+index 7be7a01..46a4dc9 100644
+--- a/src/libtracker-miner/tracker-miner-enum-types.c.template
++++ b/src/libtracker-miner/tracker-miner-enum-types.c.template
+@@ -7,7 +7,7 @@
+
+ /*** BEGIN file-production ***/
+ /* enumerations from "@basename@" */
+-#include "@filename@"
++#include "tracker-miner-enums.h"
+ /*** END file-production ***/
+
+
+diff --git a/src/libtracker-miners-common/tracker-miners-enum-types.c.template b/src/libtracker-miners-common/tracker-miners-enum-types.c.template
+index c712dda..cb449e2 100644
+--- a/src/libtracker-miners-common/tracker-miners-enum-types.c.template
++++ b/src/libtracker-miners-common/tracker-miners-enum-types.c.template
+@@ -7,7 +7,7 @@
+
+ /*** BEGIN file-production ***/
+ /* enumerations from "@basename@" */
+-#include "@filename@"
++#include "tracker-enums.h"
+ /*** END file-production ***/
+
+
+--
+2.25.1
diff --git a/meta-gnome/recipes-gnome/tracker/tracker-miners_3.2.1.bb b/meta-gnome/recipes-gnome/tracker/tracker-miners_3.2.1.bb
index 2847635..92039a2 100644
--- a/meta-gnome/recipes-gnome/tracker/tracker-miners_3.2.1.bb
+++ b/meta-gnome/recipes-gnome/tracker/tracker-miners_3.2.1.bb
@@ -15,7 +15,10 @@ GNOMEBASEBUILDCLASS = "meson"
 
 inherit gnomebase gsettings gobject-introspection vala bash-completion features_check
 
-SRC_URI += "file://0001-meson.build-Just-warn-if-we-build-without-libseccomp.patch"
+SRC_URI += "file://0001-meson.build-Just-warn-if-we-build-without-libseccomp.patch \
+            file://0001-Set-header-file-to-a-fixed-path-instead-of-a-host-pa.patch \
+           "
+
 SRC_URI[archive.sha256sum] = "44369f53e2edef41437406dbeecd477a97f8a9afdd9134832ea45d1ba2aa2c47"
 
 # gobject-introspection is mandatory and cannot be configured
-- 
1.8.3.1


