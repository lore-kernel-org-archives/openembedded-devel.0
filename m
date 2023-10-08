Return-Path: <cvubrugier@fastmail.fm>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C942E95A82
	for <webhook@archiver.kernel.org>; Sun,  8 Oct 2023 15:52:21 +0000 (UTC)
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com [64.147.123.24])
 by mx.groups.io with SMTP id smtpd.web11.40531.1696780339763974190
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 08 Oct 2023 08:52:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fastmail.fm header.s=fm2 header.b=rMAv5bBB;
 dkim=pass header.i=@messagingengine.com header.s=fm2 header.b=LON6TwS7;
 spf=pass (domain: fastmail.fm, ip: 64.147.123.24, mailfrom: cvubrugier@fastmail.fm)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailout.west.internal (Postfix) with ESMTP id DDBE332009D6;
	Sun,  8 Oct 2023 11:52:16 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Sun, 08 Oct 2023 11:52:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.fm; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:sender:subject
	:subject:to:to; s=fm2; t=1696780336; x=1696866736; bh=Bpt0L6Ftkb
	Jkgsb4d3cg7K2fKFFvUM7RcPt89fJMc5g=; b=rMAv5bBBedT/fBlPwv5DMdjVAE
	LgUz3az0ZhNkOYmkiQ23oyLbjQnNvzTFDRVZYGXmLsBnRfZSkyMowDV0FxHIEofE
	s2G0nhbPuSdUI1zuFNxbS4Ey/M0EIM4+obehjWja31pIoxNgVa1Ny68u7LPzun6L
	OAozQ/H7uxOiDxrj6snKKShrhYfRBQ7ls6K3zPh60aWJjjkZE6qBB59zH6nz6S34
	qHfS+slATmhpUBa/rTChKpCSyjQGbfqi2Er/odFnlYLI6q1rX6uGIxkhllbiCesP
	gxK3Mizea+jrOLMpY9pVOSQMXq/Phzdg4JDvpyQUTzifWBTxrIvcPazCFvvg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1696780336; x=1696866736; bh=Bpt0L6FtkbJkg
	sb4d3cg7K2fKFFvUM7RcPt89fJMc5g=; b=LON6TwS7j77UkDYWcEF2nQAAoDk8/
	XxzLZiYSWwWhsX0jA3sMGC6Jt4et8xcPNQ3tVRykSq4wzABHeETIz5iL2Y18BQ2C
	05DCdDDpagS6lv5rRl0XrqBYxGegbKKse0EG5z6OQFyTHHmRLiMVC1QS0CxeVwuJ
	GxK96EhmD4ZVfH+Kz4w0ppovr94s8swVLIUjhO1h1fBtk5JYOnHKfdNpWbiC6zNt
	HbaErelvOJi+VybKatSx0P+mu8yRblwgswOp+e7TcufcX6YV36JrNfW9PB3JnsYd
	4dqc3c+y2urzLJttImrS6yK5L/Se9kceY7O5Y0XgMf1uzcgfoJYFsk5wg==
X-ME-Sender: <xms:MNAiZS00uO3mgt-1Z2vjPeQPo4uVSg1FFuvuXkTcu6jA4NsXOXXATQ>
    <xme:MNAiZVHBwB3Kxm9zV6PGggx7_OG1zSPL9gso-WI3b2NeKSnKpz1Ead-LnzCVwHkRD
    pKRAASSon_4oNwMVg>
X-ME-Received: <xmr:MNAiZa5tzUSjC4dX_h_AHDMH47Eu-hOqBpNePzCe9CMNwaCN5diD6-2YQb5kB4YEo0ouDgjZ8cXX6_b39RKik8ygXjwVmWZTQzhS>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrhedugdelhecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvfevufffkffoggfgsedtkeertdertddtnecuhfhrohhmpegtvhhusghruhhg
    ihgvrhesfhgrshhtmhgrihhlrdhfmhenucggtffrrghtthgvrhhnpefhtedtleefteeive
    elkeeiteffveetffeiffeuvdevudffkeehheevheeihefggfenucffohhmrghinhepghgv
    nhhtohhordhorhhgpdhgihhthhhusgdrtghomhenucevlhhushhtvghrufhiiigvpedtne
    curfgrrhgrmhepmhgrihhlfhhrohhmpegtvhhusghruhhgihgvrhesfhgrshhtmhgrihhl
    rdhfmh
X-ME-Proxy: <xmx:MNAiZT1zTSGBXO-Mpb3KipcbTPFINR8GCRm_kb5C-ynB3C5lRFx7_g>
    <xmx:MNAiZVGjAiIZq8heXRzP7C1Yv_CK50qk_JdX6qNTH_9djhazYRUxjA>
    <xmx:MNAiZc_rbCc7PkztC5RYUikuGStoi_ZGAnDty9S1LZKdiC_yqOLwoQ>
    <xmx:MNAiZYNSDYrsKfTxSRIq66EKDX_Ye1AcLZ1M7_CuTOZEF_17S0oFdg>
Feedback-ID: i09e840f8:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 8 Oct 2023 11:52:15 -0400 (EDT)
From: cvubrugier@fastmail.fm
To: openembedded-devel@lists.openembedded.org
Cc: Christophe Vu-Brugier <christophe.vu-brugier@seagate.com>
Subject: [meta-oe][PATCH v2 1/2] libnvme: upgrade 1.5 -> 1.6
Date: Sun,  8 Oct 2023 17:52:04 +0200
Message-Id: <20231008155205.267182-1-cvubrugier@fastmail.fm>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 08 Oct 2023 15:52:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105387

