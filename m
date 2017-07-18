Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f49.google.com (mail-pg0-f49.google.com [74.125.83.49])
	by mail.openembedded.org (Postfix) with ESMTP id C4DDF77E8A
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Jul 2017 03:10:25 +0000 (UTC)
Received: by mail-pg0-f49.google.com with SMTP id v190so4683561pgv.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Jul 2017 20:10:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=Xd0HbgPBNvXneRsH/4lbPCZvmlen17w3b7t2A6SmIC4=;
	b=u4fXPRFbSjzTQ5FpPMmJA1vppgMFnW/2M0vWlWB4IqOELG2g44Q/sOY7lZjhCc1aUK
	yWFDfQ67Y+b1FHVVQBXckK1k+NYWthPu2+8v7KQStjcoR1M7omTR7WUbmV/cS0JrGKTz
	w8wv10hOfLXO/t37Xq36LSOjbDXQgmMACeq68JP3uZ/j+TvX/baAhDDrjGmrjUKrdHeY
	lR5AxErCRpcE5PZ8oselwGI4Atgs96Oi78ggo43uU+i0GXu4Tza7lZDbGy7oRqElC9cR
	y5UEilKaAda6DqAFAV5yZnLFydIJ7ggE55KK0ZCxGjDzxDvBofAjMvE6ayX61DPzjTbC
	RhQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=Xd0HbgPBNvXneRsH/4lbPCZvmlen17w3b7t2A6SmIC4=;
	b=WRagzxbZiGoUfW1uqDBy6C4QKR0Anz8UDPzbiDzUrNcDI8t057QAj7WXrQKHETACiu
	ReAOSI8TcOnQjKBzfZDWptr90JFuzOOuxH1i5Pl4jMqfK2/xrB7MpktT3KQRW1NwJ/Iw
	Ihvk6Qxx8tgR61xJ/YQCKzKK++2x+Mqauh5UNuV9S1wSMkd6unre3nR8Lbk10owKlrSi
	VGJnlVywL32THtuCTdf62hiJBVJWdTioz1E5McV9+2/XbdoK45tpgNwirtPVoBHqG57k
	HfTAB2gcGBI+6Snz3hSiM4AJ36u2oPzQU83k4eJFw+J1ngJ0eMPMQsMD3tugPEIEWS++
	xSJg==
X-Gm-Message-State: AIVw113DsImDIc8qVh5oAG6JC0HorcXf2NSme9J40JHpt9mahXRo0cww
	Z3nzY4smjAzbzyYi
X-Received: by 10.84.248.66 with SMTP id e2mr877983pln.118.1500347426420;
	Mon, 17 Jul 2017 20:10:26 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c:6245:cbff:fe64:591])
	by smtp.gmail.com with ESMTPSA id
	w85sm1086674pfj.115.2017.07.17.20.10.25
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 17 Jul 2017 20:10:25 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 17 Jul 2017 20:09:58 -0700
Message-Id: <20170718031013.44536-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.3
In-Reply-To: <20170718031013.44536-1-raj.khem@gmail.com>
References: <20170718031013.44536-1-raj.khem@gmail.com>
Subject: [meta-networking][PATCH 02/17] rdate: Define logwtmp if libc != glibc
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
X-List-Received-Date: Tue, 18 Jul 2017 03:10:26 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-rdate-define-logwtmp-on-libc-glibc.patch  | 40 ++++++++++++++++++++++
 .../recipes-connectivity/rdate/rdate_1.5.bb        |  1 +
 2 files changed, 41 insertions(+)
 create mode 100644 meta-networking/recipes-connectivity/rdate/rdate/0001-rdate-define-logwtmp-on-libc-glibc.patch

diff --git a/meta-networking/recipes-connectivity/rdate/rdate/0001-rdate-define-logwtmp-on-libc-glibc.patch b/meta-networking/recipes-connectivity/rdate/rdate/0001-rdate-define-logwtmp-on-libc-glibc.patch
new file mode 100644
index 000000000..08ba2c31e
--- /dev/null
+++ b/meta-networking/recipes-connectivity/rdate/rdate/0001-rdate-define-logwtmp-on-libc-glibc.patch
@@ -0,0 +1,40 @@
+From e0c690acfcddd3c3421f6eb0182c54815fd70f8f Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 14 Jul 2017 23:21:08 -0700
+Subject: [PATCH] rdate: define logwtmp on libc != glibc
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/rdate.c | 15 +++++++++++++++
+ 1 file changed, 15 insertions(+)
+
+diff --git a/src/rdate.c b/src/rdate.c
+index 943d481..685b1b8 100644
+--- a/src/rdate.c
++++ b/src/rdate.c
+@@ -41,7 +41,22 @@ static int print_mode = 0;		// display the time
+ static int timeout = 10;		// timeout for each connection attempt
+ static char *service = DEFAULT_SERVICE;
+ 
++#ifndef __GLIBC__
++static void logwtmp(const char * line, const char * name, const char * host)
++{
++    struct utmp u;
++    memset(&u, 0, sizeof(u));
++
++    u.ut_pid = getpid();
++    u.ut_type = name[0] ? USER_PROCESS : DEAD_PROCESS;
++    strncpy(u.ut_line, line, sizeof(u.ut_line));
++    strncpy(u.ut_name, name, sizeof(u.ut_name));
++    strncpy(u.ut_host, host, sizeof(u.ut_host));
++    gettimeofday(&(u.ut_tv), NULL);
+ 
++    updwtmp(_PATH_WTMP, &u);
++}
++#endif /* __GLIBC__ */
+ 
+ // Returns string from address info pointer
+ static char*
+-- 
+2.13.3
+
diff --git a/meta-networking/recipes-connectivity/rdate/rdate_1.5.bb b/meta-networking/recipes-connectivity/rdate/rdate_1.5.bb
index b3af9275e..cd4db12c0 100644
--- a/meta-networking/recipes-connectivity/rdate/rdate_1.5.bb
+++ b/meta-networking/recipes-connectivity/rdate/rdate_1.5.bb
@@ -13,6 +13,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
 
 SRC_URI = "https://www.aelius.com/njh/${BPN}/${BP}.tar.gz \
            file://0001-src-rdate-Fix-printf-format-errors.patch \
+           file://0001-rdate-define-logwtmp-on-libc-glibc.patch \
            "
 SRC_URI[md5sum] = "0a4f612480777fdf25264ac03c57eae6"
 SRC_URI[sha256sum] = "6e800053eaac2b21ff4486ec42f0aca7214941c7e5fceedd593fa0be99b9227d"
-- 
2.13.3


