Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C183CAC5B5
	for <webhook@archiver.kernel.org>; Mon, 29 Sep 2025 13:04:35 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.web10.53200.1759151068974158230
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 29 Sep 2025 06:04:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PcyTCPlg;
 spf=pass (domain: gmail.com, ip: 209.85.218.52, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-b2ef8e00becso493455166b.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 29 Sep 2025 06:04:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759151067; x=1759755867; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=mfFCAFEgDnu5FkCwNM+c5EziUaHuCyvAs9Ccp3GqjNA=;
        b=PcyTCPlgPEPGTxVzpF4a64OYWMOk6nlqPlpy4W5AUVXSbe4UaedqiR72pH1v3daeCo
         /I43pGfrTN8dV0bSiyoqdl9wS9AeN1Kq2hi/ttTO+LxewcNQvtdQxx4wLyUOSRw5bFY2
         6yq0XZH5cYd/ROIGDubHu4GrXWgGPab2Q52gF7zeGH689trBn3l3RdzzK74Qysl9qScX
         YyciG87U1Y3Y1kdHxCB0YplTcU7UZ4QglwUpMWRZ3msLkM78l/TfCtksWCwXXj3/d4sK
         9Ap4PbdlRSZoUxkHvkJq6STNE/p9iCHu4caAILTWCuha3SnWLL1n8Y1EGM57l5/iDidn
         WlXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759151067; x=1759755867;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mfFCAFEgDnu5FkCwNM+c5EziUaHuCyvAs9Ccp3GqjNA=;
        b=G8ThiWsOyaqwxPIpjrMPczk0jiPQl3ek5pAi/735V2mlcTm4TyCfJwpknN2CUE/jEg
         p5osLrj0m4MT1H74hOjgpw5SDaluCzdOX6rj/xhEsa3L59FiLRG+3zT1uuqRPvTcfiUG
         waoagYBntDjrnSYWleI4rCEcPeknc9nKf1W/qvKNIVhd6cpnVG0m83AWu4tuW4pSckqP
         1g61Yl6z7sjagFgbgVNV71eG0Q3MZ292S7g/pQhFIEGUCH1qfNES6C0JCiK9Jsx9Srri
         yayXXtt6AYk5O9dSXtUEGyhkJ7zzL4/wi7NWaitWrKv+aTEqunT0X/mKI6pstMp5sVax
         Aqsg==
X-Gm-Message-State: AOJu0Yzf1bNLGP4KJ0SMtUiUoUhJts7BZj4A9xs/1lQBdD68MLxoQwRP
	CqiOfq98QpsfNxHSJphzFzQDyqtxuowoKcUujdvV6amR+eDA0waebvnVG3AfWA==
X-Gm-Gg: ASbGncuKLiqqGOmaa0TOII9rOWdDTBjEimD1ryMV19GM6uti/NMzzZkSaA2mQCJuiAv
	oopqwtv2xo4hjIrSunEg/LEXDQvLSPk4k7D3UJBeS4zwVuPr9QvXY5HERef4pthnVwycSkxY0h7
	nCk4JEqJemlF+dmpPWktMMOFMxBB8KrpQyVj3QXz9amfkxInC0U7SUvOX5PVwZ68E/vv24OumcA
	FFIMcDRvOMUiX9hlMp8PolYnZzNQeaFhjQD7cLPo+3CH/ETw9NlhwN5ZeQ/cfTc+7bTBNqml9Lg
	HrEemKlssDu7GUqoWRTurBJX9q4gxqeWkqDa6biCV259FKARmljKabOfmSglu8BhgZx/3lFZH6S
	S+oUt7JtsRGrBYnWfVCQJ
X-Google-Smtp-Source: AGHT+IECm/Wsh/LgZzojaN/XGe4YY58I4+ZwGosWE0MbjP41qlMeK0UMMrS1AMaBaWZWjROaFRxrhA==
X-Received: by 2002:a17:907:9689:b0:b30:ed1f:894c with SMTP id a640c23a62f3a-b34be6d7425mr1919193566b.43.1759151067220;
        Mon, 29 Sep 2025 06:04:27 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b3cbd81bcfdsm335426166b.82.2025.09.29.06.04.25
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Sep 2025 06:04:26 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 00/22] Cherry-picks from Master Batch E
Date: Mon, 29 Sep 2025 15:04:03 +0200
Message-ID: <20250929130425.2912077-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 29 Sep 2025 13:04:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120013

