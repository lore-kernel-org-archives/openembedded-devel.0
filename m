Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76121C19F2C
	for <webhook@archiver.kernel.org>; Tue,  2 Aug 2022 13:40:02 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.66])
 by mx.groups.io with SMTP id smtpd.web09.6215.1659447594077038286
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 02 Aug 2022 06:39:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=W7uObV6f;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.66,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1659447592; i=@fujitsu.com;
	bh=uA/nkpBpyyrbAECeA5+nNemYrDZo90wBeQMzxlSjH2k=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=W7uObV6fHHJv59AOv5zMk7HNciSNd2USzhIebJEplRVkdYyaF0uU7f8jQ+6XGbB0l
	 gKIIHTh2ZLloEUWuoWYuGoSqJgtPcVfpZbqKQv1Xp3AFQXXTD1Qd3hOCf5JPJon/F6
	 TCe7HVpRw+5VA3GUlKTttiJGLowujTm7zt/mkaSg5+hlhgvuie3xUyys3nHmN8f7Z0
	 tP99voNqO9N6gXY8EkksRLrDUdZih9LN+7x8C7AwtRNWznlzAlLuFact7cAHE8hN7/
	 tNlEv8Bkf+8jNKYgKNpz5tPlOOxKW+mbqiTvGBIpz+42xkTvHhvxSbOaqaARqxUyqS
	 RVDXvTQw+gLmA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrOIsWRWlGSWpSXmKPExsViZ8OxWVdD82W
  Swd5WDouLh5cyOzB6nNu4gjGAMYo1My8pvyKBNWPJ4i1sBSc4Ky5M2srWwHiVo4uRi0NI4CGj
  xMYldxkhnCtMErM/XmOFcHYzSpy6PA0ow8nBJqAmMf3WDVYQW0RAX2Lp7D3MIDazgIrEi9897
  CC2sICdxJc1jWwgNgtQ/Ov6JWD1vAJOEk9OL2ABsSUEFCSmPHwP1ssp4Cxxq/0EWL0QUM39bV
  /YIeoFJU7OfMICMV9C4uCLF8wQvYoSsy83Q82pkJgxYxsbhK0mcfXcJuYJjIKzkLTPQtK+gJF
  pFaNVUlFmekZJbmJmjq6hgYGuoaGproGukYmxXmKVbqJeaqlueWpxia6hXmJ5sV5qcbFecWVu
  ck6KXl5qySZGYBinFDN83sG4oO+n3iFGSQ4mJVFeOcWXSUJ8SfkplRmJxRnxRaU5qcWHGGU4O
  JQkeG+pAuUEi1LTUyvSMnOAMQWTluDgURLhfacGlOYtLkjMLc5Mh0idYtTlmPm17QCzEEtefl
  6qlDjvLZAiAZCijNI8uBGw+L7EKCslzMvIwMAgxFOQWpSbWYIq/4pRnINRSZj3HsgUnsy8Erh
  Nr4COYAI6QofrBcgRJYkIKakGJgWl3y/OpezblPb8cePCp3O/G177+/nzlegnHAf9w/t0rnXZ
  v/Zu/nd7/eGzp+ccZsrhCH+9mH3br+W5P/q+HrdfduP2jugp7JnLfQSnn9CbV9jb6xOuYilt5
  Oy/c1/aNesNG3yWT/rnIXHb+RjbDqlVP9uX1yv/q18ve/m04b+frfIiSTobmL6b9t8595Npk0
  LpjFkz1bqu6wYmJn3K8WrxnfNkl/2KJ9LF+evrLrXulp+Q8jRrq2nx/uT3pjfOVLX1f/f3z2g
  rMDpTvUv2tLH7y3uCBUcuaPStYPAK/MM14dKeuoy31UnrP+rdPlr1rvFHxOx/UbHmcWvafO6L
  LDF6U+WcPr26aFtR5kJfSUslluKMREMt5qLiRABlnWloagMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-6.tower-591.messagelabs.com!1659447591!69301!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 12658 invoked from network); 2 Aug 2022 13:39:52 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-6.tower-591.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 2 Aug 2022 13:39:52 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id BD0F1153
	for <openembedded-devel@lists.openembedded.org>;
 Tue,  2 Aug 2022 14:39:51 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id B0F4614C
	for <openembedded-devel@lists.openembedded.org>;
 Tue,  2 Aug 2022 14:39:51 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 2 Aug 2022 14:39:50 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-gnome] [PATCH] gedit: upgrade 42.1 -> 42.2
Date: Tue, 2 Aug 2022 21:39:30 +0800
Message-ID: <1659447571-24348-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1659447571-24348-1-git-send-email-wangmy@fujitsu.com>
References: <1659447571-24348-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 02 Aug 2022 13:40:02 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98086

Changelog:
==========
* Fix bug: text cut off at the bottom in certain situations.
* Translation updates.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-gnome/recipes-gnome/gedit/{gedit_42.1.bb => gedit_42.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/gedit/{gedit_42.1.bb => gedit_42.2.bb} (91%)

diff --git a/meta-gnome/recipes-gnome/gedit/gedit_42.1.bb b/meta-gnome/recipes-gnome/gedit/gedit_42.2.bb
similarity index 91%
rename from meta-gnome/recipes-gnome/gedit/gedit_42.1.bb
rename to meta-gnome/recipes-gnome/gedit/gedit_42.2.bb
index 3efd2a9b35..13d3e0af79 100644
--- a/meta-gnome/recipes-gnome/gedit/gedit_42.1.bb
+++ b/meta-gnome/recipes-gnome/gedit/gedit_42.2.bb
@@ -21,7 +21,7 @@ inherit gnomebase gsettings itstool gnome-help gobject-introspection gtk-doc val
 def gnome_verdir(v):
     return oe.utils.trim_version(v, 1)
 
-SRC_URI[archive.sha256sum] = "7f1fd43df5110d4c37de6541993f41f0fbc3efc790900e92053479ba069920e9"
+SRC_URI[archive.sha256sum] = "3c6229111f0ac066ae44964920791d1265f5bbb56b0bd949a69b7b1261fc8fca"
 
 # gobject-introspection is mandatory and cannot be configured
 REQUIRED_DISTRO_FEATURES = "gobject-introspection-data"
-- 
2.25.1


