Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A101C43219
	for <webhook@archiver.kernel.org>; Thu, 24 Nov 2022 12:16:40 +0000 (UTC)
Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com [209.85.160.43])
 by mx.groups.io with SMTP id smtpd.web11.22228.1669292197220805276
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 24 Nov 2022 04:16:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=dxTQyOCz;
 spf=pass (domain: gmail.com, ip: 209.85.160.43, mailfrom: akuster808@gmail.com)
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-14286d5ebc3so1795466fac.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 24 Nov 2022 04:16:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w4pKpp2lFhoqIAcUlWtZAQtJSf8LGTUnqx8Ha+Cvg5k=;
        b=dxTQyOCzTn73HuOTCX2vvSwODpxvFzDSJgIvuP7cyJ3SMzdEvI9CjpB2v0XRTOugVm
         yF0RcH4XAVeURyWMfKUPI/yX99SmaaLFI61UZ/kxy/K2YFHSswfvDvgf9CJ8IxMBiPWY
         9qDEq5Ue9ef7Q7sXBK08xmWpv+1OmGRIl5eazNADU5i9fOiv9Mj55MQI3Ykb1+vTyQHc
         GfbfjT/EsGx80IB+8TTDLPz5zpH0iURFNoXMMCSGLT6iyMY7Tziak7/AEWYzAaefR9ol
         eTQkXbTmvgqP/O7zxP4vDiniFSt4oUHMRnDNXBobZpq9n6OsqE6rNtx3L703GIbc5HIF
         GgMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=w4pKpp2lFhoqIAcUlWtZAQtJSf8LGTUnqx8Ha+Cvg5k=;
        b=EIOOwfvlc9TTi6OkfHSeFNdp0WFhWMBxD8wgjqhgwTj2CimWALeT8dGntu1uOn8Bsj
         C4tO4zJmMazDOud18UyXj+AGqCyplbiOpl11WV0mOCIB6ednvvsOj+b+2e7rcVE0gewT
         D/sOkC3sSpl4YvWsT3NF8/Ex5HjZ1wGtZ/zoztnFBlWl14PkLmQvkrr0VSib9r9KUreG
         0AoSZQq+pplcDd1ofU6MEo6Bjfte+qfnCYc4O6Rib/JI5v2DMUjmdiaLDKR4vYt9xnTe
         9ULE2I4o9UY2vDANmhtXbb7SMvGuMbuKjgsg77Ua1AtDDm5AKt+tu++TzPj8o6UFKTH4
         SA2A==
X-Gm-Message-State: ANoB5plibdyElGI4zxgzs62uS5m5xL9U1v/14WBe1Z2x8RpgNoYcEcpQ
	AmuVaGwyODGUzEhRi20PH0w=
X-Google-Smtp-Source: AA0mqf6WtyF2Y6524hE/NgK3EMTu7XF1C+AtqJuqvzoz0sDHvcTxktKvUjUlSQYarI5IJrqDurCbwA==
X-Received: by 2002:a05:6870:280a:b0:142:74fa:50d7 with SMTP id gz10-20020a056870280a00b0014274fa50d7mr17707308oab.217.1669292196355;
        Thu, 24 Nov 2022 04:16:36 -0800 (PST)
Received: from ?IPV6:2600:1700:9190:ba10:87e8:d6f1:3d86:d125? ([2600:1700:9190:ba10:87e8:d6f1:3d86:d125])
        by smtp.gmail.com with ESMTPSA id r11-20020a9d750b000000b006621427ecc7sm296961otk.60.2022.11.24.04.16.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Nov 2022 04:16:35 -0800 (PST)
Message-ID: <5377e5ff-4da9-f333-3b3e-2d17447657ca@gmail.com>
Date: Thu, 24 Nov 2022 07:16:34 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Content-Language: en-US
To: Khem Raj <raj.khem@gmail.com>,
 OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
From: akuster808 <akuster808@gmail.com>
Subject: langdale merge request Nov 24th
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 24 Nov 2022 12:16:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99707

The following changes since commit c5668905a6d8a78fb72c2cbf8b20e91e686ceb86:

   meta-openemnedded: Add myself as langdale maintainer (2022-10-22 
15:59:34 -0700)

are available in the Git repository at:

   https://git.openembedded.org/meta-openembedded langdale-next

