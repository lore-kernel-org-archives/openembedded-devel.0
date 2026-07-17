Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3518C4450F
	for <webhook@archiver.kernel.org>; Fri, 17 Jul 2026 03:34:54 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6170.1784259287679716892
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Jul 2026 20:34:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=tBHPOdnz;
 spf=pass (domain: gmail.com, ip: 209.85.216.51, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-38dfe7eb825so3421256a91.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 16 Jul 2026 20:34:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784259287; x=1784864087; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=uEZ/906wB/ZvWrtoqOT4n9AnwMUGouKgWV3QeuJR7y4=;
        b=tBHPOdnzZY74zFNE28Lr+vpiPUSK6xia6Kqc1bk7DCVe5Vk5vuk8rprJeUHKqnLC0b
         4Yqz71TL5Rt33lAPiSBtZzruWFqbEzZBrGHEYnk1a/7cTywVXfdEYrg7WqgVPT9nLnFV
         BtPffeFq6KfA+gVjDRE9qChUHHXkwOTMH8wOaB40q5ipRC8aMas5R9H4NaD08pn9CCaF
         WE5iAzkEKlfjOBvb3IKrD9IDRrUCCxtpUlcnzdBqObtS9qdEiEfjvr0xwC2yk9dvbFfq
         LOJ3ZomazK4JH8O1jKefEsqA9SAS7uZZBwTQFDV2P9wHvarwF5gnEPdKC1WajnHE2ukx
         06tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784259287; x=1784864087;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uEZ/906wB/ZvWrtoqOT4n9AnwMUGouKgWV3QeuJR7y4=;
        b=CVu9OzC2wL0kLyH3tzAmBJY242sfbCw7jN2L6mXW2IYI8zpsDGfXnhKpgD4ztsdmvh
         saSIXs3XfBB7tnwjn8Ltqui+syODZMDRfElTuw24eQAk62Xs84c6G0jM9Eg8LfetnA+9
         dm6yL6yP48cuDM9dOVHADpB0Fbnckrym0zG2j3+ERtug7ctzAJ9l0Q5+QuhNvy5VbL43
         Ne2MTQUIq+mln0bYm7Yx5qlzeNhxUKzuzfNfBBfPV6WbjkO0aVNQgPgm0sKWX7JnYxRa
         s4iLzPgeRu25ZnoNt2c+JqNZhMgUfPJU+NvsHFD1pfHq+ppL8kfgxDBaO9lA8bOdIzJQ
         olLA==
X-Gm-Message-State: AOJu0YyfaUYKjuVcaOhYNUiXc8XvwnUIMRBiohh7nFLYhwTtXdJjszhp
	zuPJpTpzVnP5RYXrXCJUlInlvfGCgDrRaPj3bwb6lM+Qte5tqu94Qwh+TKoJCg==
X-Gm-Gg: AfdE7cn8I8gHU/HWU3YMith0iwV/VFkKGX3t69uoMqjygRstq6oRLxgmXxjd4vkJejq
	b9XW2TRxQ1lSgvcBySprE7aVNAVUwPn96wC9F5G3j6bVa/G1WAvBtR4iHGIb7eCh2DxciCRIDuE
	A7MlC+ztQwdqcdkLWna6hP0dZ2CL5QQyNNTidl/2E/bMNxETFl76LXMbd4TE4EcngvqojqKUqYw
	kjaKxMfuUnJbC/XMbsxaxG2VI/sTsrUUevGbT+N0D3ZYp+cvSK/NBbs+UZAsH2G8iYEmfr/GTJa
	bk8MSQgpQvLhie4jz/K3EI40MNd9asYkopTwYFGEXKgd7dkAmqZQpt+TD8YZwjVS7KsFQePGmBT
	0mqD+mVdRpkTsii+HFbh7cVZvUVXJbGSdu6xYgz7eJsdg/PW5yvanM7sToefxf/U0Fpu27mmXPl
	xMRL2WitA4h7Qf5EZ1cRjXxnDhmIMHOgBlmaWNcPd3DIAtqP/mvuHBJ191UtOyIZvxukUIyB9Eo
	6SqSaT9j4SEpgkup0cluyRxo+Al63CCW/c9qndF0k/lan7XlR/TjDdS9QiKj6dABYW5ftxW3/5M
	vxpnBnZpVs3nimwzr/U=
X-Received: by 2002:a17:90b:4b85:b0:37d:7bb4:bffb with SMTP id 98e67ed59e1d1-38e4b3d1427mr753769a91.2.1784259286968;
        Thu, 16 Jul 2026 20:34:46 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3142a20b1f3sm1509307eec.26.2026.07.16.20.34.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 20:34:46 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] dbus-broker: package ptest files from nonarch_libdir
Date: Thu, 16 Jul 2026 20:34:42 -0700
Message-ID: <20260717033442.1750599-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 17 Jul 2026 03:34:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128240

From: Khem Raj <raj.khem@gmail.com>

dbus-broker's meson build installs its test and benchmark binaries to a
hardcoded path derived from the prefix:

    conf.set('testdir', get_option('prefix') / 'lib/dbus-broker/tests')

i.e. always ${prefix}/lib/dbus-broker/tests, regardless of ${baselib}.
In OE terms that is ${nonarch_libdir}, not ${libdir}.

The recipe however collects them with ${libdir}, which only matches on
targets where baselib is "lib". On lib64 targets and for multilib
variants (e.g. lib32-dbus-broker) ${libdir} differs from the hardcoded
install path, so the installed tests are not captured by any package and
do_package fails with:

    QA Issue: dbus-broker: Files/directories were installed but not
    shipped in any package:
      /usr/lib/dbus-broker/tests/unit/test-...
      /usr/lib/dbus-broker/tests/dbus/test-...
    [installed-vs-shipped]

Use ${nonarch_libdir} so the FILES glob always matches meson's install
location.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-core/dbus/dbus-broker_37.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-core/dbus/dbus-broker_37.bb b/meta-oe/recipes-core/dbus/dbus-broker_37.bb
index ae9c8f2fcd..8691afb90b 100644
--- a/meta-oe/recipes-core/dbus/dbus-broker_37.bb
+++ b/meta-oe/recipes-core/dbus/dbus-broker_37.bb
@@ -40,7 +40,7 @@ RDEPENDS:${PN} += "dbus-common dbus-tools"
 FILES:${PN} += "${nonarch_libdir}/systemd/catalog"
 FILES:${PN} += "${systemd_system_unitdir}"
 FILES:${PN} += "${systemd_user_unitdir}"
-FILES:${PN}-ptest += "${libdir}/${PN}/tests"
+FILES:${PN}-ptest += "${nonarch_libdir}/${PN}/tests"

 # test-sockopt fails to compile with musl without this flag
 CFLAGS:append:libc-musl = "${@bb.utils.contains('PTEST_ENABLED', '1', ' -Wno-error=incompatible-pointer-types ', '', d)}"

