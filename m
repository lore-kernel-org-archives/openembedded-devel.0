Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.730.1794955431059702773
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 17 Nov 2026 14:43:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=Vh4WsPdB;
 spf=pass (domain: konsulko.com, ip: 209.85.128.53, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4bb72b44a97so3084065e9.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 17 Nov 2026 14:43:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1794955429; x=1795560229; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TZtDBTGjK2xs5kr5i5LasMN8/jvOT0JgPxGY1XhzzHc=;
        b=Vh4WsPdBDG+ZGk5ZLp+jhq+yGa9EOvBEDZllZ+62uribEMMBu1RJo7SUXQzWUpeHfx
         23Xc67nTO4VzmnZErfDqDgK/5Mk/kaqE8s2+VUeLgHpeKxGH9eBXn/J4PQl8JZzoERJH
         K6xCgTUGobWRZcKCJXd9yFvR+knKPqEWpry3o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794955429; x=1795560229;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TZtDBTGjK2xs5kr5i5LasMN8/jvOT0JgPxGY1XhzzHc=;
        b=JQ6X4gDF9lclkuN9rvoiK98/nj7dB0Wl9KbLRfqI03pSfWkenVqdY3NTiDtu4LR+S5
         icwIL+lPqYyKzhjG06DqtrG9wEycjx4QsnWGSq/NDQbfJnx12NQhs7vYEgl3shJA7p23
         DQpII9eFQKgFQtnVcHHhRwHV2poxfsN9559zi64uFyK/UZX0+HdhIXi/IjPixEnx3iak
         jiS0tmeAl7SiOx1TiUhfFgBhJ3yGzZPcisFDnbP7AEw7VOaDrYSUZZLm0O+nleASKYt/
         AqHzlqEmo7QAsv4IoE9x+erVg4MWDZouq7/+cFS3fj5fBEyddFen84T019UciP/xvUPr
         nhqQ==
X-Gm-Message-State: APuU4Z84btUaVrtYMy+1OG/s8BsieLzokTAg1IyTorNdK93+YfXudDdO
	Ynep7NGSg13RXsb/Dc6Ixjj8Cl2YeG75GAstj6x9zqndnltF4oPvm3HwKdfnm4AjxHsRA/xeoJF
	9Z4QC
X-Gm-Gg: AYBFou1g+x2xmMH6RfHE91e6K5nh4JLz8Pk6T+ui+IglsxWkULAectlJrf4L0ea8pJw
	TnNbLTCLP/2U3DGVF8Ns/wrG749mYhSU0GN9ohLWupv/u0Vh6aUwz9JC0M1kxA3da1u4UkxnHlj
	kRpHuIqMPDTY5mizl8EhlG0oYsZzrGsAXc91FuuAZGyo/Ip8V5OWB47pMcC45XUYPEFNkpS3h8c
	uhFkuMi0IaWIrIves9lc00/yyUNMPCiUl6oqmG6CY5f/g+T6wAnSg7Spl8w+uUmR5setD7Lzaxl
	PvW8THaU7ie67PsMQKpVTVMd9W3jtraY3OX670sn7LqtNfV+nHcIX3LPqC8ZKRWbWZT4V/89CHk
	vXIFRLVU/ShZHFWK19CLoRExtICS9omKrroFn1DvWAvmTCq6nPkaU/rRCdLM1DICl0FLl7guPSu
	d3ZhmJAmhwY1rdxsKKsD5BqU9m0Z1M9rDZE4Qe/QeYlowjNJRqy3FAlSnOghzFLF2UO0BSJTCOS
	IEsduI/oLN5K/49UyyCdcav4XfZHD6KTdJv++9yMh84fUgHhFBRxHH57A/KVCH3nSz/JBDU43hJ
	RW1nKa0Nl0hpPqXYfpmfyrrmRGoOTSTUJ5ibyGzHLb6CAGbyuBORbEQFpA4ixRxQl7J/x1/e42L
	XnvHBLl9T1uTRZmk8AYd5KgeY3TTYWfvoS0yqVZpjctCdBrxnfIhPfg==
X-Received: by 2002:a05:600c:34cb:b0:4a1:fa27:df7c with SMTP id 5b1f17b1804b1-4bb7da4c5d3mr12752075e9.34.1794955429286;
        Tue, 17 Nov 2026 14:43:49 -0800 (PST)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb7d2c3c93sm25012915e9.13.2026.11.17.14.43.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 14:43:48 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-oe][PATCH 11/11] xterm: Upgrade 411 -> 412
