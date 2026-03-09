Return-Path: <andrej.kozemcak@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61E63EFCD95
	for <webhook@archiver.kernel.org>; Mon,  9 Mar 2026 10:06:44 +0000 (UTC)
Received: from mta-64-225.siemens.flowmailer.net (mta-64-225.siemens.flowmailer.net [185.136.64.225])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10756.1773050799737600479
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 Mar 2026 03:06:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=andrej.kozemcak@siemens.com header.s=fm1 header.b=ThwWcWNg;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.225, mailfrom: fm-1334352-2026030910063600ef3756810002075e-pz6qaa@rts-flowmailer.siemens.com)
Received: by mta-64-225.siemens.flowmailer.net with ESMTPSA id 2026030910063600ef3756810002075e
        for <openembedded-devel@lists.openembedded.org>;
        Mon, 09 Mar 2026 11:06:37 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=andrej.kozemcak@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=IJtovI93ENO4cvsaEtH6+WQ3UFWuZY4k2/9rFckUFsM=;
 b=ThwWcWNgz/fzKoMj425nNz0UpVR//a2sj4PF4IQNkKNkwuX3fyF4oyErQu4n2biDf4WXhP
 t+OJjwt4xsc/X10K+jQAKTCyt2yjpNWRkw6gasV/+w7yVUN+Nj58JJoroOqLjkdk0V1FcNVm
 sIqxBtK5+n39v/IOVEJokup7/4j7ScQseCkty01UjCNtVb0xklff8T0kRHrQocIpfPot4Qjt
 N0L10+3/+SSa5ccLdyHSx9KurWDH1JoSexE/DS1BimUXTT4SMlMQgr8XbNRAlI87VUgWUT6O
 RdN/tqJS0VZ7GHViAyoRdspJxW3gcDeLLqNIJcm5c9DJNm95KuiQk87Q==;
From: Andrej Kozemcak <andrej.kozemcak@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Andrej Kozemcak <andrej.kozemcak@siemens.com>
Subject: [meta-oe][PATCH 01/14] asio: upgrade 1.30.2 -> 1.36.0
Date: Mon,  9 Mar 2026 11:06:17 +0100
Message-ID: <20260309100630.404637-1-andrej.kozemcak@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1334352:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 09 Mar 2026 10:06:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124973

License-Update: copyright years refreshed

Changelogs:

Asio 1.36.0:
  https://think-async.com/Asio/asio-1.36.0/doc/asio/history.html#asio.history.asio_1_36_0

- Fixed an issue, introduced in Asio 1.35.0, that prevented the creation of internal threads required for running some asynchronous operations on a thread_pool.
- Fixed co_spawn to adhere to the asynchronous operation requirement for non-reentrant invocation of the completion handler.
- Added the [[noreturn]] attribute to asio::detail::throw_exception.
- Fixed compilation errors in channel<void(error_code)> and concurrent_channel<void(error_code)>.
- Fixed a compilation issue with the Bullseye compiler.
- Fixed an awaitable coroutine compile error with the clang shipped with MSVC.
- Fixed support for platforms that don't define SA_NOCLDWAIT.
- Worked around a warning that occurs when building with _FORTIFY_SOURCE on recent g++.
- Added a documentation note on basic_signal_set async signal safety.

Asio 1.35.0:
  https://think-async.com/Asio/asio-1.36.0/doc/asio/history.html#asio.history.asio_1_35_0

Asio 1.34.2:
  https://think-async.com/Asio/asio-1.36.0/doc/asio/history.html#asio.history.asio_1_34_2

Asio 1.34.1:
  https://think-async.com/Asio/asio-1.36.0/doc/asio/history.html#asio.history.asio_1_34_1

Asio 1.34.0:
  https://think-async.com/Asio/asio-1.36.0/doc/asio/history.html#asio.history.asio_1_34_0

Asio 1.33.0:
  https://think-async.com/Asio/asio-1.36.0/doc/asio/history.html#asio.history.asio_1_33_0

Asio 1.32.0:
  https://think-async.com/Asio/asio-1.36.0/doc/asio/history.html#asio.history.asio_1_32_0

Asio 1.31.0:
  https://think-async.com/Asio/asio-1.36.0/doc/asio/history.html#asio.history.asio_1_31_0

Signed-off-by: Andrej Kozemcak <andrej.kozemcak@siemens.com>
---
 .../recipes-support/asio/{asio_1.30.2.bb => asio_1.36.0.bb}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/asio/{asio_1.30.2.bb => asio_1.36.0.bb} (86%)

diff --git a/meta-oe/recipes-support/asio/asio_1.30.2.bb b/meta-oe/recipes-support/asio/asio_1.36.0.bb
similarity index 86%
rename from meta-oe/recipes-support/asio/asio_1.30.2.bb
rename to meta-oe/recipes-support/asio/asio_1.36.0.bb
index 1f492b71eb..d196a35c69 100644
--- a/meta-oe/recipes-support/asio/asio_1.30.2.bb
+++ b/meta-oe/recipes-support/asio/asio_1.36.0.bb
@@ -17,9 +17,9 @@ inherit autotools ptest
 
 ALLOW_EMPTY:${PN} = "1"
 
-LIC_FILES_CHKSUM = "file://COPYING;md5=2bfc909e030aeafefa72f764165b8d07"
+LIC_FILES_CHKSUM = "file://COPYING;md5=92db288d8a7d89bb9c5821c447c3052c"
 
-SRC_URI[sha256sum] = "9f12cef05c0477eace9c68ccabd19f9e3a04b875d4768c323714cbd3a5fa3c2b"
+SRC_URI[sha256sum] = "7bf4dbe3c1ccd9cc4c94e6e6be026dcc2110f9201d286bb9500dc85d69825524"
 
 PACKAGECONFIG ??= "boost"
 
-- 
2.47.3


