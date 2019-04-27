Return-Path: <costamagna.gianfranco@gmail.com>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id E21727DB04
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 27 Apr 2019 08:11:55 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id 26so6754098wmj.3
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 27 Apr 2019 01:11:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=04i9czZmQmF52rJNrxhRlTjarGcV+Ahu+y9RbRZCnHM=;
	b=DHXoGv36bneYvjTTsiNRrejcwiF0uY+YIuDDQRVkpE7oqLAQC4eoyjohZejcuakNDf
	Ez5uD7xtmfPil0AyanI3T4+Aw+MaUNeQIFy2clTRKhch7q+D1XqfZGZH3tlUObpeVeG4
	qVIEEz6x/UFahgoCK3wMeEt6Kb5+WHV59bbOgSFwGwNRApjCkLDoagOQ5g37mVOcH1Y3
	MTxEswQtxBVoR03V9Wg36T3GrX2Z19j9ATyq2fsRo1XwQYHHpDlS7KbMtd3WVpG2gPx2
	Tj1SbJgY0/hFYzmAPQLF9M1by+Ga+UXzFHOoZ+E67WieKdNvQz5ow3BuNSkH1YKE6hzv
	Ydkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=04i9czZmQmF52rJNrxhRlTjarGcV+Ahu+y9RbRZCnHM=;
	b=YKxxtLbHjbEVSwdq9iJD5XCLQaDgoGfS35n6mgpolpEQBfG6TJkB1wXMqLFlqwefur
	7QugoSZqQPBMUCX/vJ/jLOWrykkR2v/wSAWCXz0iJviRSoAP294/hmwg4htxlYP52Sax
	gZsxz5h/HaAYfd/gEhwHP3XsdNlgv+ZqnyIJaLLbm4REoRfOuYr6QIoOSif1QINo1VQ6
	bBsCuXzF2rBmfgINP2A2tP/RtEIcdG8hkMhOJGDCHRU9MO7Awj0KdBvWElYZQkilo+Vu
	6P9j7+T0zfpzXJ4hFGxpu+XD4/saasZ7IMzLQvyt62tcllKJOpDIMbWYl5xpTkOFfXEk
	k7Hw==
X-Gm-Message-State: APjAAAW/9gOQbtkMYGhp8nW6iIKaTP4J2mO+8YFWmTDpvUx/Rp01fvzd
	lBC1hrB2kmi5EksTYbL5+7BdqEDG
X-Google-Smtp-Source: APXvYqz4DYjkyvD2vZIE9dYPHH6j1yLDJF87LE4lQAeF+qR3lJFQhCMXJonbuQzXmyxXUTar82/BbQ==
X-Received: by 2002:a1c:730c:: with SMTP id d12mr10968011wmb.10.1556352715725; 
	Sat, 27 Apr 2019 01:11:55 -0700 (PDT)
Received: from localhost.localdomain ([31.157.66.55])
	by smtp.gmail.com with ESMTPSA id
	f10sm26987510wrs.17.2019.04.27.01.11.54
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 27 Apr 2019 01:11:55 -0700 (PDT)
From: Gianfranco Costamagna <costamagna.gianfranco@gmail.com>
X-Google-Original-From: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 27 Apr 2019 09:42:24 +0200
Message-Id: <20190427074224.28516-1-costamagnagianfranco@yahoo.it>
X-Mailer: git-send-email 2.17.1
Cc: Gianfranco Costamagna <locutusofborg@debian.org>,
	Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
Subject: [meta-oe][PATCH] cpprest: update to 2.10.13, drop 32bit build fix: upstream Add back test disables from Debian, they are still needed with the network access disabled
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
X-List-Received-Date: Sat, 27 Apr 2019 08:11:56 -0000

Signed-off-by: Gianfranco Costamagna <locutusofborg@debian.org>
---
 .../cpprest/cpprest/1094.patch                | 307 ------------------
 .../cpprest/cpprest/disable-float-tests.patch |  25 ++
 .../cpprest/disable-outside-tests.patch       | 138 ++++++++
 ...{cpprest_2.10.12.bb => cpprest_2.10.13.bb} |   7 +-
 4 files changed, 167 insertions(+), 310 deletions(-)
 delete mode 100644 meta-oe/recipes-support/cpprest/cpprest/1094.patch
 create mode 100644 meta-oe/recipes-support/cpprest/cpprest/disable-float-tests.patch
 create mode 100644 meta-oe/recipes-support/cpprest/cpprest/disable-outside-tests.patch
 rename meta-oe/recipes-support/cpprest/{cpprest_2.10.12.bb => cpprest_2.10.13.bb} (78%)

