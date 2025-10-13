Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06A9ECCD185
	for <webhook@archiver.kernel.org>; Mon, 13 Oct 2025 06:27:27 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.web11.36772.1760336843961013909
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 12 Oct 2025 23:27:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cY/Q28yU;
 spf=pass (domain: gmail.com, ip: 209.85.218.51, mailfrom: zboszor@gmail.com)
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-b3e9d633b78so707602366b.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 12 Oct 2025 23:27:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760336842; x=1760941642; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YToB34JV96gNwMFHgtn5eCrHD5Vklq8G4YObeAVEGZA=;
        b=cY/Q28yUfrIbwyEl09TtgcvLqLQ/y3SnloWA1J2kzO7bHukABKTHi9TJcP178rCaud
         ZZRJebyuIwESaEwKlKJvwA3P8wLrAs4bdY2TPjqgCK0TYOckhPdqjXAKWhN67iqhDnnX
         pHiEwwomWxQEF7dU+MvvFvtRcJyPRfZmhufarAhVt+uTqdP7G2JO6F7OpZPd55ozQgr/
         9lihXcGPrCwzTLZRMOXS5Qk5jxyFGmzTqJmXKX4+53bwFU44XFV+KAziNY5TaB6qLr6l
         DXt1nHR68EjV61yidvPuvD8jGy3JybwABrbQtcxN4gDcQfsnFAJKxump1uV9r4ODIwWc
         8a4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760336842; x=1760941642;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YToB34JV96gNwMFHgtn5eCrHD5Vklq8G4YObeAVEGZA=;
        b=C66PfXceNqsWbywOL5XFn3IkZ621/FpOcSwwunE/DhYYs+bELoP0aD05JF62Q6SqRR
         BMevHamQy3E8NtSRVf+Ag6C4tP/Wkjkk/NRuAaN2iJiS8X7obnbqVtOX2Sj1zMv8KK2d
         e2K+hyynGNaVRdUaDRUn+HVuhvPqElBg6/td/Ua4YtCoELNhsx6AYZBZR1PActYOpI4z
         WrpN4NQMo+V9bQ84R+FIE4DKW63XdGYbZaftGiSGWQH4cKBp09kcT+7+ANd4p1cAIEAK
         WDkybdCmL9nfDmH6bnKtaE/LShL5nGpEqkasPjvHRIRGKuQ3lmctBWeIWp7UBtzv0tkT
         ZJXg==
X-Gm-Message-State: AOJu0Yy83Bfuynd1NgeKKy3dr64igoYKvEMxCyfBzLUTTNIMJYTzRIwH
	+Fqk0oFVe0boJtsASOGaxGP07r46MLIL9IqQaztkUE+AN3YjlArMgMCR
X-Gm-Gg: ASbGncu87jeUyXPZ58dv3AyaKPz5wWmK6pL36sZF92Bdrjm1tDntsfjt2oV/Y0POJF5
	Rt0cSZ0GOS8UCiIqw72vZIaBLZYN7CfKxQ2Zxg2X33Rdlc7DEAanMU0lzcGdL/iDgFiMaOb0e/A
	GyQ/dncVWYFwv65vL6QsDtbsVclvMI6cUvHjtGPhzZu8HKO2nYXHoQ9XzvDp/JhBgKaM9Ygag+p
	JA5/UoKN4JlHirFCymzf8IRYGBmhMyp0brQbihS075GnluMZ+HzGddFONoA+5A1xOvIg/AkdvJE
	uTpX/FArs5PEgNNfUXYjZIKp74Qi+7SMqd83vpz4OPwLeQmuPQeuSoxxAGItpTXW7WVX/zY8KQ8
	BXJVjsee9gkvSwPkMFLNL3KurtUdIY8O4X/e4sU+dJKJ9XlkQuBDuw87gU244/cx8tx2Wie1aRz
	6pyJgGUh8t8w==
X-Google-Smtp-Source: AGHT+IGBK7+aqeQnfbySmfwFSaIAB08e35QKlCFqWKby6IYKlZUDOZaKqq5Rb8XfUB7/s3Yb0/iGVg==
X-Received: by 2002:a17:907:3e2a:b0:b2a:47c9:8ff5 with SMTP id a640c23a62f3a-b50bd050dafmr39212666b.10.1760336841746;
        Sun, 12 Oct 2025 23:27:21 -0700 (PDT)
Received: from [192.168.2.143] (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b55d5cacba7sm852872666b.5.2025.10.12.23.27.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 12 Oct 2025 23:27:21 -0700 (PDT)
Message-ID: <9cbb3386-4a7d-491c-8903-1d8a2892873e@gmail.com>
Date: Mon, 13 Oct 2025 08:27:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-oe][PATCH v2 2/2] mariadb: 11.4.8
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
References: <20251002104847.1472184-1-zboszor@gmail.com>
 <20251002104847.1472184-2-zboszor@gmail.com>
 <CAMKF1srYE1q8L=PU-oPKQW75WBSS3Khj9=Cw3QpAiNt0thzpvg@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
