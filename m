Return-Path: <adam.duskett@amarulasolutions.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D634F9D0C4
	for <webhook@archiver.kernel.org>; Tue, 14 Apr 2026 11:36:51 +0000 (UTC)
Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com [209.85.208.68])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16886.1776166601734301003
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Apr 2026 04:36:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@amarulasolutions.com header.s=google header.b=aGuGhT39;
 spf=pass (domain: amarulasolutions.com, ip: 209.85.208.68, mailfrom: adam.duskett@amarulasolutions.com)
Received: by mail-ed1-f68.google.com with SMTP id 4fb4d7f45d1cf-65a1faf828bso785202a12.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 14 Apr 2026 04:36:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1776166600; x=1776771400; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SJycEVDwL79GaQCHdSdloEhCNkEPm/1OrP7pTm33GwA=;
        b=aGuGhT39Afq8pzPLltr8/FlWYLz2ZRke3JMo+7vk6Bm5WFkWOVGKLdQ7c3a2jLkSQ0
         +wfUSlp6MXPTUkjAReODNlW671yJ3Z36+nRNF7S/mKDOhHDXaEJaf7FxC0w3tWQDhFB5
         LMJK3B14+xYw+T/f/Jr3TT6Ieoax1/uFK9OmI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776166600; x=1776771400;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SJycEVDwL79GaQCHdSdloEhCNkEPm/1OrP7pTm33GwA=;
        b=m3jkUy3VOSlIi+CihcVs8PfgseFjdacfXlFQZXITGYKOIh3oawa23gojVlEtkJigB9
         KIdH5x6s8GP9NJzljTYQfGMHL/UnVcF2ko3fbjfOyvTTuytjLLO2z6Dazu9iEDFZPn7n
         MFXiMhriGN6Z/gD7IiKKixNvjFyx5AcDYmcLIKH8BBTzPRBYQ2oOqbxZ6iyJjYyGngvg
         g12Se/4fQUlq4dYG9NRFuQO9y+f7e+gfP5xXA73wyIQIApOzCM613zzn5bKwKWG+w1BF
         q6xYIGCSsdCh3FTNE+Ts580wtR1LYG/IqybGzxVkHg5t6yChLJCqTIz66rc/2U48VJaK
         +lkQ==
X-Gm-Message-State: AOJu0YxE6n53OUFaNltVZwbzfPUu7uSNbtHS2ux6re5QbuS9DFd2YJfq
	RtwvkRDN8xY9I2xcUBMEfhO8OCb6gyIeWo9OjF8/nNqAzl+MOLVAx4Xd6xZIr5A/5CPAwcwjK/u
	NJbLFJGWT/g==
X-Gm-Gg: AeBDietBDvAhcz0thodRlf+rnIsfVTInfD1eh+UxSQCxPzvl4g0E2j7ZmDGnnEFDMlF
	0KY0XN36PiqKFj8yA6FUECnWaRJ4xKsxC/m/TgyQT16G44OVTrxjBtccUPqI8H3QTwyBDSq7Id3
	29h4AvVhJsORfYESUqjMA7o7nkdYQz71HogsrnJADYHFOFnBTHlndV2PuiXNyGver+ZsDY/DxS+
	HFhnEzGe5NbouMwLRUvUMpbi1vfkFxNwqxL/v+O5N8ViMU/xwGQLGSdG0CVrALnrHCOsDyFNZLl
	Utb27PI+uIsvUV9ArhmyAPtegfZpAmMrAukboOpiBp6b4bPBgXjsodsfYRY/b1iWDy/U24Xu75A
	D7vonxHXYVRKfMqJHXy38i3tahTzB9Z4VUqYx/lhnIr26LnbZc/DyrOygR5FTSWO7oPaxJgkLKh
	XCxM47j7kZfAgv5NQj+oF7J58P1DAi5kDJrTRMVgihSpdM9NbuDHCUvF+M2sOlKoCK9VY1c5/DE
	ebhC4grz51EY63bjRH9VpBuaDu9omW/X1igm3wQWsnxXnIRPCRGyRSJdu+OOJLfcwgQ8w==
X-Received: by 2002:a05:6402:90a:b0:66f:9021:af19 with SMTP id 4fb4d7f45d1cf-6707b201c27mr3653471a12.4.1776166600007;
        Tue, 14 Apr 2026 04:36:40 -0700 (PDT)
Received: from adam.amarulasolutions.com (2001-1c00-8183-9900-dfb4-52e9-0b83-429b.cable.dynamic.v6.ziggo.nl. [2001:1c00:8183:9900:dfb4:52e9:b83:429b])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-670703f11f7sm3177837a12.8.2026.04.14.04.36.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2026 04:36:39 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: openembedded-devel@lists.openembedded.org
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
Subject: [PATCH 1/1] dracut: upgrade 109 -> 110
Date: Tue, 14 Apr 2026 13:36:36 +0200
Message-ID: <20260414113636.3754157-1-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 Apr 2026 11:36:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126337

