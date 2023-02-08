Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60FBBC636D4
	for <webhook@archiver.kernel.org>; Wed,  8 Feb 2023 15:25:55 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web10.537.1675869948539034793
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 08 Feb 2023 07:25:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bgdev-pl.20210112.gappssmtp.com header.s=20210112 header.b=b24XPicc;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.128.54, mailfrom: brgl@bgdev.pl)
Received: by mail-wm1-f54.google.com with SMTP id l21-20020a05600c1d1500b003dfe462b7e4so2754846wms.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 08 Feb 2023 07:25:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DWYB0Sr+QkmlVgvFE74C0O9bqbvalG0WEFcywzDyqDw=;
        b=b24XPicciLly974Vz9RbQoEVByflXf3MmwflZTXD0IGbYYF/nWCVG7qBJa0guTjzoC
         ymBXBvPssqDlxkKVLWlZSffrWF1BXyqaf8vdhDjFbU3fK1yp2koUwswC0L7TY9uC+uRl
         WD0bLRyG9q0SOgKgpGXLb283RiGrCiwMBnkxejQofv1h7ds1ixxy6DPpYNudQHq3gmh1
         kDONU8WqxqfmaQsCE/sVxD5CMCjvxo7Def/VNg/MqaWn6PrTIoD3/oTlSb8jJU41kkDD
         2XsqFX2GJ2pYYSb/L6iB5X8dYs8yklSYfIl2zWKGoBNKR9/Xn+0lAwfRQBoMYLEiG0Qp
         r5dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DWYB0Sr+QkmlVgvFE74C0O9bqbvalG0WEFcywzDyqDw=;
        b=j1ZhWVn95Qh8WuroZjE7yn4aP8uEigthPk7rl1BGx544OOawty+CWHQi8+7tvWzz/T
         g/vhdnUxv2F3oTpwfgCJiKyzk1IMCpMyLJMIdRQWVpsbt8L1a78QTzqYYfwuVt9mcTQh
         tQ3eJDbsEoWKxahgESjdKDuqRA9Eb0M49ZPttirlTGaTJKI72GxCiYiTX5G3Qc7bz3ae
         gOHq3p/ViJxpTGjvAPVl7agNpf+FgwbqPLs9veSkSjhReCDJgax9lRJ6YrHxslMPnj4B
         VbQY4NJ0L7B7macFg4zU2XpJ45r0bX51A3wnrpsDGzB8qJyIoLlglpyNY2sLjfJO5w3S
         8LHQ==
X-Gm-Message-State: AO0yUKX2AWqW6Pthixyd8ilrc8Gh/tJw5ocL7rvLUvEmUS4tORsXTF/d
	IcU+bP3DxfiF1lbYI5S+0cArrg==
X-Google-Smtp-Source: AK7set9ZrcLQVfOP6pkNOER9+XPLX94JLRiCx0b9vqKRdbD47WfPDB3RQXHHwV6GyvwcxH3BgjnWPg==
X-Received: by 2002:a05:600c:708:b0:3df:ad32:e5d7 with SMTP id i8-20020a05600c070800b003dfad32e5d7mr7140380wmn.20.1675869946777;
        Wed, 08 Feb 2023 07:25:46 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:a9fe:4fba:ab76:6149])
        by smtp.gmail.com with ESMTPSA id n2-20020a05600c3b8200b003dfe659f9b1sm6713239wms.3.2023.02.08.07.25.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Feb 2023 07:25:46 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [meta-oe][PATCH 0/3] libgpiod: add support for libgpiod v2
Date: Wed,  8 Feb 2023 16:25:38 +0100
Message-Id: <20230208152541.136848-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 08 Feb 2023 15:25:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100997

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

We've just tagged the release candidate for libgpiod v2. This is a major
release entirely overhauling the API in a backward incompatible way.

While this is not the final release yet, it's not likely to change much so
I'd like to make it available in meta-openembedded to give it exposure to
some testing. When we do release v2.0, it'll be just a matter of bumping the
version.

Currently no other package depends on libgpiod in meta-openembedded, so I'd
like to avoid having two packages (libgpiod and libgpiod2). Instead let's
provide recipes for both versions but keep them under the common libgpiod name
as it's unlikely anyone would need both versions in a single system. This is
after all a medium-sized project that shouldn't require too much work in order
to port a user to the new major release.

The first patch contains an update of libgpiod v1.6.x to the most recent
bug-fix release.

The second contains the recipe for libgpiod v2.0-rc1 while also moving the
bitbake code around in order to factor out common elements.

The third contains a recipe for the python bindings that are now in their own
project in meta-python.

The new recipes provide the same functionality - including ptest for the C
library, tools and language bindings.

Bartosz Golaszewski (3):
  libgpiod: update to v1.6.4
  libgpiod: add a recipe for libgpiod v2.0-rc1
  python3-gpiod: new package

 ...-don-t-expect-automake-to-set-PYTHON.patch | 37 ---------
 .../{files => libgpiod-1.6.4}/run-ptest       |  0
 .../libgpiod/libgpiod-2.0-rc1/run-ptest       | 24 ++++++
 .../recipes-support/libgpiod/libgpiod-src.inc |  1 +
 meta-oe/recipes-support/libgpiod/libgpiod.inc | 61 ++++++++++++++
 .../libgpiod/libgpiod_1.6.3.bb                | 82 -------------------
 .../libgpiod/libgpiod_1.6.4.bb                | 37 +++++++++
 .../libgpiod/libgpiod_2.0-rc1.bb              | 21 +++++
 .../packagegroups/packagegroup-meta-python.bb |  1 +
 .../python/python3-gpiod/run-ptest            | 15 ++++
 .../python/python3-gpiod_2.0-rc1.bb           | 45 ++++++++++
 11 files changed, 205 insertions(+), 119 deletions(-)
 delete mode 100644 meta-oe/recipes-support/libgpiod/files/0001-build-don-t-expect-automake-to-set-PYTHON.patch
 rename meta-oe/recipes-support/libgpiod/{files => libgpiod-1.6.4}/run-ptest (100%)
 create mode 100644 meta-oe/recipes-support/libgpiod/libgpiod-2.0-rc1/run-ptest
 create mode 100644 meta-oe/recipes-support/libgpiod/libgpiod-src.inc
 create mode 100644 meta-oe/recipes-support/libgpiod/libgpiod.inc
 delete mode 100644 meta-oe/recipes-support/libgpiod/libgpiod_1.6.3.bb
 create mode 100644 meta-oe/recipes-support/libgpiod/libgpiod_1.6.4.bb
 create mode 100644 meta-oe/recipes-support/libgpiod/libgpiod_2.0-rc1.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-gpiod/run-ptest
 create mode 100644 meta-python/recipes-devtools/python/python3-gpiod_2.0-rc1.bb

-- 
2.37.2


