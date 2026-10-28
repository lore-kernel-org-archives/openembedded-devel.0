Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.36956.1793167101858946980
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Oct 2026 22:58:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=O/ptC2gZ;
 spf=pass (domain: gmail.com, ip: 74.125.82.47, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-1a2af4c8d00so1060810c88.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 27 Oct 2026 22:58:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793167101; x=1793771901; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6MsqkUZG7ZF0B+ju3FecTRce+i62B1iFdbZYzZsyn7c=;
        b=O/ptC2gZzuJoRhIZm0HTBq77pk9fotMVWUdPx5fGdNFm4CLP+JA5DNC0/GYOjRntBS
         IZnAp3x9fED6Nw58ocUYh1jM+vKqNYXw/a2RIV+Lra2vX8Zc0rIcs6/LPJreR/+wcwzN
         zoCqX5oj0FSGVa9/07hkmEtiKHL5dmucN9cKIb2eN1h5MYIPGwWruAqmPUlRjRjCq0G5
         UEjv834MO9cn9Wu3dMOQRREq0m8Avh5Pt+LahmdZFTUAlwYJG26lt3cjKhlE+WlYn0yH
         LFU8OcKKXiGSTH85Js2tMKi17TKozQ3ui/ZpqTIPRHOf/rekjyvEu7W2mTM2vsTDbOC/
         w4+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793167101; x=1793771901;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6MsqkUZG7ZF0B+ju3FecTRce+i62B1iFdbZYzZsyn7c=;
        b=s2S9CWUGMeSWcDjpr14h26KMHbjzxJuoP7ptjsySsgqson9TSsJ/yyDB0EvO5xWWad
         6FJw/kA9c+l2AYCRAKcv9Y9uYx8Eq4f5cLwM2lwAWywIjL1NQtusvYMbKFVWwpqgEIYT
         5wJGQcLR2zUzztr73fxCbLBNUA9qUCXR3NTFE80WyObDytaQIEdK315cE0+VBBd6P80C
         JuSPuGun8NAT0CdIdstjLh9LbJ1YnxAhOhE3jL8Tk/vF7P/VuQZSiLHM4uotvuSEwx3r
         toHGrAstPFZtkw0nwOPEGjiFhIJ31w71sG8zXjgAn3tPiL5oMGUOGTuFOUsXXGOYbD8R
         FLsA==
X-Gm-Message-State: AFq9FYLwkcpNu9IYYvvTvPkfDOqbTff4cSWgYegkAF8yYaRMdFpR4HwG
	kHA7PxKC13AGWgvvYI/fHWPMxtRufRwqnL0ePc1hiljE89TnhMjJpd/OWhYhV7HlLmk=
X-Gm-Gg: AYBFou0cbnbXWYPnpmcrQukOOdNIO3eZlAVkNNSe3vD/LYgLtNKLebd26K0Wo31R3jv
	wqCLgXdpt7w2YGf7wv4NfDCIwlxkwI+WzlKygNue3SWIWoXTluGdjDDrpaUhGgqrCi7veLIHt9X
	IWraj83vbJhl1FDSiEu96XNObOAnCuw4B1F4dlLhug4KovgiIyotmdN6UCQ8GUXl/meWXYTgj95
	y8TKXBxyRRd6clhxgMn5ypac7odhl9/2aeZzZ9wdigU8cr3t1YvvcU/L23dZVhoIZMq/9yd8aa0
	Y4t0T760urHP/mQZES4AkRlzNFi9N+HC31Cvw2/dqxb+IHxakpiQjtnvUpWUj9djMPCzKZpJngy
	ZIj+K+0c9cUn9fEJ2NSXVx25FNe94q945KCgzUYUr7kR5+Q2qoQXhKzqtAlCcbPDL0CHKRlVzdV
	fjvk8EvRbQF/DmV54R1TyIxfQDg0JXb4fMiiVl09BwbPu3Gu2Dj/uNgPJVYQDiEWzIu7QdWEa13
	GHtEkrWQ46XbdPbg4K9ZCk/Mwx/tIDB0DYQYIALbTkvy4mu+x9QPf7pvYNV2LGLGPutRrNJ0aZg
	9js8jrrKVHxh0j/LOexGoF4IHZCc764Q9SSCW4i4Suc6t1YzFuaND+kMvOnXVBYWoLbywFeV9pp
	f9HKGfY8KgbwVwnX6UD2HPZhljSr7J862uBq5TCjyXxHMMc3ZHGV6pYaJGinbwAZ7uxxtusolzj
	DIEiPibIt5IxkoHxkOiM0vgicpUQVis8J7+Njx+u7JAnfZwigzDXtPW90NMDmZ8bUVcjcB/J+Qe
	gtU67taqVS8pnh/Ubk9kqDTazFJgYQDsHdLNKH1MbPtv6ZTvDvXVW+ncEGfIaE6do1SiIZDM9am
	yHUjIT+M5UEa8W5tBk5CYdp5UQ==
X-Received: by 2002:a05:701b:4511:10b0:194:b2e5:473d with SMTP id a92af1059eb24-1a6c7e20d4amr2006272c88.5.1793167101118;
        Tue, 27 Oct 2026 22:58:21 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1a75a37093esm2181914c88.3.2026.10.27.22.58.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 22:58:20 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 2/4] libusbmuxd: Stop using gitpkgv
