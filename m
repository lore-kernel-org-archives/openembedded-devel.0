Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45196E6527D
	for <webhook@archiver.kernel.org>; Sun,  1 Feb 2026 14:26:01 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.30362.1769955952125442260
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 01 Feb 2026 06:25:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZbgqMtF4;
 spf=pass (domain: gmail.com, ip: 209.85.128.51, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4806dffc64cso26423725e9.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 01 Feb 2026 06:25:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769955950; x=1770560750; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=BUOEFGEJGzikmXgFIGm04xpoTq4LbJwgIap/TwjvUhw=;
        b=ZbgqMtF4iPMVYfNGk3PyKom6aRtky0bMbwAjxVjKeLyuSmt3YYE7VZlXy3osHaODEl
         FiPAPIGZLORgHHXUoGfgYKWM0lIzU8mOUL5ccMQgQ5itiiLRjYCE0wJgsH9wCvlPGxmY
         O0H7t02TlxGbRuNWlJzjN+W4RbAB/xyIZvPocBUc/Y5Pu1mg8f+rx0xBCX2O9ZnrrnMi
         FZv+hVdL7D762atgzhyZDhnfNi5GNjYPQk4lGrnVOj6pvvrwmTwKfbRUyBeVn6Jl18i+
         z9hIyBI3C4Qb4vyct/qjVK8lt3G4AkkNr75s5BIQPyy6r9PJ2Pa+/cQhtlkHqjdWUcfT
         GESA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769955950; x=1770560750;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BUOEFGEJGzikmXgFIGm04xpoTq4LbJwgIap/TwjvUhw=;
        b=K1Vxt3syI6/7k/h37tkeTbpg3GtRH4NNxj8LJlD+R74HXfz87ZZzDqTbM5zrrR4+q2
         HEQgs7kv74aqzedFy22StXsxmf+ZL5I+NgWAA1++rZwhbrTtG7WNtV7QhQSPWxYY35Ks
         +4C07v6l7jQO+i1+2tf3LyEmIoQMpvvZszq4uVXgHpQM3TMoSeqT7geWGlizYp9+FyJU
         oFbY5fSFrlFt366yMSghWEw/AaflxgsDa+4eSjzXKTLpdUxSWHUJgP/0k8i9Wij7W15L
         jpF7XhwD+9Am8sV6T9nvcyEAxXRn1qIVa8qkGAkCKfqxKaRXkYlf3qJllFyuX4AGNvs8
         7HfQ==
X-Gm-Message-State: AOJu0Yyjh9vAx4tBpyOkN8EjVofgQwqKC9ki/+tDIqiE6ruP2goUBJwx
	Z8haLH3LPaLMYtuinV+dUEwCC8O2UBgR8mq2EWf0BPlYXqX0yCqeI9paLAm51Q==
X-Gm-Gg: AZuq6aI5PjZff5BtJAjC6RSnQEjz6qkfT61hAK2S6Rb3bj0W4A+tJ8BOwn9/zFl6KUt
	btx6gE+oy+A1wklonNmSnS3YIyQw6xG90voP/Kq5SI9Na+dcVThrfZR59eXh1mDaeWz2ySHFSIR
	ubSK42+7WQVbVwrX6WBf0TbmBKOElVo2Zaeg65v+PEUIKNbAaBwPA+9hxWffTd3KTRNHykzZAkI
	YgqL0s06oHD92v8IzSZRJ7YAfJUtu2Wfi6RO1eovlUTBhPLEEfAjPir1OY40EVRt7Ve0a0Fob6x
	SW/CduZzd/42/LLQPzh2ShHepnHXjvZDAkV3Rhn0Ydg3y0Grk8EB0EuhIYAbu/aAsfu3sltTrgo
	1m7aS+sPNlwlBoNcFkP1goHO7Hk5dTgTGSOmgt/7xSMKxQX17sCB7mLzg8UOtjNR7eAn47l+woF
	h3VVhjqjfH
X-Received: by 2002:a05:600c:1e8a:b0:47e:e7e5:ff32 with SMTP id 5b1f17b1804b1-482db4a7a82mr103144725e9.34.1769955950135;
        Sun, 01 Feb 2026 06:25:50 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48066c37433sm356723755e9.10.2026.02.01.06.25.49
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Feb 2026 06:25:49 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][whinlatter][PATCH 1/2] hdf5: fix shasum, downloadfilename
Date: Sun,  1 Feb 2026 15:25:48 +0100
Message-ID: <20260201142549.771383-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 01 Feb 2026 14:26:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124038