Drop upstream 0002-fix-broken-symlink-in-dracut-config-examples.patch

Changelog: https://github.com/dracut-ng/dracut-ng/releases/tag/110
Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 ...en-symlink-in-dracut-config-examples.patch | 44 -------------------
 .../dracut/{dracut_109.bb => dracut_110.bb}   |  6 +--
 2 files changed, 2 insertions(+), 48 deletions(-)
 delete mode 100644 meta-initramfs/recipes-devtools/dracut/dracut/0002-fix-broken-symlink-in-dracut-config-examples.patch
 rename meta-initramfs/recipes-devtools/dracut/{dracut_109.bb => dracut_110.bb} (95%)

diff --git a/meta-initramfs/recipes-devtools/dracut/dracut/0002-fix-broken-symlink-in-dracut-config-examples.patch b/meta-initramfs/recipes-devtools/dracut/dracut/0002-fix-broken-symlink-in-dracut-config-examples.patch
deleted file mode 100644
index e2c202a079..0000000000
--- a/meta-initramfs/recipes-devtools/dracut/dracut/0002-fix-broken-symlink-in-dracut-config-examples.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From e01991f1d55d4d1327793790bad3724b89952704 Mon Sep 17 00:00:00 2001
-From: Hongxu Jia <hongxu.jia@windriver.com>
-Date: Thu, 22 May 2025 18:07:27 +0800
-Subject: [PATCH 2/2] fix broken symlink in dracut config examples
-
-Due to commit [1], it installs dracut config examples under /usr.
-But while enable_test=no, the symlink of test in dracut config is broken
-...
-root@qemux86-64:~# ls /usr/lib/dracut/dracut.conf.d/test*  -ahl
-lrwxrwxrwx 1 root root 27 Apr  5  2011 /usr/lib/dracut/dracut.conf.d/test -> ../test/dracut.conf.d/test/
-lrwxrwxrwx 1 root root 36 Apr  5  2011 /usr/lib/dracut/dracut.conf.d/test-makeroot -> ../test/dracut.conf.d/test-makeroot/
-lrwxrwxrwx 1 root root 31 Apr  5  2011 /usr/lib/dracut/dracut.conf.d/test-root -> ../test/dracut.conf.d/test-root
-root@qemux86-64:~# realpath /usr/lib/dracut/dracut.conf.d/test*
-realpath: /usr/lib/dracut/dracut.conf.d/test: No such file or directory
-realpath: /usr/lib/dracut/dracut.conf.d/test-makeroot: No such file or directory
-realpath: /usr/lib/dracut/dracut.conf.d/test-root: No such file or directory
-...
-
-This commit cleans up test symlink if enable_test=no
-
-[1] https://github.com/dracut-ng/dracut-ng/commit/0d369e3e30935dffe48dfff1e90463868e7f804a
-
-Upstream-Status: Submitted [https://github.com/dracut-ng/dracut-ng/pull/1344]
-
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
----
- Makefile | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/Makefile b/Makefile
-index 3a40594b..df7956ab 100644
---- a/Makefile
-+++ b/Makefile
-@@ -218,6 +218,7 @@ ifeq ($(enable_test),yes)
- 	done
- else
- 	rm -rf $(DESTDIR)$(pkglibdir)/modules.d/70test*
-+	rm -rf $(DESTDIR)$(pkglibdir)/dracut.conf.d/test*
- endif
- ifneq ($(enable_documentation),no)
- 	for i in $(man1pages); do install -m 0644 $$i $(DESTDIR)$(mandir)/man1/$${i##*/}; done
--- 
-2.47.3
-
diff --git a/meta-initramfs/recipes-devtools/dracut/dracut_109.bb b/meta-initramfs/recipes-devtools/dracut/dracut_110.bb
similarity index 95%
rename from meta-initramfs/recipes-devtools/dracut/dracut_109.bb
rename to meta-initramfs/recipes-devtools/dracut/dracut_110.bb
index ee6dce4576..d5ca94add8 100644
--- a/meta-initramfs/recipes-devtools/dracut/dracut_109.bb
+++ b/meta-initramfs/recipes-devtools/dracut/dracut_110.bb
@@ -7,10 +7,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 PE = "1"
 
-SRCREV = "13c5e5feee9ba86b960d351f87aa0eb25f242ff0"
-SRC_URI = "git://github.com/dracut-ng/dracut-ng.git;protocol=http;branch=main;tag=${PV} \
-           file://0002-fix-broken-symlink-in-dracut-config-examples.patch \
-           "
+SRCREV = "25bf13842a5c55f4a5ab1523e005b3b11b9ac38e"
+SRC_URI = "git://github.com/dracut-ng/dracut-ng.git;protocol=http;branch=main;tag=${PV}"
 
 DEPENDS += "kmod"
 DEPENDS:append:libc-musl = " fts"
-- 
2.53.0


