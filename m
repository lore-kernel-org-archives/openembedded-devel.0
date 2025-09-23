Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44B53CAC5A7
	for <webhook@archiver.kernel.org>; Tue, 23 Sep 2025 11:06:41 +0000 (UTC)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
 by mx.groups.io with SMTP id smtpd.web11.14113.1758625599518009358
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 23 Sep 2025 04:06:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PVPjmZFy;
 spf=pass (domain: gmail.com, ip: 209.85.218.47, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-b07883a5feeso1073526566b.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 23 Sep 2025 04:06:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758625598; x=1759230398; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=3R8/hw1oS8RlvFA+E1PDcQ60x3Z7A+oaJkba1kRsQcg=;
        b=PVPjmZFyBbNds86aX91GyGqeMTSBps6Rk3LmhdDPNwHTpeMZOUL03xJmiydzpO9+l2
         MhWsobnbBd3iFQT/ICk0THMxhKh66Eh1zwa7SuS08DxNIhryr/MrJliKuLqYpqM1HdUf
         lR3FERbVjnJ8iv2e9ST4i9akhVASfNsLrc4OEVvtSxO0ETXccAA6qfhdktEj5U8flB1H
         LeYc+eqdF6ypSNuCS8SQ7/7JV2L0rcj3dEhabyhWfPpiMzMGEp9Og9+BbbqVo1T6sF1L
         yy18a1KlFyssFNdxr1vrtdzLCvs73Dgj91Bk8Zzrk4nYbpbh6+4d4P9tPidY08q5TsOu
         AqdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758625598; x=1759230398;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3R8/hw1oS8RlvFA+E1PDcQ60x3Z7A+oaJkba1kRsQcg=;
        b=I+ryBndQKdCVo+/bUiBKFSflCpeUlTpP/nx/zTRV4yBrYsCiJgvoIG+ennK1egKndZ
         +sKA7a269dfKxpjvaXT8HRMfhsMavGTk0DaLsExxkRhKrjCc36a/tU7F2yzz9UHgv6QT
         1yZpRTa11itNkTpI9f3d9ufo5spjKRrwpfB0sGDr3MPRC6ErH+QGjN1xdwNeLark1yvg
         OKDYWR/G8Z0knAMNPeIa2vXEYdKlxmlbikmf6WYvttGW96pLetehdJgaVCpUhhyZeUSj
         0S6UZhntrEUE8DtFBqDqAquFS2cpecvPD9GvwDvnr3viYbVeannnnblciSc2bHoMqpt0
         sbuA==
X-Gm-Message-State: AOJu0YwYuVHiWgoXmXUeuXcttFKPvW8+uoVQAngEITAjlVI4sibAgtVl
	OcBHB3vGuFwAMUcELngTsPJdOF3VQ7ibjmzT+DPg38hyTfG1tQqtrslIs/MaOw==
X-Gm-Gg: ASbGncuWMt4y2OERuj+3QjoATcpAU2Eg9huFqfBa2BvrOwrZTqUdOq31ZNqKd+jEThH
	i5M4fiCXNDo3pdOaSm3Ql1UOiFK0W1ijZsDwCiAma8qkmqfxb2m+1T9kt+PngunbpfQi4VrkEsx
	zvLlM76MRYXRGztdJkKWWL9ji1sci0b0T8zxN16WbWRcqApK6hWogotzyFLI9sI8zHVvQNYVq1j
	WYdrRDkQn9Dr8/SXygXVSMT6GG2w6MbhTfYvUNDdib4VH3UFsl99ckVTUJxGTYJ2v5diGEllEQI
	UqF0pr7oqpcUkBpAaWduV2f+5HR8vzMAxtPOXb+RnqKz/8qUxk89gMkTRGyvkJtVU8P9HCfYdYg
	fZz8GrU92Hfgmat4x4FZ0
X-Google-Smtp-Source: AGHT+IE3mIhSqK+U1GcCjKVgsXXF0aPzzgLJ1sY9o0nIQVEQlW99rCk5uzR2n1M6H3ANt3TdLyH3qQ==
X-Received: by 2002:a17:906:b2d7:b0:b30:c059:f663 with SMTP id a640c23a62f3a-b30c059fe28mr94494166b.64.1758625597450;
        Tue, 23 Sep 2025 04:06:37 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b293fa07816sm709263166b.50.2025.09.23.04.06.36
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Sep 2025 04:06:37 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 00/22] Cherry-picks from Master Batch A
Date: Tue, 23 Sep 2025 13:06:14 +0200
Message-ID: <20250923110636.3413021-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 23 Sep 2025 11:06:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119664

