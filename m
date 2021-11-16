Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19EB2C433F5
	for <webhook@archiver.kernel.org>; Tue, 16 Nov 2021 03:38:07 +0000 (UTC)
Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com
 [85.158.142.2])
 by mx.groups.io with SMTP id smtpd.web08.5246.1637033885727126629
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 Nov 2021 19:38:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=KOIifXxq;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.2,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1637033884; i=@fujitsu.com;
	bh=2Q58igfMhCymF7Oxjd/scggZ6fgz85cy0kUKxG2G0G4=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=KOIifXxqk3G3z7xhbbZTQyinL8f828ziiL7TlZvKE5XadGFNJn7oQ8vE04dUTTXyi
	 YF8Mfab8qG3n9a8+sPI75VLmLxJbKg0APUlYuE29obqyN/kNyA9HyqPnV1suHT742f
	 by+YCgaxRdyupoQO+ZlS+BpkuC/Pen/b78prNrqoukIzTUYi3KBWlyhthCKuUzH1EV
	 zi32VQQg4oigbTRhW5TdDEQ4bN/xM4ilOGE60UBDqTjaLOX/J8Io3M+94EhIi5u4EH
	 zh+M3ZPBlSSitNhnfpaYypFok51JjJnNcwyoDNeXLv446oPMPCtDMWnofkTB102PpU
	 AvVX8S1u8+ycQ==
Received: from [100.113.3.109] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-2.bemta.az-a.eu-central-1.aws.symcld.net id 16/41-32197-B9723916;
 Tue, 16 Nov 2021 03:38:03 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrAIsWRWlGSWpSXmKPExsViZ8ORqDtbfXK
  iwdM93BYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8aGxwfZC75yVryd8Y29gbGHs4uRi0NI4Amj
  xJmDP1ghnAtMEm+uHIRyTjBKzOo/ztbFyMnBJqAmMf3WDVYQW0RAX2Lp7D3MIDazgIrEi9897
  CC2sIC3xIafpxhBbBYBVYnbS68BxTk4eAWcJD68jgMJSwgoSEx5+B6slVdAUOLkzCcsEGMkJA
  6+eMEMUaMoMftyMwuEXSExa1YbE4StJnH13CbmCYz8s5C0z0LSvoCRaRWjRVJRZnpGSW5iZo6
  uoYGBrqGhsa6RrqmhXmKVbqJeaqlucmpeSVEiUFIvsbxYr7gyNzknRS8vtWQTIzAgUwqZjHcw
  Xnv9Qe8QoyQHk5Iob9yiSYlCfEn5KZUZicUZ8UWlOanFhxhlODiUJHgfqUxOFBIsSk1PrUjLz
  AFGB0xagoNHSYT3sipQmre4IDG3ODMdInWKUVFKnHerGlBCACSRUZoH1waLyEuMslLCvIwMDA
  xCPAWpRbmZJajyrxjFORiVhHl7QKbwZOaVwE1/BbSYCWix/b1+kMUliQgpqQamBfp7gzQOiE+
  rZLzdNm+pz5GOsLzDggwOK0UVKi5KbvZmdTwsF22utZnntt/+Fx/b3pcaO778NnFdaoNiz/uv
  dxskvx3YnNryNUPRpd+vqXJLe0H50ku2u+8eKb3lyVuY6+mjvjf3C//vdy639HbXvW0/5He/f
  Mafyw++XFt9jmW/3o5Dpl5mlYu949TuOSe/WsI0pyJsY19c8+Mj7Ec3uT6aKst0uND0jaqTUO
  mMxj+T6+1TtjbYpp9ov9XcraAl21Eq8OiF65XCCCWNndvkzad4dr8wDgp/J7jh2Y7g5b0MV6Z
  m9W37ZMcpX+qquMOlTvPDnuIckwknfB4c528/m/z5hbzv7hOi9tynS1SUWIozEg21mIuKEwE4
  +e4aQwMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-4.tower-228.messagelabs.com!1637033882!359153!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.5; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 30224 invoked from network); 16 Nov 2021 03:38:03 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-4.tower-228.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 16 Nov 2021 03:38:03 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id AA1EE100239
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Nov 2021 03:38:02 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 9945910022A
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Nov 2021 03:38:02 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.24; Tue, 16 Nov 2021 03:37:45 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-isort: upgrade 5.10.0 -> 5.10.1
Date: Tue, 16 Nov 2021 11:36:38 +0800
Message-ID: <1637033801-81290-1-git-send-email-wangmy@fujitsu.com>
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
 <openembedded-devel@lists.openembedded.org>; Tue, 16 Nov 2021 03:38:07 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93967

5.10.1 November 8 2021
Fixed #1819: Occasional inconsistency with multiple src paths.
Fixed #1840: skip_file ignored when on the first docstring line

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-isort_5.10.0.bb => python3-isort_5.10.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-isort_5.10.0.bb => python3-isort_5.10.1.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-isort_5.10.0.bb b/meta-python/recipes-devtools/python/python3-isort_5.10.1.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-isort_5.10.0.bb
rename to meta-python/recipes-devtools/python/python3-isort_5.10.1.bb
index 2eae82026c..5cb41c5fcf 100644
--- a/meta-python/recipes-devtools/python/python3-isort_5.10.0.bb
+++ b/meta-python/recipes-devtools/python/python3-isort_5.10.1.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 SECTION = "devel/python"
 LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=6;endline=6;md5=8227180126797a0148f94f483f3e1489"
 
-SRC_URI[sha256sum] = "e52ff6d38012b131628cf0f26c51e7bd3a7c81592eefe3ac71411e692f1b9345"
+SRC_URI[sha256sum] = "e8443a5e7a020e9d7f97f1d7d9cd17c88bcb3bc7e218bf9cf5095fe550be2951"
 
 inherit pypi setuptools3
 
-- 
2.25.1


