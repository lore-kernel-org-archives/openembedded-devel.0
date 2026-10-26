Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7767.1793057216757200821
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 26 Oct 2026 16:26:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=KFcbScb4;
 spf=pass (domain: gmail.com, ip: 74.125.82.173, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-3535bf8b3e0so5752685eec.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 26 Oct 2026 16:26:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793057216; x=1793662016; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fo7VaepEhlTAcTymtGNXi8+4f4eCerkcvdK/z4Brc9Y=;
        b=KFcbScb4Lf+PWEyX5Xp5izgRc/mVtGn5xydoEYxfJmK7IfLjsg7KGuzKMBaSsMyOQf
         Y52r97n5Wfu6OWUYugZh/bTh4tsc58aIwjZpU/hNUsMWmgs5hCqEhdzToAutGsxcJSdd
         6Yq7ZI7yYuANluULl7ZkRHGVrW2JMRYrrNV/v8xjkXM6gnYLGf+jxMEbu4gTkcZkadZc
         tMnz2orGuXfiA0yZPpxZ/z1eFxImvowXBQoR6g4HN8S2aQsLjizcioatKVScSV8t3Eur
         1XSuDlJOs0W+9whp9i/ym3LkwLWvtmLNuCFIhNi9Ji7rAlG6F+UvBdv6v5QHu6tVO4FF
         D9fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793057216; x=1793662016;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fo7VaepEhlTAcTymtGNXi8+4f4eCerkcvdK/z4Brc9Y=;
        b=yny6WMJ+L7SDfX0zf/uuw/4JOQwp14RxROaQibgJKfR1WVckKot0ku4X0NX1LCIiNS
         5l2v4svuXUG1zc2zZbks5IG2uVKiF0z7n10/zfVWSXkSM/b3QMyWlNpae7Z/e7Yuj8jo
         4JV6xObBzJpXW28dgfbHz14PDtiRXEAeY5GNxFibGOo87lOxg8g3MgmxCVtC3ifNprw7
         +fee9DKmitakF1PDq1wW/fei5CsnN3Wgh3l5WVVCQjmqX4NW1dlqD92K6XdktV2nsoVS
         4yxiHgVORnVugizdOyQ2a3xRRFTg1DkSRieax2X/4CTQcb4v8gHGyNdw6h8K4I7bK7ol
         Ry/w==
X-Gm-Message-State: AFq9FYKXytj/Iuy4BoQjiIhVd5l8uXuQskMSSK1RbYzxU/hm4EfW/Uy0
	yJDE2VMjvXOwd8R3krVsdGft+17rMnaPGlbXQRagG1CXj/g/Pe5hllx7+Dkgsg==
X-Gm-Gg: AYBFou24i2zDzk7Y6WF32/ZojBn7y+bPr6QqZphfzDLzmWWSwRQADeWLUTecmAWucwm
	WTH82+9S3O0/jZIiXbcT+8YFsZ9TLk/EHH/xZqlEYwTc1mY4myzMh1z1gErefaZDAy8PVlBWaa6
	48kCnZ9o3W4IuaijvKXAle6JnqDDHLpclsQwbNakhxNDpH1GT/v/ukYk8SBKi6pnHIvJwl1k5Il
	3r7iPdPLU4BOOvFumYxoKft37+Oos7HENsA5Rhas9MNl9gg4WF8suOLJHHp1c+p56PvNIY3T45A
	b50eXW/8oyI38Yayzvl6Zz1/Jf0EDLE6SUcPaYtcSOzam4WK6Xd9FM8rd1iqwCZB8B4BySWCO6a
	bMtkVwUgAqn2iXQdI7OHwW3MW3C1zfSgI0EalVtdlyxAmuHfANHdm15NLb1x0yqV5cXL3XvAWjg
	X0iwnPukvQgZ7jeNm6tUmifOdeGe7RrTyOAd0nZ9pIJDppSZbmKzNeo8R6+YBFdQyGuT+lRwp7Q
	X386/1mRoKwJjR6SA0TzmODPT8Om+/mQV6oA+wCJepcrsMdRB6iwciaSDNFELIrqyiX+G1qSy2p
	GXOX+YByoJZi
X-Received: by 2002:a05:701b:2610:b0:14d:baf5:c411 with SMTP id a92af1059eb24-1993505e01bmr10996508c88.14.1793057215996;
        Mon, 26 Oct 2026 16:26:55 -0700 (PDT)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.. ([147.161.217.9])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-198a0e8d700sm32234982c88.10.2026.10.26.16.26.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 16:26:55 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][PATCH 12/13] nano: upgrade 9.2 -> 9.3
Date: Tue, 27 Oct 2026 12:26:24 +1300
Message-ID: <20261026232625.1275411-12-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261026232625.1275411-1-ankur.tyagi85@gmail.com>
References: <20261026232625.1275411-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 26 Oct 2026 23:27:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131452
Content-Type: text/plain; charset="utf-8"

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

- On the mini bar, an overlong filename gets properly clipped.
- The keypad operator keys produce their inscribed characters.

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-oe/recipes-support/nano/{nano_9.2.bb => nano_9.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/nano/{nano_9.2.bb => nano_9.3.bb} (87%)

diff --git a/meta-oe/recipes-support/nano/nano_9.2.bb b/meta-oe/recipes-support/nano/nano_9.3.bb
similarity index 87%
rename from meta-oe/recipes-support/nano/nano_9.2.bb
rename to meta-oe/recipes-support/nano/nano_9.3.bb
index 81faa7da95..889a9d1086 100644
--- a/meta-oe/recipes-support/nano/nano_9.2.bb
+++ b/meta-oe/recipes-support/nano/nano_9.3.bb
@@ -13,7 +13,7 @@ RDEPENDS:${PN} = "ncurses-terminfo-base"
 PV_MAJOR = "${@d.getVar('PV').split('.')[0]}"
 
 SRC_URI = "https://nano-editor.org/dist/v${PV_MAJOR}/nano-${PV}.tar.xz"
-SRC_URI[sha256sum] = "05ecb99247b782e8a5b3a25ed4101dd034b0236902f7449bc9795b717642f7e9"
+SRC_URI[sha256sum] = "a9affc52c9596ee0682bcdd4ceb3c0b235eb221d83d733dfd9b0dff45897cb0d"
 
 UPSTREAM_CHECK_URI = "${GNU_MIRROR}/nano"
 
