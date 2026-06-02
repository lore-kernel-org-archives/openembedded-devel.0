Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE153CD6E55
	for <webhook@archiver.kernel.org>; Tue,  2 Jun 2026 03:27:04 +0000 (UTC)
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16736.1780370823758882170
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Jun 2026 20:27:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=eShYPGyI;
 spf=pass (domain: gmail.com, ip: 209.85.210.48, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-7e6b5737bb2so1958642a34.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 01 Jun 2026 20:27:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780370823; cv=none;
        d=google.com; s=arc-20240605;
        b=eJ0A8uRIrqYTnODAgi0R7SAAdD3VBwPTJ+oJjuJDCJ+1df3OrH89s/jBJNixi5g7PL
         Fad5TtIj7UB15i+Y0FNNslPk2292LEBYg9M8E/jFacI0lM8UFpou2n7pjSK8pKo6UVn/
         7ntK4ZrIHqHNKqfqxicYU2fiwC0M+eZoNuSEjMwQLckfkZ1Ss6oqNzbv7KN5UTE4FGtB
         NL2xD83HDQFqfTFOfn1+mhb9eJI0+hj+SEX98RPOCAmL7vgbpnJpDzT/4Vh5lWqQkdVx
         YpVymEolQcMtqN32WzNrr+w9eV2URZJRQ7WMMJuoOOBxEZ9t4RRpNGWgZs6QCvzn+uj6
         x7HA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ucccMtKcDeOBFIX8VL+gwLY6SNuPWeGPvc7MshxhwAc=;
        fh=/pKZqiJO6ZyW8l1F3cqMwIj3cJesZI6SFBUzs2mKL9s=;
        b=WxeObwXVHwDZY0SzLNyEy0r6BZuD/zLtVBH6Xv3+jPqdTw020JIlkCWPW4ebovqbTQ
         z7ExqZc7Cjj9pVN1dDRyFqsLC3kMEuCwcuJfnOqpTBlKeNLxQqkQCEV0ihzZtUzNiPhz
         W6qlurR0J7XRBgkymneuh3UZRbxDUbAAfN08CiVWv0MGy0jGU245DhheFI/K71PsZeJR
         u9RtTJytaTn38/Ynswev3oGiXw8oIy0jFPNrlOsbhW/bpOkeF7OqMAiAOYEHgaihz+iS
         lP21DPlZefW7RmoPpkn2GIPhemwR2BDLtRRNk79ewIWyMiui+2eW2F47B8R7F4UO2ZZX
         eyzw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780370823; x=1780975623; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ucccMtKcDeOBFIX8VL+gwLY6SNuPWeGPvc7MshxhwAc=;
        b=eShYPGyIewr8VFohQdrFJZagKAoqQ04S/A7hk/YwhSSHcXohR56hfResrAx8vD3Eaj
         8Kg5N0gLqig/3WQrQLZxemVNAapROtRwE0yUePFhJsniUT8QAf1bHccJsnaWvJLlUUe5
         KbonwOqxPyDBZCZvubXE58J/YJtGs603kdmAveZNmv+DJV8Yi8l21okjSdER4+5Pcczk
         N4Mr+l6MAmklO3HCImjNcERgOyVwJ26Ufu0FcN+X0iidR9JoMHjfghfN06cfOZ9/jxEf
         daZToBuJn5wf7WgUprF+tdnSD3MqAzY0XIl4pbSgTUwTv46/WWxIdxgzby/pZS00RDv7
         9/Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780370823; x=1780975623;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ucccMtKcDeOBFIX8VL+gwLY6SNuPWeGPvc7MshxhwAc=;
        b=Uu5bgrwVKK1R9Rjqgrc3wBD2/HDSxixgAcsDV1u8Pi9fhc+mziB9inROtxIS4f7Jpy
         NbA4HzGpj2PUxAGF+7n9DSvAl8uPRMPHOqq/OHASDwfcTYS0XVvtN5G563nV0CvCjHIC
         hNA5JvSl2dJKjnXRJDthAJ9yOibzDrSEhWYlNzqmMceqkYFY0sQLqcMvZCzd+8UR8Ilu
         nlR1zlt1bMppP+w2jd2x2B4ImZw5eGBBimiySw9tTlfBpdjCJol0I22T+gCpMRfaNdod
         XC7RUC4J0wF+JVVucMiNeJbETaqNcMZh0ewYKiofFVRs5sdQMh/oIPBnmnJBR8114fuv
         XIgg==
X-Gm-Message-State: AOJu0YwecPHeqMPlrbQs7Y78cs/eh1pnVjzzWzVMB7WiKziDl57obi4I
	7Plm/NCtwc8UBfKxVWIQXVR9tAhk+iTVYfwMlJf1AHaU/pkn8N7fb2XuvtCeZHGkSQRwqFtFEEX
	0n5SJGbSkEKZ4f7jsxIb351PzTIfCZTN3nknZ
X-Gm-Gg: Acq92OEBwNI8TcKCMoAkQ98xRWcEuq1GrCpBWEgi8kpQlEHDglI7pshiVHq8bJOiCaW
	KdnA3C4+q6dA/6UOuzZhIaSn3GJ5zlZSPChWvoBhH5TWMGYWZkdkPfOqkw2aXzbMMQd0OeDVdlG
	k6lbRQVwDKPaJpcUEebZaOC6X9DaqMAMjP3E6jwtjUb0n7yV8tIFAmifU1T0bpcCcL1kSk4eMxZ
	GOKV8hjEAg8Bs43OVGozPTcWYdwiCxwFzmugVsEFJL8nNXsRM2Ljy+xo+yWJHLPv7CZtCTSv+1G
	sk3gf7hEfE+9Zf5+9oIn
X-Received: by 2002:a05:6820:5716:10b0:69e:264b:ccd9 with SMTP id
 006d021491bc7-69e264bd199mr2822139eaf.39.1780370822588; Mon, 01 Jun 2026
 20:27:02 -0700 (PDT)
MIME-Version: 1.0
References: <20260601120809.7245-1-andrej.kozemcak@siemens.com> <CADySD0F1uOcuLaUX3vRE2JH2=qLXY78r3ULeNeeuok2kemzOXQ@mail.gmail.com>
In-Reply-To: <CADySD0F1uOcuLaUX3vRE2JH2=qLXY78r3ULeNeeuok2kemzOXQ@mail.gmail.com>
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Tue, 2 Jun 2026 15:26:51 +1200
X-Gm-Features: AVHnY4K8M5FcTbIqKN2-3SOMbBByvrM1dMm5NtZ2-nXf1Nvqec3s7UgMqJiyjgE
Message-ID: <CADySD0FacjohFQvCzRZUbUc11RjEMVC6ifeOLG+5Dc1TwX+VpA@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH v2] poco: fix timezone and data time parser issue
To: andrej.kozemcak@siemens.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 02 Jun 2026 03:27:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127318