This is batch A of cherry picks from master branch, that I deem to be useful and 
appropriate to be in Kirkstone branch.

These include assorted recipe fixes (SRC_URI, LICENSE, typo fixes), and recipe 
version updates. With recipe updates I have spent effort to ensure that they 
contain only bugfixes - I did go through all the change logs and/or the commit logs,
and I did skip commits that introduced some backwards incompatible changes.

This batch has so far survived a "bitbake world" build for arm, aarch64, x86 and x86-64.

Even though I tried to be careful with my cherry picks, your review and comments 
would be very appreciated.

Thank you.

P.S: I plan to send similar batches (consisting of ~20 patches), once a day, for 
the next couple of days.

--

Changqing Li (1):
  libtimezonemap: correct package version

Gyorgy Sarvari (1):
  fatresize: set correct LICENSE

Kai Kang (1):
  libtimezonemap: rename downloaded file name

Khem Raj (2):
  faenza-icon-theme: Switch to a valid download  location for SRC_URI
  libtimezonemap: Point to a working SRC_URI

Mingli Yu (6):
  libnma: add opengl to REQUIRED_DISTRO_FEATURES
  network-manager-applet: add opengl to REQUIRED_DISTRO_FEATURES
  gnome-bluetooth: add opengl to REQUIRED_DISTRO_FEATURES
  gnome-desktop: add opengl to REQUIRED_DISTRO_FEATURES
  gtksourceview5: add opengl to REQUIRED_DISTRO_FEATURES
  evince: add opengl to REQUIRED_DISTRO_FEATURES

Wang Mingyu (4):
  sshfs-fuse: upgrade 3.7.2 -> 3.7.3
  evolution-data-server: upgrade 3.44.1 -> 3.44.2
  gjs: upgrade 1.72.1 -> 1.72.2
  gnome-bluetooth: upgrade 42.2 -> 42.3

Yi Zhao (2):
  yaffs2-utils: update SRC_URI
  evince: fix typo for RRECOMMENDS

wangmy (5):
  evolution-data-server: upgrade 3.44.0 -> 3.44.1
  gjs: upgrade 1.72.0 -> 1.72.1
  gnome-bluetooth: upgrade 42.0 -> 42.1
  gnome-bluetooth: upgrade 42.1 -> 42.2
  evince: upgrade 42.2 -> 42.3

 ...shfs-fuse_3.7.2.bb => sshfs-fuse_3.7.3.bb} |  2 +-
 .../yaffs2/yaffs2-utils_git.bb                |  3 +-
 .../fatresize/fatresize_1.1.0.bb              |  2 +-
 .../libnma/libnma_1.8.38.bb                   |  2 +-
 .../network-manager-applet_1.26.0.bb          |  2 +-
 .../evince/{evince_42.2.bb => evince_42.3.bb} |  8 +++--
 .../evolution-data-server.inc                 |  4 +--
 .../faenza-icon-theme_1.3.bb                  |  3 +-
 .../gjs/{gjs_1.72.0.bb => gjs_1.72.2.bb}      |  2 +-
 ...etooth_42.0.bb => gnome-bluetooth_42.3.bb} |  4 +--
 .../gnome-desktop/gnome-desktop_42.0.bb       |  2 +-
 .../gtksourceview/gtksourceview5_5.4.1.bb     |  1 +
 ...001-configure.ac-correct-the-version.patch | 29 +++++++++++++++++++
 .../libtimezonemap/libtimezonemap_0.4.6.bb    |  4 +--
 14 files changed, 49 insertions(+), 19 deletions(-)
 rename meta-filesystems/recipes-filesystems/sshfs-fuse/{sshfs-fuse_3.7.2.bb => sshfs-fuse_3.7.3.bb} (93%)
 rename meta-gnome/recipes-gnome/evince/{evince_42.2.bb => evince_42.3.bb} (80%)
 rename meta-gnome/recipes-gnome/gjs/{gjs_1.72.0.bb => gjs_1.72.2.bb} (92%)
 rename meta-gnome/recipes-gnome/gnome-bluetooth/{gnome-bluetooth_42.0.bb => gnome-bluetooth_42.3.bb} (87%)
 create mode 100644 meta-gnome/recipes-gnome/libtimezonemap/files/0001-configure.ac-correct-the-version.patch


