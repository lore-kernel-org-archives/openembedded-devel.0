Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2127CFB43F
	for <webhook@archiver.kernel.org>; Sun,  6 Oct 2024 10:54:04 +0000 (UTC)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
 by mx.groups.io with SMTP id smtpd.web10.29012.1728212035981937019
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 06 Oct 2024 03:53:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VjoDGznQ;
 spf=pass (domain: gmail.com, ip: 209.85.128.178, mailfrom: akuster808@gmail.com)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-6e2e4d1c992so4551217b3.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 06 Oct 2024 03:53:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728212035; x=1728816835; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=QRBpyob5B3oAH/gNhHoeW2S0SEbVguhxATZ4Tr/PwlA=;
        b=VjoDGznQ/5Opv+NNAQQFPNPBbn71iIT0jvRwyweXRHVHsUzgPEiWYFsa2GzbzpEGGZ
         zte266Rkp7RBmNYRLNQm4WqR3qtvfJunyb4D+TpnTZcTBv84pL8FJa8XYBtFzYl54Z6I
         Bba1+0tofGAea4LG/8iJDP36esjyPLVqOJF2GAZeyBikvLCmTtd6KSEUuzx7Tgd0JcEV
         M8MNmlCuK1OB+sSYIXUZVdGeleHRwQ3a9gs4yLwD3KpFSUIrsmMW+4cZZLsghK30dZ2N
         Nuglu081+yjtwAUgn5erVy4IVRN2xZh0qxvjFXleuZRZ22EGczuVl7g51YnLJ0lR6jaW
         OGLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728212035; x=1728816835;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QRBpyob5B3oAH/gNhHoeW2S0SEbVguhxATZ4Tr/PwlA=;
        b=xO+PuXM83GKTzlCZ3cvqXXVJLISHRvBomzWY3uN1YgZNyLA3PcEVh3Z4QeMOoAMSmj
         2/jGerO68GP1JNgFE0IW5WWBhF88qL9FR46+j5ocHXrs1iJDlgvKbZo8N8Wg9PQNWGf+
         v7adNUpT/1R34DI9LDe3YiPQzNgYDmyqG51Sbv21WzujKpjrrl7/axBUwrrVFkZpUB8+
         dRIhVWaj8DPRbXDlwQsAqCksBmGTv1G0i4jnadfH64q7d774/DfAVX2WYGwOfxobYn58
         RHz89ZFN0UfkXFj4WsUerNg5GwIsrANeU0i+165njOxNKK2ZUrCICrGfCCz0qW4D1X2+
         Mp2Q==
X-Forwarded-Encrypted: i=1; AJvYcCXTAu0Pw7bETaJUCKM67gyJTym9OfaHtXhnH8rmEtUq5CT9XbSOH0GGjz8ns0DjWdvsSjLgIFZfXwFyyTFtmF8uAnQ=@lists.openembedded.org
X-Gm-Message-State: AOJu0YxJ2a/LtWcqyWc8ohrhF5D2qp4C+6ZON9DLff9tUyNXxCKB1SQP
	GwhUkReBKICKsjg8wuxQAm2pyJhIgyz8CrrJthbLTzL1vcFf3JYaAYc3LQ==
X-Google-Smtp-Source: AGHT+IEBqup2xmnZ/4baTJ74t6ETkMQgICiKzJhH7BPwVm9hVcbkuHNV6n4DiPbHssxulCxX4zPIDQ==
X-Received: by 2002:a05:690c:63c2:b0:6db:d02f:b2c4 with SMTP id 00721157ae682-6e2b534c570mr94498677b3.7.1728212034950;
        Sun, 06 Oct 2024 03:53:54 -0700 (PDT)
Received: from ?IPV6:2600:1700:45dd:7000:8a15:aa34:73ec:b252? ([2600:1700:45dd:7000:8a15:aa34:73ec:b252])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e2d927f26dsm6348807b3.33.2024.10.06.03.53.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 06 Oct 2024 03:53:54 -0700 (PDT)
Message-ID: <e91c9820-4710-41da-ac05-aac03a124d88@gmail.com>
Date: Sun, 6 Oct 2024 06:53:53 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [kirkstone][meta-python][PATCH] python3-setproctitle: Add
 new recipe
