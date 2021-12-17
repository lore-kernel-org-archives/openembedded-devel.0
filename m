Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE36FC433EF
	for <webhook@archiver.kernel.org>; Fri, 17 Dec 2021 02:24:03 +0000 (UTC)
Received: from mail1.bemta36.messagelabs.com (mail1.bemta36.messagelabs.com
 [85.158.142.113])
 by mx.groups.io with SMTP id smtpd.web08.1373.1639707842785231957
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Dec 2021 18:24:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=t+LFF/q8;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.113,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1639707840; i=@fujitsu.com;
	bh=jkSO0AQlObm+dbvFJHOPxMqQ2ViklURUxUuyREXR84k=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=t+LFF/q8u5kyCHenKokkkz7GupMXDOPkIKTTeHsEnBubp8QYXlKiwgksC4MWwjPmC
	 XCWN2CG9J3vj9TDm8r1ni6sQ0MFZdRGxwZE820lZkPGS19eWivXfnI4JKv1dxL5OwI
	 PXTyUikkLQYcAKtYZyv5AMO1DCyCUJZrknUyDSIclZhTfuwUnCAFMiNVQDUJD6F6w0
	 8V763Kbe77/fpGEp3GBoWrL+dgf/FOl+Tybi9tl4+VMDBr2MD/EbKHWXNiupKFqf58
	 UpV6ylf9Qv0PdhGLtzpLfbw/aNM0dnYuer4VrruK5rfHv0/ESdcMAR7CpXhCcnO0LI
	 ZfbO7wyYhc0uQ==
Received: from [100.115.68.153] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-4.bemta.az-a.eu-central-1.aws.ess.symcld.net id
 93/2D-07141-0C4FBB16; Fri, 17 Dec 2021 02:24:00 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrGIsWRWlGSWpSXmKPExsViZ8ORqHvgy+5
  Eg/tvuC0uHl7K7MDocW7jCsYAxijWzLyk/IoE1oxtu++wFHxnr3iyfQ9bA+Ms9i5GLg4hgSeM
  Env6u9i6GDmBnAtMEr1PCiESJxglpnxbxASSYBNQk5h+6wYriC0ioC+xdPYeZhCbWUBF4sXvH
  nYQW1ggWOLs72NgNouAqsTPQyvAangFnCTOvJ0LFpcQUJCY8vA9VFxQ4uTMJywQcyQkDr54wQ
  xRoygx+3IzC4RdITFrVhsThK0mcfXcJuYJjPyzkLTPQtK+gJFpFaNdUlFmekZJbmJmjq6hgYG
  uoaGprpmZrqGpqV5ilW6iXmqpbnJqXklRIlBaL7G8WC+1uFivuDI3OSdFLy+1ZBMjMDhTip1m
  72Dc0fdT7xCjJAeTkihv/IXdiUJ8SfkplRmJxRnxRaU5qcWHGGU4OJQkeKs/AeUEi1LTUyvSM
  nOAkQKTluDgURLhZQdJ8xYXJOYWZ6ZDpE4xKkqJ8x77DJQQAElklObBtcGi8xKjrJQwLyMDA4
  MQT0FqUW5mCar8K0ZxDkYlYd4PION5MvNK4Ka/AlrMBLQ4PAlscUkiQkqqgWmHl2a98qWdAVb
  fcgtck/Y31nraeTTUv1L4PSP8lr+U556Hdg8Xd/9+07VYR7d2e1u2qX1D86WXibsStp6UfTXf
  XPFL0/zbsaZ6/M36oTxCeclHnzdzTrTY+sPrwg+O1i8vo1OMec1CRQ3nseSq5m/pOFvVzx//t
  n61xZLC45v32DHdv7QwIW9pUJfyBJ2nkhaflHQdhH5u3mfP5ckQeDGu8nqNwm/Fm5Oj+tdeuf
  7+kPSCEB33xcV64rrfvy4rWydhfKe1OHP1D5cct/WzRE98unb103z3aeu/Ra057vBz9QPHxdP
  NG0Uj2DMeiESymK9ub5M/LDsj4dS9c2a35i2etjpcwe3ZlljVDbcXGSuxFGckGmoxFxUnAgD7
  zJhZSQMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-22.tower-528.messagelabs.com!1639707839!16146!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 25148 invoked from network); 17 Dec 2021 02:24:00 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-22.tower-528.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 17 Dec 2021 02:24:00 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id BA2D51009E5
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 17 Dec 2021 02:23:59 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id AF14910024D
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 17 Dec 2021 02:23:59 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.26; Fri, 17 Dec 2021 02:23:39 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH v2] dnf-plugin-tui: Fix bug when generating CSV
 file
Date: Fri, 17 Dec 2021 10:23:31 +0800
Message-ID: <1639707811-38104-1-git-send-email-wangmy@fujitsu.com>
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
 <openembedded-devel@lists.openembedded.org>; Fri, 17 Dec 2021 02:24:03 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94415

If the rpm lacks dependencies, an exception will be thrown and exit
when generating the CSV file.
Modify utils.py to catch and handle exception.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-devtools/dnf-plugin-tui/dnf-plugin-tui_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/dnf-plugin-tui/dnf-plugin-tui_git.bb b/meta-oe/recipes-devtools/dnf-plugin-tui/dnf-plugin-tui_git.bb
index d2b1a4ab5..e0f52ea62 100644
--- a/meta-oe/recipes-devtools/dnf-plugin-tui/dnf-plugin-tui_git.bb
+++ b/meta-oe/recipes-devtools/dnf-plugin-tui/dnf-plugin-tui_git.bb
@@ -4,7 +4,7 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 SRC_URI = "git://github.com/ubinux/dnf-plugin-tui.git;branch=master;protocol=https"
-SRCREV = "4b49165051bfdd136986855dd98aa9238eefdf78"
+SRCREV = "3ccf87915ceb70eac055a07eb80bc9105e916620"
 PV = "1.3"
 
 SRC_URI:append:class-target = " file://oe-remote.repo.sample"
-- 
2.25.1


