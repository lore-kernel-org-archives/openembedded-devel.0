Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1142.1792543049112329161
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 Oct 2026 17:37:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=PDuWDPq1;
 spf=pass (domain: gmail.com, ip: 74.125.82.179, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso525626eec.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 20 Oct 2026 17:37:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792543048; x=1793147848; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N2rwzFGwyN/StYCriG/ZAsk7ZKLIf6a4j0anrHXay40=;
        b=PDuWDPq1hxRYgr6Iv33lRpnx4alrFQPebjqZG365qNeNyz88d84r168NleH+0GlOpE
         HlSCgwJ/m6q+6yAKYfu9S3srE27kKDyAjkuts00Der6yljt85iW8smKJOg/Mf39gP9gN
         FgFshmDMEXd77yeEYyg3anUTlTTPlgvDYPE+sh4/aU2TXBteialsP+k4jZgPxKpgMNQq
         4+2ZrtkSXAbUNJQ2MuGHXPrC5Xeu4fwmHVOn7U0T+DqaIBr7VXJHHviCbN+miOfo8wyd
         mF/23Y5YGb5YRcJIUlQaFAvLSgLKARlbLLoLRtv7hPTX70ga9+XQAZAlhNiaRh7o1s0G
         FiDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792543048; x=1793147848;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=N2rwzFGwyN/StYCriG/ZAsk7ZKLIf6a4j0anrHXay40=;
        b=TT8i2PJM3cRfxcdPMOLlkYjPm5SyKXPoCKLTuFzaFXVdsB7RuaRwn0HCO8S2Hc7c7i
         AC8Ni0wTovBdDJgFHh7akThbVASXzlSbCDYr0DSD7LCZfJeARXC50iVFbTTWW+16tuKT
         0xSCR9ICaRLh2mdiIuI64xYxDtH+LNP77RFMAY5ZXUBGMp1KBUjnQotP51BuMjHw1Don
         ilefX2+Czyju2VvJsAYQO1YWsXpkUFn+/kLnZoE8Nwoxu4QJ21ZKAYqQAt6vXO1mPg0L
         fsaYgYVW+t8lGmWe1U3GtBlq4FPoLghr/5WQjlEL+blrp7gvmxOmB6WCmhmrxD0fSCCN
         iwYA==
X-Gm-Message-State: AFq9FYJ9MibhbAVx8GFYxUGdpmjSIylLb4i7e/NgGqRSIZ903Kn6Hueq
	ngk2VfGkGPQ+fmkfHOLkDzj0v2EWw7Wdx7mVKSZmKzgvL3Vj6cENlfeAEJ6EdA==
X-Gm-Gg: AYBFou3SJhh0tM21ORM5JVe+1dZlGfMlVRLj/zFTBxLlJ5bNv0q0/MwuytxIRXrDga/
	+/OkQB5ORZB2uQWrcP6OViZwHneww9I2ux+zMtD7ZXZpYCNhG5bQthCOiffqEH2QN196ECjdokp
	1ZcfRCrBKTiReNPmfMQuMwe9/rCF9AA8TT6XTa3Hqy3KhmKPozjXGQJDAsfXCbR4fQXpMDQr05f
	L0A8qmExf/6jKr4DPeIXaau2XIE1eBvNAbg4FdumE3haytEUukaHlCe48+7GhAMsLxU4fa6JLxl
	mBweCwov5eP7Y4P3dWUPtg2CBoKRFN+eaZsogh7ZAejLDeutqozxKdeZsYluvdqF/K+7NQOg+kl
	krpY9t71DKdBjDJS61tmN66lPkRC1u8McJJwrQhUmgYFxRVGd9BZsAG5v0S+OF5kWzeWDWdvunK
	lo/ZfrxmCZBD9vhtm7GBIcswHyrmw0QeU0fzg59Mw59vSODsGhqhbzuyi113ogO9XLTgZO2Blr/
	E9RHxHongsbOPiTCzspVFbwhTvJHO9HaMzPgolK60RwKfJefQvYuF0AG4HfjV4DwcN5ct3rEyvi
	f4siUD9CBVQivKxAP8zGf220II7mkiY=
X-Received: by 2002:a05:7022:296:20b0:185:5a96:ef59 with SMTP id a92af1059eb24-190a8b7a350mr535482c88.34.1792543048389;
        Tue, 20 Oct 2026 17:37:28 -0700 (PDT)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.brunswick.com ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-19035926fe9sm1648124c88.2.2026.10.20.17.37.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 17:37:28 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][PATCH 4/5] faad2: upgrade 2.11.3 -> 2.11.4
Date: Wed, 21 Oct 2026 13:37:14 +1300
Message-ID: <20261021003715.2982979-4-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261021003715.2982979-1-ankur.tyagi85@gmail.com>
References: <20261021003715.2982979-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 21 Oct 2026 00:37:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131182
Content-Type: text/plain; charset="utf-8"

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://github.com/knik0/faad2/releases/tag/2.11.4

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../faad2/{faad2_2.11.3.bb => faad2_2.11.4.bb}                  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-multimedia/faad2/{faad2_2.11.3.bb => faad2_2.11.4.bb} (87%)

diff --git a/meta-oe/recipes-multimedia/faad2/faad2_2.11.3.bb b/meta-oe/recipes-multimedia/faad2/faad2_2.11.4.bb
similarity index 87%
rename from meta-oe/recipes-multimedia/faad2/faad2_2.11.3.bb
rename to meta-oe/recipes-multimedia/faad2/faad2_2.11.4.bb
index 8dd09439f7..7c00a5b6ab 100644
--- a/meta-oe/recipes-multimedia/faad2/faad2_2.11.3.bb
+++ b/meta-oe/recipes-multimedia/faad2/faad2_2.11.4.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=381c8cbe277a7bc1ee2ae6083a04c958"
 LICENSE_FLAGS = "commercial"
 
 SRC_URI = "git://github.com/knik0/faad2.git;branch=master;protocol=https;tag=${PV}"
-SRCREV = "6918ebb51b8f7e86278da15884bd7114e4b9661e"
+SRCREV = "e8e76f0a44db45aed773a3f62fe35a63c867a738"
 
 
 inherit cmake