nvm, there is already a pending patch[1] to bump the version

[1] https://lists.openembedded.org/g/openembedded-devel/message/127226

On Tue, Jun 2, 2026 at 12:58=E2=80=AFPM Ankur Tyagi <ankur.tyagi85@gmail.co=
m> wrote:
>
> For the master branch, IMO we should bump to v1.15.3[1] instead of
> backporting the patch.
>
> [1] https://github.com/pocoproject/poco/releases/tag/poco-1.15.3-release
>
> On Tue, Jun 2, 2026 at 12:08=E2=80=AFAM Andrej Kozemcak via
> lists.openembedded.org
> <andrej.kozemcak=3Dsiemens.com@lists.openembedded.org> wrote:
> >
> > Patch contains tree patches which was merge to poco at once
> > and fix "time" issues
> >
> > 1 - fix(Foundation): Timezone: invalidate utcOffset cache when /etc/loc=
altime changes
> >
> > Poco commit 1850dc16aabf5980a490bb1b66086d6695abb823 introduced a
> > TZInfo cache for the UTC offset to avoid repeated tzset() syscalls.
> > The cache is invalidated only when the TZ environment variable changes.
> > However, the TZ variable is process-local: if a different process (e.g.
> > a timezone configuration daemon or an init script) changes the system
> > timezone by updating /etc/localtime, the running process is not notifie=
d
> > and its TZ environment variable remains unchanged.
> >
> > On systems that switch timezone by updating /etc/localtime (a symlink)
> > without touching the TZ env var, the cache is therefore never invalidat=
ed
> > and Timezone::utcOffset() returns the stale value computed at startup.
> >
> > Fix by extending cacheTZ()/tzChanged() to also track the inode and
> > mtime of /etc/localtime via stat(2).  When either changes the cache is
> > considered stale and reloaded, preserving the performance benefit for
> > the common case where neither TZ nor /etc/localtime changes between
> > calls.
> >
> > 2 - fix(Foundation): DateTimeParser: %S consume optional fractional sec=
onds
> >
> > Parsing ISO 8601 date strings that contain both fractional seconds and =
a
> > timezone offset (e.g. "2013-10-07T08:23:19.120-04:00") with the format
> > "%Y-%m-%dT%H:%M:%S%z" raises a SyntaxException:
> >
> >   - %S consumes the integer seconds but stops at '.', leaving
> >     ".120-04:00" unconsumed.
> >   - %z (parseTZD) is called next but sees '.' and returns without
> >     consuming anything.
> >   - The trailing-garbage check then raises SyntaxException.
> >
> > Extend the %S case to consume and discard an optional fractional-second
> > suffix ('.' or ',' followed by one or more digits) immediately after
> > parsing the integer seconds.  This mirrors the existing %s behaviour an=
d
> > allows %z to see the timezone designator directly, keeping the
> > trailing-garbage check fully effective for truly invalid input.
> >
> > 3 - test(DateTimeParserTest): add ISO8601 fractional seconds parser tes=
t
> >
> > Add testISO8601FracSeconds to verify that DateTimeParser correctly
> > handles fractional-second suffixes (dot and comma separated) in
> > ISO8601_FORMAT strings, and rejects malformed input such as a
> > bare decimal point with no digits.
> >
> > Signed-off-by: Andrej Kozemcak <andrej.kozemcak@siemens.com>
> > ---
> >  ...er-trailing-timezone-designators-Tim.patch | 240 ++++++++++++++++++
> >  meta-oe/recipes-support/poco/poco_1.15.2.bb   |   1 +
> >  2 files changed, 241 insertions(+)
> >  create mode 100644 meta-oe/recipes-support/poco/poco/0004-Fix-DateTime=
Parser-trailing-timezone-designators-Tim.patch
> >
> > diff --git a/meta-oe/recipes-support/poco/poco/0004-Fix-DateTimeParser-=
trailing-timezone-designators-Tim.patch b/meta-oe/recipes-support/poco/poco=
/0004-Fix-DateTimeParser-trailing-timezone-designators-Tim.patch
> > new file mode 100644
> > index 0000000000..d2a8666b23
> > --- /dev/null
> > +++ b/meta-oe/recipes-support/poco/poco/0004-Fix-DateTimeParser-trailin=
g-timezone-designators-Tim.patch
> > @@ -0,0 +1,240 @@
> > +From a767d36fed678e874536e33731be6dbcc5fdc5d0 Mon Sep 17 00:00:00 2001
> > +From: kozemcak <akozemcak@gmail.com>
> > +Date: Tue, 12 May 2026 16:13:12 +0200
> > +Subject: [PATCH] Fix: DateTimeParser trailing timezone designators & T=
imezone
> > + UTC offset cache invalidation (#5318)
> > +
> > +* fix(Foundation): Timezone: invalidate utcOffset cache when /etc/loca=
ltime changes
> > +
> > +Poco commit 1850dc16aabf5980a490bb1b66086d6695abb823 introduced a
> > +TZInfo cache for the UTC offset to avoid repeated tzset() syscalls.
> > +The cache is invalidated only when the TZ environment variable changes=
.
> > +However, the TZ variable is process-local: if a different process (e.g=
.
> > +a timezone configuration daemon or an init script) changes the system
> > +timezone by updating /etc/localtime, the running process is not notifi=
ed
> > +and its TZ environment variable remains unchanged.
> > +
> > +On systems that switch timezone by updating /etc/localtime (a symlink)
> > +without touching the TZ env var, the cache is therefore never invalida=
ted
> > +and Timezone::utcOffset() returns the stale value computed at startup.
> > +
> > +Fix by extending cacheTZ()/tzChanged() to also track the inode and
> > +mtime of /etc/localtime via stat(2).  When either changes the cache is
> > +considered stale and reloaded, preserving the performance benefit for
> > +the common case where neither TZ nor /etc/localtime changes between
> > +calls.
> > +
> > +Signed-off-by: Andrej Kozemcak <andrej.kozemcak@siemens.com>
> > +
> > +* fix(Foundation): DateTimeParser: %S consume optional fractional seco=
nds
> > +
> > +Parsing ISO 8601 date strings that contain both fractional seconds and=
 a
> > +timezone offset (e.g. "2013-10-07T08:23:19.120-04:00") with the format
> > +"%Y-%m-%dT%H:%M:%S%z" raises a SyntaxException:
> > +
> > +  - %S consumes the integer seconds but stops at '.', leaving
> > +    ".120-04:00" unconsumed.
> > +  - %z (parseTZD) is called next but sees '.' and returns without
> > +    consuming anything.
> > +  - The trailing-garbage check then raises SyntaxException.
> > +
> > +Extend the %S case to consume and discard an optional fractional-secon=
d
> > +suffix ('.' or ',' followed by one or more digits) immediately after
> > +parsing the integer seconds.  This mirrors the existing %s behaviour a=
nd
> > +allows %z to see the timezone designator directly, keeping the
> > +trailing-garbage check fully effective for truly invalid input.
> > +
> > +Fix suggested by matejk.
> > +
> > +Signed-off-by: Andrej Kozemcak <andrej.kozemcak@siemens.com>
> > +
> > +* test(DateTimeParserTest): add ISO8601 fractional seconds parser test
> > +
> > +Add testISO8601FracSeconds to verify that DateTimeParser correctly
> > +handles fractional-second suffixes (dot and comma separated) in
> > +ISO8601_FORMAT strings, and rejects malformed input such as a
> > +bare decimal point with no digits.
> > +
> > +---------
> > +
> > +Upstream-Status: Backport [1.15.3, https://github.com/pocoproject/poco=
/commit/b8d2b50774b25a470c5a30fc91bae7cd47c251fa]
> > +
> > +Signed-off-by: Andrej Kozemcak <andrej.kozemcak@siemens.com>
> > +Co-authored-by: Andrej Kozemcak <andrej.kozemcak@siemens.com>
> > +---
> > + Foundation/include/Poco/DateTimeParser.h      |  6 ++++
> > + Foundation/src/DateTimeParser.cpp             | 12 +++++++
> > + Foundation/src/Timezone_UNIX.cpp              | 36 ++++++++++++++++++=
-
> > + .../testsuite/src/DateTimeParserTest.cpp      | 32 +++++++++++++++++
> > + Foundation/testsuite/src/DateTimeParserTest.h |  1 +
> > + 5 files changed, 86 insertions(+), 1 deletion(-)
> > +
> > +diff --git a/Foundation/include/Poco/DateTimeParser.h b/Foundation/inc=
lude/Poco/DateTimeParser.h
> > +index 2d1882d83..e82a934c9 100644
> > +--- a/Foundation/include/Poco/DateTimeParser.h
> > ++++ b/Foundation/include/Poco/DateTimeParser.h
> > +@@ -63,6 +63,12 @@ public:
> > +               /// Throws a SyntaxException if the string cannot be su=
ccessfully parsed.
> > +               /// Please see DateTimeFormatter::format() for a descri=
ption of the format string.
> > +               /// Class DateTimeFormat defines format strings for var=
ious standard date/time formats.
> > ++              ///
> > ++              /// Note: The %S specifier parses whole seconds and the=
n silently discards any
> > ++              /// fractional-second suffix of the form '.DDD' or ',DD=
D' (including a bare decimal
> > ++              /// point that is immediately followed by a non-digit i=
s treated as a parse error).
> > ++              /// Callers that need the fractional digits captured mu=
st use %s (millis+micros),
> > ++              /// %i (milliseconds only), %c (centiseconds), or %F (s=
ix-digit fractional seconds).
> > +
> > +       static DateTime parse(const std::string& fmt, const std::string=
& str, int& timeZoneDifferential);
> > +               /// Parses a date and time in the given format from the=
 given string.
