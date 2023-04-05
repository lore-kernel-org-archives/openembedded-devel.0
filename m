Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12D09C7619A
	for <webhook@archiver.kernel.org>; Wed,  5 Apr 2023 11:01:38 +0000 (UTC)
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
 by mx.groups.io with SMTP id smtpd.web11.127082.1680692493439282273
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 05 Apr 2023 04:01:33 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20210112 header.b=TAKbxZrJ;
 spf=pass (domain: gmail.com, ip: 209.85.210.53, mailfrom: akuster808@gmail.com)
Received: by mail-ot1-f53.google.com with SMTP id cm7-20020a056830650700b006a11f365d13so17514380otb.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 05 Apr 2023 04:01:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680692492; x=1683284492;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZJlzoRE+oRVEk7wWX25SwCgRjTzwttJznz4jUIiKELI=;
        b=TAKbxZrJYcVpzAyzNJCvA0E8AgSWu+f267d3yl5/TiPUeSsLj2LNRkz6LXl19WOqWe
         jazkZrYnmbAEJdrfsKoZ9z+hOYBWWQC8kEj7jVFA7MwUSDRh/AqjnWlKP3lG+qNgfcwZ
         1aJhUy3nD/cWCAjlAcZaB3zf1UeFc2z6i1R4J7rskolURJjLAoLIg4TWow/TCUDPm+NL
         xNHjc17xW+dUlWsol+KzfJCcaF3qLcYKG9ax9Cfd6J+N6PdGbWuK0iz7lbK84MLJlf+J
         hREkrb2KZJbygcJ3Hml5QJw+kdtUcEWiklD1MaTW3CL4/zCWw1DFmT0KqOL4p9qdBZo6
         6CDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680692492; x=1683284492;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZJlzoRE+oRVEk7wWX25SwCgRjTzwttJznz4jUIiKELI=;
        b=0pt87RFHcxxF3ZM+5sGJcKIFYivE04sGbsD3+cZnKzb+ygeQBYh6vhePjATVjhsgnx
         W06crwoENdoV1fV/KFRd3tu1jlVKfwaVzX2HKlW9Cc83PEnAYHWWTwtI1vVtOFFbUiAD
         M2kkxAiIt8iDP6H6dJxzZWP1AZBTSpp6acNepToRbxL1sXPVKI7hGhArG/etVvfTfCMS
         I6v/foy6RYqSpA38K6b9V5O9kBNd8Xut1VnhySEqmsJZXVVyZi/kpNFtpM2hgBuibTOt
         zA8P4mbjQ7IjPPECKd39AFOzf8t55K9DIIkug3UU/pkkqt/na7bUARISLRL2hnFTuHNS
         /KkQ==
X-Gm-Message-State: AAQBX9dVT+LLA16eewZrJZ/Kz5QLhDWPgrfnLHJIVFgdu2boZcbwyGPT
	3wyMYBhEaKhncELNO1us4fyZOvgU3hncJg==
X-Google-Smtp-Source: AKy350aABHjRKKUUTEgVsqUisETNXt+8dmfc6zHWttBkYZqmAzy/QfDBOapEzJbPIl2bWmras9vKVA==
X-Received: by 2002:a9d:738a:0:b0:69a:5407:e563 with SMTP id j10-20020a9d738a000000b0069a5407e563mr1046661otk.16.1680692492214;
        Wed, 05 Apr 2023 04:01:32 -0700 (PDT)
Received: from ?IPV6:2600:1700:9190:ba10:36f6:c20d:238e:7162? ([2600:1700:9190:ba10:36f6:c20d:238e:7162])
        by smtp.gmail.com with ESMTPSA id e20-20020a05683013d400b006a3842a32b6sm2811421otq.42.2023.04.05.04.01.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Apr 2023 04:01:31 -0700 (PDT)
Message-ID: <285ed360-f677-c16d-df7e-fd790c2e838e@gmail.com>
Date: Wed, 5 Apr 2023 07:01:30 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [oe][meta-oe][kirkstone][PATCH 1/1] syslog-ng: fix CVE-2022-38725
Content-Language: en-US
To: Randy MacLeod <randy.macleod@windriver.com>, Yogita.Urade@windriver.com,
 openembedded-devel@lists.openembedded.org
Cc: hari.gpillai@windriver.com
References: <20230403104249.167098-1-yogita.urade@windriver.com>
 <ba850f5a-5094-0826-ee66-a5b989509376@windriver.com>
From: akuster808 <akuster808@gmail.com>
In-Reply-To: <ba850f5a-5094-0826-ee66-a5b989509376@windriver.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 05 Apr 2023 11:01:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101958



On 4/4/23 2:14 PM, Randy MacLeod wrote:
> Armin, Yogita
>
> Is it just me or is this patch not well-formed?

I had the same issue but then pulled it from patchwork.

