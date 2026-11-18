Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11472.1795005043747783373
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 18 Nov 2026 04:30:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=HxDNjnc5;
 spf=pass (domain: konsulko.com, ip: 209.85.128.53, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4bb666304fdso15600825e9.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 18 Nov 2026 04:30:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1795005042; x=1795609842; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xzF9muDNkbf6F8cJ/DZUfXCytfUVyZla2wTzn+8Sb9s=;
        b=HxDNjnc555eihhRmjWJ00TappFgr7Uuh8af7zFpWmGEYV/LoYegsPayuUlxoGOgqdk
         2t0DpSbrxWKfGm6aiVSh6VkAw6jyr/SFbB+ra7cKPJ/seOnvsJ03tXFMPcELkm/0WWzR
         A5qbV41Ze1+On9zR8etjvBkBCq8bYIT12uQ+U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795005042; x=1795609842;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xzF9muDNkbf6F8cJ/DZUfXCytfUVyZla2wTzn+8Sb9s=;
        b=sGtK5PeJ0I+JRI3DJCKSeEqv8GpzFKmtVzYascKeydnD/EHMezXoBDf9VvcJwEUoww
         UOOr/52Z6v6ChjdryWnCO66YF6GFrWlrzaW970oaxivtyVmLAeQFHGJ9FWiyi+uCTpi3
         7LE4Trtuxux4H8jXOfcufhzvFg7v9oqs+9mGLO6x8zc3knB0BLbNb40/PnL/QXy2dxLL
         Pzgc+f8wU/bECwxysvPUev62TFuk9z6xsnDF2dxG7g9a42BGGpN+iGGAugEC15pRzm1m
         h0OagAZBGndVl3J0O348OIE5oC4Ih/j6dsiwovAqBukV432nQWtVDSHC0mgY0/wIW4ws
         AKdw==
X-Gm-Message-State: APuU4Z/Y2d7LoevDqL7vYmbBQHp6k7GPF0FzETEOmfOvuKOpUT2gtVoV
	H8/lwzh4f6StULCLkDg4wK4XoB9A1v51ILrtbRtFGgZJs/O0FVhuB8eT9Gxe5PNcZ9rXZIXwi0+
	suIDb
X-Gm-Gg: AYBFou398BZYsWi9tscBFcjZBSsmP8BG+s421+orTcIKvLC2CzJAGTshaPVWPZQ0khG
	D1aF7s/fJ/v74rAzEAYaZnyeBMf6CR9LqwvpoqkFhlrHue3aTOd8o+Uhc35kmCo7q2iFB66Jcsb
	+25IygMwl9Oir4gbLNJNJuYe08uMd/tgWH7aLEh6EOntixycGhp5Zo3zQCjdpge6KykfboUpynH
	BVtWn1felXPmSS4K410UgtdUjzyeiE2Q21vRi5wbl6bpJdb1T6T9lyoy5skCO3dQYrNrtm0OmB0
	WEszaDApdxkxGVsZo/e/8bNjOvRckxikVWrG+BYfaR+XyEjZyuqNIppIZgm0Xyj6jtX9IbeNRC/
	rJSXUeTAhDmS3q66PAL83utLNZ9ZUi+TSDnA/w9CFAnnv/v2XjID+1syfi0fQqGtwQ7aBi8oboY
	6ZEPJAfhdk6eWKhsslM7PFIuH0owzxIc5Ecujkpm9OhFPuqGcHvWMVKL/JdMWMXTZuHqQ0n0QiQ
	Ri9gGMd9JaNXuoSmuvr685Xf0gBKiBkcoeiQsVWMLlPY4m66tuymq4wBx8OvfAcSpzKl/q6CbQR
	yVZupHvICi31Stp35C1rKcSCgn0EgNO7Zn9Rrl/lSOPcyR7YwNaiERCX8BBO6WreQIxq4t9WPy/
	FEjrrx+7/vWjqJF7K0tRsVeECwETcjnB0Yu7Me00hDkt++oq6WUCeylI=
X-Received: by 2002:a05:600c:800f:b0:4b4:a551:681a with SMTP id 5b1f17b1804b1-4bb7da0c938mr45132995e9.3.1795005041841;
        Wed, 18 Nov 2026 04:30:41 -0800 (PST)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb78346f4asm152248385e9.0.2026.11.18.04.30.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 04:30:41 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-networking][PATCH 1/2] open-vm-tools: Check for meta-filesystems via LAYERDIR
Date: Wed, 18 Nov 2026 14:30:37 +0200
Message-ID: <20261118123038.908150-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 18 Nov 2026 12:30:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132651
Content-Type: text/plain; charset="utf-8"

Bitbake no longer sets BBFILE_COLLECTIONS with the new layer
format, so parsing failed with:

AttributeError: 'NoneType' object has no attribute 'split'

Check LAYERDIR_meta-oe-filesystems instead, which bitbake sets for
every configured layer.

This changes is requreid because of patch: "layers: Migrate to new
layer format" from meta-openembedded and the patch "cooker: Change
layer.conf handling to new approach" from bitbake that sets
LAYERDIR_<layername> variables.

AI-Generated: Uses Claude Code
Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../recipes-support/open-vm-tools/open-vm-tools_13.1.0.bb       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-support/open-vm-tools/open-vm-tools_13.1.0.bb b/meta-networking/recipes-support/open-vm-tools/open-vm-tools_13.1.0.bb
index 5739c05d72..b9823af891 100644
--- a/meta-networking/recipes-support/open-vm-tools/open-vm-tools_13.1.0.bb
+++ b/meta-networking/recipes-support/open-vm-tools/open-vm-tools_13.1.0.bb
@@ -117,7 +117,7 @@ INITSCRIPT_NAME:${PN} = "vmtoolsd"
 INITSCRIPT_PARAMS:${PN} = "start 90 2 3 4 5 . stop 60 0 1 6 ."
 
 python() {
-    if 'filesystems-layer' not in d.getVar('BBFILE_COLLECTIONS').split():
+    if not d.getVar('LAYERDIR_meta-oe-filesystems'):
         raise bb.parse.SkipRecipe('Requires meta-filesystems to be present to provide fuse.')
 }
 
-- 
2.47.3

