Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B566C9833E
	for <webhook@archiver.kernel.org>; Sun, 27 Sep 2026 10:50:33 +0000 (UTC)
Received: from mail-pz2-f15.google.com (mail-pz2-f15.google.com [74.125.228.15])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.35332.1790506230663995662
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 27 Sep 2026 03:50:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=OBYYGBB0;
 spf=pass (domain: gmail.com, ip: 74.125.228.15, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pz2-f15.google.com with SMTP id d2e1a72fcca58-88379342f7fso50678b3a.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 27 Sep 2026 03:50:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790506230; x=1791111030; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XNgRgL8UVgcD0EF1xhlyheWOEiwc8S6e7BBinUMqTIg=;
        b=OBYYGBB0/DOhitXWogPPPweMy0p9RnpVQIgjieLXLNXi2iF5TH7Y6XZ61HaESbSRPN
         NXNINU93A38g4H1ZuzK9wv4L64Don3EJ3mOp6/LzURgSszXoRtSaBiKuyg/XzsxLxqPo
         M2dkdmUXZe0iNkuJhGaN5D2BCNp+whnfGBHylGj5ZsCj49NQJ/LovjFRxufLzdmE5JnB
         sYcZtTMTJRllbxMqEXVQW3SH7u12k4qdR5iJlx+GkM8yJA2oVYOfjxzJofYXolXQcsdw
         KRoNRaJ1NDh483QnyBQKt02lwgRCvWj3WySjcKTc204zJAn2NWatcdaApTSTZ0Zdwi2U
         h19g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790506230; x=1791111030;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XNgRgL8UVgcD0EF1xhlyheWOEiwc8S6e7BBinUMqTIg=;
        b=QaQ6GbnklbrORW7Ht3StKIBbHLsC1sRbWF8MsTwHlSItc/vmaiEfUxq1TxXXuC5d7T
         LA1VNg1SqwNKXmA9u8ZZBL0wyjnzRE17h+gdWhpYCRlB55IdJ1nUgsfJITSinESZOStH
         ys0bTBg2LBpo8sKLRMfumXjHALnFVZa9iUa6aqmZO9SyCq52VQKR1lNHfl3x19oJCGJJ
         T+Mn9ArVZQJKoS/Xub5QywccOXZfUg/I9Nif7PWUIHcwdDDPo1T4KIOyUNkbqMmcuj0J
         jki2sVGqDgnOXNG87QhhmGhI7Mp+JBGdCpwUI24gJ9aSBCVjnUpl0+/ed4VwzcgwMGas
         r/pw==
X-Gm-Message-State: AFuF++l5FUD4t8vmunz0Yprp+0LXt4aeArfAeRaEnVYRxX///1HFjlHe
	IXeI3tS2feJuss63KxiEh1xpop0HZjklfbtGQHIZ42pXFDYYXQLRsulUIbB88Q==
X-Gm-Gg: AYBFou1lfQ+KsJ2Dgb+8MazCq/Xv4w2fYROycVwIyygmzhH331B30dEyrbWxKb6L/bI
	Hm1jgElDkAgDHfECT7ylEufBs4UAzR2IGqsatQSorXdOPOnebev9V/cF1n8SIX8Ky6TpBh7uBgD
	wwogEVsGAhARzQJHiiB3J9NyA7wSbsnxPa587Uk+Gr7UYNnB48Hbwim9lRL0A/heVhLcsgmG0uH
	R/aGW2t19KUovHdbQuOr2H5YU4ayR/oMoJO66hNHy+IB/oR/xGvJkB1r9ebZjgtnQdc1HMrAwXS
	hjJbzn21lG8AIgYdiwIEjFtWzFDvMnEL1aePSrP/EAQhhyr4Lst0xnkOjoK5kQWK1cGrxD/Vdi3
	5/piaOnRgdVNvrVRB3Nrx9oLUZuP5uf1qJxu/QHjFAsXDZxNuCykLvK9zE6yRBO1CKhJJZsZrUb
	0Mr11qia/L9LSQeuQNVYZ4OoZpAhEjIWsHyMvl9DVeje84jhZg6YmVK0oGJvLrAD9xcNoy+WjVu
	Lj9mzQC0FLky0vRdiL1S0XJuQ==
X-Received: by 2002:a05:6a20:3951:b0:3dd:a006:ed95 with SMTP id adf61e73a8af0-3de0e8b0e49mr9360995637.43.1790506230003;
        Sun, 27 Sep 2026 03:50:30 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-88268c5ed75sm640542b3a.48.2026.09.27.03.50.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 03:50:29 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][PATCH 8/35] tailscale: upgrade 1.102.3 -> 1.102.4
Date: Sun, 27 Sep 2026 23:49:35 +1300
Message-ID: <20260927105002.1832451-8-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260927105002.1832451-1-ankur.tyagi85@gmail.com>
References: <20260927105002.1832451-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 27 Sep 2026 10:50:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130342

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://tailscale.com/changelog#2026-09-10

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../tailscale/{tailscale_1.102.3.bb => tailscale_1.102.4.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-connectivity/tailscale/{tailscale_1.102.3.bb => tailscale_1.102.4.bb} (97%)

diff --git a/meta-networking/recipes-connectivity/tailscale/tailscale_1.102.3.bb b/meta-networking/recipes-connectivity/tailscale/tailscale_1.102.4.bb
similarity index 97%
rename from meta-networking/recipes-connectivity/tailscale/tailscale_1.102.3.bb
rename to meta-networking/recipes-connectivity/tailscale/tailscale_1.102.4.bb
index a8b47a8ed2..13cb519985 100644
--- a/meta-networking/recipes-connectivity/tailscale/tailscale_1.102.3.bb
+++ b/meta-networking/recipes-connectivity/tailscale/tailscale_1.102.4.bb
@@ -8,11 +8,11 @@ LIC_FILES_CHKSUM = "file://src/${GO_IMPORT}/LICENSE;md5=cadeae10a8856ddfdb129866
 require ${BPN}-licenses.inc
 
 MAJOR_MINOR = "${@oe.utils.trim_version('${PV}', 2)}"
-SRC_URI = "git://github.com/tailscale/tailscale.git;protocol=https;branch=release-branch/${MAJOR_MINOR};destsuffix=${GO_SRCURI_DESTSUFFIX} \
+SRC_URI = "git://github.com/tailscale/tailscale.git;protocol=https;branch=release-branch/${MAJOR_MINOR};destsuffix=${GO_SRCURI_DESTSUFFIX};tag=v${PV} \
            file://default \
            file://tailscaled.init \
            "
-SRCREV = "53a0d659afa51835dd7a9283873cca44261454f8"
+SRCREV = "bbcd7d1fc2054b9189ebc1531acf74bd880ca0c8"
 SRCREV_SHORT = "${@d.getVar('SRCREV')[:8]}"
 require ${BPN}-go-mods.inc
 

