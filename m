Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f54.google.com (mail-pl0-f54.google.com
	[209.85.160.54])
	by mail.openembedded.org (Postfix) with ESMTP id B7FD8784CC
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  6 Feb 2018 07:46:30 +0000 (UTC)
Received: by mail-pl0-f54.google.com with SMTP id g18so772281plo.7
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 05 Feb 2018 23:46:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=61B90Hi6y2vUo8TJjTA1hQ9oCg8Ctcg37vRmOW3wwX8=;
	b=RjApfdxCAGsMCCKJN093jhiodDFYsla1fsLIjhGXjnStpT6Igz9OXV8OqAP1M4ckUS
	+vqlv3qW2bC1o2Zj+/Vh41TVQ3zbylTIV6eryyZnFT1jKFyjXVm8+eV60o02W9mRgbyK
	S3pN3tCELJtevKweCanuG3od8ARa8Ms/SRkKqYe2OKF5bLfTG3ttIBfg2ae400LDXrY2
	NhQ3/W4HTvuMkhfrbeqpofHPHADvRqfjYrE1DnLyS7G0wa2kBlqueZ7czmNRAQzokEeG
	LsgUbUybCm+7LCVydBdfysKhaVzawZcz+5F++r985LABz2Wq8UvW2rI1ehOYCvWoh2Tb
	YY4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=61B90Hi6y2vUo8TJjTA1hQ9oCg8Ctcg37vRmOW3wwX8=;
	b=rhMmgOYiDc45a1vg3aqDPLk2cdegL7/MqDCYA/lgYNRkOEKp7HVkRfQnwkx5l/vldr
	56cijE5avOQcV6FPIRCphBzkNdaM+UZMcRsik7tfLP+IbDR2ZD5NujD6qT77nVEeeE4y
	pBQaDmkoEaHmr9nOzICqx2GhehtGPIPUHJgDhT9BuBDCXErefqTqQcfYW7+EZoK5EQzl
	fOyR/Wyprjh1O5jE7fNGTdcH9mlkr195o2SFDsM8M8CvKfKh04IcXKjgX8hHhrMzn/eG
	HX6OeXW9y3zioZ9gI6cy564TNB1jqlasUikleDlJPixcpXOVXVkJL231WJOHrx97iXvr
	SKzQ==
X-Gm-Message-State: APf1xPDjG7LldFMpI9Ayixri7JaYj1aIKfVcauABVsgHFUY8pn/Bc/Aq
	wCsp+IL4J3EnS8l++8kzOWKclg==
X-Google-Smtp-Source: AH8x227zLwvZ9A/YRyipT0p/NPKlcQlV1Ax/VYBhyiglULWOXGxwbhCm7aPtK8rlVQUZ56uqYCbnWw==
X-Received: by 2002:a17:902:3363:: with SMTP id
	a90-v6mr1500017plc.159.1517903191607; 
	Mon, 05 Feb 2018 23:46:31 -0800 (PST)
Received: from localhost.localdomain ([2601:646:8880:466c::5590])
	by smtp.gmail.com with ESMTPSA id
	s90sm20976060pfi.139.2018.02.05.23.46.30
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 05 Feb 2018 23:46:30 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  5 Feb 2018 23:46:16 -0800
Message-Id: <20180206074619.22165-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.16.1
In-Reply-To: <20180206074619.22165-1-raj.khem@gmail.com>
References: <20180206074619.22165-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 3/6] mraa: Fix build on musl
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
X-List-Received-Date: Tue, 06 Feb 2018 07:46:30 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...ian.h-for-be16toh-and-le16toh-declaration.patch | 27 ++++++++++++++++++++++
 meta-oe/recipes-extended/mraa/mraa_git.bb          |  4 +++-
 2 files changed, 30 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-extended/mraa/mraa/0001-include-endian.h-for-be16toh-and-le16toh-declaration.patch

diff --git a/meta-oe/recipes-extended/mraa/mraa/0001-include-endian.h-for-be16toh-and-le16toh-declaration.patch b/meta-oe/recipes-extended/mraa/mraa/0001-include-endian.h-for-be16toh-and-le16toh-declaration.patch
new file mode 100644
index 000000000..711738a92
--- /dev/null
+++ b/meta-oe/recipes-extended/mraa/mraa/0001-include-endian.h-for-be16toh-and-le16toh-declaration.patch
@@ -0,0 +1,27 @@
+From 2c85decc3b93bfe7322309d2ca7d6377e746c18f Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 5 Feb 2018 09:51:08 -0800
+Subject: [PATCH] include endian.h for be16toh and le16toh declarations
+
+Upstream-Status: Submitted [https://github.com/intel-iot-devkit/mraa/pull/863]
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ examples/iio_driver.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/examples/iio_driver.c b/examples/iio_driver.c
+index c5a0181..568011c 100644
+--- a/examples/iio_driver.c
++++ b/examples/iio_driver.c
+@@ -22,6 +22,7 @@
+  * WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
+  */
+ 
++#include <endian.h>
+ #include <unistd.h>
+ #include "mraa/iio.h"
+ 
+-- 
+2.16.1
+
diff --git a/meta-oe/recipes-extended/mraa/mraa_git.bb b/meta-oe/recipes-extended/mraa/mraa_git.bb
index c4b9c6f90..473116e63 100644
--- a/meta-oe/recipes-extended/mraa/mraa_git.bb
+++ b/meta-oe/recipes-extended/mraa/mraa_git.bb
@@ -8,7 +8,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=66493d54e65bfc12c7983ff2e884f37f"
 SRCREV = "8ddbcde84e2d146bc0f9e38504d6c89c14291480"
 PV = "1.7.0-git${SRCPV}"
 
-SRC_URI = "git://github.com/intel-iot-devkit/${BPN}.git;protocol=http"
+SRC_URI = "git://github.com/intel-iot-devkit/${BPN}.git;protocol=http \
+           file://0001-include-endian.h-for-be16toh-and-le16toh-declaration.patch \
+           "
 
 S = "${WORKDIR}/git"
 
-- 
2.16.1


