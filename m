Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
 by mx.groups.io with SMTP id smtpd.web12.7950.1631714125158453987
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 15 Sep 2021 06:55:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=i8n8OcsI;
 spf=pass (domain: gmail.com, ip: 209.85.215.173, mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f173.google.com with SMTP id f129so2820466pgc.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 15 Sep 2021 06:55:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0N7kD2NKWnsHdRReNv4NYUM12hAyGtwpusikG/K/BAc=;
        b=i8n8OcsIQ24Ot8l0VOPJJk7Ngp+Zz6+OEr2MiZvR7qWJwW9/grXaz1gZHeED0lFI09
         zX8lCZYijz3/k3jL32NvE8FXQwEjb0Dj6y1BHRWXHzVwlgOQpz9cQxulcSdEMvf2EyU5
         y84sg5BohFg7YLsH06dtO9yjW9xXby/rJT7/w6ihDS9tDCgJvvqxwJa6f7IQE+55cW5I
         O4XHky/TeTYKpaxcg7KKMs0crIx996OdBFDY2iFjLbzRCq6xMG1MGLznxsZ57J9US3bD
         jmm9tcsV2IA68HTheXDEeoIOGNmmtbdUQ5hrVzNbhZsos2iBqmMyRAnfE44O+P4UAO9t
         Ckew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0N7kD2NKWnsHdRReNv4NYUM12hAyGtwpusikG/K/BAc=;
        b=lAQ86bJzNbptr7/kp7UqtHybagCcbSM8Vr2kVotXt5gRTtzyoahOdK/Y5DjStRuqIs
         yfEdHLUWkSwBr5wwRgtheLoPbo1zymH2+83r2oYuNNH5t8Ym9vttiNx0HbqGlxdGe3Dy
         04Uo/h4oBY0VpmfJhIOzGOr1egdWibI+goe1mGlA5X1Vh3wPG3IrJRU4z8g/M6DOlumY
         MNIJDOghbyr08lcaoSPi/nFq6cj4jf2t057yY3mIXBX6PqBechsWl9En9Xr9bA+dcSjI
         yN7C65JxBFUDU18Axfxptp2tYzd7YTBVdVVR9ROyRcbA+b5dzuf2Na2K2eB1zinO2sjP
         K1Iw==
X-Gm-Message-State: AOAM530l9Sovf4Whw+YZ7tcr9G4US3GLzozJE8L6HzH0r9BXNufcS7MP
	SodrOZAuY0CWvROfKKK/jmhKQuyFW9Q=
X-Google-Smtp-Source: ABdhPJzWXaEBlVW9Y7ND7IKeq4bOyyA1aVBmbuxYOqjG83KqUUc/YXAOyN2UQEQrLuNgQMfNBaE/eg==
X-Received: by 2002:a63:7a10:: with SMTP id v16mr20869112pgc.146.1631714124241;
        Wed, 15 Sep 2021 06:55:24 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from keaua.hsd1.ca.comcast.net ([2601:202:4180:a5c0:35e:ec78:cef4:300f])
        by smtp.gmail.com with ESMTPSA id v7sm4824941pjk.37.2021.09.15.06.55.23
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Sep 2021 06:55:23 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [hardknott 0/9] Patch review Sept 15th
Date: Wed, 15 Sep 2021 06:55:11 -0700
Message-Id: <cover.1631713963.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Please have comments back by Friday

The following changes since commit 7bd7e1da9034e72ca4262dba55f70b2b23499aae:

  dlt-daemon: update from 2.18.6 to 2.18.7 (2021-09-04 10:39:29 -0700)

are available in the Git repository at:

  git://git.openembedded.org/meta-openembedded-contrib stable/hardknott-nut
  http://cgit.openembedded.org/meta-openembedded-contrib/log/?h=stable/hardknott-nut

Changqing Li (1):
  c-ares: fix CVE-2021-3672

Joe Slater (1):
  redis: fix CVE-2021-32761

Khem Raj (1):
  vboxguestdrivers: Remove __divmoddi4 patch

Kristian Klausen (1):
  cryptsetup: Add runtime dependency on lvm2-udevrules for udev

Peter Kjellerstedt (1):
  cryptsetup: Only recommend kernel modules when building for target

Yi Zhao (1):
  krb5: fix CVE-2021-36222

wangmy (1):
  cjson: upgrade 1.7.14 -> 1.7.15

zangrc (1):
  cryptsetup: upgrade 2.3.5 -> 2.3.6

zhengruoqin (1):
  wireshark: upgrade 3.4.7 -> 3.4.8

 ...{wireshark_3.4.7.bb => wireshark_3.4.8.bb} |   2 +-
 .../krb5/krb5/CVE-2021-36222.patch            | 121 +++++++++
 .../recipes-connectivity/krb5/krb5_1.17.2.bb  |   1 +
 ...ryptsetup_2.3.5.bb => cryptsetup_2.3.6.bb} |  31 ++-
 .../{cjson_1.7.14.bb => cjson_1.7.15.bb}      |   2 +-
 .../redis/redis/CVE-2021-32761.patch          | 257 ++++++++++++++++++
 meta-oe/recipes-extended/redis/redis_6.2.2.bb |   1 +
 .../c-ares/c-ares/0001-CVE-2021-3672.patch    |  91 +++++++
 .../c-ares/c-ares/0002-CVE-2021-3672.patch    | 104 +++++++
 .../recipes-support/c-ares/c-ares_1.16.1.bb   |   2 +
 .../vboxguestdrivers/add__divmoddi4.patch     |  36 ---
 .../vboxguestdrivers_6.1.26.bb                |   1 -
 12 files changed, 595 insertions(+), 54 deletions(-)
 rename meta-networking/recipes-support/wireshark/{wireshark_3.4.7.bb => wireshark_3.4.8.bb} (97%)
 create mode 100644 meta-oe/recipes-connectivity/krb5/krb5/CVE-2021-36222.patch
 rename meta-oe/recipes-crypto/cryptsetup/{cryptsetup_2.3.5.bb => cryptsetup_2.3.6.bb} (88%)
 rename meta-oe/recipes-devtools/cjson/{cjson_1.7.14.bb => cjson_1.7.15.bb} (90%)
 create mode 100644 meta-oe/recipes-extended/redis/redis/CVE-2021-32761.patch
 create mode 100644 meta-oe/recipes-support/c-ares/c-ares/0001-CVE-2021-3672.patch
 create mode 100644 meta-oe/recipes-support/c-ares/c-ares/0002-CVE-2021-3672.patch
 delete mode 100644 meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers/add__divmoddi4.patch

-- 
2.25.1

