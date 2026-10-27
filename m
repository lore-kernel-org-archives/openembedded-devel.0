Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19198.1793108992566504127
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Oct 2026 06:49:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=R9zoytG4;
 spf=pass (domain: konsulko.com, ip: 209.85.128.48, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a214c5c4c0so33059795e9.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 27 Oct 2026 06:49:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1793108991; x=1793713791; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=frNBEBGbyq8IBKSDTyd3q59B+CB/KiCUWvGLUVusf0I=;
        b=R9zoytG4cIhFEPyXSHs61DlO5rIlhfh3NoyeLNugnFGLqcYe/WPInOAtoyHrsUZ+E7
         8PmAlqas2UJVHWKWPu97VaiiSgSBv2wL8rWKlZuPVr7K/zKOcXf3B+HWK+OrDaWr7buK
         6XTTaNF9LhHxGG9mQdoPFu82Gz4peSQm+FF9c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793108991; x=1793713791;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=frNBEBGbyq8IBKSDTyd3q59B+CB/KiCUWvGLUVusf0I=;
        b=2kV8aeUwKX6kpDE2FzNZBo7WKgwL1EIzF0ja2Wv7+lNEkN50mAECQxCCbSFdnrjyKL
         mpeg6Bg/UDLhADclnHLP7erj4iBTCnwdmA83g4QcNWBszxxNEj05nqP1ewgvcJnuACKk
         lFGqasZvD6HeGHURRRCFR0fVhchCQO7Y0wFPdvAnzcNzYn3qrAd2jppyoh/zUj/xcb6M
         iDd0LFXJmi/QRw0JXUXlYs3VqT+WAv9cywv2Hh17Wkc11r2P4jh6GGGYxirXhvihq61m
         G3Q/QkSKI6P1MiYsv/d0ax0j6+VQ9ftQUTqwDwBKAmJ/dPXzEgq+JC1fyL8E7wxAN/p2
         MCSg==
X-Gm-Message-State: AFq9FYLPmbnx/VTQg95vkVDB297p4HpmAoJXT3yrDF6iuIJFLpdbplNv
	X7U7ZYmW5VnxyunO7gj39LIVme9vZUkt3VW9NAMSD0tSbEDt1YFzYzIfRlJQ98jv7HUeBgfGJdY
	X5yoX
X-Gm-Gg: AYBFou2HCdACteLsr6HaJVowXk8I9Fst4EAjlUTG1ab0BxQPN2jnPLqDhPluFBk1oS8
	geaXIPohjyMj6xGi3S2lYPBGKar8qpWfqYwVZZTT03a0UawFdstVGq9+nQM/IRzz9omlogjtQK+
	816KFkXL8tXAza+FKLz7XpLpkXUObrvtagCSSZd7/VnCvzbvb75dJt1hT+wyvOMPv3lclGRyQ4K
	FFl48RuFgXkFafnwHQbQau73Ccdgnp0VwyeynGJhhj2KCvs0mDmEaHlgCLS94Px1jsxbUZppRQO
	f4wif7miz4Y5mzOj5+gkNWAP4QcB2Z1VOxZaf1HQYqvXPSMnmVKpWuN32TPL38RRc0B2XCWBVto
	yQVYBCQbCJB90E0TsOUAEd5DVCR5tqq0iDJ8HCdOZJWnX7UFzHIw/El82i4DEeb6DAJhAWFp7nS
	IgD1T4m1lolNlMrBC2TVvnTcMDFJMBXfC6AF07U2jPHPu4ksxqiNBVLCRsWs+toU9GXSw58NHdW
	bN6wlz+XF9eFEX78gDkDz0NAcUfHXNwDGqf9oqc550JLzc4CF/sH/D2faOwwnZszt5f4fbzbdi1
	C4TJp3Dr140zovX2Wr8YXN0gYkTGbTKmLgvmum+Z96gMQLD8y8hWXsYFiqhsNItf0qi6acuGyjS
	UABiR
X-Received: by 2002:a05:600c:4f89:b0:4a1:ddaa:571e with SMTP id 5b1f17b1804b1-4a35ac9d018mr193570795e9.15.1793108990785;
        Tue, 27 Oct 2026 06:49:50 -0700 (PDT)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a0bae01sm330941335e9.7.2026.10.27.06.49.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 06:49:50 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-networking][PATCH 5/7] nbdkit: Upgrade 1.48.0 -> 1.49.4
Date: Tue, 27 Oct 2026 15:49:41 +0200
Message-ID: <20261027134943.1011404-5-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261027134943.1011404-1-leon.anavi@konsulko.com>
References: <20261027134943.1011404-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 27 Oct 2026 13:49:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131534
Content-Type: text/plain; charset="utf-8"

Upgrade to release 1.49.4:

- vddk: Deprecate this plugin
- server/public.c: Try harder to make a timestamp

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../0002-plugins-Avoid-absolute-buildpaths-in-binaries.patch    | 2 +-
 .../nbdkit/{nbdkit_1.48.0.bb => nbdkit_1.49.4.bb}               | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-support/nbdkit/{nbdkit_1.48.0.bb => nbdkit_1.49.4.bb} (96%)

diff --git a/meta-networking/recipes-support/nbdkit/nbdkit/0002-plugins-Avoid-absolute-buildpaths-in-binaries.patch b/meta-networking/recipes-support/nbdkit/nbdkit/0002-plugins-Avoid-absolute-buildpaths-in-binaries.patch
index 99ab7cad61..52bd4c49f8 100644
--- a/meta-networking/recipes-support/nbdkit/nbdkit/0002-plugins-Avoid-absolute-buildpaths-in-binaries.patch
+++ b/meta-networking/recipes-support/nbdkit/nbdkit/0002-plugins-Avoid-absolute-buildpaths-in-binaries.patch
@@ -1,4 +1,4 @@
-From b3854245f061d9ba2159bdb37197e1c711cbd9cd Mon Sep 17 00:00:00 2001
+From bf4de45f582a07410435399c0e11c1acaee9edd7 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 22 May 2023 18:16:24 -0700
 Subject: [PATCH] plugins: Avoid absolute buildpaths in binaries
diff --git a/meta-networking/recipes-support/nbdkit/nbdkit_1.48.0.bb b/meta-networking/recipes-support/nbdkit/nbdkit_1.49.4.bb
similarity index 96%
rename from meta-networking/recipes-support/nbdkit/nbdkit_1.48.0.bb
rename to meta-networking/recipes-support/nbdkit/nbdkit_1.49.4.bb
index 95e5237853..c1d9b18356 100644
--- a/meta-networking/recipes-support/nbdkit/nbdkit_1.48.0.bb
+++ b/meta-networking/recipes-support/nbdkit/nbdkit_1.49.4.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=26250adec854bc317493f6fb98efe049"
 SRC_URI = "git://gitlab.com/nbdkit/nbdkit.git;protocol=https;branch=master;tag=v${PV} \
            file://0002-plugins-Avoid-absolute-buildpaths-in-binaries.patch \
            "
-SRCREV = "111be961359500291bd3792317b042d72bef5efd"
+SRCREV = "9ac3038efcb2d9be603788bfb7e1b1ba2eb06f57"
 
 
 DEPENDS = "curl xz e2fsprogs zlib"
-- 
2.47.3

