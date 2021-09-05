Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
 by mx.groups.io with SMTP id smtpd.web09.13582.1630870467251499309
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 05 Sep 2021 12:34:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=PO51Sjki;
 spf=pass (domain: gmail.com, ip: 209.85.215.174, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f174.google.com with SMTP id g184so4547494pgc.6
        for <openembedded-devel@lists.openembedded.org>; Sun, 05 Sep 2021 12:34:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:references:from:organization:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=ufuHCamcgBzVNXQSyp81nEcza1he8b6gFIpekNSuS2U=;
        b=PO51SjkiWkxybDtDPpFZpdEM8vNfd0H0fOA0m59Xq4iEMAU5FoPRRssp+/76NSM9F5
         W3QbHwci7xzX7w0PSa4i9up/XkDIKRvF9TRKdDdXZ9fSGiYgo8id2gvcLA5RuqKUSvOD
         xaqWSDiL1JL4jTtSZD0n7VIGRYXG2V3FWn1W4mRmGNSroczP0qzHSDrtAhV85yMS95b2
         ZTKb1/se6HZuZcacYUNiYba98xzajc3am68T4dHdLMrHwVZn+Kh0rK2NbKhrOi5u7tUr
         v8WVy/g8lhnMPyNkQ17geFFSvZeVr/p8BBXeuX7j/mdqBpcofyJWVFW0eNsKGVdgt2MC
         8fUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=ufuHCamcgBzVNXQSyp81nEcza1he8b6gFIpekNSuS2U=;
        b=BFA8InCrHMOKU4Kg1NgtxAxbLRQiKL2ShFhuAbJidmGfDmr8WpifQ0htQMmPu0xUTV
         MtL5uEliYRATE9v9aO85M7LhQkC/v6rQ5GwAuJMggyF3w8BjKu6IqSX9lwtlx9N13mL3
         SQJl9jFkOjd1CMijtZh8s69z4Xq6BCSFytuCIVQ7VSlAbOALDh3MtuyAA5TLvZIDAD/3
         EGa7uKgIxM/uiQeNeTHgofKG2OjiwhYIIJaDUl00eCNmcqGD2IBCtJWqpuT+VBy0uixi
         j+n2J8BW/4RrJjY+MrZj37dj+Vuk6agP4ZuBdPYvsVg7zHXq7WwOPSYZ0/NtGG1an4bf
         1jiQ==
X-Gm-Message-State: AOAM53016pj6T0UN4FQrda1AMvmkjwhl+k13JSJKV8GSdCDPPZMtb+yH
	JCXUrpgac/3nwE97hFEDLo+YV3av83CfsQ==
X-Google-Smtp-Source: ABdhPJxsVze+7CPBjiiJCkTXMubraguZn+uaW6KPjF1JYb7ZXgPmbxxxkPOKj18qskvMbNLHmHEoQQ==
X-Received: by 2002:a63:3e44:: with SMTP id l65mr8762040pga.262.1630870466060;
        Sun, 05 Sep 2021 12:34:26 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:a0f0::f40b? ([2601:646:9200:a0f0::f40b])
        by smtp.gmail.com with ESMTPSA id r8sm6232649pgp.30.2021.09.05.12.34.24
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 05 Sep 2021 12:34:25 -0700 (PDT)
Subject: Re: [oe] [PATCH 1/8] dlt-daemon: update to 2.18.5
To: openembedded-devel@lists.openembedded.org
References: <16A203540EAFA4F7.5565@lists.openembedded.org>
 <f4de895d-4e21-f2fb-a234-dded4e81a6f1@gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <e8678856-6325-b718-ae85-7f977a88b6bb@gmail.com>
Date: Sun, 5 Sep 2021 12:34:24 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <f4de895d-4e21-f2fb-a234-dded4e81a6f1@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit



On 9/5/21 12:22 PM, Armin Kuster wrote:
> well that wasn't expected.
> 
> these 8  are all against Dunfell

OK, so I guess you will line them up with your usual dunfell merge

> 
> -armin
> 
> On 9/5/21 12:21 PM, Armin Kuster via lists.openembedded.org wrote:
>> From: Gianfranco <costamagna.gianfranco@gmail.com>
>>
>>   - drop patch 204: upstream
>>   - add gcc-10 build fix proposed upstream 238.patch
>>
>> Signed-off-by: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
>> Signed-off-by: Gianfranco Costamagna <locutusofborg@debian.org>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> (cherry picked from commit 97092276dd453a4ef67aaec7bdcb0fb3cf1a5ca5)
>> [Stable version, bug fix only]
>> Signed-off-by: Scott Murray <scott.murray@konsulko.com>
>> Signed-off-by: Armin Kuster <akuster808@gmail.com>
>> ---
>>   .../dlt-daemon/dlt-daemon/204.patch           | 148 ------------------
>>   .../dlt-daemon/dlt-daemon/238.patch           |  35 +++++
>>   ...-daemon_2.18.4.bb => dlt-daemon_2.18.5.bb} |   4 +-
>>   3 files changed, 37 insertions(+), 150 deletions(-)
>>   delete mode 100644 meta-oe/recipes-extended/dlt-daemon/dlt-daemon/204.patch
>>   create mode 100644 meta-oe/recipes-extended/dlt-daemon/dlt-daemon/238.patch
>>   rename meta-oe/recipes-extended/dlt-daemon/{dlt-daemon_2.18.4.bb => dlt-daemon_2.18.5.bb} (97%)
>>
>> diff --git a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/204.patch b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/204.patch
>> deleted file mode 100644
>> index f0fc0bcb2c..0000000000
>> --- a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/204.patch
>> +++ /dev/null
>> @@ -1,148 +0,0 @@
>> -Upstream-Status: Submitted [https://github.com/GENIVI/dlt-daemon/pull/204]
>> -From 92830aff6e91041f574753d78da758c62981d9a4 Mon Sep 17 00:00:00 2001
>> -From: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
>> -Date: Sat, 25 Jan 2020 09:08:07 +0100
>> -Subject: [PATCH 1/3] dlt_user.h: fix build when musl is the libc
>> - implementation, by adding a missing include for pthread_t reference:
>> -
>> -see https://errors.yoctoproject.org/Errors/Details/308000/ for details
>> -
>> -Thanks Khem Raj <raj.khem@gmail.com> for the report
>> -
>> -Signed-off-by: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
>> -Signed-off-by: Gianfranco Costamagna <locutusofborg@debian.org>
>> ----
>> - include/dlt/dlt_user.h | 1 +
>> - 1 file changed, 1 insertion(+)
>> -
>> -diff --git a/include/dlt/dlt_user.h b/include/dlt/dlt_user.h
>> -index 69cb854..766d349 100644
>> ---- a/include/dlt/dlt_user.h
>> -+++ b/include/dlt/dlt_user.h
>> -@@ -74,6 +74,7 @@
>> -  \{
>> -  */
>> - #   include <mqueue.h>
>> -+#   include <pthread.h>
>> -
>> - #   if !defined (__WIN32__)
>> - #      include <semaphore.h>
>> -
>> -From 5f67aba02c12b7446e63ccc86285c13bc5c7a432 Mon Sep 17 00:00:00 2001
>> -From: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
>> -Date: Sat, 25 Jan 2020 09:16:14 +0100
>> -Subject: [PATCH 2/3] dlt-test-init-free: fix build failure with strict
>> - compiler flags, due to uint being undefined. This is actually an "int" type,
>> - looking at the test implementation
>> -
>> -Signed-off-by: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
>> -Signed-off-by: Gianfranco Costamagna <locutusofborg@debian.org>
>> ----
>> - src/tests/dlt-test-init-free.c | 4 ++--
>> - 1 file changed, 2 insertions(+), 2 deletions(-)
>> -
>> -diff --git a/src/tests/dlt-test-init-free.c b/src/tests/dlt-test-init-free.c
>> -index 96b5245..35b8803 100644
>> ---- a/src/tests/dlt-test-init-free.c
>> -+++ b/src/tests/dlt-test-init-free.c
>> -@@ -32,7 +32,7 @@
>> -
>> - void exec(const char *cmd, char *buffer, size_t length);
>> - void printMemoryUsage();
>> --char *occupyMemory(uint size);
>> -+char *occupyMemory(int size);
>> - void do_example_test();
>> - void do_dlt_test();
>> -
>> -@@ -131,7 +131,7 @@ void printMemoryUsage()
>> -     printf("%s", result);
>> - }
>> -
>> --char *occupyMemory(uint size)
>> -+char *occupyMemory(int size)
>> - {
>> -     char *buf = (char *)malloc(size * sizeof(char));
>> -
>> -
>> -From c790d61fad382e5d3e648ee99904087eb9bc4a77 Mon Sep 17 00:00:00 2001
>> -From: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
>> -Date: Sat, 25 Jan 2020 09:20:48 +0100
>> -Subject: [PATCH 3/3] sys/poll.h: deprecate old sys/poll.h include header, now
>> - glibc/musl wants poll.h being included directly. This fixes a build failure
>> - on musl systems with strict c hardening flags
>> -
>> -Signed-off-by: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
>> -Signed-off-by: Gianfranco Costamagna <locutusofborg@debian.org>
>> ----
>> - src/console/logstorage/dlt-logstorage-ctrl.c | 2 +-
>> - src/daemon/dlt_daemon_event_handler.c        | 2 +-
>> - src/daemon/dlt_daemon_event_handler.h        | 2 +-
>> - src/daemon/dlt_daemon_event_handler_types.h  | 2 +-
>> - src/lib/dlt_user.c                           | 2 +-
>> - 5 files changed, 5 insertions(+), 5 deletions(-)
>> -
>> -diff --git a/src/console/logstorage/dlt-logstorage-ctrl.c b/src/console/logstorage/dlt-logstorage-ctrl.c
>> -index 525c137..6614f44 100644
>> ---- a/src/console/logstorage/dlt-logstorage-ctrl.c
>> -+++ b/src/console/logstorage/dlt-logstorage-ctrl.c
>> -@@ -61,7 +61,7 @@
>> - #include <string.h>
>> - #include <getopt.h>
>> -
>> --#include <sys/poll.h>
>> -+#include <poll.h>
>> -
>> - #if defined(__linux__)
>> - #   include "sd-daemon.h"
>> -diff --git a/src/daemon/dlt_daemon_event_handler.c b/src/daemon/dlt_daemon_event_handler.c
>> -index 1611f7b..0d463da 100644
>> ---- a/src/daemon/dlt_daemon_event_handler.c
>> -+++ b/src/daemon/dlt_daemon_event_handler.c
>> -@@ -30,7 +30,7 @@
>> - #include <string.h>
>> - #include <errno.h>
>> -
>> --#include <sys/poll.h>
>> -+#include <poll.h>
>> - #include <syslog.h>
>> -
>> - #include "dlt_common.h"
>> -diff --git a/src/daemon/dlt_daemon_event_handler.h b/src/daemon/dlt_daemon_event_handler.h
>> -index eb96101..bd550d3 100644
>> ---- a/src/daemon/dlt_daemon_event_handler.h
>> -+++ b/src/daemon/dlt_daemon_event_handler.h
>> -@@ -25,7 +25,7 @@
>> -  * \file dlt_daemon_event_handler.h
>> -  */
>> -
>> --#include <sys/poll.h>
>> -+#include <poll.h>
>> -
>> - #include "dlt_daemon_connection_types.h"
>> - #include "dlt_daemon_event_handler_types.h"
>> -diff --git a/src/daemon/dlt_daemon_event_handler_types.h b/src/daemon/dlt_daemon_event_handler_types.h
>> -index 370e503..0b16d08 100644
>> ---- a/src/daemon/dlt_daemon_event_handler_types.h
>> -+++ b/src/daemon/dlt_daemon_event_handler_types.h
>> -@@ -25,7 +25,7 @@
>> -  * \file dlt_daemon_event_handler_types.h
>> -  */
>> -
>> --#include <sys/poll.h>
>> -+#include <poll.h>
>> -
>> - #include "dlt_daemon_connection_types.h"
>> -
>> -#diff --git a/src/lib/dlt_user.c b/src/lib/dlt_user.c
>> -#index ffa9b09..511f991 100644
>> -#--- a/src/lib/dlt_user.c
>> -#+++ b/src/lib/dlt_user.c
>> -#@@ -43,7 +43,7 @@
>> -# #include <errno.h>
>> -#
>> -# #include <sys/uio.h> /* writev() */
>> -#-#include <sys/poll.h>
>> -#+#include <poll.h>
>> -#
>> -# #include <limits.h>
>> -# #ifdef linux
>> diff --git a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/238.patch b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/238.patch
>> new file mode 100644
>> index 0000000000..14c44e6edd
>> --- /dev/null
>> +++ b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/238.patch
>> @@ -0,0 +1,35 @@
>> +From 214f8c71552fc096077f0b916dad75b31eefea3d Mon Sep 17 00:00:00 2001
>> +From: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
>> +Date: Fri, 31 Jul 2020 15:26:35 +0200
>> +Subject: [PATCH] dlt_offline: fix build failures with gcc-10
>> +
>> +see bug report: https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=957140
>> +
>> +/usr/bin/ld: CMakeFiles/dlt-daemon.dir/dlt_daemon_client.c.o:./obj-x86_64-linux-gnu/src/daemon/./src/offlinelogstorage/dlt_offline_logstorage.h:116: multiple definition of `g_logstorage_cache_max'; CMakeFiles/dlt-daemon.dir/dlt-daemon.c.o:./obj-x86_64-linux-gnu/src/daemon/./src/offlinelogstorage/dlt_offline_logstorage.h:116: first defined here
>> +/usr/bin/ld: CMakeFiles/dlt-daemon.dir/dlt_daemon_common.c.o:./obj-x86_64-linux-gnu/src/daemon/./src/offlinelogstorage/dlt_offline_logstorage.h:118: multiple definition of `g_logstorage_cache_size'; CMakeFiles/dlt-daemon.dir/dlt-daemon.c.o:./obj-x86_64-linux-gnu/src/daemon/./src/offlinelogstorage/dlt_offline_logstorage.h:118: first defined here
>> +/usr/bin/ld: CMakeFiles/dlt-daemon.dir/dlt_daemon_common.c.o:./obj-x86_64-linux-gnu/src/daemon/./src/offlinelogstorage/dlt_offline_logstorage.h:116: multiple definition of `g_logstorage_cache_max'; CMakeFiles/dlt-daemon.dir/dlt-daemon.c.o:./obj-x86_64-linux-gnu/src/daemon/./src/offlinelogstorage/dlt_offline_logstorage.h:116: first defined here
>> +/usr/bin/ld: CMakeFiles/dlt-daemon.dir/dlt_daemon_connection.c.o:./obj-x86_64-linux-gnu/src/daemon/./src/offlinelogstorage/dlt_offline_logstorage.h:118: multiple definition of `g_logstorage_cache_size'; CMakeFiles/dlt-daemon.dir/dlt-daemon.c.o:./obj-x86_64-linux-gnu/src/daemon/./src/offlinelogstorage/dlt_offline_logstorage.h:118: first defined here
>> +/usr/bin/ld: CMakeFiles/dlt-daemon.dir/dlt_daemon_connection.c.o:./obj-x86_64-linux-gnu/src/daemon/./src/offlinelogstorage/dlt_offline_logstorage.h:116: multiple definition of `g_logstorage_cache_max'; CMakeFiles/dlt-daemon.dir/dlt-daemon.c.o:./obj-x86_64-linux-gnu/src/daemon/./src/offlinelogstorage/dlt_offline_logstorage.h:116: first defined here
>> +/usr/bin/ld: CMakeFiles/dlt-daemon.dir/dlt_daemon_event_handler.c.o:./obj-x86_64-linux-gnu/src/daemon/./src/offlinelogstorage/dlt_offline_logstorage.h:118: multiple definition of `g_logstorage_cache_size'; CMakeFiles/dlt-daemon.dir/dlt-daemon.c.o:./obj-x86_64-linux-gnu/src/daemon/./src/offlinelogstorage/dlt_offline_logstorage.h:118: first defined here
>> +/usr/bin/ld: CMakeFiles/dlt-daemon.dir/dlt_daemon_event_handler.c.o:./obj-x86_64-linux-gnu/src/daemon/./src/offlinelogstorage/dlt_offline_logstorage.h:116: multiple definition of `g_logstorage_cache_max'; CMakeFiles/dlt-daemon.dir/dlt-daemon.c.o:./obj-x86_64-linux-gnu/src/daemon/./src/offlinelogstorage/dlt_offline_logstorage.h:116: first defined here
>> +/usr/bin/ld: CMakeFiles/dlt-daemon.dir/dlt_daemon_offline_logstorage.c.o:./obj-x86_64-linux-gnu/src/daemon/./src/offlinelogstorage/dlt_offline_logstorage.h:116: multiple definition of `g_logstorage_cache_max'; CMakeFiles/dlt-daemon.dir/dlt-daemon.c.o:./obj-x86_64-linux-gnu/src/daemon/./src/offlinelogstorage/dlt_offline_logstorage.h:116: first defined here
>> +---
>> + src/offlinelogstorage/dlt_offline_logstorage.h | 4 ++--
>> + 1 file changed, 2 insertions(+), 2 deletions(-)
>> +
>> +diff --git a/src/offlinelogstorage/dlt_offline_logstorage.h b/src/offlinelogstorage/dlt_offline_logstorage.h
>> +index b58da70..8ad84b8 100644
>> +--- a/src/offlinelogstorage/dlt_offline_logstorage.h
>> ++++ b/src/offlinelogstorage/dlt_offline_logstorage.h
>> +@@ -114,9 +114,9 @@
>> + #define DLT_OFFLINE_LOGSTORAGE_IS_STRATEGY_SET(S, s) ((S)&(s))
>> +
>> + /* logstorage max cache */
>> +-unsigned int g_logstorage_cache_max;
>> ++static unsigned int g_logstorage_cache_max;
>> + /* current logstorage cache size */
>> +-unsigned int g_logstorage_cache_size;
>> ++static unsigned int g_logstorage_cache_size;
>> +
>> + typedef struct
>> + {
>> diff --git a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.4.bb b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.5.bb
>> similarity index 97%
>> rename from meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.4.bb
>> rename to meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.5.bb
>> index 45724e98ac..33d5c696f3 100644
>> --- a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.4.bb
>> +++ b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.5.bb
>> @@ -17,10 +17,10 @@ DEPENDS = "zlib gzip-native"
>>   SRC_URI = "git://github.com/GENIVI/${BPN}.git;protocol=https \
>>       file://0002-Don-t-execute-processes-as-a-specific-user.patch \
>>       file://0004-Modify-systemd-config-directory.patch \
>> -    file://204.patch \
>>       file://275.patch \
>> +    file://238.patch \
>>   "
>> -SRCREV = "14ea971be7e808b9c5099c7f404ed3cf341873c4"
>> +SRCREV = "f1ac087c766827b1d0ed9c3a814b3cc052e948f2"
>>   
>>   S = "${WORKDIR}/git"
>>   
>>
>>
>>
> 
> 
> 
> 
> 
