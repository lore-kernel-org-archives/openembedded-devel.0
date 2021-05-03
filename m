Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
 by mx.groups.io with SMTP id smtpd.web08.1661.1620069131493415339
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 03 May 2021 12:12:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=t9LwWEF5;
 spf=pass (domain: gmail.com, ip: 209.85.210.45, mailfrom: akuster808@gmail.com)
Received: by mail-ot1-f45.google.com with SMTP id 103-20020a9d0d700000b02902a5baf33f37so5605812oti.9
        for <openembedded-devel@lists.openembedded.org>; Mon, 03 May 2021 12:12:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id;
        bh=Nr+3Q5E1xG4sw5SqLdmBShAqthhiXXJ+lugiyn1MVxo=;
        b=t9LwWEF5y9AuE4xVJSRNNMzrspR08LP2Y14E1oADhCnZWW+YVqXlgMKJGX3fmOzR6N
         /eRDprRlomV9g0LJjon4cfGvYZ0fpNCIUrVQjDlpoeVGLrSJs20ZqwiA3H0y3d9tQuAX
         ArtApeQCUTbL9PxlCsKdfejFst9yPBAX2MppQV2bQ3681eH7eA8q8lGUnaTTSkmv2FTm
         AA1VQtYYizeJl/3A2oyxeHFasE6U3imD5GQ9Q3EZnabofEUfDb2VydTowSYfYWgsuJ4V
         c2euZjK7JTQGkFZmnHhAo2HdxGe5gUOxZl8hdGEbv7B5x4euoL7Cj42YZEFyfbm+XH0V
         J1wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id;
        bh=Nr+3Q5E1xG4sw5SqLdmBShAqthhiXXJ+lugiyn1MVxo=;
        b=BCAf+ArLJerWRqTkqFxo80+zr6aKWYlVdMTGMdBIlEPTP64e6bA7YvJUmCOaV/50ON
         k8Hw/DhmABS2UEgoJKVFP7iLcwMimLJxQQ212ZvqbaSoxCDwykJKdS2QnGXKa83mtMhO
         +8t0/ZwWnjQ8Wv1TStXP+e/6ZeLXbihLPZIRLI7dh1pwQSZa2j6oZR4d7p+gz52zHHf2
         wBOA8iXtIdP6AXDFpxHvFdpBHao/S6qgR320p9lhSQRUnygBA1QK7AnR6bJL3rJKs23G
         FO9QEH5Y4APu0vc60IaeqXm+95GukZE5q3UoHbwngxy+BvC1kI9y+7xA7PNL+SpzAUz0
         iEDw==
X-Gm-Message-State: AOAM5326Dp4eVeu08yx5ihpeHhHX+H7VukLJAM+6KP9XxjdqmSiUTESl
	ONqN5sNJDLd3O25DkGyEvwErmENdu06SKA==
X-Google-Smtp-Source: ABdhPJzDKT2/Pkd/VAzeInBNCukiY1su6qnHDSUtfeUYcUDEvrjDEhlsNY1el8hf/XmQkY40QZuJMg==
X-Received: by 2002:a05:6830:1313:: with SMTP id p19mr15128904otq.119.1620069130678;
        Mon, 03 May 2021 12:12:10 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:dc35:22d6:72af:c1da])
        by smtp.gmail.com with ESMTPSA id s85sm150047oos.4.2021.05.03.12.12.10
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 May 2021 12:12:10 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [hardknott 00/14] Patch review May 3
Date: Mon,  3 May 2021 12:11:53 -0700
Message-Id: <cover.1620069041.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1

Please have feedback back by Wednesday.

The following changes since commit 71b546ed8595b14d29efc1e8b951f8c845ad10c4:

  python3-cryptography: Upgrade to 3.3.2 (2021-04-23 19:09:56 -0700)

are available in the Git repository at:

  git://git.openembedded.org/meta-openembedded-contrib stable/hardknott-nut
  http://cgit.openembedded.org/meta-openembedded-contrib/log/?h=stable/hardknott-nut

Armin Kuster (2):
  nostromo: Blacklist and exclude from world builds
  packagegroup-meta-webserver: remove nostromo from pkg grp

Kai Kang (1):
  freeradius: check existence of openssl's commands in bootstrap

Khem Raj (2):
  tbb: Re-introduce PE
  gimp: Disable vector icons on musl/x86

Leon Anavi (3):
  python3-pysonos: Upgrade 0.0.42 -> 0.0.43
  python3-asttokens: Upgrade 2.0.4 -> 2.0.5
  python3-hyperframe: Upgrade 6.0.0 -> 6.0.1

Sinan Kaya (1):
  zram: add support for mem_limit

Yi Zhao (1):
  gvfs: rdepend on gsettings-desktop-schemas

zangrc (4):
  networkmanager: upgrade 1.30.2 -> 1.30.4
  libdvdread: upgrade 6.1.1 -> 6.1.2
  redis: upgrade 6.2.1 -> 6.2.2
  nss: upgrade 3.63 -> 3.64

 meta-gnome/recipes-gimp/gimp/gimp_2.10.22.bb  |  1 +
 meta-gnome/recipes-gnome/gvfs/gvfs_1.44.1.bb  |  2 +
 ...eck-openssl-cmds-in-script-bootstrap.patch | 38 +++++++++++++++++++
 .../freeradius/freeradius_3.0.21.bb           |  1 +
 ...ger_1.30.2.bb => networkmanager_1.30.4.bb} |  2 +-
 .../redis/{redis_6.2.1.bb => redis_6.2.2.bb}  |  2 +-
 .../recipes-extended/zram/zram/zram-swap-init |  5 +++
 ...ibdvdread_6.1.1.bb => libdvdread_6.1.2.bb} |  4 +-
 .../nss/{nss_3.63.bb => nss_3.64.bb}          |  7 ++--
 meta-oe/recipes-support/tbb/tbb_2021.2.0.bb   |  2 +
 ...e_6.0.0.bb => python3-hyperframe_6.0.1.bb} |  3 +-
 ...ns_2.0.4.bb => python3-asttokens_2.0.5.bb} |  2 +-
 ...os_0.0.42.bb => python3-pysonos_0.0.43.bb} |  2 +-
 .../packagegroup-meta-webserver.bb            |  1 -
 .../recipes-httpd/nostromo/nostromo_1.9.9.bb  |  3 ++
 15 files changed, 63 insertions(+), 12 deletions(-)
 create mode 100644 meta-networking/recipes-connectivity/freeradius/files/check-openssl-cmds-in-script-bootstrap.patch
 rename meta-networking/recipes-connectivity/networkmanager/{networkmanager_1.30.2.bb => networkmanager_1.30.4.bb} (98%)
 rename meta-oe/recipes-extended/redis/{redis_6.2.1.bb => redis_6.2.2.bb} (96%)
 rename meta-oe/recipes-multimedia/libdvdread/{libdvdread_6.1.1.bb => libdvdread_6.1.2.bb} (71%)
 rename meta-oe/recipes-support/nss/{nss_3.63.bb => nss_3.64.bb} (96%)
 rename meta-python/recipes-connectivity/python-hyperframe/{python3-hyperframe_6.0.0.bb => python3-hyperframe_6.0.1.bb} (61%)
 rename meta-python/recipes-devtools/python/{python3-asttokens_2.0.4.bb => python3-asttokens_2.0.5.bb} (81%)
 rename meta-python/recipes-devtools/python/{python3-pysonos_0.0.42.bb => python3-pysonos_0.0.43.bb} (79%)

-- 
2.17.1

