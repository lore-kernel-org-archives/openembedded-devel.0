Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com
	[209.85.215.175])
	by mail.openembedded.org (Postfix) with ESMTP id B80B77E508
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Jun 2019 05:24:48 +0000 (UTC)
Received: by mail-pg1-f175.google.com with SMTP id p10so5119047pgn.1
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 16 Jun 2019 22:24:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=MoQGfpULCP3fk5EDxhQYJrRP5foSydwG7g277HRuqFo=;
	b=WQoG+ayKgJIgFZivddz1ynEedruhDGBdtBWMm5TK+BfnXUY307gbm1y5BDP3v2fpqb
	QDBRlwAAsG4Vrl+jRFZvVznrEw8p28gppGgVjPPDkbfQ3jFpRRFtmBdvKRRm/PXjejX7
	T7N9h36mQA8KdGm9la4JQ7FnRpHHOCOVrPPzWGEV/VYmDoPFXaT8/jaXUN/21EIVdkGL
	CtMzvdLDUHEFk+gJBCFsYwAGdg45b8EnZV9op61KUDl9dNwe/etElbK5gGUWPaiHO22N
	q+SAqK0UYQZP3Z9l/OO1v8o9m8es08Jfigd2Ni9pYhfgs569gULnFFnAnGMvfJ/ErAUH
	mhcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=MoQGfpULCP3fk5EDxhQYJrRP5foSydwG7g277HRuqFo=;
	b=NPkHzVWZw3QTW5FZmaonTQwoSL0A3/BBE0xhZ6E7ktSNIwzP2nrHUUAkECQEsO6j3s
	C/2f9Psj27Pkk+FB3cctCaaxv0jiUNkjK8pqDopXRXLNPVKMnhGgVUcBMh6aQOvx0la1
	ooPeXVb2bGOwzWmqF2UfwTdjs58f3NjHuoDOH4CJbnH2fSSH6JgLOEMOGaajIzgsr5Qx
	TfAOCqJza+TX+BqmLQ7HDrErFErcgAdyPz8/+J5mrhIWcujocnF0w+8TST5RQ82RdNRn
	GPKayZe6cfRznQ3UA5lVboMhEm+8G8TvesB4UOEEue5JZ9mpiEVTIsJ+6K9ueRL68jZ6
	3Naw==
X-Gm-Message-State: APjAAAXvwT5B+ikv1jq8txgllmiZqlqVxEMkZZxDzSNdipRWfh1dscV2
	GjfMtDOq37bzcqVoSQZpQOFCGE7pj1w=
X-Google-Smtp-Source: APXvYqzxnn0YAuaHpwDoaZ3vtyWCSMBy092tKfYqSKrSdqMdb2dw3kMp+/hhHpLOTLGxBBzt7drUIg==
X-Received: by 2002:a65:6102:: with SMTP id z2mr1700455pgu.194.1560749088999; 
	Sun, 16 Jun 2019 22:24:48 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:6bc6::3c7b])
	by smtp.gmail.com with ESMTPSA id
	c124sm10156911pfa.115.2019.06.16.22.24.48
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Sun, 16 Jun 2019 22:24:48 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 16 Jun 2019 22:24:38 -0700
Message-Id: <20190617052440.18958-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Subject: [meta-oe][PATCH 1/3] stressapptest: Fix build with libc++
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
X-List-Received-Date: Mon, 17 Jun 2019 05:24:48 -0000
Content-Transfer-Encoding: 8bit

when using libc++ instead of libstdc++, __gnu_cxx namespace
is not available

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../stressapptest/libcplusplus-compat.patch   | 28 +++++++++++++++++++
 .../stressapptest/stressapptest_1.0.9.bb      |  4 ++-
 2 files changed, 31 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-benchmark/stressapptest/stressapptest/libcplusplus-compat.patch

diff --git a/meta-oe/recipes-benchmark/stressapptest/stressapptest/libcplusplus-compat.patch b/meta-oe/recipes-benchmark/stressapptest/stressapptest/libcplusplus-compat.patch
new file mode 100644
index 0000000000..f5e7da359d
--- /dev/null
+++ b/meta-oe/recipes-benchmark/stressapptest/stressapptest/libcplusplus-compat.patch
@@ -0,0 +1,28 @@
+Fix compile on sytems using libc++ instead of libstdc++
+
+libc++ does not really implement __gnu_cxx namespace and it
+compiles fine without this namespace, therefore detect libc++
+and if it is used them exclude this namespace 
+
+See https://github.com/stressapptest/stressapptest/issues/47
+
+Fixes
+
+./sattypes.h:33:17: error: expected namespace name
+using namespace __gnu_cxx; //NOLINT
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+--- stressapptest-1.0.9.orig/src/sattypes.h
++++ stressapptest-1.0.9/src/sattypes.h
+@@ -30,7 +30,9 @@
+ #include "stressapptest_config_android.h"  // NOLINT
+ #else
+ #include "stressapptest_config.h"  // NOLINT
++#ifndef _LIBCPP_VERSION
+ using namespace __gnu_cxx;  //NOLINT
++#endif  // _LIBCPP_VERSION
+ #endif  // __ANDROID__
+ using namespace std;
+
diff --git a/meta-oe/recipes-benchmark/stressapptest/stressapptest_1.0.9.bb b/meta-oe/recipes-benchmark/stressapptest/stressapptest_1.0.9.bb
index 3e5748a3a1..679201c528 100644
--- a/meta-oe/recipes-benchmark/stressapptest/stressapptest_1.0.9.bb
+++ b/meta-oe/recipes-benchmark/stressapptest/stressapptest_1.0.9.bb
@@ -9,7 +9,9 @@ SECTION = "benchmark"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://COPYING;md5=55ea9d559f985fb4834317d8ed6b9e58"
 
-SRC_URI = "https://github.com/${PN}/${PN}/archive/v${PV}.tar.gz"
+SRC_URI = "https://github.com/${PN}/${PN}/archive/v${PV}.tar.gz \
+           file://libcplusplus-compat.patch \
+          "
 
 SRC_URI[md5sum] = "d3a526c174c049dd7a1068dc74a62be2"
 SRC_URI[sha256sum] = "2ba470587ad4f6ae92057d427c3a2a2756e5f10bd25cd91e62eaef55a40b30a1"
-- 
2.22.0


