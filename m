Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48FFECAC5B2
	for <webhook@archiver.kernel.org>; Tue, 23 Sep 2025 11:06:41 +0000 (UTC)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
 by mx.groups.io with SMTP id smtpd.web11.14114.1758625599901256629
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 23 Sep 2025 04:06:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KiTRRvA+;
 spf=pass (domain: gmail.com, ip: 209.85.218.43, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-b2e66a2fb63so265905866b.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 23 Sep 2025 04:06:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758625598; x=1759230398; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fxh3xIFhXGzbdqf57mDi7R6ZO4OC4C8oklEjCIHjp7w=;
        b=KiTRRvA+bz9y5Ww6CM+naz9uNpdC6Bl0c4TWWlV/NBnLruP/Nepjlc5+6ePuR4fJul
         Gof5x+fqQt73yNPKkd8kecC/yQ0xtrQjXvDRm7YVLajOI/nFvmYBT4VFulqAkDUXMDzE
         gKBcHm7mmD48UN3TlLedlC+7rDcJz/HjssVsW0Z+vdVEROvQWPDapoQoEabH1xyZ+qYU
         eRoXqCFUfSv6Y1Ah+TPRcjoK11t5HGr383isQP8t9iS7wvCTgW60eybXPSeb8ADg4u53
         2xwv3EtA1dp8eJVrDdFaumdMYzsMCNARC35sq1XGF828u0O/3q4kDecgtKynHA1iQVks
         LiaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758625598; x=1759230398;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fxh3xIFhXGzbdqf57mDi7R6ZO4OC4C8oklEjCIHjp7w=;
        b=PkqJcFhp7GbRcYWv3A/XkKbE2DzByYe5lag/s9W04/v1tfa540Z+4EOBoQa4geM/6A
         NkLNVcvuv6UYFP72zsDup8KcxP4aW4xZcYICvMUJpIVMk5ElxLrctA8Q2461K3q/UHL4
         ZHcacoh6E88BUnqcSts7RYcKHENPcB8bsM0yjp2EAZkGNY18mGCb8ZxTNymvBZN13CY+
         qoRw/tGGdd2xsASXurZmZVc7PyOiMXnivyJ2iahOOwgKsEHVEvujXmc3U9cP4zRWvaCU
         lUUg0pB3pE1zSJwFW3p/0WvNxRCrIbIf+AwXlNmqYG+kQNijRAX9rNL9pla6mvpGQMe2
         AtfA==
X-Gm-Message-State: AOJu0Yymi2qQlSTYb+Yb2UIM5HuOUckcY8ZyA5V/+89Ycci2xaPykl3t
	iuMl6t+aes1ksrru1+52aCEk93Q7L1jBw26FuT75CRhmh9V1osMh8Vdp3VmcpA==
X-Gm-Gg: ASbGnctsNi3yZ8vBXDiAEKAVy0nNaN+ZUzxgksKDuTbzhduLVk4AmGN8WDu0XvUKUi5
	O9XYB4srdFuV849+9G8dIPi6zr0hV4iPQMWWC34EqIyAc0qkpoHa5y91hJrgdF2rOIIxtJvTqGQ
	QipBh3XsmXtDhXAEWzIhP3dShiPQIgxkxlcz+n28qAfUaR6jaU8gdiv+N6m2qAbBay8fTiqgSIb
	Z0nVJUMI3+LgW+h9adDufr2CKYoDmY+REtRxbkO+BVraUZCPmwnwB5LY1nZT4UFo/qVfOg+bpHt
	zk4vx9k3fuw2//3OAovIUw6rGZK8tWS1xWZruPWIeVX6c5Uu1oK2Gx4dfBIv7HB8/MHsCF2PruO
	h8/m+sjNOmlD7YvzzeQ0h
X-Google-Smtp-Source: AGHT+IEKtewpxM3zPSgMBgmYzyzQuA6u2W4oiTWnxR4u71BDeB+xihNVzgZPDmG1WIv9XptcIe+K9A==
X-Received: by 2002:a17:907:8691:b0:b04:39af:bee9 with SMTP id a640c23a62f3a-b3020f1f007mr201304066b.0.1758625598171;
        Tue, 23 Sep 2025 04:06:38 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b293fa07816sm709263166b.50.2025.09.23.04.06.37
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Sep 2025 04:06:37 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 01/22] sshfs-fuse: upgrade 3.7.2 -> 3.7.3
Date: Tue, 23 Sep 2025 13:06:15 +0200
Message-ID: <20250923110636.3413021-2-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250923110636.3413021-1-skandigraun@gmail.com>
References: <20250923110636.3413021-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 23 Sep 2025 11:06:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119665

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit f50cffbd022d119ced5e750e75566e7eeda5f07f)
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../sshfs-fuse/{sshfs-fuse_3.7.2.bb => sshfs-fuse_3.7.3.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-filesystems/recipes-filesystems/sshfs-fuse/{sshfs-fuse_3.7.2.bb => sshfs-fuse_3.7.3.bb} (93%)

diff --git a/meta-filesystems/recipes-filesystems/sshfs-fuse/sshfs-fuse_3.7.2.bb b/meta-filesystems/recipes-filesystems/sshfs-fuse/sshfs-fuse_3.7.3.bb
similarity index 93%
rename from meta-filesystems/recipes-filesystems/sshfs-fuse/sshfs-fuse_3.7.2.bb
rename to meta-filesystems/recipes-filesystems/sshfs-fuse/sshfs-fuse_3.7.3.bb
index b839c26e9f..f91e682d24 100644
--- a/meta-filesystems/recipes-filesystems/sshfs-fuse/sshfs-fuse_3.7.2.bb
+++ b/meta-filesystems/recipes-filesystems/sshfs-fuse/sshfs-fuse_3.7.3.bb
@@ -7,7 +7,7 @@ DEPENDS = "glib-2.0 fuse3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 SRC_URI = "git://github.com/libfuse/sshfs;branch=master;protocol=https"
-SRCREV = "9700b353700589dcc462205c638bcb40219a49c2"
+SRCREV = "c91eb9a9a992f1a36c49a8e6f1146e45b5e1c8e7"
 S = "${WORKDIR}/git"
 
 inherit meson pkgconfig ptest

