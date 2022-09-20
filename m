Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9F2AC54EE9
	for <webhook@archiver.kernel.org>; Tue, 20 Sep 2022 02:15:14 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.66])
 by mx.groups.io with SMTP id smtpd.web08.7238.1663640108856884041
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Sep 2022 19:15:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=Amr0pEyv;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.66,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1663640107; i=@fujitsu.com;
	bh=7w4RnTw++T4jNihNcp56xfthUXsxezkpbfOMu9H4bDo=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=Amr0pEyv5ZyGbm1hKcFnjqNzxeXbr9y+t/7gNb+z69zsuyORir/FtUYJKLXcFGQeU
	 Vbg+6Cc9UtD+XA0/eL2lJrVHrxgN3eeASH1yt/K1Yb7vV/BFIFr+pwvgnDzubmgakA
	 yB3oQExmdWdZsVfOTIqesO9Dro+RsR+L3UWUszOnaxWnzAPWNd2ytkipWu4fupqIxH
	 I0GYH7/b0CQ/hoI7df9yR0kzO7WBjpPxGHLne/SIYPRSnmGGc4e08/WECHiXoHjvby
	 s+8V2QF5Y11Gz4cXdz6B9p2fI/fuqclacB621eQqDNfD5B+GSzDZrn5DhAIH8FZwyS
	 Jbj69DfOhzeOw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrDIsWRWlGSWpSXmKPExsViZ8ORqKulpJl
  s8P+UlsXFw0uZHRg9zm1cwRjAGMWamZeUX5HAmrH+6Q7GgnucFb09p9kbGI9wdDFycQgJPGGU
  WLr5CiOEc51JYt/9A0xdjJxAzh5GifdXC0FsNgE1iem3brCC2CIC+hJLZ+9hBrGZBVQkXvzuY
  QexhQUcJBaducHSxcjBwSKgKjH7ohBImFfASeLD/A4WEFtCQEFiysP3zBBxQYmTM5+wQIyRkD
  j44gUzRI2ixOzLzVD1FRKN0w8xQdhqElfPbWKewMg/C0n7LCTtCxiZVjFaJhVlpmeU5CZm5ug
  aGhjoGhqa6hrqmlrqJVbpJuqlluqWpxaX6BrqJZYX66UWF+sVV+Ym56To5aWWbGIEBmRKMaP1
  DsaOvp96hxglOZiURHm56jSShfiS8lMqMxKLM+KLSnNSiw8xynBwKEnw2gtqJgsJFqWmp1akZ
  eYAowMmLcHBoyTCyyYFlOYtLkjMLc5Mh0idYtTluHrlyl5mIZa8/LxUKXHeFAWgIgGQoozSPL
  gRsEi9xCgrJczLyMDAIMRTkFqUm1mCKv+KUZyDUUmYN1wOaApPZl4J3KZXQEcwAR1xQ0Ud5Ii
  SRISUVAOTZ9yLGJEVeW+eFVzeojyZ5/XZd/+EOb+8OuArtXWNy9MDHDJiLC+CkqU5NidmpeY/
  2yT3lNvEImTKxdo5xlvfXSsPZX1VOX323c0W764+K09r0nI6UeT6yldUbn6HmftNjbv3u/mPT
  FnRwSFRlWFX3M5sOkuvNK4253nKqr2Hl375u/ZUxMfV94IeCKTxtzAXdl/Vi/q2IH6V9Zauva
  u/vvoQYW2TfD7JefKkb91zu7a8uaasfXrlPVYOk/MCm46/f7esLuSyVoUdq21VjtwkkziDB+/
  Vd3muntOs5HPeNayw2oJnl8HrwLmhLDL3b/IxtHt8tZkb8rs9+9fOSWcCQy7pp3csiHoSb+Dw
  WVZGiaU4I9FQi7moOBEArLwICU8DAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-4.tower-591.messagelabs.com!1663640106!302768!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 30073 invoked from network); 20 Sep 2022 02:15:06 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-4.tower-591.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 20 Sep 2022 02:15:06 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 514FB10019A
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 Sep 2022 03:15:06 +0100 (BST)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121
 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 455AB100197
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 Sep 2022 03:15:06 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 20 Sep 2022 03:15:04 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] libxmlb: upgrade 0.3.9 -> 0.3.10
Date: Tue, 20 Sep 2022 10:14:52 +0800
Message-ID: <1663640092-27069-1-git-send-email-wangmy@fujitsu.com>
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
 <openembedded-devel@lists.openembedded.org>; Tue, 20 Sep 2022 02:15:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98874

Bugfixes:
 - Fix dumping and exporting multiple files from the CLI
 - Watch files before loading them into the builder
 - Fix potential double free when filtering by language

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libxmlb/{libxmlb_0.3.9.bb => libxmlb_0.3.10.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-gnome/libxmlb/{libxmlb_0.3.9.bb => libxmlb_0.3.10.bb} (91%)

diff --git a/meta-oe/recipes-gnome/libxmlb/libxmlb_0.3.9.bb b/meta-oe/recipes-gnome/libxmlb/libxmlb_0.3.10.bb
similarity index 91%
rename from meta-oe/recipes-gnome/libxmlb/libxmlb_0.3.9.bb
rename to meta-oe/recipes-gnome/libxmlb/libxmlb_0.3.10.bb
index 4c5f0cfa39..1f5310ca16 100644
--- a/meta-oe/recipes-gnome/libxmlb/libxmlb_0.3.9.bb
+++ b/meta-oe/recipes-gnome/libxmlb/libxmlb_0.3.10.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=1803fa9c2c3ce8cb06b4861d75310742"
 SRC_URI = "git://github.com/hughsie/libxmlb.git;branch=main;protocol=https \
            file://run-ptest \
            "
-SRCREV = "c308e39ccad6673e216f92d08b3782a4ffcb23ad"
+SRCREV = "a6cac6a715d57c393bbddee4d0381ad943341af9"
 S = "${WORKDIR}/git"
 
 inherit gobject-introspection gtk-doc meson ptest-gnome lib_package
-- 
2.25.1


