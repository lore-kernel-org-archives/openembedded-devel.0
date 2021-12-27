Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 050B7C433F5
	for <webhook@archiver.kernel.org>; Mon, 27 Dec 2021 14:33:55 +0000 (UTC)
Received: from mail1.bemta36.messagelabs.com (mail1.bemta36.messagelabs.com
 [85.158.142.1])
 by mx.groups.io with SMTP id smtpd.web08.26906.1640615633678725229
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Dec 2021 06:33:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=VEouiKbr;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.1,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1640615632; i=@fujitsu.com;
	bh=8ngkBrWugK8h/HXf+phHwFoJObrWWrYxwfQzQxlla9A=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=VEouiKbr5qTnZmJBInLakEIkhvEJtuRYY9uKJIakPhRrda7EwIJwiigya4pPzn/14
	 Zd9m+Ce5yPZOrHbh3mJQfVMA3RTxERhCRmObyRZPKVpgQhru82+0ZhQ3WdSboW8xTj
	 Kko2T0f2ao9CHlYkPlMqoAmouYRZFMqvoppF9vGHB7Qbw7PXTLScWwekGE9GOaC3o0
	 jTt/mGT/DDKzjtxRluT6Rarf2ssO1gY5CkLIrpl2HkvL/248GogdAVLy8XAAfa2Ouw
	 5CRtT5y3J/NPTokVnPqB7OIfyJMgTNWTSy6TmUpB3CD8A90pA/HJJ9iAfO7EMCJsJ5
	 lEQwieULs+Cmg==
Received: from [100.115.70.228] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-1.bemta.az-a.eu-central-1.aws.ess.symcld.net id
 0C/1B-31213-FCEC9C16; Mon, 27 Dec 2021 14:33:51 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrKIsWRWlGSWpSXmKPExsViZ8MRonv+3Ml
  EgxPdMhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8bCwy/YCvbLVdz8fIi5gfG3ZBcjF4eQwEwm
  iZ83trBAOCcYJV6ePMrYxcjJwSagJjH91g1WEFtEQF9i6ew9zCA2s4CKxIvfPewgtrCAjcTsM
  1tZQGwWAVWJf59XMoHYvAJOEktffWYDsSUEFCSmPHwP1ssp4CzRcGgPUA0H0DIniYmXnSHKBS
  VOznzCAjFeQuLgixfMEK2KErMvN7NA2BUSs2a1MU1g5J+FpGUWkpYFjEyrGO2SijLTM0pyEzN
  zdA0NDHQNDU11zYGUgYVeYpVuol5qqW5yal5JUSJQWi+xvFgvtbhYr7gyNzknRS8vtWQTIzA0
  U4rdcnYwfuz7qXeIUZKDSUmU9/uEk4lCfEn5KZUZicUZ8UWlOanFhxhlODiUJHiDTwHlBItS0
  1Mr0jJzgHECk5bg4FES4dU4C5TmLS5IzC3OTIdInWJUlBLntQRJCIAkMkrz4NpgsXmJUVZKmJ
  eRgYFBiKcgtSg3swRV/hWjOAejkjCvE8gUnsy8Erjpr4AWMwEtnulwHGRxSSJCSqqB6ewdOWM
  jvkln71o0+zEujN1wpeNW2Md+j7P+mv3eh81kLVQiqznUXoktcJxaobG6/OXdqWavvNrFmnly
  KllEOeev+XjmOWun0/FDGzcecu9UsPWYz93+6p/V06LIdPcVZw5x8Nj7651TOOyjXGKv9zz9g
  Hl9uHqBxB3pN/e4NvuvmuaycKWmYmlFe8rMP3/jylXP70t4InJu+dFXy1zb5TRz3GbwKDjEJb
  wTkz5rHPzzfMOdopjmhTs+5L6RSnFWCN5V8u3siswJ95cJh3FbhJ6zWGbwa+3W+RumeAe+Y1+
  xM37TtqenFqoV1iVf02ZreKYt279azznyXvuT957PZ9gVe0VqyAXGpl5dlfBEiaU4I9FQi7mo
  OBEARos0IUgDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-20.tower-528.messagelabs.com!1640615631!227339!1
