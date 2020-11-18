Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web10.25619.1605712083414988383
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 18 Nov 2020 07:08:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=FpNEfHly;
 spf=pass (domain: gmail.com, ip: 209.85.210.178, mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f178.google.com with SMTP id y7so1573306pfq.11
        for <openembedded-devel@lists.openembedded.org>; Wed, 18 Nov 2020 07:08:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=VPwImigGYIDQmGc8/b2ALrD+nChxWzouZ8FIHSZGgo8=;
        b=FpNEfHlyhvdV72FGOpK8ZFsc3Klz5Jvy/qR9DyBJnxDJ3H9X08dIuJfnAue0k/KKcX
         2Gm0Htra9XgV7bLd9GPEYR40DrinvRKzhUSqAoCZNe15RJk+OyWBLeZ6UhwzVWtB9ChC
         NEngW2JB1+uavCDyMWA5e3/TesE6pY4h/EhHYbm1Heg2HfOWLhrMhWuAeU2Nq5oKdt1H
         CQjHXao/oNJpKzIwxr5CF13SDIzYctLtyHjVQYS/ByR6VJtUmkexRer6b6naOPIwBUM9
         ti8epgvcLIAmSwTRBn4GVXPikefBUy5c6WBG9JUyRcisqdF3Mx3NuGHj7JzFFlC3Pt44
         WJyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=VPwImigGYIDQmGc8/b2ALrD+nChxWzouZ8FIHSZGgo8=;
        b=R8T5H0QB8Wfgu+qzXS1JA1hFDCND10FYoKy0lHDjNjdizEYjVjd4KYWxl77rmpwhN8
         IrapLLmkJC/CGljsBQC7KZLDUgOzsN5Kwu0PsFYnUH/w3SzvMwHnqSoV4qj6TLAYlekG
         nvGFzazMOXqjKansow9L0jNicuz7eWebIvWX9ffyEMgRRdgisGcD1norEuSjBWW8zL75
         SbaIPKDU1XfFalQXnvXx/5PtYW42lbVj7KVAaqRc2oN/yYvybkFflAng43/a3u+BpB1U
         94TeC7mmHcymkAIbSMdG9FYAk8zO81XX38YXx9nxJPG6gM7hth+Xxdc/AdZTEFKSRSLn
         4/1Q==
X-Gm-Message-State: AOAM53346O0RC7Osxk5jct5+MxPgf4piPeyaiNntmJNuC9r3JQZDH6Am
	L8OHXk+gyzVHu+B/z2dkn2M2BM1267k=
X-Google-Smtp-Source: ABdhPJyPT5WlX+J0HPcX71zo4sDrTOYGz5YwwgigWbwHmcOG8DwJytwju5D0BJ39ujvgyWH8II25Kg==
X-Received: by 2002:aa7:8518:0:b029:18b:cc9c:efab with SMTP id v24-20020aa785180000b029018bcc9cefabmr4901157pfn.39.1605712082411;
        Wed, 18 Nov 2020 07:08:02 -0800 (PST)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net ([2601:202:4180:a5c0:98b0:7a07:4094:f249])
        by smtp.gmail.com with ESMTPSA id g1sm2823005pjt.40.2020.11.18.07.08.01
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2020 07:08:01 -0800 (PST)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfell 00/17] Patch review Nov 18
Date: Wed, 18 Nov 2020 07:07:40 -0800
Message-Id: <cover.1605711982.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Here is the next set for dunfell.
Please have comments back by Friday

The following changes since commit 2a5c534d2b9f01e9c0f39701fccd7fc874945b1c:

  python3-pykwalify: fix missing comma (2020-10-04 16:32:42 -0700)

are available in the Git repository at:

  git://git.openembedded.org/meta-openembedded-contrib stable/dunfell-nut
  http://cgit.openembedded.org/meta-openembedded-contrib/log/?h=stable/dunfell-nut

Anatol Belski (1):
  chrony: Patch CVE-2020-14367

Diego Rondini (5):
  README: fix incorrect links
  gvfs: adjust fuse packageconfig to fuse3
  libeigen: update SRC_URI to download from gitlab
  libeigen: update SRC_URI to use gitlab git
  hplip: use libexecdir

Gianluca Pacchiella (1):
  Add missing dependencies for rsnapshot.

Khem Raj (1):
  ubi-utils-klibc: Remove trailing slash from S

Lee Chee Yang (2):
  glog : improve reproducibility
  libgphoto2: improve reproducibility

Mark Jonas (1):
  python3-pyinotify: Add missing ctypes dependency

Martin Jansa (1):
  remmina: use git fetcher

Ross Burton (1):
  mpv: fetch waf in do_fetch

Ulrich Ölmann (1):
  usb-modeswitch, usb-modeswitch-data: fix usrmerge

Yi Zhao (1):
  samba: upgrade 4.10.17 -> 4.10.18

Zang Ruochen (2):
  wireshark: upgrade 3.2.5 -> 3.2.6
  wireshark: upgrade 3.2.6 -> 3.2.7

 meta-gnome/recipes-gnome/gvfs/gvfs_1.42.2.bb  |   2 +-
 .../mtd/ubi-utils-klibc_2.0.2.bb              |   2 +-
 meta-multimedia/README                        |   2 +-
 .../0001-util-Simplify-input-validation.patch |  59 -----
 ...n-FreeBSD-by-avoiding-NSS_BUFLEN_PAS.patch |  79 -------
 ...larger-buffer-if-getpwuid_r-returns-.patch |  50 -----
 .../{samba_4.10.17.bb => samba_4.10.18.bb}    |   7 +-
 .../chrony/chrony/CVE-2020-14367.patch        | 204 ++++++++++++++++++
 .../recipes-support/chrony/chrony_3.5.bb      |   1 +
 ...{wireshark_3.2.5.bb => wireshark_3.2.7.bb} |   2 +-
 meta-oe/README                                |   4 +-
 .../recipes-extended/hplip/hplip_3.19.12.bb   |  14 +-
 .../gphoto2/libgphoto2_2.5.25.bb              |   6 +
 .../recipes-multimedia/mplayer/mpv_0.32.0.bb  |  12 +-
 meta-oe/recipes-support/glog/glog_0.3.5.bb    |   7 +
 .../libeigen/libeigen_3.3.7.bb                |   8 +-
 .../recipes-support/remmina/remmina_1.3.6.bb  |   7 +-
 .../rsnapshot/rsnapshot_git.bb                |   2 +
 .../usb-modeswitch-data_20191128.bb           |   4 +-
 .../usb-modeswitch/usb-modeswitch_2.6.0.bb    |   2 +-
 .../python/python3-pyinotify_0.9.6.bb         |   3 +-
 21 files changed, 252 insertions(+), 225 deletions(-)
 delete mode 100644 meta-networking/recipes-connectivity/samba/samba/0001-util-Simplify-input-validation.patch
 delete mode 100644 meta-networking/recipes-connectivity/samba/samba/0002-util-Fix-build-on-FreeBSD-by-avoiding-NSS_BUFLEN_PAS.patch
 delete mode 100644 meta-networking/recipes-connectivity/samba/samba/0003-util-Reallocate-larger-buffer-if-getpwuid_r-returns-.patch
 rename meta-networking/recipes-connectivity/samba/{samba_4.10.17.bb => samba_4.10.18.bb} (97%)
 create mode 100644 meta-networking/recipes-support/chrony/chrony/CVE-2020-14367.patch
 rename meta-networking/recipes-support/wireshark/{wireshark_3.2.5.bb => wireshark_3.2.7.bb} (96%)

-- 
2.17.1

