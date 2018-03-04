Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id B17C078A8A
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  4 Mar 2018 20:41:46 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id u5so6336001pfh.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 04 Mar 2018 12:41:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=3RoWVr7bVCDotjaIwRYkQ2HYN1aVYHmamy0WqC/XtIc=;
	b=OiUJeiPdGOYVjOC8BgO0UbcF1TlIZk/hr4f5R3vNNNuP6hA/cXHImfd7MK6qO0nrhH
	O1x382rPAUZf+lJc3rBz3maqR0KCvTUua27/J+QQAX8FFpSwM4Dp7Rqmbi1YkwJIHfW0
	EYgJZRFawlNDrCl7RVyq8Zx8c6A/mOzint+YEsJOBVT7QkDms6+1TPVwLN2DUe61kCzU
	+Io6F9cgwgjVKkBFty2yjynzzZ0eheIEvdVyd+YYOy0HAwt4MBc5HxqvaA0MBRsEoMKA
	pzpgHcQ7PytuZAOEVx6Digc7DAx+NZReZzbNAqbp9xnOPtMi0cFeqF/uhnu5e2QFsCGe
	IoSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=3RoWVr7bVCDotjaIwRYkQ2HYN1aVYHmamy0WqC/XtIc=;
	b=hTeE9thPXr+zA14nVHaSPwDbzHJR93la2ykGcQNDAJHk3dRt0cpSppAhOxRYzlMzqo
	7C6L0E/5A4bsaHsyQzdMtasJD9/VUIpis6KQi9xtb6ngVSaKcGwqI/fNcGjQvjQyMps3
	upC4L560lK4reBphSDMg0DeVfz+eFehhzoor7hKsqXrN6Fn5dWF+Xq2vKfHZQeBHVfkF
	xBLZv+IoieUpNPpyFWtdBN8oWxr1ip6v02ttyA58dGJyig8nP5PX2nFSjVyJK6mUnAGj
	kpR8DqI+sPYijMVwwJAhpgLaPe4uNKr32JJLEVtM7FUEMT2Dh7yR5x6isP6B1WQFZn7h
	ifcg==
X-Gm-Message-State: APf1xPBHf6ImBdmDPASBMSkH7i43A80txXMT8NMNQFSkmOIOe9x0PLEt
	1xe/wvIXR4CzlKzhmmYdMQywcw==
X-Google-Smtp-Source: AG47ELvgiEKugsC/VUkBmIgtjd8s8ftGqulwD+2m0AHbxjYMmOrWcP1pYGuu5/EYvMA/9XDaZ7y5nQ==
X-Received: by 10.98.17.147 with SMTP id 19mr12855146pfr.160.1520196107601;
	Sun, 04 Mar 2018 12:41:47 -0800 (PST)
Received: from localhost.localdomain ([2601:646:8880:466c:6245:cbff:fe64:591])
	by smtp.gmail.com with ESMTPSA id
	u28sm22943090pfl.19.2018.03.04.12.41.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 04 Mar 2018 12:41:46 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  4 Mar 2018 12:41:28 -0800
Message-Id: <20180304204130.23962-5-raj.khem@gmail.com>
X-Mailer: git-send-email 2.16.2
In-Reply-To: <20180304204130.23962-1-raj.khem@gmail.com>
References: <20180304204130.23962-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 5/7] mraa: Drop residual patch
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
X-List-Received-Date: Sun, 04 Mar 2018 20:41:46 -0000

This patch is already applied upstream see
https://github.com/intel-iot-devkit/mraa/commit/c9566bdc6ff706f80140396a9980eba3d6bd52a1

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...ian.h-for-be16toh-and-le16toh-declaration.patch | 27 ----------------------
 meta-oe/recipes-extended/mraa/mraa_git.bb          |  1 -
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
2.16.2


