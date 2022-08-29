Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15AACECAAD2
	for <webhook@archiver.kernel.org>; Mon, 29 Aug 2022 06:38:14 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com
 [85.158.142.113])
 by mx.groups.io with SMTP id smtpd.web10.67719.1661755085488476803
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 28 Aug 2022 23:38:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=WyfbwfTR;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.113,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1661755083; i=@fujitsu.com;
	bh=EQR/Nl438g9gV3haqxDQ9UHFx/Nbh5qVcX+07y8fUto=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=WyfbwfTRYqF7irKkOpx/0ZAJolTll4HO+BxH9rpB9pljVXfKPtg30k8TicNbXPBBW
	 S4CoOAErLnFdo8hChLjnecaj6+MQZY1PuhzR+dHNYzYJfzPVgq0y3kAbZoDk/NtDNB
	 6cU6F5fNyc8v84VbLyS6ia691H4FuLIWVJbN5fogCZANPhOv7iUt5pJM/D864bDTKI
	 hJN81YoN2RWGonCUfQEQhPHRdwtmmPRrNXb8xHe37P+O9q43msuisVhgSCH3QvpLwz
	 Z5zmpjKBhOB1wlg2MpWR1i1wkPiyhQ7YjDBsB25ImAHIc8/z0HTkgjz9CxmxnfZKFv
	 e0VZDKjaoJNhA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrHIsWRWlGSWpSXmKPExsViZ8ORqHs6jif
  ZYNo6bouLh5cyOzB6nNu4gjGAMYo1My8pvyKBNePem92MBXu4KhrmVDYw7uDsYuTiEBJ4wijR
  8LWPFcK5wSRxbskdJghnL6NE3+bNQA4nB5uAmsT0WzdYQWwRAX2JpbP3MIPYzAIqEi9+97CD2
  MICthKHFn0Dq2ERUJVoujQbrIZXwFHi/KJ1YDUSAgoSUx6+B4tzCjhJtO9cyAZiCwHVLL71gR
  2iXlDi5MwnLBDzJSQOvnjBDNGrKDH7cjMLhF0psWdWPxOErSZx9dwm5gmMgrOQtM9C0r6AkWk
  Vo01SUWZ6RkluYmaOrqGBga6hoamupZmuoaWxXmKVbqJeaqluXn5RSYauoV5iebFeanGxXnFl
  bnJOil5easkmRmAgpxQnHNzBuGLfL71DjJIcTEqivCbmPMlCfEn5KZUZicUZ8UWlOanFhxhlO
  DiUJHgdY4FygkWp6akVaZk5wKiCSUtw8CiJ8F4ASfMWFyTmFmemQ6ROMRpzXL1yZS8zx8yvbQ
  eYhVjy8vNSpcR52YHxKiQAUppRmgc3CBbtlxhlpYR5GRkYGIR4ClKLcjNLUOVfMYpzMCoJ814
  BWciTmVcCt+8V0ClMQKc8XMINckpJIkJKqoFJLXFthGFv6J5vEUe8LkdFuf+uvK2S1bC+41PF
  hC8zn0dU+OZ/W5hkznB9Yig/S4thijebSFvocq6fla4T1Hmnz8hbmB0rmhwUYO2rzSNW/2Xt+
  nWmJvrx5lPD/HeJPaqc0/mjm0/Bc8P7fX+dHsz2uOSl8YT72h65nbcDYg7fmHPIYHk0W26J80
  /HIyVh4elPfuS3GkTVh4n/tXY3dtjRUq97z2bBc65Ua9EjC+9m/NA+vMHmxJ8wUel/vAGdVco
  BRfLBZSXXuXa6/PW7bXcrKtdVnO+hzt/PwXv3xVyMmH2cNemQZfa2rNwp6+MNLXbu+Ovrbi9k
  Lnh7y6J9FaelN+78I14w/arTdZ4FUUosxRmJhlrMRcWJAL5ap8dxAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-15.tower-745.messagelabs.com!1661755082!139065!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 24123 invoked from network); 29 Aug 2022 06:38:03 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-15.tower-745.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 29 Aug 2022 06:38:03 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 927A610019A
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 29 Aug 2022 07:38:02 +0100 (BST)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223
 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 85E4E100191
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 29 Aug 2022 07:38:02 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 29 Aug 2022 07:38:00 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] bdwgc: upgrade 8.2.0 -> 8.2.2
Date: Mon, 29 Aug 2022 14:37:36 +0800
Message-ID: <1661755059-4785-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1661755059-4785-1-git-send-email-wangmy@fujitsu.com>
References: <1661755059-4785-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 29 Aug 2022 06:38:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98506

License-Update: Format of license file changed

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../bdwgc/{bdwgc_8.2.0.bb => bdwgc_8.2.2.bb}                | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-support/bdwgc/{bdwgc_8.2.0.bb => bdwgc_8.2.2.bb} (86%)

diff --git a/meta-oe/recipes-support/bdwgc/bdwgc_8.2.0.bb b/meta-oe/recipes-support/bdwgc/bdwgc_8.2.2.bb
similarity index 86%
rename from meta-oe/recipes-support/bdwgc/bdwgc_8.2.0.bb
rename to meta-oe/recipes-support/bdwgc/bdwgc_8.2.2.bb
index 7ee63b1332..622402a04a 100644
--- a/meta-oe/recipes-support/bdwgc/bdwgc_8.2.0.bb
+++ b/meta-oe/recipes-support/bdwgc/bdwgc_8.2.2.bb
@@ -19,12 +19,12 @@ DESCRIPTION = "The Boehm-Demers-Weiser conservative garbage collector can be\
 HOMEPAGE = "http://www.hboehm.info/gc/"
 SECTION = "devel"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://README.QUICK;md5=7912d9213b3547f8a81aadd08893fe84"
+LIC_FILES_CHKSUM = "file://README.QUICK;md5=dd27361ad00943bb27bc3e0589037075"
 
 DEPENDS = "libatomic-ops"
 
-SRCREV = "47e9106c17b72e9ee5501308f69ea94531e798b3"
-SRC_URI = "git://github.com/ivmai/bdwgc.git;branch=master;protocol=https"
+SRCREV = "cd1fbc1dbfd2cc888436944dd2784f39820698d7"
+SRC_URI = "git://github.com/ivmai/bdwgc.git;branch=release-8_2;protocol=https"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1


