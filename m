Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id 7D8C578915
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Mar 2018 06:03:14 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id x1so6645154pfh.7
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 18 Mar 2018 23:03:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=NgPUnAIYHaR3eA8jmS7bAUreibCAfcedV534xZH9ffs=;
	b=sT8K+DFa8OHu2q4PTqjRTn45QQ4fuIp8lGOS+RlHRWS04hOz0//DwDjYckQetCxNWT
	vj5T0RtOLnGjHLb1JQ4Oge6iBRKFVJlKQi2vw7p8k9wFj6g6nv3D3SQao1gtNalRGJtz
	CZEMYRiUKytAirdEMLipdr0sa5J3hqHkx9oh9sobc9+ziYfjuOA2F97Dhfi3K9lQXKJf
	80X/HGTroFH3X9sn20XXtnUihmp/QGxgRhBhjxqXo1WXMlJCAm2Vk2AS8JCU1hZpEdwH
	fHqqMXUIDm9L/Efw2schxb+FU9ZPdvy57qu15yASG06JFo84BSq50U7G7l6+8o3fwKnt
	pOCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=NgPUnAIYHaR3eA8jmS7bAUreibCAfcedV534xZH9ffs=;
	b=iPBMZNCSaCVCF9FtAtuzD73eTSXzW/fb2KpBcKfWs96gSv+Ls9qI9QJfKypgyy+ZHo
	9oTZIVnjyO2MRFfdDd/tKtA7sF9ZRdwt02gUfseMsViGjV4D3gYWKuSZYlqVgPcIInhp
	mkq6kKWCPbLnRnQdkH/y8YafeWDET7f4ifri98qXUCNaKy4KL92VBlgN5sk32MadD/ea
	+ZPVQqhK5r4MD2y5HhZ3b9U5RUuF1DZT9C1P7Th/YqZZ1BVXOmgOtVI2oVkaojYzL/o3
	bS/mHsKG4K2evrFYsJyqNpeFb1V6IhY8hCxxZQNB0g84KluFNmM0yfz8JvZIL+/gdzYO
	1k5Q==
X-Gm-Message-State: AElRT7HeT51g5PGKJEmAZnhgXam0e/sfu1iLOXkTDjayNO+GNoBby7aj
	GDEy6CiadKKHT3Ce33rG/nnAWw==
X-Google-Smtp-Source: AG47ELv+6vZnTL8ONX2DS/uPIqWekTCehvK5/+2j7jEsXU2pjkEQcfwv4lPukTo0Kbpf2oW1CzNJYw==
X-Received: by 10.98.156.16 with SMTP id f16mr9270812pfe.180.1521439395450;
	Sun, 18 Mar 2018 23:03:15 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8880:466c:6245:cbff:fe64:591])
	by smtp.gmail.com with ESMTPSA id
	a22sm5047426pgw.10.2018.03.18.23.03.13
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 18 Mar 2018 23:03:13 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 18 Mar 2018 23:02:44 -0700
Message-Id: <20180319060300.5366-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.16.2
In-Reply-To: <20180319060300.5366-1-raj.khem@gmail.com>
References: <20180319060300.5366-1-raj.khem@gmail.com>
Subject: [meta-networking][PATCH 02/18] mdns: Do not include nss.h with musl
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
X-List-Received-Date: Mon, 19 Mar 2018 06:03:14 -0000

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
2.16.2


