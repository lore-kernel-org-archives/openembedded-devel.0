Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.36185.1793161438403030430
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Oct 2026 21:23:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=YZnC2Kiw;
 spf=pass (domain: gmail.com, ip: 209.85.215.169, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-cd5c9e52398so312660a12.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 27 Oct 2026 21:23:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793161438; x=1793766238; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=TchY7Mgi+Ujg0d0OyRwXCHnArb+qvL03OYBBlcGaNz4=;
        b=YZnC2KiwoxN1zXSOBsJk3QiLYZaagwLmB7oDZ5+H+HHD07UKD88k6SBtDCPBXX1exL
         QnSsOhVGp9lSFDGHUltxkwyksmnN7PwhBzdoaUiAAVSFBVQelOTtFg2TvXjqSnJD267o
         lKrUA48nmBiCjNfkIdJyWleSOngwd6zZdPwjjZL5vjrTygLv1YjrDoWjCqFY3Y1539G0
         JVDOKXiiWR3sH4RBW0wJEmkzdLs12Q1emC/tN/RLp36/LI6Jyf7ntVCKswDqYr5mpQWK
         KW5btoJVzJzsdTwPFuEzUaDOeD7nciCC/eIhKF3vRKtQrlQVnTqH5GvZsZ0oo8KZXSrh
         Oirg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793161438; x=1793766238;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TchY7Mgi+Ujg0d0OyRwXCHnArb+qvL03OYBBlcGaNz4=;
        b=aYqkbqK4HaTwXns4vvqDXxhTxnmB2nfjJvi7ZfMUCFFG/qq3cS6O4om0QzeCr2rTHm
         IEcQiSwRNwHZMIhiQo5mUGC18T5HtvPgurSCZpjrd5o+yT5KUDyuywL/4uYYlWj4xwbA
         UggycY+y9evAtNChwWpt35tTsEOaocTQm36JklL/6IGUg83oRfYPVB5oCF5aDpzm/Ic/
         tllahrkrka4EbdAZYOm5uaXzkQDb+aX8Rw7seiy4gyjdWEcGe5VBhiwTQTjN1Jwz8z7y
         44sClDB0KyvTBWtR7jQ25tUViHXAERZRdqterPHl/NQGprChL5qrY2uHqa7tZCGR/fOk
         aOWg==
X-Gm-Message-State: AFq9FYKGg6wieKbOj6qBc8rcXls92sc3Nt2tPNB5JLLUWV1L1bZqaYQQ
	J8uhhofO5Zu7u+RUrr+Qov/JHC52uLYHDYLlwqtAhoO5NiIGRzf6AeC7MMuhvw==
X-Gm-Gg: AYBFou0G6N7Al0HYnFV7qacI8N5WNMiSzeYYefawr5GXrW0pMr32knTyfoBiJLk1SUy
	r2yfgjuzKWt1HmZsYSk+I8IF9qiVv/kcr2H1WZ657daledV82FaHUHhJJgy593RJTHjNKztq00p
	1VBSOqEjwywPeg/wLqvoRdcR7QWWY33TNBT4cK8haZbqAAnDAnuUe4MabSZTgc/32YDaKcKZIg/
	EtGxKBKCJab4DMJI53sqWpxB/9pZCTGfPkJY/BBpzVO4KWnPBfJJk0exvj7KWtiLEF8KPGRtfNB
	gMJSAxpaCznrSYvV/+Vo7eH1vaNFN08yexiLZ6kxHe/knMVEh5oD2r9WfyeKxpSzqlx7SuTiwED
	BplJYM4W9U7GPDtFOfn+6pHU8KCx9wEM5ZrWuLIOna8tt6lqrCYoaiIAwuYkSsgr2ElFVzs1bBk
	nyGsGRtvyCj7suaY1HgvwbJIubulz+sCP+jlsi3VUYxMQ6VJ1diup+mZscLlQFt7QN/S+uOQxOG
	b/2BeSesjKiuAdVjvhFz89cJqo9i6L+ST//XcmmXlLaQ+4NnFB1dt9dhsUaqGwYKmN+2ryLrZmO
	uQBtiKOnttpkqPXZkxcACQO0ykz7SbvI0n8WXpEaMWRQp/6hLqt+U5VYo/pswGYSUA9ZaWDcXnn
	eLmYhxsQ=
X-Received: by 2002:a17:90b:4a45:b0:3ad:b8c8:4a84 with SMTP id 98e67ed59e1d1-3ae581d2a45mr814411a91.26.1793161437390;
        Tue, 27 Oct 2026 21:23:57 -0700 (PDT)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.. ([147.161.217.9])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae5a501083sm1169681a91.8.2026.10.27.21.23.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 21:23:56 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>,
	Peter Marko <peter.marko@siemens.com>,
	Khem Raj <khem.raj@oss.qualcomm.com>,
	Jason Schonberg <schonm@gmail.com>,
	James Lee <james@codeconstruct.com.au>
Subject: [blacksail][PATCH 00/60] Blacksail pull request
Date: Wed, 28 Oct 2026 17:23:23 +1300
Message-ID: <cover.1793161233.git.ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 28 Oct 2026 04:24:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131552
Content-Type: text/plain; charset="utf-8"

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Please merge these changes in blacksail. Tested locally and on autobuilder.

https://autobuilder.yoctoproject.org/valkyrie/#/builders/81/builds/1904

The following changes since commit a9d69bc066bf9498397db27902c287dd666fdfd4:

  lvgl-demo-fb: fix SRCREV (2026-10-14 09:26:03 +1300)

are available in the Git repository at:

  https://git.openembedded.org/meta-openembedded-contrib ankurt/blacksail
  https://git.openembedded.org/meta-openembedded-contrib/log/?h=ankurt/blacksail

for you to fetch changes up to bb956bf8ff7a32f31deaa83e96880d10ab564d14:

  redis: upgrade 8.10.2 -> 8.10.3 (2026-10-28 08:22:29 +1300)

----------------------------------------------------------------

Ankur Tyagi (51):
  zeroconf: ignore CVEs
  udisks2: patch CVE-2026-7867
  tmate: patch CVE-2026-4751
  tinyproxy: patch CVE-2026-54388
  flatpak: upgrade 1.18.0 -> 1.18.4
  xdg-dbus-proxy: upgrade 0.1.7 -> 0.1.9
  swagger-ui: upgrade 5.33.1 -> 5.33.2
  freerdp3: upgrade 3.32.1 -> 3.32.2
  spitools: upgrade 1.1.0 -> 1.1.1
  libspdm: upgrade 3.8.2 -> 3.8.3
  libmikmod: upgrade 3.3.14 -> 3.3.15
  libxmp: upgrade 4.7.3 -> 4.7.4
  python3-pyjwt: upgrade 2.13.0 -> 2.14.0
  python3-cbor2: upgrade 6.1.4 -> 6.1.5
  samba: ignore CVE-2026-2340
  rapidjson: mark CVE-2024-38517 fixed
  psqlodbc: patch CVE-2026-109448
  proftpd: mark CVE-2026-53994 fixed
  postfix: ignore CVE-2023-32182
  poppler: patch CVE-2026-102621
  poppler: patch CVE-2026-102620
  opensc: patch CVE-2026-103531
  pjproject: mark CVE-2026-26967 fixed
  pjproject: patch CVE-2026-57160
  pjproject: patch CVE-2026-57161
  pjproject: patch CVE-2026-57162
  pjproject: patch CVE-2026-57163
  pjproject: patch CVE-2026-57164
  pjproject: patch CVE-2026-57165
  pjproject: patch CVE-2026-57166
  pjproject: patch CVE-2026-77396
  pjproject: patch CVE-2026-84975
  nmap: patch CVE-2026-58058
  nmap: patch CVE-2026-72712
  netdata: mark CVE-2026-83602 fixed
  mtr: patch CVE-2026-14461
  ncp: ignore CVE-2025-14577 and CVE-2026-35087
  libvncserver: patch CVE-2026-44988
  libvncserver: patch CVE-2026-32854
  libvncserver: patch CVE-2026-32853
  libvncserver: patch CVE-2026-50538
  swagger-ui: upgrade 5.33.2 -> 5.33.3
  libmspack: patch CVE-2026-110602
  unbound: upgrade 1.26.1 -> 1.26.2
  ntpsec: upgrade 1.2.5 -> 1.2.6
  apache2: upgrade 2.4.68 -> 2.4.69
  7zip: upgrade 26.03 -> 26.04
  7zip: upgrade 26.04 -> 26.05
  python3-brotli: upgrade 1.2.0 -> 1.2.1
  python3-oauthlib: patch CVE-2026-49265
  redis: upgrade 8.10.2 -> 8.10.3

James Lee (1):
  mctp: upgrade 2.6 -> 2.6.1

Jason Schonberg (3):
  brotli: upgrade 1.2.0 -> 1.2.1
  php: upgrade 8.5.11 -> 8.5.12
  c-ares: backport security fixes from 1.34.9

Peter Marko (5):
  nginx: upgrade 1.30.5 -> 1.30.6
  nginx: set CVE_STATUS for CVE-2026-95101 and CVE-2026-97629
  nss: remove compromised eMudhra certificates
  grpc: update gRPC repo roots
  python3-grpcio: update gRPC repo roots

 .../pjproject/pjproject/CVE-2026-57160.patch  |    42 +
 .../pjproject/pjproject/CVE-2026-57161.patch  |    49 +
 .../pjproject/pjproject/CVE-2026-57162.patch  |    43 +
 .../pjproject/pjproject/CVE-2026-57163.patch  |    52 +
 .../pjproject/pjproject/CVE-2026-57164.patch  |    66 +
 .../pjproject/pjproject/CVE-2026-57165.patch  |    85 +
 .../pjproject/pjproject/CVE-2026-57166.patch  |   228 +
 .../pjproject/pjproject/CVE-2026-77396.patch  |    74 +
 .../pjproject/pjproject/CVE-2026-84975.patch  |    87 +
 .../pjproject/pjproject_2.17.bb               |    11 +
 .../samba/samba_4.23.11.bb                    |     1 +
 .../recipes-daemons/postfix/postfix_3.11.7.bb |     2 +
 .../recipes-daemons/proftpd/proftpd_1.3.9d.bb |     1 +
 .../zeroconf/zeroconf_0.9.bb                  |     6 +
 meta-networking/recipes-support/mctp/mctp.inc |     4 +-
 .../mctp/{mctp_2.6.bb => mctp_2.6.1.bb}       |     0
 .../mctp/{mctpd_2.6.bb => mctpd_2.6.1.bb}     |     0
 .../mtr/mtr/CVE-2026-14461.patch              |    32 +
 .../recipes-support/mtr/mtr_0.96.bb           |     4 +-
 .../recipes-support/ncp/ncp_1.2.4.bb          |     3 +
 .../{ntpsec_1.2.5.bb => ntpsec_1.2.6.bb}      |     2 +-
 .../tinyproxy/tinyproxy/CVE-2026-54388.patch  |    32 +
 .../tinyproxy/tinyproxy_1.11.3.bb             |     1 +
 .../{unbound_1.26.1.bb => unbound_1.26.2.bb}  |     2 +-
 .../psqlodbc/files/CVE-2026-109448.patch      |   243 +
 .../psqlodbc/psqlodbc_18.00.0002.bb           |     1 +
 ...curity-Update-gRPC-repo-roots.-43699.patch |  2617 +++
 meta-oe/recipes-devtools/grpc/grpc_1.84.0.bb  |     1 +
 .../php/{php_8.5.11.bb => php_8.5.12.bb}      |     2 +-
 .../rapidjson/rapidjson_git.bb                |     2 +
 .../7zip/{7zip_26.03.bb => 7zip_26.05.bb}     |     2 +-
 .../{brotli_1.2.0.bb => brotli_1.2.1.bb}      |     4 +-
 .../{flatpak_1.18.0.bb => flatpak_1.18.4.bb}  |     4 +-
 ...-hiredis-use-default-CC-if-it-is-set.patch |     0
 ...ile-to-use-environment-build-setting.patch |     0
 ...003-hack-to-force-use-of-libc-malloc.patch |     0
 .../0004-src-Do-not-reset-FINAL_LIBS.patch    |     0
 ...RCE-to-get-PTHREAD_MUTEX_INITIALIZER.patch |     0
 ...-not-build-the-test-modules-from-all.patch |     0
 .../init-redis-server                         |     0
 .../{redis-8.10.2 => redis-8.10.3}/redis.conf |     0
 .../redis.service                             |     0
 .../{redis_8.10.2.bb => redis_8.10.3.bb}      |     2 +-
 .../tmate/files/CVE-2026-4751.patch           |    75 +
 meta-oe/recipes-extended/tmate/tmate_2.4.0.bb |     1 +
 .../libvncserver/CVE-2026-32853.patch         |    76 +
 .../libvncserver/CVE-2026-32854.patch         |    66 +
 .../libvncserver/CVE-2026-44988.patch         |    71 +
 .../libvncserver/CVE-2026-50538.patch         |    49 +
 .../libvncserver/libvncserver_0.9.15.bb       |     4 +
 .../{libxmp_4.7.3.bb => libxmp_4.7.4.bb}      |     2 +-
 ...ibmikmod_3.3.14.bb => libmikmod_3.3.15.bb} |     2 +-
 .../nmap/files/CVE-2026-58058.patch           |    34 +
 .../nmap/files/CVE-2026-72712.patch           |    46 +
 meta-oe/recipes-security/nmap/nmap_7.99.bb    |     2 +
 ...troy-detach-queries-before-callbacks.patch |  2603 +++
 ...ed-socket-server-state-notifications.patch |   393 +
 ...qcache-hand-callbacks-their-own-copy.patch |  1054 ++
 ...connections-torn-down-by-application.patch |  1107 ++
 ...pt-an-answer-on-the-right-connection.patch |   575 +
 ...tions-read-channel-config-under-lock.patch |   243 +
 ...res_inet_pton-reject-a-prefix-length.patch |   364 +
 ...nt-drop-UDP-answers-from-server-port.patch |   178 +
 .../recipes-support/c-ares/c-ares_1.34.8.bb   |     8 +
 .../libmspack/CVE-2026-110602.patch           |    41 +
 .../cabextract/libmspack_0.11alpha.bb         |     4 +-
 ...1-winpr-tools-link-only-winpr-public.patch |    76 -
 ...{freerdp3_3.32.1.bb => freerdp3_3.32.2.bb} |     3 +-
 .../{libspdm_3.8.2.bb => libspdm_3.8.3.bb}    |     2 +-
 ...ve-eMudhra-emSign-Root-CA-C1-and-emS.patch |   272 +
 ...ve-eMudhra-emSign-Root-CA-G3-from-NS.patch |   143 +
 meta-oe/recipes-support/nss/nss_3.126.bb      |     2 +
 .../opensc/opensc/CVE-2026-103531.patch       |    54 +
 .../recipes-support/opensc/opensc_0.27.1.bb   |     1 +
 .../poppler/poppler/CVE-2026-102620-1.patch   |   145 +
 .../poppler/poppler/CVE-2026-102620-2.patch   |    34 +
 .../poppler/poppler/CVE-2026-102621.patch     |    40 +
 .../poppler/poppler_26.08.0.bb                |     3 +
 .../{spitools_1.1.0.bb => spitools_1.1.1.bb}  |     2 +-
 .../udisks/udisks2/CVE-2026-7867-1.patch      |   249 +
 .../udisks/udisks2/CVE-2026-7867-2.patch      |   208 +
 .../udisks/udisks2/CVE-2026-7867-3.patch      |    53 +
 .../udisks/udisks2/CVE-2026-7867-4.patch      |    40 +
 .../udisks/udisks2/CVE-2026-7867-5.patch      |   348 +
 .../recipes-support/udisks/udisks2_2.10.2.bb  |     9 +-
 ...proxy_0.1.7.bb => xdg-dbus-proxy_0.1.9.bb} |     2 +-
 ...rotli_1.2.0.bb => python3-brotli_1.2.1.bb} |     2 +-
 ...-cbor2_6.1.4.bb => python3-cbor2_6.1.5.bb} |     2 +-
 .../0001-Update-gRPC-repo-roots.-43699.patch  |  2617 +++
 ...e-repo-roots-to-chromium-roots-42094.patch | 14324 ++++++++++++++++
 .../python/python3-grpcio_1.78.0.bb           |     6 +
 .../python3-oauthlib/CVE-2026-49265.patch     |    51 +
 .../python/python3-oauthlib_3.3.1.bb          |     2 +
 ...yjwt_2.13.0.bb => python3-pyjwt_2.14.0.bb} |     2 +-
 ...gger-ui_5.33.1.bb => swagger-ui_5.33.3.bb} |     2 +-
 ...mod_md-Add-OpenSSL-4.0-compatibility.patch |    47 -
 .../{apache2_2.4.68.bb => apache2_2.4.69.bb}  |     3 +-
 .../{nginx_1.30.5.bb => nginx_1.30.6.bb}      |     5 +-
 .../netdata/netdata_2.10.4.bb                 |     2 +
 99 files changed, 29302 insertions(+), 152 deletions(-)
 create mode 100644 meta-multimedia/recipes-multimedia/pjproject/pjproject/CVE-2026-57160.patch
 create mode 100644 meta-multimedia/recipes-multimedia/pjproject/pjproject/CVE-2026-57161.patch
 create mode 100644 meta-multimedia/recipes-multimedia/pjproject/pjproject/CVE-2026-57162.patch
 create mode 100644 meta-multimedia/recipes-multimedia/pjproject/pjproject/CVE-2026-57163.patch
 create mode 100644 meta-multimedia/recipes-multimedia/pjproject/pjproject/CVE-2026-57164.patch
 create mode 100644 meta-multimedia/recipes-multimedia/pjproject/pjproject/CVE-2026-57165.patch
 create mode 100644 meta-multimedia/recipes-multimedia/pjproject/pjproject/CVE-2026-57166.patch
 create mode 100644 meta-multimedia/recipes-multimedia/pjproject/pjproject/CVE-2026-77396.patch
 create mode 100644 meta-multimedia/recipes-multimedia/pjproject/pjproject/CVE-2026-84975.patch
 rename meta-networking/recipes-support/mctp/{mctp_2.6.bb => mctp_2.6.1.bb} (100%)
 rename meta-networking/recipes-support/mctp/{mctpd_2.6.bb => mctpd_2.6.1.bb} (100%)
 create mode 100644 meta-networking/recipes-support/mtr/mtr/CVE-2026-14461.patch
 rename meta-networking/recipes-support/ntpsec/{ntpsec_1.2.5.bb => ntpsec_1.2.6.bb} (98%)
 create mode 100644 meta-networking/recipes-support/tinyproxy/tinyproxy/CVE-2026-54388.patch
 rename meta-networking/recipes-support/unbound/{unbound_1.26.1.bb => unbound_1.26.2.bb} (98%)
 create mode 100644 meta-oe/recipes-dbs/psqlodbc/files/CVE-2026-109448.patch
 create mode 100644 meta-oe/recipes-devtools/grpc/grpc/0001-security-Update-gRPC-repo-roots.-43699.patch
 rename meta-oe/recipes-devtools/php/{php_8.5.11.bb => php_8.5.12.bb} (99%)
 rename meta-oe/recipes-extended/7zip/{7zip_26.03.bb => 7zip_26.05.bb} (98%)
 rename meta-oe/recipes-extended/brotli/{brotli_1.2.0.bb => brotli_1.2.1.bb} (79%)
 rename meta-oe/recipes-extended/flatpak/{flatpak_1.18.0.bb => flatpak_1.18.4.bb} (94%)
 rename meta-oe/recipes-extended/redis/{redis-8.10.2 => redis-8.10.3}/0001-hiredis-use-default-CC-if-it-is-set.patch (100%)
 rename meta-oe/recipes-extended/redis/{redis-8.10.2 => redis-8.10.3}/0002-lua-update-Makefile-to-use-environment-build-setting.patch (100%)
 rename meta-oe/recipes-extended/redis/{redis-8.10.2 => redis-8.10.3}/0003-hack-to-force-use-of-libc-malloc.patch (100%)
 rename meta-oe/recipes-extended/redis/{redis-8.10.2 => redis-8.10.3}/0004-src-Do-not-reset-FINAL_LIBS.patch (100%)
 rename meta-oe/recipes-extended/redis/{redis-8.10.2 => redis-8.10.3}/0005-Define-_GNU_SOURCE-to-get-PTHREAD_MUTEX_INITIALIZER.patch (100%)
 rename meta-oe/recipes-extended/redis/{redis-8.10.2 => redis-8.10.3}/0006-src-Makefile-do-not-build-the-test-modules-from-all.patch (100%)
 rename meta-oe/recipes-extended/redis/{redis-8.10.2 => redis-8.10.3}/init-redis-server (100%)
 rename meta-oe/recipes-extended/redis/{redis-8.10.2 => redis-8.10.3}/redis.conf (100%)
 rename meta-oe/recipes-extended/redis/{redis-8.10.2 => redis-8.10.3}/redis.service (100%)
 rename meta-oe/recipes-extended/redis/{redis_8.10.2.bb => redis_8.10.3.bb} (98%)
 create mode 100644 meta-oe/recipes-extended/tmate/files/CVE-2026-4751.patch
 create mode 100644 meta-oe/recipes-graphics/libvncserver/libvncserver/CVE-2026-32853.patch
 create mode 100644 meta-oe/recipes-graphics/libvncserver/libvncserver/CVE-2026-32854.patch
 create mode 100644 meta-oe/recipes-graphics/libvncserver/libvncserver/CVE-2026-44988.patch
 create mode 100644 meta-oe/recipes-graphics/libvncserver/libvncserver/CVE-2026-50538.patch
 rename meta-oe/recipes-multimedia/libxmp/{libxmp_4.7.3.bb => libxmp_4.7.4.bb} (85%)
 rename meta-oe/recipes-multimedia/mikmod/{libmikmod_3.3.14.bb => libmikmod_3.3.15.bb} (90%)
 create mode 100644 meta-oe/recipes-security/nmap/files/CVE-2026-58058.patch
 create mode 100644 meta-oe/recipes-security/nmap/files/CVE-2026-72712.patch
 create mode 100644 meta-oe/recipes-support/c-ares/c-ares/0001-ares_cancel-ares_destroy-detach-queries-before-callbacks.patch
 create mode 100644 meta-oe/recipes-support/c-ares/c-ares/0002-Deliver-deferred-socket-server-state-notifications.patch
 create mode 100644 meta-oe/recipes-support/c-ares/c-ares/0003-ares_qcache-hand-callbacks-their-own-copy.patch
 create mode 100644 meta-oe/recipes-support/c-ares/c-ares/0004-Handle-connections-torn-down-by-application.patch
 create mode 100644 meta-oe/recipes-support/c-ares/c-ares/0005-ares_process-only-accept-an-answer-on-the-right-connection.patch
 create mode 100644 meta-oe/recipes-support/c-ares/c-ares/0006-ares_save_options-read-channel-config-under-lock.patch
 create mode 100644 meta-oe/recipes-support/c-ares/c-ares/0007-ares_inet_pton-reject-a-prefix-length.patch
 create mode 100644 meta-oe/recipes-support/c-ares/c-ares/0008-ares_conn_read-dont-drop-UDP-answers-from-server-port.patch
 create mode 100644 meta-oe/recipes-support/cabextract/libmspack/CVE-2026-110602.patch
 delete mode 100644 meta-oe/recipes-support/freerdp/freerdp3/0001-winpr-tools-link-only-winpr-public.patch
 rename meta-oe/recipes-support/freerdp/{freerdp3_3.32.1.bb => freerdp3_3.32.2.bb} (98%)
 rename meta-oe/recipes-support/libspdm/{libspdm_3.8.2.bb => libspdm_3.8.3.bb} (98%)
 create mode 100644 meta-oe/recipes-support/nss/nss/0008-Bug-2083709-Remove-eMudhra-emSign-Root-CA-C1-and-emS.patch
 create mode 100644 meta-oe/recipes-support/nss/nss/0009-Bug-2084101-Remove-eMudhra-emSign-Root-CA-G3-from-NS.patch
 create mode 100644 meta-oe/recipes-support/opensc/opensc/CVE-2026-103531.patch
 create mode 100644 meta-oe/recipes-support/poppler/poppler/CVE-2026-102620-1.patch
 create mode 100644 meta-oe/recipes-support/poppler/poppler/CVE-2026-102620-2.patch
 create mode 100644 meta-oe/recipes-support/poppler/poppler/CVE-2026-102621.patch
 rename meta-oe/recipes-support/spitools/{spitools_1.1.0.bb => spitools_1.1.1.bb} (87%)
 create mode 100644 meta-oe/recipes-support/udisks/udisks2/CVE-2026-7867-1.patch
 create mode 100644 meta-oe/recipes-support/udisks/udisks2/CVE-2026-7867-2.patch
 create mode 100644 meta-oe/recipes-support/udisks/udisks2/CVE-2026-7867-3.patch
 create mode 100644 meta-oe/recipes-support/udisks/udisks2/CVE-2026-7867-4.patch
 create mode 100644 meta-oe/recipes-support/udisks/udisks2/CVE-2026-7867-5.patch
 rename meta-oe/recipes-support/xdg-dbus-proxy/{xdg-dbus-proxy_0.1.7.bb => xdg-dbus-proxy_0.1.9.bb} (93%)
 rename meta-python/recipes-devtools/python/{python3-brotli_1.2.0.bb => python3-brotli_1.2.1.bb} (81%)
 rename meta-python/recipes-devtools/python/{python3-cbor2_6.1.4.bb => python3-cbor2_6.1.5.bb} (87%)
 create mode 100644 meta-python/recipes-devtools/python/python3-grpcio/0001-Update-gRPC-repo-roots.-43699.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-grpcio/0001-Update-repo-roots-to-chromium-roots-42094.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-oauthlib/CVE-2026-49265.patch
 rename meta-python/recipes-devtools/python/{python3-pyjwt_2.13.0.bb => python3-pyjwt_2.14.0.bb} (84%)
 rename meta-webserver/recipes-devtools/swagger-ui/{swagger-ui_5.33.1.bb => swagger-ui_5.33.3.bb} (94%)
 delete mode 100644 meta-webserver/recipes-httpd/apache2/apache2/0011-mod_md-Add-OpenSSL-4.0-compatibility.patch
 rename meta-webserver/recipes-httpd/apache2/{apache2_2.4.68.bb => apache2_2.4.69.bb} (98%)
 rename meta-webserver/recipes-httpd/nginx/{nginx_1.30.5.bb => nginx_1.30.6.bb} (63%)

