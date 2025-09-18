Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 300C6CAC59A
	for <webhook@archiver.kernel.org>; Thu, 18 Sep 2025 11:42:13 +0000 (UTC)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
 by mx.groups.io with SMTP id smtpd.web10.11745.1758195726353010544
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 18 Sep 2025 04:42:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QPxhTART;
 spf=pass (domain: gmail.com, ip: 209.85.218.47, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-b0428b537e5so110469366b.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 18 Sep 2025 04:42:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758195725; x=1758800525; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QcqN0HJWUOrQ7dxlIUHx5e55wA4t33Ex5HKZXyiEdtw=;
        b=QPxhTART5uZN/No2Q1LjTNb1dXpD8nn5CeKm+tzxAKif02pLqvvmoIQ6X8ROP3ytrr
         dKyqsAvPL8mg5jQ9by02PwcHyQGyvSM1i2nvEPHcff0D3ShQOsnvLJvwcbbL6nJdsZ8k
         0H4kW/O7L/laxmP7e31iNsztKrFEsrykWrHbNvjW7lb5GGUEXw9HF8Ggwwq+cTUIkNpP
         z+K2YOfWhqMBH7fPZLM8uKQY2uVTXn512TtJjpVshsER+9c/jt3e/OP4ZLaeXgKRVFNB
         CMhqR9eR8LU16StYe+OntFDlZAlf3m9vzXNurq3xmOGHI+PPhvk56nIpEd/fr4OVxCYy
         S4GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758195725; x=1758800525;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QcqN0HJWUOrQ7dxlIUHx5e55wA4t33Ex5HKZXyiEdtw=;
        b=tuoUfeg0LslPGi6O0wx/+5l9OqFsayQ9efM13y7Vxz0KzrBmEFbK8BnpkDeX/zYWZL
         fXGgIsZjcvKB1vhuwfsuJ+4kTEmpaKB2QWvmaupX3Ik+Efg2+w6sbZA1/1T/pufFylQZ
         6SsVrvg8uMwv86YChaYRT6G3+5z1HpPhS4WtEZuO2F8f5YMd9S8uPw/4WCSFU7aScIDb
         jVNMkpGz647vjuDzKs3fGp2h/53LGcnKuPhngiDMNs8ByryNHxIQHifzavCWTVhCf6Dl
         dljUeaLvG/FLkCua0VP0Nc8CDVhQcg027bSJMFDqIpqjqgA4YVMhTYBefIqvHU4M3cak
         j6yw==
X-Gm-Message-State: AOJu0Yxfc2fWKzvf4sekhZ1/HijSdqFaFob6DRTmtjfqnnOZUT9gGyBJ
	jtzZP26kISq7W801B+Y/AavuSsWyilof7RUimp7R7ngay7aXku2jwiAO
X-Gm-Gg: ASbGnctgRgXJMZBQ2QIgLLxvtWkkY9xgcj0Ms6i1ev+oxZcnL2kRUlpNJKVKR+fxGJM
	gVIq7jt8bVbAWt1IUAB9Kk9iSNz/mVI7kOLZUsyeydaIiTz67Gx1qRdi3zlo4OpIVAo08TwEl9A
	ZFZxDsKdxqkoPF8aAzVeoPQ8NXuJ9kbzrEfK/dxqPPBELxTA5LAPEAF8jK6czkw7gVeT5p1rbW2
	5xIFkd4gNhE8zBmObkogk+Qsc9c6ZZW/N2WvolXyWItgiJqR7rmvmITFWrkOCPEyGeZwJVt+dwG
	sKAkQgd5ZOQ+8hj6C8jS1f4onCG8AX16ufuBll67qQ1e64c+6xwZaI225EEOyLIUm6S2yHXVfZs
	gzHHtJSQC8aVKyysQzHZ9G8VZIRfbiTkeVl12byUdPiZYNfRUbA==
X-Google-Smtp-Source: AGHT+IH4+t3tPbddU5z2PSurky9XC45HN0eFDj8vaK067SamBvaF6C0kSjE/0VPOf1K4W/pzcjTH2A==
X-Received: by 2002:a17:907:944f:b0:b04:616c:d759 with SMTP id a640c23a62f3a-b1bb5878890mr561137766b.24.1758195724443;
        Thu, 18 Sep 2025 04:42:04 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b1fd262993asm178923066b.94.2025.09.18.04.42.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Sep 2025 04:42:04 -0700 (PDT)
Message-ID: <810de34b-7ee1-4c35-b529-1f09325a2567@gmail.com>
Date: Thu, 18 Sep 2025 13:42:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][kirkstone][PATCH 02/10] pm-qa: fix build with
 gcc-15.0.1
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
References: <20250918112347.1331393-1-skandigraun@gmail.com>
 <20250918112347.1331393-2-skandigraun@gmail.com>
 <CA+chaQcE=y-WZfEWH2whYpJF8_RXX8R3cizFZF1hxeQehU4uCg@mail.gmail.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <CA+chaQcE=y-WZfEWH2whYpJF8_RXX8R3cizFZF1hxeQehU4uCg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 18 Sep 2025 11:42:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119571

