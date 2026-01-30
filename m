Return-Path: <tim.orling@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53517D73E85
	for <webhook@archiver.kernel.org>; Fri, 30 Jan 2026 01:07:56 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.506.1769735269087932539
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 29 Jan 2026 17:07:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=poUHqGrs;
 spf=pass (domain: konsulko.com, ip: 209.85.210.177, mailfrom: tim.orling@konsulko.com)
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-81e821c3d4eso1383715b3a.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 29 Jan 2026 17:07:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1769735268; x=1770340068; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=BZNyNweD804mUWBBZlhq7C5LZs7N5JxwE4wD1LFbJb8=;
        b=poUHqGrsYEKXeXOZfSf6m8LhwEEGBvxlQGjOmmHQAzo/+60N46nxj4nXtKS5RmW0a8
         JYvvjK1gwNBkLqHFkUpK/1vqLbRqwC1/JKP3CGbs2PmPH17FdtXu1TZvXkVh1RwXVbSU
         ifb+RPoYhso66TcDQzfx6eqbFoie59RP0XojE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769735268; x=1770340068;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BZNyNweD804mUWBBZlhq7C5LZs7N5JxwE4wD1LFbJb8=;
        b=VBHJGocRDDgXhLMpiBJkFmVbG7HDfpJvMs+3kE3d7Jm1cUGEeKoll8o26FaUqyErsF
         eEExSvuUgQqTfmOaCzM01nyaXUxDwhMvwbx56reuEes4dglRV3b30DtthfZhaR2N/XHF
         fI+WpxEFCjzO+ObIKb2BlYldk8P94Xyc86RZNuQfYEzjS1Y/b2+FQ2A/ozSY41o4GsW9
         eFsY+eVFfAoqtyM88KV96w74HQJvE9lvR3Pt4dWX/K+kkGHfATEaEwNXOeKL72VZ70+q
         WnVRllBl8lw7DrKP3wYnFyNFkYwGJ9g601GeNw8acgAHnlceyrqiOe3MMnayoTM8OopE
         KMzA==
X-Gm-Message-State: AOJu0Yz5k6NWGPBB+cS292/pyhL0pugZdtobAsDfl/aeYSV3hJIxICIh
	HP1zFmRd6wDxiiq9LUp+DHcU3figDw2gTp1mhcMaar3RigOScN912KXV8ZqkEu3aOQCKjIaTc4r
	9RzrJ
X-Gm-Gg: AZuq6aJNVuc65ag1kdF8sBKTyUxk7vpecgUoMl5sDMmsabxPW5BojMXdK7htwe1xpLu
	y5GSnaySVfr2GxZKmIVjeF1VQoy42I1q+Lh0YtNZjXYqpTWgR/xWQjVFTKYfFuGnj5rsnBp15+e
	DtTbxEjUh3MGUj7h6nxKV3cRy5WNBDtJgwyRUsCzRZtUmxIJJSkSZMcwaNFatAk/Zm61vf4bIgx
	VY4xi659W4mAWpqh0vTPg1P9Hzb2srPUvA1Y7KIbJFR53IIc1xARMTQvUvBU6snoTv0nDFRh8zb
	lswKWv/6uw8xLWjhNCxbSfD8mI6yGjKUNzrrwlZ5fE5F0BiGVue0xEoxLHk8jSbemjTIi+hqpdn
	YVTcLE/tURSatyYQvuEnxN3UlVENjQmAkDULY1wt0Doe667YarrzaT8P0W6TqaUn2Xd9lodffrD
	cwoMuyNZyGfDrd7DFeJIgge3qmz7/aPg8Pf1l499cbHCG21Kp4Uw==
X-Received: by 2002:a05:6a21:398a:b0:38b:e944:3e94 with SMTP id adf61e73a8af0-392e0115348mr946904637.39.1769735267961;
        Thu, 29 Jan 2026 17:07:47 -0800 (PST)
Received: from localhost (c-98-232-159-17.hsd1.or.comcast.net. [98.232.159.17])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c642a336a1csm6268105a12.19.2026.01.29.17.07.47
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jan 2026 17:07:47 -0800 (PST)
From: tim.orling@konsulko.com
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 0/3] Upgrade python3-orjson and enable ptest
Date: Thu, 29 Jan 2026 17:07:34 -0800
Message-ID: <cover.1769715106.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 30 Jan 2026 01:07:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123993

From: Tim Orling <tim.orling@konsulko.com>

This series upgrades python3-orjson to 3.11.6 and patches it to support
building on non-x86* architectures like riscv64 and arm64.

7 of the ptests are skipped because of missing python3-pendulum, but it does
not yet support python 3.14.x

Tested on qemux86-64, qemuriscv64 and qemuarm64.

The following changes since commit 7bbe4a4e200452b1fd6c09c7fcf36c4b229146f6:

  php: upgrade 8.5.1 -> 8.5.2 (2026-01-20 14:35:59 -0800)

are available in the Git repository at:

  https://git.openembedded.org/meta-openembedded-contrib timo/python3-orjson-3.11.6
  https://git.openembedded.org/meta-openembedded-contrib/log/?h=timo/python3-orjson-3.11.6

for you to fetch changes up to ecd3b46d0c63b03fc434ee3763292acab1463941:

  python3-orjson: use git fetcher; enable ptest (2026-01-29 11:26:47 -0800)

----------------------------------------------------------------

Tim Orling (3):
  python3-orjson: upgrade 3.10.17 -> 3.11.6
  python3-faker: add v40.1.2
  python3-orjson: use git fetcher; enable ptest

 .../ptest-packagelists-meta-python.inc        |    2 +
 .../python/python3-faker_40.1.2.bb            |   45 +
 .../python/python3-orjson-crates.inc          | 2243 ++++++++++++++++-
 ...rd-avx512-module-with-x86-target-cfg.patch |   37 +
 ...e-detection-macro-in-pystrref-object.patch |   34 +
 .../python/python3-orjson_3.10.17.bb          |   22 -
 .../python/python3-orjson_3.11.6.bb           |   45 +
 7 files changed, 2357 insertions(+), 71 deletions(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-faker_40.1.2.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-orjson/0001-Guard-avx512-module-with-x86-target-cfg.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-orjson/0002-Guard-x86-feature-detection-macro-in-pystrref-object.patch
 delete mode 100644 meta-python/recipes-devtools/python/python3-orjson_3.10.17.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-orjson_3.11.6.bb

-- 
2.43.0


