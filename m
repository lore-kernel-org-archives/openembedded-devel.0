Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 970D4C433FE
	for <webhook@archiver.kernel.org>; Sat, 19 Nov 2022 15:58:07 +0000 (UTC)
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
 by mx.groups.io with SMTP id smtpd.web10.23535.1668873485818907459
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 19 Nov 2022 07:58:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=XHsZ/sYC;
 spf=pass (domain: gmail.com, ip: 209.85.160.176, mailfrom: akuster808@gmail.com)
Received: by mail-qt1-f176.google.com with SMTP id h21so4960474qtu.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 19 Nov 2022 07:58:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=bWUG1muZJMfX5NrtA+xdAaydTCj7RCj16h9Bhu2LD5o=;
        b=XHsZ/sYCDIp7/uQAn+2veXNucuOIl6IXadLgCdYawoZg9fPcLakq/i0D12vmH7gQvy
         Blpu7qbLh9ODqVby51f+L3//t3cFmPSJKRdn074OEP47Xg/aRBr79FXsVBZx1q4W1FG9
         K8oUim+ipQ0BHTuktKqCrepGT5LTZW5IHMIouktFFjYQaW5s+6UkflRyCihNJgfWG+98
         8cKvGTz6aPqXAQp0GeH8PGF8SljiTU5HecXgy4QQltLLlHOhKUwyznHVdkkvbPNB3nhW
         FQMlMiZT4NkUWm/BIUYTojHaRAAgki9FszHHDqA5ObYr8N6GZaiJf+bblW85pkHgIREP
         Fqqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bWUG1muZJMfX5NrtA+xdAaydTCj7RCj16h9Bhu2LD5o=;
        b=X6UsXn3sLjM6yt6FuDz+3BTmyum7XgDtFA6jv/gtIAPRjnVdZqR7WoxZBh/VOfCcwQ
         sL/nJDzJ0tYisFlBeIcUOFbSBHtUFWOoDTk0lkzjciP/8k3QfmdViIjVUteOmvdnbmMi
         xvAt9x86pCsRs0/E0WkfQX75G2jFGi0kzrT4i5e5R+vZSu5XdxK/CjBzqQc0iCM2ZZ6S
         dGEf8hJdTbmFKGjZf07c4aX4TcehMbPzgcyJ40ZX8b6ICeKL8svopqhTvBmkS0ZgTNpN
         t0UKuWyvU6TY9y//wbtWnkm3mOsvS9lZqTp3th3YKSOE/Z4D927k4kXm2Cffyl6MoUe+
         doNA==
X-Gm-Message-State: ANoB5pkfFHbM0eoeVgFHw5YTM3quTRp5srHWea3jTkrXsPc4/+EEr4F1
	Yw1aAdFfBJh3fA30ULwLa+J9DlEdvjnN1A==
X-Google-Smtp-Source: AA0mqf5Y8aT1hJu39ZYkQp4ZuQeE+f40aiDIAc7XqRYt/Gya4pSQ3Aaq9okIoxxOsJnJ9BYk2lFbgw==
X-Received: by 2002:a05:622a:100d:b0:3a5:27b2:c1ce with SMTP id d13-20020a05622a100d00b003a527b2c1cemr1940707qte.458.1668873484145;
        Sat, 19 Nov 2022 07:58:04 -0800 (PST)
Received: from keaua.attlocal.net ([2600:1700:9190:ba10:8dbe:f48d:8b1a:1569])
        by smtp.gmail.com with ESMTPSA id c7-20020a05620a268700b006fb112f512csm4821314qkp.74.2022.11.19.07.58.03
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Nov 2022 07:58:03 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [langdale 00/35] Patch review Nov 19th
Date: Sat, 19 Nov 2022 10:57:24 -0500
Message-Id: <cover.1668873377.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 19 Nov 2022 15:58:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99639

Please have comments back by Tuesday

The following changes since commit c5668905a6d8a78fb72c2cbf8b20e91e686ceb86:

  meta-openemnedded: Add myself as langdale maintainer (2022-10-22 15:59:34 -0700)

are available in the Git repository at:

  git://git.openembedded.org/meta-openembedded-contrib stable/langdale-nut
  http://cgit.openembedded.org/meta-openembedded-contrib/log/?h=stable/langdale-nut

Alex Kiernan (1):
  lldpd: Upgrade 1.0.14 -> 1.0.15

Armin Kuster (1):
  meta-oe][PATCH] gst-editing-services: fix typo in LICENSE field.

Leon Anavi (1):
  python3-pythonping: Upgrade 1.1.3 -> 1.1.4

Markus Volk (1):
  libcamera: upgrade -> 0.0.1

Martin Jansa (1):
  monkey: use git fetcher

