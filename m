Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com
	[209.85.208.53])
	by mail.openembedded.org (Postfix) with ESMTP id F1E2E7D538
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  7 Apr 2019 14:49:33 +0000 (UTC)
Received: by mail-ed1-f53.google.com with SMTP id q14so9396848edr.5
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 07 Apr 2019 07:49:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=ToYffyvU4AAfeJBhrTMcgi6/6vBgvEcrX3TtexAfp6k=;
	b=CwJq37pRXIqRa42Z9itJz3HndWlyprsnRGyWtN4HylxHTYXo3L+Acd9fqcZt946+UA
	+HPOo1W/zQxFCf7OFcPGXHppIDCSpCyWZZ7SyXMBSKZwpwFpBv3La69EzP0/KA5CaLMJ
	mczz3wSqb6JFLS5iCpk+/sLyCf9ErCrkv0W4DPwAxsmVuWtGoFiYvOGI9DSVPvAmpdIb
	m2ObJXbq4G5WRKBg+R3ZBtPzzPRQvuF0TkVM+QPpL5/xYvA8ui+6HSXyp0Ge081fO/AX
	yekiwH98qX5jqRTs8ZIJfti9lGugvfHstNp+pq8b1u6OtjGOZBtueOeAsX2Q2h8bJroL
	dHeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=ToYffyvU4AAfeJBhrTMcgi6/6vBgvEcrX3TtexAfp6k=;
	b=cXbYzeo+/BOL8SnVxUXe+jUaLTzjJYFNJOp7eSs4NRtccj1zdXs6UNajLPGN63cUM6
	48H3P+UaAOPeod3nWIPH8vs0wgtJ8ZknYiYzrPGmtDn/dxxnNSou1bYkDcUbS/d0YoVy
	LTMzjlrsGAcn7zaEilCGeOngmJwc4wdC0rXHhS8sy+K3WnOpf7+HpzQ2rvdzbdxkhNpK
	epTx6V8k68kP3L6GSr0GVXw2uVX9s02GD5Y6TNXf+SENiNy/b9/KpEFVyToAf7uUNAMD
	zMdN+Lsn98nL5XQ/Ai/q0c/SsNvLZOmWmshVAna9kK/8+j2TdtQjxKs5xeX7tTVSS4+U
	RbVA==
X-Gm-Message-State: APjAAAX2cHlbJqrMXWXLo2atgVvAovzrTybKf1KF2TAP8vAufcW4Dwpp
	EytNdFHg0NPRogvhdYJ0jgHjQRoBOyw=
X-Google-Smtp-Source: APXvYqyU7OLdKdfQLElHWhNP7IY5ABWeC4zFg/YL+mL8GQJKzGS81U9o1buSUcSFT8LyEM2euxlzBA==
X-Received: by 2002:a17:906:5a95:: with SMTP id
	l21mr4884887ejq.219.1554648574252; 
	Sun, 07 Apr 2019 07:49:34 -0700 (PDT)
Received: from localhost.localdomain (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108])
	by smtp.gmail.com with ESMTPSA id g10sm196439edi.23.2019.04.07.07.49.33
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 07 Apr 2019 07:49:33 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  7 Apr 2019 16:49:31 +0200
Message-Id: <20190407144931.32553-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH][meta-networking] open-isns: update to 0.99
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
X-List-Received-Date: Sun, 07 Apr 2019 14:49:34 -0000

Removed patch has been upstreammed.

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 ...dian.h-is-available-on-musl-on-linux.patch | 38 -------------------
 .../{open-isns_0.98.bb => open-isns_0.99.bb}  |  6 +--
 2 files changed, 2 insertions(+), 42 deletions(-)
 delete mode 100644 meta-networking/recipes-support/open-isns/open-isns/0001-util.h-endian.h-is-available-on-musl-on-linux.patch
 rename meta-networking/recipes-support/open-isns/{open-isns_0.98.bb => open-isns_0.99.bb} (86%)

diff --git a/meta-networking/recipes-support/open-isns/open-isns/0001-util.h-endian.h-is-available-on-musl-on-linux.patch b/meta-networking/recipes-support/open-isns/open-isns/0001-util.h-endian.h-is-available-on-musl-on-linux.patch
deleted file mode 100644
index fbdc4e911..000000000
--- a/meta-networking/recipes-support/open-isns/open-isns/0001-util.h-endian.h-is-available-on-musl-on-linux.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From e0d86318227a23f00cf0f6639a6685bb9f5771a1 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Tue, 12 Dec 2017 09:42:19 -0800
-Subject: [PATCH] util.h: endian.h is available on musl on linux
-
-just checking for glibc alone is not enough since
-it excludes musl, therefore check for platform
-being linux as well
-
-Fixes build issues
-
-include/libisns/util.h:114:12: fatal error: sys/endian.h: No such file or directory
- #  include <sys/endian.h>
-            ^~~~~~~~~~~~~~
-
-Upstream-Status: Submitted
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- include/libisns/util.h | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/include/libisns/util.h b/include/libisns/util.h
-index 9a2bd13..6cc1a1b 100644
---- a/include/libisns/util.h
-+++ b/include/libisns/util.h
-@@ -100,7 +100,7 @@ enum {
-  * There's no htonll yet
-  */
- #ifndef htonll
--# ifdef __GLIBC__
-+# if defined(__GLIBC__) || defined(__linux__)
- #  include <endian.h>
- #  include <byteswap.h>
- #  if __BYTE_ORDER == __BIG_ENDIAN
--- 
-2.15.1
-
diff --git a/meta-networking/recipes-support/open-isns/open-isns_0.98.bb b/meta-networking/recipes-support/open-isns/open-isns_0.99.bb
similarity index 86%
rename from meta-networking/recipes-support/open-isns/open-isns_0.98.bb
rename to meta-networking/recipes-support/open-isns/open-isns_0.99.bb
index 5e64f893e..a03b92f5f 100644
--- a/meta-networking/recipes-support/open-isns/open-isns_0.98.bb
+++ b/meta-networking/recipes-support/open-isns/open-isns_0.99.bb
@@ -13,11 +13,9 @@ SECTION = "net"
 
 DEPENDS = "openssl"
 
-SRC_URI = "git://github.com/open-iscsi/open-isns \
-           file://0001-util.h-endian.h-is-available-on-musl-on-linux.patch \
-           "
+SRC_URI = "git://github.com/open-iscsi/open-isns"
 
-SRCREV = "e84374ce7d1f5fc58a4c0fc751e075b2cc752c34"
+SRCREV = "cfdbcff867ee580a71bc9c18c3a38a6057df0150"
 
 S = "${WORKDIR}/git"
 
-- 
2.17.1


