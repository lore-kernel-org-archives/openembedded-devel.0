Received: from out103-7-vmse02.mailcluster.com.au (out103-7-vmse02.mailcluster.com.au [103.250.20.7])
 by mx.groups.io with SMTP id smtpd.web11.30832.1598567277233149307
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 27 Aug 2020 15:27:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cpdesign.com.au header.s=default header.b=LJ5ABBxm;
 spf=pass (domain: cpdesign.com.au, ip: 103.250.20.7, mailfrom: marc@cpdesign.com.au)
Received: from vmcp03.web-servers.com.au ([116.90.56.28])
	by vmse02.mailcluster.com.au with esmtps (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
	(Exim 4.92)
	(envelope-from <marc@cpdesign.com.au>)
	id 1kBQMt-0004e2-DJ; Fri, 28 Aug 2020 08:27:54 +1000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=cpdesign.com.au; s=default; h=Content-Transfer-Encoding:MIME-Version:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=DpYAcOnTmLiiQJryN2nBBNIujqbyHuHnCWAkmWE3lVs=; b=LJ5ABBxmU7pTQfjPJFAUWxEmoc
	kDK0kqUi9XOQbp3FUTd44oeIm6l/VE1k1JSHc45FX1noyfVNaAMl25ET88vlyfqEYvsZcStHpOYFa
	fhbJMNBhctHZToIEqMfCSIKstzsUDd63kBztNV/2lCH2QME4TiHM3d852JxbqhB/GucBZ0FVn5YRT
	C+qK0kg9il5u21TtwsbhOCsxIQKhv6vKIZTNlWRniNX0L2nKHYTfB5iD2rMf2aQbILlzLYIh+105r
	G79uCowtkY5sJ6Jmy5hu1C9KpxxSfDV7hCnI539b6lSguIC612FKpZVGm7DJQ+jmDrjdUCQSIMPb4
	O5Zno1Hw==;
Received: from 14-201-30-55.tpgi.com.au ([14.201.30.55]:47010 helo=localhost.localdomain)
	by vmcp03.web-servers.com.au with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <marc@cpdesign.com.au>)
	id 1kBQMD-006qZx-Jo; Fri, 28 Aug 2020 08:26:57 +1000
From: "Marc" <marc@cpdesign.com.au>
To: openembedded-devel@lists.openembedded.org
Cc: Marc Reilly <marc@cpdesign.com.au>
Subject: [oe][meta-oe][patch v3] openocd: Update to latest git version
Date: Fri, 28 Aug 2020 08:25:36 +1000
Message-Id: <20200827222536.31450-1-marc@cpdesign.com.au>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-Authenticated-User: marc@cpdesign.com.au
X-Authenticator: dovecot_plain
X-Originating-IP: 116.90.56.28
X-SpamExperts-Domain: panthur-sh-outbound0.mailcluster.com.au
X-SpamExperts-Username: 116.90.56.28
Authentication-Results: mailcluster.com.au; auth=pass smtp.auth=116.90.56.28@panthur-sh-outbound0.mailcluster.com.au
X-SpamExperts-Outgoing-Class: ham
X-SpamExperts-Outgoing-Evidence: SB/global_tokens (0.00232268007432)
X-Recommended-Action: accept
X-Filter-ID: Mvzo4OR0dZXEDF/gcnlw0fJi3Ojdyt5h9PLOIGvr3lipSDasLI4SayDByyq9LIhVIxf9wa4IsjtR
 BJmNdv3T7kTNWdUk1Ol2OGx3IfrIJKyP9eGNFz9TW9u+Jt8z2T3KoWFgMvF+XPPkibGoK9ILBB00
 RFZrIi+ZJEJo7wxsO/7VAI0YaYoxzUzqeY0RKlIbl3vtzsnCjVjO/qBQZyPHPxtd7FIegon359AS
 01xfP6cAsqjVfPl6xs9mFo2LToBFcciY2z4hq7SqXAJrAGow5GfoFWZw01PZOinlBH25TcLuNaT6
 dAR4/fSS+hfMzDXVyZl6POixVpGcLrHJaCKcDQMZ3Rc1FPM37mYbhKZuZQPQzE4pWsN9DMOCoUO6
 aPH3rtVmombMJ4e2pn5C0yBMHei5BhbfeHQcd06QKJAOFJmwhlcqbDNsZPhW+lMvQRvnhtPcSzO8
 hsBsHZnLTV3/sheOR1N5VnaoZbH/AdGlfrxb2fBAlhZ0D8R9hqWf+kKKqZJPq0P98FvWTwEpOhyA
 dK6qvRqKQ68kD4O7N4Xhv7JB75tz6v0zFYS4i1UpWw5yXHKXjy/UUyfBKxS3I/qxqt9fxN2oReTD
 HAyOynaY0ClayFlzfg/9spYg1tMhQDojmOPV3l6ehn5j5fYkfZoQxBkgoL0bckEue7jwJnlVscnY
 5Qx4fJOk03R5fJtf/Dv/9m9+uP0zyEETyQahh1k9uyjKIDVyymCVyC1ptYnJbMxr5klyEuc987+Y
 wjK9ZCkWcQjLwb0HH0huSx9DiSHOBCy52WbhZLyFpHQgjgal0ZiGyUuX4D8uO6Mr+k9B+cnhY/sO
 vQiauShko72/x+ONfS32EoSnB0KQ6B3xt8UP9IpG18TJfl7S+nSryIOjiGo+YAvNrlNPDcRjUdyh
 4v23HATugv1leQFvfCG5Mo+bZdrcOTYyZlLVDrZYjWY+Z5btw7Dhb2MjgFHaOhtDC8OUUxNU4pLh
 CvFXI4ziX4KdIOgKPa7nWoyyMidZrfrm/y7/VFVfzq9HJCcKwi0t4S0aPa9bEM2vZpXu3r/CFxu/
 JfMd/XyjuM/4DpMjE4bsJtdCg/GAJCwW2QYU//No1Sz2NlNwYzVIo6KuHW8hVCQ7X76eh5iKSy3v
 OUL7u1Fz6ckdlPTAIqGU1JNSgwiNIesPRfn+6OKMfGXpI6vVUgXgRhqh2Dwf8plwptnx2pP0zfML
 So+O6aenwaZ6/X2ea4ZBUw==
