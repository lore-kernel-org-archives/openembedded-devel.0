Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f181.google.com (mail-pf0-f181.google.com
	[209.85.192.181])
	by mail.openembedded.org (Postfix) with ESMTP id 04AF4788F7
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Mar 2018 06:03:15 +0000 (UTC)
Received: by mail-pf0-f181.google.com with SMTP id d26so6647648pfn.5
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 18 Mar 2018 23:03:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=YGnldYrB0meFZ66RUxZj+xcOyFAzTo8IIc90CfO/yuc=;
	b=Sxpxf4wjJavj/50Qxy2sos45RmkfWniI4ZJ4jMQy6Ueuri5BeHe7mznaIC4jnP7+BU
	RAhxgpfEvZ04QEOVMKkIpa5yD3C6i4xYwnIhBRZzOUSFJBSTm26BFJxy91U+AYQMZARk
	Q9XjYJJmXPELxEGXmRsRXvuLJMAFkXVtvhk5QQlKkTHY3rzWuzl88p88edlv5JYqod1X
	dBePujXC44KwT1bQzQ1u13QMPbiWfhz1GzD+8a2WMHAfL7szopJZTJsMRvRkyLK+VdQP
	1kfandXo5Qf+2JTN3/7xI3qQeS9U05DB0hVwS0DYFgNvSwf24bikHVJ6YjJDIwKFLBd1
	8R6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=YGnldYrB0meFZ66RUxZj+xcOyFAzTo8IIc90CfO/yuc=;
	b=TbZVa1pUoeZvdQfhGhzSSiekY1r3PBu1EHk+2lIO4sYxEanyszk3IKJM6o1bTNXr/x
	BNtNUxUr0ynSyW60jEaupssqdCWBzHZJ6a3+HvCv75f8JC7IBgXLa75pJ/j36WXB91Ls
	+MivufzBpJHhBR+vQVoCc7Zp7nHib6x1TYjbKuSLMdmJYR7ckdkUPQwbGQle+ZJv7IVK
	HnTGebH2HUWlnLszCibKAe89DQmH1x88LbUWStcVhfmsjrgkcZ7x20tRzoDyVsy2Mjyy
	vsEr3wq3g8mgSWgnOvm1Ryq7Ne1SGYmUZslgbL7beoQLcj5O25WlkhtSijnejRgj3h/E
	TXPw==
X-Gm-Message-State: AElRT7GivmMZAcCGKjoLItIp7ymIjrNT7amfX/nfXF5DtZB9AKZ94D7x
	MQbDao1/6EfsknHHjmFry8puZQ==
X-Google-Smtp-Source: AG47ELuAwLaQXjQ0ScNVMc62lHqXDosIsaWHgJejDXVmpifANdqlXXdhjWHmzBvYmnCGvWyBSyEQog==
X-Received: by 10.98.226.16 with SMTP id a16mr9182581pfi.157.1521439396845;
	Sun, 18 Mar 2018 23:03:16 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8880:466c:6245:cbff:fe64:591])
	by smtp.gmail.com with ESMTPSA id
	a22sm5047426pgw.10.2018.03.18.23.03.15
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 18 Mar 2018 23:03:16 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 18 Mar 2018 23:02:45 -0700
Message-Id: <20180319060300.5366-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.16.2
In-Reply-To: <20180319060300.5366-1-raj.khem@gmail.com>
References: <20180319060300.5366-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 03/18] mraa: Fix build on musl
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
X-List-Received-Date: Mon, 19 Mar 2018 06:03:16 -0000

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
index 16883be3a..366d6b70f 100644
--- a/meta-oe/recipes-extended/mraa/mraa_git.bb
+++ b/meta-oe/recipes-extended/mraa/mraa_git.bb
@@ -8,7 +8,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4b92a3b497d7943042a6db40c088c3f2"
 SRCREV = "fbb7d9232067eac3f4508a37a8f7ea0c4fcebacb"
 PV = "1.9.0-git${SRCPV}"
 
-SRC_URI = "git://github.com/intel-iot-devkit/${BPN}.git;protocol=http"
+SRC_URI = "git://github.com/intel-iot-devkit/${BPN}.git;protocol=http \
+           file://0001-include-endian.h-for-be16toh-and-le16toh-declaration.patch \
+           "
 
 S = "${WORKDIR}/git"
 
-- 
2.16.2


