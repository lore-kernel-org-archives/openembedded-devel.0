Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id 7CD1974557
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Apr 2018 17:00:11 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id a14so8365060pfi.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Apr 2018 10:00:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=amy9ttFPwV+R71G9wf03xERxXyjz9QgutUMzlCARcRU=;
	b=g/daTZpxALUHRIDO6ZP6vyGgYwUGcAk7Y4N+kJ6kmSfkWcRk4z/hU0eDHdoF9Y6L+r
	0wtgRNyLtvrNsyISi60zMunJMs0X23moJreGDeujSctHnLMNWmMf6ZNR/4iOokvX6ieh
	7LULxySrjBQwMtQPFiCzLHGb2ziISJBnbFh3FsDKtT2sS10YPP/XILU5NVJxe7XKTtFs
	jvtKCYHe21rP7Q1pCURQLkxi96d36+eAOjh7LsBZ/V7mzN06OJaExfwNoOIq+ctItIkt
	mQPBRGVHYGEV2s3Kw+mPuFRD7XaB8eeoJVampwV3tqroMAoh7TN3AkeJ0Ygucd4EqqdH
	qR0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=amy9ttFPwV+R71G9wf03xERxXyjz9QgutUMzlCARcRU=;
	b=j9B88rzgtosigYMtvH5ToOf6QRkYN7A5QOH3JAPJhsHrIPbcHlNkNc0HpL9feqHg2v
	Q4KVSrRWmt7E2xMEHzcQIjkTk6HcWPeMy4Nf0zQq/K3qe4JdTs177ui4oQrZld2GY5xq
	1ICBTndg7LqPyAb1TyTpTbWk8ad4NrjMYPcb7Ls1448C0xwWXNdCuw4Y3suJB1757t5B
	83tsSAMZx76ILLRQw5xl4Bfw/w9Ka6OzPk2MjIfRZuOcqQYxq06TNngBasE75RP+oDIX
	IgzAYqDYMwK5rVZYD23Mi+qmr8AU66YCyMKC75pd/6um5C/9+RTCblKNpITUvvD+HB4u
	9tAg==
X-Gm-Message-State: ALQs6tBB/8nSNRiMiSN/wC6HSOq/1YBBx0P6bvOAn2ZazwLPc4HpxmsV
	eR00SS7cw6tY9Q3felXfaal7HQ==
X-Google-Smtp-Source: AIpwx4+4tsyGsUwqkUOGDdztO/DrfSHfO16T94H9OCkILixCZCdXks35kvfLRPZDgVYaBOcsXxtS3Q==
X-Received: by 10.99.102.195 with SMTP id a186mr28894365pgc.207.1524762012123; 
	Thu, 26 Apr 2018 10:00:12 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8880:466c::ddd5])
	by smtp.gmail.com with ESMTPSA id
	w134sm41690845pfd.132.2018.04.26.10.00.11
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 26 Apr 2018 10:00:11 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 26 Apr 2018 10:00:02 -0700
Message-Id: <20180426170004.20602-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180426170004.20602-1-raj.khem@gmail.com>
References: <20180426170004.20602-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 2/4] p7zip: Fix build with clang
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
X-List-Received-Date: Thu, 26 Apr 2018 17:00:11 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...Fix-narrowing-errors-Wc-11-narrowing.patch | 48 +++++++++++++++++++
 meta-oe/recipes-extended/p7zip/p7zip_16.02.bb |  6 ++-
 2 files changed, 52 insertions(+), 2 deletions(-)
 create mode 100644 meta-oe/recipes-extended/p7zip/files/0001-Fix-narrowing-errors-Wc-11-narrowing.patch

