Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f66.google.com (mail-pl0-f66.google.com
	[209.85.160.66])
	by mail.openembedded.org (Postfix) with ESMTP id BE94878933
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Mar 2018 06:03:24 +0000 (UTC)
Received: by mail-pl0-f66.google.com with SMTP id w12-v6so9638205plp.4
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 18 Mar 2018 23:03:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=3RoWVr7bVCDotjaIwRYkQ2HYN1aVYHmamy0WqC/XtIc=;
	b=ozpV7ybEvVsP/D0sO82+xA1OiqzHeGKaJhBI/9MZc8JwNzM8c5BAE0NtDz7bEgopZX
	cFCC0blhwOG66D8k0BLeXM2z7hcOiiFwDE7OvSQhy0924wVaUPfDDJNxI5LBNHD0XgNB
	xl1LSMTcsNhGSpczKCP6T0UZxoJUoZBRcdzCpbrfWvd/odwYh8APUTVsJsndFpJLg7el
	/K3NiR5zJyN60oovGTykWn7mWw2gJbfeG3jEVShVwka97cOhxYMq/ViYheYB4amiLQsJ
	nw+U1XcS6pjCxrcSMj23NCaFa2hYXkGszwZ9gG1KNCN/cnC4OPB8HLhN0agiU/k/0nAj
	ROgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=3RoWVr7bVCDotjaIwRYkQ2HYN1aVYHmamy0WqC/XtIc=;
	b=SILBek2LjH5Xgnuv2ZjWc5IAljW8LSCPZM37jJA6+2y2KZiTWWKWggfMj49qN1AM55
	pCFy4ZElpRlwamtFtrXWshBRgT7AIvvzK56czLntd2D/8LqNR68CGQk5IoCTw84WUKp+
	ofYi719p6PDwjpqkVnW/mdu7LE+UOcum1w8Q6ApuqQvPhS4AvZqGJsdBC5cUq0hDpghT
	/M5pKMkgNHSeMHgpeGpApZg4lTc49AaUdKOXDmEIyw2ZLGwKp6oWEiA5jsy4FPSkKaxo
	Bj1+vtsryFItFKOA62j8rAHSqAIXJrG5fcInd73rFTsQ6MElKBRN6x/bEDPUVwUHNtjj
	S6jQ==
X-Gm-Message-State: AElRT7HiG5QxBFPuxNHF9aVKqlN8ehbVm+6JHvqcJ81/jP+BAa5TPZHr
	sktbyvdZZmeu5tD9RHNZTmxx/A==
X-Google-Smtp-Source: AG47ELv5LLWjwxSoPj3hzRNBRjJOEQnLf7uhV+jjyYAoACEXdqU/H2t6VkxeA3joLRgDvYamHAPbSA==
X-Received: by 2002:a17:902:264:: with SMTP id
	91-v6mr11254747plc.178.1521439405886; 
	Sun, 18 Mar 2018 23:03:25 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8880:466c:6245:cbff:fe64:591])
	by smtp.gmail.com with ESMTPSA id
	a22sm5047426pgw.10.2018.03.18.23.03.24
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 18 Mar 2018 23:03:24 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 18 Mar 2018 23:02:52 -0700
Message-Id: <20180319060300.5366-10-raj.khem@gmail.com>
X-Mailer: git-send-email 2.16.2
In-Reply-To: <20180319060300.5366-1-raj.khem@gmail.com>
References: <20180319060300.5366-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 10/18] mraa: Drop residual patch
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
X-List-Received-Date: Mon, 19 Mar 2018 06:03:24 -0000

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


