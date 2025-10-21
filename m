Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A706CCD184
	for <webhook@archiver.kernel.org>; Tue, 21 Oct 2025 08:48:13 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web10.6668.1761036490403261012
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 21 Oct 2025 01:48:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=e5ecXO5O;
 spf=pass (domain: gmail.com, ip: 209.85.128.46, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4711810948aso35911875e9.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 21 Oct 2025 01:48:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761036489; x=1761641289; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=+0cbyoDsLrK02t3pIeXpcvfO91dSm76kpr/Tv7MMsrA=;
        b=e5ecXO5O0lKkz5eCuq9ouoIaZ08NTkMf8a4lkpUOa+dqQFbPwrbz+KnQoe95VSCzS/
         4sAC5BeQ2Jn/MgSyCMNC3aM9TORsMTAj+SR6YnHG99hBSUOStoqLbP5idYH0RcuoKqTI
         Zoe24Tywj0CYSEl0DGSJ7y5+3mGigqJQNNs6TT/wpGYyqAsNQejelDzS77roReSxzok6
         tjrohhgeiW0lbaaxtPjlv2sMqXEdmIcWoWsNXoGdXNsCYNyyyuNQwFQ2soka0J/6CtEB
         lIOxjv3OBcF91nvGKJXeuMTATwVl1Ht8Vc4keo8WfDo0krT4EtQEFDwcSuZxTz4K/jv5
         F6pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761036489; x=1761641289;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+0cbyoDsLrK02t3pIeXpcvfO91dSm76kpr/Tv7MMsrA=;
        b=uz94wcavK7AWmHvet/eTC6kr2r2lb3brweT4UlBdcTnvi6i3QvZxFrBAeoOELuCBnY
         3E4+NdIuPeVDZPyU5Kd8DpSHeWklzrVAXSVbAnXCby7+u58B6sB0YPPhMoD9kkW17VCE
         2oDj1pGbgrGJ6Xm4qWiWdLiMAvfGh1RT1UwzsXiZ0Tpg8zEkymdufMVpRs9kj5EBzWpl
         vcySOKEaEvxROqTJZHfU3EljxE3wigvLBr/xg2VOGLyuaOedkx6mjomTdT9XTrxruERA
         t0ZTB20YpHNW5CM+mee/NwEXc4HfVFuGYdUFtpPjHm77wUeCGMuESprUMtKpgufnEd3v
         KyXQ==
X-Gm-Message-State: AOJu0Yz3I7h5EF4p2ruVEG+5HF0oxyj5G8hWskrwdTFbrKIT9UnW/MC9
	4ZQARHr3U50dNGhUodyRYm1yEsQk+btkmXbbD3BKHvbda0lyrWd36UIeLl1Gug==
X-Gm-Gg: ASbGncsWja6JCWBZ32xiuMZnvmEX15ojG9pxQZ6XQhp8BNsiP+WU5kR7mqugQD91H3t
	fA+AsenepynAN4QlwJETnmrjfaHgdLvNlPfF5Ywj4xIutk3O+8XefwnSeS5fSD900zFp0QCQprW
	/DvTaBO2TY9y1a3zmM7SPLtBj9N8BRpO0AZVQXOn6bitRx8PSsIEUZLVeKUgdjOJyaymNfRFMS6
	VTOEp56qiKo/LMkSYI2MVbOPVgqolQnJM3rVJkYDTi0FanVNb6UjPbxRpnh5UUjEl5/OH8fuzla
	4lDz3LZs/j4XxXl8rUZN9xkfgS3cjAAUWPR92kU83qpOF1sXtJ4jzHAJBfHC9G8UFrgcC+tsR7R
	+JgWMoQsI/jG8mzLcNb65sXts4R1kh8J1vVSy0cq5jprRwIWYGaAQdN2BdnI0jPe3zWLQZjUs31
	4WBj9IlNUlz8LO0we7vd0=
X-Google-Smtp-Source: AGHT+IF4W9Yaj80wLkQKtQPJmX7q5o3KHdojh5M1uGBxEny7SBqDniHXgi5zCJpn7hrzvhVVWUNwog==
X-Received: by 2002:a05:600c:871a:b0:471:14f5:124f with SMTP id 5b1f17b1804b1-471179258f3mr114320165e9.35.1761036488537;
        Tue, 21 Oct 2025 01:48:08 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-471144c900asm272986055e9.16.2025.10.21.01.48.07
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Oct 2025 01:48:08 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH] zchunk: add ptest support
Date: Tue, 21 Oct 2025 10:48:07 +0200
Message-ID: <20251021084807.3657527-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 21 Oct 2025 08:48:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120833

