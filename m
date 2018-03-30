Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 2E9F974688
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Mar 2018 13:32:05 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id r82so16906194wme.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Mar 2018 06:32:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=bDcCQ7oNvyRgfgVxb7DlHLsNIIxO+iiiIOyOuQxgWDs=;
	b=aTwYKnMBw2jmuG/BlKRMhw7Gd32nvOOJzzMNfTAkTvxVq+DRWmavcSQEby5CACiO0+
	LYxekHWX746kbava0ciqQM4nxLp6Hr9jh3qg205WlU9w1nXXmaMd/d8cLcHy4krCrbsZ
	6ubHCuQjbWj/FVnQEquTOAhkMo2z4GD4k0+WKX+1kIbsiIBDu9M0dd4h6fjmzK3i2+M7
	0l5/UH5HQYmzePRABp/78Fm4Ru6d1hJsh5WNtQDXx5JeEX/0NCT+xJ4a2eYsDAltHMQ0
	l+V9Ea5Q1qa7Ymd0P44mDLn5ajmvwzinRuB9A5Y/i/AAjU3eW4V5TTdhcqlKqxcv77cL
	1BwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=bDcCQ7oNvyRgfgVxb7DlHLsNIIxO+iiiIOyOuQxgWDs=;
	b=jAB+yKVs14F9hV0IFfO785xDuRRWusktnqAcYTHLG7VybJ6sCObxT3Mn9k+yHOyOLk
	RhmLIiV1HPbCEAx13yYzuP01hvif92fOIOyydUATG1vH+cKw0G4gUveZvtKwy7vsEvcT
	+o37QykrOkCl/P3xLm8m5NmmUN9VUuBBJlnXJLh0WaY5tBKvVQvcCwMxg5rBKLL0rk2Y
	53gDCfRd3sikTYy10euR9uPptZi8J0BJ7FJIbq9oSpfcGFsOH4wK+wOcMBu3UEid/EV9
	+4BQlu6eE6iFMjOrBz1M/uQbm2EHuinzYI09FonE6RmBRyvdgMu43yW9DhjIbKZP1EiD
	L/4A==
X-Gm-Message-State: AElRT7Ek1yej1VloESPopgUrK/qTsxwZarHDaaEWrjWA+3Nxohw9wMZp
	sactYbLimK6cRyiCQbpwIvobdw==
X-Google-Smtp-Source: AIpwx4/rqm5d+imCvboKOcRkK63d/9nzy+6KgLNwg7J+cC93/Lk5W2ZZtGoSi5/q/5wcLSGcB4cWRQ==
X-Received: by 10.28.167.204 with SMTP id q195mr2284377wme.48.1522416726309;
	Fri, 30 Mar 2018 06:32:06 -0700 (PDT)
Received: from PC192-168-2-116.speedport.ip
	(p200300F07BC180221E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:f0:7bc1:8022:1e6f:65ff:fe3e:7f61])
	by smtp.gmail.com with ESMTPSA id
	93sm10468396wrh.46.2018.03.30.06.32.05
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 30 Mar 2018 06:32:05 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 30 Mar 2018 15:31:14 +0200
Message-Id: <20180330133151.25882-3-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180330133151.25882-1-schnitzeltony@gmail.com>
References: <20180330133151.25882-1-schnitzeltony@gmail.com>
Subject: [PATCH 02/39] ntp: refresh patch
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 30 Mar 2018 13:32:06 -0000

From: Martin Jansa <martin.jansa@gmail.com>

WARNING: ntp-4.2.8p10-r0 do_patch:
Some of the context lines in patches were ignored. This can lead to incorrectly applied patches.
The context lines in the patches can be updated with devtool:

    devtool modify <recipe>
    devtool finish --force-patch-refresh <recipe> <layer_path>

Then the updated patches and the source tree (in devtool's workspace)
should be reviewed to make sure the patches apply in the correct place
and don't introduce duplicate lines (which can, and does happen
when some of the context is ignored). Further information:
http://lists.openembedded.org/pipermail/openembedded-core/2018-March/148675.html
https://bugzilla.yoctoproject.org/show_bug.cgi?id=10450
Details:
Applying patch ntp-4.2.4_p6-nano.patch
patching file include/ntp_syscall.h
Hunk #1 succeeded at 10 with fuzz 2 (offset -4 lines).

Now at patch ntp-4.2.4_p6-nano.patch

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../recipes-support/ntp/ntp/ntp-4.2.4_p6-nano.patch  | 20 +++++++++++++++-----
 1 file changed, 15 insertions(+), 5 deletions(-)

diff --git a/meta-networking/recipes-support/ntp/ntp/ntp-4.2.4_p6-nano.patch b/meta-networking/recipes-support/ntp/ntp/ntp-4.2.4_p6-nano.patch
index cb1e2f734..d45b7e38b 100644
--- a/meta-networking/recipes-support/ntp/ntp/ntp-4.2.4_p6-nano.patch
+++ b/meta-networking/recipes-support/ntp/ntp/ntp-4.2.4_p6-nano.patch
@@ -1,6 +1,16 @@
---- a/include/ntp_syscall.h.orig	2009-05-19 16:44:55.048156467 -0400
-+++ b/include/ntp_syscall.h	2009-05-19 16:46:19.293323686 -0400
-@@ -14,6 +14,14 @@
+From 2310898533f059d875dcffd26ab6cf1b280292fd Mon Sep 17 00:00:00 2001
+From: Koen Kooi <koen@dominion.thruhere.net>
+Date: Wed, 12 Jan 2011 21:38:46 +0100
+
+---
+ include/ntp_syscall.h | 8 ++++++++
+ 1 file changed, 8 insertions(+)
+
+diff --git a/include/ntp_syscall.h b/include/ntp_syscall.h
+index d1ce03e..9e18432 100644
+--- a/include/ntp_syscall.h
++++ b/include/ntp_syscall.h
+@@ -10,6 +10,14 @@
  # include <sys/timex.h>
  #endif
  
@@ -13,5 +23,5 @@
 +#endif
 +
  #ifndef NTP_SYSCALLS_LIBC
- #ifdef NTP_SYSCALLS_STD
- # define ntp_adjtime(t)		syscall(SYS_ntp_adjtime, (t))
+ # ifdef NTP_SYSCALLS_STD
+ #  define ntp_adjtime(t)	syscall(SYS_ntp_adjtime, (t))
-- 
2.14.3


