Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
 by mx.groups.io with SMTP id smtpd.web11.20571.1600613458523978679
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 20 Sep 2020 07:50:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=gW7Wu6tW;
 spf=pass (domain: gmail.com, ip: 209.85.218.47, mailfrom: schnitzeltony@gmail.com)
Received: by mail-ej1-f47.google.com with SMTP id gr14so14361121ejb.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 20 Sep 2020 07:50:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=K6Cj5Lo7p0KryVWaIMmOx9y3TGQ98cdxCMEkTZp9xZ8=;
        b=gW7Wu6tWTr9G/aWPIVJUvMmjJ5sAPCuY3U4e7aZTNZViU6yNU56clWgETTfyL9fHob
         A/48tZ7FflQb5maJmdOEYpo3HeQzuz5o7UELPRcV/YunW61lUt3fYBROmSKWLmydOZN3
         KTeW0QXJ8Q34mlXcREWjSLXeQEqBbql2gGuJgGZXm6eU/PPn/duwxnMfj09cXJyP7y02
         AREb0GGWkVN5sGtAFY+BGw2v5Vdurp1qfLLP9IytEdQqAqYt4LeyfFRRcW7UdLv+Od2q
         ErwvOjAvrELNU+g60PinsqOHPUvgQvcVfyxjHTqqalmfy/kjYEmgEQLnPlMwl0hFCiSg
         lyuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=K6Cj5Lo7p0KryVWaIMmOx9y3TGQ98cdxCMEkTZp9xZ8=;
        b=R7WaUHV6stPF32v7J/bg+j0B+IBPRhyJiyg6ajEPmfj/MeCpoJBvz57cqUQFxGoZbJ
         W+qY01Y4Tj/G44l/cC7PrGxrpht4V3aI8HSm2bOGqAX2nj/Z866lW3Fgr0ActzPL7GeZ
         KnjgKVeyv+lbgBfsaIP+51OrjaUiwmD6QrL+KJiEDAS1i1eyTY2mLki+QDftwadCIL2V
         IBV4TlWwro5+LqgE5DjRGKTQR2zewkbJizcF1VSwtY3TRpYuUuPb6WyLRmmwUF6D+V7W
         1KsHs2D5bk7HJgJRd3urPFyLxECFEEFBRMRdnZxU/VJruPGKzyEMDyOpuEF7BzwkBUya
         u5WQ==
X-Gm-Message-State: AOAM531nx+G4LA6iQoPLaZbIyjjdBGyzOTsx/fi/u6NsPKl6CbxbNsLt
	Z6vknzVuGWLp3qdVXibf7ZbvEmGnUdg=
X-Google-Smtp-Source: ABdhPJxQtsdb/60gZo/PfvHOJgv2w8lkjwZ3oPWfKIGIbvtnx9YPZd2w4L3yX7Wn3nzh4ApEggK4gA==
X-Received: by 2002:a17:906:cc8d:: with SMTP id oq13mr44823951ejb.280.1600613456496;
        Sun, 20 Sep 2020 07:50:56 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300f07f33b24861ef8a9f58bb5121.dip0.t-ipconnect.de. [2003:f0:7f33:b248:61ef:8a9f:58bb:5121])
        by smtp.gmail.com with ESMTPSA id m10sm6785777edf.11.2020.09.20.07.50.55
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2020 07:50:55 -0700 (PDT)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 08/11] gjs: upgrade 1.58.7 -> 1.58.8
Date: Sun, 20 Sep 2020 16:50:36 +0200
Message-Id: <20200920145039.2240-8-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200920145039.2240-1-schnitzeltony@gmail.com>
References: <20200920145039.2240-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Version 1.58.8
--------------

- Various backports
  * 1.63.3: test suite is failing [Philip Chimento]
  * Various fixes for potential crash and memory issues [Philip Chimento]

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta-gnome/recipes-gnome/gjs/{gjs_1.58.7.bb => gjs_1.58.8.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-gnome/recipes-gnome/gjs/{gjs_1.58.7.bb => gjs_1.58.8.bb} (87%)

diff --git a/meta-gnome/recipes-gnome/gjs/gjs_1.58.7.bb b/meta-gnome/recipes-gnome/gjs/gjs_1.58.8.bb
similarity index 87%
rename from meta-gnome/recipes-gnome/gjs/gjs_1.58.7.bb
rename to meta-gnome/recipes-gnome/gjs/gjs_1.58.8.bb
index 58342b6c2..dbb04ef8e 100644
--- a/meta-gnome/recipes-gnome/gjs/gjs_1.58.7.bb
+++ b/meta-gnome/recipes-gnome/gjs/gjs_1.58.8.bb
@@ -11,8 +11,7 @@ DEPENDS = "mozjs gtk+3"
 
 inherit gnomebase gsettings gobject-introspection vala gettext features_check upstream-version-is-even
 
-SRC_URI[archive.md5sum] = "c8c530d4593133f496ae69098273a675"
-SRC_URI[archive.sha256sum] = "2014509019ea4e7a8ab8e0dd0c472bbcf0ad3067928af88c29f5e2879c58c7a9"
+SRC_URI[archive.sha256sum] = "7fb3eb746c17363d9ee47f4a5d0bb048f0075611763eb0da11d85e0e57aff381"
 SRC_URI += "file://0001-Disable-tests-on-host.patch"
 
 # gobject-introspection is mandatory and cannot be configured
-- 
2.26.2

