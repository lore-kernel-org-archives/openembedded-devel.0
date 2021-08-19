Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web11.67372.1629370980732152540
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 19 Aug 2021 04:03:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Hs39EuoV;
 spf=pass (domain: gmail.com, ip: 209.85.128.51, mailfrom: schnitzeltony@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id u15so3595085wmj.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 19 Aug 2021 04:03:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=VBiPQAuf6+SoTPG865qs/NymHa59u2Bshx4xDExAo2k=;
        b=Hs39EuoVzGD5khJEvfSqwqFw0g0umbZ5FZSNxT2frpWAiaMlQ/WH93vKqEQdkoI6jz
         IktuG0hGod5VAbVEWlskfWzf66VUAVgXRfzGIrO7DO1NvAVpAFZ2VVp3tNWpj4itzzWT
         cXdSl44+mOep2T7vS5p5n8c3LafM8Y7HyagRmrVxbvolmQsdCV5g5Ant0CMDVFtzpBTu
         Jr2/CrXZE80CVUGWSe65INjYxOkzjO84QW6kxznvzmOQco891EjugAKaz++uUm0Crgcq
         sawKtljkn5gdef8WWnS5joo/vPxyWl8lSG3Wv/yjmK5WnOtPNfdeefbca9oNLBeNr11f
         Eq7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=VBiPQAuf6+SoTPG865qs/NymHa59u2Bshx4xDExAo2k=;
        b=LLaMb09TfR6ih38M2fn4NiLfTMVTdmKY/tQBNmWLX5UXSu5wNsIm1RRnJl0hKGVE+y
         Ovb58Qerz4pYuM4q+GVNtht+4PEt/kU4l/QV/6Dn9sJaJrK77mXQWG5n216+Z+Llrecz
         MYYUG0ae4ZC8xx8VcSLDdP8NBtawlurcY0+kTKUBNUtSuFFmMKIuqZiMb1KCAOcPtizb
         Px9G94YRQSPgcjdQNjWgc4NdWi8HAYQxvQB4lNOWzvBoMMtqfU3ZFmz8vKjK5N1kQneb
         mC6imeAPVHJisWOFtZYdnDW/ERRxuBmAAmYo0m64cx3eweFa3QO04caS1q1ZhVCw6+wF
         Ibsg==
X-Gm-Message-State: AOAM530tDZkuO9aXcxETfvbpkIEpUZvoMfk4GplAU7VvsGMqCH9+vuZS
	P30pHgTWhtfGLkiZTAKoivPGb7wCRWkKXw==
X-Google-Smtp-Source: ABdhPJwA1TUQqOaout6IJ8U1usLQPNjN386nmU4p7a+gTX2SlHbwwAlIaigYDF9hfXV79qTsut0muQ==
X-Received: by 2002:a7b:ce86:: with SMTP id q6mr12738751wmj.145.1629370979095;
        Thu, 19 Aug 2021 04:02:59 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from thanks-buchmuellers.speedport.ip (p200300f07f030860fe64da8baf3ac76f.dip0.t-ipconnect.de. [2003:f0:7f03:860:fe64:da8b:af3a:c76f])
        by smtp.gmail.com with ESMTPSA id y13sm2119642wmj.27.2021.08.19.04.02.58
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Aug 2021 04:02:58 -0700 (PDT)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 4/5] networkmanager: upgrade 1.32.4 -> 1.32.8
Date: Thu, 19 Aug 2021 13:02:47 +0200
Message-Id: <20210819110248.3505349-4-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210819110248.3505349-1-schnitzeltony@gmail.com>
References: <20210819110248.3505349-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

===============================================
NetworkManager-1.32.8
Overview of changes since NetworkManager-1.32.6
===============================================

* firewalld: configure zones on "Reloaded" signal.
* core: fix wrong MTU for bridge interfaces.
* cloud-setup: fix gateway address for Aliyun cloud.

===============================================
NetworkManager-1.32.6
Overview of changes since NetworkManager-1.32.4
===============================================

* core: fix adding stale local routes when address changes.
* initrd: tag generated profiles with origin in user data.
* core: introduce "allowed-connections" option to disallow
  profiles on a device. This allows to filter out profiles
  that originate from initrd.
* core: introduce "keep-configuration" device option to forcefully
  activate a profile on start.
* dhcp: handle filename/bootfile_name DHCP option and write it to
  device state file for initrd/kickstart.
* initrd: add "ib.pkey=" command line option

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../{networkmanager_1.32.4.bb => networkmanager_1.32.8.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-connectivity/networkmanager/{networkmanager_1.32.4.bb => networkmanager_1.32.8.bb} (98%)

diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.32.4.bb b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.32.8.bb
similarity index 98%
rename from meta-networking/recipes-connectivity/networkmanager/networkmanager_1.32.4.bb
rename to meta-networking/recipes-connectivity/networkmanager/networkmanager_1.32.8.bb
index 167d81022..39225b904 100644
--- a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.32.4.bb
+++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.32.8.bb
@@ -27,7 +27,7 @@ SRC_URI = " \
     file://0002-Do-not-create-settings-settings-property-documentati.patch \
     file://0003-install-firewalld-to-var-libdir-rather-than-hardcod-.patch \
 "
-SRC_URI[sha256sum] = "29acbd41c78b7ef87ff88fec5360d1eaf8b5b6fcb90555d7391abc5e36923158"
+SRC_URI[sha256sum] = "e7e42ad05ad7b9054fbe227930f40213f2e9d7af64dd2542e60318a0b1a76c75"
 
 S = "${WORKDIR}/NetworkManager-${PV}"
 
-- 
2.31.1