> > +diff --git a/Foundation/src/DateTimeParser.cpp b/Foundation/src/DateTi=
meParser.cpp
> > +index 08b3494ac..c2fe3dfaa 100644
> > +--- a/Foundation/src/DateTimeParser.cpp
> > ++++ b/Foundation/src/DateTimeParser.cpp
> > +@@ -243,6 +243,18 @@ void DateTimeParser::parse(const std::string& fmt=
, const std::string& dtStr, Dat
> > +                               case 'S':
> > +                                       it =3D skipNonDigits(it, end);
> > +                                       second =3D parseNumberN(dtStr, =
it, end, 2);
> > ++                                      // Consume optional fractional =
seconds ('.NNN' or ',NNN') so that a
> > ++                                      // subsequent %z specifier can =
reach the timezone designator.
> > ++                                      // A decimal point/comma not fo=
llowed by a digit is an error.
> > ++                                      if (it !=3D end && (*it =3D=3D =
'.' || *it =3D=3D ','))
> > ++                                      {
> > ++                                              ++it;
> > ++                                              if (it =3D=3D end || !A=
scii::isDigit(*it))
> > ++                                              {
> > ++                                                      throw SyntaxExc=
eption("Invalid DateTimeString: " + dtStr + ", missing fractional digits");
> > ++                                              }
> > ++                                              it =3D skipDigits(it, e=
nd);
> > ++                                      }
> > +                                       break;
> > +                               case 's':
> > +                                       it =3D skipNonDigits(it, end);
> > +diff --git a/Foundation/src/Timezone_UNIX.cpp b/Foundation/src/Timezon=
e_UNIX.cpp
> > +index d1489e72f..3e0d29838 100644
> > +--- a/Foundation/src/Timezone_UNIX.cpp
> > ++++ b/Foundation/src/Timezone_UNIX.cpp
> > +@@ -18,6 +18,7 @@
> > + #include <ctime>
> > + #include <cstdlib>
> > + #include <string>
> > ++#include <sys/stat.h>
> > +
> > +
> > + namespace Poco {
> > +@@ -66,13 +67,44 @@ private:
> > +       {
> > +               const char* tz =3D std::getenv("TZ");
> > +               _cachedTZ =3D tz ? tz : "";
> > ++              // /etc/localtime is the system-wide zone source (updat=
ed by timedatectl etc.).
> > ++              // Stat'ing it lets us detect zone changes that don't t=
ouch the TZ env var; we
> > ++              // don't read its contents =E2=80=94 tzset()/libc still=
 resolves the actual zone data.
> > ++              cacheLocaltimeStat();
> > +       }
> > +
> > +       bool tzChanged() const
> > +       {
> > +               const char* tz =3D std::getenv("TZ");
> > +               std::string currentTZ =3D tz ? tz : "";
> > +-              return currentTZ !=3D _cachedTZ;
> > ++              if (currentTZ !=3D _cachedTZ) return true;
> > ++              return localtimeStatChanged();
> > ++      }
> > ++
> > ++      void cacheLocaltimeStat()
> > ++      {
> > ++              struct stat st{};
> > ++              if (::stat("/etc/localtime", &st) =3D=3D 0)
> > ++              {
> > ++                      _localtimeIno =3D st.st_ino;
> > ++                      _localtimeMtime =3D st.st_mtime;
> > ++              }
> > ++              else
> > ++              {
> > ++                      _localtimeIno =3D 0;
> > ++                      _localtimeMtime =3D 0;
> > ++              }
> > ++      }
> > ++
> > ++      bool localtimeStatChanged() const
> > ++      {
> > ++              struct stat st{};
> > ++              if (::stat("/etc/localtime", &st) =3D=3D 0)
> > ++              {
> > ++                      return st.st_ino !=3D _localtimeIno || st.st_mt=
ime !=3D _localtimeMtime;
> > ++              }
> > ++              // /etc/localtime not accessible: treat as changed only=
 if we had it before
> > ++              return _localtimeIno !=3D 0;
> > +       }
> > +
> > +       static int computeTimeZone()
> > +@@ -112,6 +144,8 @@ private:
> > +       std::mutex _mutex;
> > +       int _tzOffset;
> > +       std::string _cachedTZ;
> > ++      ino_t _localtimeIno =3D 0;
> > ++      time_t _localtimeMtime =3D 0;
> > + };
> > +
> > +
> > +diff --git a/Foundation/testsuite/src/DateTimeParserTest.cpp b/Foundat=
ion/testsuite/src/DateTimeParserTest.cpp
> > +index 246a0d531..0742e1e02 100644
> > +--- a/Foundation/testsuite/src/DateTimeParserTest.cpp
> > ++++ b/Foundation/testsuite/src/DateTimeParserTest.cpp
> > +@@ -638,6 +638,37 @@ void DateTimeParserTest::testCustom()
> > + }
> > +
> > +
> > ++void DateTimeParserTest::testISO8601FracSeconds()
> > ++{
> > ++      // ISO8601_FORMAT uses %S which silently discards a well-formed=
 fractional-second
> > ++      // suffix so that the trailing %z can still reach the timezone =
designator.
> > ++      int tzd;
> > ++
> > ++      // Dot-separated fractional seconds with negative timezone offs=
et
> > ++      DateTime dt =3D DateTimeParser::parse(DateTimeFormat::ISO8601_F=
ORMAT, "2013-10-07T08:23:19.120-04:00", tzd);
> > ++      assertTrue (dt.year()   =3D=3D 2013);
> > ++      assertTrue (dt.month()  =3D=3D 10);
> > ++      assertTrue (dt.day()    =3D=3D 7);
> > ++      assertTrue (dt.hour()   =3D=3D 8);
> > ++      assertTrue (dt.minute() =3D=3D 23);
> > ++      assertTrue (dt.second() =3D=3D 19);
> > ++      assertTrue (tzd =3D=3D -4*3600);
> > ++
> > ++      // Comma-separated fractional seconds (ISO 8601 allows ',' as t=
he decimal sign)
> > ++      dt =3D DateTimeParser::parse(DateTimeFormat::ISO8601_FORMAT, "2=
013-10-07T08:23:19,120-04:00", tzd);
> > ++      assertTrue (dt.year()   =3D=3D 2013);
> > ++      assertTrue (dt.month()  =3D=3D 10);
> > ++      assertTrue (dt.day()    =3D=3D 7);
> > ++      assertTrue (dt.hour()   =3D=3D 8);
> > ++      assertTrue (dt.minute() =3D=3D 23);
> > ++      assertTrue (dt.second() =3D=3D 19);
> > ++      assertTrue (tzd =3D=3D -4*3600);
> > ++
> > ++      // A bare decimal point not followed by any digit must be rejec=
ted
> > ++      testBad(DateTimeFormat::ISO8601_FORMAT, "2013-10-07T08:23:19.-0=
4:00", tzd);
> > ++}
> > ++
> > ++
> > + void DateTimeParserTest::testGuess()
> > + {
> > +       int tzd;
> > +@@ -917,6 +948,7 @@ CppUnit::Test* DateTimeParserTest::suite()
> > +       CppUnit_addTest(pSuite, DateTimeParserTest, testASCTIME);
> > +       CppUnit_addTest(pSuite, DateTimeParserTest, testSORTABLE);
> > +       CppUnit_addTest(pSuite, DateTimeParserTest, testCustom);
> > ++      CppUnit_addTest(pSuite, DateTimeParserTest, testISO8601FracSeco=
nds);
> > +       CppUnit_addTest(pSuite, DateTimeParserTest, testGuess);
> > +       CppUnit_addTest(pSuite, DateTimeParserTest, testCleanup);
> > +       CppUnit_addTest(pSuite, DateTimeParserTest, testParseMonth);
> > +diff --git a/Foundation/testsuite/src/DateTimeParserTest.h b/Foundatio=
n/testsuite/src/DateTimeParserTest.h
> > +index f25416971..07f0b6924 100644
> > +--- a/Foundation/testsuite/src/DateTimeParserTest.h
> > ++++ b/Foundation/testsuite/src/DateTimeParserTest.h
> > +@@ -34,6 +34,7 @@ public:
> > +       void testASCTIME();
> > +       void testSORTABLE();
> > +       void testCustom();
> > ++      void testISO8601FracSeconds();
> > +       void testGuess();
> > +       void testCleanup();
> > +       void testParseMonth();
> > diff --git a/meta-oe/recipes-support/poco/poco_1.15.2.bb b/meta-oe/reci=
pes-support/poco/poco_1.15.2.bb
> > index 5a873a1d85..bc3d3f9180 100644
> > --- a/meta-oe/recipes-support/poco/poco_1.15.2.bb
> > +++ b/meta-oe/recipes-support/poco/poco_1.15.2.bb
> > @@ -12,6 +12,7 @@ SRC_URI =3D "git://github.com/pocoproject/poco.git;br=
anch=3Dpoco-${PV};protocol=3Dhttp
> >             file://0001-cppignore.lnx-Ignore-PKCS12-and-testLaunch-test=
.patch \
> >             file://0002-DataTest-disable-testSQLChannel-test.patch \
> >             file://0003-quill-rdtsc-fallback-for-32-bit-powerpc.patch \
> > +           file://0004-Fix-DateTimeParser-trailing-timezone-designator=
s-Tim.patch \
> >             file://run-ptest \
> >             "
> >  SRCREV =3D "afbb1ab68f29eec7079e2fdfa04b3efdbec6529d"
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#127314): https://lists.openembedded.org/g/openembed=
ded-devel/message/127314
> > Mute This Topic: https://lists.openembedded.org/mt/119589240/3619737
> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub =
[ankur.tyagi85@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >

