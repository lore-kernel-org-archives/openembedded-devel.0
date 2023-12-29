Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5308C47074
	for <webhook@archiver.kernel.org>; Fri, 29 Dec 2023 19:02:39 +0000 (UTC)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
 by mx.groups.io with SMTP id smtpd.web10.156001.1703876553626506405
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 29 Dec 2023 11:02:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=aClDLfH1;
 spf=pass (domain: gmail.com, ip: 209.85.128.178, mailfrom: akuster808@gmail.com)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-5edbcdc323dso30244077b3.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 29 Dec 2023 11:02:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703876552; x=1704481352; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=AZzSF0c+uCExX3gBi16vIEFiGsUWFW2AI+WlrJLDkf0=;
        b=aClDLfH1doqrrH5xfrUSrrev21eMcZfZsiWPHLLqK/ZHZWa8piuDLj4D06fMv4Ena9
         zapeRBihovc7k3iUaklFm7DN7PQWMT/cXyWC4vVFURBrMjEv9G4PaERwDc3LYkHv8LiQ
         Xk9aGuX6v1374XKxe3an33m7ybOe57g7VmbkMfpAEbxsWL4d9HEhD2sPdwNVwEsGJGl2
         FV+TbeNo5YKs5uaC+KY6ToiDQK3waE8JeN8GTgj5nMy9WKbnk5VwH4ULDIT1dF2amrur
         jWW465PiIGR/1isNdnE2rNYjImR5HLalEIkv25n8ziwXmA7poFEeQSlO2HBSBEUUMMbM
         eufQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703876552; x=1704481352;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AZzSF0c+uCExX3gBi16vIEFiGsUWFW2AI+WlrJLDkf0=;
        b=N9aSEH/Ty50XbKiiHB86J+Z5Qu1VHah3yxve0hYczjXbEJ/rWe+nN+59L5hb/Yla0P
         o/ASdZHwhfdrhAJcv+hRBZmzM+A0tbwWVzZoeJNoj0pMAMWJbVOOSKVh7Fi+5fv/Jzew
         xy22OiStAj5exoE/n/Z76RotK1cuulI9TvnZ0TWMdJ1SEpOPOGdeXXveRAuED2DEgqS5
         FINJKS0kopmNp0RfYVQJWteU4Ekbl5H2XBJBmLgrwZsieZdgvCEVYNC5MMN+wzxagis5
         rVYf124wzbJD7B6rkcbo9Mu0xEc+XRdfdKehRMU6sd5SswOgNzs5xQgFvlVsQMyNT7ps
         Qx3w==
X-Gm-Message-State: AOJu0YxnxsdqpTSTcZFm+kjGlNCo6/p0T0UuiXleFemsTWaloge/Jjhj
	vcXtzQ6xUxkkebGBRfJHXjTW1A68git5fw==
X-Google-Smtp-Source: AGHT+IGS488RTSnuXel02Oj//M7syxxT5Qxk9L3x+HquJJ9956kZU+jF5s2IIRjiYWoGeKI44ma6fA==
X-Received: by 2002:a0d:e896:0:b0:5e8:851f:7745 with SMTP id r144-20020a0de896000000b005e8851f7745mr7685494ywe.48.1703876552417;
        Fri, 29 Dec 2023 11:02:32 -0800 (PST)
Received: from keaua.caveonetworks.com ([2600:1700:9190:ba10:2080:c728:4a66:97cc])
        by smtp.gmail.com with ESMTPSA id d13-20020a81ab4d000000b005e71fbbc661sm8570683ywk.143.2023.12.29.11.02.31
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Dec 2023 11:02:31 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][nanbield][PATCH 00/17] Patch review
Date: Fri, 29 Dec 2023 14:02:13 -0500
Message-Id: <20231229190230.135480-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 29 Dec 2023 19:02:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107882

Please have comments back by Dec 31, 2023

Dylan Turner (1):
  apache2: v2.4.57 to v2.4.58 to fix CVE-2023-43622

Edi Feschiyan (1):
  libbytesize: update SRC_URI

Fabio Estevam (3):
  openocd: Use https for github
  python3-piccata: Use https for github
  multipath-tools: Use https for github

Jeffrey Pautler (1):
  apache2: add vendor to product name used for CVE checking

Jonas Gorski (1):
  frr: fix CVEs CVE-2023-4675{2,3} and CVE-2023-4723{4,5}

