Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com
	[209.85.210.170])
	by mail.openembedded.org (Postfix) with ESMTP id 9A3D87ECC2
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  6 Sep 2019 21:25:21 +0000 (UTC)
Received: by mail-pf1-f170.google.com with SMTP id x127so5418831pfb.7
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 06 Sep 2019 14:25:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=w4X7/GvPbTQKdUASR/t+QevFD08qC8B2pyEeSeu1XBI=;
	b=Vge8WwMm3K2qdjNNyaYKH3uWSCs0b8ubZomhsgMrQYvIXWuaOsfqPDSRexFwi9REQc
	1EXJ/HrF0778SJuMOIcQyydV9wUFSPNoMCXI6emaq17h/v9G8WMsCbhp3tyBB+JR7vGN
	+l0pZvFaoDn+nlzJ7A59H2rUJHpQVS5BMMdxhNeeUnxhllB7JZKeJxHFcVEkFBpkms70
	MK5YzT2LFgC9drFYlJzVtFdSko66sDiOzh8dFdA2X0mjvqrC/IzLBQf1w9VDq3x5HRjp
	sNYrXKZozcZorY2bMFn2jNAt4P0mnX549QpLXVd28G7Oo+yDb0ieOfkHZJwaqAHw+927
	JDqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=w4X7/GvPbTQKdUASR/t+QevFD08qC8B2pyEeSeu1XBI=;
	b=rATocHmK298F1TB2Q/S5py/5cof5YUIZLKNq4Z2QIw4TjAbMBeZBKvS5X/fWDV+gK2
	ryPtHC11kFQYuAUPUhGS+0DOGx3uwgd0WXaoDT7Uk1lUDXxtksYOqwNV7I4pc/ExbRGS
	/P2mhdir+VY/Y+fYoAzOEZuktnL5yinuNKH9Abc2OtDE9Abq/U6A8KS7dzkQSrjL9xHl
	kvIEexhBUaBd4hK4V4P8HGfzunyZXMdnl5aDZuSw2gbjHCfmloTCHH8JzChuUn6Qc66r
	V7kakZ7oKPD0ByKzahpjJIfhTl61+IS6ru8gsFr6qhVxYRvi4PicVhSX5tHNawi0CSky
	wilQ==
X-Gm-Message-State: APjAAAVXhNnsG17x8ALV3xi4sbH9YVppPtVwiwEGhaCU8/ojkG5PZ8yp
	lAjPTiGBN+ZAmmTq4bFLraHoPleNXsw=
X-Google-Smtp-Source: APXvYqy/7z1L67H1rRSaw6sjZ4YIYiClTaKZOeuYuOYAITpYmRfWPX9qOqWdt0RcGMLzaRk+eMzaAA==
X-Received: by 2002:a17:90b:948:: with SMTP id
	dw8mr12000087pjb.48.1567805121417; 
	Fri, 06 Sep 2019 14:25:21 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net (c-73-71-176-3.hsd1.ca.comcast.net.
	[73.71.176.3]) by smtp.gmail.com with ESMTPSA id
	c127sm9973660pfb.5.2019.09.06.14.25.20
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 06 Sep 2019 14:25:20 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  6 Sep 2019 14:25:13 -0700
Message-Id: <20190906212513.16415-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Subject: [meta-oe][PATCH] ltrace: Fix build on mips
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
X-List-Received-Date: Fri, 06 Sep 2019 21:25:21 -0000
Content-Transfer-Encoding: 8bit

Newer kernel UAPI headers for mips have moved these needed defines
around

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../ltrace/ltrace/include_unistd_nr.patch     | 30 +++++++++++++++++++
 meta-oe/recipes-devtools/ltrace/ltrace_git.bb |  1 +
 2 files changed, 31 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/ltrace/ltrace/include_unistd_nr.patch

diff --git a/meta-oe/recipes-devtools/ltrace/ltrace/include_unistd_nr.patch b/meta-oe/recipes-devtools/ltrace/ltrace/include_unistd_nr.patch
new file mode 100644
index 0000000000..e4490bbb9e
--- /dev/null
+++ b/meta-oe/recipes-devtools/ltrace/ltrace/include_unistd_nr.patch
@@ -0,0 +1,30 @@
+kernel headers have restructured mips syscall generation in kernel
+in recent versions, however, ltrace still has logic to define the
+syscall numbers based on old logic, this patch includes the legacy
+UAPI headers to get these defines
+
+Fixes errors e.g.
+../../../../git/sysdeps/linux-gnu/mips/trace.c:138:29: error: '__NR_O32_Linux' undeclared (first use in this function)
+  const int syscallbase[] = {__NR_O32_Linux, __NR_N32_Linux,
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+--- a/sysdeps/linux-gnu/mips/trace.c
++++ b/sysdeps/linux-gnu/mips/trace.c
+@@ -34,6 +34,16 @@
+ #include <assert.h>
+ #include <asm/unistd.h>
+ 
++#ifndef __NR_O32_Linux
++#include <asm/unistd_nr_o32.h>
++#endif
++#ifndef __NR_N32_Linux
++#include <asm/unistd_nr_n64.h>
++#endif
++#ifndef __NR_N64_Linux
++#include <asm/unistd_nr_n32.h>
++#endif
++
+ #include "backend.h"
+ #include "common.h"
+ #include "debug.h"
diff --git a/meta-oe/recipes-devtools/ltrace/ltrace_git.bb b/meta-oe/recipes-devtools/ltrace/ltrace_git.bb
index 3dc269c80e..ead637cb7e 100644
--- a/meta-oe/recipes-devtools/ltrace/ltrace_git.bb
+++ b/meta-oe/recipes-devtools/ltrace/ltrace_git.bb
@@ -27,6 +27,7 @@ SRC_URI = "git://github.com/sparkleholic/ltrace.git;branch=master;protocol=http
            file://0001-mips-plt.c-Delete-include-error.h.patch \
            file://0001-move-fprintf-into-same-block-where-modname-and-symna.patch \
            file://0001-hook-Do-not-append-int-to-std-string.patch \
+           file://include_unistd_nr.patch \
            "
 S = "${WORKDIR}/git"
 
-- 
2.23.0


