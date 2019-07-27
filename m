Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com
	[209.85.214.180])
	by mail.openembedded.org (Postfix) with ESMTP id 7E67E7ED3D
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 27 Jul 2019 18:59:45 +0000 (UTC)
Received: by mail-pl1-f180.google.com with SMTP id y8so25971837plr.12
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 27 Jul 2019 11:59:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=PMm4rgJZErazmYUDAHO870acicVaSS/KYPZTaniDfR0=;
	b=oe7St9As1CugTX/b802KU9AV0XEYeq0wr4FZKUOL0vxu7jXlG3eTcYAHlLQnUhaocU
	ykqow6VPbukM76O+nLQKJUspIFGcU6wjIfVHTTB2Q5TjtVKhMZuipkha2nDJgDpiI6Yr
	hSqKBaBGQpHG4U34BIoTwQfomADRUtZgYNdpgyXkwmBm2Jo0WJplpBpssZ6IZ3I6O491
	1jsdDPMsx+tnIQXyylS0Nj6X0/NNOvU5x5hvlpBO2c13Fw6T7iesFMJYKMk49UnL1abw
	ZHEJUHM85Q9CDYnKOeICrGwjKwNDxummXhb+lB+qVkn+yCsDm+GENYYZHaqG32WzEeZ4
	MsVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=PMm4rgJZErazmYUDAHO870acicVaSS/KYPZTaniDfR0=;
	b=GUNSc2x8Vqob/HLEbn1vFvg0bD0YcWKK2CfF4PcU5ddLMrSOFAnSKq689N84bTfomi
	l09VtiZIlMWBvzH7vA5qfGrEg69tYnvvIgjfNTxgnF2aTFvDJDt2KeCwCtvmMMwXEu3x
	h0OwLz2+dTR5BcWvKqlICIjtQ3NdPB3nYJXSMUK66xtVV0zgkUQ/FYfEKJuKJugkLV8e
	jxxSqg3CY8ow4UO2Wp7+J4RJX+d507tAkqSwA03WLk70jCjC+aNgbwttxoKJ9UN/nNAh
	cWV21ALjm8+qXUZ6r133tmwQ+5TRQAO4owKMgpDLXSWTxJ+n9M0YYLsaCJlT2ohxQ3ff
	11xw==
X-Gm-Message-State: APjAAAVqJyxY2VHYUgkk7gbF5u3Rx3+hSRxDMQJH2trp2ZVMccVO8ioM
	eG+OOo6mKpuQb+PYrw4g2kEmrs9XFEw=
X-Google-Smtp-Source: APXvYqwN6wIfv9mDM2fnj+2/Zmwh8cAtaic77MYhfvvmcIeoF//HLYgOq+j7ypeZJ0+AgE5g/AcLsg==
X-Received: by 2002:a17:902:2baa:: with SMTP id
	l39mr103468728plb.280.1564253986324; 
	Sat, 27 Jul 2019 11:59:46 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net (c-73-71-176-3.hsd1.ca.comcast.net.
	[73.71.176.3]) by smtp.gmail.com with ESMTPSA id
	k22sm60178333pfk.157.2019.07.27.11.59.45
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Sat, 27 Jul 2019 11:59:45 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 27 Jul 2019 11:59:35 -0700
Message-Id: <20190727185937.29832-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190727185937.29832-1-raj.khem@gmail.com>
References: <20190727185937.29832-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-networking][PATCH 2/4] snort: Fix build with glibc 2.30
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
X-List-Received-Date: Sat, 27 Jul 2019 18:59:46 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...deck-for-gettid-API-during-configure.patch | 48 +++++++++++++++++++
 .../snort/snort_2.9.14.bb                     |  1 +
 2 files changed, 49 insertions(+)
 create mode 100644 meta-networking/recipes-connectivity/snort/snort/0001-chdeck-for-gettid-API-during-configure.patch

diff --git a/meta-networking/recipes-connectivity/snort/snort/0001-chdeck-for-gettid-API-during-configure.patch b/meta-networking/recipes-connectivity/snort/snort/0001-chdeck-for-gettid-API-during-configure.patch
new file mode 100644
index 0000000000..eff610de7c
--- /dev/null
+++ b/meta-networking/recipes-connectivity/snort/snort/0001-chdeck-for-gettid-API-during-configure.patch
@@ -0,0 +1,48 @@
+From c45ab69f9428e4d2fc1146301a4546bb2b42c9ae Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 27 Jul 2019 00:25:58 -0700
+Subject: [PATCH] chdeck for gettid API during configure
+
+glibc 2.30 added gettid syscall wrapper
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ configure.in | 2 +-
+ src/util.h   | 2 ++
+ 2 files changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/configure.in b/configure.in
+index 000bb91..d79e6d0 100644
+--- a/configure.in
++++ b/configure.in
+@@ -256,7 +256,7 @@ SN_CHECK_DECLS(printf fprintf syslog puts fputs fputc fopen  \
+            strcasecmp strncasecmp strerror perror socket sendto   \
+            vsnprintf snprintf strtoul)
+ 
+-AC_CHECK_FUNCS([sigaction strlcpy strlcat strerror vswprintf wprintf memrchr inet_ntop])
++AC_CHECK_FUNCS([sigaction strlcpy strlcat strerror vswprintf wprintf memrchr inet_ntop gettid])
+ 
+ AC_CHECK_FUNC([snprintf],[have_snprintf="yes"],[have_snprintf="no"])
+ AM_CONDITIONAL(BUILD_SNPRINTF, test "x$have_snprintf" != "xyes")
+diff --git a/src/util.h b/src/util.h
+index 6880906..c310b83 100644
+--- a/src/util.h
++++ b/src/util.h
+@@ -374,6 +374,7 @@ static inline int IsEmptyStr(const char *str)
+     return 0;
+ }
+ 
++#if !HAVE_GETTID
+ static inline pid_t gettid(void)
+ {
+ #if defined(LINUX) && defined(SYS_gettid)
+@@ -382,5 +383,6 @@ static inline pid_t gettid(void)
+     return getpid();
+ #endif
+ }
++#endif
+ 
+ #endif /*__UTIL_H__*/
+-- 
+2.22.0
+
diff --git a/meta-networking/recipes-connectivity/snort/snort_2.9.14.bb b/meta-networking/recipes-connectivity/snort/snort_2.9.14.bb
index b11890c490..6ead49bb61 100644
--- a/meta-networking/recipes-connectivity/snort/snort_2.9.14.bb
+++ b/meta-networking/recipes-connectivity/snort/snort_2.9.14.bb
@@ -12,6 +12,7 @@ SRC_URI = "https://www.snort.org/downloads/archive/snort/${BP}.tar.gz \
     file://fix-host-contamination-when-enable-static-daq.patch \
     file://disable-run-test-program-while-cross-compiling.patch \
     file://configure.in-disable-tirpc-checking-for-fedora.patch \
+    file://0001-chdeck-for-gettid-API-during-configure.patch \
 "
 
 SRC_URI[md5sum] = "d1689c7ccaaa7bfcfa83b5bff6b8f9b8"
-- 
2.22.0


