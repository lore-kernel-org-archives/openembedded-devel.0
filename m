Return-Path: <cvubrugier@fastmail.fm>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6148CD6130
	for <webhook@archiver.kernel.org>; Mon,  9 Oct 2023 19:48:12 +0000 (UTC)
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com [66.111.4.27])
 by mx.groups.io with SMTP id smtpd.web11.72914.1696880884455384428
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 Oct 2023 12:48:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fastmail.fm header.s=fm2 header.b=LQs6uDaM;
 dkim=pass header.i=@messagingengine.com header.s=fm2 header.b=AulIEW2m;
 spf=pass (domain: fastmail.fm, ip: 66.111.4.27, mailfrom: cvubrugier@fastmail.fm)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailout.nyi.internal (Postfix) with ESMTP id BA3DD5C0377;
	Mon,  9 Oct 2023 15:48:03 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Mon, 09 Oct 2023 15:48:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.fm; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:sender:subject
	:subject:to:to; s=fm2; t=1696880883; x=1696967283; bh=gmc/3nPHf5
	im/NnYE2AKA+jHcsQ7qq/Qs0BmCAvIRVM=; b=LQs6uDaMVNzUi1bH/PNdPUJT5E
	AzdraIR+CO39uKd3y+WDZV1wwUW4lGfB9Jcf0JCwKKD3lFTENcIpe13rjZYGQUsC
	I55uvnv6v9VM503+eJ26TvmkTSsKivw/IOqqu0Wn9acEV5hMwcbyXc3Cewxksepb
	ryNUrsWvB0w/gFmgQ7pbMTGDBiw+GIODD72YMLnM4wxPpZzixYxzVmEFf621U6qc
	AbNlmRVjBf9g8/ZXDGrycGuwQVWfg0DkVu7bsGVObVRRykWcQCymnLiM4QWvEbXJ
	XvgTnsNylI7nI0mT9jtB5urp7TDI+Tn/PiZri/CI0ditqwieHdeKP+Ec08+A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1696880883; x=1696967283; bh=gmc/3nPHf5im/
	NnYE2AKA+jHcsQ7qq/Qs0BmCAvIRVM=; b=AulIEW2mYDUAPJIZ6Tc2HvcPQdRg7
	y7Ciy977zUlQ3f4Zh25coXbi8KLwhWff/niRYXJdkAq7wdq8tKVKFxHKOtuUALSc
	A8564zvEzC+/xjOq5gi7XM/6cTD9utRkaLK/Jmp9jTI6j6PCFS6Y6r5qIzaro2Jf
	JYRx08ooYnXVKUjL9WU6ZvIRlo2hI1xt5Y3zB12bRT0/BX5YzJw0AhNwsOSKoJB+
	/x+g+B7WcGi4OCr0I0o8KRZr2P6gjrAjAThJ/b1nVf/7XcGSw/esCthNNrM0AgPZ
	OC7DEQIBoN37oOVzhi99nM5WmerqXvpf7EivRuWvZyGrk1rufEl2WNTFg==
X-ME-Sender: <xms:81gkZSvUDt5-W1kBcVBNWlBZqgGHx1sEfF8MXBCRNWODuZxDv3MtDg>
    <xme:81gkZXcUiQiBle_CNcqxNauxh2Fp1wVfCR4Ii9CFZBPe_b4q5UoTW0RL5uzzikBqL
    qTl56aC0eMdVblv2A>
X-ME-Received: <xmr:81gkZdz41NGzxp6Ymq6fZ82hrTkyhOeON99cq9_CXZyOm4FWOxxZuBbgT8hPXmw39UFlbvDkCTRowBanvqUg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrheefgddugeduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgggfestdekredtredttdenucfhrhhomheptghvuhgsrhhu
    ghhivghrsehfrghsthhmrghilhdrfhhmnecuggftrfgrthhtvghrnhepjefgtefghfetgf
    eljeeuieejgfeiffeffeekgfefkeffieetledvfffhveeulefhnecuffhomhgrihhnpehg
    ihhthhhusgdrtghomhdpghgvnhhtohhordhorhhgnecuvehluhhsthgvrhfuihiivgeptd
    enucfrrghrrghmpehmrghilhhfrhhomheptghvuhgsrhhughhivghrsehfrghsthhmrghi
    lhdrfhhm
X-ME-Proxy: <xmx:81gkZdMJ9ybrR-VxIOQhf-AG8uygj6OsqCguGkOh1djRR-OdReZWtA>
    <xmx:81gkZS-Fys7qhq_2NDBoddRmWUYnjLFhWa4RhXb5wOwZx2sIVs22vA>
    <xmx:81gkZVWLHQqx8Ux5AI67UncCwcoUtfufq-8ytAnmyHCzhaH_qqElNA>
    <xmx:81gkZXHVHRcof-OEcX8HPph9ifLeFtejQqIyEioPO003LMjZAprWLw>
