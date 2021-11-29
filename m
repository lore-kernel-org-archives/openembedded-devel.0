Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F823C433F5
	for <webhook@archiver.kernel.org>; Mon, 29 Nov 2021 15:39:03 +0000 (UTC)
Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com
 [85.158.142.3])
 by mx.groups.io with SMTP id smtpd.web10.62698.1638200342778858891
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 29 Nov 2021 07:39:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=r7eeLrmV;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.3,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1638200341; i=@fujitsu.com;
	bh=rp5T5ldD5SSuhLsW5OgxmwV3HKR+yXy5P8mxkWqA4bU=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=r7eeLrmVbIRPHZL4ETkuaNgQ2DwuBK9FLvZqUXFv7HivLGF4v/tIyEMd0INwjqteW
	 Q5zTKIKdjoTYAxp224GFVR0VN1A+htoGQCLfNlqZ3lwhnjHwzLtXX2k5HQW+TBg0rv
	 hqEI3F7etgcYZNEPDnp5xTuQVe+c9SudjD7o2LxQarXI6/UF0/DhEE/PMwNDz/3Z93
	 M4zC4gwN/hNhVJJ+sJPL3niPMAbLLZyRn1jVHvQHxTGDOKCRYX/Owqw0m6q0W+fO5L
	 1KM7b12cr+IBUTAa0S2TCKOvSpGZbJr/+qlDuTv29oJJroe6Fnzn/rvmz61w3qoGRL
	 Vg0ldUJeQg9cQ==
Received: from [100.113.0.146] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-3.bemta.az-a.eu-central-1.aws.symcld.net id 12/A7-15394-414F4A16;
 Mon, 29 Nov 2021 15:39:00 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprBIsWRWlGSWpSXmKPExsViZ8MRoivyZUm
  iwY9OFYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNePB5RmMBX+4Kp7Mcm5gvMrZxcjFISQwk0ni
  6INfTBDOCUaJj81XWLoYOTnYBNQkpt+6wQpiiwjoSyydvYcZxGYWUJF48buHHcQWFrCW+Pv9A
  ROIzSKgKjH73Hqwel4BZ4lt1x+A2RICChJTHr5nhogLSpyc+YQFYo6ExMEXL5ghahQlZl9uZo
  GwKyRmzWpjmsDIOwtJyywkLQsYmVYxWiYVZaZnlOQmZuboGhoY6BoaGusa6xqaGeolVukm6qW
  W6ian5pUUJQJl9RLLi/WKK3OTc1L08lJLNjECAyylkHnhDsYfrz/oHWKU5GBSEuUt/7QkUYgv
  KT+lMiOxOCO+qDQntfgQowwHh5IEb+NHoJxgUWp6akVaZg4w2GHSEhw8SiK8t0DSvMUFibnFm
  ekQqVOMilLivK0gMwVAEhmleXBtsAi7xCgrJczLyMDAIMRTkFqUm1mCKv+KUZyDUUmY9zbIFJ
  7MvBK46a+AFjMBLX67dDHI4pJEhJRUA5OB0omyC2KdsxawuyX87onsbrUxS8l5+aZKuyjocGu
  +8OKm7ckcOz10eLubD3azfy8sahbwVdmjs9qT/ZwfQ9etL4/vHOqR6dBuZeZl1chN+nBg/cwr
  0/cuMbpfoqfEctln49N3m+ReME2I/bdPgavEcDHbo1vvdmzUva/ZwrYyejm7x/4zyfZnmLvWt
  d+UmnR38q2ix35eM6Obg5SCW/2419R67+CRb7Da9s56m1yM1o2fFc45kywXue8Lb21v47rl29
  /23/RJ3+adx614Ct6Z9k3RUL48dRnrjcfTvZad2NEr+9fWO0Lxc3Rl5xu7FbvK1vVHLA3q7uK
  vDzKz3Rhp3Lkq7rfRj4DqmVtjlViKMxINtZiLihMBf/x3aysDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-19.tower-226.messagelabs.com!1638200340!12304!1
X-Originating-IP: [62.60.8.84]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.5; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 11560 invoked from network); 29 Nov 2021 15:39:00 -0000
Received: from unknown (HELO mailhost3.uk.fujitsu.com) (62.60.8.84)
  by server-19.tower-226.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 29 Nov 2021 15:39:00 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost3.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 1ATFcvSu011487
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 29 Nov 2021 15:39:00 GMT
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.26; Mon, 29 Nov 2021 15:38:55 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] ply: upgrade 2.1.1 -> 2.2.0
Date: Mon, 29 Nov 2021 23:38:47 +0800
Message-ID: <1638200327-119287-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 29 Nov 2021 15:39:03 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94138

Changelog
=============================================
Changed
kprobe wildcards are now filtered through available_filter_functions,
if available, making them much more reliable.

Added
Self-test (ply -T) to automatically diagnose the most common configuration issues.
sum() aggregation.
BEGIN and END probes that run at the beginning/end of a script.
interval provider to run a probe at a specified interval.
Access to dynamic tracepoint data, i.e. members marked with the __data_loc attribute.

Fixed
A bunch of parsing errors from weird scripts. Found via fuzzing done.
Static linking is now supported.
Data layout issues with some tracepoints.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-devtools/ply/ply_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-devtools/ply/ply_git.bb b/meta-oe/recipes-devtools/ply/ply_git.bb
index 27e04d319c..616f5dd7e1 100644
--- a/meta-oe/recipes-devtools/ply/ply_git.bb
+++ b/meta-oe/recipes-devtools/ply/ply_git.bb
@@ -5,10 +5,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 DEPENDS += "bison-native"
 
-PV = "2.1.1+git${SRCPV}"
+PV = "2.2.0"
 
 SRC_URI = "git://github.com/iovisor/ply;branch=master;protocol=https"
-SRCREV = "e25c9134b856cc7ffe9f562ff95caf9487d16b59"
+SRCREV = "771c32b299355fb31fc296110e90ae0166409b95"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1