This is the 5th batch of cherry picks from Master, intended for Kirkstone.

These have been build-tested successfully on arm, aarch64, x86 and x86-64 platforms.

Please let me know if you have any questions or concerns about any of these patches.

Thank you.

---

Khem Raj (2):
  ssmping: Use debian mirror for SRC_URI
  debootstrap: Update SRC_URI to point to valid URL

Matthias Klein (3):
  paho-mqtt-c: upgrade 1.3.10 -> 1.3.11
  paho-mqtt-c: upgrade 1.3.11 -> 1.3.12
  paho-mqtt-c: upgrade 1.3.12 -> 1.3.13

Peter Kjellerstedt (2):
  paho-mqtt-c: Improve the license information
  recipes: Remove double protocol= from SRC_URIs

Randy MacLeod (2):
  pimd: switch SRC_URI to https
  tnftp: switch the SRC_URI to https

Wang Mingyu (7):
  ndisc6: upgrade 1.0.6 -> 1.0.7
  ndisc6: upgrade 1.0.7 -> 1.0.8
  uftp: upgrade 5.0 -> 5.0.1
  uftp: upgrade 5.0.1 -> 5.0.2
  uftp: upgrade 5.0.2 -> 5.0.3
  iperf3: upgrade 3.14 -> 3.15
  flashrom: upgrade 1.2 -> 1.2.1

Yi Zhao (4):
  libtalloc: upgrade 2.3.3 -> 2.3.4
  lksctp-tools: upgrade 1.0.19 -> 1.0.20
  lksctp-tools: upgrade 1.0.20 -> 1.0.21
  libtdb: upgrade 1.4.3 -> 1.4.7

