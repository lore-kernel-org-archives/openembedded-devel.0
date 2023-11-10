Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D95EC4332F
	for <webhook@archiver.kernel.org>; Fri, 10 Nov 2023 10:52:14 +0000 (UTC)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
 by mx.groups.io with SMTP id smtpd.web11.24993.1699613533684415366
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 10 Nov 2023 02:52:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=d5GdCoVd;
 spf=pass (domain: konsulko.com, ip: 209.85.208.41, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-53de0d1dc46so3239693a12.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 10 Nov 2023 02:52:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1699613532; x=1700218332; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6Nx20u3WweogzP4SM4w1FEU/TVT4lI7clrjTfWTXINk=;
        b=d5GdCoVd9APWTEg2VyknX1wNy5mAZzQGQy0GScGdzYczG0dghGN4dcaJnI877Mb+OZ
         n7+PzGUsISmgg8IEcFPY8ewtVJbX2CdUJs9gKCyPK14v9LZMPbSdpU+smD0iVSEKicdY
         ANUhFTxN8onCtDT45WBe+bnDoYa5KYYrDUVjM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699613532; x=1700218332;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6Nx20u3WweogzP4SM4w1FEU/TVT4lI7clrjTfWTXINk=;
        b=XBmDHkk0f3Sk0JYlUmuYKYn5ffNs7ufRNpxz0Po/xm0N8vU7oUI0FQEi/45WELlNfl
         1b1s9XbzLU9C5FeazgQTvpOeJ9I2pVAfzDkh8rTeFV7Zg0TgfuT1Ng0KRLZKWOUHn0xI
         oBFr7wkNKUQBqGnuoe+bNeVhGQuR8cLN4iOUNRaAm9qubQFZsVbjsAcMi3Ginc9YI9Pb
         SQy6ycu4Qye1ykyCXETwhJyc1qnsmsTxT3OXno8Jo3b93BYzbymi/12ZKYKSsG/GU4ne
         QhBcRwK5QLXfl2qsMp3NtIFeQ52hepSIQLt7k/s+iEKzA3Utbu7GuEusdr3eW7obq7Ad
         zvVw==
X-Gm-Message-State: AOJu0Yw8I0zKXhh0wH/T5EHR+6iqjVoioyNlIA6LnFuJFyYQDHGn3mKm
	IALIjJid2AwZvJoQNq8IuRrepuPIylTFOc7Qxps=
X-Google-Smtp-Source: AGHT+IG6QJy8EAYoRIx5IrFVtkosA9QO52AqiRejI7IbDjYK39/zM/sKIKQmz1DfUnjfDjJnfb+/vg==
X-Received: by 2002:a17:906:c10c:b0:9bd:bbc1:1c5f with SMTP id do12-20020a170906c10c00b009bdbbc11c5fmr6667263ejc.35.1699613531703;
        Fri, 10 Nov 2023 02:52:11 -0800 (PST)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id fb6-20020a1709073a0600b009e5e1710ae7sm958037ejc.191.2023.11.10.02.52.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Nov 2023 02:52:11 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-filesystems][PATCH] bindfs: add recipe
Date: Fri, 10 Nov 2023 12:52:09 +0200
Message-Id: <20231110105209.2897911-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 10 Nov 2023 10:52:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106536

Add bindfs, a FUSE filesystem for mounting a directory to another
location, similarly to mount --bind. The permissions inside the
mountpoint can be altered using various rules. Version 1.17.5:

- Support negative --{uid,gid}-offset
- Support mount -t bindfs on Mac OS

This work was sponsored by GOVCERT.LU.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../recipes-utils/binfs/bindfs_1.17.5.bb          | 15 +++++++++++++++
 1 file changed, 15 insertions(+)
 create mode 100644 meta-filesystems/recipes-utils/binfs/bindfs_1.17.5.bb

diff --git a/meta-filesystems/recipes-utils/binfs/bindfs_1.17.5.bb b/meta-filesystems/recipes-utils/binfs/bindfs_1.17.5.bb
new file mode 100644
index 000000000..c701e223e
--- /dev/null
+++ b/meta-filesystems/recipes-utils/binfs/bindfs_1.17.5.bb
@@ -0,0 +1,15 @@
+SUMMARY = "A FUSE filesystem for mounting a directory to another location"
+DESCRIPTION = "bindfs is a FUSE filesystem for mounting a directory to another location, similarly to mount --bind."
+HOMEPAGE = "https://bindfs.org/"
+LICENSE = "GPL-2.0-only"
+LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
+
+DEPENDS = "fuse"
+RDEPENDS:${PN} = "fuse"
+
+SRC_URI = "git://github.com/mpartel/bindfs;protocol=https;branch=master"
+SRCREV = "3f57fa69448ad68f31cf62cf75b5a9b2e5096c05"
+
+S = "${WORKDIR}/git"
+
+inherit autotools pkgconfig gettext
-- 
2.39.2


