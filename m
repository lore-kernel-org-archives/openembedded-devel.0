Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1821.1795113212711369227
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 19 Nov 2026 10:33:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=QRXjDqep;
 spf=pass (domain: gmail.com, ip: 209.85.216.44, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3b179528d56so62364a91.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 19 Nov 2026 10:33:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795113212; x=1795718012; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BO2/mSygE3CT3PHNE3GXhVXeOIFi6XL/RtUHahXsd58=;
        b=QRXjDqepc/QTj+LGLkMwtogaPj8tKiF5LlaW1/YWz3pR3tL4AjXU2W3RoffARw1WcL
         ggG6AUuGSwuXdqPlTRMo4vqiOJBAZbESB8lYWckoLH5NeOgCiAiomOjQmT7metgHxIpo
         gzG3jeWwGAeMEAN/as2sCc2722cA5VtsaoOwWdYxkE8nGoTeWds9tXP7C2xhep11o16W
         KwXbcDXFi8ReudJwJbb7yXhsHBDNuDx3M/8Iv97EUs48sFT+vZWyeNDfoYkeUOgdowrx
         RrhF+kGEtsPUCQX2In2GIthCOA8QhQgRgFsjqxXiEMmP6YVJW7iBdWs9clWXu3/s/f2v
         f2yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795113212; x=1795718012;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BO2/mSygE3CT3PHNE3GXhVXeOIFi6XL/RtUHahXsd58=;
        b=CtzCDu4HAy6XnQDLKEJVar1ldRQpFOpk+FFqIIV9gcQZ79KxQLoZSmt9zGnkDctcJI
         1EBaSrCyysbcGYqZg4KQKcJo27yOtM8cboSKxqflGnqWdo7d477yR5QTVI/ub8C8bPeL
         CfvqtFVYpvjzblg2rw44j4cX35xLggpmuZA25JZsxAP7f1P6mBUEZmWgGFwa9+7XDPDH
         Hs1PmacfiN21JVBjHduM6LsKWDJoOR9Hod2RsCLaulsQDBHfYtHyLxvFrQjpPSIHRyMC
         iZKuD/C2LuUHemxQk4BWkmS1ABYM+X41zkoreDjg9Hj76iYRDUsztDA6RWmTDsbNykP9
         G2pg==
X-Gm-Message-State: APuU4Z8y08jmse2o7k9S7U3kxOTxjn8cwOwWzk3+oQ1c8oeyP5mGah8+
	1DczapnAyUEH9KnqvN5/0n7bbdMdemvQSvjGpfidVOYV47bKa51TlSpXhjx/oOfc
X-Gm-Gg: AZFdTZeVvb3GZ8DWjJLrciKhld962tAqHKru/cE4r9fJGFHWws2WWuifyfY97NHcI+i
	O525NjKxcyDZNOWPS5WAmPbT2fFGeN/vO3FirAB6B0B00t6GOIrmB7m9+rDdjEB9kXMORbwlE6P
	2+gbXsjPSYfGTpUBscgZBef2yltxgf6h9CcuVJVFSD8wFwEmPHxIwPd/h4TPx+TNG5t8orZdyXI
	4uUdSHCrTAOQvWTCohY1lTxDW479EkLjRsBq+Ww/IkQa+2zsPQzAvuEpvdikxrcw3BId91mncLI
	UMZeyHov3j+wMG8W/CUfhz8TsZJ0CmO+uL0JTjIb7e3+7VcVg+ZGAoHlbz6y/x4IgZiMODIY00i
	shwoQrMClRqZYdYDxy9TUKGhTtCdy5+LAwZ4UERrF4VwT3jeeZNp+/x6YMctwbJlXiiY0fUa5wU
	Y1XPf8lRu/yLXJNjV+7NU7aHHUfkTm0E67+1GUWBMds1keUTSKcTsI21kynRLiAChD7jFBC0cG+
	l49ls0BfheALqS8AGACqzoLVWThEbQ5tZutcXeZt+7JtaOGyelNQ2PrVDmJ5vFQl494aOueo0hy
	BfRv6mrOko4vCw78iTN5SnEhkrEQN2ft0iPnyo7HLr3OAEC7PtQAuylU/5a4Lw==
X-Received: by 2002:a17:90b:442c:b0:3a7:ef4:164b with SMTP id 98e67ed59e1d1-3b41c7d5c64mr220046a91.2.1795113211920;
        Thu, 19 Nov 2026 10:33:31 -0800 (PST)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.. ([147.161.217.9])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b405d63728sm3956238a91.8.2026.11.19.10.33.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 10:33:31 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Nate Kent <nate@nkent.net>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>,
	Khem Raj <khem.raj@oss.qualcomm.com>,
	Peter Marko <peter.marko@siemens.com>,
	Leon Anavi <leon.anavi@konsulko.com>,
	Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
	Jason Schonberg <schonm@gmail.com>,
	Johannes Schneider <johannes.schneider@leica-geosystems.com>,
	Martin Siegumfeldt <mns@gomspace.com>,
	James Lee <james@codeconstruct.com.au>,
	Markus Volk <f_l_k@t-online.de>,
	Awais Belal <awais.belal@gmail.com>,
	Armin Kuster <akuster808@gmail.com>,
	Mike Looijmans <mike.looijmans@topic.nl>,
	Gyorgy Sarvari <skandigraun@gmail.com>,
	Anuj Mittal <anuj.mittal@oss.qualcomm.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [blacksail][PATCH 00/64] Blacksail pull request
Date: Fri, 20 Nov 2026 07:32:42 +1300
Message-ID: <cover.1795112941.git.ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 19 Nov 2026 18:33:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132690
Content-Type: text/plain; charset="utf-8"

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Please merge these changes in blacksail. Tested locally and on autobuilder.

https://autobuilder.yoctoproject.org/valkyrie/#/builders/81/builds/1984

The following changes since commit bb956bf8ff7a32f31deaa83e96880d10ab564d14:

  redis: upgrade 8.10.2 -> 8.10.3 (2026-10-28 08:22:29 +1300)

are available in the Git repository at:

  https://git.openembedded.org/meta-openembedded-contrib ankurt/blacksail
  https://git.openembedded.org/meta-openembedded-contrib/log/?h=ankurt/blacksail

for you to fetch changes up to a0413b03fe80a66a454e5364768d36cd1fdbeb7e:

  libplacebo: update SRC_URI branch (2026-11-19 07:43:14 +1300)

----------------------------------------------------------------

Ankur Tyagi (41):
  zchunk: upgrade 1.5.4 -> 1.5.5
  tcpreplay: upgrade 4.6.1 -> 4.6.2
  proftpd: upgrade 1.3.9d -> 1.3.9e
  json-schema-validator: upgrade 2.4.0 -> 2.4.1
  haveged: upgrade 1.9.26 -> 1.9.27
  libraw: upgrade 0.22.2 -> 0.22.3
  assimp: patch CVE-2026-117608
  flatcc: patch CVE-2026-116733
  flatcc: patch CVE-2026-116734
  ndpi: patch CVE-2026-116744
  hdf5: patch CVE-2026-19026, CVE-2026-19027 and CVE-2026-19028
  hdf5: patch CVE-2026-19023 and CVE-2026-19024
  hdf5: patch CVE-2026-120689
  hdf5: patch CVE-2026-120754 and CVE-2026-120755
  hdf5: patch CVE-2026-120756
  hdf5: patch CVE-2026-120757
  hdf5: patch CVE-2026-120758
  libgphoto2: patch CVE-2026-120451
  libgphoto2: patch CVE-2026-120452
  python3-django: upgrade 5.2.18 -> 5.2.19
  python3-django: upgrade 6.0.9 -> 6.0.10
  uriparser: upgrade 1.0.2 -> 1.0.3
  weechat: upgrade 4.10.1 -> 4.10.2
  libopenmpt: upgrade 0.8.9 -> 0.8.10
  7zip: upgrade 26.05 -> 26.06
  apitrace: patch CVE-2026-126050
  cockpit: mark CVE-2024-2947 fixed
  brotli: set CVE_PRODUCT to "google:brotli"
  ettercap: patch CVEs CVE-2026-125400 - CVE-2026-125406
  tinyproxy: patch CVE-2026-125371
  webmin: patch CVE-2026-125391
  webmin: patch CVE-2026-125392
  python3-aiohttp: patch CVE-2026-111063
  python3-aiohttp: patch CVE-2026-111065
  python3-aiohttp: patch CVE-2026-111066
  python3-aiohttp: patch CVE-2026-111748
  python3-aiohttp: patch CVE-2026-111749
  python3-aiohttp: patch CVE-2026-111750
  python3-filelock: upgrade 4.0.4 -> 4.0.12
  mpv: patch CVE-2026-123095
  libplacebo: update SRC_URI branch

Awais Belal (2):
  mongodb: fix build with python 3.12
  mongodb: update to 4.4.29

Gyorgy Sarvari (2):
  mongodb: upgrade 4.4.29 -> 4.4.30
  mongodb: ignore CVE-2025-14911

James Lee (1):
  mctp: upgrade 2.6.1 -> 2.6.2

Jason Schonberg (1):
  cockpit: upgrade 366 -> 366.1

Johannes Schneider (1):
  imx-cst: restore PKCS#11 signing on OpenSSL 4 via the provider

Khem Raj (5):
  mongodb: Fix build with current python, SCons, clang and OpenSSL
  mongodb: Backport fix for SERVER-49099
  mongodb: Keep build paths out of buildInfo
  frr: Fix build with bison rejecting paths in output directives
  tuna: Fix build with PEP 517 frontends

Leon Anavi (5):
  weechat: Upgrade 4.10.0 -> 4.10.1
  valkey: Upgrade 9.1.2 -> 9.1.3
  python3-httplib2: Upgrade 0.32.0 -> 0.32.1
  python3-tzdata: Upgrade 2026.5 -> 2026.6
  libmikmod: Upgrade 3.3.15 -> 3.3.16

Markus Volk (2):
  mpv: fix a file descriptor leak in the render API
  mpv: make the drmprime overlay framebuffer the whole frame

Martin Siegumfeldt (1):
  spitools: upgrade 1.1.1 -> 1.2.0

Nate Kent (1):
  nng: correct upstream branch name

Peter Kjellerstedt (1):
  glaze: Install the CMake files in /usr/lib/cmake/glaze (as intended)

Peter Marko (1):
  libwebsockets: patch CVE-2026-114550

 ...bopenmpt_0.8.9.bb => libopenmpt_0.8.10.bb} |   2 +-
 .../nanomsg/nng_1.12.3.bb                     |   2 +-
 .../{proftpd_1.3.9d.bb => proftpd_1.3.9e.bb}  |   2 +-
 .../{weechat_4.10.0.bb => weechat_4.10.2.bb}  |   2 +-
 ...ths-in-bison-output-defines-directiv.patch |  54 ++
 .../recipes-protocols/frr/frr_10.6.2.bb       |   1 +
 .../ettercap/ettercap_0.8.4.1.bb              |   4 +
 .../ettercap/files/CVE-2026-125400-06_1.patch | 121 +++
 .../ettercap/files/CVE-2026-125400-06_2.patch | 149 ++++
 .../ettercap/files/CVE-2026-125400-06_3.patch |  92 ++
 .../ettercap/files/CVE-2026-125400-06_4.patch | 807 ++++++++++++++++++
 meta-networking/recipes-support/mctp/mctp.inc |   2 +-
 .../mctp/{mctp_2.6.1.bb => mctp_2.6.2.bb}     |   0
 .../mctp/{mctpd_2.6.1.bb => mctpd_2.6.2.bb}   |   0
 .../ntopng/files/CVE-2026-116744.patch        |  33 +
 .../recipes-support/ntopng/ndpi_5.0.bb        |   1 +
 ...ix-struct-ethhdr-redefinition-on-mus.patch |  43 -
 ...{tcpreplay_4.6.1.bb => tcpreplay_4.6.2.bb} |   5 +-
 .../tinyproxy/tinyproxy/CVE-2026-125371.patch |  70 ++
 .../tinyproxy/tinyproxy_1.11.3.bb             |   1 +
 ...stead-of-pkg_resources-for-version-p.patch |  51 ++
 ...001-free_mon-Include-missing-cstdint.patch |  28 -
 ...econfig.py-python-3.12-compatibility.patch |  57 ++
 ...call-to-CheckLibWithHeader-as-a-keyw.patch |  56 ++
 .../0003-boost-Fix-build-with-clang-23.patch  | 176 ++++
 .../0004-ssl-Fix-build-with-OpenSSL-4.patch   | 117 +++
 ...ove-the-Node-swap-function-in-Biggie.patch |  58 ++
 .../mongodb/mongodb/oe-buildinfo.vars         |  11 +
 .../recipes-dbs/mongodb/mongodb_git.bb        |  20 +-
 .../libwebsockets/CVE-2026-114550.patch       |  31 +
 .../libwebsockets/libwebsockets_4.5.8.bb      |   1 +
 .../apitrace/apitrace/CVE-2026-126050.patch   |  39 +
 .../apitrace/apitrace_14.0.bb                 |   1 +
 .../flatcc/flatcc/CVE-2026-116733.patch       |  30 +
 .../flatcc/flatcc/CVE-2026-116734.patch       |  30 +
 .../recipes-devtools/flatcc/flatcc_0.6.4.bb   |   5 +-
 ....4.0.bb => json-schema-validator_2.4.1.bb} |   2 +-
 .../7zip/{7zip_26.05.bb => 7zip_26.06.bb}     |   2 +-
 .../recipes-extended/brotli/brotli_1.2.1.bb   |   2 +
 .../{haveged_1.9.26.bb => haveged_1.9.27.bb}  |   2 +-
 .../{valkey_9.1.2.bb => valkey_9.1.3.bb}      |   2 +-
 .../assimp/assimp/CVE-2026-117608.patch       |  62 ++
 meta-oe/recipes-graphics/assimp/assimp_git.bb |   4 +-
 .../gphoto2/libgphoto2/CVE-2026-120451.patch  |  43 +
 .../gphoto2/libgphoto2/CVE-2026-120452.patch  |  40 +
 .../gphoto2/libgphoto2_2.5.34.bb              |   2 +
 ...ibmikmod_3.3.15.bb => libmikmod_3.3.16.bb} |   2 +-
 .../mplayer/libplacebo_7.360.1.bb             |   2 +-
 ...equire-swap_buffers-param-for-FenceS.patch |  35 +
 ...make-the-framebuffer-the-whole-frame.patch |  24 +
 .../mplayer/mpv/CVE-2026-123095.patch         |  37 +
 .../recipes-multimedia/mplayer/mpv_0.41.0.bb  |   7 +-
 meta-oe/recipes-support/glaze/glaze_8.3.0.bb  |   6 +-
 .../hdf5/files/CVE-2026-120689.patch          |  60 ++
 .../CVE-2026-120754-CVE-2026-120755.patch     | 172 ++++
 .../hdf5/files/CVE-2026-120756.patch          |  45 +
 .../hdf5/files/CVE-2026-120757.patch          |  63 ++
 .../hdf5/files/CVE-2026-120758.patch          | 143 ++++
 .../files/CVE-2026-19023-CVE-2026-19024.patch | 176 ++++
 ...-19026-CVE-2026-19027-CVE-2026-19028.patch | 579 +++++++++++++
 meta-oe/recipes-support/hdf5/hdf5_2.0.0.bb    |   7 +
 ...cs11-signing-from-engine-to-provider.patch | 236 +++++
 .../recipes-support/imx-cst/imx-cst_4.0.1.bb  |   1 +
 .../{libraw_0.22.2.bb => libraw_0.22.3.bb}    |   2 +-
 .../{spitools_1.1.1.bb => spitools_1.2.0.bb}  |   4 +-
 ...{uriparser_1.0.2.bb => uriparser_1.0.3.bb} |   2 +-
 .../{zchunk_1.5.4.bb => zchunk_1.5.5.bb}      |   4 +-
 .../python3-aiohttp/CVE-2026-111063.patch     | 136 +++
 .../python3-aiohttp/CVE-2026-111065.patch     | 172 ++++
 .../python3-aiohttp/CVE-2026-111066.patch     | 382 +++++++++
 .../python3-aiohttp/CVE-2026-111748.patch     | 170 ++++
 .../python3-aiohttp/CVE-2026-111749.patch     | 262 ++++++
 .../python3-aiohttp/CVE-2026-111750.patch     |  82 ++
 .../python/python3-aiohttp_3.14.3.bb          |   8 +
 ...ngo_5.2.18.bb => python3-django_5.2.19.bb} |   2 +-
 ...ango_6.0.9.bb => python3-django_6.0.10.bb} |   2 +-
 ...ck_4.0.4.bb => python3-filelock_4.0.12.bb} |   2 +-
 ...2_0.32.0.bb => python3-httplib2_0.32.1.bb} |   2 +-
 ...ata_2026.5.bb => python3-tzdata_2026.6.bb} |   2 +-
 ...una-Do-not-import-tuna-from-setup.py.patch |  48 ++
 .../recipes-extended/tuna/tuna_0.21.bb        |   4 +-
 .../{cockpit_366.bb => cockpit_366.1.bb}      |   3 +-
 .../webmin/files/CVE-2026-125391.patch        |  37 +
 .../webmin/files/CVE-2026-125392.patch        |  26 +
 .../recipes-webadmin/webmin/webmin_2.653.bb   |   2 +
 85 files changed, 5101 insertions(+), 111 deletions(-)
 rename meta-multimedia/recipes-multimedia/libopenmpt/{libopenmpt_0.8.9.bb => libopenmpt_0.8.10.bb} (97%)
 rename meta-networking/recipes-daemons/proftpd/{proftpd_1.3.9d.bb => proftpd_1.3.9e.bb} (99%)
 rename meta-networking/recipes-irc/weechat/{weechat_4.10.0.bb => weechat_4.10.2.bb} (95%)
 create mode 100644 meta-networking/recipes-protocols/frr/frr/0001-lib-Don-t-use-paths-in-bison-output-defines-directiv.patch
 create mode 100644 meta-networking/recipes-support/ettercap/files/CVE-2026-125400-06_1.patch
 create mode 100644 meta-networking/recipes-support/ettercap/files/CVE-2026-125400-06_2.patch
 create mode 100644 meta-networking/recipes-support/ettercap/files/CVE-2026-125400-06_3.patch
 create mode 100644 meta-networking/recipes-support/ettercap/files/CVE-2026-125400-06_4.patch
 rename meta-networking/recipes-support/mctp/{mctp_2.6.1.bb => mctp_2.6.2.bb} (100%)
 rename meta-networking/recipes-support/mctp/{mctpd_2.6.1.bb => mctpd_2.6.2.bb} (100%)
 create mode 100644 meta-networking/recipes-support/ntopng/files/CVE-2026-116744.patch
 delete mode 100644 meta-networking/recipes-support/tcpreplay/tcpreplay/0002-common-txring-fix-struct-ethhdr-redefinition-on-mus.patch
 rename meta-networking/recipes-support/tcpreplay/{tcpreplay_4.6.1.bb => tcpreplay_4.6.2.bb} (82%)
 create mode 100644 meta-networking/recipes-support/tinyproxy/tinyproxy/CVE-2026-125371.patch
 create mode 100644 meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-Use-packaging-instead-of-pkg_resources-for-version-p.patch
 delete mode 100644 meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-free_mon-Include-missing-cstdint.patch
 create mode 100644 meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-moduleconfig.py-python-3.12-compatibility.patch
 create mode 100644 meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0002-SConstruct-Pass-call-to-CheckLibWithHeader-as-a-keyw.patch
 create mode 100644 meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0003-boost-Fix-build-with-clang-23.patch
 create mode 100644 meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0004-ssl-Fix-build-with-OpenSSL-4.patch
 create mode 100644 meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0005-SERVER-49099-Remove-the-Node-swap-function-in-Biggie.patch
 create mode 100644 meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/oe-buildinfo.vars
 create mode 100644 meta-oe/recipes-connectivity/libwebsockets/libwebsockets/CVE-2026-114550.patch
 create mode 100644 meta-oe/recipes-devtools/apitrace/apitrace/CVE-2026-126050.patch
 create mode 100644 meta-oe/recipes-devtools/flatcc/flatcc/CVE-2026-116733.patch
 create mode 100644 meta-oe/recipes-devtools/flatcc/flatcc/CVE-2026-116734.patch
 rename meta-oe/recipes-devtools/json-schema-validator/{json-schema-validator_2.4.0.bb => json-schema-validator_2.4.1.bb} (89%)
 rename meta-oe/recipes-extended/7zip/{7zip_26.05.bb => 7zip_26.06.bb} (98%)
 rename meta-oe/recipes-extended/haveged/{haveged_1.9.26.bb => haveged_1.9.27.bb} (94%)
 rename meta-oe/recipes-extended/valkey/{valkey_9.1.2.bb => valkey_9.1.3.bb} (98%)
 create mode 100644 meta-oe/recipes-graphics/assimp/assimp/CVE-2026-117608.patch
 create mode 100644 meta-oe/recipes-graphics/gphoto2/libgphoto2/CVE-2026-120451.patch
 create mode 100644 meta-oe/recipes-graphics/gphoto2/libgphoto2/CVE-2026-120452.patch
 rename meta-oe/recipes-multimedia/mikmod/{libmikmod_3.3.15.bb => libmikmod_3.3.16.bb} (90%)
 create mode 100644 meta-oe/recipes-multimedia/mplayer/mpv/0001-opengl-context-require-swap_buffers-param-for-FenceS.patch
 create mode 100644 meta-oe/recipes-multimedia/mplayer/mpv/0002-hwdec_drmprime_overlay-make-the-framebuffer-the-whole-frame.patch
 create mode 100644 meta-oe/recipes-multimedia/mplayer/mpv/CVE-2026-123095.patch
 create mode 100644 meta-oe/recipes-support/hdf5/files/CVE-2026-120689.patch
 create mode 100644 meta-oe/recipes-support/hdf5/files/CVE-2026-120754-CVE-2026-120755.patch
 create mode 100644 meta-oe/recipes-support/hdf5/files/CVE-2026-120756.patch
 create mode 100644 meta-oe/recipes-support/hdf5/files/CVE-2026-120757.patch
 create mode 100644 meta-oe/recipes-support/hdf5/files/CVE-2026-120758.patch
 create mode 100644 meta-oe/recipes-support/hdf5/files/CVE-2026-19023-CVE-2026-19024.patch
 create mode 100644 meta-oe/recipes-support/hdf5/files/CVE-2026-19026-CVE-2026-19027-CVE-2026-19028.patch
 create mode 100644 meta-oe/recipes-support/imx-cst/imx-cst/0017-cst-port-pkcs11-signing-from-engine-to-provider.patch
 rename meta-oe/recipes-support/libraw/{libraw_0.22.2.bb => libraw_0.22.3.bb} (92%)
 rename meta-oe/recipes-support/spitools/{spitools_1.1.1.bb => spitools_1.2.0.bb} (86%)
 rename meta-oe/recipes-support/uriparser/{uriparser_1.0.2.bb => uriparser_1.0.3.bb} (91%)
 rename meta-oe/recipes-support/zchunk/{zchunk_1.5.4.bb => zchunk_1.5.5.bb} (81%)
 create mode 100644 meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-111063.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-111065.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-111066.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-111748.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-111749.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-111750.patch
 rename meta-python/recipes-devtools/python/{python3-django_5.2.18.bb => python3-django_5.2.19.bb} (61%)
 rename meta-python/recipes-devtools/python/{python3-django_6.0.9.bb => python3-django_6.0.10.bb} (75%)
 rename meta-python/recipes-devtools/python/{python3-filelock_4.0.4.bb => python3-filelock_4.0.12.bb} (93%)
 rename meta-python/recipes-devtools/python/{python3-httplib2_0.32.0.bb => python3-httplib2_0.32.1.bb} (85%)
 rename meta-python/recipes-devtools/python/{python3-tzdata_2026.5.bb => python3-tzdata_2026.6.bb} (86%)
 create mode 100644 meta-python/recipes-extended/tuna/tuna/0001-tuna-Do-not-import-tuna-from-setup.py.patch
 rename meta-webserver/recipes-webadmin/cockpit/{cockpit_366.bb => cockpit_366.1.bb} (97%)
 create mode 100644 meta-webserver/recipes-webadmin/webmin/files/CVE-2026-125391.patch
 create mode 100644 meta-webserver/recipes-webadmin/webmin/files/CVE-2026-125392.patch

