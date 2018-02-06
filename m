Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f67.google.com (mail-pl0-f67.google.com
	[209.85.160.67])
	by mail.openembedded.org (Postfix) with ESMTP id 7B438600BC
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  6 Feb 2018 07:46:27 +0000 (UTC)
Received: by mail-pl0-f67.google.com with SMTP id t4so778262plo.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 05 Feb 2018 23:46:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=bX7fJaVhEEGZLxD2keQIv6S//uqcz1kG5KwX8Jt97EE=;
	b=PZRjZnz2RfmIiksbqbUoFa7xFpkTPnYB6wo2c4TY/TECCixtpy/TDu7zsVnyivnHBS
	8AtXD/hGKRNOqmWNfUmTDO35aHPVqMCvah5NiFHJr/fNyKerkAE6wPdFrX066gxdamI6
	fcdsIBvQL1fLvnzinbYGMTAwCk9GCCDKPxonI39Thk7k7Qqw0kAHAj2DDEzeq7jhs9kL
	EeaNEbBV7iXL5gyPZXDHS3mENGvl9f73wXfJbAk68HlRYfkq2vB2S4btu4zKabLomAGl
	3n3X91rvo/bsJNtF4Knqwo9a5rHdHgFpHF26Kl4tvXbc4krEVvIFjeIRkdBneNZB+DYM
	vdIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=bX7fJaVhEEGZLxD2keQIv6S//uqcz1kG5KwX8Jt97EE=;
	b=B8DOjDN6s/DS5EEEJAMfp4XsIa+nvukrNwjLGXhhCUmNjBTfcStqn7zhZ/MmJ+6gcd
	fM1xIpGZoi+LZ9g6/gwZl+hyAXkMGANPstsqdA2kSOYkHj5PAsWrVFc/9zK3hp0dw7LL
	5CB2cQEYiesy6C8v2vLvQZdh00Ncw3SZI3KngznDc9/30ecq6HiIhenvlR2ivuHmE939
	T/P1COJlBE+zEGiIPvfdlfRAO2tY7vprwg8wX7yLI9CQKWwZuJX3kaKt++lMVQWHazqZ
	FKOOBEZUF6puEuUkhGPf7miHUND1UgiBuelDu+gQLs9hZe0dLMUsdEFyJ1mZv4TxxDEb
	+QQg==
X-Gm-Message-State: APf1xPAn/x6XmA8sy+WLhOjgS5X0V8lQHIj+H3IJJiciSjveeT/mNyk9
	KiQyTn7W6a4B6hHA27rIEud2yA==
X-Google-Smtp-Source: AH8x225hWgMNT7zxyqxobbqsAwUttoo3Ju9tN3Aa2qUFEqc+kIg7zhdbxDkRpgbQatd5Sn9ePWT/hQ==
X-Received: by 2002:a17:902:8f98:: with SMTP id
	z24-v6mr1564534plo.311.1517903188454; 
	Mon, 05 Feb 2018 23:46:28 -0800 (PST)
Received: from localhost.localdomain ([2601:646:8880:466c::5590])
	by smtp.gmail.com with ESMTPSA id
	s90sm20976060pfi.139.2018.02.05.23.46.27
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 05 Feb 2018 23:46:27 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  5 Feb 2018 23:46:14 -0800
Message-Id: <20180206074619.22165-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.16.1
Subject: [meta-networking][PATCH 1/6] mdns: Do not include nss.h with musl
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
X-List-Received-Date: Tue, 06 Feb 2018 07:46:27 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...mdns-Do-not-include-nss.h-when-libc-glibc.patch | 42 ++++++++++++++++++++++
 .../recipes-protocols/mdns/mdns_765.50.9.bb        |  1 +
 2 files changed, 43 insertions(+)
 create mode 100644 meta-networking/recipes-protocols/mdns/files/0001-nss_mdns-Do-not-include-nss.h-when-libc-glibc.patch

diff --git a/meta-networking/recipes-protocols/mdns/files/0001-nss_mdns-Do-not-include-nss.h-when-libc-glibc.patch b/meta-networking/recipes-protocols/mdns/files/0001-nss_mdns-Do-not-include-nss.h-when-libc-glibc.patch
new file mode 100644
index 000000000..863866d18
--- /dev/null
+++ b/meta-networking/recipes-protocols/mdns/files/0001-nss_mdns-Do-not-include-nss.h-when-libc-glibc.patch
@@ -0,0 +1,42 @@
+From d3082d2c606c810aa0a39378bf1e02575af3a301 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 2 Feb 2018 21:54:11 -0800
+Subject: [PATCH] nss_mdns: Do not include nss.h when libc != glibc
+
+Provide nss_status macro instead for non-glibc case
+where nss.h is absent
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ mDNSPosix/nss_mdns.c | 13 ++++++++++++-
+ 1 file changed, 12 insertions(+), 1 deletion(-)
+
+diff --git a/mDNSPosix/nss_mdns.c b/mDNSPosix/nss_mdns.c
+index afadb3c..c469584 100755
+--- a/mDNSPosix/nss_mdns.c
++++ b/mDNSPosix/nss_mdns.c
+@@ -378,8 +378,19 @@ init_config ();
+ 
+ #define ENTNAME  hostent
+ #define DATABASE "hosts"
+-
++#ifdef __GLIBC__
+ #include <nss.h>
++#else
++enum nss_status
++{
++    NSS_STATUS_TRYAGAIN = -2,
++    NSS_STATUS_UNAVAIL,
++    NSS_STATUS_NOTFOUND,
++    NSS_STATUS_SUCCESS,
++    NSS_STATUS_RETURN
++};
++#define NETDB_INTERNAL NULL
++#endif
+ // For nss_status
+ #include <netdb.h>
+ // For hostent
+-- 
+2.16.1
+
diff --git a/meta-networking/recipes-protocols/mdns/mdns_765.50.9.bb b/meta-networking/recipes-protocols/mdns/mdns_765.50.9.bb
index 1a80f7acb..9a7152fcf 100644
--- a/meta-networking/recipes-protocols/mdns/mdns_765.50.9.bb
+++ b/meta-networking/recipes-protocols/mdns/mdns_765.50.9.bb
@@ -9,6 +9,7 @@ RPROVIDES_${PN} += "libdns_sd.so"
 SRC_URI = "http://opensource.apple.com/tarballs/mDNSResponder/mDNSResponder-${PV}.tar.gz \
            file://build.patch;patchdir=.. \
            file://mdns.service \
+           file://0001-nss_mdns-Do-not-include-nss.h-when-libc-glibc.patch;patchdir=.. \
            "
 
 SRC_URI[md5sum] = "4a6bc1628851002634ea3833a4dca317"
-- 
2.16.1


