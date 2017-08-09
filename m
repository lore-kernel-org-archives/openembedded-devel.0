Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id BD7C271B31
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  9 Aug 2017 06:33:12 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id h75so5281676pfh.5
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 08 Aug 2017 23:33:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=0sitrO+OQYp826rjKQJFizN2wQYUIqc2yFwGSAwRtlM=;
	b=DFuzZbm2+reIRp8BRbUDf/FTEQIYjv27k39OrPUw9vqjQFznxusE3L+Cjdo1MEyv44
	u8xeQV5iTAU6KiACdx97nELYIukX+n0kyE8SLOHIvSb35CU4stDzOV3kBxw3H54jMjzs
	Msg0vJuAGdL6EM8ZNw2HZ4NADkhEYpIzVEISFGLg3so68Qflu6UtVP9xZF6lUjFzslom
	dkjrWeTs2nSV9QotmxdpTcbcWifnYH8/ylcd+0n2TNWJ13inoz294wRQNlkZNH/ZHtmr
	ZrMVtRJ6ZDF8BfzUmV2mlf8f3D4MW+KjErImoUGuqC5WfCQcQVPF6OHJrJgxElPU7oN6
	tjQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=0sitrO+OQYp826rjKQJFizN2wQYUIqc2yFwGSAwRtlM=;
	b=OcS0BYdQmJ0Zc0+KEII3Gt+YE2UDVL3y880ABsDQailW71JLji5Pb74xV7ksoviOrP
	ErMG4WXXF7NcMrY7NdJiVTMTx10SsBUAjiYTIXu+yTFXCeGtt4SMsoXBJh7qEmLkaS+J
	sOdQcyzYNoxlEdlsw4YdfS+GFrSu8ixOaM3tBSsuLCvb/bsiZx8Hqu29Q1jqgfaz2eQq
	8DiQx1ZBs92X/p/3/nNjB8W5mqNn3X+e8dNHTE2eP5CcC3Y1rxSkHPBuDz7CMSv2gYJ4
	noeOtdo/ztWfCRNIpa3Yv6HGdpHioFtRMgS2E9aeLpSFCbx1WU8+tPV3jWFrB/nT7AZz
	LBpw==
X-Gm-Message-State: AHYfb5hxPkyqORyPc3JDT5bNt4e9Wr2G0ZxyGrz7v+wgcc9rPP8xjtCg
	hp0cYvkn1v8n1Zj2
X-Received: by 10.84.133.15 with SMTP id 15mr7568791plf.31.1502260393807;
	Tue, 08 Aug 2017 23:33:13 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::f213])
	by smtp.gmail.com with ESMTPSA id
	x25sm6259547pfk.80.2017.08.08.23.33.12
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 08 Aug 2017 23:33:12 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  8 Aug 2017 23:32:58 -0700
Message-Id: <20170809063259.373-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.14.0
Subject: [meta-qt5][PATCH 1/2] qtwebkit: Backport a patch to fix build with icu-59
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
X-List-Received-Date: Wed, 09 Aug 2017 06:33:12 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0004-Fix-compilation-with-ICU-59.patch         | 92 ++++++++++++++++++++++
 recipes-qt/qt5/qtwebkit_git.bb                     |  1 +
 2 files changed, 93 insertions(+)
 create mode 100644 recipes-qt/qt5/qtwebkit/0004-Fix-compilation-with-ICU-59.patch