On 9/18/25 13:28, Martin Jansa wrote:
> Do we need these fixed for gcc-15 in kirkstone? At least for target
> recipes which will use gcc from OE not the native from host. I've sent
> couple fixes for scarthgap and walnascar for components with native in
> BBCLASSEXTEND (which were failing on my host with gcc-15), but for
> target it isn't needed, right? Unless you did it just to more easily
> cherry-pick some later fixes which are needed in kirkstone.
Thanks for reviewing.
Trying to bring some recipes gradually to be closer to master regarding
fixes (within the frame of stable branch rules).
Mostly I'm trying to cherry pick useful commits bugfixes and version
bumps that look useful and I can also at least test build.

This commit wasn't picked specifically to make later cherry-picking
easier, it just looks like a generic fix, coming from upstream - but I
can be convinced about this one if it should stay out of this branch.

> On Thu, Sep 18, 2025 at 1:23 PM Gyorgy Sarvari via
> lists.openembedded.org <skandigraun=gmail.com@lists.openembedded.org>
> wrote:
>> From: "mark.yang" <mark.yang@lge.com>
>>
>> * fix following error:
>>   http://errors.yoctoproject.org/Errors/Details/850314
>>     utils/uevent_reader.c: In function 'main':
>>     utils/uevent_reader.c:33:24: error: passing argument 2 of 'signal' from incompatible pointer type [-Wincompatible-pointer-types]
>>     33 |         signal(SIGINT, exit_handler);
>>         |                        ^~~~~~~~~~~~
>>         |                        |
>>         |                        void (*)(void)
>>     In file included from utils/uevent_reader.c:4:
>>     TOPDIR/tmp/work/core2-64-oe-linux/pm-qa/0.5.2/recipe-sysroot/usr/include/signal.h:88:57: note: expected '__sighandler_t' {aka 'void (*)(int)'} but argument is of type 'void (*)(void)'
>>     88 | extern __sighandler_t signal (int __sig, __sighandler_t __handler)
>>         |                                          ~~~~~~~~~~~~~~~^~~~~~~~~
>>     utils/uevent_reader.c:15:6: note: 'exit_handler' declared here
>>     15 | void exit_handler()
>>         |      ^~~~~~~~~~~~
>>     TOPDIR/tmp/work/core2-64-oe-linux/pm-qa/0.5.2/recipe-sysroot/usr/include/signal.h:72:16: note: '__sighandler_t' declared here
>>     72 | typedef void (*__sighandler_t) (int);
>>         |                ^~~~~~~~~~~~~~
>>     make: *** [<builtin>: utils/uevent_reader] Error 1
>>
>>   Set PATCHTOOL to git because this recipe compiles all .c files including those in .pc/ directory which causes build errors.
>>   .pc/0001-fix-build-with-gcc-15-Wincompatible-pointer-types-er.patch/utils/uevent_reader.c:15:6: note: 'exit_handler' declared here
>>    15 | void exit_handler()
>>
>> Signed-off-by: mark.yang <mark.yang@lge.com>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> (cherry picked from commit a0b88afd798221b0751fc506e6ea224cd6745ec7)
>> Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
>> ---
>>  ...cc-15-Wincompatible-pointer-types-er.patch | 69 +++++++++++++++++++
>>  meta-oe/recipes-test/pm-qa/pm-qa_git.bb       |  7 +-
>>  2 files changed, 75 insertions(+), 1 deletion(-)
>>  create mode 100644 meta-oe/recipes-test/pm-qa/pm-qa/0001-fix-build-with-gcc-15-Wincompatible-pointer-types-er.patch
>>
>> diff --git a/meta-oe/recipes-test/pm-qa/pm-qa/0001-fix-build-with-gcc-15-Wincompatible-pointer-types-er.patch b/meta-oe/recipes-test/pm-qa/pm-qa/0001-fix-build-with-gcc-15-Wincompatible-pointer-types-er.patch
>> new file mode 100644
>> index 0000000000..7efd8dd71a
>> --- /dev/null
>> +++ b/meta-oe/recipes-test/pm-qa/pm-qa/0001-fix-build-with-gcc-15-Wincompatible-pointer-types-er.patch
>> @@ -0,0 +1,69 @@
>> +From b6b968d1c8fbba79b33d63874b551225e663435e Mon Sep 17 00:00:00 2001
>> +From: "mark.yang" <mark.yang@lge.com>
>> +Date: Wed, 2 Apr 2025 16:59:00 +0900
>> +Subject: [PATCH] fix build with gcc-15 -Wincompatible-pointer-types error
>> +
>> +See more details: http://errors.yoctoproject.org/Errors/Details/850314
>> +utils/uevent_reader.c:33:24: error: passing argument 2 of 'signal' from incompatible pointer type [-Wincompatible-pointer-types]
>> +   33 |         signal(SIGINT, exit_handler);
>> +      |                        ^~~~~~~~~~~~
>> +      |                        |
>> +      |                        void (*)(void)
>> +In file included from utils/uevent_reader.c:4:
>> +TOPDIR/tmp/work/core2-64-oe-linux/pm-qa/0.5.2/recipe-sysroot/usr/include/signal.h:88:57: note: expected '__sighandler_t' {aka 'void (*)(int)'} but argument is of type 'void (*)(void)'
>> +   88 | extern __sighandler_t signal (int __sig, __sighandler_t __handler)
>> +      |                                          ~~~~~~~~~~~~~~~^~~~~~~~~
>> +utils/uevent_reader.c:15:6: note: 'exit_handler' declared here
>> +   15 | void exit_handler()
>> +      |      ^~~~~~~~~~~~
>> +TOPDIR/tmp/work/core2-64-oe-linux/pm-qa/0.5.2/recipe-sysroot/usr/include/signal.h:72:16: note: '__sighandler_t' declared here
>> +   72 | typedef void (*__sighandler_t) (int);
>> +      |                ^~~~~~~~~~~~~~
>> +
>> +* Set the parameter of exit_handler() to int.
>> +  Changed to use exit_handler(0).
>> +  The parameter is not used inside exit_handler() anyway.
>> +
>> +Upstream-Status: Inactive-Upstream [lastrelease: 6 years ago]
>> +Signed-off-by: mark.yang <mark.yang@lge.com>
>> +---
>> + utils/uevent_reader.c | 8 ++++----
>> + 1 file changed, 4 insertions(+), 4 deletions(-)
>> +
>> +diff --git a/utils/uevent_reader.c b/utils/uevent_reader.c
>> +index afbb426..75d445c 100644
>> +--- a/utils/uevent_reader.c
>> ++++ b/utils/uevent_reader.c
>> +@@ -12,7 +12,7 @@
>> +
>> + FILE *fp;
>> +
>> +-void exit_handler()
>> ++void exit_handler(int sig)
>> + {
>> +       fprintf(stdout, "exiting from uevent reader...\n");
>> +       fclose(fp);
>> +@@ -42,20 +42,20 @@ int main(int argc, char *argv[])
>> +       pfd.fd = socket(PF_NETLINK, SOCK_DGRAM, NETLINK_KOBJECT_UEVENT);
>> +       if (pfd.fd == -1) {
>> +               perror("error: socket()");
>> +-              exit_handler();
>> ++              exit_handler(0);
>> +       }
>> +
>> +       if (bind(pfd.fd, (struct sockaddr *) &nls,
>> +                               sizeof(struct sockaddr_nl))) {
>> +               perror("error : bind()");
>> +-              exit_handler();
>> ++              exit_handler(0);
>> +       }
>> +
>> +       while (-1 != poll(&pfd, 1, -1)) {
>> +               int i, len = recv(pfd.fd, buf, sizeof(buf), MSG_DONTWAIT);
>> +               if (len == -1) {
>> +                       perror("error : recv()");
>> +-                      exit_handler();
>> ++                      exit_handler(0);
>> +               }
>> +
>> +               i = 0;
>> diff --git a/meta-oe/recipes-test/pm-qa/pm-qa_git.bb b/meta-oe/recipes-test/pm-qa/pm-qa_git.bb
>> index fc21e6192e..5cb51cb9eb 100644
>> --- a/meta-oe/recipes-test/pm-qa/pm-qa_git.bb
>> +++ b/meta-oe/recipes-test/pm-qa/pm-qa_git.bb
>> @@ -10,12 +10,17 @@ BRANCH ?= "master"
>>
>>  SRCREV = "05710ec5032be4c8edafb4109d4d908d31243906"
>>
>> -SRC_URI = "git://git.linaro.org/power/pm-qa.git;protocol=git;branch=${BRANCH}"
>> +SRC_URI = " \
>> +    git://git.linaro.org/power/pm-qa.git;protocol=git;branch=${BRANCH} \
>> +    file://0001-fix-build-with-gcc-15-Wincompatible-pointer-types-er.patch \
>> +"
>>
>>  S = "${WORKDIR}/git"
>>
>>  CFLAGS += "-pthread"
>>
>> +PATCHTOOL = "git"
>> +
>>  do_compile () {
>>      # Find all the .c files in this project and build them.
>>      for x in `find . -name "*.c"`
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#119561): https://lists.openembedded.org/g/openembedded-devel/message/119561
>> Mute This Topic: https://lists.openembedded.org/mt/115308032/3617156
>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [martin.jansa@gmail.com]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>


