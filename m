Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1AC9FECAAA1
	for <webhook@archiver.kernel.org>; Mon,  5 Sep 2022 09:02:42 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com
 [85.158.142.2])
 by mx.groups.io with SMTP id smtpd.web09.22579.1662368556328654071
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 05 Sep 2022 02:02:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=s99xciIM;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.2,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1662368554; i=@fujitsu.com;
	bh=1sGe0uyjtjJeR86rJNxeQHdtIfJMhTlzgZm/a/ePUVY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=s99xciIMnWb5kUVNqCn/52V6fVRr2nF3tIVRkGU6ZhfilEsdkE1xZYAMKW8ABipRp
	 r7KQgce7vwvhXBzPUf5WZFlsdXA+46VargY1muDWVi0zTOrGdqVp0ScvpQJKfY8+zP
	 UMh9YLHzGEXeCxU+gqEbeFA/opHPg/yJDo6Xkcn/H0q+CMICBOYpi81FNw3GNMLzBj
	 0K1qxslmm6YQzEDxeSiTS3DQU2jE/4pIf9Ll1HriTPYa0x7TQ5gfRJFy2JSDYpkRbl
	 ZB9HeTo3OjgaPWyEfBrdSqy35tB5Wc4ksKEDTm05riKvkghjY8J/AHzyn4VC31HXgM
	 hLFXhZfMlxWUg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrBIsWRWlGSWpSXmKPExsViZ8OxWVdzt2i
  ywdLfRhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8by7zOZCzZwVLzte8HSwHiHvYuRi0NI4CGj
  xMZbCxkhnCtMEm8m9EE5uxklFu1rASrj5GATUJOYfusGK4gtIqAvsXT2HmYQm1lAReLF7x6wG
  mEBf4n5Py+wgdgsQPGz+z4wgti8Ak4SJ1tOgvVKCChITHn4HqiXg4NTwFniSpMbSFgIqOTxqx
  dQ5YISJ2c+YYEYLyFx8MULZohWRYnZl5tZIOwKicbph5ggbDWJq+c2MU9gFJyFpH0WkvYFjEy
  rGG2SijLTM0pyEzNzdA0NDHQNDU11Lc10DY0N9RKrdBP1Ukt18/KLSjJ0gfzyYr3U4mK94src
  5JwUvbzUkk2MwEBOKU5o3sF4b98vvUOMkhxMSqK87+eIJgvxJeWnVGYkFmfEF5XmpBYfYpTh4
  FCS4F25AygnWJSanlqRlpkDjCqYtAQHj5IIr/86oDRvcUFibnFmOkTqFKMux8yvbQeYhVjy8v
  NSpcR5N4HMEAApyijNgxsBi/BLjLJSwryMDAwMQjwFqUW5mSWo8q8YxTkYlYR5uUCm8GTmlcB
  tegV0BBPQEXZ9wiBHlCQipKQamMQKrA+cMizZnF7qHvbu7PPWSEuphNm793R9XrlVK/SFZScL
  a5Sw47JUho7DkQa8z6tbOP4XNc1fe2zu1J1KNuGHAmWFT676vTTMMM3QRXNG6IHnE2NOVV090
  WAuFKZz+MXHU4wTUtfudOUzPHtLceOeVRuMb/LFv/kmatb6p2dR8L6MHL2eBcdXCN1z29SxcO
  GUqSdcz3Zczly718I2J0xlQXWx7d89Ka3TvtoWHtrH+PiVX+je+G2Pi072JhaVhe4TPyelrJC
  SdnD6/y011RvaVm9MP+kzcd9bEcl1xvLPa1l80696XOjy/vWoZWL74fL9C104mg9FdwhPZUu8
  7vGy0vr6uZdv/ugq353aoKrEUpyRaKjFXFScCAA8vQGjawMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-9.tower-745.messagelabs.com!1662368553!260965!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 10744 invoked from network); 5 Sep 2022 09:02:33 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-9.tower-745.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 5 Sep 2022 09:02:33 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id 36A67151
	for <openembedded-devel@lists.openembedded.org>;
 Mon,  5 Sep 2022 10:02:33 +0100 (BST)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121
 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id 29A1A150
	for <openembedded-devel@lists.openembedded.org>;
 Mon,  5 Sep 2022 10:02:33 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 5 Sep 2022 10:02:31 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] ctags: upgrade 5.9.20220821.0 ->
 5.9.20220828.0
Date: Mon, 5 Sep 2022 17:02:07 +0800
Message-ID: <1662368529-32226-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1662368529-32226-1-git-send-email-wangmy@fujitsu.com>
References: <1662368529-32226-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 05 Sep 2022 09:02:42 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98662

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../ctags/{ctags_5.9.20220821.0.bb => ctags_5.9.20220828.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/ctags/{ctags_5.9.20220821.0.bb => ctags_5.9.20220828.0.bb} (95%)

diff --git a/meta-oe/recipes-devtools/ctags/ctags_5.9.20220821.0.bb b/meta-oe/recipes-devtools/ctags/ctags_5.9.20220828.0.bb
similarity index 95%
rename from meta-oe/recipes-devtools/ctags/ctags_5.9.20220821.0.bb
rename to meta-oe/recipes-devtools/ctags/ctags_5.9.20220828.0.bb
index 31f493506b..7fd0a839ca 100644
--- a/meta-oe/recipes-devtools/ctags/ctags_5.9.20220821.0.bb
+++ b/meta-oe/recipes-devtools/ctags/ctags_5.9.20220828.0.bb
@@ -14,7 +14,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
 
 inherit autotools-brokensep pkgconfig manpages
 
-SRCREV = "40551e21c507c2426a323373f3ff200799150429"
+SRCREV = "dfffd3d8e18183e0e9131f2c301e18f78866ceb5"
 SRC_URI = "git://github.com/universal-ctags/ctags;branch=master;protocol=https"
 
 S = "${WORKDIR}/git"
-- 
2.25.1