for you to fetch changes up to c354f92778c1d4bcd3680af7e0fb0d1414de2344:

   chrony: Remove the libcap and nss PACKAGECONFIGs (2022-11-18 10:11:45 
-0500)

----------------------------------------------------------------
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

  meta-gnome/recipes-gnome/tracker/{tracker_3.4.0.bb => 
tracker_3.4.1.bb}   |  2 +-
  .../recipes-multimedia/libcamera/{libcamera.bb => 
libcamera_0.0.1.bb}     | 18 +++++-------------
  .../recipes-connectivity/wolfssl/{wolfssl_5.5.1.bb => 
wolfssl_5.5.2.bb}   |  2 +-
  .../recipes-daemons/lldpd/{lldpd_1.0.14.bb => 
lldpd_1.0.15.bb}            |  4 ++--
  meta-networking/recipes-support/chrony/chrony_4.3.bb | 19 
+++++++------------
  .../recipes-support/tcpdump/{tcpslice_1.5.bb => 
tcpslice_1.6.bb}          |  3 +--
  meta-oe/recipes-bsp/fwupd/fwupd_1.8.4.bb |  2 +-
  .../ctags/{ctags_5.9.20221009.0.bb => 
ctags_5.9.20221023.0.bb}            |  2 +-
  .../recipes-devtools/gst-editing-services/gst-editing-services_1.20.4.bb |  2 +-
  meta-oe/recipes-extended/sanlock/sanlock/setuptools.patch | 18 
------------------
  meta-oe/recipes-extended/sanlock/{sanlock_3.8.4.bb => 
sanlock_3.8.5.bb}   |  3 +--
  meta-oe/recipes-graphics/cglm/{cglm_0.8.5.bb => 
cglm_0.8.7.bb}            |  2 +-
  meta-oe/recipes-graphics/fvwm/{fvwm_2.6.9.bb => 
fvwm_2.7.0.bb}            |  2 +-
  meta-oe/recipes-kernel/ipmitool/ipmitool_1.8.19.bb |  2 +-
  .../makedumpfile/{makedumpfile_1.7.1.bb => 
makedumpfile_1.7.2.bb}         |  2 +-
  .../recipes-support/function2/{function2_4.2.1.bb => 
function2_4.2.2.bb}  |  2 +-
  meta-oe/recipes-support/poco/{poco_1.12.2.bb => 
poco_1.12.3.bb}           |  2 +-
  meta-oe/recipes-support/tio/{tio_2.1.bb => 
tio_2.2.bb}                    |  2 +-
  meta-oe/recipes-test/bats/{bats_1.8.0.bb => 
bats_1.8.2.bb}                |  2 +-
  meta-oe/recipes-test/cpputest/cpputest_4.0.bb |  2 ++
  .../python/{python3-astroid_2.12.11.bb => 
python3-astroid_2.12.12.bb}     |  2 +-
  ...n3-charset-normalizer_2.1.1.bb => 
python3-charset-normalizer_3.0.0.bb} |  2 +-
  ...python-client_2.64.0.bb => 
python3-google-api-python-client_2.65.0.bb} |  2 +-
  .../{python3-google-auth_2.12.0.bb => 
python3-google-auth_2.13.0.bb}      |  2 +-
  .../python/{python3-huey_2.4.3.bb => 
python3-huey_2.4.4.bb}               |  2 +-
  .../python/{python3-oauthlib_3.2.1.bb => 
python3-oauthlib_3.2.2.bb}       |  2 +-
  .../python/{python3-pandas_1.5.0.bb => 
python3-pandas_1.5.1.bb}           |  2 +-
  .../python/{python3-pika_1.3.0.bb => 
python3-pika_1.3.1.bb}               |  2 +-
  .../python/{python3-protobuf_4.21.7.bb => 
python3-protobuf_4.21.8.bb}     |  2 +-
  .../python/{python3-pythonping_1.1.3.bb => 
python3-pythonping_1.1.4.bb}   |  2 +-
  .../python/{python3-socketio_5.7.1.bb => 
python3-socketio_5.7.2.bb}       |  2 +-
  .../python/{python3-sqlalchemy_1.4.41.bb => 
python3-sqlalchemy_1.4.42.bb} |  2 +-
  .../{python3-pywbemtools_1.0.0.bb => 
python3-pywbemtools_1.0.1.bb}        |  2 +-
  meta-webserver/recipes-httpd/monkey/monkey_1.6.9.bb |  5 +++--
  34 files changed, 47 insertions(+), 77 deletions(-)
  rename meta-gnome/recipes-gnome/tracker/{tracker_3.4.0.bb => 
tracker_3.4.1.bb} (93%)
  rename meta-multimedia/recipes-multimedia/libcamera/{libcamera.bb => 
libcamera_0.0.1.bb} (74%)
  rename meta-networking/recipes-connectivity/wolfssl/{wolfssl_5.5.1.bb 
=> wolfssl_5.5.2.bb} (93%)
  rename meta-networking/recipes-daemons/lldpd/{lldpd_1.0.14.bb => 
lldpd_1.0.15.bb} (95%)
  rename meta-networking/recipes-support/tcpdump/{tcpslice_1.5.bb => 
tcpslice_1.6.bb} (80%)
  rename meta-oe/recipes-devtools/ctags/{ctags_5.9.20221009.0.bb => 
ctags_5.9.20221023.0.bb} (95%)
  delete mode 100644 