Peter Kjellerstedt (2):
  chrony: Make it possible to enable editline support again
  chrony: Remove the libcap and nss PACKAGECONFIGs

Peter Marko (1):
  cpputest: remove dev package dependency

Robert Joslyn (1):
  fwupd: Fix plugin_gpio PACKAGECONFIG

Wang Mingyu (23):
  bats: upgrade 1.8.0 -> 1.8.2
  ctags: upgrade 5.9.20221009.0 -> 5.9.20221016.0
  fvwm: upgrade 2.6.9 -> 2.7.0
  makedumpfile: upgrade 1.7.1 -> 1.7.2
  sanlock: upgrade 3.8.4 -> 3.8.5
  python3-astroid: upgrade 2.12.11 -> 2.12.12
  python3-charset-normalizer: upgrade 2.1.1 -> 3.0.0
  python3-google-api-python-client: upgrade 2.64.0 -> 2.65.0
  python3-google-auth: upgrade 2.12.0 -> 2.13.0
  python3-huey: upgrade 2.4.3 -> 2.4.4
  python3-oauthlib: upgrade 3.2.1 -> 3.2.2
  python3-pandas: upgrade 1.5.0 -> 1.5.1
  python3-pika: upgrade 1.3.0 -> 1.3.1
  python3-protobuf: upgrade 4.21.7 -> 4.21.8
  python3-pywbemtools: upgrade 1.0.0 -> 1.0.1
  python3-socketio: upgrade 5.7.1 -> 5.7.2
  python3-sqlalchemy: upgrade 1.4.41 -> 1.4.42
  tracker: upgrade 3.4.0 -> 3.4.1
  wolfssl: upgrade 5.5.1 -> 5.5.2
  cglm: upgrade 0.8.5 -> 0.8.7
  ctags: upgrade 5.9.20221016.0 -> 5.9.20221023.0
  function2: upgrade 4.2.1 -> 4.2.2
  poco: upgrade 1.12.2 -> 1.12.3

Xiangyu Chen (1):
  ipmitool: fix typo in .bb file's comments, using = instead of =?

