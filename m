Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com
	[209.85.215.177])
	by mail.openembedded.org (Postfix) with ESMTP id DC7D3607A5
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Aug 2018 08:18:02 +0000 (UTC)
Received: by mail-pg1-f177.google.com with SMTP id w10-v6so7204358pgv.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Aug 2018 01:18:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=tQ61MxXvEjUd+l5DYbvfXclNPm0qx+iSK03pq7VvDhs=;
	b=Vc/+K76jUQeSsv4tpm+rwGQuUifKSiw1yWyGovXpU08Joo+vVQuRG36ZDNhjMJQZCU
	En9O53uiEc8IOCO5OPY4VQw7fgwK/Gj/3lZB7qZ/yd2dSZ5zG24Rwu6P4FjBkxzpfzKY
	HXzfq2NQRAesvYeiOv90Yl3Se0k4VKnRDo34TRXCq94XNoPLG9kATWa34lShnsC6gkfQ
	L6oB3AwLEQgltqP+ymZM0mFMpva0e4vAd0c2Y91IGdbfoEjpta5MZN3YIaY9WcUPaByR
	PLYdPoPFq21O/OLXWbUpQAVKwYB6apHxnCNGK/XnwJR25eh8Lrh2V6Oogjs1OYfdwwzB
	k7ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=tQ61MxXvEjUd+l5DYbvfXclNPm0qx+iSK03pq7VvDhs=;
	b=bJ/CfdMKZn1AzZLbvzIKGEMLGUumU54KQbi4FBEDBsb2kqYMflq5zKs7j4aH0YOtp0
	AAu77o4qqyCju9g9M60SS9ScGD/scsTxt07ZTeAt60QoT6C+3b3th59O6wxwD6XwCrw0
	EJSBPUMfWrDvT0oLrCla8+rI78s1tM+DsTNPPnuoN03a5tC6DlY6c4NEVeuamWsn2aiK
	b/LTNE1vfe3yX0g1pWGAqTy+YvL/7CzIyI9xveTBg6Ny2St9yBXf7n8yaXIpuMXE77TL
	ouE+qcjdw9td26C/3JQqIK0DBRkzhQJ40aZuXS0P4h0FAuB7wHkS/z/WXFubZ3QDSkEb
	PgkA==
X-Gm-Message-State: AOUpUlFEYgLqDzFGA87Vqjde0y6nDFZjY5TLXN3zqmc8Ehf7uK7rTwGP
	c56+8GyAkhtk5+BjCiJVojg+nmVS
X-Google-Smtp-Source: AA+uWPzBuk6KFWYFekItD9a2fGdGhFyMBkwU7eQsa2C5FFQxxXK1YxFJIdyrMZPne71wj1TMLV+fYQ==
X-Received: by 2002:a62:a05:: with SMTP id
	s5-v6mr17827248pfi.147.1534148283387; 
	Mon, 13 Aug 2018 01:18:03 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::f217])
	by smtp.gmail.com with ESMTPSA id
	b64-v6sm23414971pfg.66.2018.08.13.01.18.01
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 13 Aug 2018 01:18:02 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 13 Aug 2018 01:17:31 -0700
Message-Id: <20180813081742.6961-10-raj.khem@gmail.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180813081742.6961-1-raj.khem@gmail.com>
References: <20180813081742.6961-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 10/21] lockdev: Fix build with glibc 2.28+
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
X-List-Received-Date: Mon, 13 Aug 2018 08:18:03 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...macros.h-for-major-minor-definitions.patch | 30 +++++++++++++++++++
 .../recipes-support/lockdev/lockdev_git.bb    |  4 ++-
 2 files changed, 33 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-support/lockdev/lockdev/0001-include-sys-sysmacros.h-for-major-minor-definitions.patch

diff --git a/meta-oe/recipes-support/lockdev/lockdev/0001-include-sys-sysmacros.h-for-major-minor-definitions.patch b/meta-oe/recipes-support/lockdev/lockdev/0001-include-sys-sysmacros.h-for-major-minor-definitions.patch
new file mode 100644
index 0000000000..12f5be981b
--- /dev/null
+++ b/meta-oe/recipes-support/lockdev/lockdev/0001-include-sys-sysmacros.h-for-major-minor-definitions.patch
@@ -0,0 +1,30 @@
+From 2f39dc3d6f920c0826aa74367da1a0a7cc49b0fe Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 11 Aug 2018 15:18:04 -0700
+Subject: [PATCH] include sys/sysmacros.h for major/minor definitions
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+inclusion of <sys/sysmacros.h> by <sys/types.h> is deprecated.
+This means that in a future release, the macros “major”, “minor”, and
+“makedev” will only be available from <sys/sysmacros.h>.
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/lockdev.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/lockdev.c b/src/lockdev.c
+index 9a0fca5..3581938 100644
+--- a/src/lockdev.c
++++ b/src/lockdev.c
+@@ -117,6 +117,7 @@
+ #include <sys/stat.h>
+ #include <sys/file.h>
+ #include <sys/types.h>
++#include <sys/sysmacros.h>
+ #include <sys/wait.h>
+ #include "lockdev.h"
+ #include "ttylock.h"
diff --git a/meta-oe/recipes-support/lockdev/lockdev_git.bb b/meta-oe/recipes-support/lockdev/lockdev_git.bb
index 507ce3fe57..5ad7f0c503 100644
--- a/meta-oe/recipes-support/lockdev/lockdev_git.bb
+++ b/meta-oe/recipes-support/lockdev/lockdev_git.bb
@@ -6,7 +6,9 @@ LIC_FILES_CHKSUM="file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 PV = "1.0.3+git${SRCPV}"
 
 SRCREV = "16b899645d32012cc94cc9232f64d4ddaaf0b795"
-SRC_URI = "git://anonscm.debian.org/lockdev/lockdev.git"
+SRC_URI = "git://anonscm.debian.org/lockdev/lockdev.git \
+           file://0001-include-sys-sysmacros.h-for-major-minor-definitions.patch \
+           "
 
 S = "${WORKDIR}/git"
 
-- 
2.18.0