Feedback-ID: i09e840f8:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 9 Oct 2023 15:48:03 -0400 (EDT)
From: cvubrugier@fastmail.fm
To: openembedded-devel@lists.openembedded.org
Cc: Christophe Vu-Brugier <christophe.vu-brugier@seagate.com>
Subject: [meta-oe][PATCH] libnvme: apply patch already upstream to fix build with musl
Date: Mon,  9 Oct 2023 21:47:50 +0200
Message-Id: <20231009194750.131009-1-cvubrugier@fastmail.fm>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 09 Oct 2023 19:48:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105392

From: Christophe Vu-Brugier <christophe.vu-brugier@seagate.com>

Build failure with musl due to conflicting definitions of ioctl()
between glibc and musl has been fixed by libnvme developers with this
commit:

 * https://github.com/linux-nvme/libnvme/commit/ca47ba3119365eafac0ab25a86cab9d9a1b29bd4

Signed-off-by: Christophe Vu-Brugier <christophe.vu-brugier@seagate.com>
---
 ...l-Check-for-ioctl-signature-for-musl.patch | 38 -----------
 ...01-test-handle-POSIX-ioctl-prototype.patch | 68 +++++++++++++++++++
 .../recipes-support/libnvme/libnvme_1.6.bb    |  2 +-
 3 files changed, 69 insertions(+), 39 deletions(-)
 delete mode 100644 meta-oe/recipes-support/libnvme/libnvme/0001-ioctl-Check-for-ioctl-signature-for-musl.patch
 create mode 100644 meta-oe/recipes-support/libnvme/libnvme/0001-test-handle-POSIX-ioctl-prototype.patch

diff --git a/meta-oe/recipes-support/libnvme/libnvme/0001-ioctl-Check-for-ioctl-signature-for-musl.patch b/meta-oe/recipes-support/libnvme/libnvme/0001-ioctl-Check-for-ioctl-signature-for-musl.patch
deleted file mode 100644
index 06f7b5712..000000000
--- a/meta-oe/recipes-support/libnvme/libnvme/0001-ioctl-Check-for-ioctl-signature-for-musl.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From ad1ac4215f051bd42b7ddf64dad63d8215cc3ac4 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sat, 7 Oct 2023 17:50:54 -0700
-Subject: [PATCH] ioctl: Check for ioctl signature for musl
-
-Fixes
-../git/test/ioctl/mock.c:117:5: error: conflicting types for 'ioctl'
-  117 | int ioctl(int fd, unsigned long request, ...)
-      |     ^
-/mnt/b/yoe/master/build/tmp/work/cortexa15t2hf-neon-yoe-linux-musleabi/libnvme/1.6/recipe-sysroot/usr/include/sys/ioctl.h:115:5: note: previous declaration is here
-  115 | int ioctl (int, int, ...);
-      |     ^
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- test/ioctl/mock.c | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/test/ioctl/mock.c b/test/ioctl/mock.c
-index e917244..7d5c983 100644
---- a/test/ioctl/mock.c
-+++ b/test/ioctl/mock.c
-@@ -114,7 +114,11 @@ void end_mock_cmds(void)
- 	} \
- })
- 
-+#if defined(__linux__) && !defined(__GLIBC__)
-+int ioctl(int fd, int request, ...)
-+#else
- int ioctl(int fd, unsigned long request, ...)
-+#endif
- {
- 	struct mock_cmds *mock_cmds;
- 	bool result64;
--- 
-2.42.0
-
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
diff --git a/meta-oe/recipes-support/libnvme/libnvme_1.6.bb b/meta-oe/recipes-support/libnvme/libnvme_1.6.bb
index 26ad36d7d..802edac50 100644
--- a/meta-oe/recipes-support/libnvme/libnvme_1.6.bb
+++ b/meta-oe/recipes-support/libnvme/libnvme_1.6.bb
@@ -14,7 +14,7 @@ DEPENDS = "json-c"
 SRCREV = "37a803cf77e224f66d86b1e1d9e74a15f55ea600"
 
 SRC_URI = "git://github.com/linux-nvme/libnvme;protocol=https;branch=master \
-           file://0001-ioctl-Check-for-ioctl-signature-for-musl.patch \
+           file://0001-test-handle-POSIX-ioctl-prototype.patch \
 "
 
 S = "${WORKDIR}/git"
-- 
2.40.1


