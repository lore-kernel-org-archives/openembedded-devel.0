Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F691CAC5B9
	for <webhook@archiver.kernel.org>; Fri, 26 Sep 2025 14:19:32 +0000 (UTC)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
 by mx.groups.io with SMTP id smtpd.web10.18542.1758896363807752525
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 26 Sep 2025 07:19:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cTPby7aS;
 spf=pass (domain: gmail.com, ip: 209.85.208.48, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-62fc28843ecso2926405a12.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 26 Sep 2025 07:19:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758896362; x=1759501162; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=n1uMcYkQ5+jBv/AAhtaNenmEtIAyw24ySoko5oCR/3I=;
        b=cTPby7aSaM8l+VujItd6UR3NJOokBBpzu06whTFV/DooFQPyR0C6JJyFs77k8zeufS
         qarpEtXxgGwpD6YzVkDtZlupe61qr69ppj84Kq9F3VJ+XkibsaV4mtdzCKxD6jZdB+cn
         u6BAVrYVCbixDr/qdDJIFHknaXlDA39YA/g9tMYlvux+LnmI6O6lun0gWjSngT68Y6xu
         hdgtByG/0tohofJH1x+LnMsYkjF/3PQF9kl1UF9hClMZ0FFgf4u5U8hsaHfzMb+oXUrU
         Ilc9CXml6/cw+MzGuAnnigYkofjAzgeFzoRf5s6lq8TNhbEOKz+/U05x7PWVZ28jzYnx
         XDXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758896362; x=1759501162;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=n1uMcYkQ5+jBv/AAhtaNenmEtIAyw24ySoko5oCR/3I=;
        b=nsIfjYRO28RnfnVfv1DMQm9AUwbnC6uu0s6XMGUuE+SdCg39fX16H65THwPo6Wr3VG
         W7r1p9UK/3ZUDuzbflqBDEtpuXY0ez3701XXh42eZHUhw2Vp7oWSdPUfGkeJiK7QeX9m
         9jNICSUzmsjSby5VWZevyM+qbLJsivS0n2jBnhCioUZXW06hsPpI+y/gP8alNms+KX6I
         Zyrn/NZi/b3eZZrjfXTdovFtM0FKgTOUHpi/tzD7b+IXzVIUIa6kDEPPcXhayHBIkqaN
         VOHvXnsysT9OKhuPJlcStCspZFsAS3jF0b7K8HeDIPERTEFgIm+zdLkKlaMEEf8FWHit
         INhw==
X-Gm-Message-State: AOJu0YwcDKzVyI+SqRLHY15+RkEp0pOq8MX3/DdKaTSuZqw28uMOp5TV
	bre9cQ9+FkTdaPDT9wPkPTkCh2DILXZdjOV1tqCkucX5fmAWgfNqRe98yF/Seg==
X-Gm-Gg: ASbGncswMePqxAkk8meu44tcRd1IRg9MHq2iPX6o7eXfEKRApF8l+VHjxkO9C89KxXy
	Pr/iEu+Fqhx6RWuHVPKX9RsPqqg5WGyVJU3Qtx5FDeqHuhEj/anKTkZKmlCbXxuYqGwiR9QOyIB
	WxUJCd2OE0MmYAgpoovdZxD5asq9oukiYIXRqq5lJSOSjbsElOlMLxcV5mQ3HhMEG9BWOE73q0d
	1UunjC/J84BV+hlAdYu9LMymsOFuPP2xu9EJ69WiD+o492hZnTYAM699iY6mcQszE4cmUDaUFon
	kWVq3Qw43IyI/E9kre/eyTIOuRB67sIAUVKGt/Oz/ZU9Q4nIx1YaTJNrMCoYDHqPJxKe2AHd0ei
	oTL6B6B9qLliTzP0xLOKk
X-Google-Smtp-Source: AGHT+IHSUXVq+wqOhdioyylGZyoy25u5TJNpJLJVgRA+L/0VoKM//OPcYVqZ1IH2j4RhOlBafbGd0Q==
X-Received: by 2002:a05:6402:5191:b0:631:d76b:4c3 with SMTP id 4fb4d7f45d1cf-6349fa7e694mr6693370a12.19.1758896361801;
        Fri, 26 Sep 2025 07:19:21 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-634a3ae321csm3001028a12.24.2025.09.26.07.19.20
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Sep 2025 07:19:20 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 00/20] Cherry-picks from Master Batch D
Date: Fri, 26 Sep 2025 16:18:59 +0200
Message-ID: <20250926141919.2010846-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 26 Sep 2025 14:19:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119909

This is my fourth batch of cherry picks from master branch, that I'd like to propose
to include in the Kirkstone branch.

This is once again an assorted mix of patches: half of generic fixes (outdated SRC_URI,
LICENSE correction...) or minor recipe version updates which I tried to verify as good as I could
by reviewing the commits and patch changes.

