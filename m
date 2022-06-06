Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9C85C433EF
	for <webhook@archiver.kernel.org>; Mon,  6 Jun 2022 12:19:54 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.1])
 by mx.groups.io with SMTP id smtpd.web12.31156.1654517989465134010
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 06 Jun 2022 05:19:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=QFZbkCMm;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.1,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1654517987; i=@fujitsu.com;
	bh=jH9nCCdkrn1R64qGxhHUXFSVX/aatZRIw3utCuAtp74=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=QFZbkCMmQ+nghiN8JHdDBaoCgBqNG3Tx1dDjBoFhXQ4upJak+GJhyzd+srJ0MVGED
	 Bn1NGv2aDpaKie2gmifIud7M+UbWiEcHoSPr76RsoXoENzDXi0YKYePAlOIgP+d6PG
	 qjwmDkXO9Lrk0a9jT3zT+rn16VVdTtMn0IFMAGLOLXL0nceYtO8CyHFls6U2Vc6vbK
	 kNr2TtJY7HLwqsc0ruuwDZPHmCAM/ZVcVmc0NjBbMS7ZuOsIWaWPqsWHYC+xPfW+up
	 xOMhWk+rtp873TH2vxD6fSwY/X4g62WcK55T3YDr+okRwIId5WS09L3JcCByRe1iiH
	 XMScyFIKJE56A==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrMIsWRWlGSWpSXmKPExsViZ8ORqPv4w9w
  kg6M7FSwuHl7K7MDocW7jCsYAxijWzLyk/IoE1oyL96YxF+wQqrj5fC5LA+N5gS5GLg4hgSeM
  Ep/nP2aGcC4wSdz728wK4exmlLg7vQMow8nBJqAmMf3WDVYQW0RAX2Lp7D1gcWYBFYkXv3vYQ
  WxhAW+JHcsmM4LYLEDx+d8bwGxeAUeJtm8rwGwJAQWJKQ/fg/VyCjhJ7Ji3GqxXCKhm+9cjbB
  D1ghInZz5hgZgvIXHwxQtmiF5FidmXm1kg7AqJGTO2sUHYahJXz21insAoOAtJ+ywk7QsYmVY
  xWiUVZaZnlOQmZuboGhoY6BoamuoaW+qaGuklVukm6qWW6panFpfoArnlxXqpxcV6xZW5yTkp
  enmpJZsYgWGcUqxusoOxe+VPvUOMkhxMSqK89tfmJgnxJeWnVGYkFmfEF5XmpBYfYpTh4FCS4
  K0DRoaQYFFqempFWmYOMKZg0hIcPEoivNbvgNK8xQWJucWZ6RCpU4yWHFNn/9vPzLEcTM782n
  aAWYglLz8vVUqc99Z7oAYBkIaM0jy4cbC4v8QoKyXMy8jAwCDEU5BalJtZgir/ilGcg1FJmLc
  YZApPZl4J3NZXQAcxAR3k82AOyEEliQgpqQYm0XvfuX/72v76eiN2D/MVgy+RjhWqPyP8lW8k
  iFzy1ntwoeyC/5TAbcr7nebrb/wmK+jps3fh2slHHlVY23xq+1v8izXC03ma92cBmacKzlMjW
  WSme3rZm5s/UPT3Tm84PyV3catHamjAnWf/iy/sVl2l5Tz5W4/RRx2Xu2c0Tgb+XKWgmFQm+N
  0vreSNzf6VJy+fSwk6GGdfuL5M7p2+7q/3Fp+OO59OtWt8z/XSS3b+iQpV5UB5YY7DgdMM5dc
  w+p4xdV90aMcRad0Fx68Gtpyeml+uL821LXvOlRiXxZMq/2/MP/V2p8upCqY8Q9fUte8V9EMu
  llmzN8v/Pe/++4rTvMR/RXpPHdjdCm4rsRRnJBpqMRcVJwIA7QTgFnYDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-11.tower-571.messagelabs.com!1654517987!411720!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 6438 invoked from network); 6 Jun 2022 12:19:47 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-11.tower-571.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 6 Jun 2022 12:19:47 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 2750B10018B
	for <openembedded-devel@lists.openembedded.org>;
 Mon,  6 Jun 2022 13:19:47 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id E6C191001B5
	for <openembedded-devel@lists.openembedded.org>;
 Mon,  6 Jun 2022 13:19:46 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 6 Jun 2022 13:19:44 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH] tinyproxy: upgrade 1.11.0 -> 1.11.1
