Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9AA2CAC5B8
	for <webhook@archiver.kernel.org>; Thu,  2 Oct 2025 12:59:36 +0000 (UTC)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
 by mx.groups.io with SMTP id smtpd.web10.7542.1759409970162492810
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 02 Oct 2025 05:59:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=c4FE9Wel;
 spf=pass (domain: gmail.com, ip: 209.85.208.50, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6364eb32535so1814768a12.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 02 Oct 2025 05:59:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759409968; x=1760014768; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=wZ5qMfX6Z914egkJ+fc+qRsh/IXG01xofzjxwGsgjWc=;
        b=c4FE9WelwDt5NNBUEbLnSTR5lI2kwOCF2kMI1ByQfGom9t/ChY2jSg5gT82bS8bCXY
         oZZundSzCkd2yzMQcnF5RljuhF/fye+v6m5QyTzAUf4N7m9CRY0ddzoPoE120BDheQM/
         I+3XIW74tI80uwaZNiRqF4ZaWOxdDiIB6unFmbTRoH7/8SCS3pu+IPKIhTN/YOADlgi0
         OOJ+pfd7Ot3+YlYXjYyvwFFTtbY/PHoPod1lJPI14wD9p74TkY8AUCIcVHTuGHHc3ply
         9CFw3T9hwvdnZtSuMSmucaDArFKewLdBU3YwoOhH4y9hjnzHWpAJXs61NxtMWiW5MNTr
         bxkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759409968; x=1760014768;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wZ5qMfX6Z914egkJ+fc+qRsh/IXG01xofzjxwGsgjWc=;
        b=gzrF6Gge2YA+vThuJ+P9gzM7z2rJXPt9iNq0e6YgdJmcuibit9F572+L+gXaPQJ1bq
         0eAWcJeZLpQcrrkYUE98Tm3J9C/+veh9ZpLTaC2LsBLFI8hxZKtf5JQL+JO+TfNYuHGl
         j9k3FpECo+6/r/cYc/r6b8fjeGmFPod0jvt4sWUBGEHX6JLCwd5desVvdar8SJthvPJf
         RxuomPktOdEVq8ShA9zJaU8ffDtZfhudkoIeu1ri5udVhSL+R6XntY2NuQdFw+XrATPv
         XSnhpTM2Q51dOElXJR+3NklvoltdsbQLvoOxOdk5FyoL6/o/HlHDTeHNhdgC80xVrYsV
         wM9w==
X-Gm-Message-State: AOJu0Yz4e/tykHD+x6Ib6LGHYq5WEHRQLG2/gwNoF3GvJbelSEUCcUL8
	hNY43XH+YJfhBOafbk0DHWt8uhfaHjTeJYNHo7R+rUcBN8xA/hUTfCu9aLuZzQ==
X-Gm-Gg: ASbGncvyM9iAdH/MK7auFBof9CNYnNRjTMWtpHxgz/OZ5Gu89LPMssWQBTz16U9Homp
	+GaO89XpzxMY110itf+dkTdU9u/02uyj/sr4Wz6GN8U+ZDdNeRGjk8poW87UHD3hPm4qhfAgD/G
	qefJ+uomCcsB0N3lUv+HITEn2ET1XML0+kFc72CmjsFRmYJCmeCMhycxOth+lxxggOq8iw16uri
	t03RgLyZ1LaeWyhzGi/ScNZKcKxVBJzAqhr0VEpZJkZ2k5rO3NBWUQN4dynKMgdIAwW3ocTc499
	CEM8k2ge4ibCrTQzFtyanmb/pazkHPISvQGmW5l+GM6U7dALmMrCNn2OflMUMTvZvpcPiGs7xAD
	OgEx/QrCDKsDPuvv2PBv5oty40xfEbc0MnjYIVpInb/pKyKAYni0R6wbF+BYFu+PRJg==
X-Google-Smtp-Source: AGHT+IGjqq1a8oO21yMXSTMb855U5pwEPz5lAhNYt9R0LYh19gHw3m9XWhu+vwmfOHXllAtCuNHf1w==
X-Received: by 2002:a17:907:3cca:b0:b42:9689:cabf with SMTP id a640c23a62f3a-b46e632d934mr832210566b.38.1759409968062;
        Thu, 02 Oct 2025 05:59:28 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b486a173b03sm194127166b.84.2025.10.02.05.59.27
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Oct 2025 05:59:27 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 00/26] Cherry-picks from Master Batch G
Date: Thu,  2 Oct 2025 14:59:00 +0200
Message-ID: <20251002125926.2624522-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 02 Oct 2025 12:59:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120169

