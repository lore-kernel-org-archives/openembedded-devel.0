Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
 by mx.groups.io with SMTP id smtpd.web11.4744.1619259110999540261
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 24 Apr 2021 03:11:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=g+0BveV/;
 spf=pass (domain: gmail.com, ip: 209.85.215.177, mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f177.google.com with SMTP id j7so27454713pgi.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 24 Apr 2021 03:11:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=V2TKhYsdxe9/odiEUymNq6nWUtcB1or2BHdkfsckab8=;
        b=g+0BveV/XAM0+cbkGc7xni7JojIh1zJEaVwVekePjRj5hEYOMNX/fiPZLiUavx5spj
         CT4jwhRPcYpEZSdanM/hJSMxMby3BeyW7CyPv4bTAOeBA6e+p2727K+j7IT7k3XiXd9b
         d9MiHMEMwsZ3nE511Fb4FvsZLOw3fjODzerZzuV5FxrOISfMgEMy2BdEHRZzecYHMYX8
         Xm41CQLxCW3yvSs+jeIcgqleQCMEFxd0Q1LGh5dQWp+5XtpcKf4QoXO1B007fkWMKZYB
         17/JBLE5NbUGEjMF+PVlIhGTzIOD+uANJJ7vRBkCXZaZJqPDXT6AlUR3q+8JRVhedljB
         8oVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=V2TKhYsdxe9/odiEUymNq6nWUtcB1or2BHdkfsckab8=;
        b=JeZXvf3BMNSWISDgNO0r8yZL+95q1R8ALeM/8wd9jKW7drw3rHy1t/NmCKNAtln/O4
         Qq89K55Ztv3RE83vfzXih/FRfyoE8lWI4dCzagI55/NkdUY2axfP/uZ+PCJ5CbCXKagm
         2upl+sYR3RpYBg1jRnDxkH3ICkCjf7kZzB7oAVe9064Gft0POu89n3LB8DHshTwFHojl
         Hw4eSiHSisC9tT82IHGEQ0YthUaN+B7WjCGy3XXY3YgA9tm7s3ODUkUcstXRB9gM4oNf
         NOgA6ZqSNgUGsOIpk61AZBq/SsR1xMtBgiNmWNfysBh7rQi0HHw84rLMVlCZqVekPXK/
         IYGA==
X-Gm-Message-State: AOAM532njTIzAcPi6qXFCDRs+WmD4r/OUt5u6wHvOS9zVmmuIksZLK79
	Ve/Fm4S2Iat/+gx737LrvWYxrzHbigimGw==
X-Google-Smtp-Source: ABdhPJwJVzgvqfQS3gh7TOSNSzeLa8KV9pV03qZlxMeTNClBb0sNd7xesuxpBm0cVPyQJRZszqjnSg==
X-Received: by 2002:a63:f651:: with SMTP id u17mr7938282pgj.148.1619259110205;
        Sat, 24 Apr 2021 03:11:50 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:9c11:697b:fdac:256e])
        by smtp.gmail.com with ESMTPSA id h17sm1033173pfr.97.2021.04.24.03.11.49
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Apr 2021 03:11:49 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [hardknott 0/6] Patch review April 24th
Date: Sat, 24 Apr 2021 03:11:41 -0700
Message-Id: <cover.1619258978.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

These have been sent to the list already so shorter review cycle.
Please have feedback by Sunday.

The following changes since commit 2297d4ee04b47bc574f8879732d9e213ab7bf685:

  wireguard: update to v1.0.20210219 +1 (2021-04-18 13:49:13 -0700)

are available in the Git repository at:

  git://git.openembedded.org/meta-openembedded-contrib stable/hardknott-nut
  http://cgit.openembedded.org/meta-openembedded-contrib/log/?h=stable/hardknott-nut

Chen Qi (2):
  tigervnc: upgrade to 1.11.0
  python3-django: upgrade to 2.2.20

Mingli Yu (2):
  php: Upgrade to 7.4.16
  python3-cryptography: Upgrade to 3.3.2

Stefan Ghinea (1):
  python3-django: fix CVE-2021-28658

Ulrich Ölmann (1):
  v4l-utils: fix reproducibility

 .../php/php/CVE-2020-7069.patch               | 158 ------------------
 .../php/php/CVE-2020-7070.patch               |  24 ---
 .../php/{php_7.4.9.bb => php_7.4.16.bb}       |   7 +-
 ...002-do-not-build-tests-sub-directory.patch |  21 +--
 ...vnc-add-fPIC-option-to-COMPILE_FLAGS.patch |  36 ++--
 ...{tigervnc_1.10.1.bb => tigervnc_1.11.0.bb} |  13 +-
 ...c-autodetect-availability-of-systemd.patch |  47 ++++++
 ...ct-installation-of-50-rc_keymap.conf.patch |  40 +++++
 .../v4l2apps/v4l-utils_1.20.0.bb              |  11 +-
 ...3.3.1.bb => python3-cryptography_3.3.2.bb} |   2 +-
 ...ngo_2.2.16.bb => python3-django_2.2.20.bb} |   4 +-
 11 files changed, 130 insertions(+), 233 deletions(-)
 delete mode 100644 meta-oe/recipes-devtools/php/php/CVE-2020-7069.patch
 delete mode 100644 meta-oe/recipes-devtools/php/php/CVE-2020-7070.patch
 rename meta-oe/recipes-devtools/php/{php_7.4.9.bb => php_7.4.16.bb} (97%)
 rename meta-oe/recipes-graphics/tigervnc/{tigervnc_1.10.1.bb => tigervnc_1.11.0.bb} (89%)
 create mode 100644 meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0008-configure.ac-autodetect-availability-of-systemd.patch
 create mode 100644 meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0009-keytable-restrict-installation-of-50-rc_keymap.conf.patch
 rename meta-python/recipes-devtools/python/{python3-cryptography_3.3.1.bb => python3-cryptography_3.3.2.bb} (94%)
 rename meta-python/recipes-devtools/python/{python3-django_2.2.16.bb => python3-django_2.2.20.bb} (41%)

-- 
2.17.1

