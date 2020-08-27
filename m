Received: from out202-10-vmse03.mailcluster.com.au (out202-10-vmse03.mailcluster.com.au [202.130.45.10])
 by mx.groups.io with SMTP id smtpd.web11.9308.1598491152566130735
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 26 Aug 2020 18:19:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cpdesign.com.au header.s=default header.b=UqQJtF4a;
 spf=pass (domain: cpdesign.com.au, ip: 202.130.45.10, mailfrom: marc@cpdesign.com.au)
Received: from vmcp03.web-servers.com.au ([116.90.56.28])
	by vmse03.mailcluster.com.au with esmtps (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
	(Exim 4.92)
	(envelope-from <marc@cpdesign.com.au>)
	id 1kB6Z0-00032G-Ee; Thu, 27 Aug 2020 11:19:10 +1000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=cpdesign.com.au; s=default; h=Content-Transfer-Encoding:MIME-Version:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=abPyJqfqBUNzlInxlXT/qnsEs+HlAJCzbA2EZEt+yII=; b=UqQJtF4apsA4gpEzPVTawf3lq+
	EiNSLRY/HT5/PzH8iO/8WsmSEzD7Zk0SCCGtvkz0Ucqjepsv+c401Hi1EtS5Nd88dv0xgA91QutoS
	qYfRWP6wlKXlZit66NzkOUxN1XgiMmvFuqGo0UDDyoCIVs4gyggmW/Y1QqFtbnHTjvJfLXOw89ADU
	VK8M/EJWYP487kDRXFw9N5i+/5VKSJ2M+SJIo6CvXys1rDCn/8/RruPJQE4H4nQjCUSgTzNhQfLKN
	BBon36s8BQhdEv6pdRgY1E5u+iA7UWQJkGg3f5WDmTkBiT55YTPJiVjaoENhH9CmSKES08MbjMIqJ
	rRuNwAmQ==;
Received: from 14-201-30-55.tpgi.com.au ([14.201.30.55]:43812 helo=localhost.localdomain)
	by vmcp03.web-servers.com.au with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <marc@cpdesign.com.au>)
	id 1kB6YK-00FZ01-Na; Thu, 27 Aug 2020 11:18:08 +1000
