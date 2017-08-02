Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f65.google.com (mail-pg0-f65.google.com [74.125.83.65])
	by mail.openembedded.org (Postfix) with ESMTP id 0D9F378213
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  2 Aug 2017 02:55:34 +0000 (UTC)
Received: by mail-pg0-f65.google.com with SMTP id y192so4946062pgd.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 01 Aug 2017 19:55:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=VmTlB2bnV3W62Evo2ps9vN4gUvx/UuxBHviXZ020hu8=;
	b=jbaAshuzSmE+6N1RHxh7fMufag0I53nFkcQo8PDgyKSWYjbBx+t4tJAfK3f456cih9
	Y7XN6Qf4gav4m9Dc75bFGbHpU/7hDk+wNBLiZtCYAlYPhDd/9MRNcje+9ud7BB7hImLq
	OWxjJR3+q19QxfIdvZwjU5UNDTQUGTuLsDlt3ZHpDhO4oz5CIdyQHVvvoKFPWqKnit3Y
	sZUXemHvWc2Dt5NrNB0RyQQ5XIuHjX8lV0Ne/jPmlt6pIp2Ta6QbDUB6iE7vLt3vS94k
	SYB0gCogjxMeXXy0QWjKVJMvKOcJjUtaJYVhY76xuApgPfnbLlm15l67XiTc2PCczEsG
	4TaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=VmTlB2bnV3W62Evo2ps9vN4gUvx/UuxBHviXZ020hu8=;
	b=TrVHhXzsvknSb2JZ/QL01Jqcj3rmQloruTj4+lJm49OJR8teW7bVDbG3iKUl+xgNrv
	CggLIt1cFF5JODYPZTAhJjODfZbb9SSLSZNSCx2iK087Fhf5EAbz39Se4eU1I33Ae/h3
	Ms50qqWjlK9pMcBCiFdinZgpEemiZb26fBHiaFtYtAFolh8J3n7vN5tA9djmexCc+ynZ
	qsUkli+EG/S60QFFDeMbi4Veow7jqz9wVWqQFEzjyrdOGxHpF+5VmGftQCl4JVgdpZu0
	RPaorsUdcIZnMI48KIOwkT4tfeKWHq+AjQgkAaV+YJCyBiVSqS25X5Fq8YRTSqiux5T1
	aL8g==
X-Gm-Message-State: AIVw111heWwXoT5lf8Srq+n8ApLe664xB7cfjdPFEGhWuChomOhXL4qy
	V6KuhDaZiW60XUKG
X-Received: by 10.98.82.197 with SMTP id g188mr21344714pfb.34.1501642535682;
	Tue, 01 Aug 2017 19:55:35 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::1f6f])
	by smtp.gmail.com with ESMTPSA id
	s206sm59775669pfs.55.2017.08.01.19.55.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 01 Aug 2017 19:55:34 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  1 Aug 2017 19:55:23 -0700
Message-Id: <20170802025523.37417-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.3
In-Reply-To: <20170802025523.37417-1-raj.khem@gmail.com>
References: <20170802025523.37417-1-raj.khem@gmail.com>
Subject: [meta-qt5][PATCH 2/2] qtwebkit: Backport a patch to fix build with icu-59
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
X-List-Received-Date: Wed, 02 Aug 2017 02:55:35 -0000

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
2.13.3


