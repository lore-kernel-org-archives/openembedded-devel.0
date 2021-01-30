Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
 by mx.groups.io with SMTP id smtpd.web11.4771.1612018673861765837
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 30 Jan 2021 06:57:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Zh5WJ/UV;
 spf=pass (domain: gmail.com, ip: 209.85.218.43, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f43.google.com with SMTP id ke15so17318226ejc.12
        for <openembedded-devel@lists.openembedded.org>; Sat, 30 Jan 2021 06:57:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=mEm0YcnsMUmSbW4GDNZfkfmSWjxJSW5+oJ4nbReF14U=;
        b=Zh5WJ/UVKc+HyXZCAXmsRPN0Al4ypSraPXGHZFeiSeEMxvcE4KT8W3tl+FWHJd7urZ
         WNwV6NvGfunr8hmoKmKI3y69wHZX+gnaNDn567ynksaHV7K9jTSzXQvGQlT2LM7pbj0R
         ad6pi0Y0fQr3Y4+iWjRmet3oX7eKxtBgv4ZDzaY7lijZfQm303ZQ5cLLjZk7LA/iwLIj
         OXVpWYnfmULnW23eKmNF2Ef+c0uIiVglZAeaUxhGqR3yIZGVz0y3hDH7WoMldIIoabX5
         6B0ePagZl5hx3v0mChlklgtuhKQSAf0LakqMjkP6eO2EPJzONlC+iNNVqlILNi14bI3A
         uVDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=mEm0YcnsMUmSbW4GDNZfkfmSWjxJSW5+oJ4nbReF14U=;
        b=Q6AFTaaoA4D0Jga6ErQ7gMWQPk7fvImDcJWET0951pT1rMo2sAVaaxe8KQ0UMC/ird
         3O3Lv/vEld0qQaIyd/WPStI4pp20MNOENMTj3JvKsFSRN60bL0Q1XDF1YkiRvo+Tip6S
         bMtE9NBpLSk4vwjaGYK1oke4z8ylq6NFFvhohDXYTiFBgcULyJgSX+SYKlhg3yecjdyV
         0Dx/cp8dZgn3iIhLYzDFXn25HP5ZdhokX/FN+2HZaF5Ca0svKEsdUyl4RCI7u/4Rjyox
         tM4qPBS3FnTgEyTU0N0T0vK3N7zJm0FH9eztLjqVKIAMF9vmDlBrAzIl1yPQzf792cVp
         p6Bw==
X-Gm-Message-State: AOAM530GsjVzNWofhedKkX8/mkzLnskaSDQAUZLVZ87w0gyVcFZT/nQL
	Irhr7aPnGg4nwu4RKQMTt9dQ1tfbC1U=
X-Google-Smtp-Source: ABdhPJwaxex7W8xtWz7GAy0dJoPKaS9/PUrbJQcdqiXQoO62NFMb1yj7A2RrvE/SLfkCYCSAnbN1tg==
X-Received: by 2002:a17:906:3fc4:: with SMTP id k4mr9168270ejj.137.1612018672268;
        Sat, 30 Jan 2021 06:57:52 -0800 (PST)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id m8sm6155494eds.70.2021.01.30.06.57.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Jan 2021 06:57:51 -0800 (PST)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 1/2] zbar: fix random do_prepare_recipe_sysroot_gettext failures
Date: Sat, 30 Jan 2021 15:57:45 +0100
Message-Id: <20210130145746.9502-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

* do_prepare_recipe_sysroot task is added as:
  addtask do_prepare_recipe_sysroot before do_configure after do_fetch
  which doesn't ensure that  directory is created
* we can run this task as "after do_unpack", but it's just easier to run
  it in do_configure_prepend without the need for extra task
* fixes:
  zbar/0.23.1+gitAUTOINC+89e7900d85-r0/temp/run.do_prepare_recipe_sysroot_gettext.30306' failed with exit code 1:
  install: target 'zbar/0.23.1+gitAUTOINC+89e7900d85-r0/git/' is not a directory: No such file or directory
  WARNING: exit code 1 from a shell command.

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-support/zbar/zbar_git.bb | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-support/zbar/zbar_git.bb b/meta-oe/recipes-support/zbar/zbar_git.bb
index dae9122520..5cb7baae33 100644
--- a/meta-oe/recipes-support/zbar/zbar_git.bb
+++ b/meta-oe/recipes-support/zbar/zbar_git.bb
@@ -53,7 +53,6 @@ CPPFLAGS_append = "\
 
 TARGET_CXXFLAGS_append = " -fPIC"
 
-do_prepare_recipe_sysroot_gettext() {
-        install -m 755 ${STAGING_DATADIR_NATIVE}/gettext/ABOUT-NLS ${S}/
+do_configure_prepend() {
+    install -m 755 ${STAGING_DATADIR_NATIVE}/gettext/ABOUT-NLS ${S}/
 }
-addtask do_prepare_recipe_sysroot_gettext after do_prepare_recipe_sysroot before do_configure
\ No newline at end of file
-- 
2.27.0

