Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com [209.85.222.194])
 by mx.groups.io with SMTP id smtpd.web10.3787.1600194674590115400
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 15 Sep 2020 11:31:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=oMs4e0X1;
 spf=pass (domain: gmail.com, ip: 209.85.222.194, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f194.google.com with SMTP id w186so5351969qkd.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 15 Sep 2020 11:31:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=PDzBE0OK7mNd3Ui64jkZsp1bA0JcUgJ9dVUearL7WtU=;
        b=oMs4e0X1FGCr9XMn6EoeGaMYzg9riqwcXaQ7Me+BuQ9vLb7BcKS2jUFVDRb4Z3LX+S
         dlFPJF5VmX6J0NYXltGRsp0G4TgluF+572IUztrR0lbCjWuzH5uXo1luPZq3nnD7BAj4
         P8f+99G1qIWYosrISZCjd7DQGji5kiabRlxqCTlqDESky03uAViBAdouKYKPTmPAaWyQ
         a3j7qR0JjrKBI5MQxdrKjM0wmrdqZY8Y5bxzHZfZzgrvDQdQgdt7Z7NCEnpQg4kBwzH+
         2pkminYeOY9sDpFtIgoG3B74L2gOG+wynR3YfXYnLrperlfyYb2P1SrtvKXD3ma/9Cyv
         oADQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PDzBE0OK7mNd3Ui64jkZsp1bA0JcUgJ9dVUearL7WtU=;
        b=RPCACMtCwNs5x8P9p98KeJiT8wzz6+WEXV5vdsAAUcJhkfzw54Lwdcf1tD++gIZCaS
         aJlQsC3GegrYIPkGDihMXhmCzbT1bh2pREC+LlMZ4QH+0JquPN8wwuN0TF6Avn7lsASA
         ux94zatJVt1OIJu+YwO6nQ+2YA63rPmz1SkFFLCNaOdqyIf6DaeGoBIcn9TzwF/G/xdW
         0C3VxnXnjP+J8sGkbzZ62qbz5KaTYs8ISUKSKgFdBfPJMx44MdKZqx2K+Z9b/0iiiM9Q
         w6HEfPOwSesWwuFlu8LhI0f9mZQHemlBK5RfykRuqgnm6z2p6bpd9V6FAU9zO6QJUNwB
         z8eA==
X-Gm-Message-State: AOAM530OODVP5Hu6bbXPeJbzT5XCR+jBNweGExth8z4+nUhWK2St793w
	dujCu1TgZvoDlzKWPypCU+DEdlaXLMhdqXUc1v0=
X-Google-Smtp-Source: ABdhPJxOkur57IfvFUq1ZLIi5f/IVQr27I1hIBlpgsjlQ1CSAgwNWzPTiNr2mJ/0c8dCGq0rrd01CnXigD3HKqxk6C8=
X-Received: by 2002:a05:620a:13f6:: with SMTP id h22mr20177434qkl.9.1600194673525;
 Tue, 15 Sep 2020 11:31:13 -0700 (PDT)
MIME-Version: 1.0
References: <1599830746-15250-1-git-send-email-zangrc.fnst@cn.fujitsu.com> <CA+chaQejzHcC14r5mxRMMmKR5wWnpEBmwzK0Zp=YFhRv+4eTtw@mail.gmail.com>
In-Reply-To: <CA+chaQejzHcC14r5mxRMMmKR5wWnpEBmwzK0Zp=YFhRv+4eTtw@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Tue, 15 Sep 2020 11:30:47 -0700
Message-ID: <CAMKF1srH9Zeck79EZZ1SL-kUg2ifsZdrRfSO8NTcx-R7EWcpAg@mail.gmail.com>
Subject: Re: [oe] [meta-oe] [PATCH] libhugetlbfs: upgrade 2.22 -> 2.23
To: Martin Jansa <Martin.Jansa@gmail.com>
Cc: zangrc <zangrc.fnst@cn.fujitsu.com>, 
	openembedded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, Sep 15, 2020 at 9:44 AM Martin Jansa <Martin.Jansa@gmail.com> wrote:
>
> This is somehow causing strip to fail when building for arm (I'm seeing it e.g. in raspberrypi4 builds):
>
> ERROR: libhugetlbfs-1_2.23-r0 do_populate_sysroot: Fatal errors occurred in subprocesses:
> Command '['arm-oe-linux-gnueabi-strip', '--remove-section=.comment', '--remove-section=.note', 'libhugetlbfs/1_2.23-r0/sysroot-destdir/usr/lib/libhugetlbfs/tests/obj32/linkhuge_rw']' returned non-zero exit status 1.
> Subprocess output:arm-oe-linux-gnueabi-strip: libhugetlbfs/1_2.23-r0/sysroot-destdir/usr/lib/libhugetlbfs/tests/obj32/stmuFa58: error: PHDR segment not covered by LOAD segment
> arm-oe-linux-gnueabi-strip: libhugetlbfs/1_2.23-r0/sysroot-destdir/usr/lib/libhugetlbfs/tests/obj32/stmuFa58[.interp]: file format not recognized
>

I wonder if this file has specific linker script used to do linking ?

> It might be reproducible only with ld-is-gold in DISTRO_FEATURES.
>
> Can you please look into that?
>
>
> On Fri, Sep 11, 2020 at 3:25 AM zangrc <zangrc.fnst@cn.fujitsu.com> wrote:
>>
>> 0001-tests-add-explicit-permissions-to-open-call.patch
>> Removed since this is included in 2.23
>>
>> Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
>> ---
>>  ...dd-explicit-permissions-to-open-call.patch | 41 -------------------
>>  .../libhugetlbfs/libhugetlbfs_git.bb          |  5 +--
>>  2 files changed, 2 insertions(+), 44 deletions(-)
>>  delete mode 100644 meta-oe/recipes-benchmark/libhugetlbfs/files/0001-tests-add-explicit-permissions-to-open-call.patch
>>
>> diff --git a/meta-oe/recipes-benchmark/libhugetlbfs/files/0001-tests-add-explicit-permissions-to-open-call.patch b/meta-oe/recipes-benchmark/libhugetlbfs/files/0001-tests-add-explicit-permissions-to-open-call.patch
>> deleted file mode 100644
>> index 9d52b908e..000000000
>> --- a/meta-oe/recipes-benchmark/libhugetlbfs/files/0001-tests-add-explicit-permissions-to-open-call.patch
>> +++ /dev/null
>> @@ -1,41 +0,0 @@
>> -From d07d2f9601b49bb72cd4b36838f0c238bd1b0fc1 Mon Sep 17 00:00:00 2001
>> -From: Khem Raj <raj.khem@gmail.com>
>> -Date: Wed, 15 Jan 2020 18:45:09 -0800
>> -Subject: [PATCH] tests: add explicit permissions to open() call
>> -
>> -Fixes
>> -gethugepagesizes.c:227:35: error: open with O_CREAT in second argument needs 3 arguments
>> -|         fd = open(fname, O_WRONLY|O_CREAT);
>> -|                                          ^
>> -
>> -Upstream-Status: Submitted [https://groups.google.com/forum/#!topic/libhugetlbfs/anNtDXbQKro]
>> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ----
>> - tests/gethugepagesizes.c | 4 ++--
>> - 1 file changed, 2 insertions(+), 2 deletions(-)
>> -
>> -diff --git a/tests/gethugepagesizes.c b/tests/gethugepagesizes.c
>> -index 9551b38..5777265 100644
>> ---- a/tests/gethugepagesizes.c
>> -+++ b/tests/gethugepagesizes.c
>> -@@ -223,7 +223,7 @@ void setup_fake_data(long sizes[], int n_elem)
>> -               FAIL("mkdtemp: %s", strerror(errno));
>> -
>> -       sprintf(fname, "%s/meminfo-none", fake_meminfo);
>> --      fd = open(fname, O_WRONLY|O_CREAT);
>> -+      fd = open(fname, O_WRONLY|O_CREAT, 0600);
>> -       if (fd < 0)
>> -               FAIL("open: %s", strerror(errno));
>> -       if (write(fd, meminfo_base,
>> -@@ -233,7 +233,7 @@ void setup_fake_data(long sizes[], int n_elem)
>> -               FAIL("close: %s", strerror(errno));
>> -
>> -       sprintf(fname, "%s/meminfo-hugepages", fake_meminfo);
>> --      fd = open(fname, O_WRONLY|O_CREAT);
>> -+      fd = open(fname, O_WRONLY|O_CREAT, 0600);
>> -       if (fd < 0)
>> -               FAIL("open: %s", strerror(errno));
>> -       if (write(fd, meminfo_base,
>> ---
>> -2.25.0
>> -
>> diff --git a/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb b/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb
>> index 4768d7b63..b349096ec 100644
>> --- a/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb
>> +++ b/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb
>> @@ -7,10 +7,10 @@ DEPENDS = "sysfsutils"
>>  RDEPENDS_${PN} += "bash python3-core"
>>  RDEPENDS_${PN}-tests += "bash python3-core"
>>
>> -PV = "2.22"
>> +PV = "2.23"
>>  PE = "1"
>>
>> -SRCREV = "e6499ff92b4a7dcffbd131d1f5d24933e48c3f20"
>> +SRCREV = "6b126a4d7da9490fa40fe7e1b962edcb939feddc"
>>  SRC_URI = " \
>>      git://github.com/libhugetlbfs/libhugetlbfs.git;protocol=https \
>>      file://skip-checking-LIB32-and-LIB64-if-they-point-to-the-s.patch \
>> @@ -24,7 +24,6 @@ SRC_URI = " \
>>      file://0004-shm.c-Mark-glibc-specific-changes-so.patch \
>>      file://0005-Include-dirent.h-for-ino_t.patch \
>>      file://0006-include-limits.h-for-PATH_MAX.patch \
>> -    file://0001-tests-add-explicit-permissions-to-open-call.patch \
>>      file://0001-huge_page_setup_helper-use-python3-interpreter.patch \
>>  "
>>
>> --
>> 2.25.1
>>
>>
>>
>>
> 