It takes under 5 seconds to execute.
The script is a shell conversion from the meson tests.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../recipes-support/zchunk/zchunk/run-ptest   | 139 ++++++++++++++++++
 .../recipes-support/zchunk/zchunk_1.2.0.bb    |  10 +-
 2 files changed, 148 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-support/zchunk/zchunk/run-ptest

diff --git a/meta-oe/recipes-support/zchunk/zchunk/run-ptest b/meta-oe/recipes-support/zchunk/zchunk/run-ptest
new file mode 100644
index 0000000000..d4b1439905
--- /dev/null
+++ b/meta-oe/recipes-support/zchunk/zchunk/run-ptest
@@ -0,0 +1,139 @@
+#!/bin/sh
+
+# this is a shell-rewrite of meson tests, from test/meson.build file
+
+report_result(){
+  if [ $1 -eq 0 ]; then
+    echo PASS: $2
+  else
+    echo FAIL: $2
+  fi
+}
+
+report_result_expected_fail(){
+  if [ $? -eq 0 ]; then
+    echo FAIL: $2
+  else
+    echo PASS: $2
+  fi
+}
+
+# create and validate empty zchunk file
+./tests/empty
+report_result $? empty
+
+# check version info in zck
+zck -V
+report_result $? "zck version"
+
+# check version info of unzck
+unzck -V
+report_result $? "unzck version"
+
+# check version of zckdl
+zckdl -V
+report_result $? "zckdl version"
+
+# check version of zck_read_header
+zck_read_header -V
+report_result $? "zck_read_header version"
+
+# check version of zck_delta_size
+zck_delta_size -V
+report_result $? "zck_delta_size version"
+
+# check opening file with optional flags
+./tests/optelems ./tests/files/empty.optelems.zck
+report_result $? "check opening file with optional flags"
+
+# checksum with non-hex character
+./tests/invalid_input_checksum ./tests/files/empty.optelems.zck
+report_result $? "checksum with non-hex character"
+
+# read single chunk
+./tests/read_single_chunk ./tests/files/LICENSE.dict.fodt.zck
+report_result $? "read single chunk"
+
+# read single compressed chunk
+./tests/read_single_comp_chunk ./tests/files/LICENSE.dict.fodt.zck
+report_result $? "read single compressed chunk"
+
+# check verbosity in unzck
+unzck -vvvvv ./empty.zck
+report_result $? "check verbosity in unzck"
+
+# check verbosity in zck
+zck -vvvvv ./empty
+report_result $? "check verbosity in zck"
+
+# check verbosity in zckdl
+zckdl -vvvvv file:///empty
+report_result_expected_fail $? "check verbosity in zckdl"
+
+# check verbosity in zck_read_header
+zck_read_header -vvvvvfc ./empty.zck
+report_result $? "check verbosity in zck_read_header"
+
+# check verbosity in zck_delta_size
+zck_delta_size -vvvvv ./empty.zck ./empty.zck
+report_result $? "check verbosity in zck_delta_size"
+
+# copy chunks from source
+./tests/copy_chunks ./tests/files/LICENSE.header.new.nodict.fodt.zck ./tests/files/LICENSE.nodict.fodt.zck
+report_result $? "copy chunks from source"
+
+# decompress previously generated auto-chunked file - nocomp
+./tests/shacheck `which unzck` LICENSE.nocomp.fodt 394ed6c2fc4ac47e5ee111a46f2a35b8010a56c7747748216f52105e868d5a3e ./tests/files/LICENSE.nocomp.fodt.zck
+report_result $? "decompress previously generated auto-chunked file - nocomp"
+
+# decompress previously generated auto-chunked file - no dict
+./tests/shacheck `which unzck` LICENSE.nodict.fodt 394ed6c2fc4ac47e5ee111a46f2a35b8010a56c7747748216f52105e868d5a3e ./tests/files/LICENSE.nodict.fodt.zck
+report_result $? "decompress previously generated auto-chunked file - no dict"
+
+# decompress previously generated auto-chunked file - dict
+./tests/shacheck `which unzck` LICENSE.dict.fodt 394ed6c2fc4ac47e5ee111a46f2a35b8010a56c7747748216f52105e868d5a3e ./tests/files/LICENSE.dict.fodt.zck
+report_result $? "decompress previously generated auto-chunked file - dict"
+
+# decompress previously generated manual file - no dict
+./tests/shacheck `which unzck` LICENSE.manual.nodict.fodt 394ed6c2fc4ac47e5ee111a46f2a35b8010a56c7747748216f52105e868d5a3e ./tests/files/LICENSE.manual.nodict.fodt.zck
+report_result $? "decompress previously generated manual file - no dict"
+
+# decompress previously generated manual file - dict
+./tests/shacheck `which unzck` LICENSE.manual.dict.fodt 394ed6c2fc4ac47e5ee111a46f2a35b8010a56c7747748216f52105e868d5a3e ./tests/files/LICENSE.manual.dict.fodt.zck
+report_result $? "decompress previously generated manual file - dict"
+
+# decompress dict from previously generated auto-chunked file
+./tests/shacheck `which unzck` LICENSE.dict.fodt.zdict b20064d89c3beb8605d99c994ff45304f308abd840c0981475dd2faca6ec854b --dict ./tests/files/LICENSE.dict.fodt.zck
+report_result $? "decompress dict from previously generated auto-chunked file"
+
+# compress auto-chunked file - no dict
+./tests/shacheck `which zck` LICENSE.nodict.fodt.zck ac9d431f1f568d8921257fa17929c320f0cdcbff450d9f3c38c78c4f410ee788 -o LICENSE.nodict.fodt.zck ./tests/files/LICENSE.fodt
+report_result $? "compress auto-chunked file - no dict'"
+
+# decompress auto-chunked file - no dict
+./tests/shacheck `which unzck` LICENSE.nodict.fodt 394ed6c2fc4ac47e5ee111a46f2a35b8010a56c7747748216f52105e868d5a3e LICENSE.nodict.fodt.zck
+report_result $? "decompress auto-chunked file - no dict"
+
+# compress auto-chunked file - dict
+./tests/shacheck `which zck` LICENSE.dict.fodt.zck 35549b28b01c0a43d7389d4c40d5b750c73fb6c0c6701355ef709ef4a37df389 -D ./tests/files/LICENSE.dict -o LICENSE.dict.fodt.zck ./tests/files/LICENSE.fodt
+report_result $? "compress auto-chunked file - dict"
+
+# decompress auto-chunked file - dict
+./tests/shacheck `which unzck` LICENSE.dict.fodt 394ed6c2fc4ac47e5ee111a46f2a35b8010a56c7747748216f52105e868d5a3e LICENSE.dict.fodt.zck
+report_result $? "decompress auto-chunked file - dict"
+
+# compress manual file - no dict
+./tests/shacheck `which zck` LICENSE.manual.nodict.fodt.zck 2580f66412adce1ed8d92abc09b0f64eb155155f61e21a8269a2c4a338857e51 -m -s "<text:" -o LICENSE.manual.nodict.fodt.zck ./tests/files/LICENSE.fodt
+report_result $? "compress manual file - no dict"
+
+# decompress manual file - no dict
+./tests/shacheck `which unzck` LICENSE.manual.nodict.fodt 394ed6c2fc4ac47e5ee111a46f2a35b8010a56c7747748216f52105e868d5a3e LICENSE.manual.nodict.fodt.zck
+report_result $? "decompress manual file - no dict"
+
+# compress manual file - dict
+./tests/shacheck `which zck` LICENSE.manual.dict.fodt.zck 863dc2bda721a32c26485eeb2223d5dabcf9ac517ecba8c7991fa0120d04c937 -D ./tests/files/LICENSE.dict -m -s "<text:" -o LICENSE.manual.dict.fodt.zck ./tests/files/LICENSE.fodt
+report_result $? "compress manual file - dict"
+
+# decompress manual file - dict
+./tests/shacheck `which unzck` LICENSE.manual.dict.fodt 394ed6c2fc4ac47e5ee111a46f2a35b8010a56c7747748216f52105e868d5a3e LICENSE.manual.dict.fodt.zck
+report_result $? "decompress manual file - dict"
diff --git a/meta-oe/recipes-support/zchunk/zchunk_1.2.0.bb b/meta-oe/recipes-support/zchunk/zchunk_1.2.0.bb
index 5eb2741b1f..ce71fcfb8b 100644
--- a/meta-oe/recipes-support/zchunk/zchunk_1.2.0.bb
+++ b/meta-oe/recipes-support/zchunk/zchunk_1.2.0.bb
@@ -6,6 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=daf6e68539f564601a5a5869c31e5242"
 
 SRC_URI = "git://github.com/zchunk/zchunk.git;protocol=https;branch=main \
            file://0001-Handle-overflow-errors-in-malformed-zchunk-files.patch \
+           file://run-ptest \
            "
 
 SRCREV = "dd6a30a1e4e8b738b0cafc682f3c00e7706134e5"
@@ -19,6 +20,13 @@ DEPENDS = "\
 DEPENDS:append:libc-musl = " argp-standalone"
 LDFLAGS:append:libc-musl = " -largp"
 
-inherit meson pkgconfig
+inherit meson pkgconfig ptest
+
+do_install_ptest(){
+    install -d ${D}${PTEST_PATH}/tests
+    find ${B}/test -maxdepth 1 -type f -exec install {} ${D}${PTEST_PATH}/tests/ \;
+    cp -r ${S}/test/files ${D}${PTEST_PATH}/tests/
+}
 
 BBCLASSEXTEND = "native nativesdk"
+

