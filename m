Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DFE9C5DF81
	for <webhook@archiver.kernel.org>; Sun, 23 Aug 2026 11:52:38 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12922.1787485952112171583
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 23 Aug 2026 04:52:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=pHyKK3/j;
 spf=pass (domain: gmail.com, ip: 209.85.216.46, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-38e88b60121so1887211a91.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 23 Aug 2026 04:52:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787485951; x=1788090751; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Q5L5h5ZvycfaqGQ1FogQ79IltVxeV6RNbRx0E7s4lB0=;
        b=pHyKK3/j+j/7ZdSu0orl3MnFc09LN0LhrY84Lku25s++8DY9qdzo8rqXXRbr1MYhcz
         TzLJd+p8NkHhhINhzEVAJAT7iPveNJC5H/JSNIPoAoCqtnUcbfXkJvSwLs1uZNGD1m8j
         0A0l20DPjptNNga9XJ1kPW2DieaF1D6p5aAlZOMaEWBcQ9LGgsj5DaPnH6yg3N82C+vi
         rfad+bd8L7SyCqHqM4wS4Sfy0UHRlexH9QmICGrbP4jC717foowMHHEJ+hztyaaif2yo
         ROesXPtdy1p3WULqf5PdWwgrWoPc1Epfi27poEv3bkJYAShQNzrZIiTFQNa+GO8hROhb
         1H8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787485951; x=1788090751;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Q5L5h5ZvycfaqGQ1FogQ79IltVxeV6RNbRx0E7s4lB0=;
        b=KuA5VVmPn3JsuqFX7QcztP3JbYg2k97wb54djNd4yoxOHvNr8MzK3hz9gS/YboMj74
         +ueIE1qoQZPg6AMu2Z8ijHDD1Q4bIgr3ke0w7bENEe1kgkm3Pi+Q/mgaldQZPwf0NHNE
         G7nJ79e6PJ3sZuerNMRU8RJrUOR+t+oeTGZO0f6rK7hMhUovQhohge7lavp6g9by08g6
         Yp2mv29ZS4VHJK6DE/ZOVu0/oQ2BAzgXFDm/X7NHrMN4DikFNxWWYdOytYgfVkKOo303
         DDm7HE3oowNN29tJI+eYoLesfL3+NC9qQk6nTHmKCzYz/FqC2LAlIC6C9jiNaXmjKP4O
         KzXQ==
X-Gm-Message-State: AFuF++lMRyfc6HWgbmPj7cruoPBpgE57AcGxCO9Fc+sXOXCRGhH2LLqE
	eWBvkQFcHWiKWXs+C3zgHNsxEzY7DTPTIOZpwXbLtTj7RK7RYg/aNTv4t1KkVA==
X-Gm-Gg: AR+sD12T1dltfrLMCJQeejDsJX07IEKXxIYRwEHcctMBvy3sU/2ZXk6UEuU7BeN+g74
	N7dR9OzChKjM7/FDCKP5QF843V+xl2pNnPlxf64lWKq2usJS2NIWollQzf3an5Q2KtcYC8QAGTq
	Iv0V00RLxXmT+7m5awH/h4KzLXLBRri/20TDuE15QgKEi2KOcoPLJlNrqt3NJ5qLFs3VUjPP6YM
	a7JzdjK20mBP08h6Q+mALX0ZEEnDXsF35slLRpQI5Gorp/F7EhXD4jaKY4wpZRXJTusz77CkEjv
	CxqqEeo2ss3afGxuRBXZmt9Uz9pE2pJEvFOqOIfGnwYQUrsISzxt4zItTocYElYFcIvujiarAkC
	ESoeOv4JZx5LLLXwovUWDhTFwd7gTigW4/HmYj702EjLJQh8T+l/F9AjHDjknkZKo2x/uRtPK6D
	EgRFWIyrX9rfOZHVhEiHD1KUoKKqtPtSeIshYUop5wUljFhW3+rZTe2c/iGENwiDl2VsSLC+qw7
	h1VyCsPgucz
X-Received: by 2002:a17:90b:4d0e:b0:38e:659b:f366 with SMTP id 98e67ed59e1d1-395decb87edmr15947641a91.0.1787485951546;
        Sun, 23 Aug 2026 04:52:31 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-395e494fa7esm5793398a91.1.2026.08.23.04.52.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Aug 2026 04:52:31 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Khem Raj <khem.raj@oss.qualcomm.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-gnome][wrynose][PATCH 10/20] gvfs: upgrade 1.60.0 -> 1.60.1
Date: Sun, 23 Aug 2026 23:51:48 +1200
Message-ID: <20260823115158.1582363-10-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260823115158.1582363-1-ankur.tyagi85@gmail.com>
References: <20260823115158.1582363-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 23 Aug 2026 11:52:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129444

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
* smb: Fix authentication fallback broken with Samba 4.24
* dav: Fix redirect handling to prevent HTTPS downgrade and credential leakage
* Some other fixes
* Translation updates

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit 2f0fd5faeb0468de2f09cea7665df9649876d7e7)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../recipes-gnome/gvfs/{gvfs_1.60.0.bb => gvfs_1.60.1.bb}       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/gvfs/{gvfs_1.60.0.bb => gvfs_1.60.1.bb} (97%)

diff --git a/meta-gnome/recipes-gnome/gvfs/gvfs_1.60.0.bb b/meta-gnome/recipes-gnome/gvfs/gvfs_1.60.1.bb
similarity index 97%
rename from meta-gnome/recipes-gnome/gvfs/gvfs_1.60.0.bb
rename to meta-gnome/recipes-gnome/gvfs/gvfs_1.60.1.bb
index 2fda7cff75..7dca3cd3b9 100644
--- a/meta-gnome/recipes-gnome/gvfs/gvfs_1.60.0.bb
+++ b/meta-gnome/recipes-gnome/gvfs/gvfs_1.60.1.bb
@@ -18,7 +18,7 @@ DEPENDS += "\
 RDEPENDS:${PN} += "gsettings-desktop-schemas"
 
 SRC_URI = "https://download.gnome.org/sources/${BPN}/${@gnome_verdir("${PV}")}/${BPN}-${PV}.tar.xz;name=archive"
-SRC_URI[archive.sha256sum] = "648273f069e92c7e3c013b92148e82c901f08044e2b3b14c6cfbd52269f6b646"
+SRC_URI[archive.sha256sum] = "90eaba333ab7d31a7fdeade45954a513c3661ccebbd9a138aab3fb481dfb9e40"
 
 ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
 