Khem Raj (3):
  hwdata: upgrade 0.370 -> 0.375
  openvpn: upgrade 2.6.3 -> 2.6.6
  python3-scapy: upgrade to latest revision

Ross Burton (1):
  yajl: fix CVE-2017-16516, CVE-2022-24795, CVE-2023-33460

Wang Mingyu (3):
  hdf5: Fix install conflict when enable multilib.
  dnf-plugin-tui: Recover BBCLASSEXTEND variants
  strongswan: upgrade 5.9.11 -> 5.9.12

Zoltán Böszörményi (3):
  python3-ninja-syntax: Set BBCLASSEXTEND = "native nativesdk"
  python3-ninja: Set BBCLASSEXTEND = "native nativesdk"
  geos: Fix packaging

 .../python/python3-scapy_2.5.0.bb             |   2 +-
 .../frr/frr/CVE-2023-46752.patch              | 125 ++++++++++++++++++
 .../frr/frr/CVE-2023-46753.patch              | 117 ++++++++++++++++
 .../frr/frr/CVE-2023-47234.patch              |  95 +++++++++++++
 .../frr/frr/CVE-2023-47235.patch              | 112 ++++++++++++++++
 .../recipes-protocols/frr/frr_9.0.1.bb        |   6 +
 .../{openvpn_2.6.3.bb => openvpn_2.6.6.bb}    |   4 +-
 ...ongswan_5.9.11.bb => strongswan_5.9.12.bb} |   2 +-
 .../dnf-plugin-tui/dnf-plugin-tui_git.bb      |   2 +
 .../recipes-devtools/openocd/openocd_git.bb   |   2 +-
 .../yajl/yajl/CVE-2017-16516.patch            |  37 ++++++
 .../yajl/yajl/CVE-2022-24795.patch            |  59 +++++++++
 .../yajl/yajl/CVE-2023-33460.patch            |  35 +++++
 meta-oe/recipes-devtools/yajl/yajl_2.1.0.bb   |   6 +-
 .../recipes-navigation/geos/geos_3.12.0.bb    |   2 +-
 meta-oe/recipes-support/hdf5/hdf5_1.14.2.bb   |   6 +-
 .../{hwdata_0.370.bb => hwdata_0.375.bb}      |   2 +-
 .../libbytesize/libbytesize_2.10.bb           |   2 +-
 .../multipath-tools/multipath-tools_0.9.3.bb  |   2 +-
 .../python/python3-ninja-syntax_1.7.2.bb      |   4 +-
 .../python/python3-ninja_1.11.1.bb            |   1 +
 .../python3-piccata/python3-piccata_2.0.3.bb  |   2 +-
 ...config9.m4-Add-server-directory-to-i.patch |  31 -----
 .../{apache2_2.4.57.bb => apache2_2.4.58.bb}  |   5 +-
 24 files changed, 614 insertions(+), 47 deletions(-)
 create mode 100644 meta-networking/recipes-protocols/frr/frr/CVE-2023-46752.patch
 create mode 100644 meta-networking/recipes-protocols/frr/frr/CVE-2023-46753.patch
 create mode 100644 meta-networking/recipes-protocols/frr/frr/CVE-2023-47234.patch
 create mode 100644 meta-networking/recipes-protocols/frr/frr/CVE-2023-47235.patch
 rename meta-networking/recipes-support/openvpn/{openvpn_2.6.3.bb => openvpn_2.6.6.bb} (95%)
 rename meta-networking/recipes-support/strongswan/{strongswan_5.9.11.bb => strongswan_5.9.12.bb} (99%)
 create mode 100644 meta-oe/recipes-devtools/yajl/yajl/CVE-2017-16516.patch
 create mode 100644 meta-oe/recipes-devtools/yajl/yajl/CVE-2022-24795.patch
 create mode 100644 meta-oe/recipes-devtools/yajl/yajl/CVE-2023-33460.patch
 rename meta-oe/recipes-support/hwdata/{hwdata_0.370.bb => hwdata_0.375.bb} (91%)
 delete mode 100644 meta-webserver/recipes-httpd/apache2/apache2/0011-modules-mappers-config9.m4-Add-server-directory-to-i.patch
 rename meta-webserver/recipes-httpd/apache2/{apache2_2.4.57.bb => apache2_2.4.58.bb} (98%)

-- 
2.34.1


