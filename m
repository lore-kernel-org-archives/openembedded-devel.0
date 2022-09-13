Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79C6AC54EE9
	for <webhook@archiver.kernel.org>; Tue, 13 Sep 2022 08:49:38 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.3])
 by mx.groups.io with SMTP id smtpd.web11.2404.1663058969901337963
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 13 Sep 2022 01:49:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=yanjoRvz;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.3,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1663058968; i=@fujitsu.com;
	bh=/1tBj/10ZX7vQEBaRkRV0zx/JwlCKwIGiFh2SX2FMTE=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=yanjoRvz4cRTqGdPTQFFz+Em2ljsCsmtG2tyT7uwddgBstq1GD3h6/owEH2ik6nG9
	 CB6LNngKuOFWSnvXf/rKVeZ2G07OzGsBj86occOoxs+vELqRj+nzlwj9AdVjUkgdIk
	 BrLqtj358FiWESXmjEMZTB3qVYpd/ewNv4e3jz7u4q5Ts2iWudnmNjdw6ZKLlPZpGZ
	 JmCOWISjcrHvROJ8AAZz+nX+XC3ODVIHl5rdSZRVQhZ4VYT2uzeIreBhJyTE54XZsy
	 t8KBeJ4ciFAtR7KXyYhqdmLBWPbK+mPpQDeeRIBj0aM9j4Qh4ZITR1zHT80zv5t8Dp
	 /9wolzs7w8UnQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrEIsWRWlGSWpSXmKPExsViZ8OxWVfcRSH
  ZYOEjHYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNePGrJmsBavZKn6susLWwHiftYuRi0NI4AGj
  xPnOHhYI5zKTxPmfz9khnD2MEq0LVjF2MXJysAmoSUy/dYMVxBYR0JdYOnsPM4jNLKAi8eJ3D
  zuILSzgKNFw+BlYPYuAqkTbmuVANRwcvEDxI++5QcISAgoSUx6+B2vlFRCUODnzCQvEGAmJgy
  9eMEPUKErMvtzMAmFXSDROP8QEYatJXD23iXkCI/8sJO2zkLQvYGRaxWiVVJSZnlGSm5iZo2t
  oYKBraGiqa2ysa26il1ilm6iXWqpbnlpcomukl1herJdaXKxXXJmbnJOil5dasokRGJQpxYpe
  Oxhfrfipd4hRkoNJSZT3EaNCshBfUn5KZUZicUZ8UWlOavEhRhkODiUJ3gRHoJxgUWp6akVaZ
  g4wQmDSEhw8SiK8t+2A0rzFBYm5xZnpEKlTjIpS4rx5TkAJAZBERmkeXBssKi8xykoJ8zIyMD
  AI8RSkFuVmlqDKv2IU52BUEuYNBZnCk5lXAjf9FdBiJqDFRtbyIItLEhFSUg1Mfs9XJV2dtbV
  rbsihtfNOaK+x5rVjMH7x+ee2L13R090kn79dfdnK+9mSkNdfNiqcDy//lr66V7uow2ep5aTH
  EYLzBRz0m5T+VJ/Y0qC71fhZakvhtVbGPyuzpuz6ZcOYGrjAl0P+mJxja0275RHD406RfvzXS
  8XUxBt5RMP0ni3dv3Vm4d44xaOrZmjVnNk1e7Ynd9zv6sOr93pcCtB/IDVl6vvgnfk/N/28+T
  DqvuaOnLfZDmq+WRfv6My5O1c6xIBPv3TpRh9Po7TC1vrWfVo5Ci3Fl85kvzUWfd6sal272sa
  CY4pfX6J2xW292hqthUkReZUfQ29d33ecsc5+0ztewxjJhLNbitvfO21SYinOSDTUYi4qTgQA
  enofLEUDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-3.tower-548.messagelabs.com!1663058967!84161!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 7611 invoked from network); 13 Sep 2022 08:49:27 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-3.tower-548.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 13 Sep 2022 08:49:27 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id 6DD007C
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 13 Sep 2022 09:49:27 +0100 (BST)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121
 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id 60B7D7B
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 13 Sep 2022 09:49:27 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 13 Sep 2022 09:49:25 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] boost-sml: upgrade 1.1.5 -> 1.1.6
Date: Tue, 13 Sep 2022 16:49:11 +0800
Message-ID: <1663058955-2324-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 13 Sep 2022 08:49:38 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98755

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-support/boost-sml/boost-sml_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/boost-sml/boost-sml_git.bb b/meta-oe/recipes-support/boost-sml/boost-sml_git.bb
index e22eddb72d..c83181cfea 100644
--- a/meta-oe/recipes-support/boost-sml/boost-sml_git.bb
+++ b/meta-oe/recipes-support/boost-sml/boost-sml_git.bb
@@ -9,10 +9,10 @@ LIC_FILES_CHKSUM = "file://LICENSE.md;md5=e4224ccaecb14d942c71d31bef20d78c"
 
 DEPENDS += "boost qemu-native"
 
-PV = "1.1.5"
+PV = "1.1.6"
 
 SRC_URI = "git://github.com/boost-ext/sml.git;protocol=https;branch=master"
-SRCREV = "7ed8f85fbe5b5af87bfb818e9e0347aaf7f7056d"
+SRCREV = "23e9a24e434cac9922039cbb43ca54ab70bef72c"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1