diff --git a/meta-oe/recipes-support/cpprest/cpprest/1094.patch b/meta-oe/recipes-support/cpprest/cpprest/1094.patch
deleted file mode 100644
index 3daad97f0..000000000
--- a/meta-oe/recipes-support/cpprest/cpprest/1094.patch
+++ /dev/null
@@ -1,307 +0,0 @@
-From d672de675a16e5ab9efcf783705cbd171f38188e Mon Sep 17 00:00:00 2001
-From: "Billy O'Neal (VC LIBS)" <bion@microsoft.com>
-Date: Thu, 28 Mar 2019 15:17:12 -0700
-Subject: [PATCH] Avoid tripping over 32 bit time_t mistakes.
-
-Resolves https://github.com/Microsoft/cpprestsdk/issues/1090
----
- Release/src/utilities/asyncrt_utils.cpp     |  30 ++---
- Release/tests/functional/utils/datetime.cpp | 140 ++++++++++----------
- 2 files changed, 84 insertions(+), 86 deletions(-)
-
-diff --git a/Release/src/utilities/asyncrt_utils.cpp b/Release/src/utilities/asyncrt_utils.cpp
-index 4a692e5fa..986b64bb7 100644
---- a/Release/src/utilities/asyncrt_utils.cpp
-+++ b/Release/src/utilities/asyncrt_utils.cpp
-@@ -618,7 +618,7 @@ std::string __cdecl conversions::to_utf8string(const utf16string& value) { retur
- 
- utf16string __cdecl conversions::to_utf16string(const std::string& value) { return utf8_to_utf16(value); }
- 
--static const uint64_t ntToUnixOffsetSeconds = 11644473600U; // diff between windows and unix epochs (seconds)
-+static const int64_t ntToUnixOffsetSeconds = 11644473600; // diff between windows and unix epochs (seconds)
- 
- datetime __cdecl datetime::utc_now()
- {
-@@ -634,10 +634,10 @@ datetime __cdecl datetime::utc_now()
- #else // LINUX
-     struct timeval time;
-     gettimeofday(&time, nullptr);
--    uint64_t result = ntToUnixOffsetSeconds + time.tv_sec;
-+    int64_t result = ntToUnixOffsetSeconds + time.tv_sec;
-     result *= _secondTicks;      // convert to 10e-7
-     result += time.tv_usec * 10; // convert and add microseconds, 10e-6 to 10e-7
--    return datetime(result);
-+    return datetime(static_cast<interval_type>(result));
- #endif
- }
- 
-@@ -646,7 +646,7 @@ static const char monthNames[] = "Jan\0Feb\0Mar\0Apr\0May\0Jun\0Jul\0Aug\0Sep\0O
- 
- utility::string_t datetime::to_string(date_format format) const
- {
--    const uint64_t input = m_interval / _secondTicks; // convert to seconds
-+    const int64_t input = static_cast<int64_t>(m_interval / _secondTicks); // convert to seconds
-     const int frac_sec = static_cast<int>(m_interval % _secondTicks);
-     const time_t time = static_cast<time_t>(input - ntToUnixOffsetSeconds);
-     struct tm t;
-@@ -797,22 +797,20 @@ static int atoi2(const CharT* str)
-     return (static_cast<unsigned char>(str[0]) - '0') * 10 + (static_cast<unsigned char>(str[1]) - '0');
- }
- 
--static const time_t maxTimeT = sizeof(time_t) == 4 ? (time_t)INT_MAX : (time_t)LLONG_MAX;
--
--static time_t timezone_adjust(time_t result, unsigned char chSign, int adjustHours, int adjustMinutes)
-+static int64_t timezone_adjust(int64_t result, unsigned char chSign, int adjustHours, int adjustMinutes)
- {
-     if (adjustHours > 23)
-     {
--        return (time_t)-1;
-+        return -1;
-     }
- 
-     // adjustMinutes > 59 is impossible due to digit 5 check
-     const int tzAdjust = adjustMinutes * 60 + adjustHours * 60 * 60;
-     if (chSign == '-')
-     {
--        if (maxTimeT - result < tzAdjust)
-+        if (INT64_MAX - result < tzAdjust)
-         {
--            return (time_t)-1;
-+            return -1;
-         }
- 
-         result += tzAdjust;
-@@ -821,7 +819,7 @@ static time_t timezone_adjust(time_t result, unsigned char chSign, int adjustHou
-     {
-         if (tzAdjust > result)
-         {
--            return (time_t)-1;
-+            return -1;
-         }
- 
-         result -= tzAdjust;
-@@ -830,10 +828,10 @@ static time_t timezone_adjust(time_t result, unsigned char chSign, int adjustHou
-     return result;
- }
- 
--static time_t make_gm_time(struct tm* t)
-+static int64_t make_gm_time(struct tm* t)
- {
- #ifdef _MSC_VER
--    return _mkgmtime(t);
-+    return static_cast<int64_t>(_mkgmtime(t));
- #elif (defined(ANDROID) || defined(__ANDROID__))
-     // HACK: The (nonportable?) POSIX function timegm is not available in
-     //       bionic. As a workaround[1][2], we set the C library timezone to
-@@ -867,9 +865,9 @@ static time_t make_gm_time(struct tm* t)
-             unsetenv("TZ");
-         }
-     }
--    return time;
-+    return static_cast<int64_t>(time);
- #else  // ^^^ ANDROID // Other POSIX platforms vvv
--    return timegm(t);
-+    return static_cast<int64_t>(timegm(t));
- #endif // _MSC_VER
- }
- 
-@@ -916,7 +914,7 @@ zone        =  "UT"  / "GMT"                ; Universal Time
- datetime __cdecl datetime::from_string(const utility::string_t& dateString, date_format format)
- {
-     datetime result;
--    time_t seconds;
-+    int64_t seconds;
-     uint64_t frac_sec = 0;
-     struct tm t{};
-     auto str = dateString.c_str();
-diff --git a/Release/tests/functional/utils/datetime.cpp b/Release/tests/functional/utils/datetime.cpp
-index ae7f7a5e4..acd6fddb0 100644
---- a/Release/tests/functional/utils/datetime.cpp
-+++ b/Release/tests/functional/utils/datetime.cpp
-@@ -133,75 +133,77 @@ SUITE(datetime)
- 
-     TEST(parsing_time_rfc1123_accepts_each_day)
-     {
--        TestRfc1123IsTimeT(_XPLATSTR("01 Jan 1970 00:00:00 GMT"), (time_t) 0);
--        TestRfc1123IsTimeT(_XPLATSTR("Fri, 02 Jan 1970 00:00:00 GMT"), (time_t) 86400 * 1);
--        TestRfc1123IsTimeT(_XPLATSTR("Sat, 03 Jan 1970 00:00:00 GMT"), (time_t) 86400 * 2);
--        TestRfc1123IsTimeT(_XPLATSTR("Sun, 04 Jan 1970 00:00:00 GMT"), (time_t) 86400 * 3);
--        TestRfc1123IsTimeT(_XPLATSTR("Mon, 05 Jan 1970 00:00:00 GMT"), (time_t) 86400 * 4);
--        TestRfc1123IsTimeT(_XPLATSTR("Tue, 06 Jan 1970 00:00:00 GMT"), (time_t) 86400 * 5);
--        TestRfc1123IsTimeT(_XPLATSTR("Wed, 07 Jan 1970 00:00:00 GMT"), (time_t) 86400 * 6);
-+        TestRfc1123IsTimeT(_XPLATSTR("01 Jan 1970 00:00:00 GMT"), (time_t)0);
-+        TestRfc1123IsTimeT(_XPLATSTR("Fri, 02 Jan 1970 00:00:00 GMT"), (time_t)86400 * 1);
-+        TestRfc1123IsTimeT(_XPLATSTR("Sat, 03 Jan 1970 00:00:00 GMT"), (time_t)86400 * 2);
-+        TestRfc1123IsTimeT(_XPLATSTR("Sun, 04 Jan 1970 00:00:00 GMT"), (time_t)86400 * 3);
-+        TestRfc1123IsTimeT(_XPLATSTR("Mon, 05 Jan 1970 00:00:00 GMT"), (time_t)86400 * 4);
-+        TestRfc1123IsTimeT(_XPLATSTR("Tue, 06 Jan 1970 00:00:00 GMT"), (time_t)86400 * 5);
-+        TestRfc1123IsTimeT(_XPLATSTR("Wed, 07 Jan 1970 00:00:00 GMT"), (time_t)86400 * 6);
-     }
- 
-     TEST(parsing_time_rfc1123_boundary_cases)
-     {
--        TestRfc1123IsTimeT(_XPLATSTR("01 Jan 1970 00:00:00 GMT"), (time_t) 0);
--        TestRfc1123IsTimeT(_XPLATSTR("19 Jan 2038 03:14:06 GMT"), (time_t) INT_MAX - 1);
--#ifndef _USE_32BIT_TIME_T
--        TestRfc1123IsTimeT(_XPLATSTR("19 Jan 2038 03:13:07 -0001"), (time_t) INT_MAX);
--        TestRfc1123IsTimeT(_XPLATSTR("19 Jan 2038 03:14:07 -0000"), (time_t) INT_MAX);
--#endif // _USE_32BIT_TIME_T
--        TestRfc1123IsTimeT(_XPLATSTR("14 Jan 2019 23:16:21 +0000"), (time_t) 1547507781);
--        TestRfc1123IsTimeT(_XPLATSTR("14 Jan 2019 23:16:21 -0001"), (time_t) 1547507841);
--        TestRfc1123IsTimeT(_XPLATSTR("14 Jan 2019 23:16:21 +0001"), (time_t) 1547507721);
--        TestRfc1123IsTimeT(_XPLATSTR("14 Jan 2019 23:16:21 -0100"), (time_t) 1547511381);
--        TestRfc1123IsTimeT(_XPLATSTR("14 Jan 2019 23:16:21 +0100"), (time_t) 1547504181);
-+        TestRfc1123IsTimeT(_XPLATSTR("01 Jan 1970 00:00:00 GMT"), (time_t)0);
-+        TestRfc1123IsTimeT(_XPLATSTR("19 Jan 2038 03:14:06 GMT"), (time_t)INT_MAX - 1);
-+        if (sizeof(time_t) == 8)
-+        {
-+            TestRfc1123IsTimeT(_XPLATSTR("19 Jan 2038 03:13:07 -0001"), (time_t)INT_MAX);
-+            TestRfc1123IsTimeT(_XPLATSTR("19 Jan 2038 03:14:07 -0000"), (time_t)INT_MAX);
-+        }
-+        TestRfc1123IsTimeT(_XPLATSTR("14 Jan 2019 23:16:21 +0000"), (time_t)1547507781);
-+        TestRfc1123IsTimeT(_XPLATSTR("14 Jan 2019 23:16:21 -0001"), (time_t)1547507841);
-+        TestRfc1123IsTimeT(_XPLATSTR("14 Jan 2019 23:16:21 +0001"), (time_t)1547507721);
-+        TestRfc1123IsTimeT(_XPLATSTR("14 Jan 2019 23:16:21 -0100"), (time_t)1547511381);
-+        TestRfc1123IsTimeT(_XPLATSTR("14 Jan 2019 23:16:21 +0100"), (time_t)1547504181);
-     }
- 
-     TEST(parsing_time_rfc1123_uses_each_field)
-     {
--        TestRfc1123IsTimeT(_XPLATSTR("02 Jan 1970 00:00:00 GMT"), (time_t) 86400);
--        TestRfc1123IsTimeT(_XPLATSTR("12 Jan 1970 00:00:00 GMT"), (time_t) 950400);
--        TestRfc1123IsTimeT(_XPLATSTR("01 Feb 1970 00:00:00 GMT"), (time_t) 2678400);
--        TestRfc1123IsTimeT(_XPLATSTR("01 Jan 2000 00:00:00 GMT"), (time_t) 946684800);
--#ifndef _USE_32BIT_TIME_T
--        TestRfc1123IsTimeT(_XPLATSTR("01 Jan 2100 00:00:00 GMT"), (time_t) 4102444800);
--#endif // _USE_32BIT_TIME_T
--        TestRfc1123IsTimeT(_XPLATSTR("01 Jan 1990 00:00:00 GMT"), (time_t) 631152000);
--        TestRfc1123IsTimeT(_XPLATSTR("01 Jan 1971 00:00:00 GMT"), (time_t) 31536000);
--        TestRfc1123IsTimeT(_XPLATSTR("01 Jan 1970 10:00:00 GMT"), (time_t) 36000);
--        TestRfc1123IsTimeT(_XPLATSTR("01 Jan 1970 01:00:00 GMT"), (time_t) 3600);
--        TestRfc1123IsTimeT(_XPLATSTR("01 Jan 1970 00:10:00 GMT"), (time_t) 600);
--        TestRfc1123IsTimeT(_XPLATSTR("01 Jan 1970 00:01:00 GMT"), (time_t) 60);
--        TestRfc1123IsTimeT(_XPLATSTR("01 Jan 1970 00:00:10 GMT"), (time_t) 10);
--        TestRfc1123IsTimeT(_XPLATSTR("01 Jan 1970 00:00:01 GMT"), (time_t) 1);
--        TestRfc1123IsTimeT(_XPLATSTR("01 Jan 1970 10:00:00 GMT"), (time_t) 36000);
--        TestRfc1123IsTimeT(_XPLATSTR("01 Jan 1970 02:00:00 PST"), (time_t) 36000);
--        TestRfc1123IsTimeT(_XPLATSTR("01 Jan 1970 03:00:00 PDT"), (time_t) 36000);
--        TestRfc1123IsTimeT(_XPLATSTR("01 Jan 1970 03:00:00 MST"), (time_t) 36000);
--        TestRfc1123IsTimeT(_XPLATSTR("01 Jan 1970 04:00:00 MDT"), (time_t) 36000);
--        TestRfc1123IsTimeT(_XPLATSTR("01 Jan 1970 04:00:00 CST"), (time_t) 36000);
--        TestRfc1123IsTimeT(_XPLATSTR("01 Jan 1970 05:00:00 CDT"), (time_t) 36000);
--        TestRfc1123IsTimeT(_XPLATSTR("01 Jan 1970 05:00:00 EST"), (time_t) 36000);
--        TestRfc1123IsTimeT(_XPLATSTR("01 Jan 1970 06:00:00 EDT"), (time_t) 36000);
--        TestRfc1123IsTimeT(_XPLATSTR("01 Jan 1970 06:00:00 -0400"), (time_t) 36000);
--        TestRfc1123IsTimeT(_XPLATSTR("01 Jan 1970 05:59:00 -0401"), (time_t) 36000);
-+        TestRfc1123IsTimeT(_XPLATSTR("02 Jan 1970 00:00:00 GMT"), (time_t)86400);
-+        TestRfc1123IsTimeT(_XPLATSTR("12 Jan 1970 00:00:00 GMT"), (time_t)950400);
-+        TestRfc1123IsTimeT(_XPLATSTR("01 Feb 1970 00:00:00 GMT"), (time_t)2678400);
-+        TestRfc1123IsTimeT(_XPLATSTR("01 Jan 2000 00:00:00 GMT"), (time_t)946684800);
-+        if (sizeof(time_t) == 8)
-+        {
-+            TestRfc1123IsTimeT(_XPLATSTR("01 Jan 2100 00:00:00 GMT"), (time_t)4102444800);
-+        }
-+        TestRfc1123IsTimeT(_XPLATSTR("01 Jan 1990 00:00:00 GMT"), (time_t)631152000);
-+        TestRfc1123IsTimeT(_XPLATSTR("01 Jan 1971 00:00:00 GMT"), (time_t)31536000);
-+        TestRfc1123IsTimeT(_XPLATSTR("01 Jan 1970 10:00:00 GMT"), (time_t)36000);
-+        TestRfc1123IsTimeT(_XPLATSTR("01 Jan 1970 01:00:00 GMT"), (time_t)3600);
-+        TestRfc1123IsTimeT(_XPLATSTR("01 Jan 1970 00:10:00 GMT"), (time_t)600);
-+        TestRfc1123IsTimeT(_XPLATSTR("01 Jan 1970 00:01:00 GMT"), (time_t)60);
-+        TestRfc1123IsTimeT(_XPLATSTR("01 Jan 1970 00:00:10 GMT"), (time_t)10);
-+        TestRfc1123IsTimeT(_XPLATSTR("01 Jan 1970 00:00:01 GMT"), (time_t)1);
-+        TestRfc1123IsTimeT(_XPLATSTR("01 Jan 1970 10:00:00 GMT"), (time_t)36000);
-+        TestRfc1123IsTimeT(_XPLATSTR("01 Jan 1970 02:00:00 PST"), (time_t)36000);
-+        TestRfc1123IsTimeT(_XPLATSTR("01 Jan 1970 03:00:00 PDT"), (time_t)36000);
-+        TestRfc1123IsTimeT(_XPLATSTR("01 Jan 1970 03:00:00 MST"), (time_t)36000);
-+        TestRfc1123IsTimeT(_XPLATSTR("01 Jan 1970 04:00:00 MDT"), (time_t)36000);
-+        TestRfc1123IsTimeT(_XPLATSTR("01 Jan 1970 04:00:00 CST"), (time_t)36000);
-+        TestRfc1123IsTimeT(_XPLATSTR("01 Jan 1970 05:00:00 CDT"), (time_t)36000);
-+        TestRfc1123IsTimeT(_XPLATSTR("01 Jan 1970 05:00:00 EST"), (time_t)36000);
-+        TestRfc1123IsTimeT(_XPLATSTR("01 Jan 1970 06:00:00 EDT"), (time_t)36000);
-+        TestRfc1123IsTimeT(_XPLATSTR("01 Jan 1970 06:00:00 -0400"), (time_t)36000);
-+        TestRfc1123IsTimeT(_XPLATSTR("01 Jan 1970 05:59:00 -0401"), (time_t)36000);
-     }
- 
-     TEST(parsing_time_rfc1123_max_days)
-     {
--        TestRfc1123IsTimeT(_XPLATSTR("31 Jan 1970 00:00:00 GMT"), (time_t) 2592000);
--        TestRfc1123IsTimeT(_XPLATSTR("28 Feb 2019 00:00:00 GMT"), (time_t) 1551312000); // non leap year allows feb 28
--        TestRfc1123IsTimeT(_XPLATSTR("29 Feb 2020 00:00:00 GMT"), (time_t) 1582934400); // leap year allows feb 29
--        TestRfc1123IsTimeT(_XPLATSTR("31 Mar 1970 00:00:00 GMT"), (time_t) 7689600);
--        TestRfc1123IsTimeT(_XPLATSTR("30 Apr 1970 00:00:00 GMT"), (time_t) 10281600);
--        TestRfc1123IsTimeT(_XPLATSTR("31 May 1970 00:00:00 GMT"), (time_t) 12960000);
--        TestRfc1123IsTimeT(_XPLATSTR("30 Jun 1970 00:00:00 GMT"), (time_t) 15552000);
--        TestRfc1123IsTimeT(_XPLATSTR("31 Jul 1970 00:00:00 GMT"), (time_t) 18230400);
--        TestRfc1123IsTimeT(_XPLATSTR("31 Aug 1970 00:00:00 GMT"), (time_t) 20908800);
--        TestRfc1123IsTimeT(_XPLATSTR("30 Sep 1970 00:00:00 GMT"), (time_t) 23500800);
--        TestRfc1123IsTimeT(_XPLATSTR("31 Oct 1970 00:00:00 GMT"), (time_t) 26179200);
--        TestRfc1123IsTimeT(_XPLATSTR("30 Nov 1970 00:00:00 GMT"), (time_t) 28771200);
--        TestRfc1123IsTimeT(_XPLATSTR("31 Dec 1970 00:00:00 GMT"), (time_t) 31449600);
-+        TestRfc1123IsTimeT(_XPLATSTR("31 Jan 1970 00:00:00 GMT"), (time_t)2592000);
-+        TestRfc1123IsTimeT(_XPLATSTR("28 Feb 2019 00:00:00 GMT"), (time_t)1551312000); // non leap year allows feb 28
-+        TestRfc1123IsTimeT(_XPLATSTR("29 Feb 2020 00:00:00 GMT"), (time_t)1582934400); // leap year allows feb 29
-+        TestRfc1123IsTimeT(_XPLATSTR("31 Mar 1970 00:00:00 GMT"), (time_t)7689600);
-+        TestRfc1123IsTimeT(_XPLATSTR("30 Apr 1970 00:00:00 GMT"), (time_t)10281600);
-+        TestRfc1123IsTimeT(_XPLATSTR("31 May 1970 00:00:00 GMT"), (time_t)12960000);
-+        TestRfc1123IsTimeT(_XPLATSTR("30 Jun 1970 00:00:00 GMT"), (time_t)15552000);
-+        TestRfc1123IsTimeT(_XPLATSTR("31 Jul 1970 00:00:00 GMT"), (time_t)18230400);
-+        TestRfc1123IsTimeT(_XPLATSTR("31 Aug 1970 00:00:00 GMT"), (time_t)20908800);
-+        TestRfc1123IsTimeT(_XPLATSTR("30 Sep 1970 00:00:00 GMT"), (time_t)23500800);
-+        TestRfc1123IsTimeT(_XPLATSTR("31 Oct 1970 00:00:00 GMT"), (time_t)26179200);
-+        TestRfc1123IsTimeT(_XPLATSTR("30 Nov 1970 00:00:00 GMT"), (time_t)28771200);
-+        TestRfc1123IsTimeT(_XPLATSTR("31 Dec 1970 00:00:00 GMT"), (time_t)31449600);
-     }
- 
-     TEST(parsing_time_rfc1123_invalid_cases)
-@@ -266,7 +268,7 @@ SUITE(datetime)
-             _XPLATSTR("Thu, 01 Jan 1970 00:00:00 G"),
-             _XPLATSTR("Thu, 01 Jan 1970 00:00:00 GM"),
-             _XPLATSTR("Fri, 01 Jan 1970 00:00:00 GMT"), // wrong day
--            _XPLATSTR("01 Jan 4970 00:00:00 GMT"), // year too big
-+            _XPLATSTR("01 Jan 4970 00:00:00 GMT"),      // year too big
-             _XPLATSTR("01 Jan 3001 00:00:00 GMT"),
-             _XPLATSTR("01 Xxx 1971 00:00:00 GMT"), // month bad
-             _XPLATSTR("00 Jan 1971 00:00:00 GMT"), // day too small
-@@ -288,8 +290,8 @@ SUITE(datetime)
-             _XPLATSTR("01 Jan 1971 00:60:00 GMT"), // minute too big
-             _XPLATSTR("01 Jan 1971 00:00:70 GMT"), // second too big
-             _XPLATSTR("01 Jan 1971 00:00:61 GMT"),
--            _XPLATSTR("01 Jan 1969 00:00:00 GMT"), // underflow
--            _XPLATSTR("01 Jan 1969 00:00:00 CEST"), // bad tz
-+            _XPLATSTR("01 Jan 1969 00:00:00 GMT"),   // underflow
-+            _XPLATSTR("01 Jan 1969 00:00:00 CEST"),  // bad tz
-             _XPLATSTR("01 Jan 1970 00:00:00 +2400"), // bad tzoffsets
-             _XPLATSTR("01 Jan 1970 00:00:00 -3000"),
-             _XPLATSTR("01 Jan 1970 00:00:00 +2160"),
-@@ -309,11 +311,12 @@ SUITE(datetime)
-         // boundary cases:
-         TestDateTimeRoundtrip(_XPLATSTR("1970-01-01T00:00:00Z"));                                         // epoch
-         TestDateTimeRoundtrip(_XPLATSTR("2038-01-19T03:14:06+00:00"), _XPLATSTR("2038-01-19T03:14:06Z")); // INT_MAX - 1
--#ifndef _USE_32BIT_TIME_T
--        TestDateTimeRoundtrip(_XPLATSTR("2038-01-19T03:13:07-00:01"),
--                              _XPLATSTR("2038-01-19T03:14:07Z")); // INT_MAX after subtacting 1
--        TestDateTimeRoundtrip(_XPLATSTR("2038-01-19T03:14:07-00:00"), _XPLATSTR("2038-01-19T03:14:07Z"));
--#endif // _USE_32BIT_TIME_T
-+        if (sizeof(time_t) == 8)
-+        {
-+            TestDateTimeRoundtrip(_XPLATSTR("2038-01-19T03:13:07-00:01"),
-+                                  _XPLATSTR("2038-01-19T03:14:07Z")); // INT_MAX after subtacting 1
-+            TestDateTimeRoundtrip(_XPLATSTR("2038-01-19T03:14:07-00:00"), _XPLATSTR("2038-01-19T03:14:07Z"));
-+        }
-     }
- 
-     TEST(parsing_time_iso8601_uses_each_timezone_digit)
-@@ -456,11 +459,8 @@ SUITE(datetime)
-             _XPLATSTR("1971-01-01T00:60:00Z"), // minute too big
-             _XPLATSTR("1971-01-01T00:00:70Z"), // second too big
-             _XPLATSTR("1971-01-01T00:00:61Z"),
--            _XPLATSTR("1969-01-01T00:00:00Z"), // underflow
--#ifdef _USE_32BIT_TIME_T
--            _XPLATSTR("3000-01-01T00:00:01Z"), // overflow
--#endif
--            _XPLATSTR("3001-01-01T00:00:00Z"),
-+            _XPLATSTR("1969-01-01T00:00:00Z"),      // underflow
-+            _XPLATSTR("3001-01-01T00:00:00Z"),      // overflow
-             _XPLATSTR("1970-01-01T00:00:00+00:01"), // time zone underflow
-             // _XPLATSTR("1970-01-01T00:00:00.Z"), // accepted as invalid timezone above
-             _XPLATSTR("1970-01-01T00:00:00+24:00"), // bad tzoffsets
diff --git a/meta-oe/recipes-support/cpprest/cpprest/disable-float-tests.patch b/meta-oe/recipes-support/cpprest/cpprest/disable-float-tests.patch
new file mode 100644
index 000000000..3ff7f0dd3
--- /dev/null
+++ b/meta-oe/recipes-support/cpprest/cpprest/disable-float-tests.patch
@@ -0,0 +1,25 @@
+Description: new toolchain might have increased the float precision
+Author: Gianfranco Costamagna <locutusofborg@debian.org>
+Last-Update: 2017-10-28
+Forwarded: https://github.com/Microsoft/cpprestsdk/issues/576
+
+Index: cpprest/Release/tests/functional/streams/istream_tests.cpp
+===================================================================
+--- cpprest.orig/Release/tests/functional/streams/istream_tests.cpp
++++ cpprest/Release/tests/functional/streams/istream_tests.cpp
+@@ -1297,6 +1297,7 @@
+     void compare_double(double expected, double actual) { compare_floating(expected, actual, DBL_EPSILON); }
+     void compare_float(float expected, float actual) { compare_floating(expected, actual, FLT_EPSILON); }
+ 
++    /*
+     TEST(extract_floating_point)
+     {
+         std::string test_string;
+@@ -1343,6 +1344,7 @@
+             if (expected == 0) VERIFY_ARE_EQUAL(1 / expected, 1 / actual);
+         } while (!std_istream.eof());
+     }
++    */
+ 
+     TEST(extract_floating_point_with_exceptions)
+     {
diff --git a/meta-oe/recipes-support/cpprest/cpprest/disable-outside-tests.patch b/meta-oe/recipes-support/cpprest/cpprest/disable-outside-tests.patch
new file mode 100644
index 000000000..5232e2a1d
--- /dev/null
+++ b/meta-oe/recipes-support/cpprest/cpprest/disable-outside-tests.patch
@@ -0,0 +1,138 @@
+Description: Debian forbids calls to external websites.
+
+Author: Gianfranco Costamagna <locutus@debian.org>
+Origin: Debian
+Forwarded: not-needed
+Reviewed-By: Gianfranco Costamagna <locutusofborg@debian.org>
+Last-Update: 2015-11-25
+
+Index: cpprest/Release/tests/functional/http/client/CMakeLists.txt
+===================================================================
+--- cpprest.orig/Release/tests/functional/http/client/CMakeLists.txt
++++ cpprest/Release/tests/functional/http/client/CMakeLists.txt
+@@ -12,7 +12,6 @@
+   multiple_requests.cpp
+   oauth1_tests.cpp
+   oauth2_tests.cpp
+-  outside_tests.cpp
+   pipeline_stage_tests.cpp
+   progress_handler_tests.cpp
+   proxy_tests.cpp
+Index: cpprest/Release/tests/functional/http/client/authentication_tests.cpp
+===================================================================
+--- cpprest.orig/Release/tests/functional/http/client/authentication_tests.cpp
++++ cpprest/Release/tests/functional/http/client/authentication_tests.cpp
+@@ -675,9 +675,9 @@
+         VERIFY_ARE_EQUAL(return_code, response.status_code());
+     }
+ 
+-    TEST(auth_no_data) { auth_test_impl(false); }
++    //TEST(auth_no_data) { auth_test_impl(false); }
+ 
+-    TEST(unsuccessful_auth_with_basic_cred) { auth_test_impl(true); }
++    //TEST(unsuccessful_auth_with_basic_cred) { auth_test_impl(true); }
+ 
+     TEST_FIXTURE(uri_address, set_user_options_asio_http)
+     {
+@@ -695,6 +695,7 @@
+         VERIFY_ARE_EQUAL(200, response.status_code());
+     }
+ 
++    /*
+     TEST_FIXTURE(uri_address, set_user_options_asio_https)
+     {
+         handle_timeout([] {
+@@ -714,6 +715,7 @@
+             VERIFY_IS_FALSE(v.empty());
+         });
+     }
++    */
+ 
+ #endif
+ 
+Index: cpprest/Release/tests/functional/websockets/client/authentication_tests.cpp
+===================================================================
+--- cpprest.orig/Release/tests/functional/websockets/client/authentication_tests.cpp
++++ cpprest/Release/tests/functional/websockets/client/authentication_tests.cpp
+@@ -93,6 +93,7 @@
+         return false;
+     }
+ 
++    /*
+     TEST(ssl_test)
+     {
+         websocket_client client;
+@@ -127,6 +128,7 @@
+             throw;
+         }
+     }
++    */
+ 
+ // These tests are specific to our websocketpp based implementation.
+ #if !defined(__cplusplus_winrt)
+@@ -159,12 +161,14 @@
+         }
+     }
+ 
++    /*
+     // Test specifically for server SignalR team hit interesting cases with.
+     TEST(sni_with_older_server_test)
+     {
+         websocket_client client;
+         sni_test_impl(client);
+     }
++    */
+ 
+     // WinRT doesn't expose option for disabling.
+     // No stable server is available to reliably test this.
+@@ -194,6 +198,7 @@
+         }
+     }
+ 
++    /*
+     // Winrt doesn't allow explicitly setting server host for SNI.
+     TEST(sni_explicit_hostname)
+     {
+@@ -204,6 +209,7 @@
+         websocket_client client(config);
+         sni_test_impl(client);
+     }
++    */
+ 
+     void handshake_error_test_impl(const ::utility::string_t& host)
+     {
+@@ -225,11 +231,11 @@
+         }
+     }
+ 
+-    TEST(self_signed_cert) { handshake_error_test_impl(U("wss://self-signed.badssl.com/")); }
++    //TEST(self_signed_cert) { handshake_error_test_impl(U("wss://self-signed.badssl.com/")); }
+ 
+-    TEST(hostname_mismatch) { handshake_error_test_impl(U("wss://wrong.host.badssl.com/")); }
++    //TEST(hostname_mismatch) { handshake_error_test_impl(U("wss://wrong.host.badssl.com/")); }
+ 
+-    TEST(cert_expired) { handshake_error_test_impl(U("wss://expired.badssl.com/")); }
++    //TEST(cert_expired) { handshake_error_test_impl(U("wss://expired.badssl.com/")); }
+ 
+ #endif
+ 
+Index: cpprest/Release/tests/functional/http/client/connections_and_errors.cpp
+===================================================================
+--- cpprest.orig/Release/tests/functional/http/client/connections_and_errors.cpp
++++ cpprest/Release/tests/functional/http/client/connections_and_errors.cpp
+@@ -406,6 +406,7 @@
+     }
+ #endif
+ 
++    /*
+     // Try to connect to a server on a closed port and cancel the operation.
+     TEST_FIXTURE(uri_address, cancel_bad_port)
+     {
+@@ -437,6 +438,7 @@
+ 
+         VERIFY_THROWS_HTTP_ERROR_CODE(t.get(), std::errc::operation_canceled);
+     }
++    */
+ 
+ } // SUITE(connections_and_errors)
+ 
diff --git a/meta-oe/recipes-support/cpprest/cpprest_2.10.12.bb b/meta-oe/recipes-support/cpprest/cpprest_2.10.13.bb
similarity index 78%
rename from meta-oe/recipes-support/cpprest/cpprest_2.10.12.bb
rename to meta-oe/recipes-support/cpprest/cpprest_2.10.13.bb
index 67edf5691..1b1265fe3 100644
--- a/meta-oe/recipes-support/cpprest/cpprest_2.10.12.bb
+++ b/meta-oe/recipes-support/cpprest/cpprest_2.10.13.bb
@@ -8,10 +8,11 @@ DEPENDS = "openssl websocketpp zlib boost brotli"
 EXTRA_OECMAKE = "-DCPPREST_EXPORT_DIR=cmake -DCPPREST_EXCLUDE_BROTLI=OFF"
 
 SRC_URI = "git://github.com/Microsoft/cpprestsdk.git;protocol=https;branch=master \
-           file://1094.patch "
+           file://disable-float-tests.patch \
+           file://disable-outside-tests.patch "
 
-# tag 2.10.12
-SRCREV= "d4fb1cf7f7d22c12e2e442ba5a5e98d09b0a28ab"
+# tag 2.10.13
+SRCREV= "9d8f544001cb74544de6dc8c565592f7e2626d6e"
 
 S = "${WORKDIR}/git"
 
-- 
2.17.1