X-Report-Abuse-To: spam@vmse01.mailcluster.com.au
Content-Transfer-Encoding: 8bit

The 0001-Do-not-include-sysctrl.h-with-glibc.patch is no longer needed,
and is thus removed.
The 0001-bitbang-Make-bitbang_swd-extern-definition.patch was fixed
upstream in c60252ac2b636c4d99b766a574b9df0966151696 and is thus removed.

Signed-off-by: Marc Reilly <marc@cpdesign.com.au>
---
 ...-Do-not-include-syscrtl.h-with-glibc.patch | 33 ---------------
 ...g-Make-bitbang_swd-extern-definition.patch | 42 -------------------
 .../recipes-devtools/openocd/openocd_git.bb   |  8 ++--
 3 files changed, 3 insertions(+), 80 deletions(-)
 delete mode 100644 meta-oe/recipes-devtools/openocd/openocd/0001-Do-not-include-syscrtl.h-with-glibc.patch
 delete mode 100644 meta-oe/recipes-devtools/openocd/openocd/0001-bitbang-Make-bitbang_swd-extern-definition.patch

diff --git a/meta-oe/recipes-devtools/openocd/openocd/0001-Do-not-include-syscrtl.h-with-glibc.patch b/meta-oe/recipes-devtools/openocd/openocd/0001-Do-not-include-syscrtl.h-with-glibc.patch
deleted file mode 100644
index 618ce2689..000000000
--- a/meta-oe/recipes-devtools/openocd/openocd/0001-Do-not-include-syscrtl.h-with-glibc.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From a763610719e7d7f6cdc45569b6fbfdb91bb7c87b Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sat, 27 Jul 2019 14:30:08 -0700
-Subject: [PATCH] Do not include syscrtl.h with glibc
-
-glibc 2.30 has deprecated it see [1]
-Fixes
-sys/sysctl.h:21:2: error: "The <sys/sysctl.h> header is deprecated and will be removed." [-Werror,-W#warnings]
-
-[1] https://sourceware.org/git/?p=glibc.git;a=commit;h=744e829637162bb7d5029632aacf341c64b86990
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/helper/options.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/helper/options.c b/src/helper/options.c
-index 12755e010..4007e37f6 100644
---- a/src/helper/options.c
-+++ b/src/helper/options.c
-@@ -34,7 +34,7 @@
- #if IS_DARWIN
- #include <libproc.h>
- #endif
--#ifdef HAVE_SYS_SYSCTL_H
-+#if defined(HAVE_SYS_SYSCTL_H) && !defined(__GLIBC__)
- #include <sys/sysctl.h>
- #endif
- #if IS_WIN32 && !IS_CYGWIN
--- 
-2.22.0
-
diff --git a/meta-oe/recipes-devtools/openocd/openocd/0001-bitbang-Make-bitbang_swd-extern-definition.patch b/meta-oe/recipes-devtools/openocd/openocd/0001-bitbang-Make-bitbang_swd-extern-definition.patch
deleted file mode 100644
index d42b628da..000000000
--- a/meta-oe/recipes-devtools/openocd/openocd/0001-bitbang-Make-bitbang_swd-extern-definition.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From 428f9f3c4a5be973e4c7fc1325ae9dbe41040df2 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Thu, 13 Aug 2020 17:47:35 -0700
-Subject: [PATCH] bitbang: Make bitbang_swd extern definition
-
-Fixes build with gcc10+
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/jtag/drivers/bitbang.c | 1 +
- src/jtag/drivers/bitbang.h | 2 +-
- 2 files changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/src/jtag/drivers/bitbang.c b/src/jtag/drivers/bitbang.c
-index b5078c080..f8612aade 100644
---- a/src/jtag/drivers/bitbang.c
-+++ b/src/jtag/drivers/bitbang.c
-@@ -43,6 +43,7 @@ static int bitbang_stableclocks(int num_cycles);
- static void bitbang_swd_write_reg(uint8_t cmd, uint32_t value, uint32_t ap_delay_clk);
- 
- struct bitbang_interface *bitbang_interface;
-+const struct swd_driver bitbang_swd;
- 
- /* DANGER!!!! clock absolutely *MUST* be 0 in idle or reset won't work!
-  *
-diff --git a/src/jtag/drivers/bitbang.h b/src/jtag/drivers/bitbang.h
-index 577717ebd..0faf5d9ae 100644
---- a/src/jtag/drivers/bitbang.h
-+++ b/src/jtag/drivers/bitbang.h
-@@ -57,7 +57,7 @@ struct bitbang_interface {
- 	void (*swdio_drive)(bool on);
- };
- 
--const struct swd_driver bitbang_swd;
-+extern const struct swd_driver bitbang_swd;
- 
- extern bool swd_mode;
- 
--- 
-2.28.0
-
diff --git a/meta-oe/recipes-devtools/openocd/openocd_git.bb b/meta-oe/recipes-devtools/openocd/openocd_git.bb
index c7d754fdb..4f6aaa8a6 100644
--- a/meta-oe/recipes-devtools/openocd/openocd_git.bb
+++ b/meta-oe/recipes-devtools/openocd/openocd_git.bb
@@ -9,15 +9,13 @@ SRC_URI = " \
     git://repo.or.cz/r/git2cl.git;protocol=http;destsuffix=tools/git2cl;name=git2cl \
     git://repo.or.cz/r/jimtcl.git;protocol=http;destsuffix=git/jimtcl;name=jimtcl \
     git://repo.or.cz/r/libjaylink.git;protocol=http;destsuffix=git/src/jtag/drivers/libjaylink;name=libjaylink \
-    file://0001-Do-not-include-syscrtl.h-with-glibc.patch \
-    file://0001-bitbang-Make-bitbang_swd-extern-definition.patch \
 "
 
 SRCREV_FORMAT = "openocd"
-SRCREV_openocd = "ded67990255cc1e63c77832ffd6e6bef9120873d"
+SRCREV_openocd = "d46f28c2ea2611f5fbbc679a5eed253d3dcd2fe3"
 SRCREV_git2cl = "8373c9f74993e218a08819cbcdbab3f3564bbeba"
-SRCREV_jimtcl = "dc4ba7770d580800634f90b67a24e077b4a26d98"
-SRCREV_libjaylink = "3322dfa5e7aa56f5b12b7f2197e3e6b850b7b66e"
+SRCREV_jimtcl = "0aa0fb4e3a38d38a49de9eb585d93d63a370dcf6"
+SRCREV_libjaylink = "9aa7a5957c07bb6e862fc1a6d3153d109c7407e4"
 
 PV = "0.10+gitr${SRCPV}"
 S = "${WORKDIR}/git"
-- 
2.26.2

