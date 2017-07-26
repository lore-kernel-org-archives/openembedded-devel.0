Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f66.google.com (mail-pg0-f66.google.com [74.125.83.66])
	by mail.openembedded.org (Postfix) with ESMTP id CD972601F1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Jul 2017 18:58:31 +0000 (UTC)
Received: by mail-pg0-f66.google.com with SMTP id 123so7529527pgj.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Jul 2017 11:58:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=2cJAsdKGu7IZmxLZ7ZrTapvZ4nBgI+4DmQGEaa9qXhA=;
	b=vhST3OzyJ3jrpZq3+yEc+BanZp38llFr8HQVtpDrNb+1j2MMAcYB2bPzIb9R3n+0/x
	O3XblqntblI2iYHBpyEOn6hkhBRGoic6ZJmL6h9OmYCTJORr5sAzRTKlx6qM7JHGxcUa
	m8MyRU4thFsFwLwni1Gk2WwAkOgZH1SVaAv84vVMhwDL+glCoJmF5sG05ogtqxXOimU9
	JdHtn9jIqL0en8A92v3dVr61F2dflLmVWnJyH0L+DckiOvsVCZORkk290OkdZ5HaLc33
	a72fUIzu6RTylUIhKQ5bcVWZeYKe+7DmATt+zpQoeyOCU2N36/hpoAJGu0uUlIXhBbUu
	osUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=2cJAsdKGu7IZmxLZ7ZrTapvZ4nBgI+4DmQGEaa9qXhA=;
	b=H5rc28Lda5uqU+iSTu9bV7AC+G38TUfFFHIUk3wYwb2SR3E6DAOk0Sv+2vYBCIcTlo
	VkFglxto17bZAZASdb4oRA0GZiWAWEoXpcTrD8mKWi0uVY/NGMXs/7W7BzrezeEXDaCj
	2BtObWmoGKoJUZPiyz9TsnC9GaHhkP+EGX7aO/6HHVoFM3Bb9v1rUO812i9w6A9Tkatp
	j+Zj5829XJd0sllBpzTiw/L/KUgHu3ZDif6CEJjkaFzqg1siZj9tDWsdCEYcyB52F6WJ
	MfyboEqxoWNK5bLidhXwLOaU5MWMmLOL3vuLI/IHXkSzz6D67i6EAmPg87AnploDpMtH
	fdvw==
X-Gm-Message-State: AIVw112sRymdncMypyqIil06yVNS+LlOlnuKHEzOOaYHvLQTubN7al+7
	gydkpE12XRShEA+C
X-Received: by 10.84.231.194 with SMTP id g2mr1901356pln.5.1501095512762;
	Wed, 26 Jul 2017 11:58:32 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::9b53])
	by smtp.gmail.com with ESMTPSA id
	s15sm33245864pfk.42.2017.07.26.11.58.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 26 Jul 2017 11:58:31 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 26 Jul 2017 11:58:11 -0700
Message-Id: <20170726185815.8898-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.3
In-Reply-To: <20170726185815.8898-1-raj.khem@gmail.com>
References: <20170726185815.8898-1-raj.khem@gmail.com>
Subject: [meta-networking][PATCH 3/7] libesmtp: Fix config.h define for snprintf detection
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
X-List-Received-Date: Wed, 26 Jul 2017 18:58:32 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-support/libesmtp/libesmtp/snprintf.patch  | 19 +++++++++++++++++++
 .../recipes-support/libesmtp/libesmtp_1.0.6.bb        |  4 +++-
 2 files changed, 22 insertions(+), 1 deletion(-)
 create mode 100644 meta-networking/recipes-support/libesmtp/libesmtp/snprintf.patch

diff --git a/meta-networking/recipes-support/libesmtp/libesmtp/snprintf.patch b/meta-networking/recipes-support/libesmtp/libesmtp/snprintf.patch
new file mode 100644
index 000000000..d0d203ead
--- /dev/null
+++ b/meta-networking/recipes-support/libesmtp/libesmtp/snprintf.patch
@@ -0,0 +1,19 @@
+Use HAVE_WORKING_SNPRINTF to check for snprintf()
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Index: libesmtp-1.0.6/missing.h
+===================================================================
+--- libesmtp-1.0.6.orig/missing.h
++++ libesmtp-1.0.6/missing.h
+@@ -43,7 +43,7 @@ int strncasecmp (const char *a, const ch
+ void *memrchr (const void *a, int c, size_t len);
+ #endif
+ 
+-#ifndef HAVE_SNPRINTF
++#ifndef HAVE_WORKING_SNPRINTF
+ #include <sys/types.h>
+ int snprintf(char *s, size_t n, const char *format, ...);
+ #endif
diff --git a/meta-networking/recipes-support/libesmtp/libesmtp_1.0.6.bb b/meta-networking/recipes-support/libesmtp/libesmtp_1.0.6.bb
index 7ddf591eb..71c5d940b 100644
--- a/meta-networking/recipes-support/libesmtp/libesmtp_1.0.6.bb
+++ b/meta-networking/recipes-support/libesmtp/libesmtp_1.0.6.bb
@@ -9,7 +9,9 @@ SECTION = "libs"
 DEPENDS = "openssl"
 
 SRC_URI = "http://www.stafford.uklinux.net/libesmtp/libesmtp-${PV}.tar.bz2 \
-           file://include-topdir.patch"
+           file://include-topdir.patch \
+           file://snprintf.patch \
+          "
 SRC_URI[md5sum] = "bf3915e627fd8f35524a8fdfeed979c8"
 SRC_URI[sha256sum] = "d0a61a5c52d99fa7ce7d00ed0a07e341dbda67101dbed1ab0cdae3f37db4eb0b"
 
-- 
2.13.3