From: "Marc" <marc@cpdesign.com.au>
To: openembedded-devel@lists.openembedded.org
Cc: Marc Reilly <marc@cpdesign.com.au>
Subject: [oe][meta-oe][patch v2] openocd: Update to latest git version
Date: Thu, 27 Aug 2020 11:18:03 +1000
Message-Id: <20200827011803.26737-1-marc@cpdesign.com.au>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-Authenticated-User: marc@cpdesign.com.au
X-Authenticator: dovecot_plain
X-Originating-IP: 116.90.56.28
X-SpamExperts-Domain: panthur-sh-outbound0.mailcluster.com.au
X-SpamExperts-Username: 116.90.56.28
Authentication-Results: mailcluster.com.au; auth=pass smtp.auth=116.90.56.28@panthur-sh-outbound0.mailcluster.com.au
X-SpamExperts-Outgoing-Class: ham
X-SpamExperts-Outgoing-Evidence: SB/global_tokens (0.00157094742443)
X-Recommended-Action: accept
X-Filter-ID: Mvzo4OR0dZXEDF/gcnlw0fJi3Ojdyt5h9PLOIGvr3lipSDasLI4SayDByyq9LIhV9xUlOMPGwJ+f
 Rta4c3g/10TNWdUk1Ol2OGx3IfrIJKyP9eGNFz9TW9u+Jt8z2T3KoWFgMvF+XPPkibGoK9ILBB00
 RFZrIi+ZJEJo7wxsO/7VAI0YaYoxzUzqeY0RKlIbl3vtzsnCjVjO/qBQZyPHPxtd7FIegon359AS
 01xfP6cMX5cB7KWJO159a2IMgvD2cciY2z4hq7SqXAJrAGow5GfoFWZw01PZOinlBH25TcLuNaT6
 dAR4/fSS+hfMzDXVyZl6POixVpGcLrHJaCKcDd2wXvt6UPr7G0XDxOXV0qTQzE4pWsN9DMOCoUO6
 aPH3rtVmombMJ4e2pn5C0yBMHei5BhbfeHQcd06QKJAOFJmwhlcqbDNsZPhW+lMvQRvnhtPcSzO8
 hsBsHZnLTV3/sheOR1N5VnaoZbH/AdGlfrxb2fBAlhZ0D8R9hqWf+kKKqZJPq0P98FvWTwEpOhyA
 dK6qvRqKQ68kD4O7N4Xhv7JB75tz6v0zFYS4i1UpWw5yXHKXjy/UUyfBKxS3I/qxqt9fxN2oReTD
 HAyOynaY0ClayFlzfg/9spYg1tMhQDojmOPV3l6ehn5j5fYkfZoQxBkgoL0bckEue7jwJnlVscnY
 5Qx4fJOk03R5fJtf/Dv/9m9+uP0zyEETyQahh1k9uyjKIDVyymCVyC1ptYnJbMwUhD1no7cAzwxS
 hMj5jWmkmy/ZnyJWNw9Wkh1LDJbKbwodIRUOT0si6b3r/C2d57iGyUuX4D8uO6Mr+k9B+cnhY/sO
 vQiauShko72/x+ONfS32EoSnB0KQ6B3xt8UP9IpG18TJfl7S+nSryIOjiGo+YAvNrlNPDcRjUdyh
 4v23HATugv1leQFvfCG5Mo+bZdoYLrb1mHxg1SXCSmD8FLSPpJs89K10ZtCqhG2dDTAZYRNU4pLh
 CvFXI4ziX4KdIOgKPa7nWoyyMidZrfrm/y7/VFVfzq9HJCcKwi0t4S0aPa9bEM2vZpXu3r/CFxu/
 JfMd/XyjuM/4DpMjE4bsJtdCg/GAJCwW2QYU//No1Sz2NlNwYzVIo6KuHW8hVCQ7X76eh5iKSy3v
 OUL7u1Fz6ckdlPTAIqGU1JNSgwiNIesPRfn+6OKMfGXpI6vVUgXgRhqh2Dwf8plwptnx2pP0zfML
 So+O6aenwaZ6/X2ea4ZBUw==
X-Report-Abuse-To: spam@vmse01.mailcluster.com.au
Content-Transfer-Encoding: 8bit

The 0001-Do-not-include-sysctrl.h-with-glibc.patch is no longer needed,
and is thus removed.

Signed-off-by: Marc Reilly <marc@cpdesign.com.au>

# Conflicts:
#	meta-oe/recipes-devtools/openocd/openocd_git.bb
---
 ...-Do-not-include-syscrtl.h-with-glibc.patch | 33 -------------------
 .../recipes-devtools/openocd/openocd_git.bb   |  7 ++--
 2 files changed, 3 insertions(+), 37 deletions(-)
 delete mode 100644 meta-oe/recipes-devtools/openocd/openocd/0001-Do-not-include-syscrtl.h-with-glibc.patch

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
diff --git a/meta-oe/recipes-devtools/openocd/openocd_git.bb b/meta-oe/recipes-devtools/openocd/openocd_git.bb
index c7d754fdb..b2a4033b4 100644
--- a/meta-oe/recipes-devtools/openocd/openocd_git.bb
+++ b/meta-oe/recipes-devtools/openocd/openocd_git.bb
@@ -9,15 +9,14 @@ SRC_URI = " \
     git://repo.or.cz/r/git2cl.git;protocol=http;destsuffix=tools/git2cl;name=git2cl \
     git://repo.or.cz/r/jimtcl.git;protocol=http;destsuffix=git/jimtcl;name=jimtcl \
     git://repo.or.cz/r/libjaylink.git;protocol=http;destsuffix=git/src/jtag/drivers/libjaylink;name=libjaylink \
-    file://0001-Do-not-include-syscrtl.h-with-glibc.patch \
     file://0001-bitbang-Make-bitbang_swd-extern-definition.patch \
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

