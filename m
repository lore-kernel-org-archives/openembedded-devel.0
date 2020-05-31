Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.web11.18021.1590941804321205752
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 31 May 2020 09:16:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=DLLGnlrL;
 spf=pass (domain: gmail.com, ip: 209.85.216.50, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f50.google.com with SMTP id ci21so3952535pjb.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 31 May 2020 09:16:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=YpxWOq9IIGU9GrU3JEsjB1SAoKlptV+rcvdJ2fZ3INk=;
        b=DLLGnlrLL9/GhvK/mRIcRzHHqEXbNsH/FAUtijjXnWjgTmPROvmpfZD1+ZQiIO9F+U
         +b5XjkYdkI9Ouq0Q0kHrqySwQcR+25gsc6FF6cvCZYLrKUcKTApijD9aoy7wndNbdumC
         g7gYy1QGGsU6wS42/laF1vw3y8p1FM7m653RSd59by7QFxHJZUF+mB2VDSJELuo1P2xb
         nptDhE/pfpnI9F3vNcah7FVZhcm7SC29QGfCjnrP3tTjV+4K22bYLUZCU9yJnVgPLY0D
         0MrVz42FsA8rfuB1DsYzcZBoFC0sFdEbnPeBmu1vC+ssBPT8RC8XHxkAznBzVzT4dd7c
         ldjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=YpxWOq9IIGU9GrU3JEsjB1SAoKlptV+rcvdJ2fZ3INk=;
        b=ZLPkxrmyLxTHQ7spvZwUZDYAdTys7+oytLFqc7Y66LC8SpgoLjO6U231zBJex909BI
         R0oXdHnVW/zZI+AE4lOMgBuvLOP7eWRS8jQmE6d/hzqHc/yAgEyghdSeP+muFaVexg+1
         6RzkGTSCAn75peNrvufwHWtejnwwTUorrQ2cQ6OBlu7SoBdtn4JuF2I8M6gomYyzlRwX
         1LyBNsqHJnpujL7L9WPrgmuj18rVKP0RFkGpbb+oGg36RCxznTw3KC53feuNYxa4fqLf
         oMZOBJ6Mo7Xfe/P1GFD3MWAfuPivTP6sx0vm+KDyhLfx1UcTe70PQstjJj1SmH8yuPm5
         C36w==
X-Gm-Message-State: AOAM533wIggsakNkV7zGpxSogeoddhnFzBFj9kw/DCDvcfarXbCXvV5h
	CcvulXlrzLkVDwHCH6+DzhwwYjVx
X-Google-Smtp-Source: ABdhPJzr4IG2s+SyJWohqS+jLNo8jVFb9GH9cw3aIWn0OUbQuOi7d39MUnV47amzUDOVjtRaMkqKdg==
X-Received: by 2002:a17:90a:3d49:: with SMTP id o9mr17820985pjf.26.1590941803744;
        Sun, 31 May 2020 09:16:43 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net ([2601:202:4180:a5c0:936:376a:3aad:6139])
        by smtp.gmail.com with ESMTPSA id b16sm9188871pfd.111.2020.05.31.09.16.42
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 May 2020 09:16:42 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfell 15/35] openldap: upgrade 2.4.49 -> 2.4.50
Date: Sun, 31 May 2020 09:16:02 -0700
Message-Id: <47c72b2b8498c058d2cbf8dfd06280f374656155.1590941674.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1590941673.git.akuster808@gmail.com>
References: <cover.1590941673.git.akuster808@gmail.com>

From: Wang Mingyu <wangmy@cn.fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 8398669b9d423d13a086160af48e0a1185c9644f)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../openldap/{openldap_2.4.49.bb => openldap_2.4.50.bb}       | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/openldap/{openldap_2.4.49.bb => openldap_2.4.50.bb} (98%)

diff --git a/meta-oe/recipes-support/openldap/openldap_2.4.49.bb b/meta-oe/recipes-support/openldap/openldap_2.4.50.bb
similarity index 98%
rename from meta-oe/recipes-support/openldap/openldap_2.4.49.bb
rename to meta-oe/recipes-support/openldap/openldap_2.4.50.bb
index 670c704e6f..b62b13a443 100644
--- a/meta-oe/recipes-support/openldap/openldap_2.4.49.bb
+++ b/meta-oe/recipes-support/openldap/openldap_2.4.50.bb
@@ -25,8 +25,8 @@ SRC_URI = "http://www.openldap.org/software/download/OpenLDAP/openldap-release/$
     file://remove-user-host-pwd-from-version.patch \
 "
 
-SRC_URI[md5sum] = "2a47a6bb4319357ea7b032c45283e79e"
-SRC_URI[sha256sum] = "e3b117944b4180f23befe87d0dcf47f29de775befbc469dcf4ac3dab3311e56e"
+SRC_URI[md5sum] = "f9ed44ef373abed04c9e4c8586260f9e"
+SRC_URI[sha256sum] = "5cb57d958bf5c55a678c6a0f06821e0e5504d5a92e6a33240841fbca1db586b8"
 
 DEPENDS = "util-linux groff-native"
 
-- 
2.17.1