To: mingli.yu@eng.windriver.com, openembedded-devel@lists.openembedded.org
References: <20240929072744.1929825-1-mingli.yu@windriver.com>
Content-Language: en-US
From: akuster808 <akuster808@gmail.com>
Autocrypt: addr=akuster808@gmail.com; keydata=
 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
 ApZ86eOP
In-Reply-To: <20240929072744.1929825-1-mingli.yu@windriver.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 06 Oct 2024 10:54:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112679




On 9/29/24 3:27 AM, Yu, Mingli via lists.openembedded.org wrote:
> From: Mingli Yu <mingli.yu@windriver.com>
>
> A Python module to customize the process title.

Adding new recipes to a stable branch is outside the policy. Is there a 
reason I should?

BR,
Armin
>   # ./run-ptest
> PASS: tests/module_test.py::test_no_import_side_effect
> PASS: tests/module_test.py::test_version
> PASS: tests/module_test.py::test_c_extension_built
> PASS: tests/setproctitle_test.py::test_runner
> PASS: tests/setproctitle_test.py::test_init_getproctitle
> PASS: tests/setproctitle_test.py::test_setproctitle
> tests/setproctitle_test.py::test_setproctitle_darwin SKIPPED (Mac on...)
> PASS: tests/setproctitle_test.py::test_prctl
> PASS: tests/setproctitle_test.py::test_getproctitle
> PASS: tests/setproctitle_test.py::test_kwarg
> PASS: tests/setproctitle_test.py::test_environ
> PASS: tests/setproctitle_test.py::test_issue_8
> PASS: tests/setproctitle_test.py::test_large_cmdline
> PASS: tests/setproctitle_test.py::test_weird_args
> PASS: tests/setproctitle_test.py::test_weird_path
> PASS: tests/setproctitle_test.py::test_embedded
> PASS: tests/setproctitle_test.py::test_embedded_many_args
> PASS: tests/setproctitle_test.py::test_noenv
> PASS: tests/setproctitle_test.py::test_large_env
> PASS: tests/setproctitle_test.py::test_clear_segfault
> PASS: tests/setproctitle_test.py::test_fork_segfault
> PASS: tests/setproctitle_test.py::test_thread_fork_segfault
> PASS: tests/setthreadtitle_test.py::test_thread_title_unchanged
> PASS: tests/setthreadtitle_test.py::test_set_thread_title
> PASS: tests/setthreadtitle_test.py::test_set_threads_title
>
> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> ---
>   ...0001-conftest.py-Make-embed-avaiable.patch | 45 +++++++++++++++++++
>   .../python/python3-setproctitle/run-ptest     |  4 ++
>   .../python/python3-setproctitle_1.3.3.bb      | 34 ++++++++++++++
>   3 files changed, 83 insertions(+)
>   create mode 100644 meta-python/recipes-devtools/python/python3-setproctitle/0001-conftest.py-Make-embed-avaiable.patch
>   create mode 100644 meta-python/recipes-devtools/python/python3-setproctitle/run-ptest
>   create mode 100644 meta-python/recipes-devtools/python/python3-setproctitle_1.3.3.bb
>
> diff --git a/meta-python/recipes-devtools/python/python3-setproctitle/0001-conftest.py-Make-embed-avaiable.patch b/meta-python/recipes-devtools/python/python3-setproctitle/0001-conftest.py-Make-embed-avaiable.patch
> new file mode 100644
> index 000000000..5de07de03
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-setproctitle/0001-conftest.py-Make-embed-avaiable.patch
> @@ -0,0 +1,45 @@
> +From ce7430f6252ce69af0699dc376662b5b1dc00b96 Mon Sep 17 00:00:00 2001
> +From: Mingli Yu <mingli.yu@windriver.com>
> +Date: Fri, 27 Sep 2024 10:56:32 +0000
> +Subject: [PATCH] conftest.py: Make --embed avaiable
> +
> +Though --embed exists in the help message as below.
> + $ /usr/bin/python3.10-config --help
> + Usage: /usr/bin/python3.10-config [--prefix|--exec-prefix|--includes|--libs|--cflags|--ldflags|--extension-suffix|--help|--abiflags|--configdir|--embed
> +
> + # https://github.com/dvarrazzo/py-setproctitle/issues/142
> + But has_embed which indicates if the help includes "--embed"
> + provides a wrong check as beow.
> + >>> import subprocess
> + >>> subprocess.check_output(["/usr/bin/python3.10-config", "--help"])
> +Usage: /usr/bin/python3.10-config [--prefix|--exec-prefix|--includes|--libs|--cflags|--ldflags|--extension-suffix|--help|--abiflags|--configdir|--embed]
> + b''
> + >>> help = subprocess.check_output(["/usr/bin/python3.10-config", "--help"])
> + >>> has_embed = b"--embed" in help
> +
> +So make sure --embed avaiable to fix the gap.
> +
> +Upstream-Status: Inappropriate [oe specific]
> +
> +Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> +---
> + tests/conftest.py | 3 +--
> + 1 file changed, 1 insertion(+), 2 deletions(-)
> +
> +diff --git a/tests/conftest.py b/tests/conftest.py
> +index 6e15988..b01e2bd 100644
> +--- a/tests/conftest.py
> ++++ b/tests/conftest.py
> +@@ -84,8 +84,7 @@ def pyconfig():
> +
> +     def pyconfig_func(opt):
> +         cmdline = [pyconfexe, f"--{opt}"]
> +-        if has_embed:
> +-            cmdline.append("--embed")
> ++        cmdline.append("--embed")
> +         bout = sp.check_output(cmdline)
> +         out = bout.decode(
> +             sys.getfilesystemencoding()  # sounds like a good bet
> +--
> +2.35.5
> +
> diff --git a/meta-python/recipes-devtools/python/python3-setproctitle/run-ptest b/meta-python/recipes-devtools/python/python3-setproctitle/run-ptest
> new file mode 100644
> index 000000000..8bedb66d4
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-setproctitle/run-ptest
> @@ -0,0 +1,4 @@
> +#!/bin/sh
> +
> +# https://github.com/dvarrazzo/py-setproctitle/issues/141
> +pytest -k 'not test_unicode' -o log_cli=true -o log_cli_level=INFO | sed -e 's/\[...%\]//g'| sed -e 's/PASSED/PASS/g'| sed -e 's/FAILED/FAIL/g'|sed -e 's/SKIPED/SKIP/g'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS"){printf "%s: %s\n", $NF, $0}else{print}}'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS") {$NF="";print $0}else{print}}'
> diff --git a/meta-python/recipes-devtools/python/python3-setproctitle_1.3.3.bb b/meta-python/recipes-devtools/python/python3-setproctitle_1.3.3.bb
> new file mode 100644
> index 000000000..01e9d21cd
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-setproctitle_1.3.3.bb
> @@ -0,0 +1,34 @@
> +SUMMARY = "A Python module to customize the process title"
> +DESCRIPTION = "The setproctitle module allows a process to change its \
> +title (as displayed by system tools such as ps, top or MacOS Activity \
> +Monitor)."
> +HOMEPAGE = "https://github.com/dvarrazzo/py-setproctitle"
> +BUGTRACKER = "https://github.com/dvarrazzo/py-setproctitle/issues"
> +LICENSE = "BSD-3-Clause"
> +LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=86d2d41b5f4f023f43466f8cb7adebaa"
> +
> +inherit pypi setuptools3 ptest
> +
> +SRC_URI[sha256sum] = "c913e151e7ea01567837ff037a23ca8740192880198b7fbb90b16d181607caae"
> +
> +SRC_URI += " \
> +    file://0001-conftest.py-Make-embed-avaiable.patch \
> +    file://run-ptest \
> +"
> +
> +RDEPENDS:${PN}-ptest += "\
> +    packagegroup-core-buildessential \
> +    procps-ps \
> +    python3-dev \
> +    python3-multiprocessing \
> +    ${PYTHON_PN}-pytest \
> +"
> +
> +do_install_ptest() {
> +    install -d ${D}${PTEST_PATH}/tests
> +    cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
> +}
> +
> +BBCLASSEXTEND = "native nativesdk"
> +
> +INSANE_SKIP:${PN}-ptest = "dev-deps"
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#112549): https://lists.openembedded.org/g/openembedded-devel/message/112549
> Mute This Topic: https://lists.openembedded.org/mt/108715471/3616698
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [akuster808@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


