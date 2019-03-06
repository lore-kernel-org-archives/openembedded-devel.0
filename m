Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com
	[209.85.210.179])
	by mail.openembedded.org (Postfix) with ESMTP id 48B0F7C930
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  6 Mar 2019 05:45:55 +0000 (UTC)
Received: by mail-pf1-f179.google.com with SMTP id v21so7612846pfm.12
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 05 Mar 2019 21:45:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=2JpJO0tsvPHAsDKy73C2g7Y6hmb3HG5w+q4A0RaUgLo=;
	b=fgd4VbstlJMKlwUY8Y2dr86su53oBPKD5oVDWlkVxIVuKejRDj15rOSEmncAWBegYQ
	2dhHbIoY5eLmIeC9AVkNwHLEoPxH56bj3ggwl3RMHJ8Rk2eKx+Nb2kOnxty3sUJ/b3k4
	XFnhMSueR9roDEsoaZQIuJTOQblkZmCFtx1Bd/4fjcFX8r4AKTOleor7LA7xxKQ5Edic
	Vu9DcgTsTyi2LMzl7LxOTR6P8NyW4dfL+3CqtTsytWfBfG0c6UBi6lQhBaRORYdVbxcS
	5q0WDIK8SbyTvOaDnQkYDhzk9jkrWNqIuZr1jpOARUUXMtqqXGLndCXhMIZ6fH1N1llQ
	PNLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=2JpJO0tsvPHAsDKy73C2g7Y6hmb3HG5w+q4A0RaUgLo=;
	b=Z5NutCUaGSdeafJ5HvuQfIJEGQwLFNwc5sfdvnNXAB0i6dSjt2TC5mx2wIO/x+Dras
	wIhiLHOSMEkYFP4uJoSthvab7qIZWsy16X3ZuInB3NLkUvML0cA8bh+/o1I2cUrhUhT8
	UtmOf7dgqFLEwt3bXK+XMHGTa/KOx7oIvS3jlaA4E694MBYMBpiJSe9R1YNJy7DCX5jv
	rV9+vb+MYrkMFfSohl9j6SdeQnTe8K/lOrP7ceE2LpOkTLq3X0U9uo5Knb15kj9jSF2G
	eVCbI00A4CQ6FV14vlXJZpCniWtrCuVRDyUPZ63B/MBMayapMvzol0GiRbskEZW8q7dt
	lozQ==
X-Gm-Message-State: APjAAAXf8MFVUvocrDAmtyq4KB3tvvWTpDgrxl5L6pHCOvembsWj7dEc
	1w/pwzTd+cHGRbtm5PmLGDf9BIxL
X-Google-Smtp-Source: APXvYqxByj8vmlWfEruVbciu3wVtkisr1V47FcizHVSKoL6jEzbZe2tgbc9rBavnGnp2g8DJ70KBmw==
X-Received: by 2002:a17:902:e3:: with SMTP id a90mr5045689pla.45.1551851155771;
	Tue, 05 Mar 2019 21:45:55 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:6bc6::3401])
	by smtp.gmail.com with ESMTPSA id m24sm1001144pgv.1.2019.03.05.21.45.55
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 05 Mar 2019 21:45:55 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  5 Mar 2019 21:45:38 -0800
Message-Id: <20190306054548.16430-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190306054548.16430-1-raj.khem@gmail.com>
References: <20190306054548.16430-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-multimedia][PATCH 02/12] liboil: Fix build on risc-v
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
X-List-Received-Date: Wed, 06 Mar 2019 05:45:55 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../fix_riscv_unaligned_access.patch              | 15 +++++++++++++++
 .../recipes-support/liboil/liboil_0.3.17.bb       |  1 +
 2 files changed, 16 insertions(+)
 create mode 100644 meta-multimedia/recipes-support/liboil/liboil-0.3.17/fix_riscv_unaligned_access.patch

diff --git a/meta-multimedia/recipes-support/liboil/liboil-0.3.17/fix_riscv_unaligned_access.patch b/meta-multimedia/recipes-support/liboil/liboil-0.3.17/fix_riscv_unaligned_access.patch
new file mode 100644
index 0000000000..448bde73fc
--- /dev/null
+++ b/meta-multimedia/recipes-support/liboil/liboil-0.3.17/fix_riscv_unaligned_access.patch
@@ -0,0 +1,15 @@
+RISC-V supports unaligned accesses, therefore enable it
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+--- a/m4/as-unaligned-access.m4
++++ b/m4/as-unaligned-access.m4
+@@ -5,7 +5,7 @@ AC_DEFUN([AS_UNALIGNED_ACCESS], [
+   AC_MSG_CHECKING([if unaligned memory access works correctly])
+   if test x"$as_cv_unaligned_access" = x ; then
+     case $host in
+-      alpha*|arm*|hp*|mips*|sh*|sparc*|ia64*)
++      alpha*|arm*|hp*|mips*|riscv*|sh*|sparc*|ia64*)
+         _AS_ECHO_N([(blacklisted) ])
+         as_cv_unaligned_access=no
+ 	;;
diff --git a/meta-multimedia/recipes-support/liboil/liboil_0.3.17.bb b/meta-multimedia/recipes-support/liboil/liboil_0.3.17.bb
index 7e8aa1572a..654ee1e883 100644
--- a/meta-multimedia/recipes-support/liboil/liboil_0.3.17.bb
+++ b/meta-multimedia/recipes-support/liboil/liboil_0.3.17.bb
@@ -18,6 +18,7 @@ SRC_URI = "http://liboil.freedesktop.org/download/${BPN}-${PV}.tar.gz \
            file://0001-Fix-enable-vfp-flag.patch \
            file://liboil_fix_for_x32.patch \
            file://0001-math_vfp_asm.S-Convert-fldmia-fstmia-instructions-to.patch \
+           file://fix_riscv_unaligned_access.patch \
            "
 
 SRC_URI[md5sum] = "47dc734f82faeb2964d97771cfd2e701"
-- 
2.21.0