In-Reply-To: <CAMKF1srYE1q8L=PU-oPKQW75WBSS3Khj9=Cw3QpAiNt0thzpvg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 13 Oct 2025 06:27:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120526

2025. 10. 12. 0:52 keltezéssel, Khem Raj írta:
> Its failing to compile for qemuriscv32 with following errors
>
> /home/kraj200/yoe/build/tmp/work/riscv32imafdc-yoe-linux-musl/mariadb/11.4.8/sources/mariadb-11.4.8/tpool/aio_libaio.cc:61:20:
> error: use of undeclared identifier '
>     ↪ __NR_io_getevents'; did you mean 'io_getevents'?
>     |    61 |   int ret= syscall(__NR_io_getevents, reinterpret_cast<long>(ctx),
>     |       |                    ^~~~~~~~~~~~~~~~~

I will try to re-add the previously deleted patch in a reworked form.

> On Thu, Oct 2, 2025 at 3:49 AM Zoltán Böszörményi <zboszor@gmail.com> wrote:
>> 11.4.7 fixes a huge performance drop from 11.4.5 to 11.4.6.
>> https://mariadb.com/docs/release-notes/community-server/mariadb-11-4-series/mariadb-11.4.7-release-notes
>>
>> 11.4.8 fixes several crash problems and other issues.
>> https://mariadb.com/docs/release-notes/community-server/mariadb-11-4-series/mariadb-11.4.8-release-notes
>>
>> Removed 0001-aio_linux-Check-if-syscall-exists-before-using-it.patch
>> which is not applicable anymore, the code was rewritten.
>>
>> Adapted 0001-sql-CMakeLists.txt-fix-gen_lex_hash-not-found.patch
>> to fix fuzz.
>>
>> Add libxml2-native to DEPENDS in mariadb-native to fix the
>> do_configure failure with the new version.
>>
>> Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
>> ---
>>   ...ive_11.4.6.bb => mariadb-native_11.4.8.bb} |  2 +-
>>   meta-oe/recipes-dbs/mysql/mariadb.inc         |  3 +-
>>   ...ck-if-syscall-exists-before-using-it.patch | 40 -------------------
>>   ...Lists.txt-fix-gen_lex_hash-not-found.patch |  6 +--
>>   .../{mariadb_11.4.6.bb => mariadb_11.4.8.bb}  |  0
>>   5 files changed, 5 insertions(+), 46 deletions(-)
>>   rename meta-oe/recipes-dbs/mysql/{mariadb-native_11.4.6.bb => mariadb-native_11.4.8.bb} (92%)
>>   delete mode 100644 meta-oe/recipes-dbs/mysql/mariadb/0001-aio_linux-Check-if-syscall-exists-before-using-it.patch
>>   rename meta-oe/recipes-dbs/mysql/{mariadb_11.4.6.bb => mariadb_11.4.8.bb} (100%)
>>
>> diff --git a/meta-oe/recipes-dbs/mysql/mariadb-native_11.4.6.bb b/meta-oe/recipes-dbs/mysql/mariadb-native_11.4.8.bb
>> similarity index 92%
>> rename from meta-oe/recipes-dbs/mysql/mariadb-native_11.4.6.bb
>> rename to meta-oe/recipes-dbs/mysql/mariadb-native_11.4.8.bb
>> index 578357b480..ff48dcd806 100644
>> --- a/meta-oe/recipes-dbs/mysql/mariadb-native_11.4.6.bb
>> +++ b/meta-oe/recipes-dbs/mysql/mariadb-native_11.4.8.bb
>> @@ -3,7 +3,7 @@ inherit native
>>
>>   PROVIDES += "mysql5-native"
>>   DEPENDS = "ncurses-native zlib-native bison-native libpcre2-native \
>> -gnutls-native fmt-native \
>> +libxml2-native gnutls-native fmt-native \
>>   "
>>
>>   RDEPENDS:${PN} = ""
>> diff --git a/meta-oe/recipes-dbs/mysql/mariadb.inc b/meta-oe/recipes-dbs/mysql/mariadb.inc
>> index 67dd687c02..53a24d14bc 100644
>> --- a/meta-oe/recipes-dbs/mysql/mariadb.inc
>> +++ b/meta-oe/recipes-dbs/mysql/mariadb.inc
>> @@ -15,7 +15,6 @@ SRC_URI = "https://archive.mariadb.org/${BP}/source/${BP}.tar.gz \
>>              file://fix-arm-atomic.patch \
>>              file://0001-Fix-library-LZ4-lookup.patch \
>>              file://0001-innobase-Define-__NR_futex-if-it-does-not-exist.patch \
>> -           file://0001-aio_linux-Check-if-syscall-exists-before-using-it.patch \
>>              file://ssize_t.patch \
>>              file://sys_futex.patch \
>>              file://cross-compiling.patch \
>> @@ -26,7 +25,7 @@ SRC_URI = "https://archive.mariadb.org/${BP}/source/${BP}.tar.gz \
>>              file://riscv32.patch \
>>              file://0001-Remove-x86-specific-loop-in-my_convert.patch \
>>             "
>> -SRC_URI[sha256sum] = "1b26c0bb2d025dbfac3b9852d2b7eafda56a171b67ac2e27831ec0414fb7df07"
>> +SRC_URI[sha256sum] = "52fa4dca2c5f80afc1667d523a27c06176d98532298a6b0c31ed73505f49e15c"
>>
>>   UPSTREAM_CHECK_URI = "https://github.com/MariaDB/server/tags"
>>
>> diff --git a/meta-oe/recipes-dbs/mysql/mariadb/0001-aio_linux-Check-if-syscall-exists-before-using-it.patch b/meta-oe/recipes-dbs/mysql/mariadb/0001-aio_linux-Check-if-syscall-exists-before-using-it.patch
>> deleted file mode 100644
>> index eddfdaaf77..0000000000
>> --- a/meta-oe/recipes-dbs/mysql/mariadb/0001-aio_linux-Check-if-syscall-exists-before-using-it.patch
>> +++ /dev/null
>> @@ -1,40 +0,0 @@
>> -From f9f019049a9bb09471e8303d4510afae07f225c8 Mon Sep 17 00:00:00 2001
>> -From: Khem Raj <raj.khem@gmail.com>
>> -Date: Wed, 18 Aug 2021 06:49:25 +0000
>> -Subject: [PATCH] aio_linux: Check if syscall exists before using it
>> -
>> -Return -ENOSYS if not implememented, fixes build on arches like RISCV32
>> -Fixes
>> -tpool/aio_linux.cc:63:20: error: '__NR_io_getevents' was not declared in this scope; did you mean 'io_getevents'?
>> -   63 |   int ret= syscall(__NR_io_getevents, reinterpret_cast<long>(ctx),
>> -      |                    ^~~~~~~~~~~~~~~~~
>> -      |                    io_getevents
>> -
>> -Upstream-Status: Pending
>> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ----
>> - tpool/aio_linux.cc | 4 ++++
>> - 1 file changed, 4 insertions(+)
>> -
>> -diff --git a/tpool/aio_linux.cc b/tpool/aio_linux.cc
>> -index 507c6b92..a6adf1af 100644
>> ---- a/tpool/aio_linux.cc
>> -+++ b/tpool/aio_linux.cc
>> -@@ -59,6 +59,7 @@ Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02111 - 1301 USA*/
>> - */
>> - static int my_getevents(io_context_t ctx, long min_nr, long nr, io_event *ev)
>> - {
>> -+#ifdef __NR_io_getevents
>> -   int saved_errno= errno;
>> -   int ret= syscall(__NR_io_getevents, reinterpret_cast<long>(ctx),
>> -                    min_nr, nr, ev, 0);
>> -@@ -68,6 +69,9 @@ static int my_getevents(io_context_t ctx, long min_nr, long nr, io_event *ev)
>> -     errno= saved_errno;
>> -   }
>> -   return ret;
>> -+#else
>> -+  return -ENOSYS;
>> -+#endif
>> - }
>> -
>> -
>> diff --git a/meta-oe/recipes-dbs/mysql/mariadb/0001-sql-CMakeLists.txt-fix-gen_lex_hash-not-found.patch b/meta-oe/recipes-dbs/mysql/mariadb/0001-sql-CMakeLists.txt-fix-gen_lex_hash-not-found.patch
>> index 1475bb1a51..7c73699b08 100644
>> --- a/meta-oe/recipes-dbs/mysql/mariadb/0001-sql-CMakeLists.txt-fix-gen_lex_hash-not-found.patch
>> +++ b/meta-oe/recipes-dbs/mysql/mariadb/0001-sql-CMakeLists.txt-fix-gen_lex_hash-not-found.patch
>> @@ -18,8 +18,8 @@ diff --git a/sql/CMakeLists.txt b/sql/CMakeLists.txt
>>   index 0195555e..507136cb 100644
>>   --- a/sql/CMakeLists.txt
>>   +++ b/sql/CMakeLists.txt
>> -@@ -64,11 +64,18 @@ ${CMAKE_BINARY_DIR}/sql
>> - ${CMAKE_SOURCE_DIR}/tpool
>> +@@ -63,11 +63,18 @@
>> + ${CMAKE_BINARY_DIR}/sql
>>    )
>>
>>   -ADD_CUSTOM_COMMAND(
>> @@ -41,7 +41,7 @@ index 0195555e..507136cb 100644
>>
>>    FIND_PACKAGE(BISON 2.4)
>>
>> -@@ -405,11 +412,18 @@ IF(NOT CMAKE_CROSSCOMPILING OR DEFINED CMAKE_CROSSCOMPILING_EMULATOR)
>> +@@ -405,11 +412,18 @@
>>      ADD_EXECUTABLE(gen_lex_hash gen_lex_hash.cc)
>>    ENDIF()
>>
>> diff --git a/meta-oe/recipes-dbs/mysql/mariadb_11.4.6.bb b/meta-oe/recipes-dbs/mysql/mariadb_11.4.8.bb
>> similarity index 100%
>> rename from meta-oe/recipes-dbs/mysql/mariadb_11.4.6.bb
>> rename to meta-oe/recipes-dbs/mysql/mariadb_11.4.8.bb
>> --
>> 2.51.0
>>