Date: Mon, 6 Jun 2022 20:19:08 +0800
Message-ID: <1654517949-9033-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1654517949-9033-1-git-send-email-wangmy@fujitsu.com>
References: <1654517949-9033-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 06 Jun 2022 12:19:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97417

Refresh disable-documentation.patch for new version.

Changelog:
Fixes issues detected in 1.11.0, add new fnmatch based filtertype.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../tinyproxy/tinyproxy/disable-documentation.patch           | 4 ++--
 .../tinyproxy/{tinyproxy_1.11.0.bb => tinyproxy_1.11.1.bb}    | 3 +--
 2 files changed, 3 insertions(+), 4 deletions(-)
 rename meta-networking/recipes-support/tinyproxy/{tinyproxy_1.11.0.bb => tinyproxy_1.11.1.bb} (89%)

diff --git a/meta-networking/recipes-support/tinyproxy/tinyproxy/disable-documentation.patch b/meta-networking/recipes-support/tinyproxy/tinyproxy/disable-documentation.patch
index af99edcb5..364baaa00 100644
--- a/meta-networking/recipes-support/tinyproxy/tinyproxy/disable-documentation.patch
+++ b/meta-networking/recipes-support/tinyproxy/tinyproxy/disable-documentation.patch
@@ -23,7 +23,7 @@ diff --git a/configure.ac b/configure.ac
 index 3849383..9f3a633 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -190,18 +190,6 @@ AC_SUBST(CPPFLAGS)
+@@ -179,18 +179,6 @@ AC_SUBST(CPPFLAGS)
  AC_SUBST(LIBS)
  AC_SUBST(ADDITIONAL_OBJECTS)
  
@@ -42,7 +42,7 @@ index 3849383..9f3a633 100644
  AM_CONDITIONAL(HAVE_POD2MAN, test "x$POD2MAN" != "x" -a "x$POD2MAN" != "xno")
  
  AC_PATH_PROG(GPERF, gperf, no)
-@@ -226,11 +214,6 @@ src/Makefile
+@@ -216,11 +204,6 @@ src/Makefile
  data/Makefile
  data/templates/Makefile
  etc/Makefile
diff --git a/meta-networking/recipes-support/tinyproxy/tinyproxy_1.11.0.bb b/meta-networking/recipes-support/tinyproxy/tinyproxy_1.11.1.bb
similarity index 89%
rename from meta-networking/recipes-support/tinyproxy/tinyproxy_1.11.0.bb
rename to meta-networking/recipes-support/tinyproxy/tinyproxy_1.11.1.bb
index 388f7aecb..86f57d88f 100644
--- a/meta-networking/recipes-support/tinyproxy/tinyproxy_1.11.0.bb
+++ b/meta-networking/recipes-support/tinyproxy/tinyproxy_1.11.1.bb
@@ -9,8 +9,7 @@ SRC_URI = "https://github.com/${BPN}/${BPN}/releases/download/${PV}/${BP}.tar.gz
            file://tinyproxy.conf \
            "
 
-SRC_URI[md5sum] = "658db5558ffb849414341b756a546a99"
-SRC_URI[sha256sum] = "20f74769e40144e4d251d2977cc4c40d2d428a2bec8c1b8709cd07315454baef"
+SRC_URI[sha256sum] = "1574acf7ba83c703a89e98bb2758a4ed9fda456f092624b33cfcf0ce2d3b2047"
 
 UPSTREAM_CHECK_URI = "https://github.com/tinyproxy/tinyproxy/releases"
 
-- 
2.25.1


