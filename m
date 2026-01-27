Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7FF4D2F024
	for <webhook@archiver.kernel.org>; Tue, 27 Jan 2026 13:01:29 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10488.1769518887919071499
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Jan 2026 05:01:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FKhArpbE;
 spf=pass (domain: gmail.com, ip: 209.85.221.45, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-4359a302794so3530474f8f.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 27 Jan 2026 05:01:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769518886; x=1770123686; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y77fuELwynhYl1jUHnTdqJUwEpcpdB/u+hfmTdvigCk=;
        b=FKhArpbE5MubUnE+sz0bpOT1gwC3hLi8TCXR4VVetRAtaslUwV1EJ+CF+iczzMmoR7
         sCHBMa4/PbZZFOioJyqWedn1JIytHHVYJpw7KLdDW/c+TdlY4V+WV0oV98oqv843uWgH
         xbtIrgRKNW3RMpzah30ndPku+meUhr1qBJUloRmN8Lp3Oioio4BVWjpZcPJ1Lw3n/+1F
         ALay9SXIBkcak1hDG6j6I9mQ3Au6izf7DLeHcWEnT8GeH8yXDoGRSbvTr1jRJg7ddvmx
         OyrvP0D4yUxM+XC1uaLWvvZ6bz7p9bO8zZtWjlR9+CAvazLBuLP/Jx4pr6cFbBDDI5BZ
         42Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769518886; x=1770123686;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=y77fuELwynhYl1jUHnTdqJUwEpcpdB/u+hfmTdvigCk=;
        b=DMbqg7JxvS3mVGENFWlXsB8c4CfTjqTgF+GIQT8gG4n0quyJhKldvQtyGK9L7lW4fj
         4nbS70V0orTegtptnt6t192XWnczsumwjyVfMGWEawlRE9X6ROcdLyQhNYr3FpmUbqZY
         9ylJtoWdYYXcqnW7QqnY6uq9hyd+8DAfpbbqxoYT4O22Ka6Bg8SUJdxe9puxM+e/LOQH
         tZX73Y9tH4tZnzY6jVfayLN88KfwyMWtfnorTKoauEiEwBxZlAD0mZSwdGPw3Ut2nb2j
         VEBO+zCh26RylzAd+BIer0ppDUlzNJ4+0sJLPbo8W1nOsuNnfbdoiuVcbBpiuHQmpALu
         Vllg==
X-Gm-Message-State: AOJu0YzbVVKDsDM3p2yJmLWI92Lg+wK63GElyn88AdL8yVyRvQVT8Jjj
	YQZa4uU97MklujZlnxl77BCNw17P8C+lLzQdahbTQ1gHn3+d7Zo5tk51zPbc5Q==
X-Gm-Gg: AZuq6aIVeQSsy+RLwTn+aO7hT0N7UsJ4gm1OwtErpMa+usNsd6ouT9grOrG2NfEyoPB
	fuzK3/au+d8MYtjS8sGefbeNRZt3ToueS4htFtatWWuTD5jk0h475Qt5CPW98GkIotx0HhhEjY3
	0GHQr99X95N/1+rTvG2v1Ke3Cj23+YxORS8iXvfah6FzGYWlNTxhNzzrdCkkXfXQ9KAbVCdKTUZ
	ngtM1ctaADtFAnXZqLw+F2/mHczfH3iH1sb5puGefsQbmKw3l8iNw43isOUfJjJiJp5Qd2feSZp
	buolKpEUZfqra+Tm5pS/A42Y7pdIYtvA4GUWayW6znwEctGHhbd2MP2WpvhyUegEdY180Hums9q
	AbdYCDIM51qzZB+4osQd/UFv4E2KqW7A6EQyj+UsZBSJcbpGXFRSjFsMhhMEDv7S16ZphFtVhpf
	cqNSgnyKf1
X-Received: by 2002:a05:6000:22c9:b0:435:a9ad:d21a with SMTP id ffacd0b85a97d-435dd0b6a13mr2666726f8f.40.1769518886133;
        Tue, 27 Jan 2026 05:01:26 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435b1c24a8asm37671577f8f.12.2026.01.27.05.01.25
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 05:01:25 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][scarthgap][RFC PATCH 09/14] tigervnc: patch CVE-2025-26596
Date: Tue, 27 Jan 2026 14:01:09 +0100
Message-ID: <20260127130116.1902238-10-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260127130116.1902238-1-skandigraun@gmail.com>
References: <20260127130116.1902238-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 27 Jan 2026 13:01:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123948

