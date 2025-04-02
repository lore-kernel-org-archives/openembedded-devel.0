Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28AD9C28B20
	for <webhook@archiver.kernel.org>; Wed,  2 Apr 2025 16:19:42 +0000 (UTC)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
 by mx.groups.io with SMTP id smtpd.web11.13281.1743610777320656275
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 02 Apr 2025 09:19:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZGSADJwV;
 spf=pass (domain: gmail.com, ip: 209.85.218.47, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-ac28e66c0e1so1025607366b.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 02 Apr 2025 09:19:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743610776; x=1744215576; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IxQrSRsLWOfWeiSgHEMaoRDIXfdEYF91ouBu/8jM1ys=;
        b=ZGSADJwVZTfC0Ogp/GYEFowruGu7f+QKfGwri/R1IcSELwyzYbbR5FrSJFXaOo3Qvy
         1bIfKCvlUzIqNgt1PGAtwiESXwkvhfq4lNHAe4nM0Vag5iNLdbURcopFEQA9nSjvgeKb
         kiXlYEFNeJuuKFds0dU4Dd73LyS/rozTlsJTUwu4BQa7Z1x7jmbvFeT5ZPhPjP3K5eTk
         hV12w0Siqr5PTQQXRei4czsPSQNvuHncfyQj7oTsmlU9pSdU/9P+45jH+UipcfK7PjWV
         bt8bdLs09jUPcZ7K731X4XEnRGqlR2Z/Qe+EtV2TPzIwNfaJY5JJSUejZV9mBaLC7y+8
         sj4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743610776; x=1744215576;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IxQrSRsLWOfWeiSgHEMaoRDIXfdEYF91ouBu/8jM1ys=;
        b=P2fFLBz66eOUPi7XAq+/7C/EpYG/nS73bqHz+HB35dzCbT17Q8Dyw0uYp3I7wCpNU2
         Mt6hJeu6IJJSp1EXXNf5qw0HAqr7NOtjzE2H7LINi8W8BrH31qOHw9UaGZNBQgeYgjAp
         Z5XIfa9ZcGIbnjpbPlyruphwrQmYyuq67HfPKZ1y1BjHl0FGxmSKpXBx8zaV2xeAZXFs
         1W1nOYWMy3ZdoiJQW+h1rlzOC512BikORypB65n4s7CxBU8f2s3N6CKwlHibdZdn3LSE
         +M4PLsbP1qKQho05dZVHzuXRRWdSuIzY0AH4x+5KB+6rdpjVZD0YvsgxtxSdzjL+Y+UN
         +v+A==
X-Gm-Message-State: AOJu0Yz/kSYcWCgmIEbCYvV3rFK0vdjvlZ4I96wI6cC0xygunHh1Sn4c
	PUw/i2NXeWWDq2cyv/tBPXfFRvHIj9EKLCFE5/A/dP/FdxyabZaBVIDk4ND1
X-Gm-Gg: ASbGncsOWcwecc3Gi1/yMSlGfUNSfvbt1fa3sYWr/TxXO+2EB0Keif+aiP1pq34/c+B
	SrvV8Sv85J8oGkMm8zRWdQjIj06XKOSnh1rFyx7rdofz+8/0yfb0Tp+sSU/IvNokO6GEL2MT3R+
	aMB9tNJnJjEyvbI1SqiH9hBg3JLOqLTdDQBKADJDl/GGuN/2bZ6uFFuQxR7HmNFMsJ5jz3tmepk
	MGbd8JIrL2SKsIVdRfIDORAyZnC1LFiwOvyWnC2amMThkzeGsgQmUjjvFxzvhEfWLpmA04tGFud
	OeZDC+53SqSS9JaelBXRghAj6QQnmq2TvgoYW7yjHpFlB6m6skp6F+BLpA==
X-Google-Smtp-Source: AGHT+IGcyiZkQMBKW3MzqvEQLv+CITZVqzM4KiSQnjGUJs+p1jRa7RVoHKWIpGYUkS1scdMVGZzqxg==
X-Received: by 2002:a17:907:1c95:b0:ac7:b48f:4cd6 with SMTP id a640c23a62f3a-ac7b48f4cecmr38339866b.24.1743610775008;
        Wed, 02 Apr 2025 09:19:35 -0700 (PDT)
Received: from localhost ([109.238.218.228])
        by smtp.gmail.com with UTF8SMTPSA id 4fb4d7f45d1cf-5edc17b2abesm8656342a12.60.2025.04.02.09.19.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 09:19:34 -0700 (PDT)
From: martin.jansa@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: [meta-filesystems][PATCH] gpiod-sysfs-proxy, smbnetfs, zfs: add whitespace around assignments
Date: Wed,  2 Apr 2025 18:19:28 +0200
Message-ID: <20250402161928.3620627-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 02 Apr 2025 16:19:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116527

From: Martin Jansa <martin.jansa@gmail.com>

With:
https://lists.openembedded.org/g/bitbake-devel/message/17508
there are WARNINGs like:

WARNING: meta-oe/meta-filesystems/recipes-filesystems/smbnetfs/smbnetfs_git.bb: meta-oe/meta-filesystems/recipes-filesystems/smbnetfs/smbnetfs_git.bb:9 has a lack of whitespace around the assignment: 'HOMEPAGE ="http://sourceforge.net/projects/smbnetfs"'
WARNING: meta-oe/meta-filesystems/recipes-filesystems/zfs/zfs_2.2.5.bb: meta-oe/meta-filesystems/recipes-filesystems/zfs/zfs_2.2.5.bb:5 has a lack of whitespace around the assignment: 'HOMEPAGE ="https://github.com/openzfs/zfs"'
WARNING: meta-oe/meta-filesystems/dynamic-layers/meta-python/recipes-support/gpiod-sysfs-proxy/gpiod-sysfs-proxy_0.1.2.bb: meta-oe/meta-filesystems/dynamic-layers/meta-python/recipes-support/gpiod-sysfs-proxy/gpiod-sysfs-proxy_0.1.2.bb:27 has a lack of whitespace around the assignment: 'export MOUNTPOINT="${@bb.utils.contains('PACKAGECONFIG', 'sys-class-mount', '/sys/class/gpio', '/run/gpio', d)}"'

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 .../gpiod-sysfs-proxy/gpiod-sysfs-proxy_0.1.2.bb                | 2 +-
 meta-filesystems/recipes-filesystems/smbnetfs/smbnetfs_git.bb   | 2 +-
 meta-filesystems/recipes-filesystems/zfs/zfs_2.2.5.bb           | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-filesystems/dynamic-layers/meta-python/recipes-support/gpiod-sysfs-proxy/gpiod-sysfs-proxy_0.1.2.bb b/meta-filesystems/dynamic-layers/meta-python/recipes-support/gpiod-sysfs-proxy/gpiod-sysfs-proxy_0.1.2.bb
index 07208d1b77..3e68a52b09 100644
--- a/meta-filesystems/dynamic-layers/meta-python/recipes-support/gpiod-sysfs-proxy/gpiod-sysfs-proxy_0.1.2.bb
+++ b/meta-filesystems/dynamic-layers/meta-python/recipes-support/gpiod-sysfs-proxy/gpiod-sysfs-proxy_0.1.2.bb
@@ -24,7 +24,7 @@ SRC_URI[sha256sum] = "4bdd4b8a7042f63a40507ae0f16b360011e67cbb2f0276289636487a54
 # non-standard behavior so make sure the user actually wants it.
 PACKAGECONFIG[sys-class-mount] = ""
 
-export MOUNTPOINT="${@bb.utils.contains('PACKAGECONFIG', 'sys-class-mount', '/sys/class/gpio', '/run/gpio', d)}"
+export MOUNTPOINT = "${@bb.utils.contains('PACKAGECONFIG', 'sys-class-mount', '/sys/class/gpio', '/run/gpio', d)}"
 
 do_install:append() {
     if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}; then
diff --git a/meta-filesystems/recipes-filesystems/smbnetfs/smbnetfs_git.bb b/meta-filesystems/recipes-filesystems/smbnetfs/smbnetfs_git.bb
index 2d9eab1dd5..1f8357db00 100644
--- a/meta-filesystems/recipes-filesystems/smbnetfs/smbnetfs_git.bb
+++ b/meta-filesystems/recipes-filesystems/smbnetfs/smbnetfs_git.bb
@@ -6,7 +6,7 @@ DESCRIPTION = "SMBNetFS is a Linux/FreeBSD filesystem that allow you to use \
 
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=eb723b61539feef013de476e68b5c50a"
-HOMEPAGE ="http://sourceforge.net/projects/smbnetfs"
+HOMEPAGE = "http://sourceforge.net/projects/smbnetfs"
 
 DEPENDS = "fuse samba"
 DEPENDS:append:libc-musl = " libexecinfo"
diff --git a/meta-filesystems/recipes-filesystems/zfs/zfs_2.2.5.bb b/meta-filesystems/recipes-filesystems/zfs/zfs_2.2.5.bb
index b24774311d..6fa9104236 100644
--- a/meta-filesystems/recipes-filesystems/zfs/zfs_2.2.5.bb
+++ b/meta-filesystems/recipes-filesystems/zfs/zfs_2.2.5.bb
@@ -2,7 +2,7 @@ SUMMARY = "OpenZFS on Linux and FreeBSD"
 DESCRIPTION = "OpenZFS on Linux and FreeBSD"
 LICENSE = "CDDL-1.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=7087caaf1dc8a2856585619f4a787faa"
-HOMEPAGE ="https://github.com/openzfs/zfs"
+HOMEPAGE = "https://github.com/openzfs/zfs"
 
 SRCREV = "33174af15112ed5c53299da2d28e763b0163f428"
 SRC_URI = "git://github.com/openzfs/zfs;protocol=https;branch=zfs-2.2-release \