This is the last batch I intend to pick for Kirkstone for the time being.

This batch contains once again mostly CVE fixes and various recipe corrections
(SRC_URI, RDEPENDS...).

A world build has succeeded with these patches for arm, aarch64, x86 and x86-64
platforms.

Please let me know any thoughts you have about this.

---

Alex Yao (1):
  lcov: Fix Perl Path

Bartosz Golaszewski (6):
  python3-gsocketpool: add missing run-time dependencies
  python3-txws: add missing run-time dependencies
  python3-hpack: add missing run-time dependencies
  python3-thrift: add missing run-time dependencies
  python3-pyparted: add missing run-time dependencies
  python3-send2trash: add missing run-time dependencies

Benjamin Szőke (1):
  tree: fix broken links

Dan McGregor (1):
  dash: correct licence

Fabio Estevam (1):
  multipath-tools: Use https for github

Gyorgy Sarvari (2):
  liboop: set correct LICENSE
  xfce4-sensors-plugin: correct netcat PACKAGECONFIG

Julian Haller (1):
  openct: Fix typo in SUMMARY variable

Katariina Lounento (1):
  libtar: patch CVEs

Marcus Flyckt (1):
  python3-pyconnman: Add 'future' runtime dependency

Martin Jansa (1):
  ne10: append +git instead of gitr+

Ninette Adhikari (1):
  procmail: Update status for CVE-1999-0475

Peter Kjellerstedt (1):
  libjs-jquery-icheck: Correct LIC_FILES_CHKSUM

Peter Marko (5):
  libtinyxml: patch CVE-2021-42260
  libtinyxml: patch CVE-2023-34194
  procmail: patch CVE-2014-3618
  procmail: patch CVE-2017-16844.
  synergy: patch CVE-2020-15117

Tim Orling (1):
  span-lite: do not inherit ptest

Wang Mingyu (1):
  smarty: upgrade 4.1.0 -> 4.1.1