-armin
>
> I save it from Thunderbird and:
>
> meta-oe.git on kirkstone [$]
> ❯ git am /tmp/syslog-ng-april-4-a.eml
> error: cannot convert from y to UTF-8
> fatal: could not parse patch
> ❯ git am --abort
>
> I also tried copying the text of the patch but that failed with:
> meta-oe.git on kirkstone [$]
> ❯ git am /tmp/jj-syslog
> Patch format detection failed.
> ❯ git am --abort
>
> Am I missing some magic maintainer workflow?
>
> ../Randy
>
>
> On 2023-04-03 06:42, Urade, Yogita via lists.openembedded.org wrote:
>> Fix buffer handling of syslog and timestamp parsers.
>>
>> References:
>> https://nvd.nist.gov/vuln/detail/CVE-2022-38725
>> https://github.com/syslog-ng/syslog-ng/releases
>> https://github.com/syslog-ng/syslog-ng/pull/4110
>>
>> Signed-off-by: Yogita Urade<yogita.urade@windriver.com>
>> ---
>>   .../syslog-ng/files/CVE-2022-38725-0001.patch |  65 ++++++
>>   .../syslog-ng/files/CVE-2022-38725-0002.patch | 150 +++++++++++++
>>   .../syslog-ng/files/CVE-2022-38725-0003.patch |  77 +++++++
>>   .../syslog-ng/files/CVE-2022-38725-0004.patch |  37 +++
>>   .../syslog-ng/files/CVE-2022-38725-0005.patch | 211 ++++++++++++++++++
>>   .../syslog-ng/files/CVE-2022-38725-0006.patch | 180 +++++++++++++++
>>   .../syslog-ng/files/CVE-2022-38725-0007.patch |  81 +++++++
>>   .../syslog-ng/files/CVE-2022-38725-0008.patch |  45 ++++
>>   .../syslog-ng/syslog-ng_3.36.1.bb             |   8 +
>>   9 files changed, 854 insertions(+)
>>   create mode 100644 meta-oe/recipes-support/syslog-ng/files/CVE-2022-38725-0001.patch
>>   create mode 100644 meta-oe/recipes-support/syslog-ng/files/CVE-2022-38725-0002.patch
>>   create mode 100644 meta-oe/recipes-support/syslog-ng/files/CVE-2022-38725-0003.patch
>>   create mode 100644 meta-oe/recipes-support/syslog-ng/files/CVE-2022-38725-0004.patch
>>   create mode 100644 meta-oe/recipes-support/syslog-ng/files/CVE-2022-38725-0005.patch
>>   create mode 100644 meta-oe/recipes-support/syslog-ng/files/CVE-2022-38725-0006.patch
>>   create mode 100644 meta-oe/recipes-support/syslog-ng/files/CVE-2022-38725-0007.patch
>>   create mode 100644 meta-oe/recipes-support/syslog-ng/files/CVE-2022-38725-0008.patch
>>
>> diff --git a/meta-oe/recipes-support/syslog-ng/files/CVE-2022-38725-0001.patch b/meta-oe/recipes-support/syslog-ng/files/CVE-2022-38725-0001.patch
>> new file mode 100644
>> index 000000000..7d1dd6582
>> --- /dev/null
>> +++ b/meta-oe/recipes-support/syslog-ng/files/CVE-2022-38725-0001.patch
>> @@ -0,0 +1,65 @@
>> +From b5a060f2ebb8d794f508436a12e4d4163f94b1b8 Mon Sep 17 00:00:00 2001
>> +From: Laszlo Varady<laszlo.varady@protonmail.com>
>> +Date: Sat, 20 Aug 2022 12:26:05 +0200
>> +Subject: [PATCH 1/8] syslogformat: fix out-of-bounds reading of data buffer
>> +MIME-Version: 1.0
>> +Content-Type: text/plain; charset=UTF-8
>> +Content-Transfer-Encoding: 8bit
>> +
>> +CVE: CVE-2022-38725
>> +
>> +Upstream-Status: Backport
>> +[https://github.com/syslog-ng/syslog-ng/commit/b5a060f2ebb8d794f508436a12e4d4163f94b1b8]
>> +
>> +Signed-off-by: László Várady<laszlo.varady@protonmail.com>
>> +
>> +Signed-off-by: Yogita Urade<yogita.urade@windriver.com>
>> +---
>> + modules/syslogformat/syslog-format.c | 10 +++++++---
>> + 1 file changed, 7 insertions(+), 3 deletions(-)
>> +
>> +diff --git a/modules/syslogformat/syslog-format.c b/modules/syslogformat/syslog-format.c
>> +index aacb525b3..872cc1d71 100644
>> +--- a/modules/syslogformat/syslog-format.c
>> ++++ b/modules/syslogformat/syslog-format.c
>> +@@ -223,6 +223,9 @@ log_msg_parse_cisco_timestamp_attributes(LogMessage *self, const guchar **data,
>> +   const guchar *src = *data;
>> +   gint left = *length;
>> +
>> ++  if (!left)
>> ++    return;
>> ++
>> +   /* Cisco timestamp extensions, the first '*' indicates that the clock is
>> +    * unsynced, '.' if it is known to be synced */
>> +   if (G_UNLIKELY(src[0] == '*'))
>> +@@ -562,7 +565,7 @@ log_msg_parse_sd(LogMessage *self, const guchar **data, gint *length, const MsgF
>> +       open_sd++;
>> +       do
>> +         {
>> +-          if (!isascii(*src) || *src == '=' || *src == ' ' || *src == ']' || *src == '"')
>> ++          if (!left || !isascii(*src) || *src == '=' || *src == ' ' || *src == ']' || *src == '"')
>> +             goto error;
>> +           /* read sd_id */
>> +           pos = 0;
>> +@@ -595,7 +598,8 @@ log_msg_parse_sd(LogMessage *self, const guchar **data, gint *length, const MsgF
>> +           sd_id_len = pos;
>> +           strcpy(sd_value_name, logmsg_sd_prefix);
>> +           strncpy(sd_value_name + logmsg_sd_prefix_len, sd_id_name, sizeof(sd_value_name) - logmsg_sd_prefix_len);
>> +-          if (*src == ']')
>> ++
>> ++          if (left && *src == ']')
>> +             {
>> +               log_msg_set_value_by_name(self, sd_value_name, "", 0);
>> +             }
>> +@@ -612,7 +616,7 @@ log_msg_parse_sd(LogMessage *self, const guchar **data, gint *length, const MsgF
>> +               else
>> +                 goto error;
>> +
>> +-              if (!isascii(*src) || *src == '=' || *src == ' ' || *src == ']' || *src == '"')
>> ++              if (!left || !isascii(*src) || *src == '=' || *src == ' ' || *src == ']' || *src == '"')
>> +                 goto error;
>> +
>> +               /* read sd-param */
>> +--
>> +2.34.1
>> +
>> diff --git a/meta-oe/recipes-support/syslog-ng/files/CVE-2022-38725-0002.patch b/meta-oe/recipes-support/syslog-ng/files/CVE-2022-38725-0002.patch
>> new file mode 100644
>> index 000000000..9ccb24dde
>> --- /dev/null
>> +++ b/meta-oe/recipes-support/syslog-ng/files/CVE-2022-38725-0002.patch
>> @@ -0,0 +1,150 @@
>> +From 81a07263f1e522a376d3a30f96f51df3f2879f8a Mon Sep 17 00:00:00 2001
>> +From: Laszlo Varady<laszlo.varady@protonmail.com>
>> +Date: Sat, 20 Aug 2022 12:22:44 +0200
>> +Subject: [PATCH 2/8] syslogformat: add bug reproducer test for non-zero terminated
>> + input
>> +MIME-Version: 1.0
>> +Content-Type: text/plain; charset=UTF-8
>> +Content-Transfer-Encoding: 8bit
>> +
>> +CVE: CVE-2022-38725
>> +
>> +Upstream-Status: Backport
>> +[https://github.com/syslog-ng/syslog-ng/commit/81a07263f1e522a376d3a30f96f51df3f2879f8a]
>> +
>> +Signed-off-by: László Várady<laszlo.varady@protonmail.com>
>> +
>> +Signed-off-by: Yogita Urade<yogita.urade@windriver.com>
>> +---
>> + modules/syslogformat/CMakeLists.txt           |  1 +
>> + modules/syslogformat/Makefile.am              |  2 +
>> + modules/syslogformat/tests/CMakeLists.txt     |  1 +
>> + modules/syslogformat/tests/Makefile.am        |  9 +++
>> + .../syslogformat/tests/test_syslog_format.c   | 72 +++++++++++++++++++
>> + 5 files changed, 85 insertions(+)
>> + create mode 100644 modules/syslogformat/tests/CMakeLists.txt
>> + create mode 100644 modules/syslogformat/tests/Makefile.am
>> + create mode 100644 modules/syslogformat/tests/test_syslog_format.c
>> +
>> +diff --git a/modules/syslogformat/CMakeLists.txt b/modules/syslogformat/CMakeLists.txt
>> +index 94ee01aa2..64848efee 100644
>> +--- a/modules/syslogformat/CMakeLists.txt
>> ++++ b/modules/syslogformat/CMakeLists.txt
>> +@@ -14,3 +14,4 @@ add_module(
>> +   SOURCES ${SYSLOGFORMAT_SOURCES}
>> + )
>> +
>> ++add_test_subdirectory(tests)
>> +diff --git a/modules/syslogformat/Makefile.am b/modules/syslogformat/Makefile.am
>> +index f13f88c1b..14cdf589d 100644
>> +--- a/modules/syslogformat/Makefile.am
>> ++++ b/modules/syslogformat/Makefile.am
>> +@@ -31,3 +31,5 @@ modules_syslogformat_libsyslogformat_la_DEPENDENCIES =	\
>> + modules/syslogformat modules/syslogformat/ mod-syslogformat: \
>> + 	modules/syslogformat/libsyslogformat.la
>> + .PHONY: modules/syslogformat/ mod-syslogformat
>> ++
>> ++include modules/syslogformat/tests/Makefile.am
>> +diff --git a/modules/syslogformat/tests/CMakeLists.txt b/modules/syslogformat/tests/CMakeLists.txt
>> +new file mode 100644
>> +index 000000000..2e45b7194
>> +--- /dev/null
>> ++++ b/modules/syslogformat/tests/CMakeLists.txt
>> +@@ -0,0 +1 @@
>> ++add_unit_test(CRITERION TARGET test_syslog_format DEPENDS syslogformat)
>> +diff --git a/modules/syslogformat/tests/Makefile.am b/modules/syslogformat/tests/Makefile.am
>> +new file mode 100644
>> +index 000000000..7ee66a59c
>> +--- /dev/null
>> ++++ b/modules/syslogformat/tests/Makefile.am
>> +@@ -0,0 +1,9 @@
>> ++modules_syslogformat_tests_TESTS = \
>> ++    modules/syslogformat/tests/test_syslog_format
>> ++
>> ++check_PROGRAMS += ${modules_syslogformat_tests_TESTS}
>> ++
>> ++EXTRA_DIST += modules/syslogformat/tests/CMakeLists.txt
>> ++
>> ++modules_syslogformat_tests_test_syslog_format_CFLAGS = $(TEST_CFLAGS) -I$(top_srcdir)/modules/syslogformat
>> ++modules_syslogformat_tests_test_syslog_format_LDADD = $(TEST_LDADD) $(PREOPEN_SYSLOGFORMAT)
>> +diff --git a/modules/syslogformat/tests/test_syslog_format.c b/modules/syslogformat/tests/test_syslog_format.c
>> +new file mode 100644
>> +index 000000000..b247fe3c5
>> +--- /dev/null
>> ++++ b/modules/syslogformat/tests/test_syslog_format.c
>> +@@ -0,0 +1,72 @@
>> ++/*
>> ++ * Copyright (c) 2022 One Identity
>> ++ * Copyright (c) 2022 László Várady
>> ++ *
>> ++ * This program is free software; you can redistribute it and/or modify it
>> ++ * under the terms of the GNU General Public License version 2 as published
>> ++ * by the Free Software Foundation, or (at your option) any later version.
>> ++ *
>> ++ * This program is distributed in the hope that it will be useful,
>> ++ * but WITHOUT ANY WARRANTY; without even the implied warranty of
>> ++ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
>> ++ * GNU General Public License for more details.
>> ++ *
>> ++ * You should have received a copy of the GNU General Public License
>> ++ * along with this program; if not, write to the Free Software
>> ++ * Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
>> ++ *
>> ++ * As an additional exemption you are allowed to compile & link against the
>> ++ * OpenSSL libraries as published by the OpenSSL project. See the file
>> ++ * COPYING for details.
>> ++ *
>> ++ */
>> ++
>> ++#include <criterion/criterion.h>
>> ++
>> ++#include "apphook.h"
>> ++#include "cfg.h"
>> ++#include "syslog-format.h"
>> ++#include "logmsg/logmsg.h"
>> ++#include "msg-format.h"
>> ++#include "scratch-buffers.h"
>> ++
>> ++#include <string.h>
>> ++
>> ++GlobalConfig *cfg;
>> ++MsgFormatOptions parse_options;
>> ++
>> ++static void
>> ++setup(void)
>> ++{
>> ++  app_startup();
>> ++  syslog_format_init();
>> ++
>> ++  cfg = cfg_new_snippet();
>> ++  msg_format_options_defaults(&parse_options);
>> ++}
>> ++
>> ++static void
>> ++teardown(void)
>> ++{
>> ++  scratch_buffers_explicit_gc();
>> ++  app_shutdown();
>> ++  cfg_free(cfg);
>> ++}
>> ++
>> ++TestSuite(syslog_format, .init = setup, .fini = teardown);
>> ++
>> ++Test(syslog_format, parser_should_not_spin_on_non_zero_terminated_input, .timeout = 10)
>> ++{
>> ++  const gchar *data = "<182>2022-08-17T05:02:28.217 mymachine su: 'su root' failed for lonvick on /dev/pts/8";
>> ++  /* chosen carefully to reproduce a bug */
>> ++  gsize data_length = 27;
>> ++
>> ++  msg_format_options_init(&parse_options, cfg);
>> ++  LogMessage *msg = msg_format_construct_message(&parse_options, (const guchar *) data, data_length);
>> ++
>> ++  gsize problem_position;
>> ++  cr_assert(syslog_format_handler(&parse_options, msg, (const guchar *) data, data_length, &problem_position));
>> ++
>> ++  msg_format_options_destroy(&parse_options);
>> ++  log_msg_unref(msg);
>> ++}
>> +--
>> +2.34.1
>> +
>> diff --git a/meta-oe/recipes-support/syslog-ng/files/CVE-2022-38725-0003.patch b/meta-oe/recipes-support/syslog-ng/files/CVE-2022-38725-0003.patch
>> new file mode 100644
>> index 000000000..580116504
>> --- /dev/null
>> +++ b/meta-oe/recipes-support/syslog-ng/files/CVE-2022-38725-0003.patch
>> @@ -0,0 +1,77 @@
>> +From 4b8dc56ca8eaeac4c8751a305eb7eeefab8dc89d Mon Sep 17 00:00:00 2001
>> +From: Laszlo Varady<laszlo.varady@protonmail.com>
>> +Date: Sun, 21 Aug 2022 18:44:28 +0200
>> +Subject: [PATCH 3/8] syslogformat: fix reading cisco sequence id out of bounds
>> +MIME-Version: 1.0
>> +Content-Type: text/plain; charset=UTF-8
>> +Content-Transfer-Encoding: 8bit
>> +
>> +CVE: CVE-2022-38725
>> +
>> +Upstream-Status: Backport
>> +[https://github.com/syslog-ng/syslog-ng/commit/4b8dc56ca8eaeac4c8751a305eb7eeefab8dc89d]
>> +
>> +Signed-off-by: László Várady<laszlo.varady@protonmail.com>
>> +
>> +Signed-off-by: Yogita Urade<yogita.urade@windriver.com>
>> +---
>> + modules/syslogformat/syslog-format.c          |  2 +-
>> + .../syslogformat/tests/test_syslog_format.c   | 32 +++++++++++++++++++
>> + 2 files changed, 33 insertions(+), 1 deletion(-)
>> +
>> +diff --git a/modules/syslogformat/syslog-format.c b/modules/syslogformat/syslog-format.c
>> +index 872cc1d71..a3d48d6f2 100644
>> +--- a/modules/syslogformat/syslog-format.c
>> ++++ b/modules/syslogformat/syslog-format.c
>> +@@ -207,7 +207,7 @@ log_msg_parse_cisco_sequence_id(LogMessage *self, const guchar **data, gint *len
>> +
>> +   /* if the next char is not space, then we may try to read a date */
>> +
>> +-  if (*src != ' ')
>> ++  if (!left || *src != ' ')
>> +     return;
>> +
>> +   log_msg_set_value(self, handles.cisco_seqid, (gchar *) *data, *length - left - 1);
>> +diff --git a/modules/syslogformat/tests/test_syslog_format.c b/modules/syslogformat/tests/test_syslog_format.c
>> +index b247fe3c5..d0f5b4043 100644
>> +--- a/modules/syslogformat/tests/test_syslog_format.c
>> ++++ b/modules/syslogformat/tests/test_syslog_format.c
>> +@@ -70,3 +70,35 @@ Test(syslog_format, parser_should_not_spin_on_non_zero_terminated_input, .timeou
>> +   msg_format_options_destroy(&parse_options);
>> +   log_msg_unref(msg);
>> + }
>> ++
>> ++Test(syslog_format, cisco_sequence_id_non_zero_termination)
>> ++{
>> ++  const gchar *data = "<189>65536: ";
>> ++  gsize data_length = strlen(data);
>> ++
>> ++  msg_format_options_init(&parse_options, cfg);
>> ++  LogMessage *msg = msg_format_construct_message(&parse_options, (const guchar *) data, data_length);
>> ++
>> ++  gsize problem_position;
>> ++  cr_assert(syslog_format_handler(&parse_options, msg, (const guchar *) data, data_length, &problem_position));
>> ++  cr_assert_str_eq(log_msg_get_value_by_name(msg, ".SDATA.meta.sequenceId", NULL), "65536");
>> ++
>> ++  msg_format_options_destroy(&parse_options);
>> ++  log_msg_unref(msg);
>> ++}
>> ++
>> ++Test(syslog_format, minimal_non_zero_terminated_numeric_message_is_parsed_as_program_name)
>> ++{
>> ++  const gchar *data = "<189>65536";
>> ++  gsize data_length = strlen(data);
>> ++
>> ++  msg_format_options_init(&parse_options, cfg);
>> ++  LogMessage *msg = msg_format_construct_message(&parse_options, (const guchar *) data, data_length);
>> ++
>> ++  gsize problem_position;
>> ++  cr_assert(syslog_format_handler(&parse_options, msg, (const guchar *) data, data_length, &problem_position));
>> ++  cr_assert_str_eq(log_msg_get_value_by_name(msg, "PROGRAM", NULL), "65536");
>> ++
>> ++  msg_format_options_destroy(&parse_options);
>> ++  log_msg_unref(msg);
>> ++}
>> +--
>> +2.34.1
>> +
>> diff --git a/meta-oe/recipes-support/syslog-ng/files/CVE-2022-38725-0004.patch b/meta-oe/recipes-support/syslog-ng/files/CVE-2022-38725-0004.patch
>> new file mode 100644
>> index 000000000..cb81b1c12
>> --- /dev/null
>> +++ b/meta-oe/recipes-support/syslog-ng/files/CVE-2022-38725-0004.patch
>> @@ -0,0 +1,37 @@
>> +From 73b5c300b8fde5e7a4824baa83a04931279abb37 Mon Sep 17 00:00:00 2001
>> +From: Laszlo Varady<laszlo.varady@protonmail.com>
>> +Date: Sat, 20 Aug 2022 12:42:38 +0200
>> +Subject: [PATCH 4/8] timeutils: fix iterating out of the range of timestamp buffer
>> +MIME-Version: 1.0
>> +Content-Type: text/plain; charset=UTF-8
>> +Content-Transfer-Encoding: 8bit
>> +
>> +CVE: CVE-2022-38725
>> +
>> +Upstream-Status: Backport
>> +[https://github.com/syslog-ng/syslog-ng/commit/73b5c300b8fde5e7a4824baa83a04931279abb37]
>> +
>> +Signed-off-by: László Várady<laszlo.varady@protonmail.com>
>> +Signed-off-by: Balazs Scheidler<bazsi77@gmail.com>
>> +
>> +Signed-off-by: Yogita Urade<yogita.urade@windriver.com>
>> +---
>> + lib/timeutils/scan-timestamp.c | 2 +-
>> + 1 file changed, 1 insertion(+), 1 deletion(-)
>> +
>> +diff --git a/lib/timeutils/scan-timestamp.c b/lib/timeutils/scan-timestamp.c
>> +index 304a57673..4fbe94a36 100644
>> +--- a/lib/timeutils/scan-timestamp.c
>> ++++ b/lib/timeutils/scan-timestamp.c
>> +@@ -332,7 +332,7 @@ __parse_usec(const guchar **data, gint *length)
>> +           src++;
>> +           (*length)--;
>> +         }
>> +-      while (isdigit(*src))
>> ++      while (*length > 0 && isdigit(*src))
>> +         {
>> +           src++;
>> +           (*length)--;
>> +--
>> +2.34.1
>> +
>> diff --git a/meta-oe/recipes-support/syslog-ng/files/CVE-2022-38725-0005.patch b/meta-oe/recipes-support/syslog-ng/files/CVE-2022-38725-0005.patch
>> new file mode 100644
>> index 000000000..70964b328
>> --- /dev/null
>> +++ b/meta-oe/recipes-support/syslog-ng/files/CVE-2022-38725-0005.patch
>> @@ -0,0 +1,211 @@
>> +From 45f051239312e43bd4f92b9339fe67c6798a0321 Mon Sep 17 00:00:00 2001
>> +From: Balazs Scheidler<bazsi77@gmail.com>
>> +Date: Sat, 20 Aug 2022 12:43:42 +0200
>> +Subject: [PATCH 5/8] timeutils: add tests for non-zero terminated inputs
>> +
>> +CVE: CVE-2022-38725
>> +
>> +Upstream-Status: Backport
>> +[https://github.com/syslog-ng/syslog-ng/commit/45f051239312e43bd4f92b9339fe67c6798a0321]
>> +
>> +Signed-off-by: Balazs Scheidler<bazsi77@gmail.com>
>> +
>> +Signed-off-by: Yogita Urade<yogita.urade@windriver.com>
>> +---
>> + lib/timeutils/tests/test_scan-timestamp.c | 126 +++++++++++++++++++---
>> + 1 file changed, 113 insertions(+), 13 deletions(-)
>> +
>> +diff --git a/lib/timeutils/tests/test_scan-timestamp.c b/lib/timeutils/tests/test_scan-timestamp.c
>> +index 27b76f12d..468bbf779 100644
>> +--- a/lib/timeutils/tests/test_scan-timestamp.c
>> ++++ b/lib/timeutils/tests/test_scan-timestamp.c
>> +@@ -50,17 +50,21 @@ fake_time_add(time_t diff)
>> + }
>> +
>> + static gboolean
>> +-_parse_rfc3164(const gchar *ts, gchar isotimestamp[32])
>> ++_parse_rfc3164(const gchar *ts, gint len, gchar isotimestamp[32])
>> + {
>> +   UnixTime stamp;
>> +-  const guchar *data = (const guchar *) ts;
>> +-  gint length = strlen(ts);
>> ++  const guchar *tsu = (const guchar *) ts;
>> ++  gint tsu_len = len < 0 ? strlen(ts) : len;
>> +   GString *result = g_string_new("");
>> +   WallClockTime wct = WALL_CLOCK_TIME_INIT;
>> +
>> +-
>> ++  const guchar *data = tsu;
>> ++  gint length = tsu_len;
>> +   gboolean success = scan_rfc3164_timestamp(&data, &length, &wct);
>> +
>> ++  cr_assert(length >= 0);
>> ++  cr_assert(data == &tsu[tsu_len - length]);
>> ++
>> +   unix_time_unset(&stamp);
>> +   convert_wall_clock_time_to_unix_time(&wct, &stamp);
>> +
>> +@@ -71,16 +75,21 @@ _parse_rfc3164(const gchar *ts, gchar isotimestamp[32])
>> + }
>> +
>> + static gboolean
>> +-_parse_rfc5424(const gchar *ts, gchar isotimestamp[32])
>> ++_parse_rfc5424(const gchar *ts, gint len, gchar isotimestamp[32])
>> + {
>> +   UnixTime stamp;
>> +-  const guchar *data = (const guchar *) ts;
>> +-  gint length = strlen(ts);
>> ++  const guchar *tsu = (const guchar *) ts;
>> ++  gint tsu_len = len < 0 ? strlen(ts) : len;
>> +   GString *result = g_string_new("");
>> +   WallClockTime wct = WALL_CLOCK_TIME_INIT;
>> +
>> ++  const guchar *data = tsu;
>> ++  gint length = tsu_len;
>> +   gboolean success = scan_rfc5424_timestamp(&data, &length, &wct);
>> +
>> ++  cr_assert(length >= 0);
>> ++  cr_assert(data == &tsu[tsu_len - length]);
>> ++
>> +   unix_time_unset(&stamp);
>> +   convert_wall_clock_time_to_unix_time(&wct, &stamp);
>> +
>> +@@ -91,31 +100,60 @@ _parse_rfc5424(const gchar *ts, gchar isotimestamp[32])
>> + }
>> +
>> + static gboolean
>> +-_rfc3164_timestamp_eq(const gchar *ts, const gchar *expected, gchar converted[32])
>> ++_rfc3164_timestamp_eq(const gchar *ts, gint len, const gchar *expected, gchar converted[32])
>> + {
>> +-  cr_assert(_parse_rfc3164(ts, converted));
>> ++  cr_assert(_parse_rfc3164(ts, len, converted));
>> +   return strcmp(converted, expected) == 0;
>> + }
>> +
>> + static gboolean
>> +-_rfc5424_timestamp_eq(const gchar *ts, const gchar *expected, gchar converted[32])
>> ++_rfc5424_timestamp_eq(const gchar *ts, gint len, const gchar *expected, gchar converted[32])
>> + {
>> +-  cr_assert(_parse_rfc5424(ts, converted));
>> ++  cr_assert(_parse_rfc5424(ts, len, converted));
>> +   return strcmp(converted, expected) == 0;
>> + }
>> +
>> + #define _expect_rfc3164_timestamp_eq(ts, expected) \
>> +   ({ \
>> +     gchar converted[32]; \
>> +-    cr_expect(_rfc3164_timestamp_eq(ts, expected, converted), "Parsed RFC3164 timestamp does not equal expected, ts=%s, converted=%s, expected=%s", ts, converted, expected); \
>> ++    cr_expect(_rfc3164_timestamp_eq(ts, -1, expected, converted), "Parsed RFC3164 timestamp does not equal expected, ts=%s, converted=%s, expected=%s", ts, converted, expected); \
>> ++  })
>> ++
>> ++#define _expect_rfc3164_timestamp_len_eq(ts, len, expected) \
>> ++  ({ \
>> ++    gchar converted[32]; \
>> ++    cr_expect(_rfc3164_timestamp_eq(ts, len, expected, converted), "Parsed RFC3164 timestamp does not equal expected, ts=%s, converted=%s, expected=%s", ts, converted, expected); \
>> ++  })
>> ++
>> ++#define _expect_rfc3164_fails(ts, len) \
>> ++  ({  \
>> ++    WallClockTime wct = WALL_CLOCK_TIME_INIT; \
>> ++    const guchar *data = (guchar *) ts; \
>> ++    gint length = len < 0 ? strlen(ts) : len; \
>> ++    cr_assert_not(scan_rfc3164_timestamp(&data, &length, &wct)); \
>> +   })
>> +
>> + #define _expect_rfc5424_timestamp_eq(ts, expected) \
>> +   ({ \
>> +     gchar converted[32]; \
>> +-    cr_expect(_rfc5424_timestamp_eq(ts, expected, converted), "Parsed RFC5424 timestamp does not equal expected, ts=%s, converted=%s, expected=%s", ts, converted, expected); \
>> ++    cr_expect(_rfc5424_timestamp_eq(ts, -1, expected, converted), "Parsed RFC5424 timestamp does not equal expected, ts=%s, converted=%s, expected=%s", ts, converted, expected); \
>> ++  })
>> ++
>> ++#define _expect_rfc5424_timestamp_len_eq(ts, len, expected) \
>> ++  ({ \
>> ++    gchar converted[32]; \
>> ++    cr_expect(_rfc5424_timestamp_eq(ts, len, expected, converted), "Parsed RFC5424 timestamp does not equal expected, ts=%s, converted=%s, expected=%s", ts, converted, expected); \
>> ++  })
>> ++
>> ++#define _expect_rfc5424_fails(ts, len) \
>> ++  ({  \
>> ++    WallClockTime wct = WALL_CLOCK_TIME_INIT; \
>> ++    const guchar *data = (guchar *) ts; \
>> ++    gint length = len < 0 ? strlen(ts) : len; \
>> ++    cr_assert_not(scan_rfc5424_timestamp(&data, &length, &wct)); \
>> +   })
>> +
>> ++
>> + Test(parse_timestamp, standard_bsd_format)
>> + {
>> +   _expect_rfc3164_timestamp_eq("Oct  1 17:46:12", "2017-10-01T17:46:12.000+02:00");
>> +@@ -164,6 +202,68 @@ Test(parse_timestamp, standard_bsd_format_year_in_the_past)
>> +   _expect_rfc3164_timestamp_eq("Dec 31 17:46:12", "2017-12-31T17:46:12.000+01:00");
>> + }
>> +
>> ++Test(parse_timestamp, non_zero_terminated_rfc3164_iso_input_is_handled_properly)
>> ++{
>> ++  gchar *ts = "2022-08-17T05:02:28.417Z whatever";
>> ++  gint ts_len = 24;
>> ++
>> ++  _expect_rfc3164_timestamp_len_eq(ts, strlen(ts), "2022-08-17T05:02:28.417+00:00");
>> ++  _expect_rfc3164_timestamp_len_eq(ts, ts_len + 5, "2022-08-17T05:02:28.417+00:00");
>> ++  _expect_rfc3164_timestamp_len_eq(ts, ts_len, "2022-08-17T05:02:28.417+00:00");
>> ++
>> ++  /* no "Z" parsed, timezone defaults to local, forced CET */
>> ++  _expect_rfc3164_timestamp_len_eq(ts, ts_len - 1, "2022-08-17T05:02:28.417+02:00");
>> ++
>> ++  /* msec is partially parsed as we trim the string from the right */
>> ++  _expect_rfc3164_timestamp_len_eq(ts, ts_len - 2, "2022-08-17T05:02:28.410+02:00");
>> ++  _expect_rfc3164_timestamp_len_eq(ts, ts_len - 3, "2022-08-17T05:02:28.400+02:00");
>> ++  _expect_rfc3164_timestamp_len_eq(ts, ts_len - 4, "2022-08-17T05:02:28.000+02:00");
>> ++  _expect_rfc3164_timestamp_len_eq(ts, ts_len - 5, "2022-08-17T05:02:28.000+02:00");
>> ++
>> ++  for (gint i = 6; i < ts_len; i++)
>> ++    _expect_rfc3164_fails(ts, ts_len - i);
>> ++
>> ++}
>> ++
>> ++Test(parse_timestamp, non_zero_terminated_rfc3164_bsd_pix_or_asa_input_is_handled_properly)
>> ++{
>> ++  gchar *ts = "Aug 17 2022 05:02:28: whatever";
>> ++  gint ts_len = 21;
>> ++
>> ++  _expect_rfc3164_timestamp_len_eq(ts, strlen(ts), "2022-08-17T05:02:28.000+02:00");
>> ++  _expect_rfc3164_timestamp_len_eq(ts, ts_len + 5, "2022-08-17T05:02:28.000+02:00");
>> ++  _expect_rfc3164_timestamp_len_eq(ts, ts_len, "2022-08-17T05:02:28.000+02:00");
>> ++
>> ++  /* no ":" at the end, that's a problem, unrecognized */
>> ++  _expect_rfc3164_fails(ts, ts_len - 1);
>> ++
>> ++  for (gint i = 1; i < ts_len; i++)
>> ++    _expect_rfc3164_fails(ts, ts_len - i);
>> ++}
>> ++
>> ++Test(parse_timestamp, non_zero_terminated_rfc5424_input_is_handled_properly)
>> ++{
>> ++  gchar *ts = "2022-08-17T05:02:28.417Z whatever";
>> ++  gint ts_len = 24;
>> ++
>> ++  _expect_rfc5424_timestamp_len_eq(ts, strlen(ts), "2022-08-17T05:02:28.417+00:00");
>> ++  _expect_rfc5424_timestamp_len_eq(ts, ts_len + 5, "2022-08-17T05:02:28.417+00:00");
>> ++  _expect_rfc5424_timestamp_len_eq(ts, ts_len, "2022-08-17T05:02:28.417+00:00");
>> ++
>> ++  /* no "Z" parsed, timezone defaults to local, forced CET */
>> ++  _expect_rfc5424_timestamp_len_eq(ts, ts_len - 1, "2022-08-17T05:02:28.417+02:00");
>> ++
>> ++  /* msec is partially parsed as we trim the string from the right */
>> ++  _expect_rfc5424_timestamp_len_eq(ts, ts_len - 2, "2022-08-17T05:02:28.410+02:00");
>> ++  _expect_rfc5424_timestamp_len_eq(ts, ts_len - 3, "2022-08-17T05:02:28.400+02:00");
>> ++  _expect_rfc5424_timestamp_len_eq(ts, ts_len - 4, "2022-08-17T05:02:28.000+02:00");
>> ++  _expect_rfc5424_timestamp_len_eq(ts, ts_len - 5, "2022-08-17T05:02:28.000+02:00");
>> ++
>> ++  for (gint i = 6; i < ts_len; i++)
>> ++    _expect_rfc5424_fails(ts, ts_len - i);
>> ++
>> ++}
>> ++
>> +
>> + Test(parse_timestamp, daylight_saving_behavior_at_spring_with_explicit_timezones)
>> + {
>> +--
>> +2.34.1
>> +
>> diff --git a/meta-oe/recipes-support/syslog-ng/files/CVE-2022-38725-0006.patch b/meta-oe/recipes-support/syslog-ng/files/CVE-2022-38725-0006.patch
>> new file mode 100644
>> index 000000000..81e36c650
>> --- /dev/null
>> +++ b/meta-oe/recipes-support/syslog-ng/files/CVE-2022-38725-0006.patch
>> @@ -0,0 +1,180 @@
>> +From 09f489c89c826293ff8cbd282cfc866ab56054c4 Mon Sep 17 00:00:00 2001
>> +From: Laszlo Varady<laszlo.varady@protonmail.com>
>> +Date: Sat, 20 Aug 2022 14:29:43 +0200
>> +Subject: [PATCH 6/8] timeutils: name repeating constant
>> +MIME-Version: 1.0
>> +Content-Type: text/plain; charset=UTF-8
>> +Content-Transfer-Encoding: 8bit
>> +
>> +CVE: CVE-2022-38725
>> +
>> +Upstream-Status: Backport
>> +[https://github.com/syslog-ng/syslog-ng/commit/09f489c89c826293ff8cbd282cfc866ab56054c4]
>> +
>> +Signed-off-by: László Várady<laszlo.varady@protonmail.com>
>> +
>> +Signed-off-by: Yogita Urade<yogita.urade@windriver.com>
>> +---
>> + lib/timeutils/scan-timestamp.c | 54 ++++++++++++++++++----------------
>> + 1 file changed, 29 insertions(+), 25 deletions(-)
>> +
>> +diff --git a/lib/timeutils/scan-timestamp.c b/lib/timeutils/scan-timestamp.c
>> +index 4fbe94a36..d22d50973 100644
>> +--- a/lib/timeutils/scan-timestamp.c
>> ++++ b/lib/timeutils/scan-timestamp.c
>> +@@ -34,41 +34,43 @@ scan_day_abbrev(const gchar **buf, gint *left, gint *wday)
>> + {
>> +   *wday = -1;
>> +
>> +-  if (*left < 3)
>> ++  const gsize abbrev_length = 3;
>> ++
>> ++  if (*left < abbrev_length)
>> +     return FALSE;
>> +
>> +   switch (**buf)
>> +     {
>> +     case 'S':
>> +-      if (strncasecmp(*buf, "Sun", 3) == 0)
>> ++      if (strncasecmp(*buf, "Sun", abbrev_length) == 0)
>> +         *wday = 0;
>> +-      else if (strncasecmp(*buf, "Sat", 3) == 0)
>> ++      else if (strncasecmp(*buf, "Sat", abbrev_length) == 0)
>> +         *wday = 6;
>> +       else
>> +         return FALSE;
>> +       break;
>> +     case 'M':
>> +-      if (strncasecmp(*buf, "Mon", 3) == 0)
>> ++      if (strncasecmp(*buf, "Mon", abbrev_length) == 0)
>> +         *wday = 1;
>> +       else
>> +         return FALSE;
>> +       break;
>> +     case 'T':
>> +-      if (strncasecmp(*buf, "Tue", 3) == 0)
>> ++      if (strncasecmp(*buf, "Tue", abbrev_length) == 0)
>> +         *wday = 2;
>> +-      else if (strncasecmp(*buf, "Thu", 3) == 0)
>> ++      else if (strncasecmp(*buf, "Thu", abbrev_length) == 0)
>> +         *wday = 4;
>> +       else
>> +         return FALSE;
>> +       break;
>> +     case 'W':
>> +-      if (strncasecmp(*buf, "Wed", 3) == 0)
>> ++      if (strncasecmp(*buf, "Wed", abbrev_length) == 0)
>> +         *wday = 3;
>> +       else
>> +         return FALSE;
>> +       break;
>> +     case 'F':
>> +-      if (strncasecmp(*buf, "Fri", 3) == 0)
>> ++      if (strncasecmp(*buf, "Fri", abbrev_length) == 0)
>> +         *wday = 5;
>> +       else
>> +         return FALSE;
>> +@@ -77,8 +79,8 @@ scan_day_abbrev(const gchar **buf, gint *left, gint *wday)
>> +       return FALSE;
>> +     }
>> +
>> +-  (*buf) += 3;
>> +-  (*left) -= 3;
>> ++  (*buf) += abbrev_length;
>> ++  (*left) -= abbrev_length;
>> +   return TRUE;
>> + }
>> +
>> +@@ -87,63 +89,65 @@ scan_month_abbrev(const gchar **buf, gint *left, gint *mon)
>> + {
>> +   *mon = -1;
>> +
>> +-  if (*left < 3)
>> ++  const gsize abbrev_length = 3;
>> ++
>> ++  if (*left < abbrev_length)
>> +     return FALSE;
>> +
>> +   switch (**buf)
>> +     {
>> +     case 'J':
>> +-      if (strncasecmp(*buf, "Jan", 3) == 0)
>> ++      if (strncasecmp(*buf, "Jan", abbrev_length) == 0)
>> +         *mon = 0;
>> +-      else if (strncasecmp(*buf, "Jun", 3) == 0)
>> ++      else if (strncasecmp(*buf, "Jun", abbrev_length) == 0)
>> +         *mon = 5;
>> +-      else if (strncasecmp(*buf, "Jul", 3) == 0)
>> ++      else if (strncasecmp(*buf, "Jul", abbrev_length) == 0)
>> +         *mon = 6;
>> +       else
>> +         return FALSE;
>> +       break;
>> +     case 'F':
>> +-      if (strncasecmp(*buf, "Feb", 3) == 0)
>> ++      if (strncasecmp(*buf, "Feb", abbrev_length) == 0)
>> +         *mon = 1;
>> +       else
>> +         return FALSE;
>> +       break;
>> +     case 'M':
>> +-      if (strncasecmp(*buf, "Mar", 3) == 0)
>> ++      if (strncasecmp(*buf, "Mar", abbrev_length) == 0)
>> +         *mon = 2;
>> +-      else if (strncasecmp(*buf, "May", 3) == 0)
>> ++      else if (strncasecmp(*buf, "May", abbrev_length) == 0)
>> +         *mon = 4;
>> +       else
>> +         return FALSE;
>> +       break;
>> +     case 'A':
>> +-      if (strncasecmp(*buf, "Apr", 3) == 0)
>> ++      if (strncasecmp(*buf, "Apr", abbrev_length) == 0)
>> +         *mon = 3;
>> +-      else if (strncasecmp(*buf, "Aug", 3) == 0)
>> ++      else if (strncasecmp(*buf, "Aug", abbrev_length) == 0)
>> +         *mon = 7;
>> +       else
>> +         return FALSE;
>> +       break;
>> +     case 'S':
>> +-      if (strncasecmp(*buf, "Sep", 3) == 0)
>> ++      if (strncasecmp(*buf, "Sep", abbrev_length) == 0)
>> +         *mon = 8;
>> +       else
>> +         return FALSE;
>> +       break;
>> +     case 'O':
>> +-      if (strncasecmp(*buf, "Oct", 3) == 0)
>> ++      if (strncasecmp(*buf, "Oct", abbrev_length) == 0)
>> +         *mon = 9;
>> +       else
>> +         return FALSE;
>> +       break;
>> +     case 'N':
>> +-      if (strncasecmp(*buf, "Nov", 3) == 0)
>> ++      if (strncasecmp(*buf, "Nov", abbrev_length) == 0)
>> +         *mon = 10;
>> +       else
>> +         return FALSE;
>> +       break;
>> +     case 'D':
>> +-      if (strncasecmp(*buf, "Dec", 3) == 0)
>> ++      if (strncasecmp(*buf, "Dec", abbrev_length) == 0)
>> +         *mon = 11;
>> +       else
>> +         return FALSE;
>> +@@ -152,8 +156,8 @@ scan_month_abbrev(const gchar **buf, gint *left, gint *mon)
>> +       return FALSE;
>> +     }
>> +
>> +-  (*buf) += 3;
>> +-  (*left) -= 3;
>> ++  (*buf) += abbrev_length;
>> ++  (*left) -= abbrev_length;
>> +   return TRUE;
>> + }
>> +
>> +--
>> +2.34.1
>> +
>> diff --git a/meta-oe/recipes-support/syslog-ng/files/CVE-2022-38725-0007.patch b/meta-oe/recipes-support/syslog-ng/files/CVE-2022-38725-0007.patch
>> new file mode 100644
>> index 000000000..abb36fdf5
>> --- /dev/null
>> +++ b/meta-oe/recipes-support/syslog-ng/files/CVE-2022-38725-0007.patch
>> @@ -0,0 +1,81 @@
>> +From 8c6e2c1c41b0fcc5fbd464c35f4dac7102235396 Mon Sep 17 00:00:00 2001
>> +From: Laszlo Varady<laszlo.varady@protonmail.com>
>> +Date: Sat, 20 Aug 2022 14:30:22 +0200
>> +Subject: [PATCH 7/8] timeutils: fix invalid calculation of ISO timestamp length
>> +MIME-Version: 1.0
>> +Content-Type: text/plain; charset=UTF-8
>> +Content-Transfer-Encoding: 8bit
>> +
>> +CVE: CVE-2022-38725
>> +
>> +Upstream-Status: Backport
>> +[https://github.com/syslog-ng/syslog-ng/commit/8c6e2c1c41b0fcc5fbd464c35f4dac7102235396]
>> +
>> +Signed-off-by: László Várady<laszlo.varady@protonmail.com>
>> +
>> +Signed-off-by: Yogita Urade<yogita.urade@windriver.com>
>> +---
>> + lib/timeutils/scan-timestamp.c            | 8 ++++++--
>> + lib/timeutils/tests/test_scan-timestamp.c | 7 +++++++
>> + 2 files changed, 13 insertions(+), 2 deletions(-)
>> +
>> +diff --git a/lib/timeutils/scan-timestamp.c b/lib/timeutils/scan-timestamp.c
>> +index d22d50973..125264677 100644
>> +--- a/lib/timeutils/scan-timestamp.c
>> ++++ b/lib/timeutils/scan-timestamp.c
>> +@@ -350,19 +350,21 @@ __parse_usec(const guchar **data, gint *length)
>> + static gboolean
>> + __has_iso_timezone(const guchar *src, gint length)
>> + {
>> +-  return (length >= 5) &&
>> ++  return (length >= 6) &&
>> +          (*src == '+' || *src == '-') &&
>> +          isdigit(*(src+1)) &&
>> +          isdigit(*(src+2)) &&
>> +          *(src+3) == ':' &&
>> +          isdigit(*(src+4)) &&
>> +          isdigit(*(src+5)) &&
>> +-         !isdigit(*(src+6));
>> ++         (length < 7 || !isdigit(*(src+6)));
>> + }
>> +
>> + static guint32
>> + __parse_iso_timezone(const guchar **data, gint *length)
>> + {
>> ++  g_assert(*length >= 6);
>> ++
>> +   gint hours, mins;
>> +   const guchar *src = *data;
>> +   guint32 tz = 0;
>> +@@ -372,8 +374,10 @@ __parse_iso_timezone(const guchar **data, gint *length)
>> +   hours = (*(src + 1) - '0') * 10 + *(src + 2) - '0';
>> +   mins = (*(src + 4) - '0') * 10 + *(src + 5) - '0';
>> +   tz = sign * (hours * 3600 + mins * 60);
>> ++
>> +   src += 6;
>> +   (*length) -= 6;
>> ++
>> +   *data = src;
>> +   return tz;
>> + }
>> +diff --git a/lib/timeutils/tests/test_scan-timestamp.c b/lib/timeutils/tests/test_scan-timestamp.c
>> +index 468bbf779..d18bdc65d 100644
>> +--- a/lib/timeutils/tests/test_scan-timestamp.c
>> ++++ b/lib/timeutils/tests/test_scan-timestamp.c
>> +@@ -264,6 +264,13 @@ Test(parse_timestamp, non_zero_terminated_rfc5424_input_is_handled_properly)
>> +
>> + }
>> +
>> ++Test(parse_timestamp, non_zero_terminated_rfc5424_timestamp_only)
>> ++{
>> ++  const gchar *ts = "2022-08-17T05:02:28.417+03:00";
>> ++  gint ts_len = strlen(ts);
>> ++  _expect_rfc5424_timestamp_len_eq(ts, ts_len, ts);
>> ++}
>> ++
>> +
>> + Test(parse_timestamp, daylight_saving_behavior_at_spring_with_explicit_timezones)
>> + {
>> +--
>> +2.34.1
>> +
>> diff --git a/meta-oe/recipes-support/syslog-ng/files/CVE-2022-38725-0008.patch b/meta-oe/recipes-support/syslog-ng/files/CVE-2022-38725-0008.patch
>> new file mode 100644
>> index 000000000..56c71e8a2
>> --- /dev/null
>> +++ b/meta-oe/recipes-support/syslog-ng/files/CVE-2022-38725-0008.patch
>> @@ -0,0 +1,45 @@
>> +From 56f881c5eaa3d8c02c96607c4b9e4eaf959a044d Mon Sep 17 00:00:00 2001
>> +From: Laszlo Varady<laszlo.varady@protonmail.com>
>> +Date: Sat, 20 Aug 2022 14:30:51 +0200
>> +Subject: [PATCH 8/8/] timeutils: fix out-of-bounds reading of data buffer
>> +MIME-Version: 1.0
>> +Content-Type: text/plain; charset=UTF-8
>> +Content-Transfer-Encoding: 8bit
>> +
>> +CVE: CVE-2022-38725
>> +
>> +Upstream-Status: Backport
>> +[https://github.com/syslog-ng/syslog-ng/commit/56f881c5eaa3d8c02c96607c4b9e4eaf959a044d]
>> +
>> +Signed-off-by: László Várady<laszlo.varady@protonmail.com>
>> +
>> +Signed-off-by: Yogita Urade<yogita.urade@windriver.com>
>> +---
>> + lib/timeutils/scan-timestamp.c | 4 ++--
>> + 1 file changed, 2 insertions(+), 2 deletions(-)
>> +
>> +diff --git a/lib/timeutils/scan-timestamp.c b/lib/timeutils/scan-timestamp.c
>> +index 125264677..c00d8e6a9 100644
>> +--- a/lib/timeutils/scan-timestamp.c
>> ++++ b/lib/timeutils/scan-timestamp.c
>> +@@ -431,7 +431,7 @@ __parse_bsd_timestamp(const guchar **data, gint *length, WallClockTime *wct)
>> +       if (!scan_pix_timestamp((const gchar **) &src, &left, wct))
>> +         return FALSE;
>> +
>> +-      if (*src == ':')
>> ++      if (left && *src == ':')
>> +         {
>> +           src++;
>> +           left--;
>> +@@ -482,7 +482,7 @@ scan_rfc3164_timestamp(const guchar **data, gint *length, WallClockTime *wct)
>> +    * looking at you, skip that as well, so we can reliably detect IPv6
>> +    * addresses as hostnames, which would be using ":" as well. */
>> +
>> +-  if (*src == ':')
>> ++  if (left && *src == ':')
>> +     {
>> +       ++src;
>> +       --left;
>> +--
>> +2.34.1
>> +
>> diff --git a/meta-oe/recipes-support/syslog-ng/syslog-ng_3.36.1.bb b/meta-oe/recipes-support/syslog-ng/syslog-ng_3.36.1.bb
>> index 40bbfe495..045b9b71c 100644
>> --- a/meta-oe/recipes-support/syslog-ng/syslog-ng_3.36.1.bb
>> +++ b/meta-oe/recipes-support/syslog-ng/syslog-ng_3.36.1.bb
>> @@ -22,6 +22,14 @@ SRC_URI ="https://github.com/balabit/syslog-ng/releases/download/${BP}/${BP}.ta 
>> file://volatiles.03_syslog-ng \ file://syslog-ng-tmp.conf \ 
>> file://syslog-ng.service-the-syslog-ng-service.patch \ + 
>> file://CVE-2022-38725-0001.patch \ + file://CVE-2022-38725-0002.patch 
>> \ + file://CVE-2022-38725-0003.patch \ + 
>> file://CVE-2022-38725-0004.patch \ + file://CVE-2022-38725-0005.patch 
>> \ + file://CVE-2022-38725-0006.patch \ + 
>> file://CVE-2022-38725-0007.patch \ + file://CVE-2022-38725-0008.patch \ "
>>   
>>   SRC_URI[sha256sum] = "90a25c9767fe749db50f118ddfc92ec71399763d2ecd5ad4f11ff5eea049e60b"
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#101935):https://lists.openembedded.org/g/openembedded-devel/message/101935
>> Mute This Topic:https://lists.openembedded.org/mt/98032111/3616765
>> Group Owner:openembedded-devel+owner@lists.openembedded.org
>> Unsubscribe:https://lists.openembedded.org/g/openembedded-devel/unsub  [randy.macleod@windriver.com]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>
>
> -- 
> # Randy MacLeod
> # Wind River Linux


