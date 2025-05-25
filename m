Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6626CC54ED0
	for <webhook@archiver.kernel.org>; Sun, 25 May 2025 18:27:06 +0000 (UTC)
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
 by mx.groups.io with SMTP id smtpd.web11.14084.1748197621858333074
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 25 May 2025 11:27:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HwfOEyvM;
 spf=pass (domain: gmail.com, ip: 209.85.219.177, mailfrom: akuster808@gmail.com)
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-e7da171c504so447652276.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 25 May 2025 11:27:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748197621; x=1748802421; darn=lists.openembedded.org;
        h=content-transfer-encoding:autocrypt:subject:from:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nD7TgSW8ouBcS0FimJT0kdY4/WgPPgOOCi+Ame8NT4I=;
        b=HwfOEyvMeqPjuKdDrXTsbcY6RPR4tsBw7D2YWjwA3suR1xRRkMKAe1nvDiZVyFeT0R
         NkQyzqTUHjwsYzUYfhUxokB1RqfDKxg4F/YBdgnkvZOfbZvKb67acbs7Ww1qWtnM1IvD
         TzCq9hj2wVDIvWI+ejGfzCB1cd0ln/7ggFB2dBjblqVmOkiOgWT3ra3o6I0cYV6XBUhz
         nmRvKQunQbfC09+jI+AFBpWAJZsiQlmmQmtc9LOUliBx+YJslFFvkzCI+dG82HKsGKIn
         Pr4osxpWCb0S9aOD1uIjIf58mL+ku5FUXwbqIGkE8m9yCYqkjeBnkWtK14fh5UUV0ERR
         9KDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748197621; x=1748802421;
        h=content-transfer-encoding:autocrypt:subject:from:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nD7TgSW8ouBcS0FimJT0kdY4/WgPPgOOCi+Ame8NT4I=;
        b=vJFdcjSEGu25kcnZ+zVaSkMFjS4UDxDmqK33g3v0xurqCpfZcSLTpq74HKWKyBfvQb
         55skKBYUpe+PM4dLXpT6WzEFZdU3fs4xUhIoVD/3cnzsiReOJVdKlxXe7urCPOGonaJ6
         8rBS4CWMx7pRACO8/7VcZJHfwYOoiH/Xja/Y0ctLtWGlK9QnLdXApJZFGfbC/Bx4u+H6
         XKZBFufrYflpqC9uLb39y+dfQdOzb4P2Ocjjbo7MSVjFQjc9OOSRcsp2RLQbImqTaKXz
         dkJTluVC7GGJkj/0lr5EFzCIAB8sO2Mi3gV6LLpNTM3l1nuxMZw99eH7xXgxWrD7OLcb
         kLKw==
X-Forwarded-Encrypted: i=1; AJvYcCVt6dPjcGzjpPL0xPgdWIq2+Iyez9zKM8glsljnRItjPDCrJES5NYmsOowXdXGb6AdYPvp0CQLAjeG6isWyb24iSbM=@lists.openembedded.org
X-Gm-Message-State: AOJu0YzpMB79ravTDHiTPPEJ3PloALc9ZzOa9R0+mZBgj0eVpbvppJri
	p93nTd3ryB5u7dK+McWFb5kkCHPge2boYMQaGLnAOE6RCtN82Lz/AnVN
X-Gm-Gg: ASbGncuUcXgoG+rC8+Ql8hUZnn3CsSOI+nQ3MNS4Fik/vs6nxZybRpe4ECo6r7A/+Gp
	YFmuaKSR2ubC7D7W/x4D1utOPtfZjAoHsVlN+vv01A1YrPKXx6RQUEE45guxs1N8mVW0qBCsYH0
	HkTHnTP7h8bZMoygs0VYS2io4fN3eU6LZ92Knkz9+rTbbTRkn0gFRumm15GurKisXkt1ZRcg8a1
	9jQzsTLQAAD8UvF4ZK7D96mRZf1wkWhVoJWp8uqKs6vSzhZfsZ5Pe6izNSrvqcGS94kZo6gujw3
	lO9j/5RsIWXmRSZqMfrKZNgbhWN4JU7tZedB0+RPxz8MA6elAdtRrCk4vX4Pi7vRSFjN+4Ogsu4
	Zi1oHScPPKHS8VZXslmi/VRu+Tz6MOI5Vvk4=