Yi Zhao (1):
  libcrypt-openssl-guess-perl: fix syntax for PROVIDES

 meta-oe/recipes-shells/dash/dash_0.5.11.5.bb  |   2 +-
 meta-oe/recipes-support/lcov/lcov_1.14.bb     |   2 +-
 .../libjs/libjs-jquery-icheck_1.0.3.bb        |   2 +-
 .../recipes-support/liboop/liboop_1.0.1.bb    |   2 +-
 ...-missing-prototype-compiler-warnings.patch |  53 ++++++
 ...ix-invalid-memory-de-reference-issue.patch |  44 +++++
 ...escriptor-leaks-reported-by-cppcheck.patch | 101 +++++++++++
 ...0006-fix-memleak-on-tar_open-failure.patch |  26 +++
 ...ix-memleaks-in-libtar-sample-program.patch | 119 +++++++++++++
 ...ng-a-static-buffer-in-th_get_pathnam.patch |  89 ++++++++++
 ...-for-NULL-before-freeing-th_pathname.patch |  30 ++++
 ...-stdlib.h-for-malloc-in-lib-decode.c.patch |  26 +++
 ...amming-mistakes-detected-by-static-a.patch | 100 +++++++++++
 .../libtar/files/CVE-2013-4420.patch          | 160 ++++++++++++++++++
 ...-33640-CVE-2021-33645-CVE-2021-33646.patch |  42 +++++
 .../files/CVE-2021-33643-CVE-2021-33644.patch |  52 ++++++
 .../recipes-support/libtar/libtar_1.2.20.bb   |  12 ++
 .../libtinyxml/CVE-2021-42260.patch           |  27 +++
 .../libtinyxml/CVE-2023-34194.patch           |  31 ++++
 .../libtinyxml/libtinyxml_2.6.2.bb            |   5 +-
 .../multipath-tools/multipath-tools_0.8.4.bb  |   2 +-
 meta-oe/recipes-support/ne10/ne10_1.2.1.bb    |   2 +-
 .../recipes-support/openct/openct_0.6.20.bb   |   2 +-
 .../procmail/procmail/CVE-2014-3618.patch     |  29 ++++
 .../procmail/procmail/CVE-2017-16844.patch    |  20 +++
 .../recipes-support/procmail/procmail_3.22.bb |   8 +-
 .../{smarty_4.1.0.bb => smarty_4.1.1.bb}      |   2 +-
 .../span-lite/span-lite_0.10.3.bb             |   1 -
 .../synergy/synergy/CVE-2020-15117.patch      |  48 ++++++
 .../recipes-support/synergy/synergy_git.bb    |   1 +
 meta-oe/recipes-support/tree/tree_2.0.2.bb    |   4 +-
 .../libcrypt-openssl-guess-perl_0.15.bb       |   2 +-
 .../python3-gsocketpool_0.1.6.bb              |   3 +-
 .../python-hpack/python3-hpack_4.0.0.bb       |   2 +
 .../python3-pyconnman_0.2.0.bb                |   2 +-
 .../python-thrift/python3-thrift_0.16.0.bb    |   1 +
 .../python-txws/python3-txws_0.9.1.bb         |   5 +
 .../python3-pyparted_3.12.0.bb                |   5 +-
 .../send2trash/python3-send2trash_1.8.0.bb    |   2 +
 .../sensors/xfce4-sensors-plugin_1.4.3.bb     |   2 +-
 40 files changed, 1050 insertions(+), 18 deletions(-)
 create mode 100644 meta-oe/recipes-support/libtar/files/0003-Fix-missing-prototype-compiler-warnings.patch
 create mode 100644 meta-oe/recipes-support/libtar/files/0004-Fix-invalid-memory-de-reference-issue.patch
 create mode 100644 meta-oe/recipes-support/libtar/files/0005-fix-file-descriptor-leaks-reported-by-cppcheck.patch
 create mode 100644 meta-oe/recipes-support/libtar/files/0006-fix-memleak-on-tar_open-failure.patch
 create mode 100644 meta-oe/recipes-support/libtar/files/0007-fix-memleaks-in-libtar-sample-program.patch
 create mode 100644 meta-oe/recipes-support/libtar/files/0008-decode-avoid-using-a-static-buffer-in-th_get_pathnam.patch
 create mode 100644 meta-oe/recipes-support/libtar/files/0009-Check-for-NULL-before-freeing-th_pathname.patch
 create mode 100644 meta-oe/recipes-support/libtar/files/0010-Added-stdlib.h-for-malloc-in-lib-decode.c.patch
 create mode 100644 meta-oe/recipes-support/libtar/files/0011-libtar-fix-programming-mistakes-detected-by-static-a.patch
 create mode 100644 meta-oe/recipes-support/libtar/files/CVE-2013-4420.patch
 create mode 100644 meta-oe/recipes-support/libtar/files/CVE-2021-33640-CVE-2021-33645-CVE-2021-33646.patch
 create mode 100644 meta-oe/recipes-support/libtar/files/CVE-2021-33643-CVE-2021-33644.patch
 create mode 100644 meta-oe/recipes-support/libtinyxml/libtinyxml/CVE-2021-42260.patch
 create mode 100644 meta-oe/recipes-support/libtinyxml/libtinyxml/CVE-2023-34194.patch
 create mode 100644 meta-oe/recipes-support/procmail/procmail/CVE-2014-3618.patch
 create mode 100644 meta-oe/recipes-support/procmail/procmail/CVE-2017-16844.patch
 rename meta-oe/recipes-support/smarty/{smarty_4.1.0.bb => smarty_4.1.1.bb} (94%)
 create mode 100644 meta-oe/recipes-support/synergy/synergy/CVE-2020-15117.patch


