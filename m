Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1225AD3567C
	for <webhook@archiver.kernel.org>; Wed, 28 Jan 2026 05:51:30 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6993.1769579481694884469
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Jan 2026 21:51:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LtTdWFSf;
 spf=pass (domain: gmail.com, ip: 209.85.221.51, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-42fbc305882so3911390f8f.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 27 Jan 2026 21:51:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769579480; x=1770184280; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ISDolPB0NAUXlDcxh5cOluzjGFuI1A55tDNBfPWGYcI=;
        b=LtTdWFSfxmBsMpbSYF8x2f5a2iATW2LB2mp2GH4RD5eza+tka0KtsVm6ehj9vrTQwV
         7k7XuZQmPrQML3wuEJ+0wSEhP9VHQ2Wd648wlwFOtPyciWU1yZyi3vfotpCnIAWZ9bwN
         lyVl5/+45nAjpkpb/Zu/ia+rzL6Lo/txlplv1Qt9tSh3ohcj5LJkQI48plvbYlPZSDGo
         99cfuCAnAt37MtH+ywOcxskUiJwqxzgJoWIqQbkDTgFI/asZPZsYOGQw5AqNWtvPPAlx
         lEcl4Otgc+00qz1kj1D01n8vK8BGHuHqi9stsGD9rc15XhuYn50rxwnf06fnAsHP6teb
         NXeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769579480; x=1770184280;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ISDolPB0NAUXlDcxh5cOluzjGFuI1A55tDNBfPWGYcI=;
        b=lmU33VMqes4YJobK0jFXlG1MawKcpAsaAL6MqbNHTbmkidFWEdoG1GbA89YK9FA5rF
         oKRCMFL6SDVhQtaTLzCXn8l77/DsaCPwmt+kbAisyCH5qKXG0t+F3kCtV7xU2ejM8vk5
         HSY6db+xBgThQeFNtogXxUezH4EpbYll5TwwChO2QaXtPRK7pTOgdr/sOaGzh2CcRfuZ
         6Ng77oqcYd6iFGN00F6cvuLofTtfihQHf9C9ylxyhIXchiIv2ZCXY7AlBBtlqc4MEiba
         mAqLALtYFz9cXZxKSfGZrYF5AyH+rRlqDkyFEl9hXtM/UTQtpsJ8Efo+61MD4dtfDrwr
         8fuw==
X-Gm-Message-State: AOJu0YxUvXCSy8NIZWgGVmWDliDZkODKBD3Z7L5K4oSfajdt7Sz5GxZv
	M3JgpMO99lb8Ia9oI1+d1z3uARhpQrKRk9YmiRR6WX42/yHcVrh4/Iopyt1jtA==
X-Gm-Gg: AZuq6aIVVZ2FRIsgt6bSwsEbZYtpHEKwT9Ki08kW7e1OHQ/oRSbnTYGoTcoyF+7dMsw
	7yrclNYdIs8LLDjV4XOcQLwVzm6jh8B3P28IUmxoDRwBM9EqbPIlDc5kGJ6vW8B214HlYoZl5vl
	pkqoGnLnh1OjalANs91VMoxYPDdWJLtJq8QK1iY6+z7f15YhZkcFmGfMTC9eUYyS06DJauQenVq
	STkvOUj2fh7SaT8eCdbiE0Sp/3Vhs9mD/b4O2JB1mJ3uZBTC1a8GgGR0++LdBk9un3QvgaRfY9v
	F5ZL5NlnIfBj0Ms2nJ3zEeMLKxy1NSsaOJKGdU7ih8hhUEHDEAEEEYuWTWe981kFXafuoPAOMlo
	AgcsKcLe1I7AC4sMLcr9Qk9pMrYul7/pgdLZJvUW6HJzIno5RYzsDmlAeBPf1miRU+9jZyIcIh6
	MlOM9mCG2P
X-Received: by 2002:a05:6000:26c7:b0:435:b068:d3da with SMTP id ffacd0b85a97d-435dd02d68emr5246845f8f.4.1769579480023;
        Tue, 27 Jan 2026 21:51:20 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e10f82aesm4371777f8f.19.2026.01.27.21.51.19
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 21:51:19 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][kirkstone][PATCH 2/5] nautilus: upgrade 42.1.1 -> 42.6
Date: Wed, 28 Jan 2026 06:51:15 +0100
Message-ID: <20260128055118.2011068-2-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260128055118.2011068-1-skandigraun@gmail.com>
References: <20260128055118.2011068-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 28 Jan 2026 05:51:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123965

Bugfix releases. Note that there were no 42.3 and 42.4 releases.

42.6:
* Fix crash when pasting invalid clipboard data. CVE-2022-37290

42.5:
* Really fix the cropped compress format popover on X11
* Fix behavior inconsistencies with new tabs
* Fix memory leaks and missing signal disconnections
* Translation updates

42.2:
* Close broken link message dialog on response
* Fix crash when opening new window from pathbar
* Fix remote filesystem check
* Translation updates

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../nautilus/{nautilus_42.1.1.bb => nautilus_42.6.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/nautilus/{nautilus_42.1.1.bb => nautilus_42.6.bb} (92%)

diff --git a/meta-gnome/recipes-gnome/nautilus/nautilus_42.1.1.bb b/meta-gnome/recipes-gnome/nautilus/nautilus_42.6.bb
similarity index 92%
rename from meta-gnome/recipes-gnome/nautilus/nautilus_42.1.1.bb
rename to meta-gnome/recipes-gnome/nautilus/nautilus_42.6.bb
index a36ccec472..dcfcd77380 100644
--- a/meta-gnome/recipes-gnome/nautilus/nautilus_42.1.1.bb
+++ b/meta-gnome/recipes-gnome/nautilus/nautilus_42.6.bb
@@ -21,7 +21,7 @@ inherit gnomebase gsettings gobject-introspection gtk-doc gettext features_check
 def gnome_verdir(v):
     return oe.utils.trim_version(v, 1)
 
-SRC_URI[archive.sha256sum] = "8519d4565e842aa3d31d0fe39b21d48ac54edc0f0658fe1d8ea2da4e704c1b66"
+SRC_URI[archive.sha256sum] = "9c771c09265538f24488d3034f7b69605f5c828104ebe0ad1963d1681bce69b6"
 
 REQUIRED_DISTRO_FEATURES = "x11 opengl"
 