X-Google-Smtp-Source: AGHT+IGFZeh5DEuP52LDQOOlYWu6AscwDmc6q37Ys/iJgZFNM20Vpv8UmlkARlhH/GgnM7KB2UY2Hg==
X-Received: by 2002:a05:6902:18d3:b0:e7d:5e41:a89f with SMTP id 3f1490d57ef6-e7d9175aca6mr6760383276.6.1748197620790;
        Sun, 25 May 2025 11:27:00 -0700 (PDT)
Received: from ?IPV6:2600:1700:45dd:7000:1a2c:d90a:f69:692f? ([2600:1700:45dd:7000:1a2c:d90a:f69:692f])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e7b6ac877b2sm6521961276.16.2025.05.25.11.27.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 25 May 2025 11:27:00 -0700 (PDT)
Message-ID: <1d52301c-768d-47b9-91d6-b48a4d0d7296@gmail.com>
Date: Sun, 25 May 2025 14:26:59 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Khem Raj <raj.khem@gmail.com>,
 OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
From: akuster808 <akuster808@gmail.com>
Subject: scarthgap merge request: May 25th
Autocrypt: addr=akuster808@gmail.com; keydata=
 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
 ApZ86eOP
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 25 May 2025 18:27:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117618

The following changes since commit e92d0173a80ea7592c866618ef5293203c50544c:

   lmsensors: Clean stale files for sensord to avoid incorrect GCC 
header dependencies (2025-04-16 20:33:56 -0400)

are available in the Git repository at:

   https://git.openembedded.org/meta-openembedded scarthgap-next

for you to fetch changes up to 491671faee11ea131feab5a3a451d1a01deb2ab1:

   proftpd: Fix CVE-2024-57392 (2025-05-21 09:17:27 -0400)

----------------------------------------------------------------
Archana Polampalli (1):
       tftpy: fix CVE-2023-46566

Ariel D'Alessandro (1):
       pipewire: Install missing ALSA config files

Jeroen Hofstee (3):
       nodejs: backport a patch to prevent brotli crashing nodejs
       can-utils: fix printing / reading timestamps
       can-utils: handle CAN_ERR_CNT correctly

Khem Raj (1):
       python3-posix-ipc: switch to PEP-517 build backend

Martin Jansa (1):
       python3-posix-ipc: improve build_support

Peter Marko (1):
       libmodbus: ignore CVE-2023-26793 and CVE-2024-34244

Soumya Sambu (1):
       iniparser: Fix CVE-2025-0633

Vijay Anusuri (1):
       proftpd: Fix CVE-2024-57392

Wang Mingyu (1):
       python3-posix-ipc: upgrade 1.1.1 -> 1.2.0

Yogita Urade (4):
       poppler: fix CVE-2025-32364
       poppler: fix CVE-2025-32365
       poppler: fix CVE-2025-43903
       syslog-ng: fix CVE-2024-47619

Zhang Peng (1):
       iperf3: upgrade 3.16 -> 3.18

  meta-multimedia/recipes-multimedia/pipewire/pipewire_1.0.9.bb   | 10 +
  .../recipes-daemons/proftpd/files/CVE-2024-57392.patch          | 42 +++
  meta-networking/recipes-daemons/proftpd/proftpd_1.3.7c.bb       | 1 +
  .../iperf3/iperf3/do-not-listen-to-old-udp-prot-listener.patch  | 30 --
  .../recipes-benchmark/iperf3/{iperf3_3.16.bb => iperf3_3.18.bb} |   7 +-
  .../nodejs/nodejs/zlib-fix-pointer-alignment.patch              | 64 +++++
  meta-oe/recipes-devtools/nodejs/nodejs_20.18.2.bb               | 1 +
  meta-oe/recipes-extended/libmodbus/libmodbus_3.1.10.bb          | 3 +
  ...1-lib-snprintf_can_error_frame-don-t-bail-out-if-CAN_E.patch | 70 +++++
  ...1-timestamp-formatting-always-use-64-bit-for-timestamp.patch | 422 
