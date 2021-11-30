Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19364C433EF
	for <webhook@archiver.kernel.org>; Tue, 30 Nov 2021 04:02:05 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.1])
 by mx.groups.io with SMTP id smtpd.web12.71875.1638244923299281306
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 29 Nov 2021 20:02:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=YzU0RvbX;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.1,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1638244921; i=@fujitsu.com;
	bh=JAM6ov78gwPZz8ChPXQMa+RNbkBFXEzUCYEdYLboD2Y=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=YzU0RvbXWDTwIAWSOrCEhqkWICkNeMpywhxxpI9uVu5IONApDDUBGUiVTQUC8/DED
	 zh7VN0fV6G8FdWfB92dEA1QFdY4CeqPNoe43+cVeeT0QIu4bptIaf7JEvWfsrQDULI
	 YaaSb1XVSbYLgVgVToSQb/mdYJ0aC6DKXr9l7lHH8T3tekv4xVy0QY10K1Klrw6Jas
	 eQC/N/qD3gsUbdeNru1bJzQHFSWli4oLW8rydqh5dMjka4Ek/+FyK1F28pyD1Jxfux
	 iHAGLeTE2Ebo8t2GL9RMwf+IlORjeMO3RgHIsR7+s4W/1zqv0djXUtBKbJOW2LWA41
	 4Woqi6ZVmeEvQ==
Received: from [100.115.32.166] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-1.bemta.az-a.eu-west-2.aws.ess.symcld.net id BD/AC-17169-932A5A16;
 Tue, 30 Nov 2021 04:02:01 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrAIsWRWlGSWpSXmKPExsViZ8MxSddi0dJ
  Eg6P7LS0uHl7K7MDocW7jCsYAxijWzLyk/IoE1oy211PZC56zVWyYuJqpgXExWxcjF4eQwBNG
  iR2PfzNCOBeYJHbeaGCHcE4wSiw5d4Oli5GTg01ATWL6rRusILaIgL7E0tl7mEFsZgEViRe/e
  9hBbGGBQIk5U04zgtgsAqoSR97uZOpi5ODgFXCW+LDLAyQsIaAgMeXhe7BWXgFBiZMzn7BAjJ
  GQOPjiBTNEjaLE7MvNLBB2hcSsWW1MELaaxNVzm5gnMPLPQtI+C0n7AkamVYxWSUWZ6RkluYm
  ZObqGBga6hoamusaWuoYmeolVuol6qaW65anFJbpGeonlxXqpxcV6xZW5yTkpenmpJZsYgUGZ
  UqzOt4Ox6/I3vUOMkhxMSqK8DHOWJgrxJeWnVGYkFmfEF5XmpBYfYpTh4FCS4F2xACgnWJSan
  lqRlpkDjBCYtAQHj5II79NZQGne4oLE3OLMdIjUKUZ7jjdrlyxi5mi7dxdIzlxwcDUzx/32Q6
  uZhVjy8vNSpcR5p4FMFQBpyyjNgxsKi+hLjLJSwryMDAwMQjwFqUW5mSWo8q8YxTkYlYR5PRY
  CTeHJzCuB2/0K6CwmoLPeLl0MclZJIkJKqoGJdaa0Q2rfR/1NbOGzShbKmicdYJkTNTerdnNt
  kD+PcFK9r0uOdTDf5UDfzE/Mxca/C1ViZ+zyZLatOfjuw2dOn6kOX1Pezj30sfxjssoxsX0OZ
  uazhMQWGL84ElM5PXcRg4pJ7oYbT3vC6+U4NI6vZzlZftmnKeT9g8Ncjf6z1vnG2Swz51r1Ka
  XHV9axJ5Rtprld0Hezq1GfOdtl/eofXLv58wbD2p/KHT9YambNXBrw/qWJ0/uEGWF8Wv3nFac
  8yNPrjv90bH2jgEflQe5t7Pp9KU0SRxbf3FnPeaTr/lSJ2htiPGyubR+ex4YILFrzY/5P+9xJ
  7XWH0+f3vHNYtLoqqFjyouFqBd0vbEosxRmJhlrMRcWJACihGRtjAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-13.tower-571.messagelabs.com!1638244920!460372!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.5; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 14209 invoked from network); 30 Nov 2021 04:02:00 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-13.tower-571.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 30 Nov 2021 04:02:00 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id C4EF61B2E96
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Nov 2021 04:02:00 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id B811C1B2E95
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Nov 2021 04:02:00 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.26; Tue, 30 Nov 2021 04:01:38 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] dnf-plugin-tui: Fix a bug with newer version
 rpm.
Date: Tue, 30 Nov 2021 12:01:28 +0800
Message-ID: <1638244888-120811-1-git-send-email-wangmy@fujitsu.com>
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
 <openembedded-devel@lists.openembedded.org>; Tue, 30 Nov 2021 04:02:05 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94147

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-devtools/dnf-plugin-tui/dnf-plugin-tui_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/dnf-plugin-tui/dnf-plugin-tui_git.bb b/meta-oe/recipes-devtools/dnf-plugin-tui/dnf-plugin-tui_git.bb
index 2c9e45fce7..d2b1a4ab55 100644
--- a/meta-oe/recipes-devtools/dnf-plugin-tui/dnf-plugin-tui_git.bb
+++ b/meta-oe/recipes-devtools/dnf-plugin-tui/dnf-plugin-tui_git.bb
@@ -4,7 +4,7 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 SRC_URI = "git://github.com/ubinux/dnf-plugin-tui.git;branch=master;protocol=https"
-SRCREV = "b0d80b7129f1d84cc563a4098d869e7420bcf4bc"
+SRCREV = "4b49165051bfdd136986855dd98aa9238eefdf78"
 PV = "1.3"
 
 SRC_URI:append:class-target = " file://oe-remote.repo.sample"
-- 
2.25.1


