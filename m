Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com
	[209.85.215.177])
	by mail.openembedded.org (Postfix) with ESMTP id E1CA87FC8B
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 21 Dec 2019 00:06:50 +0000 (UTC)
Received: by mail-pg1-f177.google.com with SMTP id x7so5719291pgl.11
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Dec 2019 16:06:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=KAqVCxDKuwg4IUy8waKscnKvU9/bHAUhb13f/lwH8AQ=;
	b=Mr4d70U5++ZqG6lDFVabPXLDEsYljSOn2l3j4aAGkjt01t7hq9gTjKdca/saMGMx7E
	L9c9ZvQqe5MX6fv1Ke/ebqCtXaU5w3nJYyPbzWX5xTSIcja11USI6WKBzUoVuQdNPhVz
	Q+peSXOy+TCRzf/bRyFXb8wnpBuaW7/ZdFSso6SLeI8XJzBsMFrr2D4FITGhdh3kh1I4
	69H9EGoRG8Eeqb0OddVXAsELpJevu0GG+Qvx+Rj+bYRRn3yf9TS1nANcRd+Jkv6rBVn2
	e9pMpATNj6togM4SQWT/t8tBfCAc2E8K1PaJtTyaucVfer+JmfTJSfLvhJdEM+d1ikjX
	R4ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=KAqVCxDKuwg4IUy8waKscnKvU9/bHAUhb13f/lwH8AQ=;
	b=pmIgy8XFojhy2K79+j1A23+tmNhdLJXTIq1xylZEwIbAt2WCgdo78u4USUw6Gi5DEj
	BYeZ974ahAIlXKGazQbYSTN7NuTUlW/ofwx6befRvWyqy/OEnvIpS9yOIN2Su1F0aAt6
	qWYL2GxeQgqPsUG/oBuE3NAWX2rmL9j3fE/7DPhZAFFLQrYVDGO+KflfP346QRcP9dvL
	CWY6ZGN4mjpFQyD5ieW9SIE1FkzpmmTOpX4CsB6TD/T/3dNcHb1FijGtEf/auANG6+MD
	8bHMmtsoykfVoz+VGO7Dt0TnGQOTP4w9bKmCzPRJJNvThCe6CTMkJ+UK3Z+AluzH+wcX
	z8Vw==
X-Gm-Message-State: APjAAAWOx6dmoYSozF/p5VZ5O12DlCSYZR+T3+XznKpy6my2KO3d7vyZ
	NwZCkoBfOHDn8ZgCrrX5aE8Fniqy59U=
X-Google-Smtp-Source: APXvYqxfStl89pHtpcZieZlSVYEPQd9PRUttOu5i71WxprIsmcTRR39E1D4dUshvYpcHDAZ78bsyxA==
X-Received: by 2002:a63:4c4f:: with SMTP id m15mr17635306pgl.346.1576886811575;
	Fri, 20 Dec 2019 16:06:51 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::36e9])
	by smtp.gmail.com with ESMTPSA id
	d4sm11701624pjz.12.2019.12.20.16.06.50
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 20 Dec 2019 16:06:51 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 20 Dec 2019 16:06:20 -0800
Message-Id: <20191221000635.1573390-8-raj.khem@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20191221000635.1573390-1-raj.khem@gmail.com>
References: <20191221000635.1573390-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 08/23] fluentbit: Fix packaging in multilib env
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
X-List-Received-Date: Sat, 21 Dec 2019 00:06:51 -0000
Content-Transfer-Encoding: 8bit

Fixes
ERROR: fluentbit-0.12.19-r0 do_package: QA Issue: fluentbit: Files/directories were installed but not shipped in any package:
/usr/lib/libfluent-bit.so
Please set FILES such that these items are packaged. Alternatively if they are unneeded, avoid installing them or delete them within do_install.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../fluentbit/fluentbit/cmake_multilib.patch   | 18 ++++++++++++++++++
 .../fluentbit/fluentbit_0.12.19.bb             |  1 +
 2 files changed, 19 insertions(+)
 create mode 100644 meta-oe/recipes-extended/fluentbit/fluentbit/cmake_multilib.patch

diff --git a/meta-oe/recipes-extended/fluentbit/fluentbit/cmake_multilib.patch b/meta-oe/recipes-extended/fluentbit/fluentbit/cmake_multilib.patch
new file mode 100644
index 0000000000..8fe9f3e703
--- /dev/null
+++ b/meta-oe/recipes-extended/fluentbit/fluentbit/cmake_multilib.patch
@@ -0,0 +1,18 @@
+Use CMAKE_INSTALL_LIBDIR instead of hardcoding lib path
+
+Helps build on platforms where libpaths are not lib/ but say lib64/
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+--- a/src/CMakeLists.txt
++++ b/src/CMakeLists.txt
+@@ -182,7 +182,7 @@ if(NOT FLB_WITHOUT_SHARED_LIB)
+     PROPERTIES OUTPUT_NAME fluent-bit)
+ 
+   # Library install routines
+-  install(TARGETS fluent-bit-shared LIBRARY DESTINATION lib)
++  install(TARGETS fluent-bit-shared LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR})
+ endif()
+ 
+ # Static Library
diff --git a/meta-oe/recipes-extended/fluentbit/fluentbit_0.12.19.bb b/meta-oe/recipes-extended/fluentbit/fluentbit_0.12.19.bb
index e50aa71a9f..27b910b8be 100644
--- a/meta-oe/recipes-extended/fluentbit/fluentbit_0.12.19.bb
+++ b/meta-oe/recipes-extended/fluentbit/fluentbit_0.12.19.bb
@@ -4,6 +4,7 @@ BUGTRACKER = "https://github.com/fluent/fluent-bit/issues"
 
 SRC_URI = "http://fluentbit.io/releases/0.12/fluent-bit-${PV}.tar.gz \
            file://jemalloc.patch \
+           file://cmake_multilib.patch \
            "
 SRC_URI[md5sum] = "7c8708312ac9122faacf9e2a4751eb34"
 SRC_URI[sha256sum] = "23a81087edf0e2c6f2d49411c6a82308afc5224f67bbaa45729c057af62e9241"
-- 
2.24.1