From: Christophe Vu-Brugier <christophe.vu-brugier@seagate.com>

Backport upstream patch to fix build with musl.

Signed-off-by: Christophe Vu-Brugier <christophe.vu-brugier@seagate.com>
---
 ...01-test-handle-POSIX-ioctl-prototype.patch | 68 +++++++++++++++++++
 .../{libnvme_1.5.bb => libnvme_1.6.bb}        |  2 +-
 2 files changed, 69 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-support/libnvme/libnvme/0001-test-handle-POSIX-ioctl-prototype.patch
 rename meta-oe/recipes-support/libnvme/{libnvme_1.5.bb => libnvme_1.6.bb} (94%)

diff --git a/meta-oe/recipes-support/libnvme/libnvme/0001-test-handle-POSIX-ioctl-prototype.patch b/meta-oe/recipes-support/libnvme/libnvme/0001-test-handle-POSIX-ioctl-prototype.patch
new file mode 100644
index 000000000..ef9cc47d2
--- /dev/null
+++ b/meta-oe/recipes-support/libnvme/libnvme/0001-test-handle-POSIX-ioctl-prototype.patch
@@ -0,0 +1,68 @@
+From ca47ba3119365eafac0ab25a86cab9d9a1b29bd4 Mon Sep 17 00:00:00 2001
+From: Sam James <sam@gentoo.org>
+Date: Sat, 30 Sep 2023 06:38:53 +0100
+Subject: [PATCH] test: handle POSIX ioctl prototype
+
+glibc has the following prototype for ioctl: int ioctl(int fd, unsigned long request, ...)
+POSIX (inc. musl) has the following for ioctl: int ioctl(int fd, int request, ...)
+
+Check which prototype is used in <sys/ioctl.h> to avoid a conflict and conditionally
+define the right one for the system.
+
+Bug: https://bugs.gentoo.org/914921
+Signed-off-by: Sam James <sam@gentoo.org>
+Upstream-Status: Backport [https://github.com/linux-nvme/libnvme/commit/ca47ba3119365eafac0ab25a86cab9d9a1b29bd4]
+---
+ meson.build       | 10 ++++++++++
+ test/ioctl/mock.c |  6 +++++-
+ 2 files changed, 15 insertions(+), 1 deletion(-)
+
+diff --git a/meson.build b/meson.build
+index 6fcf1da..2c979cc 100644
+--- a/meson.build
++++ b/meson.build
+@@ -230,6 +230,16 @@ conf.set(
+     ),
+     description: 'Is network address and service translation available'
+ )
++conf.set(
++    'HAVE_GLIBC_IOCTL',
++    cc.compiles(
++        '''#include <sys/ioctl.h>
++        int ioctl(int fd, unsigned long request, ...);
++        ''',
++        name: 'ioctl has glibc-style prototype'
++    ),
++    description: 'Is ioctl the glibc interface (rather than POSIX)'
++)
+ 
+ if cc.has_function_attribute('fallthrough')
+   conf.set('fallthrough', '__attribute__((__fallthrough__))')
+diff --git a/test/ioctl/mock.c b/test/ioctl/mock.c
+index e917244..5d2ac94 100644
+--- a/test/ioctl/mock.c
++++ b/test/ioctl/mock.c
+@@ -114,7 +114,11 @@ void end_mock_cmds(void)
+ 	} \
+ })
+ 
++#ifdef HAVE_GLIBC_IOCTL
+ int ioctl(int fd, unsigned long request, ...)
++#else
++int ioctl(int fd, int request, ...)
++#endif
+ {
+ 	struct mock_cmds *mock_cmds;
+ 	bool result64;
+@@ -141,7 +145,7 @@ int ioctl(int fd, unsigned long request, ...)
+ 		result64 = true;
+ 		break;
+ 	default:
+-		fail("unexpected %s %lu", __func__, request);
++		fail("unexpected %s %lu", __func__, (unsigned long) request);
+ 	}
+ 	check(mock_cmds->remaining_cmds,
+ 	      "unexpected %s command", mock_cmds->name);
+-- 
+2.40.1
+
diff --git a/meta-oe/recipes-support/libnvme/libnvme_1.5.bb b/meta-oe/recipes-support/libnvme/libnvme_1.6.bb
similarity index 94%
rename from meta-oe/recipes-support/libnvme/libnvme_1.5.bb
rename to meta-oe/recipes-support/libnvme/libnvme_1.6.bb
index 4b6f1e30b..37e5d6301 100644
--- a/meta-oe/recipes-support/libnvme/libnvme_1.5.bb
+++ b/meta-oe/recipes-support/libnvme/libnvme_1.6.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c \
                     file://ccan/licenses/CC0;md5=c17af43b05840255a6fedc5eda9d56cc \
                     file://ccan/licenses/BSD-MIT;md5=838c366f69b72c5df05c96dff79b35f2"
 DEPENDS = "json-c"
-SRCREV = "4fea83db8328ea788ea8f1001e8ce1cb80ef5fae"
+SRCREV = "37a803cf77e224f66d86b1e1d9e74a15f55ea600"
 
 SRC_URI = "git://github.com/linux-nvme/libnvme;protocol=https;branch=master"
 
-- 
2.40.1