diff --git a/recipes-qt/qt5/qtwebkit/0004-Fix-compilation-with-ICU-59.patch b/recipes-qt/qt5/qtwebkit/0004-Fix-compilation-with-ICU-59.patch
new file mode 100644
index 0000000..e4a108e
--- /dev/null
+++ b/recipes-qt/qt5/qtwebkit/0004-Fix-compilation-with-ICU-59.patch
@@ -0,0 +1,92 @@
+From d8d9b1eb468f5e5d5d9f0b196fc0acb641998c8b Mon Sep 17 00:00:00 2001
+From: Konstantin Tokarev <annulen@yandex.ru>
+Date: Thu, 4 May 2017 15:12:37 +0300
+Subject: [PATCH] Fix compilation with ICU 59
+
+Upstream fix: https://bugs.webkit.org/show_bug.cgi?id=171612
+
+Task-number: QTBUG-60532
+Change-Id: I6014feea213aa70ebe40b09d9d1a03fd1ed3c843
+Reviewed-by: Allan Sandfeld Jensen <allan.jensen@qt.io>
+---
+ Source/JavaScriptCore/API/JSStringRef.cpp        | 6 +++---
+ Source/JavaScriptCore/runtime/DateConversion.cpp | 3 ++-
+ Source/WTF/wtf/TypeTraits.h                      | 3 +++
+ Source/WebKit2/Shared/API/c/WKString.cpp         | 2 +-
+ 4 files changed, 9 insertions(+), 5 deletions(-)
+
+diff --git a/Source/JavaScriptCore/API/JSStringRef.cpp b/Source/JavaScriptCore/API/JSStringRef.cpp
+index 812f3d413..77a3fd0f4 100644
+--- a/Source/JavaScriptCore/API/JSStringRef.cpp
++++ b/Source/JavaScriptCore/API/JSStringRef.cpp
+@@ -37,7 +37,7 @@ using namespace WTF::Unicode;
+ JSStringRef JSStringCreateWithCharacters(const JSChar* chars, size_t numChars)
+ {
+     initializeThreading();
+-    return OpaqueJSString::create(chars, numChars).leakRef();
++    return OpaqueJSString::create(reinterpret_cast<const UChar*>(chars), numChars).leakRef();
+ }
+ 
+ JSStringRef JSStringCreateWithUTF8CString(const char* string)
+@@ -62,7 +62,7 @@ JSStringRef JSStringCreateWithUTF8CString(const char* string)
+ JSStringRef JSStringCreateWithCharactersNoCopy(const JSChar* chars, size_t numChars)
+ {
+     initializeThreading();
+-    return OpaqueJSString::create(StringImpl::createWithoutCopying(chars, numChars, WTF::DoesNotHaveTerminatingNullCharacter)).leakRef();
++    return OpaqueJSString::create(StringImpl::createWithoutCopying(reinterpret_cast<const UChar*>(chars), numChars, WTF::DoesNotHaveTerminatingNullCharacter)).leakRef();
+ }
+ 
+ JSStringRef JSStringRetain(JSStringRef string)
+@@ -83,7 +83,7 @@ size_t JSStringGetLength(JSStringRef string)
+ 
+ const JSChar* JSStringGetCharactersPtr(JSStringRef string)
+ {
+-    return string->characters();
++    return reinterpret_cast<const JSChar*>(string->characters());
+ }
+ 
+ size_t JSStringGetMaximumUTF8CStringSize(JSStringRef string)
+diff --git a/Source/JavaScriptCore/runtime/DateConversion.cpp b/Source/JavaScriptCore/runtime/DateConversion.cpp
+index 0b57f012d..05e27338b 100644
+--- a/Source/JavaScriptCore/runtime/DateConversion.cpp
++++ b/Source/JavaScriptCore/runtime/DateConversion.cpp
+@@ -107,7 +107,8 @@ String formatDateTime(const GregorianDateTime& t, DateTimeFormat format, bool as
+ #if OS(WINDOWS)
+             TIME_ZONE_INFORMATION timeZoneInformation;
+             GetTimeZoneInformation(&timeZoneInformation);
+-            const WCHAR* timeZoneName = t.isDST() ? timeZoneInformation.DaylightName : timeZoneInformation.StandardName;
++            const WCHAR* winTimeZoneName = t.isDST() ? timeZoneInformation.DaylightName : timeZoneInformation.StandardName;
++            String timeZoneName(reinterpret_cast<const UChar*>(winTimeZoneName));
+ #else
+             struct tm gtm = t;
+             char timeZoneName[70];
+diff --git a/Source/WTF/wtf/TypeTraits.h b/Source/WTF/wtf/TypeTraits.h
+index 9df2c95cf..f5d6121fd 100644
+--- a/Source/WTF/wtf/TypeTraits.h
++++ b/Source/WTF/wtf/TypeTraits.h
+@@ -72,6 +72,9 @@ namespace WTF {
+     template<> struct IsInteger<unsigned long>      { static const bool value = true; };
+     template<> struct IsInteger<long long>          { static const bool value = true; };
+     template<> struct IsInteger<unsigned long long> { static const bool value = true; };
++#if __cplusplus >= 201103L || defined(__GXX_EXPERIMENTAL_CXX0X__) || (defined(_HAS_CHAR16_T_LANGUAGE_SUPPORT) && _HAS_CHAR16_T_LANGUAGE_SUPPORT)
++    template<> struct IsInteger<char16_t>           { static const bool value = true; };
++#endif
+ #if !COMPILER(MSVC) || defined(_NATIVE_WCHAR_T_DEFINED)
+     template<> struct IsInteger<wchar_t>            { static const bool value = true; };
+ #endif
+diff --git a/Source/WebKit2/Shared/API/c/WKString.cpp b/Source/WebKit2/Shared/API/c/WKString.cpp
+index cbac67dd8..23400a64e 100644
+--- a/Source/WebKit2/Shared/API/c/WKString.cpp
++++ b/Source/WebKit2/Shared/API/c/WKString.cpp
+@@ -55,7 +55,7 @@ size_t WKStringGetLength(WKStringRef stringRef)
+ size_t WKStringGetCharacters(WKStringRef stringRef, WKChar* buffer, size_t bufferLength)
+ {
+     COMPILE_ASSERT(sizeof(WKChar) == sizeof(UChar), WKStringGetCharacters_sizeof_WKChar_matches_UChar);
+-    return (toImpl(stringRef)->getCharacters(static_cast<UChar*>(buffer), bufferLength));
++    return (toImpl(stringRef)->getCharacters(reinterpret_cast<UChar*>(buffer), bufferLength));
+ }
+ 
+ size_t WKStringGetMaximumUTF8CStringSize(WKStringRef stringRef)
+-- 
+2.13.3
+
diff --git a/recipes-qt/qt5/qtwebkit_git.bb b/recipes-qt/qt5/qtwebkit_git.bb
index 4845d0f..3c52ef3 100644
--- a/recipes-qt/qt5/qtwebkit_git.bb
+++ b/recipes-qt/qt5/qtwebkit_git.bb
@@ -22,6 +22,7 @@ SRC_URI += "\
     file://0001-qtwebkit-fix-QA-issue-bad-RPATH.patch \
     file://0002-Remove-TEXTREL-tag-in-x86.patch \
     file://0003-Exclude-backtrace-API-for-non-glibc-libraries.patch \
+    file://0004-Fix-compilation-with-ICU-59.patch \
 "
 
 PACKAGECONFIG ??= "gstreamer qtlocation qtmultimedia qtsensors qtwebchannel \
-- 
2.14.0


