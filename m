Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91776C6379F
	for <webhook@archiver.kernel.org>; Thu, 16 Feb 2023 08:49:48 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web11.5977.1676537384808227518
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Feb 2023 00:49:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bgdev-pl.20210112.gappssmtp.com header.s=20210112 header.b=UX85KA0H;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.221.52, mailfrom: brgl@bgdev.pl)
Received: by mail-wr1-f52.google.com with SMTP id m10so1094503wrn.4
        for <openembedded-devel@lists.openembedded.org>; Thu, 16 Feb 2023 00:49:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bZY3BqUk+X5AkP+gU/CbEorrMCHSHBmgz6QRHqqZdSQ=;
        b=UX85KA0HFiznRHA1jjaeTeOzedM2gg7MGorpOZf7EWG8nGnY6vVb2iR0ohOd1i4Dvw
         UVfkCAoec3aOl5UaNN/XOW55CR9aZkhfQ3CgbkWNV6ECIqiLDUGyl7ORZkhb4azb6MRn
         pPir/gok0O3c0nvnDkJBP4XBwzW83KG9BBCFFc7dda3Vphokp9S0ibN+Iu68gSZl2iPk
         6av4+sv4hISbanGAMNlxEFskKkYRKnpSw4JJnf2j3rd1VFo+JFxLR2ZswYMuDvcCPRRQ
         i0ezzz4iumc/xvhTVWP4wm6m5RovlS8v0vfGwM6C9UShYKxxZSPxBt+HJsKBlGq4LJne
         5JCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bZY3BqUk+X5AkP+gU/CbEorrMCHSHBmgz6QRHqqZdSQ=;
        b=zhx8NjWmjZ4Ad8K8qoqX9sWUoeMhkKHYdde2bhKUo0EjptW1nZWKjtpHqeVyarKA/7
         Z4WWElMjwjHAiD49Y/1bHxIldUtJ4zhdSbCIJWuGhrOkEIqVoOOInxplHzqwCB6jYnyX
         K0iz+ykgILgqPckfplBI+UZVFukFymwFj+LnkLl+AljBvtyaXF36ccELBE9BEWCTAtj9
         P22EvDvWF8j3v2YWswNx1GUYxsCTygokd+UPz8sSwvYGYrmiLor8X61unZuZ2yMMhthS
         3BxVM83L/kT3ZwOxlj0KihYRM9CCmbZg7VKwIbH9z38KgkTjXIclsDMHd1JOvpA2e5rH
         KPHA==
X-Gm-Message-State: AO0yUKWPEavtiqOGjnTTPH/lkagYdnkMbSv6cmCKmc0nalGPzeAwVLYt
	ZjpJrlc9EWykslh65E6Gg16PVg==
X-Google-Smtp-Source: AK7set+YM4c2WEfaMKHLgcPRagYFOuY3JCubCQZdxYyiFC93GQVBlREiVnQhY38W9C4bOBD7djErng==
X-Received: by 2002:a5d:548e:0:b0:2c5:4aad:db7e with SMTP id h14-20020a5d548e000000b002c54aaddb7emr4109373wrv.58.1676537383207;
        Thu, 16 Feb 2023 00:49:43 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:7c5b:1160:db5d:72da])
        by smtp.gmail.com with ESMTPSA id e4-20020a5d5004000000b002c5706f7c6dsm891326wrt.94.2023.02.16.00.49.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Feb 2023 00:49:42 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [meta-oe][PATCH v2 0/2] libgpiod: add support for libgpiod v2
Date: Thu, 16 Feb 2023 09:49:35 +0100
Message-Id: <20230216084937.7365-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 16 Feb 2023 08:49:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101096

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

v1 -> v2:
- Several bugs detected in master-next were fixed and this recipe adds support
  for libgpiod v2.0-c2. The package now builds with clang, musl as well as
  clang & musl.

Bartosz Golaszewski (2):
  libgpiod: add a recipe for libgpiod v2.0-rc2
  python3-gpiod: new package

 .../{files => libgpiod-1.6.4}/run-ptest       |  0
 .../libgpiod/libgpiod-2.0-rc2/run-ptest       | 24 ++++++++
 .../recipes-support/libgpiod/libgpiod-src.inc |  1 +
 meta-oe/recipes-support/libgpiod/libgpiod.inc | 61 +++++++++++++++++++
 .../libgpiod/libgpiod_1.6.4.bb                | 56 ++---------------
 .../libgpiod/libgpiod_2.0-rc2.bb              | 21 +++++++
 .../packagegroups/packagegroup-meta-python.bb |  1 +
 .../python/python3-gpiod/run-ptest            | 15 +++++
 .../python/python3-gpiod_2.0-rc2.bb           | 45 ++++++++++++++
 9 files changed, 174 insertions(+), 50 deletions(-)
 rename meta-oe/recipes-support/libgpiod/{files => libgpiod-1.6.4}/run-ptest (100%)
 create mode 100644 meta-oe/recipes-support/libgpiod/libgpiod-2.0-rc2/run-ptest
 create mode 100644 meta-oe/recipes-support/libgpiod/libgpiod-src.inc
 create mode 100644 meta-oe/recipes-support/libgpiod/libgpiod.inc
 create mode 100644 meta-oe/recipes-support/libgpiod/libgpiod_2.0-rc2.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-gpiod/run-ptest
 create mode 100644 meta-python/recipes-devtools/python/python3-gpiod_2.0-rc2.bb

-- 
2.37.2


