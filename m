Return-Path: <andrej.kozemcak@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D037CD6E56
	for <webhook@archiver.kernel.org>; Mon,  1 Jun 2026 12:08:25 +0000 (UTC)
Received: from mta-64-226.siemens.flowmailer.net (mta-64-226.siemens.flowmailer.net [185.136.64.226])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.27002.1780315701296363229
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Jun 2026 05:08:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=andrej.kozemcak@siemens.com header.s=fm1 header.b=Nf5mb3JO;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.226, mailfrom: fm-1334352-20260601120817b15d9e2714000207f9-zg0tbq@rts-flowmailer.siemens.com)
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id 20260601120817b15d9e2714000207f9
        for <openembedded-devel@lists.openembedded.org>;
        Mon, 01 Jun 2026 14:08:17 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=andrej.kozemcak@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=voddR+AF4b9UhBvMqtQ5geI3n6PoEQhy/Pdt7VAIL5Y=;
 b=Nf5mb3JOLfb37+foUkAPg7lgGCWLmuvoH/61/vS9sdQp2HjXb+ek5F8hR3+hdy6vsQkPd6
 DwDoNBpsEf7caTReW5OBh4rAjKI/sHbrOPhcSJ+NX4QQuKCv2KoVt6Ifp3cXV1+7vZOK6Hr9
 vD/+23+OEHFZsV1xi4H/thu+WzNy1VAigoxbqLuczNQwg+ekJYbnCg9cB4KdPwlYLHgL3M2L
 kbamCABL/V4mZnRfEdj3NmJ1UIRuST7AYQ/s2c0YyiZj2tSbfk+I/NgkNt6rNtYrT27zqDGY
 0CeB+RpkPJDiJkkny72CoDrtYQKOxY55W8O+Q47EaLH5YVvRA+JUuGcg==;
From: Andrej Kozemcak <andrej.kozemcak@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Andrej Kozemcak <andrej.kozemcak@siemens.com>
Subject: [meta-oe][PATCH v2] poco: fix timezone and data time parser issue
Date: Mon,  1 Jun 2026 14:08:08 +0200
Message-ID: <20260601120809.7245-1-andrej.kozemcak@siemens.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1334352:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 01 Jun 2026 12:08:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127314

Patch contains tree patches which was merge to poco at once
and fix "time" issues

1 - fix(Foundation): Timezone: invalidate utcOffset cache when /etc/localtime changes

Poco commit 1850dc16aabf5980a490bb1b66086d6695abb823 introduced a
TZInfo cache for the UTC offset to avoid repeated tzset() syscalls.
The cache is invalidated only when the TZ environment variable changes.
However, the TZ variable is process-local: if a different process (e.g.
a timezone configuration daemon or an init script) changes the system
timezone by updating /etc/localtime, the running process is not notified
and its TZ environment variable remains unchanged.

On systems that switch timezone by updating /etc/localtime (a symlink)
without touching the TZ env var, the cache is therefore never invalidated
and Timezone::utcOffset() returns the stale value computed at startup.

Fix by extending cacheTZ()/tzChanged() to also track the inode and
mtime of /etc/localtime via stat(2).  When either changes the cache is
considered stale and reloaded, preserving the performance benefit for
the common case where neither TZ nor /etc/localtime changes between
calls.

2 - fix(Foundation): DateTimeParser: %S consume optional fractional seconds

Parsing ISO 8601 date strings that contain both fractional seconds and a
timezone offset (e.g. "2013-10-07T08:23:19.120-04:00") with the format
"%Y-%m-%dT%H:%M:%S%z" raises a SyntaxException:

  - %S consumes the integer seconds but stops at '.', leaving
    ".120-04:00" unconsumed.
  - %z (parseTZD) is called next but sees '.' and returns without
    consuming anything.
  - The trailing-garbage check then raises SyntaxException.

Extend the %S case to consume and discard an optional fractional-second
suffix ('.' or ',' followed by one or more digits) immediately after
parsing the integer seconds.  This mirrors the existing %s behaviour and
allows %z to see the timezone designator directly, keeping the
trailing-garbage check fully effective for truly invalid input.

3 - test(DateTimeParserTest): add ISO8601 fractional seconds parser test

Add testISO8601FracSeconds to verify that DateTimeParser correctly
handles fractional-second suffixes (dot and comma separated) in
ISO8601_FORMAT strings, and rejects malformed input such as a
bare decimal point with no digits.

