Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 394E5C001E0
	for <webhook@archiver.kernel.org>; Sat, 21 Oct 2023 20:29:29 +0000 (UTC)
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
 by mx.groups.io with SMTP id smtpd.web11.87264.1697920168133764143
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 21 Oct 2023 13:29:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=J/x9muk7;
 spf=pass (domain: gmail.com, ip: 209.85.128.174, mailfrom: akuster808@gmail.com)
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-5a92782615dso5188637b3.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 21 Oct 2023 13:29:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697920167; x=1698524967; darn=lists.openembedded.org;
        h=content-transfer-encoding:autocrypt:subject:from:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D13Z/xJvQGdSgHR1Na3ohcQ0IUYC2QkXr0CnFVaQ3Bo=;
        b=J/x9muk7pVTnljAhlr3vJK5hIAQcme7emZpjgjktlJ2BNmWP7wwTXm5mc8IdLgmZis
         Wt6Rxwx34sf8vNY9mnR9H+Ovv8TPr2FkJuJwJj+88YiIBycS5Dil7iUd7+S+pE8+RqvC
         eO45QBOKfuIsoBBdasHzIzSIzze4XpaR3CYqelN2vjT9MOcFXA6KsgEMxu6IgOTG4PQu
         JTUP7X66IyXvBEqNj7lCJI2B8RUM/fk8z2e45Qpveu6w48wDdBf5wvr4NfpXpF7OXUsK
         gJbYqV7FgAXx17PzYeNs11QB4nKmClP+IGunMHwMZzkJy2qg1EIDd0bCgSyXojXmtKtx
         eUAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697920167; x=1698524967;
        h=content-transfer-encoding:autocrypt:subject:from:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=D13Z/xJvQGdSgHR1Na3ohcQ0IUYC2QkXr0CnFVaQ3Bo=;
        b=Ts5hkCAK9RQAhDr4QtOcYin4SI9nspcE+kjCeHw8xn8M8Rwnpz/VmqtcdmBJZJjb+2
         TPRUHnLelxlFndIeW4AVNOu60K8LNyUaDV80yzq1WhZl/gugHGDe65BJWCkFVtdMNydI
         vDzDrgcvPkDX0tqlj6m07GvVhu4wSR3KfvHQr8JhZ+sM7Cx1z4Qf+eErAeb8KEjKChTg
         EApAVDdHvp7eLuR5MPYX1WRRWGcEDoqLNyn2Hbb9kkp3iXFE0Yvp+gHBE2ykRJJaPrLI
         ZMTho9t7vCwVFLGu3hP16A/YUlPXK7J597mEg63aUoSIH1kAefT2q6Thb/07NOFp7Fgw
         K81A==
X-Gm-Message-State: AOJu0YwBJtm+m/w0kcfJun2cXjeLHwz/AhrbntvwhchFcD6MzITKcICj
	BwSuFQnBnggL9WIxeIeT81A=
X-Google-Smtp-Source: AGHT+IGnhrMUcEr813ptzY05MbjTWuUqV74tWezWE+oSJfM1bTO2Tuf4qUhdv++6+ezu+MwJa36pTA==
X-Received: by 2002:a81:7bc1:0:b0:5a7:a81d:e410 with SMTP id w184-20020a817bc1000000b005a7a81de410mr1322634ywc.18.1697920167230;
        Sat, 21 Oct 2023 13:29:27 -0700 (PDT)
Received: from ?IPV6:2600:1700:9190:ba10::42? ([2600:1700:9190:ba10::42])
        by smtp.gmail.com with ESMTPSA id s67-20020a818246000000b00583f8f41cb8sm1732326ywf.63.2023.10.21.13.29.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 21 Oct 2023 13:29:26 -0700 (PDT)
Message-ID: <0a760190-585a-4a5b-a8bb-031f6bc2fbe2@gmail.com>
Date: Sat, 21 Oct 2023 16:29:25 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Khem Raj <raj.khem@gmail.com>,
 OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
From: akuster808 <akuster808@gmail.com>
Subject: kirkstone merge request: Oct 21
Autocrypt: addr=akuster808@gmail.com; keydata=
 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
 ApZ86eOP
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 21 Oct 2023 20:29:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105626

The following changes since commit 9c5541f7e18a1fac3b8dea71e1ebb8398d58e6ff:

   python3-django: upgrade 4.2.3 -> 4.2.5 (2023-09-27 10:23:28 -0400)

are available in the Git repository at:

   https://git.openembedded.org/meta-openembedded kirkstone-next

for you to fetch changes up to 79a6f60dabad9e5b0e041efa91379447ef030482:

   mbedtls: upgrade 2.28.2 -> 2.28.5 (2023-10-17 09:07:38 -0400)

----------------------------------------------------------------
Denys Dmytriyenko (1):
       mbedtls: set up /usr/bin/hello as alternative

Gianfranco Costamagna (3):
       mosquitto: do not automatically depend on dlt-daemon, it's a 
non-mandatory logging system
       mosquitto: upgrade 2.0.15 -> 2.0.17
       mosquitto: upgrade 2.0.17 -> 2.0.18

Joe Slater (1):
       nginx: add configure option

Martin Jansa (1):
       mosquitto: add missing Upstream-Status

Meenali Gupta (1):
       open-vm-tools: fix CVE-2023-20867

Narpat Mali (1):
       python3-gevent: fix CVE-2023-41419

Polampalli, Archana (4):
       samba: fix CVE-2023-34966
       samba: fix CVE-2022-2127
       samba:fix CVE-2023-34967
       samba: fix CVE-2023-34968

Wang Mingyu (1):
       mosquitto: upgrade 2.0.14 -> 2.0.15

