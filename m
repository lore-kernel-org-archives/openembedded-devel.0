Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 968A7CD5BD1
	for <webhook@archiver.kernel.org>; Tue,  2 Jun 2026 00:58:42 +0000 (UTC)
Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com [209.85.161.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14683.1780361912919222918
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Jun 2026 17:58:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=YsgpUeDf;
 spf=pass (domain: gmail.com, ip: 209.85.161.44, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-oo1-f44.google.com with SMTP id 006d021491bc7-69d7aa0ac18so6864526eaf.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 01 Jun 2026 17:58:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780361912; cv=none;
        d=google.com; s=arc-20240605;
        b=NdExH4fRCNPk/S9ZuasB+XrCSklvnWpl6OhyZWFCXds4Vr1Z/wg71Z/ZNoSLK8KzSE
         FIIULKdqQVDQFNSCbVfQ9hxz8/v2gJxuN1I55QSEycZsOdq4vkW0t0WdVrymY+dbj/kl
         VTOqY69VaJ5717xoYUcjznmIGCp3I2+sXP6m1aOC3ggnlfO1a/GkCNaxPYfbzzWGpEiw
         ii5pzog3I9soqElV5zbxbTPCOwPNdY5SdaADmOmRC7ZMrbTJdWjsYM9B5bIkRAY2JPo7
         cR67+w/zmlmCAqFB7M/fS+6YtO5PHhPGMMmyBuR6hoMKvU5M++aK0uGmnsOjqEnNKFug
         O/Vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mgp0NZYqZ11U3gI6YJdZ+TSCApBwevKPPXDeuSTV5AM=;
        fh=/pKZqiJO6ZyW8l1F3cqMwIj3cJesZI6SFBUzs2mKL9s=;
        b=DqudNpQkGi8/k1AiY1UvzKeT1+iJvOD3eEUoD6lrcRYLGye0WFMI77jqOb5U9RXXkj
         DqNgFPMFSWBtzK5ouY4z6hpM8VPncpw8zxD1hSbJcIjP+54J72OX4rpk0KxsLd3WM2kU
         ak0YnjfCuyfJjfGtlNPslOTldyubX3Rg4IMfmy4BC/ygrqSFi9QuyuvlkZxFOYBQF5yq
         +oxsZbSXLLRwdvPzFrg3txpdewuOX6BtjA6+DhHiM1Ifri6r3z+4ooF8Je8eqjDRfqna
         GgDKk3wrZvqEx8LJ4ODFmFzEr+os+G6CJks3k48269x0PZmwepKiixEATyQfnpvGjtNa
         6ZOQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780361912; x=1780966712; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mgp0NZYqZ11U3gI6YJdZ+TSCApBwevKPPXDeuSTV5AM=;
        b=YsgpUeDfDRN8CIHu1x02fJPyb0y1/EW7t37K8dyTEaq5IgZtG9bmUbWMVdQewyZr9G
         etUWakpJM2ohNYVCOB5C1g/K7ZwDOKjd2W4N8xaekuWhZF5MZFuSZZ0cdkTfNDUbXqJZ
         vXDu2WKJ2uC+G962McXSm3qteD/+um4gxJhfuwPd4s+QPPpgWeCyEkI5CsiVrpeWn9GC
         XyMijMII408KuLRC4oTi/1NOWJx0yz/G9n2HxSZI/bEZ6EfqlnmYpGKJiWuMn47aP/4i
         qhouqjzDQEP/Wtyo4n8d+wFI61ziL0FnDj1RqhpK66kfu5YF7H/iSAJICfRkGoWkb5wt
         bkvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780361912; x=1780966712;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mgp0NZYqZ11U3gI6YJdZ+TSCApBwevKPPXDeuSTV5AM=;
        b=MDsgfQmsR4WoVyB0WdKDxZnAzh75ICtlDFVrj/G9Qhp4V2XmWk2+PGEy8FGUYrW/wG
         NsDWga2xp5gIOLZXJjwTYKyAdUuuNbJOidmBmG1aT619D5h0uowi+POqkjCW2hpkiH1l
         uhAOt6DsL/21xM5OmIFi1rYduoLfsml6Ocko4ha/EgJ1jMO3W08k83Kn/6htU0HRRwIk
         RQUB0VeHY2kuqRrmgf6ahHFdULALTQeZiQ8fENdxiwWzbd5hpT2KHG8LEjHEaAIafQbt
         n5zTvsTkd5KAujLW9ldNtRBAzj+oABJywcz+ePoeOAVmsl+7g1LwSN6CHoR58ZgVEU+d
         7FCw==
X-Gm-Message-State: AOJu0YyrMM2Cf/bEcSmZ5ad4x9zEj9BoNpmP6Bzh9zkuXCQiZzZvvs/u
	rw+Va/DF4cC6a4poai7MOztlQ2qsjgQQFfxaobrrLPb/eAMbH7Kz8z2y8Kn0HKCEmDUrOuCQZp/
	FpBIXqS2p7EEVI1Sw6BzSDUYlZa94GAnrcXIn
X-Gm-Gg: Acq92OEsmAarwycEaugOGNQGzKCscTGLJWdTuwSIt3/EdNtLvWWvdSup8/Bzt8Ajrq5
	FiGKbmCVAk9j4NA+l6Kfmc50I4BBUx46iY3vrAm+urd6uE0I99emWUiKX3DGOtss06JOBnYDK4S
	/90tAhUTIUj6HzNHXMyDY24mm9gooR14Czd39NWq67C40a20CRa/OL8iI/ZG/BSSGnCG3K2unba
	BnV+HuAfre7ubUITFa0FyjguJd1SwRw8pvOk3HLu0dsAH8dQs7NasNOr6ONARNsybTJh2apd1dg
	G7/exhY1EW/0MoCu7HY7
X-Received: by 2002:a05:6820:f03:b0:69d:e2fc:3631 with SMTP id
 006d021491bc7-69e102b23bemr7259251eaf.10.1780361911988; Mon, 01 Jun 2026
 17:58:31 -0700 (PDT)
MIME-Version: 1.0
References: <20260601120809.7245-1-andrej.kozemcak@siemens.com>
In-Reply-To: <20260601120809.7245-1-andrej.kozemcak@siemens.com>
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Tue, 2 Jun 2026 12:58:21 +1200
X-Gm-Features: AVHnY4ISt1s-6XEv7p_swZbAyOEL3WurTBKDmy6h9gQi4UBK2an-ucGYdgmpNfU
Message-ID: <CADySD0F1uOcuLaUX3vRE2JH2=qLXY78r3ULeNeeuok2kemzOXQ@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH v2] poco: fix timezone and data time parser issue
To: andrej.kozemcak@siemens.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 02 Jun 2026 00:58:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127315

For the master branch, IMO we should bump to v1.15.3[1] instead of
backporting the patch.

[1] https://github.com/pocoproject/poco/releases/tag/poco-1.15.3-release

On Tue, Jun 2, 2026 at 12:08=E2=80=AFAM Andrej Kozemcak via
lists.openembedded.org
<andrej.kozemcak=3Dsiemens.com@lists.openembedded.org> wrote:
>
> Patch contains tree patches which was merge to poco at once
> and fix "time" issues
>
> 1 - fix(Foundation): Timezone: invalidate utcOffset cache when /etc/local=
time changes
>
> Poco commit 1850dc16aabf5980a490bb1b66086d6695abb823 introduced a
> TZInfo cache for the UTC offset to avoid repeated tzset() syscalls.
> The cache is invalidated only when the TZ environment variable changes.
> However, the TZ variable is process-local: if a different process (e.g.
> a timezone configuration daemon or an init script) changes the system
> timezone by updating /etc/localtime, the running process is not notified
> and its TZ environment variable remains unchanged.
>
> On systems that switch timezone by updating /etc/localtime (a symlink)
> without touching the TZ env var, the cache is therefore never invalidated
> and Timezone::utcOffset() returns the stale value computed at startup.
>
> Fix by extending cacheTZ()/tzChanged() to also track the inode and
> mtime of /etc/localtime via stat(2).  When either changes the cache is
> considered stale and reloaded, preserving the performance benefit for
> the common case where neither TZ nor /etc/localtime changes between
> calls.
>
> 2 - fix(Foundation): DateTimeParser: %S consume optional fractional secon=
ds
>
> Parsing ISO 8601 date strings that contain both fractional seconds and a
> timezone offset (e.g. "2013-10-07T08:23:19.120-04:00") with the format
> "%Y-%m-%dT%H:%M:%S%z" raises a SyntaxException:
>
>   - %S consumes the integer seconds but stops at '.', leaving
>     ".120-04:00" unconsumed.
>   - %z (parseTZD) is called next but sees '.' and returns without
>     consuming anything.
>   - The trailing-garbage check then raises SyntaxException.
>
> Extend the %S case to consume and discard an optional fractional-second
> suffix ('.' or ',' followed by one or more digits) immediately after
> parsing the integer seconds.  This mirrors the existing %s behaviour and
> allows %z to see the timezone designator directly, keeping the
> trailing-garbage check fully effective for truly invalid input.
>
> 3 - test(DateTimeParserTest): add ISO8601 fractional seconds parser test
>
> Add testISO8601FracSeconds to verify that DateTimeParser correctly
> handles fractional-second suffixes (dot and comma separated) in
> ISO8601_FORMAT strings, and rejects malformed input such as a
> bare decimal point with no digits.
>
> Signed-off-by: Andrej Kozemcak <andrej.kozemcak@siemens.com>
> ---
>  ...er-trailing-timezone-designators-Tim.patch | 240 ++++++++++++++++++
>  meta-oe/recipes-support/poco/poco_1.15.2.bb   |   1 +
>  2 files changed, 241 insertions(+)
>  create mode 100644 meta-oe/recipes-support/poco/poco/0004-Fix-DateTimePa=
rser-trailing-timezone-designators-Tim.patch
>
> diff --git a/meta-oe/recipes-support/poco/poco/0004-Fix-DateTimeParser-tr=
ailing-timezone-designators-Tim.patch b/meta-oe/recipes-support/poco/poco/0=
004-Fix-DateTimeParser-trailing-timezone-designators-Tim.patch
> new file mode 100644
> index 0000000000..d2a8666b23
> --- /dev/null
> +++ b/meta-oe/recipes-support/poco/poco/0004-Fix-DateTimeParser-trailing-=
timezone-designators-Tim.patch
> @@ -0,0 +1,240 @@
> +From a767d36fed678e874536e33731be6dbcc5fdc5d0 Mon Sep 17 00:00:00 2001
> +From: kozemcak <akozemcak@gmail.com>
> +Date: Tue, 12 May 2026 16:13:12 +0200
> +Subject: [PATCH] Fix: DateTimeParser trailing timezone designators & Tim=
ezone
> + UTC offset cache invalidation (#5318)
> +
> +* fix(Foundation): Timezone: invalidate utcOffset cache when /etc/localt=
ime changes
> +
> +Poco commit 1850dc16aabf5980a490bb1b66086d6695abb823 introduced a
> +TZInfo cache for the UTC offset to avoid repeated tzset() syscalls.
> +The cache is invalidated only when the TZ environment variable changes.
> +However, the TZ variable is process-local: if a different process (e.g.
> +a timezone configuration daemon or an init script) changes the system
> +timezone by updating /etc/localtime, the running process is not notified
> +and its TZ environment variable remains unchanged.
> +
> +On systems that switch timezone by updating /etc/localtime (a symlink)
> +without touching the TZ env var, the cache is therefore never invalidate=
d
> +and Timezone::utcOffset() returns the stale value computed at startup.
> +
> +Fix by extending cacheTZ()/tzChanged() to also track the inode and
> +mtime of /etc/localtime via stat(2).  When either changes the cache is
> +considered stale and reloaded, preserving the performance benefit for
> +the common case where neither TZ nor /etc/localtime changes between
> +calls.
> +
> +Signed-off-by: Andrej Kozemcak <andrej.kozemcak@siemens.com>
> +
> +* fix(Foundation): DateTimeParser: %S consume optional fractional second=
s
> +
> +Parsing ISO 8601 date strings that contain both fractional seconds and a
> +timezone offset (e.g. "2013-10-07T08:23:19.120-04:00") with the format
> +"%Y-%m-%dT%H:%M:%S%z" raises a SyntaxException:
> +
> +  - %S consumes the integer seconds but stops at '.', leaving
> +    ".120-04:00" unconsumed.
> +  - %z (parseTZD) is called next but sees '.' and returns without
> +    consuming anything.
> +  - The trailing-garbage check then raises SyntaxException.
> +
> +Extend the %S case to consume and discard an optional fractional-second
> +suffix ('.' or ',' followed by one or more digits) immediately after
> +parsing the integer seconds.  This mirrors the existing %s behaviour and
> +allows %z to see the timezone designator directly, keeping the
> +trailing-garbage check fully effective for truly invalid input.
> +
> +Fix suggested by matejk.
> +
> +Signed-off-by: Andrej Kozemcak <andrej.kozemcak@siemens.com>
> +
> +* test(DateTimeParserTest): add ISO8601 fractional seconds parser test
> +
> +Add testISO8601FracSeconds to verify that DateTimeParser correctly
> +handles fractional-second suffixes (dot and comma separated) in
> +ISO8601_FORMAT strings, and rejects malformed input such as a
> +bare decimal point with no digits.
> +
> +---------
> +
> +Upstream-Status: Backport [1.15.3, https://github.com/pocoproject/poco/c=
ommit/b8d2b50774b25a470c5a30fc91bae7cd47c251fa]
> +
> +Signed-off-by: Andrej Kozemcak <andrej.kozemcak@siemens.com>
> +Co-authored-by: Andrej Kozemcak <andrej.kozemcak@siemens.com>
> +---
> + Foundation/include/Poco/DateTimeParser.h      |  6 ++++
> + Foundation/src/DateTimeParser.cpp             | 12 +++++++
> + Foundation/src/Timezone_UNIX.cpp              | 36 ++++++++++++++++++-
> + .../testsuite/src/DateTimeParserTest.cpp      | 32 +++++++++++++++++
> + Foundation/testsuite/src/DateTimeParserTest.h |  1 +
> + 5 files changed, 86 insertions(+), 1 deletion(-)
> +
> +diff --git a/Foundation/include/Poco/DateTimeParser.h b/Foundation/inclu=
de/Poco/DateTimeParser.h
> +index 2d1882d83..e82a934c9 100644
> +--- a/Foundation/include/Poco/DateTimeParser.h
> ++++ b/Foundation/include/Poco/DateTimeParser.h
> +@@ -63,6 +63,12 @@ public:
> +               /// Throws a SyntaxException if the string cannot be succ=
essfully parsed.
> +               /// Please see DateTimeFormatter::format() for a descript=
ion of the format string.
> +               /// Class DateTimeFormat defines format strings for vario=
us standard date/time formats.
> ++              ///
> ++              /// Note: The %S specifier parses whole seconds and then =
silently discards any
> ++              /// fractional-second suffix of the form '.DDD' or ',DDD'=
 (including a bare decimal
> ++              /// point that is immediately followed by a non-digit is =
treated as a parse error).
> ++              /// Callers that need the fractional digits captured must=
 use %s (millis+micros),
> ++              /// %i (milliseconds only), %c (centiseconds), or %F (six=
-digit fractional seconds).
> +
> +       static DateTime parse(const std::string& fmt, const std::string& =
str, int& timeZoneDifferential);
> +               /// Parses a date and time in the given format from the g=
iven string.
> +diff --git a/Foundation/src/DateTimeParser.cpp b/Foundation/src/DateTime=
Parser.cpp
> +index 08b3494ac..c2fe3dfaa 100644
> +--- a/Foundation/src/DateTimeParser.cpp
> ++++ b/Foundation/src/DateTimeParser.cpp
> +@@ -243,6 +243,18 @@ void DateTimeParser::parse(const std::string& fmt, =
const std::string& dtStr, Dat
> +                               case 'S':
> +                                       it =3D skipNonDigits(it, end);
> +                                       second =3D parseNumberN(dtStr, it=
, end, 2);
> ++                                      // Consume optional fractional se=
conds ('.NNN' or ',NNN') so that a
> ++                                      // subsequent %z specifier can re=
ach the timezone designator.
> ++                                      // A decimal point/comma not foll=
owed by a digit is an error.
> ++                                      if (it !=3D end && (*it =3D=3D '.=
' || *it =3D=3D ','))
> ++                                      {
> ++                                              ++it;
> ++                                              if (it =3D=3D end || !Asc=
ii::isDigit(*it))
> ++                                              {
> ++                                                      throw SyntaxExcep=
tion("Invalid DateTimeString: " + dtStr + ", missing fractional digits");
> ++                                              }
> ++                                              it =3D skipDigits(it, end=
);
> ++                                      }
> +                                       break;
> +                               case 's':
> +                                       it =3D skipNonDigits(it, end);
> +diff --git a/Foundation/src/Timezone_UNIX.cpp b/Foundation/src/Timezone_=
UNIX.cpp
> +index d1489e72f..3e0d29838 100644
> +--- a/Foundation/src/Timezone_UNIX.cpp
> ++++ b/Foundation/src/Timezone_UNIX.cpp
> +@@ -18,6 +18,7 @@
> + #include <ctime>
> + #include <cstdlib>
> + #include <string>
> ++#include <sys/stat.h>
> +
> +
> + namespace Poco {
> +@@ -66,13 +67,44 @@ private:
> +       {
> +               const char* tz =3D std::getenv("TZ");
> +               _cachedTZ =3D tz ? tz : "";
> ++              // /etc/localtime is the system-wide zone source (updated=
 by timedatectl etc.).
> ++              // Stat'ing it lets us detect zone changes that don't tou=
ch the TZ env var; we
> ++              // don't read its contents =E2=80=94 tzset()/libc still r=
esolves the actual zone data.
> ++              cacheLocaltimeStat();
> +       }
> +
> +       bool tzChanged() const
> +       {
> +               const char* tz =3D std::getenv("TZ");
> +               std::string currentTZ =3D tz ? tz : "";
> +-              return currentTZ !=3D _cachedTZ;
> ++              if (currentTZ !=3D _cachedTZ) return true;
> ++              return localtimeStatChanged();
> ++      }
> ++
> ++      void cacheLocaltimeStat()
> ++      {
> ++              struct stat st{};
> ++              if (::stat("/etc/localtime", &st) =3D=3D 0)
> ++              {
> ++                      _localtimeIno =3D st.st_ino;
> ++                      _localtimeMtime =3D st.st_mtime;
> ++              }
> ++              else
> ++              {
> ++                      _localtimeIno =3D 0;
> ++                      _localtimeMtime =3D 0;
> ++              }
> ++      }
> ++
> ++      bool localtimeStatChanged() const
> ++      {
> ++              struct stat st{};
> ++              if (::stat("/etc/localtime", &st) =3D=3D 0)
> ++              {
> ++                      return st.st_ino !=3D _localtimeIno || st.st_mtim=
e !=3D _localtimeMtime;
> ++              }
> ++              // /etc/localtime not accessible: treat as changed only i=
f we had it before
> ++              return _localtimeIno !=3D 0;
> +       }
> +
> +       static int computeTimeZone()
> +@@ -112,6 +144,8 @@ private:
> +       std::mutex _mutex;
> +       int _tzOffset;
> +       std::string _cachedTZ;
> ++      ino_t _localtimeIno =3D 0;
> ++      time_t _localtimeMtime =3D 0;
> + };
> +
> +
> +diff --git a/Foundation/testsuite/src/DateTimeParserTest.cpp b/Foundatio=
n/testsuite/src/DateTimeParserTest.cpp
> +index 246a0d531..0742e1e02 100644
> +--- a/Foundation/testsuite/src/DateTimeParserTest.cpp
> ++++ b/Foundation/testsuite/src/DateTimeParserTest.cpp
> +@@ -638,6 +638,37 @@ void DateTimeParserTest::testCustom()
> + }
> +
> +
> ++void DateTimeParserTest::testISO8601FracSeconds()
> ++{
> ++      // ISO8601_FORMAT uses %S which silently discards a well-formed f=
ractional-second
> ++      // suffix so that the trailing %z can still reach the timezone de=
signator.
> ++      int tzd;
> ++
> ++      // Dot-separated fractional seconds with negative timezone offset
> ++      DateTime dt =3D DateTimeParser::parse(DateTimeFormat::ISO8601_FOR=
MAT, "2013-10-07T08:23:19.120-04:00", tzd);
> ++      assertTrue (dt.year()   =3D=3D 2013);
> ++      assertTrue (dt.month()  =3D=3D 10);
> ++      assertTrue (dt.day()    =3D=3D 7);
> ++      assertTrue (dt.hour()   =3D=3D 8);
> ++      assertTrue (dt.minute() =3D=3D 23);
> ++      assertTrue (dt.second() =3D=3D 19);
> ++      assertTrue (tzd =3D=3D -4*3600);
> ++
> ++      // Comma-separated fractional seconds (ISO 8601 allows ',' as the=
 decimal sign)
> ++      dt =3D DateTimeParser::parse(DateTimeFormat::ISO8601_FORMAT, "201=
3-10-07T08:23:19,120-04:00", tzd);
> ++      assertTrue (dt.year()   =3D=3D 2013);
> ++      assertTrue (dt.month()  =3D=3D 10);
> ++      assertTrue (dt.day()    =3D=3D 7);
> ++      assertTrue (dt.hour()   =3D=3D 8);
> ++      assertTrue (dt.minute() =3D=3D 23);
> ++      assertTrue (dt.second() =3D=3D 19);
> ++      assertTrue (tzd =3D=3D -4*3600);
> ++
> ++      // A bare decimal point not followed by any digit must be rejecte=
d
> ++      testBad(DateTimeFormat::ISO8601_FORMAT, "2013-10-07T08:23:19.-04:=
00", tzd);
> ++}
> ++
> ++
> + void DateTimeParserTest::testGuess()
> + {
> +       int tzd;
> +@@ -917,6 +948,7 @@ CppUnit::Test* DateTimeParserTest::suite()
> +       CppUnit_addTest(pSuite, DateTimeParserTest, testASCTIME);
> +       CppUnit_addTest(pSuite, DateTimeParserTest, testSORTABLE);
> +       CppUnit_addTest(pSuite, DateTimeParserTest, testCustom);
> ++      CppUnit_addTest(pSuite, DateTimeParserTest, testISO8601FracSecond=
s);
> +       CppUnit_addTest(pSuite, DateTimeParserTest, testGuess);
> +       CppUnit_addTest(pSuite, DateTimeParserTest, testCleanup);
> +       CppUnit_addTest(pSuite, DateTimeParserTest, testParseMonth);
> +diff --git a/Foundation/testsuite/src/DateTimeParserTest.h b/Foundation/=
testsuite/src/DateTimeParserTest.h
> +index f25416971..07f0b6924 100644
> +--- a/Foundation/testsuite/src/DateTimeParserTest.h
> ++++ b/Foundation/testsuite/src/DateTimeParserTest.h
> +@@ -34,6 +34,7 @@ public:
> +       void testASCTIME();
> +       void testSORTABLE();
> +       void testCustom();
> ++      void testISO8601FracSeconds();
> +       void testGuess();
> +       void testCleanup();
> +       void testParseMonth();
> diff --git a/meta-oe/recipes-support/poco/poco_1.15.2.bb b/meta-oe/recipe=
s-support/poco/poco_1.15.2.bb
> index 5a873a1d85..bc3d3f9180 100644
> --- a/meta-oe/recipes-support/poco/poco_1.15.2.bb
> +++ b/meta-oe/recipes-support/poco/poco_1.15.2.bb
> @@ -12,6 +12,7 @@ SRC_URI =3D "git://github.com/pocoproject/poco.git;bran=
ch=3Dpoco-${PV};protocol=3Dhttp
>             file://0001-cppignore.lnx-Ignore-PKCS12-and-testLaunch-test.p=
atch \
>             file://0002-DataTest-disable-testSQLChannel-test.patch \
>             file://0003-quill-rdtsc-fallback-for-32-bit-powerpc.patch \
> +           file://0004-Fix-DateTimeParser-trailing-timezone-designators-=
Tim.patch \
>             file://run-ptest \
>             "
>  SRCREV =3D "afbb1ab68f29eec7079e2fdfa04b3efdbec6529d"
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#127314): https://lists.openembedded.org/g/openembedde=
d-devel/message/127314
> Mute This Topic: https://lists.openembedded.org/mt/119589240/3619737
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [a=
nkur.tyagi85@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

