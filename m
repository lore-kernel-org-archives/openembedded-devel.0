Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
	[209.85.210.194])
	by mail.openembedded.org (Postfix) with ESMTP id 8C02D7F945
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  3 Jan 2020 02:49:37 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id q8so22913606pfh.7
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 02 Jan 2020 18:49:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=Kx/LS6dWu6q8k2j0ZN+bJw2bVvLnBzY3v9W4U9id8JY=;
	b=B9S8pT2eGOqUy0KnYRqHY2apFO7i5earkjN6lLhFOIeb2vfYWu4AxZo+AHSwYfxyGO
	/W8puluiati6hyXKINvgINyKawk0WuwruEY6HWQqo+1bek050kqkaALOtU5tonTvFYzu
	1PVqnWc4M8YgaOXWxsfhO29paxLfVk1wxvDuCkmPXa2virukjRTRXb7ZVpw8hYLl3pU6
	zDafuP9tG86CFjhsxVvV+mAKqp2I2wocYeNL8n9/trBX1JGKTDR7V2Yjg2MI3MZjHDE+
	OvRdRmXZNMmXCJQzA8GBB8Xr4/px+4Vwcd+B/Yv4wOJF9hHTdNfzQpFeeofwmwCO+12Y
	tNGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=Kx/LS6dWu6q8k2j0ZN+bJw2bVvLnBzY3v9W4U9id8JY=;
	b=RFrJspJiHa/IYLnaUw+y7xQEEwfp+UlAtoB0bJstwqYrlXXVbPHLGAxkUqgw12vVfT
	ZU3WPKcPBq3MgsRgd5fLhZR2X88uzUCSxd38pK18A1+SbCzAdlEIsNFg/plxmtAsgyvk
	zNA+G3KZpNQvfC7cat4JzAZXTi5Em5F5jVyQBQ6cNPLg9q5SHP6eUvuhzdYscQhS0WvF
	3iMGbG/FxjD5G+oEFLUGRrnbdu1HKq4s5NHcIg/TglpcPHP5gP8p2bIYE6qLHM0bOJzn
	i/vlnnHTqI1PFbYVnWn+jNw/REJOzPoslFft8fw562WC2Re3nA/+4k7hpDCMnyMW/y2m
	fXmA==
X-Gm-Message-State: APjAAAUdZcCKq+GxqgM21St+DBhFCEnzYP3u8yd0HgtnEdbr0Y0jVkWr
	J+ZejnaWOK5iXuubFe4VcQZELnyPFLM=
X-Google-Smtp-Source: APXvYqyE2I2JalYBGl0twOZPvPfwFFwp8cuqFrnqmYusNYboL9q27u8TRieIhch3fycXr26EcXwXxw==
X-Received: by 2002:a65:640e:: with SMTP id a14mr86235164pgv.402.1578019778432;
	Thu, 02 Jan 2020 18:49:38 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:555:ddff:6770:148b])
	by smtp.gmail.com with ESMTPSA id
	p5sm61306640pga.69.2020.01.02.18.49.37
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 02 Jan 2020 18:49:38 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  2 Jan 2020 18:49:05 -0800
Message-Id: <6da4df2ce8106c218bca07bc24c7b10b2d92746f.1578019547.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1578019547.git.akuster808@gmail.com>
References: <cover.1578019547.git.akuster808@gmail.com>
Subject: [zeus 08/17] evtest: Fix build for 32bit arches with 64bit time_t
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
X-List-Received-Date: Fri, 03 Jan 2020 02:49:37 -0000

From: Khem Raj <raj.khem@gmail.com>

Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 64f07ba8528cda14ad552e492dfd2e7f054fbb08)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 ...ld-on-32bit-arches-with-64bit-time_t.patch | 41 +++++++++++++++++++
 meta-oe/recipes-test/evtest/evtest_1.34.bb    |  6 ++-
 2 files changed, 45 insertions(+), 2 deletions(-)
 create mode 100644 meta-oe/recipes-test/evtest/evtest/0001-Fix-build-on-32bit-arches-with-64bit-time_t.patch

diff --git a/meta-oe/recipes-test/evtest/evtest/0001-Fix-build-on-32bit-arches-with-64bit-time_t.patch b/meta-oe/recipes-test/evtest/evtest/0001-Fix-build-on-32bit-arches-with-64bit-time_t.patch
new file mode 100644
index 00000000000..706322d5653
--- /dev/null
+++ b/meta-oe/recipes-test/evtest/evtest/0001-Fix-build-on-32bit-arches-with-64bit-time_t.patch
@@ -0,0 +1,41 @@
+From fa57c78c33d26084f85f1a6b4c29378631dc9395 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 30 Nov 2019 11:58:58 -0800
+Subject: [PATCH] Fix build on 32bit arches with 64bit time_t
+
+time element is deprecated on new input_event structure in kernel's
+input.h [1]
+
+[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit?id=152194fe9c3f
+
+Upstream-Status: Submitted [https://gitlab.freedesktop.org/libevdev/evtest/merge_requests/6]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ evtest.c | 7 ++++++-
+ 1 file changed, 6 insertions(+), 1 deletion(-)
+
+diff --git a/evtest.c b/evtest.c
+index 548c203..93063cd 100644
+--- a/evtest.c
++++ b/evtest.c
+@@ -61,6 +61,11 @@
+ #include <sys/types.h>
+ #include <unistd.h>
+ 
++#ifndef input_event_sec
++#define input_event_sec time.tv_sec
++#define input_event_usec time.tv_usec
++#endif
++
+ #define BITS_PER_LONG (sizeof(long) * 8)
+ #define NBITS(x) ((((x)-1)/BITS_PER_LONG)+1)
+ #define OFF(x)  ((x)%BITS_PER_LONG)
+@@ -1140,7 +1145,7 @@ static int print_events(int fd)
+ 			type = ev[i].type;
+ 			code = ev[i].code;
+ 
+-			printf("Event: time %ld.%06ld, ", ev[i].time.tv_sec, ev[i].time.tv_usec);
++			printf("Event: time %ld.%06ld, ", ev[i].input_event_sec, ev[i].input_event_sec);
+ 
+ 			if (type == EV_SYN) {
+ 				if (code == SYN_MT_REPORT)
diff --git a/meta-oe/recipes-test/evtest/evtest_1.34.bb b/meta-oe/recipes-test/evtest/evtest_1.34.bb
index 3b6dc61408c..a3a23c89516 100644
--- a/meta-oe/recipes-test/evtest/evtest_1.34.bb
+++ b/meta-oe/recipes-test/evtest/evtest_1.34.bb
@@ -8,8 +8,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 DEPENDS = "libxml2"
 
 SRCREV = "16e5104127a620686bdddc4a9ad62881134d6c69"
-SRC_URI = "git://anongit.freedesktop.org/evtest;protocol=git \
-           file://add_missing_limits_h_include.patch"
+SRC_URI = "git://gitlab.freedesktop.org/libevdev/evtest.git;protocol=https \
+           file://add_missing_limits_h_include.patch \
+           file://0001-Fix-build-on-32bit-arches-with-64bit-time_t.patch \
+           "
 
 S = "${WORKDIR}/git"
 
-- 
2.17.1


