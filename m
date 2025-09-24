Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20F39CAC5A5
	for <webhook@archiver.kernel.org>; Wed, 24 Sep 2025 12:29:08 +0000 (UTC)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
 by mx.groups.io with SMTP id smtpd.web11.11202.1758716938936398502
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Sep 2025 05:28:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mFsL+yGV;
 spf=pass (domain: gmail.com, ip: 209.85.208.46, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-62fca216e4aso2004813a12.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 24 Sep 2025 05:28:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758716937; x=1759321737; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CxO3r3dRXkTwBCtC5ORc8H9xPPjXJXEDM/dblxYxwqU=;
        b=mFsL+yGVDrq9pA/XPYNEx0FGOsy9DJe6mu4EAMVcY3BJ50LSLMtum5jSuCglvVRf6F
         FzZ3qXrgk/tzt9SnrkwR8RsCY6D6U3x5e7zIc31k84fFal93h5mcqN2elyP6DjlZeUaj
         r0mKy4MXPnFh4hcH1VzJ6M0eXPNxOCxKltslWKCEOkwkbgTAM3jw6LVA6L4+JU1wuu2+
         guDKuZ5f9y0PVfzyUsWvXh+ER9qq2B+UsZt9Y4G4yOkxoWxXrL2PwhS3RGJ8g0pCSUa/
         Rmym/EEd8BBPPpE/8Pe/95tpigSif6BeTueHpTjrrdD5Bt25zcNP0kUZzfGiiySL6Hy8
         HQYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758716937; x=1759321737;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CxO3r3dRXkTwBCtC5ORc8H9xPPjXJXEDM/dblxYxwqU=;
        b=fTRSw/glu+tbb5MvfjV6XBpt2jM99AxH2Fisr0Zbu3xuN/7iqJYWUgCoQLEygDJ5PI
         XEbdOEqVNjlaZN4MF8NRfCMd/hiyHl5E824hEvMRb6dND7Po7bgVI/KEuHpOEizD7+ql
         LBLj+HEaQh6jX8gR9eTPhluw6sljXROPZFzTwdzo25raiB3FaK0KmKRLTlF7tdCtNcdV
         0nSVeVEBv68Wb2UCF1ZgVZZc92rb9oDzUL6OosBZp+NL6IIge9meu+xKVp6WwJIX1BgI
         oxo3lB9xIXV6PkdNWqMd/Gz+5fzZvxK0/0CUvpQNKTXbPZHomm3kJhX+g1wlxtrIvMlM
         pXyA==
X-Gm-Message-State: AOJu0Yw7zizQY9sgbSG011VJyo6TkjzTPaWH+A6eeCdAUNn5cbMMCpm7
	rXwCEP1uVjcKGPvHYC1jJqnBoOCOQdHdgZapBLdtuKbYiHzbdLtzgz99Vv5qcg==
X-Gm-Gg: ASbGncsZUiQ79UEaFuzlErzRu8ws0qEX4J/nDnzahqnCR3WEwfHRCvGNQxD65YjRyc0
	FxFiVIu8wrGegedvEqn8/fSkiWvgc3MEdHAQXXg9DHzEtUjpSuPTsZUbtqsekiviPALy9P31stX
	OTRdHwcZPsTLvDhukUyuGeB4gbeReEqWrOQ4kFaSACX1wOhf4kCK//KLCNxCgkTbKflKBfnB1ja
	5jtAiyMXCeAtjyDQ1T5YBeiSujv27UFqd81syjGG04nlXejSX+z5LijMyedAXt2sG3/lpg7oiNS
	JJ9Kbi1BfhaRAJA+0i/YCtlQB6m1pX302wElnA8h7+/8t5UCw8YFvO0Pi4xw+pgrb2GT1i1WMpg
	hgw1rUci3TSjjEPsyK0zp
X-Google-Smtp-Source: AGHT+IG5r5R4pA8mEkEBCcyJDFntvn2h4zsYaXG4qUerNu9aW4uwpbMuBp8oPje75z4LUd1EJhM9sQ==
X-Received: by 2002:a05:6402:2742:b0:621:e63d:307b with SMTP id 4fb4d7f45d1cf-634836d5bd5mr2298735a12.0.1758716937151;
        Wed, 24 Sep 2025 05:28:57 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-63469f30772sm3024835a12.22.2025.09.24.05.28.56
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 05:28:56 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][kirkstone][PATCH 12/20] gvfs: fix polkit homedir
Date: Wed, 24 Sep 2025 14:28:30 +0200
Message-ID: <20250924122839.4184719-13-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250924122839.4184719-1-skandigraun@gmail.com>
References: <20250924122839.4184719-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 24 Sep 2025 12:29:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119815

From: Markus Volk <f_l_k@t-online.de>

- remove double slashes

Signed-off-by: Markus Volk <f_l_k@t-online.de>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit c6168d98ed4b672f959c48f7abecce2d33bce327)
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-gnome/recipes-gnome/gvfs/gvfs_1.50.2.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-gnome/recipes-gnome/gvfs/gvfs_1.50.2.bb b/meta-gnome/recipes-gnome/gvfs/gvfs_1.50.2.bb
index 73b9bd3b09..9d1303e2e4 100644
--- a/meta-gnome/recipes-gnome/gvfs/gvfs_1.50.2.bb
+++ b/meta-gnome/recipes-gnome/gvfs/gvfs_1.50.2.bb
@@ -77,13 +77,13 @@ PACKAGECONFIG[fuse] = "-Dfuse=true, -Dfuse=false, fuse3"
 PACKAGECONFIG[cdda] = "-Dcdda=true, -Dcdda=false, libcdio-paranoia"
 
 USERADD_PACKAGES = "${PN}"
-USERADD_PARAM:${PN} = "--system --no-create-home --user-group --home-dir ${sysconfdir}/${BPN}-1 polkitd"
+USERADD_PARAM:${PN} = "--system --no-create-home --user-group --home-dir ${sysconfdir}/polkit-1 polkitd"
 
 do_install:append() {
     if ${@bb.utils.contains('DISTRO_FEATURES', 'polkit', 'true', 'false', d)}; then
         # Fix up permissions on polkit rules.d to work with rpm4 constraints
-        chmod 700 ${D}/${datadir}/polkit-1/rules.d
-        chown polkitd:root ${D}/${datadir}/polkit-1/rules.d
+        chmod 700 ${D}${datadir}/polkit-1/rules.d
+        chown polkitd:root ${D}${datadir}/polkit-1/rules.d
     fi
 
     # After rebuilds (not from scracth) it can happen that the executables in

