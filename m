Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BEE1ACAC5A5
	for <webhook@archiver.kernel.org>; Wed, 24 Sep 2025 12:28:47 +0000 (UTC)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
 by mx.groups.io with SMTP id smtpd.web11.11192.1758716922800683362
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Sep 2025 05:28:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hm+EJp80;
 spf=pass (domain: gmail.com, ip: 209.85.208.53, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-62f4a8dfadcso8184758a12.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 24 Sep 2025 05:28:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758716921; x=1759321721; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ei1r098+0rYgnMez3mUNch8qiN0KASBWxhwNztkb0q0=;
        b=hm+EJp80A+j2bpoMe4WcIGOB3A/AEjpUqF6w1gSMx+aMslEK+M5SOVU7m0xROY3glq
         6BS5gg1ki5hEZbIkzLQ6Hjs8qUDPsd5zitCgyUxJ6g2BAquisXv1AJ3gNCwowRS7p59/
         7lhyP0aA/5+p4/RCHUJKolSdSlZmYbbmeT9j6bTjfmBp1aR/UvKRyWm90E4AXPAtlYYf
         C0TqPjgHaiBzqb06HFEXzbpVLahMg0eGF2G5WV7PRuA1kRC8sWHIZ7fL9jXCVeNqi/4V
         dl87z4uDy2cOGFIeE7nDZVzIsSyZRQDu9gT0kPocwSwerQCZ3Ilt0FVLGv3MT0U0t9tw
         TOYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758716921; x=1759321721;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ei1r098+0rYgnMez3mUNch8qiN0KASBWxhwNztkb0q0=;
        b=bSRQIE1RrMWyQZxrI2go3svhd8MV4eEjzx6dyhTpj3yeWyXIrTgKxS9DItrKsu7Lt2
         hoRnVUbVZRpnDtrMbbhM9UlolbvnlMSbj5zrN7G8US82cTYzeTEle6OOLeDhvuFvXGAp
         M00rEPguFNEeErQdFq7SxE5B7/SA0v/brcEjgkL/NbQxMgiq8sXRanIxqPnx2URzqskk
         QNg/vMcxQYUdc5MXiQL+6WjX56lbXz7E/tjH1gXp5Q8Jm3mlVFZxYKITG6qhoLww1hYf
         QAvCA5kZt8XN62kgh9pRz5N2HDtfZJLXF5ZwQIk++u4RKHmOtl1NssVHL/VUKTnI2ehi
         G2fg==
X-Gm-Message-State: AOJu0YwEaIxj06LgQd/4icwFWWY4WxdK2ysHBJ/z+3wwd/KIzMdSW2x1
	/uHZoV93BBuRZtT8JBx+qG+XC/1UBxKjKwSFFzp6Dxss08y8ZciNNSOHLfkyxg==
X-Gm-Gg: ASbGncsKirotaq+MnzAacrrxyZ/aNH9j10YAqO4r6IBeS+LK/ZB/WS3Rkd9jT9DYprb
	WQARYU4uJAKq+uCxD3kxxq0msS9tL3dyIVCNf0yQX3gZmbp/PV4OgBrRe1/2XPKqYQRpJQRUE41
	HUaVnmFQqyrwE9dSyVOP1uhIol5ygWQUlaf1yzSSbb/kUaFP9UUIs4R9fqoS7m9lP3xOEh32PEa
	u/huo8iA9+l5eSreY+1CG1xj6ZIOB4aMswHDGrLEjqVG+Pqf/3R2xoHpywGZ6gpn+qyrqUTfxVx
	Vt1G0aoU2kArNqtaS+Yx+0pxoGsNsXTFK9/ZTuoKd/0vqFjGJXAon+5WR5L+16CCZSucsv6Aj3Z
	c34ystDUjtq3DX4nb7+nQ
X-Google-Smtp-Source: AGHT+IEd21URPGs7rwaC9xvnHQRywYrP1wnqcJBsYLfj/FdeIx6iMgDzM5JK55nleaw0DO02tGMHJg==
X-Received: by 2002:a05:6402:34c4:b0:62f:521f:c174 with SMTP id 4fb4d7f45d1cf-63466e7839bmr5253327a12.0.1758716920758;
        Wed, 24 Sep 2025 05:28:40 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-63469f30772sm3024835a12.22.2025.09.24.05.28.39
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 05:28:39 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 00/20] Cherry-picks from Master Batch B
Date: Wed, 24 Sep 2025 14:28:18 +0200
Message-ID: <20250924122839.4184719-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 24 Sep 2025 12:28:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119803

