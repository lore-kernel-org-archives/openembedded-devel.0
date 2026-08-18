Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B09B8C5DF74
	for <webhook@archiver.kernel.org>; Tue, 18 Aug 2026 05:01:48 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2320.1787029301105537554
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 17 Aug 2026 22:01:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Yk5msLkZ;
 spf=pass (domain: gmail.com, ip: 209.85.216.54, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3810c5d691bso3029003a91.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 17 Aug 2026 22:01:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787029300; x=1787634100; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xxtcFP3ATgAYlVVKk2FuqzgjDsE/DGf5zRKkN63OrAg=;
        b=Yk5msLkZwPyrG0w1qaDfj6/4nu5chQrWxUXPKQIjQtzlKbd9r9oUkojNjO3ztPz2Io
         vANvyv7jACmNlWeXxXdLeyp3YYBfLHMknEa2Di4q7PkQ/VUWZDeWjHERm2Gz6W26K3S0
         0HO/zpp56ueGWvHBAu4uOK01MiQiIelGLFNTyl58gSHw0Wdbh3EfPzJVnFoZM29+0QFY
         yXdSC5sHcZZmoN2L1g0BbGmnzyTP4rOfOCDuHBCJo0UKVSGwGKU/9Z8BQyyXq8p3li1V
         OqchlZgsEo5stWL7zlfEh7J7T7isAVR/aI8/KMnjkMAXPgkoUCLMb/sq18+GLfkVFhRS
         tMnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787029300; x=1787634100;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xxtcFP3ATgAYlVVKk2FuqzgjDsE/DGf5zRKkN63OrAg=;
        b=AK5uKY7fM3czvo6bxqH1TgpYQdkoocg0stNBcNkS3VSGfHMC5oag3fL1aGV/k76eGL
         zhnlqef6AoOEvBtk6n09VAWkLQkolKiRg6KMFR/XvXvArR/kOamF9E8dMjfrmCs6ywSW
         k50FvQpMjb1xzcUo3V1IU2A/I2Yx7X6cQZuUjcJHl1sOxXBW5/+Ap/ZDdmwTc2PbRM+j
         k7QYG9OTjxHx6AW4NPFrG8btV75iAgg+Dx1//CQ3Ry9pHY5iA1rPluVzwD3ffGpLkqF0
         voEZmcCr99rXecr2yPkJ03wea/gHWl0IYj4xSYM6yKub1qcwfxSqVZTaOh6Hi5IHAAnf
         ixSQ==
X-Gm-Message-State: AOJu0Yx0x+lAMsNFb5dF4hobK5yMkeHKLaFSH4IHOJ66JyCaJWGR94aI
	l933z+XPVuqzKiHa/UywxF7PUdtgVG5b1ZECH9vUp4eqqhKUmVYAelOmwW6u7y5I
X-Gm-Gg: AR+sD127orz1zSCLw1c5c1B8MGzoncTuztMX8SLFh7FVnC1Mzi/aUUOZStQVNUKKKNp
	vG/yS1o+tx1E8wM7VmwDo6VePLKuWV2cM7yULyIdSJAzbhVLlwdi7LhTKKAuXP1G760R3JdxSZ6
	DnF3wp5Da7kyZc3eFSOw3+kzm0yuWBBaQeiuL3QnNfoFdAt0aP+ZVeDqMXh1hhoLLEpKPag3pmU
	2GsMl67b+eqLevLL7XlpV+YaInvz2B4vrneGaU28xtiV1oJmEZ1Qaeup1+CPv1Uegz/GawS7p2A
	ROB8pxgKn/vuhC60az2HcgYGGuLQjdG+2vRmle4QUZUzZO0RtyWfGr6ABEQuXlsU1uGUs9NjJfK
	bECWSTqN6apoRM5DZ7pe9PMCfckd7il7M1yLQWeR9zXmgqE2AStuIE2qzr09O6O2vzkBPstP/lZ
	fv+29r5XHn5IZ7j2JTOHDWn6IByygD12qoptaL0OAcFA3c79S/1DEeQgF9ajN0gG3lnCsLrY4wC
	A==
X-Received: by 2002:a17:90b:388d:b0:395:4de5:1054 with SMTP id 98e67ed59e1d1-3955a7ebd62mr5776709a91.16.1787029300373;
        Mon, 17 Aug 2026 22:01:40 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3267be8e5c8sm12840095eec.16.2026.08.17.22.01.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 22:01:39 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-gnome][PATCH 2/27] gnome-control-center: upgrade 49.7 -> 49.9
Date: Tue, 18 Aug 2026 17:00:57 +1200
Message-ID: <20260818050123.2901739-2-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260818050123.2901739-1-ankur.tyagi85@gmail.com>
References: <20260818050123.2901739-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 18 Aug 2026 05:01:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129201

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Also add UPSTREAM_CHECK variables to check for new releases.
Fixes:
$ devtool latest-version gnome-control-center
...
INFO: Current version: 49.7
INFO: Latest version: 49.2.2

Release Notes:
https://gitlab.gnome.org/GNOME/gnome-control-center/-/blob/49.9/NEWS?ref_type=tags

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 ...e-control-center_49.7.bb => gnome-control-center_49.9.bb} | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/gnome-control-center/{gnome-control-center_49.7.bb => gnome-control-center_49.9.bb} (90%)

diff --git a/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_49.7.bb b/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_49.9.bb
similarity index 90%
rename from meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_49.7.bb
rename to meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_49.9.bb
index 137d82e92c..e2e7fed24c 100644
--- a/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_49.7.bb
+++ b/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_49.9.bb
@@ -40,10 +40,13 @@ inherit gtk-icon-cache pkgconfig gnomebase gsettings gettext gi-docgen upstream-
 REQUIRED_DISTRO_FEATURES += "opengl polkit pulseaudio systemd"
 
 SRC_URI = "https://download.gnome.org/sources/gnome-control-center/${@oe.utils.trim_version('${PV}', 1)}/gnome-control-center-${PV}.tar.xz"
-SRC_URI[sha256sum] = "e4a1524af73c25f0ebc5badcf5d5bea79024d801850bb051baf25feff320ed00"
+SRC_URI[sha256sum] = "b7987aa4d6899584bbc9ff9a698d1adc1b557bcec09168ebebb624585f3cdf77"
 
 SRC_URI += "file://0001-Add-meson-option-to-pass-sysroot.patch"
 
+UPSTREAM_CHECK_URI = "https://gitlab.gnome.org/GNOME/gnome-control-center/-/tags"
+UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)"
+
 PACKAGECONFIG ??= "ibus ${@bb.utils.filter('DISTRO_FEATURES', 'x11', d)}"
 PACKAGECONFIG[cups] = ",,cups,cups system-config-printer cups-pk-helper"
 PACKAGECONFIG[ibus] = "-Dibus=true, -Dibus=false, ibus"