Yi Zhao (1):
       mbedtls: upgrade 2.28.2 -> 2.28.5

  .../mbedtls/{mbedtls_2.28.2.bb => mbedtls_2.28.5.bb} |   7 +-
  meta-networking/recipes-connectivity/mosquitto/files/2894.patch | 25 ++
  meta-networking/recipes-connectivity/mosquitto/files/2895.patch | 27 ++
  .../recipes-connectivity/mosquitto/files/mosquitto.init         | 20 +-
  .../mosquitto/{mosquitto_2.0.14.bb => mosquitto_2.0.18.bb} |   6 +-
  .../recipes-connectivity/samba/samba/CVE-2022-2127.patch        | 44 ++
  .../recipes-connectivity/samba/samba/CVE-2023-34966_0001.patch  | 78 ++++
  .../recipes-connectivity/samba/samba/CVE-2023-34966_0002.patch  | 140 
++++++
  .../recipes-connectivity/samba/samba/CVE-2023-34967_0001.patch  | 178 
++++++++
  .../recipes-connectivity/samba/samba/CVE-2023-34967_0002.patch  | 125 
++++++
  .../recipes-connectivity/samba/samba/CVE-2023-34968_0001.patch  | 104 
+++++
  .../recipes-connectivity/samba/samba/CVE-2023-34968_0002.patch  | 39 ++
  .../recipes-connectivity/samba/samba/CVE-2023-34968_0003.patch  | 65 +++
  .../recipes-connectivity/samba/samba/CVE-2023-34968_0004.patch  | 85 ++++
  .../recipes-connectivity/samba/samba/CVE-2023-34968_0005.patch  | 83 ++++
  .../recipes-connectivity/samba/samba/CVE-2023-34968_0006.patch  | 57 +++
  .../recipes-connectivity/samba/samba/CVE-2023-34968_0007.patch  | 49 ++
  .../recipes-connectivity/samba/samba/CVE-2023-34968_0008.patch  | 62 +++
  .../recipes-connectivity/samba/samba/CVE-2023-34968_0009.patch  | 465 
+++++++++++++++++++
  .../recipes-connectivity/samba/samba/CVE-2023-34968_0010.patch  | 484 
++++++++++++++++++++
  .../recipes-connectivity/samba/samba/CVE-2023-34968_0011.patch  | 295 
++++++++++++
  meta-networking/recipes-connectivity/samba/samba_4.14.14.bb     | 16 +
  .../open-vm-tools/open-vm-tools/CVE-2023-20867.patch            | 158 
+++++++
  .../recipes-support/open-vm-tools/open-vm-tools_11.3.5.bb       | 1 +
  .../recipes-devtools/python/python3-gevent/CVE-2023-41419.patch | 673 
++++++++++++++++++++++++++++
  meta-python/recipes-devtools/python/python3-gevent_21.12.0.bb   | 2 +
  .../recipes-httpd/nginx/files/0001-configure-libxslt-conf.patch | 39 ++
  meta-webserver/recipes-httpd/nginx/nginx.inc                    | 3 +
  28 files changed, 3316 insertions(+), 14 deletions(-)
  rename meta-networking/recipes-connectivity/mbedtls/{mbedtls_2.28.2.bb 
=> mbedtls_2.28.5.bb} (91%)
  create mode 100644 
meta-networking/recipes-connectivity/mosquitto/files/2894.patch
  create mode 100644 
meta-networking/recipes-connectivity/mosquitto/files/2895.patch
  rename 
meta-networking/recipes-connectivity/mosquitto/{mosquitto_2.0.14.bb => 
mosquitto_2.0.18.bb} (94%)
  create mode 100644 
meta-networking/recipes-connectivity/samba/samba/CVE-2022-2127.patch
  create mode 100644 
meta-networking/recipes-connectivity/samba/samba/CVE-2023-34966_0001.patch
  create mode 100644 
meta-networking/recipes-connectivity/samba/samba/CVE-2023-34966_0002.patch
  create mode 100644 
meta-networking/recipes-connectivity/samba/samba/CVE-2023-34967_0001.patch
  create mode 100644 
meta-networking/recipes-connectivity/samba/samba/CVE-2023-34967_0002.patch
  create mode 100644 
meta-networking/recipes-connectivity/samba/samba/CVE-2023-34968_0001.patch
  create mode 100644 
meta-networking/recipes-connectivity/samba/samba/CVE-2023-34968_0002.patch
  create mode 100644 
meta-networking/recipes-connectivity/samba/samba/CVE-2023-34968_0003.patch
  create mode 100644 
meta-networking/recipes-connectivity/samba/samba/CVE-2023-34968_0004.patch
  create mode 100644 
meta-networking/recipes-connectivity/samba/samba/CVE-2023-34968_0005.patch
  create mode 100644 
meta-networking/recipes-connectivity/samba/samba/CVE-2023-34968_0006.patch
  create mode 100644 
meta-networking/recipes-connectivity/samba/samba/CVE-2023-34968_0007.patch
  create mode 100644 
meta-networking/recipes-connectivity/samba/samba/CVE-2023-34968_0008.patch
  create mode 100644 
meta-networking/recipes-connectivity/samba/samba/CVE-2023-34968_0009.patch
  create mode 100644 
meta-networking/recipes-connectivity/samba/samba/CVE-2023-34968_0010.patch
  create mode 100644 
meta-networking/recipes-connectivity/samba/samba/CVE-2023-34968_0011.patch
  create mode 100644 
meta-networking/recipes-support/open-vm-tools/open-vm-tools/CVE-2023-20867.patch
  create mode 100644 
meta-python/recipes-devtools/python/python3-gevent/CVE-2023-41419.patch
  create mode 100644 
meta-webserver/recipes-httpd/nginx/files/0001-configure-libxslt-conf.patch


