Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14640.1793092836489581390
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Oct 2026 02:20:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=fgUQpdnb;
 spf=pass (domain: konsulko.com, ip: 209.85.128.45, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a35d5d4a20so27257345e9.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 27 Oct 2026 02:20:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1793092835; x=1793697635; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aIhsU+NKVPwC70NhSk6fL5bPx175tiRwWYf8kzrcJ5k=;
        b=fgUQpdnb6/QEPssx/I1Ga57DHxglVeULe+TTSiZglaP4n3/sQdwuXGiXZP6cFEfBSO
         Or4/BqCkcsjpHhawpwc+e3XPSNfn69+NtD3dPe8B4Y1ztYqEBzFXxBH7fN33yiBfkbcZ
         +AruldTJjrFOEB4dEfS3G/IJQAFAO1+maYmp8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793092835; x=1793697635;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aIhsU+NKVPwC70NhSk6fL5bPx175tiRwWYf8kzrcJ5k=;
        b=QvpDugJRBtGy8UxshEvPE0fbE4wI+LucX8AsC2s7vKl6TRCgG2HY7oCEw5j/4CDJLX
         3NXLr2R/CCrp+rzhG7U4gH7pvM2G6TqmYj31nO9WgiCcOLZLIIhQIfHsnsublCMTwyjM
         UWWiv1GSnJpgx84gmiiKtK+dUI7aMIEoLBCAiCrX2WBEtIDV/DbLgAdZs/Es6uBf/jvl
         N/Jy7QLJzXjDVLO9aduoz+r1SFoqx5kVgLsOq81SVmbxy4odiUty7B+5nKEwe33D2Qts
         p+kyNaZehJTDxkIMHunZbALX6156TCjt7/fk0y73Mco5NMwm92lQ9jxrlJOAlBAEttbt
         32HA==
X-Gm-Message-State: AFq9FYIxcMs3KRwcIaW5bLzOst1DJJKRWAb+VX1cYcNqgl10rs7DJE7X
	X1LlAfqIid93cX4XJYEREQJ5nKYQZQKm0HxvXknmD6fMJDqBFOIWuiZ3OpLYazY19t0ooCEYs0x
	WDK+W
X-Gm-Gg: AYBFou2McUcWqdtf0AuWLOi/sP4qOSt5hha63KLbs+uUOFcfuOEwpGuvLVNaIIuAOrt
	O1HOMQIf2dB9xCm4wMiNuuzP6fxOntcLRwYBQNt/GwiKsud+VDwXpFeJuFh4PO+D69Q4z6tmb4F
	bEXehrRJrQQxUY796JzBRWKLIvZxnFsp/5mkDF01CLoWX9QrAqc21czciAA5OpZotGRZ1LvXVld
	w2+y59cQPhil2S+efRCdV+al3YV23nOVoG4kW8qSYk/PYZcOA4A2KOqc411i6ert0xSOpi2Hn7p
	kc7Cc2KhHm9l8boiBJOeTlfOwfUr8zoGDAZocL8dLaO2SLqTNQpoKLjVh8jRCs/hqcg2fbO8lsM
	bU/Y8JDLNk0na0KDRXo7Q/H08KDj8rOOZ7MUwZtmiOZYVmyZ8h3QyB9S8tp9bSIIqw3bOSUA9M2
	M0hxNfIPZPiwsGevYyJuzCBTbAWPqsdm09gXoT8bKPiO16DkAy+Z93cuxoI8Ir5Jn7YE89ukQkU
	jNe5u6TFAzTPkmdordYs8aRdlP46bDlL1HoKmY3ASPPErCqBE3TmK0Tt5gkHBUXIH5vjJpcciUf
	5lvoWoDdJgK+Z1BtXo9pvNu3M2ubsR+YcrzKiMSAW687h9dADX3Lp8bDGOkYkuyE8prEWaodBZh
	PMV/+
X-Received: by 2002:a05:600c:3f12:b0:4a4:7a8d:c436 with SMTP id 5b1f17b1804b1-4a47a8dc6e6mr151321875e9.11.1793092834751;
        Tue, 27 Oct 2026 02:20:34 -0700 (PDT)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a04ad39sm660086505e9.1.2026.10.27.02.20.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 02:20:34 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 02/61] python3-bitstruct: Upgrade 8.23.0 -> 8.24.0
Date: Tue, 27 Oct 2026 11:19:29 +0200
Message-ID: <20261027092028.782979-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261027092028.782979-1-leon.anavi@konsulko.com>
References: <20261027092028.782979-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 27 Oct 2026 09:20:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131466
Content-Type: text/plain; charset="utf-8"

Upgrade to release 8.24.0:

- Add Python 3.15 to test matrix + freethreaded￼

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...{python3-bitstruct_8.23.0.bb => python3-bitstruct_8.24.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-bitstruct_8.23.0.bb => python3-bitstruct_8.24.0.bb} (79%)

diff --git a/meta-python/recipes-devtools/python/python3-bitstruct_8.23.0.bb b/meta-python/recipes-devtools/python/python3-bitstruct_8.24.0.bb
similarity index 79%
rename from meta-python/recipes-devtools/python/python3-bitstruct_8.23.0.bb
rename to meta-python/recipes-devtools/python/python3-bitstruct_8.24.0.bb
index 72b1a672f9..d6896163bb 100644
--- a/meta-python/recipes-devtools/python/python3-bitstruct_8.23.0.bb
+++ b/meta-python/recipes-devtools/python/python3-bitstruct_8.24.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/eerimoq/bitstruct"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=d9aa4ec07de78abae21c490c9ffe61bd"
 
-SRC_URI[sha256sum] = "3d20a8d748add9b1c68efc6c592a99b4b0937c9dcddd140fdae352bf2513aea5"
+SRC_URI[sha256sum] = "c72d8bd3b1762a5bcc9fde16bfa4d52800a4bc8d79f81bc7ee0e0bca5b5e901e"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.47.3

