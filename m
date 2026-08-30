Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0673C61DE1
	for <webhook@archiver.kernel.org>; Sun, 30 Aug 2026 00:50:30 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1026.1788051026266759089
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 29 Aug 2026 17:50:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Hts8hluN;
 spf=pass (domain: gmail.com, ip: 209.85.216.42, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-382ef647e20so2261467a91.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 29 Aug 2026 17:50:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788051026; x=1788655826; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yvbC1T5DGiO9+8HqXjz3KuH9Npm7K/JgCVz8oVwRidQ=;
        b=Hts8hluNkvKmoC+h03mbXsEyH1JrTgCAGYiOTIgKt+I404sgwut01D1cLAsljPKgzr
         v2RtFNv5mpDRUUTruPUQhA1oO8eMjEiMywn6xtyfdFuze7p0DgUXGTcs60WCBM59C68o
         XtCZmKpFI2v2J1C+QnqWiNJtUNce1VhD2K2fIfaqdzn0J7ao7EyFtF0/9JAdx85xhIi9
         c1ns+LkMycPAOBpcaJgHoYIZN72ioXuzVipExiZ6MCI3sTPBV/8HyCiyFpiTd/Um2Btz
         ENGPqUnsZtBLc4X+xzoA6TL59S9Fsok8QN9sgs6b3GPnzfOEqwwcCIRKn3S6Y4z/Uww5
         engw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788051026; x=1788655826;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yvbC1T5DGiO9+8HqXjz3KuH9Npm7K/JgCVz8oVwRidQ=;
        b=EReEx7DY2LHaSrqzXMy0BYAlcUKoAIVnbohUX25Us8d4SU9I1pWd1x/BoQbahNkFHk
         nqaNwEKebch5PTgUTX1kmQ/wdD6oYSL23nsEcamGVGxbVDewNJcLMwGwVsESlMdkfKLF
         enkzfROWHnCMJIG4woa0qIO/eU8ADfz7YxysUofIOqIl1ymUXv0DAs/593zP3QKkfxo5
         em2acAyks1Zpvx60iTpaa58m3dWG0ixcDK51bxxnv5cPGlgjhhwxrf8BO00X4kdW/t7s
         +ZYAcebYKkmctZSJ3Fgs23ygAQ9+5/8mC6LY4CHC3wdOwc/3xgKk6gp+jO6jnZKG556P
         bFag==
X-Gm-Message-State: AFuF++n/zl7yV4ZhMzmPvJihGVDzVXKROfv1b3gbS4WmfV+jW/vBuXbx
	dDiKgTUg7EHGHTSx42foBSbpYjgT6qQJDDgF5M+HllK0q6qCUZ0DlkJI1UW++WSg
X-Gm-Gg: AYBFou1qAWbTmT4UC85nckguQJVzW304Qt0zBGungxmkPeGI6g6w503BBPmd+3pOc5Q
	SXz5Eo8Brrzv2CIaqK1ONrWcGBdAXt02bHTpNPd7kYZfXNlWBJ1jJaZbKt0h82rOB4ChAtQ5kzu
	fds/uWWvxIUC1JY+0uuz21hDDljuLNhYuAQjfk2+4+Cm4ZdWhIJEc1oDb5w1nzhQq5Idcr56+0w
	ef3wxFPx8l9S7BshdE6yRUrBb17zkxS+tHOtq3RANMuqOCeAk6FIV7CZsxQDWRR9tswUGalK98P
	fu9uTOwSMHjWzp1wpPYh5+okhWHrxvNepk0sO+bkPgfWVG0HqVh/JcFBTog059xAh2UYeUfhc5t
	fZ/Jyl7F+1tBrjm+jwywAr2cCHWH8jF084tbHjD4yN43exQZSMgBhh669S5GSO/Sj3wSZRXKegA
	D9eDpMJ7lmjN8nB9P41sg5dpidmFC0mnaH1rSPKHE1Nr1klqpghHu5j/UpmNcKpTp5zKq9hnTr
X-Received: by 2002:a17:90a:da87:b0:36a:5d1f:7b6 with SMTP id 98e67ed59e1d1-396d0d4c42fmr30126622a91.2.1788051025605;
        Sat, 29 Aug 2026 17:50:25 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-396b0ea808csm13561826a91.2.2026.08.29.17.50.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Aug 2026 17:50:25 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-multimedia][PATCH 2/11] mpd: upgrade 0.24.14 -> 0.24.15
Date: Sun, 30 Aug 2026 12:50:06 +1200
Message-ID: <20260830005015.2555347-2-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260830005015.2555347-1-ankur.tyagi85@gmail.com>
References: <20260830005015.2555347-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 30 Aug 2026 00:50:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129583

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://github.com/MusicPlayerDaemon/MPD/blob/v0.24.15/NEWS

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../musicpd/{mpd_0.24.14.bb => mpd_0.24.15.bb}                  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-multimedia/recipes-multimedia/musicpd/{mpd_0.24.14.bb => mpd_0.24.15.bb} (98%)

diff --git a/meta-multimedia/recipes-multimedia/musicpd/mpd_0.24.14.bb b/meta-multimedia/recipes-multimedia/musicpd/mpd_0.24.15.bb
similarity index 98%
rename from meta-multimedia/recipes-multimedia/musicpd/mpd_0.24.14.bb
rename to meta-multimedia/recipes-multimedia/musicpd/mpd_0.24.15.bb
index 2c8c840423..2b1ae309c8 100644
--- a/meta-multimedia/recipes-multimedia/musicpd/mpd_0.24.14.bb
+++ b/meta-multimedia/recipes-multimedia/musicpd/mpd_0.24.15.bb
@@ -21,7 +21,7 @@ DEPENDS += " \
 SRC_URI = "git://github.com/MusicPlayerDaemon/MPD;branch=master;protocol=https;tag=v${PV} \
            file://mpd.conf.in \
            "
-SRCREV = "62b5bc313b9f20ffc66efa500235ecb620e2ea08"
+SRCREV = "b1c87eb85e9b211369e42433526b55469bf1b6c9"
 
 
 EXTRA_OEMESON += "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '-Dsystemd=enabled -Dsystemd_system_unit_dir=${systemd_system_unitdir} -Dsystemd_user_unit_dir=${systemd_user_unitdir}', '-Dsystemd=disabled', d)} \

