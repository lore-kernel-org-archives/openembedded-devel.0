Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-io1-f67.google.com (mail-io1-f67.google.com
	[209.85.166.67])
	by mail.openembedded.org (Postfix) with ESMTP id 7256A7F214
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Aug 2019 19:41:12 +0000 (UTC)
Received: by mail-io1-f67.google.com with SMTP id l7so1952349ioj.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Aug 2019 12:41:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=QwdnAvMyTndKal91R2q4JAR977odBxadghrkPKPg5A4=;
	b=hJmlzYGucZJWyx1R1VIU/hvcI9H3wCP5Us/JWVaq+ybCy//ZwAZgcW5FcKSnmgzo8I
	CLj+1qsYJvx+XVwceewzY2MetKwcMfBHhOUC9AZZO+JjDAHKydSeL5X7a6k6HOlwTi86
	p655OOKjpTdDoQCJ2Xo00/1tH0Uo2eu9Omai3J8k8sbeoa2c30BGl9RCCx7qcciy/uY7
	U4pjGvnnR7dXMnBUGH1IXiO5BfJ0HCnX4bUOzxvIsjIlRCUjo97HxOE4Rq7QP4+wb8Wx
	CElDqdcglbj54ddkRCKL6ziTJVMoXy4BGyIiYRLj+dXZYC+7gsFUkM5UldNWlVM0fWkP
	Mq/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=QwdnAvMyTndKal91R2q4JAR977odBxadghrkPKPg5A4=;
	b=KyF753kbM5+jS53iWzgFy5emVb20hWegsSBCQ83YjdSXLMh8yC8mYKXfTpg9W09juh
	BowT2PJDNulhSFkvy4zq9l1ODZRcA9ezcpmx4Y9YGgqz3L3OsB8vsoYeV1y0xX6GcMjn
	oTNvuxKgIqLlrJeUg9ZkidXz8cXWdd799XrvNzFRe7Yme+QDxMvn98EjmG2i9ZpITs54
	IG6FB+AUTWSB8GyeZURhAANLT6t1SXsFoKzQTvHQvyInPkolhg+mAVscwlGg1pDsjJ24
	iLBsCxLzY5QsrOxXv1y50B8SXQJRN7c5pDaU1e5wIUFljVPBvugR75G9qzC5dM5c7qEL
	8xBw==
X-Gm-Message-State: APjAAAVYxqMG0ukNOOL5SuhXf1fwDNwACcZJ3ba/Jn2WB49nn8qmW3ms
	F8zOgxksS83Diq4HNQJ4W3JNpxEhLWQ=
X-Google-Smtp-Source: APXvYqwOhEV7/UNt3YLLFmJ0ljx4YlSKkowTVkC32H818qsdrQz9CX3aZ1JTJBmIm31YygJrf2KTwA==
X-Received: by 2002:a02:852d:: with SMTP id g42mr5945394jai.93.1567021273315; 
	Wed, 28 Aug 2019 12:41:13 -0700 (PDT)
Received: from localhost.localdomain
	(CPEe8de27b71faa-CM64777d5e8820.cpe.net.cable.rogers.com.
	[174.112.251.208]) by smtp.gmail.com with ESMTPSA id
	h18sm3447894iob.80.2019.08.28.12.41.11
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 28 Aug 2019 12:41:12 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: raj.khem@gmail.com,
	openembedded-devel@lists.openembedded.org
Date: Wed, 28 Aug 2019 15:41:10 -0400
Message-Id: <20190828194110.34843-1-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Subject: [meta-networking][PATCH] dnsmasq: fix build against 5.2 headers
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
X-List-Received-Date: Wed, 28 Aug 2019 19:41:12 -0000
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Upstream linux y2038 work has moved some definitions SIOCGSTAMP is
defined in linux/sockios.h, not asm/sockios.h now. So we need to
add that include to fix the build.

Upstream-status: backport of http://thekelleys.org.uk/gitweb/?p=dnsmasq.git;a=commit;h=3052ce208acf602f0163166dcefb7330d537cedb

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---

This is part of my linux-yocto 5.2 introduction series, but is safe for
inclusion even without that in core.

Bruce

 ...nsmasq-fix-build-against-5.2-headers.patch | 31 +++++++++++++++++++
 .../recipes-support/dnsmasq/dnsmasq_2.80.bb   |  1 +
 2 files changed, 32 insertions(+)
 create mode 100644 meta-networking/recipes-support/dnsmasq/dnsmasq/0001-dnsmasq-fix-build-against-5.2-headers.patch

diff --git a/meta-networking/recipes-support/dnsmasq/dnsmasq/0001-dnsmasq-fix-build-against-5.2-headers.patch b/meta-networking/recipes-support/dnsmasq/dnsmasq/0001-dnsmasq-fix-build-against-5.2-headers.patch
new file mode 100644
index 000000000..844a70985
--- /dev/null
+++ b/meta-networking/recipes-support/dnsmasq/dnsmasq/0001-dnsmasq-fix-build-against-5.2-headers.patch
@@ -0,0 +1,31 @@
+From 52f4b58c14a2788ca08b7d8884d586724d86fc66 Mon Sep 17 00:00:00 2001
+From: Bruce Ashfield <bruce.ashfield@gmail.com>
+Date: Mon, 19 Aug 2019 14:46:02 +0000
+Subject: [PATCH] dnsmasq: fix build against 5.2 headers
+
+Upstream linux y2038 work has moved some definitions SIOCGSTAMP is
+defined in linux/sockios.h, not asm/sockios.h now. So we need to
+add that include to fix the build.
+
+Upstream-status: backport of http://thekelleys.org.uk/gitweb/?p=dnsmasq.git;a=commit;h=3052ce208acf602f0163166dcefb7330d537cedb
+
+Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
+---
+ a/src/dnsmasq.h                   | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/build/tmp/work/core2-64-poky-linux/dnsmasq/2.80-r0/dnsmasq-2.80/src/dnsmasq.h b/build/tmp/work/core2-64-poky-linux/dnsmasq/2.80-r0/dnsmasq-2.80/src/dnsmasq.h
+index f53e9a5be6..d9225ea473 100644
+--- a/src/dnsmasq.h
++++ b/src/dnsmasq.h
+@@ -138,6 +138,7 @@ typedef unsigned long long u64;
+ #endif
+ 
+ #if defined(HAVE_LINUX_NETWORK)
++#include <linux/sockios.h>
+ #include <linux/capability.h>
+ /* There doesn't seem to be a universally-available 
+    userspace header for these. */
+-- 
+2.19.1
+
diff --git a/meta-networking/recipes-support/dnsmasq/dnsmasq_2.80.bb b/meta-networking/recipes-support/dnsmasq/dnsmasq_2.80.bb
index fdbdefbad..6f3d5daa6 100644
--- a/meta-networking/recipes-support/dnsmasq/dnsmasq_2.80.bb
+++ b/meta-networking/recipes-support/dnsmasq/dnsmasq_2.80.bb
@@ -4,5 +4,6 @@ SRC_URI[dnsmasq-2.80.md5sum] = "1f071fd11454e1cffea73bdadcf70b21"
 SRC_URI[dnsmasq-2.80.sha256sum] = "9e4a58f816ce0033ce383c549b7d4058ad9b823968d352d2b76614f83ea39adc"
 SRC_URI += "\
     file://lua.patch \
+    file://0001-dnsmasq-fix-build-against-5.2-headers.patch \
 "
 
-- 
2.19.1