wangmy (2):
  cifs-utils: upgrade 6.14 -> 6.15
  iwd: upgrade 1.26 -> 1.27

 ...{cifs-utils_6.14.bb => cifs-utils_6.15.bb} |   7 +-
 .../cifs/files/CVE-2022-27239.patch           |  40 ------
 .../cifs/files/CVE-2022-29869.patch           |  48 -------
 ...-Add-configure-options-for-packages.patch} |  12 +-
 ...pyext_PATTERN-for-cross-compilation.patch} |  10 +-
 ...wscript-skip-checking-PYTHONHASHSEED.patch |  30 ++++
 .../libtalloc/avoid-attr-unless-wanted.patch  |  19 ++-
 ...{libtalloc_2.3.3.bb => libtalloc_2.3.4.bb} |  10 +-
 ...-Add-configure-options-for-packages.patch} |  21 ++-
 ...pyext_PATTERN-for-cross-compilation.patch} |  10 +-
 ...wscript-skip-checking-PYTHONHASHSEED.patch |  30 ++++
 .../{libtdb_1.4.3.bb => libtdb_1.4.7.bb}      |  12 +-
 ...tools_1.0.19.bb => lksctp-tools_1.0.21.bb} |  12 +-
 .../{ndisc6_1.0.6.bb => ndisc6_1.0.8.bb}      |   2 +-
 .../recipes-support/pimd/pimd_2.3.2.bb        |   3 +-
 .../recipes-support/ssmping/ssmping_0.9.1.bb  |   3 +-
 .../recipes-support/tnftp/tnftp_20210827.bb   |   2 +-
 .../uftp/{uftp_5.0.bb => uftp_5.0.3.bb}       |   2 +-
 .../recipes-support/unbound/unbound_1.15.0.bb |   2 +-
 .../iperf3/iperf3/CVE-2023-7250.patch         | 133 ------------------
 .../iperf3/{iperf3_3.14.bb => iperf3_3.15.bb} |   3 +-
 ...typecast-enum-conversions-explicitly.patch |  45 ------
 .../{flashrom_1.2.bb => flashrom_1.2.1.bb}    |   4 +-
 .../iwd/{iwd_1.26.bb => iwd_1.27.bb}          |   2 +-
 .../obex/obex-data-server_0.4.6.bb            |   3 +-
 ...mqtt-c_1.3.10.bb => paho-mqtt-c_1.3.13.bb} |   7 +-
 .../paho-mqtt-cpp/paho-mqtt-cpp_1.2.0.bb      |   2 +-
 meta-oe/recipes-core/emlog/emlog.inc          |   2 +-
 meta-oe/recipes-core/mdbus2/mdbus2_git.bb     |   2 +-
 meta-oe/recipes-devtools/ltrace/ltrace_git.bb |   2 +-
 .../cmpi-bindings/cmpi-bindings_1.0.1.bb      |   2 +-
 .../jpnevulator/jpnevulator_git.bb            |   2 +-
 meta-oe/recipes-extended/mraa/mraa_git.bb     |   2 +-
 .../recipes-extended/rrdtool/rrdtool_1.8.0.bb |   2 +-
 meta-oe/recipes-extended/upm/upm_git.bb       |   2 +-
 .../renderdoc/renderdoc_1.13.bb               |   2 +-
 36 files changed, 142 insertions(+), 350 deletions(-)
 rename meta-networking/recipes-support/cifs/{cifs-utils_6.14.bb => cifs-utils_6.15.bb} (90%)
 delete mode 100644 meta-networking/recipes-support/cifs/files/CVE-2022-27239.patch
 delete mode 100644 meta-networking/recipes-support/cifs/files/CVE-2022-29869.patch
 rename meta-networking/recipes-support/libtalloc/libtalloc/{options-2.2.0.patch => 0001-talloc-Add-configure-options-for-packages.patch} (96%)
 rename meta-networking/recipes-support/libtalloc/libtalloc/{0001-Fix-pyext_PATTERN-for-cross-compilation.patch => 0002-Fix-pyext_PATTERN-for-cross-compilation.patch} (87%)
 create mode 100644 meta-networking/recipes-support/libtalloc/libtalloc/0003-wscript-skip-checking-PYTHONHASHSEED.patch
 rename meta-networking/recipes-support/libtalloc/{libtalloc_2.3.3.bb => libtalloc_2.3.4.bb} (85%)
 rename meta-networking/recipes-support/libtdb/libtdb/{tdb-Add-configure-options-for-packages.patch => 0001-tdb-Add-configure-options-for-packages.patch} (93%)
 rename meta-networking/recipes-support/libtdb/libtdb/{0001-Fix-pyext_PATTERN-for-cross-compilation.patch => 0002-Fix-pyext_PATTERN-for-cross-compilation.patch} (83%)
 create mode 100644 meta-networking/recipes-support/libtdb/libtdb/0003-wscript-skip-checking-PYTHONHASHSEED.patch
 rename meta-networking/recipes-support/libtdb/{libtdb_1.4.3.bb => libtdb_1.4.7.bb} (78%)
 rename meta-networking/recipes-support/lksctp-tools/{lksctp-tools_1.0.19.bb => lksctp-tools_1.0.21.bb} (80%)
 rename meta-networking/recipes-support/ndisc6/{ndisc6_1.0.6.bb => ndisc6_1.0.8.bb} (98%)
 rename meta-networking/recipes-support/uftp/{uftp_5.0.bb => uftp_5.0.3.bb} (84%)
 delete mode 100644 meta-oe/recipes-benchmark/iperf3/iperf3/CVE-2023-7250.patch
 rename meta-oe/recipes-benchmark/iperf3/{iperf3_3.14.bb => iperf3_3.15.bb} (93%)
 delete mode 100644 meta-oe/recipes-bsp/flashrom/flashrom/0001-typecast-enum-conversions-explicitly.patch
 rename meta-oe/recipes-bsp/flashrom/{flashrom_1.2.bb => flashrom_1.2.1.bb} (79%)
 rename meta-oe/recipes-connectivity/iwd/{iwd_1.26.bb => iwd_1.27.bb} (94%)
 rename meta-oe/recipes-connectivity/paho-mqtt-c/{paho-mqtt-c_1.3.10.bb => paho-mqtt-c_1.3.13.bb} (75%)