From: Trevor Gamblin <tgamblin@baylibre.com>

Fixes: #1023

Upstream seems to have regenerated the archive, as the checksum no
longer matches the one specified in the recipe:

|WARNING: hdf5-2.0.0-r0 do_fetch: Checksum failure encountered with download of https://support.hdfgroup.org/releases/hdf5/v2_0/v2_0_0/downloads/hdf5-2.0.0.tar.gz - will attempt other sources if available
|WARNING: hdf5-2.0.0-r0 do_fetch: Checksum mismatch for local file /buildcache/downloads/hdf5-2.0.0.tar.gz
|Cleaning and trying again.
|WARNING: hdf5-2.0.0-r0 do_fetch: Renaming /buildcache/downloads/hdf5-2.0.0.tar.gz to /buildcache/downloads/hdf5-2.0.0.tar.gz_bad-checksum_a7a8f43e76e825ea22234bc735d5b184e880d305e33e4c9bb93a3912421c9973
|ERROR: hdf5-2.0.0-r0 do_fetch: Checksum failure fetching https://support.hdfgroup.org/releases/hdf5/v2_0/v2_0_0/downloads/hdf5-2.0.0.tar.gz
|ERROR: hdf5-2.0.0-r0 do_fetch: Bitbake Fetcher Error: ChecksumError('Checksum mismatch!\nFile: \'/buildcache/downloads/hdf5-2.0.0.tar.gz\' has sha256 checksum \'a7a8f43e76e825ea22234bc735d5b184e880d305e33e4c9bb93a3912421c9973\' when \'6e45a4213cb11bb5860)
|ERROR: Logfile of failure stored in: /home/tgamblin/workspace/yocto/openembedded-core/build/tmp/work/x86-64-v3-poky-linux/hdf5/2.0.0/temp/log.do_fetch.2054297

However, the tarballs look identical. Update the hash and be explicit
about downloadfilename to avoid any mirroring issues. A note has been
left that this measure can be removed with a future upgrade.

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
Reviewed-by: Yoann Congal <yoann.congal@smile.fr>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit f0f02434c892769a307edc6728dd667f9c31a1d1)
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-support/hdf5/hdf5_2.0.0.bb | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/hdf5/hdf5_2.0.0.bb b/meta-oe/recipes-support/hdf5/hdf5_2.0.0.bb
index 93fe352b99..350be8dc0e 100644
--- a/meta-oe/recipes-support/hdf5/hdf5_2.0.0.bb
+++ b/meta-oe/recipes-support/hdf5/hdf5_2.0.0.bb
@@ -11,11 +11,13 @@ inherit cmake pkgconfig siteinfo qemu multilib_header multilib_script
 
 DEPENDS += "qemu-native zlib"
 
-SRC_URI = "https://support.hdfgroup.org/releases/hdf5/v2_0/v2_0_0/downloads/${BPN}-${PV}.tar.gz \
+# set downloadfilename to workaround mirroring test issues. When hdf5 is
+# upgraded beyond 2.0.0 this can likely be removed
+SRC_URI = "https://support.hdfgroup.org/releases/hdf5/v2_0/v2_0_0/downloads/${BPN}-${PV}.tar.gz;downloadfilename=${BPN}-${PV}-1.tar.gz \
            file://0002-Remove-suffix-shared-from-shared-library-name.patch \
            file://0001-cmake-remove-build-flags.patch \
            "
-SRC_URI[sha256sum] = "6e45a4213cb11bb5860e1b0a7645688ab55562cc2d55c6ff9bcb0984ed12b22b"
+SRC_URI[sha256sum] = "f4c2edc5668fb846627182708dbe1e16c60c467e63177a75b0b9f12c19d7efed"
 
 FILES:${PN} += "${libdir}/libhdf5.settings ${datadir}/*"
 

