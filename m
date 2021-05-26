Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.web10.6280.1622029988383303045
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 26 May 2021 04:53:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=HoDnR2Cv;
 spf=pass (domain: gmail.com, ip: 209.85.216.47, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f47.google.com with SMTP id o17-20020a17090a9f91b029015cef5b3c50so176759pjp.4
        for <openembedded-devel@lists.openembedded.org>; Wed, 26 May 2021 04:53:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=EyBaNgy39MDPpcDm/fYx62Aujjqjw4Kgu5vPzpCg60Y=;
        b=HoDnR2Cv0VIPFFPH6VLcBT3FgasKfkGZr2tGWCAul2qkhDGjpEGnIwPJw1pbQ75gUR
         Pqw8njajctVnJ+6S/8D4ycFm0j6z1Pd/9Px5ZH6oJK7vsDEv8C4IG79oYqOPD2JdENjf
         XirfduC48gYCwPoWefW7Tk3wa8VDhIhF9l1+qW6D7nVvRirqC/huMyXQDL45auw+UW/L
         WUHdPCnhUCcGEHe1ywdkgfFnUFk0eJDsGMxyxLhxQisVAtbWG2JjZLbRauvpLQB9lB7Q
         ANhC7m4r9alccdttSrXzvigJGvqtazsYHre3B63YIOAU0KEndJ+pPFzT9G0MNhNDkQOM
         d3Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=EyBaNgy39MDPpcDm/fYx62Aujjqjw4Kgu5vPzpCg60Y=;
        b=fRHPTNdFz1Dbc+QDD2NIBdalvKHTJXK770z1tHP6mOYaBhdGt898qbJ8s8polyxa2c
         /HVpZfkClEaJfB1RqsnyM30IM3rY9n+SxxmFngWfbjFe9/sIIxk14S/rEz3ADUglZefP
         oSL67uCkrqgfWuj+DadouiUfffLIjDjiXwp7wl0gglSyggBDZBs6F3ts+tEMo3X6gBf2
         iV113x9w7AYmSXZPQHNW2TevZ980dIUTL9kUhnB4pr8f7GcScfsNkw56+koDZJrJCl22
         UKvw56AzYWyDeQk0yVZLg9XNq8FwfpfceNsRXwgWxJ8WeR3+JR910uenKBOVxImeKLsr
         TfXQ==
X-Gm-Message-State: AOAM531lEP3iVOcn/CCY+QmF5afWPPfLCEmhvYogtreas+mX2b1i1W+d
	Qtns3JYvQurqvkd0m5Oo46w8Bhf+3WV0Dw==
X-Google-Smtp-Source: ABdhPJzsqBhu9dWc59AiquOKkwwFrqrkIR1ulC4OXvuiSIJj93R7/LHPVrmbsYwM9vn/DUQQSCMJkg==
X-Received: by 2002:a17:90a:7a89:: with SMTP id q9mr3521469pjf.0.1622029987391;
        Wed, 26 May 2021 04:53:07 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:68d3:e59c:b64:76e3])
        by smtp.gmail.com with ESMTPSA id h22sm15408818pfn.55.2021.05.26.04.53.06
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 May 2021 04:53:07 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [harkknott 22/23] libgtop: tidy up recipe
Date: Wed, 26 May 2021 04:52:37 -0700
Message-Id: <280a7a169266c450da7366c46e73d0bf5b4a7930.1622029873.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1622029873.git.akuster808@gmail.com>
References: <cover.1622029873.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Andreas Müller <schnitzeltony@gmail.com>

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 55c0d740bc3553005b8a9e79b172231142c30d20)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-gnome/recipes-gnome/libgtop/libgtop_2.40.0.bb | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/meta-gnome/recipes-gnome/libgtop/libgtop_2.40.0.bb b/meta-gnome/recipes-gnome/libgtop/libgtop_2.40.0.bb
index f0c9cdb0e2..63615e4331 100644
--- a/meta-gnome/recipes-gnome/libgtop/libgtop_2.40.0.bb
+++ b/meta-gnome/recipes-gnome/libgtop/libgtop_2.40.0.bb
@@ -1,4 +1,4 @@
-SUMMARY = "LibGTop2"
+SUMMARY = "A library for collecting system monitoring data"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
 
@@ -8,9 +8,6 @@ inherit gnomebase lib_package gtk-doc gobject-introspection gettext upstream-ver
 inherit features_check
 REQUIRED_DISTRO_FEATURES = "x11"
 
-SRC_URI[archive.md5sum] = "c6d67325cd97b2208b41e07e6cc7b947"
 SRC_URI[archive.sha256sum] = "78f3274c0c79c434c03655c1b35edf7b95ec0421430897fb1345a98a265ed2d4"
 
 DEPENDS = "glib-2.0 libxau"
-
-EXTRA_OEMAKE += "LIBGTOP_LIBS="
-- 
2.17.1

