Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
 by mx.groups.io with SMTP id smtpd.web11.26641.1601867963686937096
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 04 Oct 2020 20:19:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=RrUVYRms;
 spf=pass (domain: gmail.com, ip: 209.85.215.182, mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f182.google.com with SMTP id g18so2954796pgd.5
        for <openembedded-devel@lists.openembedded.org>; Sun, 04 Oct 2020 20:19:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wTpHxqsTDK0UKARWsyo0V1k4zcs1reunsDsW3GVbCx4=;
        b=RrUVYRmsrprlrXMwhF2Cb9CvHEbjvPXjKrGp9mDKt8xpP3ElzvzOsm17BddoVTfMIs
         MsRlFQEh8avzKJm83mtLOdZBmg4ZL/kkwQax4l4U8PNpmbVV9BhfHTZlI8XOq1P0HqoA
         s2q7Cej1q+Xpj6H/rORXonF+FucFjA/B41GtZGSUUcDJAWpSZ3gesAuaO14M/y7L5Dzg
         pEWiDpFjqSfZnb2zU/1Gd2ItV6k/kd1Iz6q1sO5TGp/JBeAbPil3LENEZuaHJ4jI8sZi
         QjubhgrlmvpqAkTUbZ1gMd4JtLpymtOT3tQ2kCUhurCLaQ/bEKO8Hh5rLWN0awaiTNMN
         FqzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wTpHxqsTDK0UKARWsyo0V1k4zcs1reunsDsW3GVbCx4=;
        b=k5FEeApdptXQF0T2g9fgW4khN4U0mIuVT3zos7kUx6STQ0YAorMo5+cB1b98gRwtkl
         eeYPQeKPTlapGN2jPo4gPpEVdyB+n/9lVBlgkL8dimgqpgjS/uXQW2vFo7eWfRktTYi6
         eJPO/H1v82pw/1yOwB0hYj2Zelh9QTQerqINZrUaSguvs5p+n9rPo4B8GvDxD9vvQYJm
         hPqdjDYujquMeDteE/8HpDd7B7h1o3sKOZ/f6fkTIXNFEYrVzHEW4g2DhmYUXu7102gD
         ur9Ums3MY5PC83I/hUwnCAuM3FtIHgDenkGOleU9CDpZFQ4jeMlnTS36cptF15oUQ+ky
         sp2Q==
X-Gm-Message-State: AOAM530zoEgk9t6h1B1gZwA9qcDgNFQ2ugA0+MU9EK6Ff813g/I4MUMN
	MnuI2vaYV4ufqkz50S3KF0vEHSStFy0=
X-Google-Smtp-Source: ABdhPJzrZegO0CoYmmcT1R9xX4X+n//Dt5j1BqdvAP7mKNywZol5zLr4r10seklVEL6KPgxpD2O2fw==
X-Received: by 2002:a62:cd46:0:b029:150:ddeb:646b with SMTP id o67-20020a62cd460000b0290150ddeb646bmr14043820pfg.27.1601867962686;
        Sun, 04 Oct 2020 20:19:22 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net ([2601:202:4180:a5c0:1c02:d346:ee81:b86d])
        by smtp.gmail.com with ESMTPSA id e8sm8825023pgj.8.2020.10.04.20.19.21
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2020 20:19:22 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfell 0/9] Patch review Oct 4
Date: Sun,  4 Oct 2020 20:19:10 -0700
Message-Id: <cover.1601867756.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Next dunfell patch review.

Please have comments back by Tuesday evening.

The following changes since commit 144077083457ccb75700777d5e6b1da9aaff01aa:

  iwd: Upgrade to 1.9 (2020-09-19 11:22:44 -0700)

are available in the Git repository at:

  git://git.openembedded.org/meta-openembedded-contrib stable/dunfell-nut
  http://cgit.openembedded.org/meta-openembedded-contrib/log/?h=stable/dunfell-nut

Andreas Müller (1):
  gnome-settings-daemon: Remove wrong RDEPEND

Hongxu Jia (1):
  python3-pykwalify: fix missing comma

Khem Raj (1):
  ssmtp: Use update alternatives for conflicts with esmtp

Martin Jansa (2):
  netkit-rsh: inherit update-alternatives
  ssmtp: adjust u-a

Mingli Yu (2):
  smartmontools: Remove obsolete setting regarding the Standard Output
  strongswan: Remove obsolete setting regarding the Standard Output

Pierre-Jean Texier (1):
  haveged: upgrade 1.9.9 -> 1.9.13

Robert Yang (1):
  crda: rdepends on wireless-regdb-static

 .../gnome-settings-daemon_3.34.2.bb           |  2 --
 .../recipes-connectivity/crda/crda_3.18.bb    |  2 +-
 .../netkit-rsh/netkit-rsh_0.17.bb             |  2 +-
 .../recipes-support/ssmtp/ssmtp_2.64.bb       |  9 ++++-
 ...setting-regarding-the-Standard-Outpu.patch | 34 +++++++++++++++++++
 .../strongswan/strongswan_5.8.4.bb            |  1 +
 .../{haveged_1.9.9.bb => haveged_1.9.13.bb}   |  2 +-
 .../smartmontools/files/smartd.service        |  1 -
 .../0001-rule.py-fix-missing-comma.patch      | 34 +++++++++++++++++++
 .../python/python3-pykwalify_1.7.0.bb         |  2 ++
 10 files changed, 82 insertions(+), 7 deletions(-)
 create mode 100644 meta-networking/recipes-support/strongswan/files/0001-Remove-obsolete-setting-regarding-the-Standard-Outpu.patch
 rename meta-oe/recipes-extended/haveged/{haveged_1.9.9.bb => haveged_1.9.13.bb} (97%)
 create mode 100644 meta-python/recipes-devtools/python/python3-pykwalify/0001-rule.py-fix-missing-comma.patch

-- 
2.17.1