This is my second batch of cherry picks from master branch, that I deem to be useful and 
appropriate to be in Kirkstone branch.

These include assorted recipe fixes (REQUIRED_DISTRO_FEATURES, DEPENDS...), and recipe 
version updates. With recipe updates I have spent effort to ensure that they 
contain only bugfixes - I did go through all the change logs and/or the commit logs,
and I did skip commits that introduced some backwards incompatible changes.

This batch has so far survived a "bitbake world" build for arm, aarch64, x86 and x86-64.

Even though I tried to be careful with my cherry picks, your review and comments 
would be much appreciated.

Thank you.

---

Alex Stewart (2):
  gvfs: stylize DEPENDS
  gvfs: obviate the ssh-client requirement for gvfs

Markus Volk (2):
  gvfs: fix polkit homedir
  gvfs: fix dependencies

Mingli Yu (4):
  gnome-calculator: add opengl to REQUIRED_DISTRO_FEATURES
  gnome-calendar: add opengl to REQUIRED_DISTRO_FEATURES
  gnome-font-viewer: add opengl to REQUIRED_DISTRO_FEATURES
  nautilus: add opengl to REQUIRED_DISTRO_FEATURES

Wang Mingyu (4):
  gedit: upgrade 42.0 -> 42.1
  gvfs: upgrade 1.50.2 -> 1.50.3
  gvfs: upgrade 1.50.3 -> 1.50.4
  tracker: upgrade 3.3.2 -> 3.3.3

wangmy (5):
  gedit: upgrade 42.1 -> 42.2
  gnome-calculator: upgrade 42.0 -> 42.2
  gnome-commander: upgrade 1.14.2 -> 1.14.3
  gnome-text-editor: upgrade 42.1 -> 42.2
  gvfs: upgrade 1.50.0 -> 1.50.2

zhengrq.fnst (2):
  gnome-text-editor: upgrade 42.0 -> 42.1
  yelp: upgrade 42.1 -> 42.2

zhengrq.fnst@fujitsu.com (1):
  yelp-tools: upgrade 42.0 -> 42.1

 .../gedit/{gedit_42.0.bb => gedit_42.2.bb}    |  2 +-
 ...lator_42.0.bb => gnome-calculator_42.2.bb} |  4 ++--
 .../gnome-calendar/gnome-calendar_42.0.bb     |  2 +-
 ...er_1.14.2.bb => gnome-commander_1.14.3.bb} |  2 +-
 .../gnome-font-viewer_42.0.bb                 |  2 +-
 ...itor_42.0.bb => gnome-text-editor_42.2.bb} |  2 +-
 .../gvfs/{gvfs_1.50.0.bb => gvfs_1.50.4.bb}   | 22 +++++++++++++------
 .../recipes-gnome/nautilus/nautilus_42.1.1.bb |  2 +-
 .../{tracker_3.3.2.bb => tracker_3.3.3.bb}    |  2 +-
 ...{yelp-tools_42.0.bb => yelp-tools_42.1.bb} |  2 +-
 .../yelp/{yelp_42.1.bb => yelp_42.2.bb}       |  2 +-
 11 files changed, 26 insertions(+), 18 deletions(-)
 rename meta-gnome/recipes-gnome/gedit/{gedit_42.0.bb => gedit_42.2.bb} (91%)
 rename meta-gnome/recipes-gnome/gnome-calculator/{gnome-calculator_42.0.bb => gnome-calculator_42.2.bb} (83%)
 rename meta-gnome/recipes-gnome/gnome-commander/{gnome-commander_1.14.2.bb => gnome-commander_1.14.3.bb} (87%)
 rename meta-gnome/recipes-gnome/gnome-text-editor/{gnome-text-editor_42.0.bb => gnome-text-editor_42.2.bb} (84%)
 rename meta-gnome/recipes-gnome/gvfs/{gvfs_1.50.0.bb => gvfs_1.50.4.bb} (87%)
 rename meta-gnome/recipes-gnome/tracker/{tracker_3.3.2.bb => tracker_3.3.3.bb} (93%)
 rename meta-gnome/recipes-gnome/yelp/{yelp-tools_42.0.bb => yelp-tools_42.1.bb} (83%)
 rename meta-gnome/recipes-gnome/yelp/{yelp_42.1.bb => yelp_42.2.bb} (88%)