Date: Wed, 18 Nov 2026 00:43:37 +0200
Message-ID: <20261117224337.4181772-11-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261117224337.4181772-1-leon.anavi@konsulko.com>
References: <20261117224337.4181772-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 17 Nov 2026 22:43:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132601
Content-Type: text/plain; charset="utf-8"

Upgrade to release 412:

- improve fix for regex-selection of a wrapped line (adapted from
  patch by Albert Flügel, Redhat #2479962).
- fix some cppcheck warnings.
- improve a special case where an exposure event happens to cause a
  hidden character to be drawn at the beginning of a string.
- correct limits for a partial screen clear operation (Debian
  #1149533).
- amend response for DECRQM 1046 to return “set” when titeInhibit
  is set rather than the reverse (report by Vladislav Korikhin).
- update tables in wcwidth.c based on Unicode 18.0.0
- update config.guess, config.sub

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../0001-include-missing-pty.h-header-for-openpty.patch     | 6 ++++--
 .../xorg-app/{xterm_411.bb => xterm_412.bb}                 | 2 +-
 2 files changed, 5 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-graphics/xorg-app/{xterm_411.bb => xterm_412.bb} (95%)

diff --git a/meta-oe/recipes-graphics/xorg-app/xterm/0001-include-missing-pty.h-header-for-openpty.patch b/meta-oe/recipes-graphics/xorg-app/xterm/0001-include-missing-pty.h-header-for-openpty.patch
index 0c9d64c82c..6fac6328d9 100644
--- a/meta-oe/recipes-graphics/xorg-app/xterm/0001-include-missing-pty.h-header-for-openpty.patch
+++ b/meta-oe/recipes-graphics/xorg-app/xterm/0001-include-missing-pty.h-header-for-openpty.patch
@@ -1,4 +1,4 @@
-From e30ab2d73a21bc55511cbedbb9ae603246dbfcd1 Mon Sep 17 00:00:00 2001
+From 5e34d71052f1ea63363fe7937859dfa8d46dfb4c Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 16 May 2024 23:10:00 -0700
 Subject: [PATCH] include missing pty.h header for openpty()
@@ -18,9 +18,11 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  main.c | 1 +
  1 file changed, 1 insertion(+)
 
+diff --git a/main.c b/main.c
+index f9d0d14..dac48d7 100644
 --- a/main.c
 +++ b/main.c
-@@ -89,6 +89,7 @@
+@@ -68,6 +68,7 @@
  
  #define RES_OFFSET(field)	XtOffsetOf(XTERM_RESOURCE, field)
  
diff --git a/meta-oe/recipes-graphics/xorg-app/xterm_411.bb b/meta-oe/recipes-graphics/xorg-app/xterm_412.bb
similarity index 95%
rename from meta-oe/recipes-graphics/xorg-app/xterm_411.bb
rename to meta-oe/recipes-graphics/xorg-app/xterm_412.bb
index 5398bfbe05..c0e4e8c95d 100644
--- a/meta-oe/recipes-graphics/xorg-app/xterm_411.bb
+++ b/meta-oe/recipes-graphics/xorg-app/xterm_412.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://xterm.h;beginline=3;endline=31;md5=413ff95100710d7a81
 SRC_URI = "http://invisible-mirror.net/archives/${BPN}/${BP}.tgz \
            file://0001-include-missing-pty.h-header-for-openpty.patch \
           "
-SRC_URI[sha256sum] = "969be283670deadd66934865c4de6c5ab045e3a3facc2b228decf91a20d8c36c"
+SRC_URI[sha256sum] = "b48bc780c1cbc14f6d89269f7e593712af6095876960d650be28b55e5dad65a6"
 
 PACKAGECONFIG ?= ""
 PACKAGECONFIG[xft] = "--enable-freetype,--disable-freetype,libxft fontconfig freetype-native"
-- 
2.47.3

