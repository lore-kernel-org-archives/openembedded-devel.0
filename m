Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com
	[209.85.210.175])
	by mail.openembedded.org (Postfix) with ESMTP id 5F2C37F278
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 29 Sep 2019 23:55:21 +0000 (UTC)
Received: by mail-pf1-f175.google.com with SMTP id a2so4491677pfo.10
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 29 Sep 2019 16:55:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=UpItrfm/12uCk7WJ0JxhYqbLmZEWF/7b8kL62mAkLlo=;
	b=V+V5NSadBrxyEVR8ONTPYXVbcf8QI+5rZTcyYmv95L/5qAzCeRKefDob3ROkv+8uOK
	y9bKHSDYDEcQh+TUYkhIbP+8pAHRtyKVJ83a/e5oGl4GpaYmn1pmbkPKXCHCKuVNyWDZ
	nsbe1EUNgPSaxvLAbC8EYNEw/UhKI5xdJHDAiwg+2n75lE/7YU7MAEQSpv/drXQEEKZv
	r7m6soYWzJhWNG8DtGGze7buaCJXb78U6U6AxLowlJ2JwBNRCDwPlhsxb4J57RwAK76x
	QG2GGLZ0Rn3eTO7zRCO7cV5wC/wsnhc5TjcrlxUsUHVnEDSU9dJ43Ei3S7lTrBrzZfUD
	n3pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=UpItrfm/12uCk7WJ0JxhYqbLmZEWF/7b8kL62mAkLlo=;
	b=m3e8e2sPqmUCsveKDUGZiKxaaM0uZmjmwiq/3R3fUAAE1Sz+ioq56sKrQRd4B8p/zk
	4gdDNIZ32GXGkfO2+5AOpJoIFSHnd+Te3Eq4QA4WQKed4Tl8clYwuauN0fTgXwrEJIK+
	hWuxqJiwEsZURlV3Dqt7sciSF3WSIYvtNhGBKFkshb3u/oxG6wlAWOUWRTLw57RloHsL
	ZhNukQqBcYUdOZ7fGAI3hiMMVbhcPa556w/BAz+kFxT/3eP3Szsh2dKHXdhNkrl2rtlJ
	AIbUOfY/BhP1S3c+BUnwPd1Km+GVr4d5bGmvw+in3a5ufV7EgoYfHW8k7zebJioNk2qR
	uASA==
X-Gm-Message-State: APjAAAUrhUy5GFMcQVOR4q//xpn3M3nEakSgJ8hamClgiE7pmcA4IDLF
	Q2b2kHC+Jr+azZe+BZOkroOrpKXEh9Q=
X-Google-Smtp-Source: APXvYqz2zlPPgRZHoD81AUmlO2uN0OqecBFHB78+Se4yFOXXGLgW4UL0trHgTfnZQ1qjxuwLnmlAJw==
X-Received: by 2002:a62:2ccf:: with SMTP id
	s198mr18480760pfs.216.1569801322359; 
	Sun, 29 Sep 2019 16:55:22 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:a5c0:edf9:811d:ad92:85c2])
	by smtp.gmail.com with ESMTPSA id
	p190sm14474778pfb.160.2019.09.29.16.55.21
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 29 Sep 2019 16:55:21 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 29 Sep 2019 16:55:03 -0700
Message-Id: <206ee91b621de630fcfb4e792eb0fa8627b11b29.1569801183.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1569801183.git.akuster808@gmail.com>
References: <cover.1569801183.git.akuster808@gmail.com>
Subject: [warrior-next 05/10] klibc: Disable bcmp builtin for clang on glibc as well
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
X-List-Received-Date: Sun, 29 Sep 2019 23:55:21 -0000

From: Khem Raj <raj.khem@gmail.com>

Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 806fbbf81788648e567dc79c2bea98de69f79cc0)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-initramfs/recipes-devtools/klibc/klibc.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-initramfs/recipes-devtools/klibc/klibc.inc b/meta-initramfs/recipes-devtools/klibc/klibc.inc
index 7faf0ca..86aae33 100644
--- a/meta-initramfs/recipes-devtools/klibc/klibc.inc
+++ b/meta-initramfs/recipes-devtools/klibc/klibc.inc
@@ -34,7 +34,7 @@ ARMPATCHES_arm = "file://klibc-config-eabi.patch \
 S = "${WORKDIR}/git"
 
 OPTFLAGS = "${TUNE_CCARGS} -Os"
-OPTFLAGS_append_libc-musl_toolchain-clang = " -fno-builtin-bcmp"
+OPTFLAGS_append_toolchain-clang = " -fno-builtin-bcmp"
 
 PARALLEL_MAKE = ""
 EXTRA_OEMAKE = "'KLIBCARCH=${KLIBC_ARCH}' \
-- 
2.7.4