X-Originating-IP: [62.60.8.84]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 8590 invoked from network); 27 Dec 2021 14:33:51 -0000
Received: from unknown (HELO mailhost3.uk.fujitsu.com) (62.60.8.84)
  by server-20.tower-528.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 27 Dec 2021 14:33:51 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost3.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 1BREXp0k005346
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Dec 2021 14:33:51 GMT
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.26; Mon, 27 Dec 2021 14:33:49 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] tree: upgrade 1.8.0 -> 2.0.0
Date: Mon, 27 Dec 2021 22:33:22 +0800
Message-ID: <1640615604-22927-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1640615604-22927-1-git-send-email-wangmy@fujitsu.com>
References: <1640615604-22927-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 27 Dec 2021 14:33:55 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94510

Changelog:
=========
* This started out as a 1.9.0 release but then I got fed up with the abundance
of directory listers (8 in total, 2 each for each output mode).
Nothing is terribly well tested since there are a lot of changes and I would
like to get this out the door finally, please report breakage. This reduced
so much code that all the below additions only resulted in a code base that
is only 54 lines larger than 1.8.0.

* Rolled all the directory listers into 2 functions that call output specific
functions (removes one TODO).

*-R option now recursively calls the emit_tree() function rather than using
system() to re-call tree. Also removes a TODO.

* Adds --info to print information about files/directories from information
found in .info files (removes a maybe do) In HTML output, comments show as
mouse over tooltips, which I imagine will be the most useful use of this "feature".

* Output un-indented JSON on file descriptor 3 ("stddata") automatically if
file descriptor 3 is present (currently Linux only.) Maybe switch to BSON.

* Always HTML escape filenames in HTML output even when -C is used.

* Return a non-zero exit status if there is a failure to open any directory.

* Added --gitignore option to filter out files specified by .gitignore files.
(also reads $GIT_DIR/info/exclude if present.) To facilitate gitignore, adds
support for ** on pattern matching to allow /**/ to match a single /.
This is not well tested and kind of hacked together, so may not work correctly.

* Now also supports multiple -I and -P instances.

* Now prints meta data for the top level directory as well.

* Split spaghetti code in main into individual functions.

* Properly sort --fromfile input

* Make tree colorization use reset (rs code in dir_colors,) not normal color
when resetting attributes

* Honor -n (no color) even if the CLICOLOR_FORCE environment variable is set

* Fix --sort option to not require =

* Defer sorting for --du until the entire sub-directory tree has been processed.

* Optimized makefile, HP/UX support (Osipov, Michael). Note that this changes
the prefix default to /usr/local, which is becoming required for many systems now.

* Renamed (the by now very obsolete) doc/tree.1.fr to doc/tree.fr.1

* Fix JSON string escaping such that it is not using the HTML escaping

* Add --filesfirst option (John A. Fedoruk). Cleaned up sorting code to make
--dirsfirst and --filesfirst top level meta-sorts.

* "arial" not "ariel" (Mark), HTML style-sheet cleaned up in any event.

* Deprecate using local -DLINUX / -DCYGWIN and use the OS provided __linux__ or
__CYGWIN__

* XML/HTML/JSON output needs to be mutually exclusive, last command line switch
wins.

* Make sure we use xmalloc instead of malloc in a number of places

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-support/tree/{tree_1.8.0.bb => tree_2.0.0.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-oe/recipes-support/tree/{tree_1.8.0.bb => tree_2.0.0.bb} (80%)

diff --git a/meta-oe/recipes-support/tree/tree_1.8.0.bb b/meta-oe/recipes-support/tree/tree_2.0.0.bb
similarity index 80%
rename from meta-oe/recipes-support/tree/tree_1.8.0.bb
rename to meta-oe/recipes-support/tree/tree_2.0.0.bb
index 01b1ac384..257adfb42 100644
--- a/meta-oe/recipes-support/tree/tree_1.8.0.bb
+++ b/meta-oe/recipes-support/tree/tree_2.0.0.bb
@@ -5,8 +5,7 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=393a5ca445f6965873eca0259a17f833"
 
 SRC_URI = "http://mama.indstate.edu/users/ice/tree/src/${BP}.tgz"
-SRC_URI[md5sum] = "715191c7f369be377fc7cc8ce0ccd835"
-SRC_URI[sha256sum] = "715d5d4b434321ce74706d0dd067505bb60c5ea83b5f0b3655dae40aa6f9b7c2"
+SRC_URI[sha256sum] = "782cd73179f65cfca7f29326f1511306e49e9b11d5b861daa57e13fd7262889f"
 
 # tree's default CFLAGS for Linux
 CFLAGS += "-Wall -DLINUX -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64"
-- 
2.25.1


