Return-Path: <cvubrugier@fastmail.fm>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E77B9C27C65
	for <webhook@archiver.kernel.org>; Tue, 11 Jun 2024 18:17:43 +0000 (UTC)
Received: from fout4-smtp.messagingengine.com (fout4-smtp.messagingengine.com [103.168.172.147])
 by mx.groups.io with SMTP id smtpd.web10.1323.1718129860919252912
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Jun 2024 11:17:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fastmail.fm header.s=fm1 header.b=XChcdK8C;
 dkim=pass header.i=@messagingengine.com header.s=fm1 header.b=kRF7WKGz;
 spf=pass (domain: fastmail.fm, ip: 103.168.172.147, mailfrom: cvubrugier@fastmail.fm)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailfout.nyi.internal (Postfix) with ESMTP id 21D661380177;
	Tue, 11 Jun 2024 14:17:40 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Tue, 11 Jun 2024 14:17:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.fm; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to; s=fm1; t=1718129860; x=1718216260; bh=dKu88IzUgFOopIUcl3G+R
	lYk+3nam42zKSJLiN1P3Eo=; b=XChcdK8CZmmAtC/EnkH470rspVWM6d63BgBJp
	i2IGdMQ1LwTiD8YvBEB1qs9aUEDeNr3+1ykNHbmi/HHl4CQa0r2aLQin544NCtXo
	TrwXONymfgIIZAH3IXRduC5wr7dzwtcy1FxBf20lsuSivucJLKSJw6Uf3c7XRd69
	+hkdg0yN1VS9EUryif8eLuzlbthIp0ZT8jHAqD3HWC4DCT1j4SlnVrRhC+TvUXeI
	EcqbP1v2lb7JpC2lYZCUz5o8zzko2kMAzQJEG6ISBg8did3584jXKeJSitGK9m37
	KbRE1AwdfB69tXkMbtSpGAI4Ag/dGgnsMGSC/I9SkKoHqfinA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1718129860; x=1718216260; bh=dKu88IzUgFOopIUcl3G+RlYk+3na
	m42zKSJLiN1P3Eo=; b=kRF7WKGz5ToxNBAN+9UYL0zrYlNbD3XlF1cwrT3A07RA
	9tvjnNdKAi3v9kfOQHNa4PqeTyBlvhGx7n2CPCsXvWlQZ4v9trXuMBQzIXZqNQ5b
	P+0He3ekjEQE6DYqUuvuxAJcwzslMe3jWGXEEkiNVENRJtTub8RHAPUHMjQ8aElL
	5okY+tQusS0CH18RFXCBclIG6JfaLHNyYeCHWwuZqI1W3m1FGjAiMGWQGrsUwRbk
	1hk8NrVPwl9avXkdHEp7nwL8ELiP8M0gleoQIyhtDIp1sS2gf3s3fYUaJTpOqSlm
	EU8yVkpJ/j3ybN/lf04iaxgIJrZYn/lD9MPxjpklzg==
X-ME-Sender: <xms:w5RoZs7yfgO1q2owmK_yoNVpdKCRHiY94ccfQSz4rFRKtKj8sDYJlw>
    <xme:w5RoZt6REE0opoKcemmL20SRypPTsT-MOuXn-x20p7qpQ3aFnTP_qtTNmq-Keeva_
    rKt-MkThEfEYPrcAA>
X-ME-Received: <xmr:w5RoZrfnI6fkkZvEzqSd8Da_9bEq3xBFQfjiQ2TxJWMSBId1Q4eGtCSIlSU0r_QnHRCskrD4n9tZLmUkCdB00DutARCuXXJcki2DcQgLyDe8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrfeduvddguddvudcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefhvfevufffkffoggfgsedtkeertdertddtnecuhfhrohhmpegtvhhusghr
    uhhgihgvrhesfhgrshhtmhgrihhlrdhfmhenucggtffrrghtthgvrhhnpeevuedvieffhf
    fhudejtdefffdtudejteejieetvdeitddvleffffehudeffeejheenucffohhmrghinhep
    ghhnuhdrohhrghdpghhithhhuhgsrdgtohhmnecuvehluhhsthgvrhfuihiivgeptdenuc
    frrghrrghmpehmrghilhhfrhhomheptghvuhgsrhhughhivghrsehfrghsthhmrghilhdr
    fhhm
X-ME-Proxy: <xmx:w5RoZhJ_DwAtKDUYRmjvbf2vJuXVqr6cVzgVIfFKBZEP-6MLNkN9zg>
    <xmx:w5RoZgILn-9bznq6wJfh3FiLeNLyn6LdpLvbLX-XTp4M-ibHFV_5-A>
    <xmx:w5RoZiwYWk1HSF43NrpmL4KHfgRu9kMOaIbjZozyXqP8FXyJRhAIQw>
    <xmx:w5RoZkJkQcRT73Ono1ogtgfssJd4BiMwRQTxvvoz9eIolhnAxqCw-g>
    <xmx:xJRoZnW2az2YuI9rkEheBmHkYHdmp41jhgpZ9Bj7W8Drslq9CjdwLuu->