Date: Tue, 27 Oct 2026 22:58:15 -0700
Message-ID: <20261028055817.4055253-2-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261028055817.4055253-1-khem.raj@oss.qualcomm.com>
References: <20261028055817.4055253-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 28 Oct 2026 05:58:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131619
Content-Type: text/plain; charset="utf-8"

Both recipes set PKGV = "${GITPKGVTAG}". With shallow clones there are no
tags or history, so the 2.1.1 recipe, whose SRCREV is exactly the 2.1.1
tag, got PKGV 0.0-1-g<hash>, a downgrade from 2.1.1, and gitpkgv warns:

  WARNING: libusbmuxd: Shallow cloning enabled - gitpkgv.bbclass will not
  generate sortable versions

Drop gitpkgv. PKGV now defaults to PV: 2.1.1 for the release recipe, and
2.0.2+git<AUTOINC>+<hash> for the git recipe.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-oe/recipes-extended/libimobiledevice/libusbmuxd_2.1.1.bb | 4 +---
 meta-oe/recipes-extended/libimobiledevice/libusbmuxd_git.bb   | 3 +--
 2 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/meta-oe/recipes-extended/libimobiledevice/libusbmuxd_2.1.1.bb b/meta-oe/recipes-extended/libimobiledevice/libusbmuxd_2.1.1.bb
index 7869fc1941..40293e1521 100644
--- a/meta-oe/recipes-extended/libimobiledevice/libusbmuxd_2.1.1.bb
+++ b/meta-oe/recipes-extended/libimobiledevice/libusbmuxd_2.1.1.bb
@@ -4,9 +4,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=6ab17b41640564434dda85c06b7124f7"
 
 DEPENDS = "udev libusb1 libplist libimobiledevice-glue"
 
-inherit autotools pkgconfig gitpkgv
-
-PKGV = "${GITPKGVTAG}"
+inherit autotools pkgconfig
 
 SRCREV = "adf9c22b9010490e4b55eaeb14731991db1c172c"
 SRC_URI = "git://github.com/libimobiledevice/libusbmuxd;protocol=https;branch=master"
diff --git a/meta-oe/recipes-extended/libimobiledevice/libusbmuxd_git.bb b/meta-oe/recipes-extended/libimobiledevice/libusbmuxd_git.bb
index 76759fe69d..de480dacbf 100644
--- a/meta-oe/recipes-extended/libimobiledevice/libusbmuxd_git.bb
+++ b/meta-oe/recipes-extended/libimobiledevice/libusbmuxd_git.bb
@@ -4,9 +4,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=6ab17b41640564434dda85c06b7124f7"
 
 DEPENDS = "udev libusb1 libplist libimobiledevice-glue"
 
-inherit autotools pkgconfig gitpkgv
+inherit autotools pkgconfig
 
-PKGV = "${GITPKGVTAG}"
 PV = "2.0.2+git"
 
 SRCREV = "36ffb7ab6e2a7e33bd1b56398a88895b7b8c615a"