++++++++++++++++++++++++++++
  meta-oe/recipes-extended/socketcan/can-utils_2023.03.bb         | 5 +-
  meta-oe/recipes-support/iniparser/iniparser/CVE-2025-0633.patch | 37 +++
  meta-oe/recipes-support/iniparser/iniparser_4.1.bb              | 1 +
  meta-oe/recipes-support/poppler/poppler/CVE-2025-32364.patch    | 28 ++
  meta-oe/recipes-support/poppler/poppler/CVE-2025-32365.patch    | 41 +++
  .../recipes-support/poppler/poppler/CVE-2025-43903-0001.patch   | 75 +++++
  .../recipes-support/poppler/poppler/CVE-2025-43903-0002.patch   | 49 ++++
  meta-oe/recipes-support/poppler/poppler_23.04.0.bb              | 4 +
  meta-oe/recipes-support/syslog-ng/files/CVE-2024-47619.patch    | 292 
+++++++++++++++++++
  meta-oe/recipes-support/syslog-ng/syslog-ng_4.6.0.bb            | 1 +
  ...1-build_support-use-source-filename-instead-of-foo-for.patch | 50 ++++
  ...2-build_support-handle-empty-max_priority-value-as-Non.patch | 49 ++++
  ...3-build_support-use-does_build_succeed-in-compile_and_.patch | 62 ++++
  meta-python/recipes-devtools/python/python3-posix-ipc_1.1.1.bb  | 11 -
  meta-python/recipes-devtools/python/python3-posix-ipc_1.2.0.bb  | 16 ++
  meta-python/recipes-devtools/python/tftpy/CVE-2023-46566.patch  | 26 ++
  meta-python/recipes-devtools/python/tftpy_0.8.2.bb              | 2 +
  27 files changed, 1353 insertions(+), 46 deletions(-)
  create mode 100644 
meta-networking/recipes-daemons/proftpd/files/CVE-2024-57392.patch
  delete mode 100644 
meta-oe/recipes-benchmark/iperf3/iperf3/do-not-listen-to-old-udp-prot-listener.patch
  rename meta-oe/recipes-benchmark/iperf3/{iperf3_3.16.bb => 
iperf3_3.18.bb} (82%)
  create mode 100644 
meta-oe/recipes-devtools/nodejs/nodejs/zlib-fix-pointer-alignment.patch
  create mode 100644 
meta-oe/recipes-extended/socketcan/can-utils/0001-lib-snprintf_can_error_frame-don-t-bail-out-if-CAN_E.patch
  create mode 100644 
meta-oe/recipes-extended/socketcan/can-utils/0001-timestamp-formatting-always-use-64-bit-for-timestamp.patch
  create mode 100644 
meta-oe/recipes-support/iniparser/iniparser/CVE-2025-0633.patch
  create mode 100644 
meta-oe/recipes-support/poppler/poppler/CVE-2025-32364.patch
  create mode 100644 
meta-oe/recipes-support/poppler/poppler/CVE-2025-32365.patch
  create mode 100644 
meta-oe/recipes-support/poppler/poppler/CVE-2025-43903-0001.patch
  create mode 100644 
meta-oe/recipes-support/poppler/poppler/CVE-2025-43903-0002.patch
  create mode 100644 
meta-oe/recipes-support/syslog-ng/files/CVE-2024-47619.patch
  create mode 100644 
meta-python/recipes-devtools/python/python3-posix-ipc/0001-build_support-use-source-filename-instead-of-foo-for.patch
  create mode 100644 
meta-python/recipes-devtools/python/python3-posix-ipc/0002-build_support-handle-empty-max_priority-value-as-Non.patch
  create mode 100644 
meta-python/recipes-devtools/python/python3-posix-ipc/0003-build_support-use-does_build_succeed-in-compile_and_.patch
  delete mode 100644 
meta-python/recipes-devtools/python/python3-posix-ipc_1.1.1.bb
  create mode 100644 
meta-python/recipes-devtools/python/python3-posix-ipc_1.2.0.bb
  create mode 100644 
meta-python/recipes-devtools/python/tftpy/CVE-2023-46566.patch


