Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f65.google.com (mail-pl0-f65.google.com
	[209.85.160.65])
	by mail.openembedded.org (Postfix) with ESMTP id E274C60685
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Apr 2018 06:01:42 +0000 (UTC)
Received: by mail-pl0-f65.google.com with SMTP id t20-v6so9420513ply.9
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 Apr 2018 23:01:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=uFfHaGpnSoY3obW7J8RX7fl1s61u3mFcV4h+8OgTaN8=;
	b=mKbgUf7el2SYFDfjnbqyo56xN/WrlVMh7oAz6yJKd5kJHSAPaeXU3L60qw1aLAN3FQ
	lC7190fB/kD0UvJFcakAesm99T+ZVCUiDrhjL9/0PDh9fQZ0Wi2rxmvJLCAX5hPFYgRS
	6TvKluGNtg8/CB9+Ws6zB98UVZhXNpj3QQDJzrJ+Bif8izwkDVPMKVIULdIrSAhCXwkl
	yhEG+OJFeMlz+/i/Poy4JPyRLjNZVlE2iJkg/fdV0IgNgWXG2+olgWEr6fvym088spr2
	2ulaLqDi1XCKiCE2nUWsjSL+m+zMi9IsgPUmMcpngJlFE0lMfTDfhlT9D2ECuyQvfZuu
	LwzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=uFfHaGpnSoY3obW7J8RX7fl1s61u3mFcV4h+8OgTaN8=;
	b=epJRuHEHixMW8dXX6xQp2IhDvZBKF3e4Pvu97ulDjt3YE25xPJjwneWmS6hbZH3aXc
	jMIjvwWF4FYDLXnG5Jin/ndik1UWvmNojpJUnjD8vnMcGfHruwd568KN5Z6bl3/F+MZf
	sFobXa/88NWbOCrCILxOlvqk4XTmPXAlqZFdBG/yOPVDiuiEeCCa+eyJ27ku3pX3HS1Z
	NvPLkLbjahIC4ERbXurzhmgYliP8E3jqNzkpTGfwYLT6Kagdlby0FAC6pGfLJ5PIBn7x
	cgqlIIuPqxyLGGTW98uFMSY3Uhw/fj3pCr3rASYzP3odRc6jKNLYVS5f7M+QkUwydJHD
	anHQ==
X-Gm-Message-State: ALQs6tCeq2eLPm9Ck6osNlx8M8cDxSJ0SFnmLJQktLSjYCa4H47vQAa2
	aX+0P8EoPRweB8XIB9pyxUpqKQ==
X-Google-Smtp-Source: AIpwx49dpQbXcTFIMHvvoAYLirSS/wSlnIBgoJrbR8rmcwXGu2gA4S0vQg+FluwHaDqv4GWVP0NLAQ==
X-Received: by 2002:a17:902:784c:: with SMTP id
	e12-v6mr14247176pln.60.1523858503655; 
	Sun, 15 Apr 2018 23:01:43 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8880:466c::487b])
	by smtp.gmail.com with ESMTPSA id
	75sm22412103pfx.71.2018.04.15.23.01.42
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 15 Apr 2018 23:01:43 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 15 Apr 2018 23:01:30 -0700
Message-Id: <20180416060134.26291-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180416060134.26291-1-raj.khem@gmail.com>
References: <20180416060134.26291-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 2/6] mraa: Drop residual patch
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
X-List-Received-Date: Mon, 16 Apr 2018 06:01:43 -0000

This patch is already applied upstream see
https://github.com/intel-iot-devkit/mraa/commit/c9566bdc6ff706f80140396a9980eba3d6bd52a1

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...-for-be16toh-and-le16toh-declaration.patch | 27 -------------------
 meta-oe/recipes-extended/mraa/mraa_git.bb     |  1 -
 2 files changed, 28 deletions(-)
 delete mode 100644 meta-oe/recipes-extended/mraa/mraa/0001-include-endian.h-for-be16toh-and-le16toh-declaration.patch

diff --git a/meta-oe/recipes-extended/mraa/mraa/0001-include-endian.h-for-be16toh-and-le16toh-declaration.patch b/meta-oe/recipes-extended/mraa/mraa/0001-include-endian.h-for-be16toh-and-le16toh-declaration.patch
deleted file mode 100644
index 711738a92..000000000
--- a/meta-oe/recipes-extended/mraa/mraa/0001-include-endian.h-for-be16toh-and-le16toh-declaration.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From 2c85decc3b93bfe7322309d2ca7d6377e746c18f Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Mon, 5 Feb 2018 09:51:08 -0800
-Subject: [PATCH] include endian.h for be16toh and le16toh declarations
-
-Upstream-Status: Submitted [https://github.com/intel-iot-devkit/mraa/pull/863]
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- examples/iio_driver.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/examples/iio_driver.c b/examples/iio_driver.c
-index c5a0181..568011c 100644
---- a/examples/iio_driver.c
-+++ b/examples/iio_driver.c
-@@ -22,6 +22,7 @@
-  * WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
-  */
- 
-+#include <endian.h>
- #include <unistd.h>
- #include "mraa/iio.h"
- 
--- 
-2.16.1
-
diff --git a/meta-oe/recipes-extended/mraa/mraa_git.bb b/meta-oe/recipes-extended/mraa/mraa_git.bb
index 366d6b70f..930c04123 100644
--- a/meta-oe/recipes-extended/mraa/mraa_git.bb
+++ b/meta-oe/recipes-extended/mraa/mraa_git.bb
@@ -9,7 +9,6 @@ SRCREV = "fbb7d9232067eac3f4508a37a8f7ea0c4fcebacb"
 PV = "1.9.0-git${SRCPV}"
 
 SRC_URI = "git://github.com/intel-iot-devkit/${BPN}.git;protocol=http \
-           file://0001-include-endian.h-for-be16toh-and-le16toh-declaration.patch \
            "
 
 S = "${WORKDIR}/git"
-- 
2.17.0


