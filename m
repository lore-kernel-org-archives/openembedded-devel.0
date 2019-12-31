Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com
	[209.85.214.173])
	by mail.openembedded.org (Postfix) with ESMTP id 99D637FA1D
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 31 Dec 2019 01:07:00 +0000 (UTC)
Received: by mail-pl1-f173.google.com with SMTP id g6so12342161plp.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Dec 2019 17:07:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=Fil7tVuYCJ3AF0/6K9HrGTk6Ty/ZuTKAtVCssv8us4c=;
	b=TrOqU6LzxvBB34fYylVOE2P03MPjNeub1Q7GWE5hgNrjzWX+T5kEfz39pbFojBQNoY
	h1jQtUO4Wh2YHxnANYFb4blkJHSYvQVg8ip6CfdTBRBoO2+TjKqc5rfspd5xJ6wAt8dt
	I80jIun7ObOyuNJWsFRLftLfO/1ku4qWyKStqXhZ7AKz4byyDFlakP8F6dZ6fPO6aTGK
	bRx6snrdNT68k383TqBCeVF2A1iggXLMcRSKKFwhmst387/cSSQnXxw8/EHGoAv6dZoS
	oOEftz20d5oohL1u+M3t4HSPJ2o/cNdX0MTM6TsxlEVMb/Q2VqRzkug44PtWSe133eXT
	aAJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=Fil7tVuYCJ3AF0/6K9HrGTk6Ty/ZuTKAtVCssv8us4c=;
	b=IpQHJFvZEyKd5guAy+hEF9Hj1e5nYVrd64PNtwrezPh//8hfgM0tgtZQgNmkasU8aC
	JKwQmLpgg9qklJFjbweyprVzAL0kMMgTCJr4zGdx6R3TX+HV6M2MS7EwKL/MxHPr1Wxi
	RlFMRBZrA3+rHOmF/5MzHL+NTHScMxp6w8gdmCbwAYMaOclNAJBRVCHARAevQ/pdjpaX
	odl66l4XPs7jzuRZhClZlj4OypgqsDJFut9zhx3l2NA/7UgTpDjy4CB8KNIc/u/17zWc
	BV+6qVxWCeDj0PUxsffC402Smb+gg+k8j2OOsxWbEfAqNEvoPsKes0gTvHkz3hvl/fnD
	i5rA==
X-Gm-Message-State: APjAAAXkySFHM1nApT2b3gavIbIn/Ujz/A9gx6abIVV5tsjAsQKPohgV
	eHFgy2F+z7GWKh8wXL+QnR+4b5vc9AA=
X-Google-Smtp-Source: APXvYqzZMoJGWAcq7VBb6eexr4rju3zmsHVOcA/bWxrujnNjo0NVnLQXmWn6TADJqTOhmAp8bSFMXQ==
X-Received: by 2002:a17:90a:8402:: with SMTP id
	j2mr2824194pjn.41.1577754420932; 
	Mon, 30 Dec 2019 17:07:00 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::fa4b])
	by smtp.gmail.com with ESMTPSA id
	k1sm47345844pgq.70.2019.12.30.17.07.00
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 30 Dec 2019 17:07:00 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 30 Dec 2019 17:06:51 -0800
Message-Id: <20191231010652.3206534-6-raj.khem@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20191231010652.3206534-1-raj.khem@gmail.com>
References: <20191231010652.3206534-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 7/8] upm: Disable -Wno-misleading-indentation with clang10+
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
X-List-Received-Date: Tue, 31 Dec 2019 01:07:00 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...o-misleading-indentation-with-clang-.patch | 33 +++++++++++++++++++
 meta-oe/recipes-extended/upm/upm_git.bb       |  1 +
 2 files changed, 34 insertions(+)
 create mode 100644 meta-oe/recipes-extended/upm/upm/0001-cmake-Disable-Wno-misleading-indentation-with-clang-.patch

diff --git a/meta-oe/recipes-extended/upm/upm/0001-cmake-Disable-Wno-misleading-indentation-with-clang-.patch b/meta-oe/recipes-extended/upm/upm/0001-cmake-Disable-Wno-misleading-indentation-with-clang-.patch
new file mode 100644
index 0000000000..68b73bc2cc
--- /dev/null
+++ b/meta-oe/recipes-extended/upm/upm/0001-cmake-Disable-Wno-misleading-indentation-with-clang-.patch
@@ -0,0 +1,33 @@
+From d41e2bef1c39dcbc4896b1dd7ab168da530672b5 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 30 Dec 2019 13:33:39 -0800
+Subject: [PATCH] cmake: Disable -Wno-misleading-indentation with clang-10 onwards
+
+clang also introduced this warning now
+
+Upstream-Status: Submitted [https://github.com/eclipse/upm/pull/693]
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ CMakeLists.txt | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 069e4902..47c7f4c3 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -99,6 +99,11 @@ if (CMAKE_CXX_COMPILER_ID STREQUAL "GNU" AND CMAKE_CXX_COMPILER_VERSION VERSION_
+   list (APPEND C_CXX_WARNING_FLAGS -Wno-misleading-indentation)
+ endif ()
+ 
++# clang-10 added  -Wmisleading-indentation as well, skipp it too
++if (CMAKE_CXX_COMPILER_ID STREQUAL "Clang" AND CMAKE_CXX_COMPILER_VERSION VERSION_GREATER "9")
++  list (APPEND C_CXX_WARNING_FLAGS -Wno-misleading-indentation)
++endif ()
++
+ # Warnings as errors?
+ if (WERROR)
+   list (APPEND C_CXX_WARNING_FLAGS -Werror)
+-- 
+2.24.1
+
diff --git a/meta-oe/recipes-extended/upm/upm_git.bb b/meta-oe/recipes-extended/upm/upm_git.bb
index 7564738dda..6db8f88252 100644
--- a/meta-oe/recipes-extended/upm/upm_git.bb
+++ b/meta-oe/recipes-extended/upm/upm_git.bb
@@ -14,6 +14,7 @@ SRC_URI = "git://github.com/intel-iot-devkit/${BPN}.git;protocol=http \
            file://0001-CMakeLists.txt-Use-SWIG_SUPPORT_FILES-to-find-the-li.patch \
            file://0001-Use-stdint-types.patch \
            file://0001-initialize-local-variables-before-use.patch \
+           file://0001-cmake-Disable-Wno-misleading-indentation-with-clang-.patch \
            "
 
 SRC_URI_append_toolchain-clang_x86 = " file://0001-nmea_gps-Link-with-latomic.patch "
-- 
2.24.1


