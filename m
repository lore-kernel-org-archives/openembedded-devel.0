Received: from mail-ej1-f67.google.com (mail-ej1-f67.google.com [209.85.218.67])
 by mx.groups.io with SMTP id smtpd.web12.7171.1593383757827721841
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 28 Jun 2020 15:35:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=s2blu7Ht;
 spf=pass (domain: gmail.com, ip: 209.85.218.67, mailfrom: schnitzeltony@gmail.com)
Received: by mail-ej1-f67.google.com with SMTP id a1so14689200ejg.12
        for <openembedded-devel@lists.openembedded.org>; Sun, 28 Jun 2020 15:35:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=+KzGvDJnOHZkKBSdupXAecemovfrlYzJ2Nzm7QThd5I=;
        b=s2blu7HtOvVJZYPMxiExXGIvF9LyAPVeC2wLTrHDkrNNApqTap+C3N9kc+NxAqmfMI
         XMpw2RAtkjwSdJP6AgHXqMouYwGXJPqa3OSqUWQZLIegRIiRvLHog7VDqfuOEeToDdZG
         qRFZtF4aRWFfuvdCBSZmtaO+ZXCrspliRdOmBVrTYt3MFjUbs49vykV49UMHwi68VtvM
         /KPXKy/I81mf8VjYd42BSKxPwrZtfEBHqBDSDY877tKE2Lne046CRkWlKKjWGAoyIJ9s
         Z/U2WSzZe5FD4zcxMEs4aWjsHCQo3PhyM+xwhwfv2J2+WLFLuBOPvpvRq3/I23zk8uM5
         d1jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+KzGvDJnOHZkKBSdupXAecemovfrlYzJ2Nzm7QThd5I=;
        b=NLjQaMp+fFU6CIMTm49099p/6n+xdXfAfn2pvswOgQTd7SYCcxU45Fc/zIBH7L+ma4
         3Kz1zbCftvTGGNRec2JlBXuInrUvV/PwUweYwkhyWJIsx2db+greP2NcZ7dYhxlruVN4
         mr9qxB5w+Q35iYOgVTTYIHzt/cGQaPMtt2kxs9v60tzsIpBX6S9do0QJem8qvjIF0sac
         gaUyzMKntTchUb39m7mErtGRAke1IYalbnYY0iP272DeM05Mq+dReDBqEI/jm9yaND+c
         FeoHreMEq4A46pJx9Kt9GtU9FaPMMYS/EsmPo2m48LtKTktGVlWvCuDymaNp0/pJuRiB
         T7Uw==
X-Gm-Message-State: AOAM532i3/pEHPlbsZy9xEgV8AMBFDpUyPtpLJuv8QeVEgfLF8lebm2p
	JUtUEc9D1XfiOIvH4BoHJZwnqPCE
X-Google-Smtp-Source: ABdhPJyk7uvMS9Rh46UxGiGbk7ONByVqqgLl/z2MHrdCllejyuLT9UazJaGWOc1io9jBL1VyjsKwtQ==
X-Received: by 2002:a17:906:fc20:: with SMTP id ov32mr10912868ejb.531.1593383755910;
        Sun, 28 Jun 2020 15:35:55 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300f07f4b8e33cbb401a015e6742d.dip0.t-ipconnect.de. [2003:f0:7f4b:8e33:cbb4:1a0:15e6:742d])
        by smtp.gmail.com with ESMTPSA id q25sm7602169ejz.97.2020.06.28.15.35.55
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2020 15:35:55 -0700 (PDT)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 2/5] blueman: upgrade 2.1.1 -> 2.1.3
Date: Mon, 29 Jun 2020 00:35:42 +0200
Message-Id: <20200628223545.3853840-2-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200628223545.3853840-1-schnitzeltony@gmail.com>
References: <20200628223545.3853840-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

2.1.3
Changes
  * Force cython to use python language version 3
Bugs fixed
  * Fix tooltip not updating when bluetooth is disabled
  * Fix dbus timeout in DhcClient
  * Call the right method when pulseaudio crashes
  * Handle os.remove failing

2.1.2
Bugs fixed
  * Signal bar updates with multiple adapters
  * Pairing with pincode

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../blueman/{blueman_2.1.1.bb => blueman_2.1.3.bb}             | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-networking/recipes-connectivity/blueman/{blueman_2.1.1.bb => blueman_2.1.3.bb} (94%)

diff --git a/meta-networking/recipes-connectivity/blueman/blueman_2.1.1.bb b/meta-networking/recipes-connectivity/blueman/blueman_2.1.3.bb
similarity index 94%
rename from meta-networking/recipes-connectivity/blueman/blueman_2.1.1.bb
rename to meta-networking/recipes-connectivity/blueman/blueman_2.1.3.bb
index 0ea7f6de9..9143a67ae 100644
--- a/meta-networking/recipes-connectivity/blueman/blueman_2.1.1.bb
+++ b/meta-networking/recipes-connectivity/blueman/blueman_2.1.3.bb
@@ -11,8 +11,7 @@ SRC_URI = " \
     file://0001-Search-for-cython3.patch \
     file://0002-fix-fail-to-enable-bluetooth.patch \
 "
-SRC_URI[md5sum] = "9de89abb31be45bdbf11f7884764a2dc"
-SRC_URI[sha256sum] = "f1eab2334e5a1587defa80900901048d14c2e8ffa8c0cff7240bc9937a61dbc3"
+SRC_URI[sha256sum] = "3bd02e0cc9e2c1424df1fc2015da710a280ef4c657515727e47eafabf8c2cfde"
 
 EXTRA_OECONF = " \
     --disable-appindicator \
-- 
2.26.2