meta-oe/recipes-extended/sanlock/sanlock/setuptools.patch
  rename meta-oe/recipes-extended/sanlock/{sanlock_3.8.4.bb => 
sanlock_3.8.5.bb} (95%)
  rename meta-oe/recipes-graphics/cglm/{cglm_0.8.5.bb => cglm_0.8.7.bb} 
(93%)
  rename meta-oe/recipes-graphics/fvwm/{fvwm_2.6.9.bb => fvwm_2.7.0.bb} 
(98%)
  rename meta-oe/recipes-kernel/makedumpfile/{makedumpfile_1.7.1.bb => 
makedumpfile_1.7.2.bb} (96%)
  rename meta-oe/recipes-support/function2/{function2_4.2.1.bb => 
function2_4.2.2.bb} (92%)
  rename meta-oe/recipes-support/poco/{poco_1.12.2.bb => poco_1.12.3.bb} 
(98%)
  rename meta-oe/recipes-support/tio/{tio_2.1.bb => tio_2.2.bb} (91%)
  rename meta-oe/recipes-test/bats/{bats_1.8.0.bb => bats_1.8.2.bb} (95%)
  rename meta-python/recipes-devtools/python/{python3-astroid_2.12.11.bb 
=> python3-astroid_2.12.12.bb} (89%)
  rename 
meta-python/recipes-devtools/python/{python3-charset-normalizer_2.1.1.bb 
=> python3-charset-normalizer_3.0.0.bb} (82%)
  rename 
meta-python/recipes-devtools/python/{python3-google-api-python-client_2.64.0.bb 
=> python3-google-api-python-client_2.65.0.bb} (86%)
  rename 
meta-python/recipes-devtools/python/{python3-google-auth_2.12.0.bb => 
python3-google-auth_2.13.0.bb} (87%)
  rename meta-python/recipes-devtools/python/{python3-huey_2.4.3.bb => 
python3-huey_2.4.4.bb} (78%)
  rename meta-python/recipes-devtools/python/{python3-oauthlib_3.2.1.bb 
=> python3-oauthlib_3.2.2.bb} (92%)
  rename meta-python/recipes-devtools/python/{python3-pandas_1.5.0.bb => 
python3-pandas_1.5.1.bb} (89%)
  rename meta-python/recipes-devtools/python/{python3-pika_1.3.0.bb => 
python3-pika_1.3.1.bb} (87%)
  rename meta-python/recipes-devtools/python/{python3-protobuf_4.21.7.bb 
=> python3-protobuf_4.21.8.bb} (92%)
  rename 
meta-python/recipes-devtools/python/{python3-pythonping_1.1.3.bb => 
python3-pythonping_1.1.4.bb} (77%)
  rename meta-python/recipes-devtools/python/{python3-socketio_5.7.1.bb 
=> python3-socketio_5.7.2.bb} (89%)
  rename 
meta-python/recipes-devtools/python/{python3-sqlalchemy_1.4.41.bb => 
python3-sqlalchemy_1.4.42.bb} (87%)
  rename 
meta-python/recipes-extended/pywbemtools/{python3-pywbemtools_1.0.0.bb 
=> python3-pywbemtools_1.0.1.bb} (92%)