Details: https://nvd.nist.gov/vuln/detail/CVE-2025-26596

Pick the patch that mentions the CVE ID explicitly in its commit message.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../tigervnc/files/CVE-2025-26596.patch       | 51 +++++++++++++++++++
 .../tigervnc/tigervnc_1.11.0.bb               |  1 +
 2 files changed, 52 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/tigervnc/files/CVE-2025-26596.patch

diff --git a/meta-oe/recipes-graphics/tigervnc/files/CVE-2025-26596.patch b/meta-oe/recipes-graphics/tigervnc/files/CVE-2025-26596.patch
new file mode 100644
index 0000000000..af7be3c664
--- /dev/null
+++ b/meta-oe/recipes-graphics/tigervnc/files/CVE-2025-26596.patch
@@ -0,0 +1,51 @@
+From 2bc545d09abfe1e91cc15990232649ab8ce5c8b3 Mon Sep 17 00:00:00 2001
+From: Gyorgy Sarvari <skandigraun@gmail.com>
+Date: Thu, 28 Nov 2024 11:49:34 +0100
+Subject: [PATCH] xkb: Fix computation of XkbSizeKeySyms
+
+From: Olivier Fourdan <ofourdan@redhat.com>
+
+The computation of the length in XkbSizeKeySyms() differs from what is
+actually written in XkbWriteKeySyms(), leading to a heap overflow.
+
+Fix the calculation in XkbSizeKeySyms() to match what kbWriteKeySyms()
+does.
+
+CVE-2025-26596, ZDI-CAN-25543
+
+This vulnerability was discovered by:
+Jan-Niklas Sohn working with Trend Micro Zero Day Initiative
+
+Signed-off-by: Olivier Fourdan <ofourdan@redhat.com>
+Reviewed-by: Peter Hutterer <peter.hutterer@who-t.net>
+(cherry picked from commit 80d69f01423fc065c950e1ff4e8ddf9f675df773)
+
+Part-of: <https://gitlab.freedesktop.org/xorg/xserver/-/merge_requests/1830>
+(cherry picked from commit b4293650b50efe7832cf9eac71217ad8d6341e02)
+
+CVE: CVE-2025-26596
+Upstream-Status: Backport [https://gitlab.freedesktop.org/xorg/xserver/-/commit/b4293650b50efe7832cf9eac71217ad8d6341e02]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ xkb/xkb.c | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/xkb/xkb.c b/xkb/xkb.c
+index 68c59df02..175a81bf7 100644
+--- a/xkb/xkb.c
++++ b/xkb/xkb.c
+@@ -1093,10 +1093,10 @@ XkbSizeKeySyms(XkbDescPtr xkb, xkbGetMapReply * rep)
+     len = rep->nKeySyms * SIZEOF(xkbSymMapWireDesc);
+     symMap = &xkb->map->key_sym_map[rep->firstKeySym];
+     for (i = nSyms = 0; i < rep->nKeySyms; i++, symMap++) {
+-        if (symMap->offset != 0) {
+-            nSymsThisKey = XkbNumGroups(symMap->group_info) * symMap->width;
+-            nSyms += nSymsThisKey;
+-        }
++        nSymsThisKey = XkbNumGroups(symMap->group_info) * symMap->width;
++        if (nSymsThisKey == 0)
++            continue;
++        nSyms += nSymsThisKey;
+     }
+     len += nSyms * 4;
+     rep->totalSyms = nSyms;
diff --git a/meta-oe/recipes-graphics/tigervnc/tigervnc_1.11.0.bb b/meta-oe/recipes-graphics/tigervnc/tigervnc_1.11.0.bb
index 1b6b965fc7..e97f82f6e7 100644
--- a/meta-oe/recipes-graphics/tigervnc/tigervnc_1.11.0.bb
+++ b/meta-oe/recipes-graphics/tigervnc/tigervnc_1.11.0.bb
@@ -28,6 +28,7 @@ SRC_URI = "git://github.com/TigerVNC/tigervnc.git;branch=1.11-branch;protocol=ht
            file://CVE-2025-26594-1.patch;patchdir=${XORG_S} \
            file://CVE-2025-26594-2.patch;patchdir=${XORG_S} \
            file://CVE-2025-26595.patch;patchdir=${XORG_S} \
+           file://CVE-2025-26596.patch;patchdir=${XORG_S} \
 "
 
 # Keep sync with xorg-server in oe-core