Feedback-ID: i09e840f8:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 11 Jun 2024 14:17:39 -0400 (EDT)
From: cvubrugier@fastmail.fm
To: openembedded-devel@lists.openembedded.org
Cc: Christophe Vu-Brugier <christophe.vu-brugier@seagate.com>
Subject: [meta-oe][PATCH] usbguard: upgrade 1.1.2 -> 1.1.3
Date: Tue, 11 Jun 2024 20:17:22 +0200
Message-ID: <20240611181722.299187-1-cvubrugier@fastmail.fm>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 11 Jun 2024 18:17:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110830

From: Christophe Vu-Brugier <christophe.vu-brugier@seagate.com>

Drop patch 0001-include-missing-cstdint.patch because it was merged
upstream. See this commit in usbguard:

 * 22b1e08 Fix build for GCC 13 + make GitHub Actions cover build with GCC 13 (#586)

Signed-off-by: Christophe Vu-Brugier <christophe.vu-brugier@seagate.com>
---
 .../0001-include-missing-cstdint.patch        | 45 -------------------
 .../{usbguard_1.1.2.bb => usbguard_1.1.3.bb}  |  3 +-
 2 files changed, 1 insertion(+), 47 deletions(-)
 delete mode 100644 meta-oe/recipes-security/usbguard/usbguard/0001-include-missing-cstdint.patch
 rename meta-oe/recipes-security/usbguard/{usbguard_1.1.2.bb => usbguard_1.1.3.bb} (95%)

diff --git a/meta-oe/recipes-security/usbguard/usbguard/0001-include-missing-cstdint.patch b/meta-oe/recipes-security/usbguard/usbguard/0001-include-missing-cstdint.patch
deleted file mode 100644
index 5cbe64091..000000000
--- a/meta-oe/recipes-security/usbguard/usbguard/0001-include-missing-cstdint.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-From 1da0cfbb9ae978822d961d8b22d8d5125c11247a Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Thu, 26 Jan 2023 23:46:56 -0800
-Subject: [PATCH] include missing <cstdint>
-
-gcc 13 moved some includes around and as a result <cstdint> is no
-longer transitively included [1]. Explicitly include it for
-uint8_t.
-
-[1] https://gcc.gnu.org/gcc-13/porting_to.html#header-dep-changes
-
-Upstream-Status: Submitted [https://github.com/USBGuard/usbguard/pull/583]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/Library/Base64.cpp | 1 -
- src/Library/Base64.hpp | 1 +
- 2 files changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/Library/Base64.cpp b/src/Library/Base64.cpp
-index ddb28dc..0246a13 100644
---- a/src/Library/Base64.cpp
-+++ b/src/Library/Base64.cpp
-@@ -22,7 +22,6 @@
- 
- #include "Base64.hpp"
- #include <stdexcept>
--#include <cstdint>
- 
- namespace usbguard
- {
-diff --git a/src/Library/Base64.hpp b/src/Library/Base64.hpp
-index 0947f21..e0c745c 100644
---- a/src/Library/Base64.hpp
-+++ b/src/Library/Base64.hpp
-@@ -23,6 +23,7 @@
- #endif
- 
- #include <string>
-+#include <cstdint>
- #include <cstddef>
- 
- namespace usbguard
--- 
-2.39.1
-
diff --git a/meta-oe/recipes-security/usbguard/usbguard_1.1.2.bb b/meta-oe/recipes-security/usbguard/usbguard_1.1.3.bb
similarity index 95%
rename from meta-oe/recipes-security/usbguard/usbguard_1.1.2.bb
rename to meta-oe/recipes-security/usbguard/usbguard_1.1.3.bb
index c062f2705..752938057 100644
--- a/meta-oe/recipes-security/usbguard/usbguard_1.1.2.bb
+++ b/meta-oe/recipes-security/usbguard/usbguard_1.1.3.bb
@@ -12,10 +12,9 @@ LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 SRC_URI = "https://github.com/USBGuard/usbguard/releases/download/${BPN}-${PV}/${BPN}-${PV}.tar.gz \
-    file://0001-include-missing-cstdint.patch \
     file://0001-Add-and-use-pkgconfig-instead-of-libgcrypt-config.patch"
 
-SRC_URI[sha256sum] = "dcf5c90f3f93030e04df1baeb8d388b678c40dd48b135ea12a7be7dee8944934"
+SRC_URI[sha256sum] = "707dad2938923202697f636c2b4e0be80f192242039a2af3fc7ac35d03f78551"
 
 inherit autotools-brokensep bash-completion pkgconfig systemd github-releases
 
-- 
2.43.0


