Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D629C47089
	for <webhook@archiver.kernel.org>; Mon, 28 Nov 2022 06:25:58 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.1])
 by mx.groups.io with SMTP id smtpd.web10.111562.1669616752835736726
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 27 Nov 2022 22:25:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=NGI1uOd4;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.1, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1669616751; i=@fujitsu.com;
	bh=hdqYUaEYR9HeRi8L5UHVjo/j3dEwEfwa60r9AJTKHNA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=NGI1uOd4aQ9vq49qsJi+V+3XTyqejvXf05lN+M8Uq+gF5MQew2T3ZLcwagGDXSGRO
	 O4u4GKFZIJ/IcvZRWAdnFxF6MZDK28fvrm1xpNgO4uliSZZiy1GHLuzxYLvfMpOp8m
	 dLJKeVhsdMjsBzF8+DTSJTbWEhpPmcBPZwey56AbocbgZ6i0TLv3iaId/4nyGC2S9c
	 VfVw2Fo8fSKdXcJWROkr49WvPUcLMKsbcJGWnv0NWdwVtwYpbVggTQ7NIL9TBuCbjf
	 imvLimTYgkpS/tQGHihyn0eDkc93Yr7liWzvrAyyjExKq/EDUQNEh10STl8AgAU3Xg
	 /lnkW/9ZFkb2A==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrGIsWRWlGSWpSXmKPExsViZ8ORpJsX0pJ
  s8PGtpsXFw0uZHRg9zm1cwRjAGMWamZeUX5HAmtG47y9rwR7Riv2NbxgbGM8JdTFycQgJPGSU
  WPv5ORuEc4VJ4sWi26wQzh5GiW9XtwA5nBxsAlISN+7/ZwOxRQT0JZbO3sMMYjMLqEi8+N3DD
  mILCzhIbOudxwJiswioSrzZ+BUszivgJHGh6QiYLSGgIDHl4XuwXk4BZ4kZp+6CzRcCqtm2qo
  UVol5Q4uTMJywQ8yUkDr54wQzRqygx+3IzC4RdITFrVhsThK0mcfXcJuYJjIKzkLTPQtK+gJF
  pFaNpcWpRWWqRrrleUlFmekZJbmJmjl5ilW6iXmqpbnlqcYmukV5iebFeanGxXnFlbnJOil5e
  askmRmDwphSrWuxgXL/sj94hRkkOJiVR3o+BLclCfEn5KZUZicUZ8UWlOanFhxhlODiUJHjng
  uQEi1LTUyvSMnOAkQSTluDgURLhXWwPlOYtLkjMLc5Mh0idYlSUEuflCAZKCIAkMkrz4Npg0X
  uJUVZKmJeRgYFBiKcgtSg3swRV/hWjOAejkjAvXxDQFJ7MvBK46a+AFjMBLd6k2ASyuCQRISX
  VwBTLnPnih+ROo5PHw3dfX1TdnnlB/PLxtiVlEyt2F37ZVSV7Pu7bhW1bXs3Rkp3yYpfy5mdf
  1u7pZZX23zl/xr66Z5+qln/YV5D6Zq5Uv/xj4WmnPYN6CmZfl97U87NnmmzgwWWt8//yLhX/m
  17u2bn1lHRLjsYVo8BNjRXT2jR3hUpptjR0pXxXWjtz4jHLvp6t8fL3378L0z61QDFV1Xhd9c
  JTPuUOe4zmP5JhqMhMObL32OKNa4+UPs/bMy1czNzn1DQfpaJ+7ZdMU+U32V0Imrp32tG0CBP
  +za1CiVvvFausXRW2ldWRyU/om3y7QGh8s8hhxWfPuvr7bn8onfk26r27Uryw+bWJM55kPnyu
  xFKckWioxVxUnAgAFbYMuFkDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-14.tower-571.messagelabs.com!1669616750!222398!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.101.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 14710 invoked from network); 28 Nov 2022 06:25:50 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-14.tower-571.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 28 Nov 2022 06:25:50 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 672041B0
	for <openembedded-devel@lists.openembedded.org>; Mon, 28 Nov 2022 06:25:50 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 5B65F1AC
	for <openembedded-devel@lists.openembedded.org>; Mon, 28 Nov 2022 06:25:50 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 28 Nov 2022 06:25:48 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] spdlog: upgrade 1.10.0 -> 1.11.0
Date: Mon, 28 Nov 2022 14:25:19 +0800
Message-ID: <1669616722-13377-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1669616722-13377-1-git-send-email-wangmy@fujitsu.com>
References: <1669616722-13377-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 28 Nov 2022 06:25:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99817

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
Update to fmt lib version 9.1.0 #2346, #2485, #2512, #2517 . 
Fix template instantiation warning #2336 . 
Event handlers improvements #2342, #2375 . 
Allow modifying the used Android buffer ID #2358. 
Fix clone in async test #2364. 
Custom formatting optimization #2365. 
Fix C++14 builds for gcc 4.x (#2333) #2372 . 
Add minor version to CMake's SOVERSION #2376
Allow compilation with FMT_ENFORCE_COMPILE_STRING #2381. 
Fix pkg-config generation #2383. 
Remove unused code from null_mutex #2385. 
Fix redundant std::move #2396. 
Remove the empty file if in first period in hourly logger #2386. 
Add reset_overrun_counter() function to the async logging #2399 
Set C++20 in CMake when SPDLOG_USE_STD_FORMAT option is turned on #2402. 
Fix mingw test #2415. 
Support for any std::chrono::duration type in flush_every(..) #2439. 
Fix implicit casting of level_enum #2443. 
Comment fix #2445. 
Fix gcc 4.x build #2449. 
Add openSUSE installation instructions #2468. 
Fixed missing include file in stopwatch.h #2434. 
Support for omitting source info by defining SPDLOG_NO_SOURCE_LOC #2476. 
Added SPDLOG_BUILD_PIC build option to CMake #2475. 
Fix include windows.h #2495. 
Workaround gcc 12 warnings #2498, #2499 . 
Migrate to Github Actions CI #2500. 
Replace iterator difference with std::distance #2509 
Export targets file to build directory at configure time #2514, #2515. 
MongoDB sink improvements #2519. 
Fix shadow warning in dist_sink #2431. 
Fixed msvc warning C4800 in win_eventlog_sink
Check IsDebuggerPresent() in msvc_sink before doing actual work #2408. To use old behavior pass false to the msvc_sink constructor.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../spdlog/{spdlog_1.10.0.bb => spdlog_1.11.0.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/spdlog/{spdlog_1.10.0.bb => spdlog_1.11.0.bb} (92%)

diff --git a/meta-oe/recipes-support/spdlog/spdlog_1.10.0.bb b/meta-oe/recipes-support/spdlog/spdlog_1.11.0.bb
similarity index 92%
rename from meta-oe/recipes-support/spdlog/spdlog_1.10.0.bb
rename to meta-oe/recipes-support/spdlog/spdlog_1.11.0.bb
index a7d926351..2c71331ff 100644
--- a/meta-oe/recipes-support/spdlog/spdlog_1.10.0.bb
+++ b/meta-oe/recipes-support/spdlog/spdlog_1.11.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/gabime/spdlog/wiki"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
 
-SRCREV = "76fb40d95455f249bd70824ecfcae7a8f0930fa3"
+SRCREV = "ad0e89cbfb4d0c1ce4d097e134eb7be67baebb36"
 SRC_URI = "git://github.com/gabime/spdlog.git;protocol=https;branch=v1.x"
 
 DEPENDS += "fmt"
-- 
2.25.1