diff --git a/meta-oe/recipes-extended/p7zip/files/0001-Fix-narrowing-errors-Wc-11-narrowing.patch b/meta-oe/recipes-extended/p7zip/files/0001-Fix-narrowing-errors-Wc-11-narrowing.patch
new file mode 100644
index 000000000..ae2751745
--- /dev/null
+++ b/meta-oe/recipes-extended/p7zip/files/0001-Fix-narrowing-errors-Wc-11-narrowing.patch
@@ -0,0 +1,48 @@
+From b6b1782af4aa7f9084d32e4144738dc2535c8d6f Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 23 Apr 2018 23:07:21 -0700
+Subject: [PATCH] Fix narrowing errors -Wc++11-narrowing
+
+Clang 6.x finds these errors
+
+    ../../../../CPP/Windows/ErrorMsg.cpp:24:10: error: case value evaluates to -2147024809, which cannot be narrowed to type 'DWORD' (aka 'unsigned int') [-Wc++11-narrowing]
+        case E_INVALIDARG          : txt = "E_INVALIDARG"; break ;
+             ^
+
+HRESULT causes the macro to be parsed as a signed long, so we need to force it
+to be checked as an unsigned long instead.
+
+also reported here https://bugs.freebsd.org/bugzilla/show_bug.cgi?id=224930
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ CPP/Windows/ErrorMsg.cpp | 14 +++++++-------
+ 1 file changed, 7 insertions(+), 7 deletions(-)
+
+diff --git a/CPP/Windows/ErrorMsg.cpp b/CPP/Windows/ErrorMsg.cpp
+index 99684ae..78a64ba 100644
+--- a/CPP/Windows/ErrorMsg.cpp
++++ b/CPP/Windows/ErrorMsg.cpp
+@@ -15,13 +15,13 @@ UString MyFormatMessage(DWORD errorCode)
+ 
+   switch(errorCode) {
+     case ERROR_NO_MORE_FILES   : txt = "No more files"; break ;
+-    case E_NOTIMPL             : txt = "E_NOTIMPL"; break ;
+-    case E_NOINTERFACE         : txt = "E_NOINTERFACE"; break ;
+-    case E_ABORT               : txt = "E_ABORT"; break ;
+-    case E_FAIL                : txt = "E_FAIL"; break ;
+-    case STG_E_INVALIDFUNCTION : txt = "STG_E_INVALIDFUNCTION"; break ;
+-    case E_OUTOFMEMORY         : txt = "E_OUTOFMEMORY"; break ;
+-    case E_INVALIDARG          : txt = "E_INVALIDARG"; break ;
++    case (DWORD) E_NOTIMPL             : txt = "E_NOTIMPL"; break ;
++    case (DWORD) E_NOINTERFACE         : txt = "E_NOINTERFACE"; break ;
++    case (DWORD) E_ABORT               : txt = "E_ABORT"; break ;
++    case (DWORD) E_FAIL                : txt = "E_FAIL"; break ;
++    case (DWORD) STG_E_INVALIDFUNCTION : txt = "STG_E_INVALIDFUNCTION"; break ;
++    case (DWORD) E_OUTOFMEMORY         : txt = "E_OUTOFMEMORY"; break ;
++    case (DWORD) E_INVALIDARG          : txt = "E_INVALIDARG"; break ;
+     case ERROR_DIRECTORY          : txt = "Error Directory"; break ;
+     default:
+       txt = strerror(errorCode);
diff --git a/meta-oe/recipes-extended/p7zip/p7zip_16.02.bb b/meta-oe/recipes-extended/p7zip/p7zip_16.02.bb
index edf47f7bc..d986da904 100644
--- a/meta-oe/recipes-extended/p7zip/p7zip_16.02.bb
+++ b/meta-oe/recipes-extended/p7zip/p7zip_16.02.bb
@@ -6,8 +6,10 @@ LIC_FILES_CHKSUM = "file://DOC/copying.txt;md5=4fbd65380cdd255951079008b364516c
                     file://DOC/License.txt;md5=879598edf1f54dddb6930d7581357f8b"
 
 SRC_URI = "http://downloads.sourceforge.net/p7zip/p7zip/${PV}/p7zip_${PV}_src_all.tar.bz2 \
-          file://do_not_override_compiler_and_do_not_strip.patch \
-          file://CVE-2017-17969.patch"
+           file://do_not_override_compiler_and_do_not_strip.patch \
+           file://CVE-2017-17969.patch \
+           file://0001-Fix-narrowing-errors-Wc-11-narrowing.patch \
+           "
 
 SRC_URI[md5sum] = "a0128d661cfe7cc8c121e73519c54fbf"
 SRC_URI[sha256sum] = "5eb20ac0e2944f6cb9c2d51dd6c4518941c185347d4089ea89087ffdd6e2341f"
-- 
2.17.0