Signed-off-by: Andrej Kozemcak <andrej.kozemcak@siemens.com>
---
 ...er-trailing-timezone-designators-Tim.patch | 240 ++++++++++++++++++
 meta-oe/recipes-support/poco/poco_1.15.2.bb   |   1 +
 2 files changed, 241 insertions(+)
 create mode 100644 meta-oe/recipes-support/poco/poco/0004-Fix-DateTimeParser-trailing-timezone-designators-Tim.patch

diff --git a/meta-oe/recipes-support/poco/poco/0004-Fix-DateTimeParser-trailing-timezone-designators-Tim.patch b/meta-oe/recipes-support/poco/poco/0004-Fix-DateTimeParser-trailing-timezone-designators-Tim.patch
new file mode 100644
index 0000000000..d2a8666b23
--- /dev/null
+++ b/meta-oe/recipes-support/poco/poco/0004-Fix-DateTimeParser-trailing-timezone-designators-Tim.patch
@@ -0,0 +1,240 @@
+From a767d36fed678e874536e33731be6dbcc5fdc5d0 Mon Sep 17 00:00:00 2001
+From: kozemcak <akozemcak@gmail.com>
+Date: Tue, 12 May 2026 16:13:12 +0200
+Subject: [PATCH] Fix: DateTimeParser trailing timezone designators & Timezone
+ UTC offset cache invalidation (#5318)
+
+* fix(Foundation): Timezone: invalidate utcOffset cache when /etc/localtime changes
+
+Poco commit 1850dc16aabf5980a490bb1b66086d6695abb823 introduced a
+TZInfo cache for the UTC offset to avoid repeated tzset() syscalls.
+The cache is invalidated only when the TZ environment variable changes.
+However, the TZ variable is process-local: if a different process (e.g.
+a timezone configuration daemon or an init script) changes the system
+timezone by updating /etc/localtime, the running process is not notified
+and its TZ environment variable remains unchanged.
+
+On systems that switch timezone by updating /etc/localtime (a symlink)
+without touching the TZ env var, the cache is therefore never invalidated
+and Timezone::utcOffset() returns the stale value computed at startup.
+
+Fix by extending cacheTZ()/tzChanged() to also track the inode and
+mtime of /etc/localtime via stat(2).  When either changes the cache is
+considered stale and reloaded, preserving the performance benefit for
+the common case where neither TZ nor /etc/localtime changes between
+calls.
+
+Signed-off-by: Andrej Kozemcak <andrej.kozemcak@siemens.com>
+
+* fix(Foundation): DateTimeParser: %S consume optional fractional seconds
+
+Parsing ISO 8601 date strings that contain both fractional seconds and a
+timezone offset (e.g. "2013-10-07T08:23:19.120-04:00") with the format
+"%Y-%m-%dT%H:%M:%S%z" raises a SyntaxException:
+
+  - %S consumes the integer seconds but stops at '.', leaving
+    ".120-04:00" unconsumed.
+  - %z (parseTZD) is called next but sees '.' and returns without
+    consuming anything.
+  - The trailing-garbage check then raises SyntaxException.
+
+Extend the %S case to consume and discard an optional fractional-second
+suffix ('.' or ',' followed by one or more digits) immediately after
+parsing the integer seconds.  This mirrors the existing %s behaviour and
+allows %z to see the timezone designator directly, keeping the
+trailing-garbage check fully effective for truly invalid input.
+
+Fix suggested by matejk.
+
+Signed-off-by: Andrej Kozemcak <andrej.kozemcak@siemens.com>
+
+* test(DateTimeParserTest): add ISO8601 fractional seconds parser test
+
+Add testISO8601FracSeconds to verify that DateTimeParser correctly
+handles fractional-second suffixes (dot and comma separated) in
+ISO8601_FORMAT strings, and rejects malformed input such as a
+bare decimal point with no digits.
+
+---------
+
+Upstream-Status: Backport [1.15.3, https://github.com/pocoproject/poco/commit/b8d2b50774b25a470c5a30fc91bae7cd47c251fa]
+
+Signed-off-by: Andrej Kozemcak <andrej.kozemcak@siemens.com>
+Co-authored-by: Andrej Kozemcak <andrej.kozemcak@siemens.com>
+---
+ Foundation/include/Poco/DateTimeParser.h      |  6 ++++
+ Foundation/src/DateTimeParser.cpp             | 12 +++++++
+ Foundation/src/Timezone_UNIX.cpp              | 36 ++++++++++++++++++-
+ .../testsuite/src/DateTimeParserTest.cpp      | 32 +++++++++++++++++
+ Foundation/testsuite/src/DateTimeParserTest.h |  1 +
+ 5 files changed, 86 insertions(+), 1 deletion(-)
+
+diff --git a/Foundation/include/Poco/DateTimeParser.h b/Foundation/include/Poco/DateTimeParser.h
+index 2d1882d83..e82a934c9 100644
+--- a/Foundation/include/Poco/DateTimeParser.h
++++ b/Foundation/include/Poco/DateTimeParser.h
+@@ -63,6 +63,12 @@ public:
+ 		/// Throws a SyntaxException if the string cannot be successfully parsed.
+ 		/// Please see DateTimeFormatter::format() for a description of the format string.
+ 		/// Class DateTimeFormat defines format strings for various standard date/time formats.
++		///
++		/// Note: The %S specifier parses whole seconds and then silently discards any
++		/// fractional-second suffix of the form '.DDD' or ',DDD' (including a bare decimal
++		/// point that is immediately followed by a non-digit is treated as a parse error).
++		/// Callers that need the fractional digits captured must use %s (millis+micros),
++		/// %i (milliseconds only), %c (centiseconds), or %F (six-digit fractional seconds).
+ 
+ 	static DateTime parse(const std::string& fmt, const std::string& str, int& timeZoneDifferential);
+ 		/// Parses a date and time in the given format from the given string.
+diff --git a/Foundation/src/DateTimeParser.cpp b/Foundation/src/DateTimeParser.cpp
+index 08b3494ac..c2fe3dfaa 100644
+--- a/Foundation/src/DateTimeParser.cpp
++++ b/Foundation/src/DateTimeParser.cpp
+@@ -243,6 +243,18 @@ void DateTimeParser::parse(const std::string& fmt, const std::string& dtStr, Dat
+ 				case 'S':
+ 					it = skipNonDigits(it, end);
+ 					second = parseNumberN(dtStr, it, end, 2);
++					// Consume optional fractional seconds ('.NNN' or ',NNN') so that a
++					// subsequent %z specifier can reach the timezone designator.
++					// A decimal point/comma not followed by a digit is an error.
++					if (it != end && (*it == '.' || *it == ','))
++					{
++						++it;
++						if (it == end || !Ascii::isDigit(*it))
++						{
++							throw SyntaxException("Invalid DateTimeString: " + dtStr + ", missing fractional digits");
++						}
++						it = skipDigits(it, end);
++					}
+ 					break;
+ 				case 's':
+ 					it = skipNonDigits(it, end);
+diff --git a/Foundation/src/Timezone_UNIX.cpp b/Foundation/src/Timezone_UNIX.cpp
+index d1489e72f..3e0d29838 100644
+--- a/Foundation/src/Timezone_UNIX.cpp
++++ b/Foundation/src/Timezone_UNIX.cpp
+@@ -18,6 +18,7 @@
+ #include <ctime>
+ #include <cstdlib>
+ #include <string>
++#include <sys/stat.h>
+ 
+ 
+ namespace Poco {
+@@ -66,13 +67,44 @@ private:
+ 	{
+ 		const char* tz = std::getenv("TZ");
+ 		_cachedTZ = tz ? tz : "";
++		// /etc/localtime is the system-wide zone source (updated by timedatectl etc.).
++		// Stat'ing it lets us detect zone changes that don't touch the TZ env var; we
++		// don't read its contents — tzset()/libc still resolves the actual zone data.
++		cacheLocaltimeStat();
+ 	}
+ 
+ 	bool tzChanged() const
+ 	{
+ 		const char* tz = std::getenv("TZ");
+ 		std::string currentTZ = tz ? tz : "";
+-		return currentTZ != _cachedTZ;
++		if (currentTZ != _cachedTZ) return true;
++		return localtimeStatChanged();
++	}
++
++	void cacheLocaltimeStat()
++	{
++		struct stat st{};
++		if (::stat("/etc/localtime", &st) == 0)
++		{
++			_localtimeIno = st.st_ino;
++			_localtimeMtime = st.st_mtime;
++		}
++		else
++		{
++			_localtimeIno = 0;
++			_localtimeMtime = 0;
++		}
++	}
++
++	bool localtimeStatChanged() const
++	{
++		struct stat st{};
++		if (::stat("/etc/localtime", &st) == 0)
++		{
++			return st.st_ino != _localtimeIno || st.st_mtime != _localtimeMtime;
++		}
++		// /etc/localtime not accessible: treat as changed only if we had it before
++		return _localtimeIno != 0;
+ 	}
+ 
+ 	static int computeTimeZone()
+@@ -112,6 +144,8 @@ private:
+ 	std::mutex _mutex;
+ 	int _tzOffset;
+ 	std::string _cachedTZ;
++	ino_t _localtimeIno = 0;
++	time_t _localtimeMtime = 0;
+ };
+ 
+ 
+diff --git a/Foundation/testsuite/src/DateTimeParserTest.cpp b/Foundation/testsuite/src/DateTimeParserTest.cpp
+index 246a0d531..0742e1e02 100644
+--- a/Foundation/testsuite/src/DateTimeParserTest.cpp
++++ b/Foundation/testsuite/src/DateTimeParserTest.cpp
+@@ -638,6 +638,37 @@ void DateTimeParserTest::testCustom()
+ }
+ 
+ 
++void DateTimeParserTest::testISO8601FracSeconds()
++{
++	// ISO8601_FORMAT uses %S which silently discards a well-formed fractional-second
++	// suffix so that the trailing %z can still reach the timezone designator.
++	int tzd;
++
++	// Dot-separated fractional seconds with negative timezone offset
++	DateTime dt = DateTimeParser::parse(DateTimeFormat::ISO8601_FORMAT, "2013-10-07T08:23:19.120-04:00", tzd);
++	assertTrue (dt.year()   == 2013);
++	assertTrue (dt.month()  == 10);
++	assertTrue (dt.day()    == 7);
++	assertTrue (dt.hour()   == 8);
++	assertTrue (dt.minute() == 23);
++	assertTrue (dt.second() == 19);
++	assertTrue (tzd == -4*3600);
++
++	// Comma-separated fractional seconds (ISO 8601 allows ',' as the decimal sign)
++	dt = DateTimeParser::parse(DateTimeFormat::ISO8601_FORMAT, "2013-10-07T08:23:19,120-04:00", tzd);
++	assertTrue (dt.year()   == 2013);
++	assertTrue (dt.month()  == 10);
++	assertTrue (dt.day()    == 7);
++	assertTrue (dt.hour()   == 8);
++	assertTrue (dt.minute() == 23);
++	assertTrue (dt.second() == 19);
++	assertTrue (tzd == -4*3600);
++
++	// A bare decimal point not followed by any digit must be rejected
++	testBad(DateTimeFormat::ISO8601_FORMAT, "2013-10-07T08:23:19.-04:00", tzd);
++}
++
++
+ void DateTimeParserTest::testGuess()
+ {
+ 	int tzd;
+@@ -917,6 +948,7 @@ CppUnit::Test* DateTimeParserTest::suite()
+ 	CppUnit_addTest(pSuite, DateTimeParserTest, testASCTIME);
+ 	CppUnit_addTest(pSuite, DateTimeParserTest, testSORTABLE);
+ 	CppUnit_addTest(pSuite, DateTimeParserTest, testCustom);
++	CppUnit_addTest(pSuite, DateTimeParserTest, testISO8601FracSeconds);
+ 	CppUnit_addTest(pSuite, DateTimeParserTest, testGuess);
+ 	CppUnit_addTest(pSuite, DateTimeParserTest, testCleanup);
+ 	CppUnit_addTest(pSuite, DateTimeParserTest, testParseMonth);
+diff --git a/Foundation/testsuite/src/DateTimeParserTest.h b/Foundation/testsuite/src/DateTimeParserTest.h
+index f25416971..07f0b6924 100644
+--- a/Foundation/testsuite/src/DateTimeParserTest.h
++++ b/Foundation/testsuite/src/DateTimeParserTest.h
+@@ -34,6 +34,7 @@ public:
+ 	void testASCTIME();
+ 	void testSORTABLE();
+ 	void testCustom();
++	void testISO8601FracSeconds();
+ 	void testGuess();
+ 	void testCleanup();
+ 	void testParseMonth();
diff --git a/meta-oe/recipes-support/poco/poco_1.15.2.bb b/meta-oe/recipes-support/poco/poco_1.15.2.bb
index 5a873a1d85..bc3d3f9180 100644
--- a/meta-oe/recipes-support/poco/poco_1.15.2.bb
+++ b/meta-oe/recipes-support/poco/poco_1.15.2.bb
@@ -12,6 +12,7 @@ SRC_URI = "git://github.com/pocoproject/poco.git;branch=poco-${PV};protocol=http
            file://0001-cppignore.lnx-Ignore-PKCS12-and-testLaunch-test.patch \
            file://0002-DataTest-disable-testSQLChannel-test.patch \
            file://0003-quill-rdtsc-fallback-for-32-bit-powerpc.patch \
+           file://0004-Fix-DateTimeParser-trailing-timezone-designators-Tim.patch \
            file://run-ptest \
            "
 SRCREV = "afbb1ab68f29eec7079e2fdfa04b3efdbec6529d"

