Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web12.1919.1621710251252242355
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 22 May 2021 12:04:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=kd5rtD2m;
 spf=pass (domain: gmail.com, ip: 209.85.210.176, mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f176.google.com with SMTP id 22so17074685pfv.11
        for <openembedded-devel@lists.openembedded.org>; Sat, 22 May 2021 12:04:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:from:subject:message-id:date:user-agent:mime-version
         :content-transfer-encoding:content-language;
        bh=ksZ43klFA5WYQTXylKrI6T0QjD8vkHXf7g+nn57yW+o=;
        b=kd5rtD2mdTEXR4DMeuXkVjcP3lNUaHIhx1/h/Avn5Vg7ZNap1oXxFwJDIwlmD0MDpB
         cYgXTwcSjgJ8fdCeTufo71KMu7guOFeT2DakK3tugaqbnqMzlf9ECr3FLXJ5YsrZQ4qo
         Sk3ui4HzT9gVqqnzNNih3sw6jvFgYa82uRKwOBve0lMHEW8ff2PATK8ErUarapKgjvQY
         cJh3VeRiUGnYidxzzxm8hGz5JEZWM8P5W4IoF4s6w8eNDW63y47SneNT++SP64jl5DrJ
         VLq/aNraBEipQ5+3ds0IhY1Ncxrt7hjhWpL/PkzbobaGt7dIu7yZ6skmYzfiV6WDkpgs
         P/tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:from:subject:message-id:date:user-agent
         :mime-version:content-transfer-encoding:content-language;
        bh=ksZ43klFA5WYQTXylKrI6T0QjD8vkHXf7g+nn57yW+o=;
        b=YpRs0rPw5KHkCEl9GfCOOmvirccAcNp4u4vFqJuJ5Vzk27GwUotqxthzdsq9fApu1a
         ewWIUuxPBjvpJB1Dk1TYI2beVr0QZFPUEXb7/9u/yu2XWYSK53y7UADfW2wCbRkGvzxF
         Q9XQTSyhMG+CscWsqvM7J53NUfKutRPceQmz44V65iafA3sj+ct1eOxH+9RFYfNA+S1O
         sJI2qQZQP1tqJ1ERkvVkLmdRw7VY/tBU0A7LZh1YrrxAF4hhlnOngbvfOI1LbKyIl4cP
         kLH7EDkfOW5VE/qTrlSrZzHIaUAy7n/ecU4MBsuj60Oj1TrKyUtj17uI1HPmZ5RuYZPu
         sZoQ==
X-Gm-Message-State: AOAM5328N0H6e44EsqlfQ6Mddaf/k0k2fcVoQaJ2w3hyMwPWZBRgSpH7
	G6zrVfAbMth5dEjEC6V1lU4=
X-Google-Smtp-Source: ABdhPJyqK9+oxn481JRkG+gEUqX9CopWjP7BKzOPGEIIhB0eAOnJSmmhMhsL5bD4rfwlm0OQeiSLQw==
X-Received: by 2002:aa7:8556:0:b029:2e2:45aa:d01e with SMTP id y22-20020aa785560000b02902e245aad01emr14732005pfn.14.1621710250821;
        Sat, 22 May 2021 12:04:10 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from ?IPv6:2601:202:4180:a5c0:2c86:80f7:821f:a12a? ([2601:202:4180:a5c0:2c86:80f7:821f:a12a])
        by smtp.gmail.com with ESMTPSA id f2sm7487420pgl.67.2021.05.22.12.04.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 22 May 2021 12:04:10 -0700 (PDT)
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>,
 Khem Raj <raj.khem@gmail.com>
From: "Armin Kuster" <akuster808@gmail.com>
Subject: hardknott merge request May 22th
Message-ID: <b9a1ed01-587d-bd43-52dc-6386b1b463aa@gmail.com>
Date: Sat, 22 May 2021 12:04:01 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US

The following changes since commit bbe3855ec7d7e1417a42e9d7a4d1d3d338812088:

  ostree: switch from default master branch to main to fix do_fetch
failure (2021-05-13 21:37:32 -0700)

are available in the Git repository at:

  https://git.openembedded.org/meta-openembedded hardknott-next

for you to fetch changes up to cf5bd6a8308108b4313a1e45ce8aa87e73125bf9:

  xfce4-settings: upgrade 4.16.0 -> 4.16.1 (2021-05-17 07:18:41 -0700)

----------------------------------------------------------------
Andreas Müller (2):
      zsh: reduce priority slightly to avoid conflict with bash
      xfce4-settings: upgrade 4.16.0 -> 4.16.1

Khem Raj (3):
      aom: Match the name for AOM-Patent-License-1.0
      libdevmapper,lvm2: Do not inherit license
      python3-jinja2_2.%.bbappend: Delete

Saul Wold (2):
      tbb: Disable PPC as COMPATIBLE_MACHINE
      packagegroup-meta-oe: conditional remove tbb for powerpc

Silcet (1):
      ufw: fix python shebang

zangrc (3):
      fetchmail: upgrade 6.4.18 -> 6.4.19
      openvpn: upgrade 2.5.1 -> 2.5.2
      wireshark: upgrade 3.4.4 -> 3.4.5

 meta-multimedia/recipes-multimedia/aom/aom_3.0.0.bb             |  2 +-
 .../ufw/ufw/fix-dynamic-update-of-python-shebang.patch          | 57
+++++++++++++++++++++++++++++
 meta-networking/recipes-connectivity/ufw/ufw_0.33.bb            |  1 +
 .../fetchmail/{fetchmail_6.4.18.bb => fetchmail_6.4.19.bb}      |  4 +-
 .../openvpn/{openvpn_2.5.1.bb => openvpn_2.5.2.bb}              |  4 +-
 .../wireshark/{wireshark_3.4.4.bb => wireshark_3.4.5.bb}        |  2 +-
 meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb      |  2 +-
 meta-oe/recipes-shells/zsh/zsh_5.4.2.bb                         |  2 +-
 meta-oe/recipes-support/lvm2/lvm2.inc                           |  5 +--
 meta-oe/recipes-support/tbb/tbb_2021.2.0.bb                     |  3 ++
 meta-python/recipes-devtools/python/python3-jinja2_2.%.bbappend | 13
-------
 .../{xfce4-settings_4.16.0.bb => xfce4-settings_4.16.1.bb}      |  2 +-
 12 files changed, 72 insertions(+), 25 deletions(-)
 create mode 100644
meta-networking/recipes-connectivity/ufw/ufw/fix-dynamic-update-of-python-shebang.patch
 rename meta-networking/recipes-support/fetchmail/{fetchmail_6.4.18.bb
=> fetchmail_6.4.19.bb} (83%)
 rename meta-networking/recipes-support/openvpn/{openvpn_2.5.1.bb =>
openvpn_2.5.2.bb} (95%)
 rename meta-networking/recipes-support/wireshark/{wireshark_3.4.4.bb =>
wireshark_3.4.5.bb} (97%)
 delete mode 100644
meta-python/recipes-devtools/python/python3-jinja2_2.%.bbappend
 rename meta-xfce/recipes-xfce/xfce4-settings/{xfce4-settings_4.16.0.bb
=> xfce4-settings_4.16.1.bb} (93%)