This batch has been build-tested with a world build on arm, aarch64, x86 and x86-64 platforms.

Your feedback is much appreciated.

Thank you.

---
Bergin, Peter (1):
  freediameter: fix typo and old overide syntax

Gianfranco Costamagna (1):
  mosquitto: bump to 2.0.22

Gyorgy Sarvari (1):
  znc: fix LICENSE value, clean up SRC_URI

Jim Broadus (1):
  networkmanager: fix iptables and nft paths

Khem Raj (4):
  nfacct: Update SRC_URI to point to valid URL
  openflow: Include sys/stat.h for fchmod
  openflow: Switch SRC_URI to github mirror
  radiusclient-ng: Point SRC_URI to archive.ubuntu.com

Louis Rannou (1):
  mosquitto: bump to 2.0.21

Philippe Coval (1):
  ot-br-posix: Add dep to ipset as used by firewall

Randy MacLeod (1):
  ncftp: Upgrade to 3.2.7

Wang Mingyu (3):
  pure-ftpd: upgrade 1.0.51 -> 1.0.52
  libnftnl: upgrade 1.2.3 -> 1.2.4
  libnftnl: upgrade 1.2.5 -> 1.2.6

Yi Zhao (3):
  libnftnl: upgrade 1.2.2 -> 1.2.3
  libnftnl: upgrade 1.2.4 -> 1.2.5
  devecot: set dovecot.conf file mode with chmod

alperak (1):
  adcli: use https protocol for fetching

wangmy (2):
  pure-ftpd: upgrade 1.0.50 -> 1.0.51
  libnftnl: upgrade 1.2.1 -> 1.2.2

 .../recipes-connectivity/adcli/adcli_0.9.0.bb |   2 +-
 .../mosquitto/files/2895.patch                |  17 +-
 ...osquitto_2.0.20.bb => mosquitto_2.0.22.bb} |   2 +-
 .../networkmanager/networkmanager_1.36.2.bb   |   2 +
 .../openthread/ot-br-posix_git.bb             |   2 +-
 .../ncftp/ncftp/ncftp-3.2.5-gcc10.patch       |  83 ---
 .../ncftp/{ncftp_3.2.6.bb => ncftp_3.2.7.bb}  |   8 +-
 ...-usr-local-includes-from-configure.a.patch |  15 +-
 .../pure-ftpd/pure-ftpd/nostrip.patch         |   7 +-
 ...ure-ftpd_1.0.50.bb => pure-ftpd_1.0.52.bb} |   4 +-
 ...cal-function-as-one-of-printf-family.patch | 650 ------------------
 .../0001-configure.ac-Add-serial-tests.patch  |   8 +-
 .../{libnftnl_1.2.1.bb => libnftnl_1.2.6.bb}  |  10 +-
 .../recipes-filter/nfacct/nfacct_1.0.2.bb     |   8 +-
 meta-networking/recipes-irc/znc/znc_1.8.2.bb  |  12 +-
 .../freediameter/freediameter_1.4.0.bb        |   2 +-
 .../recipes-protocols/openflow/openflow.inc   |   2 +-
 ...ify-export-dynamic-directly-to-linke.patch |  30 +
 ...t-util-Include-sys-stat.h-for-fchmod.patch |  23 +
 .../openflow/openflow_git.bb                  |   7 +-
 .../radiusclient-ng/radiusclient-ng_0.5.6.bb  |   3 +-
 .../recipes-support/dovecot/dovecot_2.3.14.bb |   3 +-
 22 files changed, 112 insertions(+), 788 deletions(-)
 rename meta-networking/recipes-connectivity/mosquitto/{mosquitto_2.0.20.bb => mosquitto_2.0.22.bb} (97%)
 delete mode 100644 meta-networking/recipes-daemons/ncftp/ncftp/ncftp-3.2.5-gcc10.patch
 rename meta-networking/recipes-daemons/ncftp/{ncftp_3.2.6.bb => ncftp_3.2.7.bb} (80%)
 rename meta-networking/recipes-daemons/pure-ftpd/{pure-ftpd_1.0.50.bb => pure-ftpd_1.0.52.bb} (81%)
 delete mode 100644 meta-networking/recipes-filter/libnftnl/libnftnl/0001-avoid-naming-local-function-as-one-of-printf-family.patch
 rename meta-networking/recipes-filter/libnftnl/{libnftnl_1.2.1.bb => libnftnl_1.2.6.bb} (89%)
 create mode 100644 meta-networking/recipes-protocols/openflow/openflow/0001-Makefile.am-Specify-export-dynamic-directly-to-linke.patch
 create mode 100644 meta-networking/recipes-protocols/openflow/openflow/0001-socket-util-Include-sys-stat.h-for-fchmod.patch