zhengruoqin (2):
  tcpslice: upgrade 1.5 -> 1.6
  tio: upgrade 2.1 -> 2.2

 .../{tracker_3.4.0.bb => tracker_3.4.1.bb}    |  2 +-
 .../{libcamera.bb => libcamera_0.0.1.bb}      | 18 +++++-------------
 .../{wolfssl_5.5.1.bb => wolfssl_5.5.2.bb}    |  2 +-
 .../{lldpd_1.0.14.bb => lldpd_1.0.15.bb}      |  4 ++--
 .../recipes-support/chrony/chrony_4.3.bb      | 19 +++++++------------
 .../{tcpslice_1.5.bb => tcpslice_1.6.bb}      |  3 +--
 meta-oe/recipes-bsp/fwupd/fwupd_1.8.4.bb      |  2 +-
 ....20221009.0.bb => ctags_5.9.20221023.0.bb} |  2 +-
 .../gst-editing-services_1.20.4.bb            |  2 +-
 .../sanlock/sanlock/setuptools.patch          | 18 ------------------
 .../{sanlock_3.8.4.bb => sanlock_3.8.5.bb}    |  3 +--
 .../cglm/{cglm_0.8.5.bb => cglm_0.8.7.bb}     |  2 +-
 .../fvwm/{fvwm_2.6.9.bb => fvwm_2.7.0.bb}     |  2 +-
 .../ipmitool/ipmitool_1.8.19.bb               |  2 +-
 ...umpfile_1.7.1.bb => makedumpfile_1.7.2.bb} |  2 +-
 ...{function2_4.2.1.bb => function2_4.2.2.bb} |  2 +-
 .../poco/{poco_1.12.2.bb => poco_1.12.3.bb}   |  2 +-
 .../tio/{tio_2.1.bb => tio_2.2.bb}            |  2 +-
 .../bats/{bats_1.8.0.bb => bats_1.8.2.bb}     |  2 +-
 meta-oe/recipes-test/cpputest/cpputest_4.0.bb |  2 ++
 ..._2.12.11.bb => python3-astroid_2.12.12.bb} |  2 +-
 ...bb => python3-charset-normalizer_3.0.0.bb} |  2 +-
 ...ython3-google-api-python-client_2.65.0.bb} |  2 +-
 ....12.0.bb => python3-google-auth_2.13.0.bb} |  2 +-
 ...n3-huey_2.4.3.bb => python3-huey_2.4.4.bb} |  2 +-
 ...lib_3.2.1.bb => python3-oauthlib_3.2.2.bb} |  2 +-
 ...andas_1.5.0.bb => python3-pandas_1.5.1.bb} |  2 +-
 ...n3-pika_1.3.0.bb => python3-pika_1.3.1.bb} |  2 +-
 ...f_4.21.7.bb => python3-protobuf_4.21.8.bb} |  2 +-
 ...g_1.1.3.bb => python3-pythonping_1.1.4.bb} |  2 +-
 ...tio_5.7.1.bb => python3-socketio_5.7.2.bb} |  2 +-
 ...1.4.41.bb => python3-sqlalchemy_1.4.42.bb} |  2 +-
 ..._1.0.0.bb => python3-pywbemtools_1.0.1.bb} |  2 +-
 .../recipes-httpd/monkey/monkey_1.6.9.bb      |  5 +++--
 34 files changed, 47 insertions(+), 77 deletions(-)
 rename meta-gnome/recipes-gnome/tracker/{tracker_3.4.0.bb => tracker_3.4.1.bb} (93%)
 rename meta-multimedia/recipes-multimedia/libcamera/{libcamera.bb => libcamera_0.0.1.bb} (74%)
 rename meta-networking/recipes-connectivity/wolfssl/{wolfssl_5.5.1.bb => wolfssl_5.5.2.bb} (93%)
 rename meta-networking/recipes-daemons/lldpd/{lldpd_1.0.14.bb => lldpd_1.0.15.bb} (95%)
 rename meta-networking/recipes-support/tcpdump/{tcpslice_1.5.bb => tcpslice_1.6.bb} (80%)
 rename meta-oe/recipes-devtools/ctags/{ctags_5.9.20221009.0.bb => ctags_5.9.20221023.0.bb} (95%)
 delete mode 100644 meta-oe/recipes-extended/sanlock/sanlock/setuptools.patch
 rename meta-oe/recipes-extended/sanlock/{sanlock_3.8.4.bb => sanlock_3.8.5.bb} (95%)
 rename meta-oe/recipes-graphics/cglm/{cglm_0.8.5.bb => cglm_0.8.7.bb} (93%)
 rename meta-oe/recipes-graphics/fvwm/{fvwm_2.6.9.bb => fvwm_2.7.0.bb} (98%)
 rename meta-oe/recipes-kernel/makedumpfile/{makedumpfile_1.7.1.bb => makedumpfile_1.7.2.bb} (96%)
 rename meta-oe/recipes-support/function2/{function2_4.2.1.bb => function2_4.2.2.bb} (92%)
 rename meta-oe/recipes-support/poco/{poco_1.12.2.bb => poco_1.12.3.bb} (98%)
 rename meta-oe/recipes-support/tio/{tio_2.1.bb => tio_2.2.bb} (91%)
 rename meta-oe/recipes-test/bats/{bats_1.8.0.bb => bats_1.8.2.bb} (95%)
 rename meta-python/recipes-devtools/python/{python3-astroid_2.12.11.bb => python3-astroid_2.12.12.bb} (89%)
 rename meta-python/recipes-devtools/python/{python3-charset-normalizer_2.1.1.bb => python3-charset-normalizer_3.0.0.bb} (82%)
 rename meta-python/recipes-devtools/python/{python3-google-api-python-client_2.64.0.bb => python3-google-api-python-client_2.65.0.bb} (86%)
 rename meta-python/recipes-devtools/python/{python3-google-auth_2.12.0.bb => python3-google-auth_2.13.0.bb} (87%)
 rename meta-python/recipes-devtools/python/{python3-huey_2.4.3.bb => python3-huey_2.4.4.bb} (78%)
 rename meta-python/recipes-devtools/python/{python3-oauthlib_3.2.1.bb => python3-oauthlib_3.2.2.bb} (92%)
 rename meta-python/recipes-devtools/python/{python3-pandas_1.5.0.bb => python3-pandas_1.5.1.bb} (89%)
 rename meta-python/recipes-devtools/python/{python3-pika_1.3.0.bb => python3-pika_1.3.1.bb} (87%)
 rename meta-python/recipes-devtools/python/{python3-protobuf_4.21.7.bb => python3-protobuf_4.21.8.bb} (92%)
 rename meta-python/recipes-devtools/python/{python3-pythonping_1.1.3.bb => python3-pythonping_1.1.4.bb} (77%)
 rename meta-python/recipes-devtools/python/{python3-socketio_5.7.1.bb => python3-socketio_5.7.2.bb} (89%)
 rename meta-python/recipes-devtools/python/{python3-sqlalchemy_1.4.41.bb => python3-sqlalchemy_1.4.42.bb} (87%)
 rename meta-python/recipes-extended/pywbemtools/{python3-pywbemtools_1.0.0.bb => python3-pywbemtools_1.0.1.bb} (92%)

-- 
2.25.1


