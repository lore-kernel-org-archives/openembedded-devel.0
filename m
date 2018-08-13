Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com
	[209.85.210.176])
	by mail.openembedded.org (Postfix) with ESMTP id 3237174F9F
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Aug 2018 08:18:01 +0000 (UTC)
Received: by mail-pf1-f176.google.com with SMTP id d4-v6so7357916pfn.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Aug 2018 01:18:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=kB1bo580py/4jfljriYmC3YPxk/sRnIQl+VIfKIDGWM=;
	b=Ldu4O+4FRFTSu5tvaraF4sR+LrKpnnaxhjqbw9+uBEcB/S8g6+DR5Y9WDsKRDzUIFz
	7VLhYsVwf66Hx+HyyKV7hpA7FCFzhFS8TO9npXzb3u71H/AdoCs3lx23qCoYHIa3SC+J
	/XkC2wqSvjGOpmQ31M7UCivGX+01FEBMPsThUT2vg6AB27Vgd2EOiHvnNAeHwITHB08A
	VQr4jKpiiGHrm+Kgd/maFJMMS+9BnUfF0E9XeQWuCM/SvYQtfYbsvIaNATlQn05TlUnn
	OrhMKZC30fnYq47eIhdUtl0IVjTus+SetSNxGK1jX6uMq8eEhRzk/rz7dHq+g1CxbiH+
	rsnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=kB1bo580py/4jfljriYmC3YPxk/sRnIQl+VIfKIDGWM=;
	b=PCHUeFyXhI5bMAfZCjIiKMHb4cLBaCB6bposOzpFVW5W7oKvthT37A9B6/iNgllTdo
	hE+rctnQo53dwvSC3znr6cP1kCkNXf6azyEcWM5B5WXR673g9VmgZwehm4FpvQlg+tSz
	kPM3QJ/xziKcStOnUvAqkXiSw850QFNKDVKdtUyOiAqZh6i1D/3hcq6jfwzPhCBBoJZk
	xz+DBs7qfmaCitKPQqPClfZOJLh+U1RUi1wgPFCb7yxeIjucMQ+odtJB9EhcQhPhABoa
	GyBa/uFpBEqT9MfyV5lfSgWlLKg8kqdJ+LwYglO2VqUuv1Eh5GDHi5Uy1alr4MdDvNH5
	En9g==
X-Gm-Message-State: AOUpUlHGxWBT6UItQDX2qrS6C0mhs8/Tcv/0Tg9X+kbaOfMB2NNN8JOq
	be0UBPa+0WePoNMj04KN+WX0oS76
X-Google-Smtp-Source: AA+uWPwhptFtzyj2lF9U0otTlv9mcSIZPjVCrhm9qJvZkvzH/CSpW+NZlGVxNFPcStEDoPe5mHef7g==
X-Received: by 2002:aa7:84c2:: with SMTP id
	x2-v6mr10559047pfn.220.1534148281934; 
	Mon, 13 Aug 2018 01:18:01 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::f217])
	by smtp.gmail.com with ESMTPSA id
	b64-v6sm23414971pfg.66.2018.08.13.01.18.00
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 13 Aug 2018 01:18:00 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 13 Aug 2018 01:17:30 -0700
Message-Id: <20180813081742.6961-9-raj.khem@gmail.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180813081742.6961-1-raj.khem@gmail.com>
References: <20180813081742.6961-1-raj.khem@gmail.com>
Subject: [meta-filesystems][PATCH 09/21] logfsprogs: Fix build with glibc 2.28
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
X-List-Received-Date: Mon, 13 Aug 2018 08:18:01 -0000

mkfs.c:639: undefined reference to `major'

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...smacros.h-for-major-minor-definition.patch | 24 +++++++++++++++++++
 .../logfsprogs/logfsprogs_git.bb              |  1 +
 2 files changed, 25 insertions(+)
 create mode 100644 meta-filesystems/recipes-filesystems/logfsprogs/logfsprogs/0001-include-sys-sysmacros.h-for-major-minor-definition.patch

diff --git a/meta-filesystems/recipes-filesystems/logfsprogs/logfsprogs/0001-include-sys-sysmacros.h-for-major-minor-definition.patch b/meta-filesystems/recipes-filesystems/logfsprogs/logfsprogs/0001-include-sys-sysmacros.h-for-major-minor-definition.patch
new file mode 100644
index 0000000000..86bb0b53af
--- /dev/null
+++ b/meta-filesystems/recipes-filesystems/logfsprogs/logfsprogs/0001-include-sys-sysmacros.h-for-major-minor-definition.patch
@@ -0,0 +1,24 @@
+From 3b02acbb3d5bc93422a6821ce47568633ef4ae5e Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 11 Aug 2018 15:09:24 -0700
+Subject: [PATCH] include sys/sysmacros.h for major/minor definition
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ mkfs.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/mkfs.c b/mkfs.c
+index e612cbd..b6aa63d 100644
+--- a/mkfs.c
++++ b/mkfs.c
+@@ -21,6 +21,7 @@
+ #include <sys/ioctl.h>
+ #include <sys/stat.h>
+ #include <sys/types.h>
++#include <sys/sysmacros.h>
+ #define __USE_UNIX98
+ #include <unistd.h>
+ #include <zlib.h>
diff --git a/meta-filesystems/recipes-filesystems/logfsprogs/logfsprogs_git.bb b/meta-filesystems/recipes-filesystems/logfsprogs/logfsprogs_git.bb
index 1b4d97d762..d9864ac3e8 100644
--- a/meta-filesystems/recipes-filesystems/logfsprogs/logfsprogs_git.bb
+++ b/meta-filesystems/recipes-filesystems/logfsprogs/logfsprogs_git.bb
@@ -14,6 +14,7 @@ DEPENDS = "zlib"
 SRC_URI = "git://github.com/prasad-joshi/logfsprogs.git \
            file://0001-Add-LDFLAGS-to-linker-cmdline.patch \
            file://0001-btree-Avoid-conflicts-with-libc-namespace-about-setk.patch \
+           file://0001-include-sys-sysmacros.h-for-major-minor-definition.patch \
            "
 SRCREV = "45b72c81ce3c6fa17ca19bafc207ea93e76312f4"
 
-- 
2.18.0


