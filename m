Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f54.google.com (mail-pl0-f54.google.com
	[209.85.160.54])
	by mail.openembedded.org (Postfix) with ESMTP id 62C0D60685
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Apr 2018 06:01:42 +0000 (UTC)
Received: by mail-pl0-f54.google.com with SMTP id s13-v6so2163970plq.11
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 Apr 2018 23:01:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=oQKjImHbs1DrmZ5PLLborFCwwZXEq//om/n7mzcC0X0=;
	b=tOPDnSD4snZ2Me70CcL6/HBIykFDGxu5VsxbOYuzGUrZ+0LT565Si9KPLX14BJUZ+z
	LXH/dueigfVEVW4bRsMIvYPdsWNXox57yKET+tTh0OsAIlj9l0K4C02xwJ+xcM8IbM6a
	O47uHhoudvcg8t4pLXQNJRLWKAlLjKW7jfA363E8BrrdPmv4grFeaZfT/+OK2Np1e9OU
	7vkEVDwG677eQBj2KSZWoSiPONbHlqCdV+z/Ad7X9b97oTrQgLyu2YPID2RHM0j0ez0F
	dBOYnWHxPYvcllY9mjL/Fxy4z2jQkU7K2Y5ilWB8BdrrCj0VmhFJz3dY0ApGDuDRtJ1M
	QPjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=oQKjImHbs1DrmZ5PLLborFCwwZXEq//om/n7mzcC0X0=;
	b=prg+KafR+OiZiSUs3x46dIY7C5ovqmCGTZunans6COiDIrzfF9OKLsMQxlhKsuPo2u
	UnT4vBPqvnCVbLEvmnJnMu96AxCCH6SGNKKRUNjCm3MRCW3jlDWF2JMVLOS96yV6kZZY
	PSYzTHRdweM2XbNYPL6UNhSog+eq2GuVQ96p93Yz885YYnSDpPcGUsIKSHFRrR/qPKNw
	uYe2Z5EnGGaT267wJJcqRDusKqg9vtHuJo2MbvCq7NwbxvJHNp/Je3v7yRAuaQ+cah5c
	EAhUOQLRcQVwZVBZr8Jcm+jpgjSv0fsjOSK426pGywl8mkiyRRkhcvZp3sTMHkhQaE2H
	8H7A==
X-Gm-Message-State: ALQs6tBo43oN5agkMwfTmUabH7kPer1y/+K7MSaoI7hhmauK8qQh71XJ
	xqi8fPN7tjUIylNdVNFunA7l1Q==
X-Google-Smtp-Source: AIpwx4+E9lEh532ak8NGL931WcRI+UeqmWnQEglv0ak8e28kDADRp6F7nl0GG3+3fFxY+N3247f9cw==
X-Received: by 2002:a17:902:bd8d:: with SMTP id
	q13-v6mr14365962pls.330.1523858502852; 
	Sun, 15 Apr 2018 23:01:42 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8880:466c::487b])
	by smtp.gmail.com with ESMTPSA id
	75sm22412103pfx.71.2018.04.15.23.01.41
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 15 Apr 2018 23:01:42 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 15 Apr 2018 23:01:29 -0700
Message-Id: <20180416060134.26291-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.17.0
Subject: [meta-oe][PATCH 1/6] mraa: Fix build on musl
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
X-List-Received-Date: Mon, 16 Apr 2018 06:01:42 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...-for-be16toh-and-le16toh-declaration.patch | 27 +++++++++++++++++++
 meta-oe/recipes-extended/mraa/mraa_git.bb     |  4 ++-
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
2.17.0


