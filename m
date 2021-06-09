Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.web11.4427.1623220727544399856
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 08 Jun 2021 23:38:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=S+FExCaT;
 spf=pass (domain: gmail.com, ip: 209.85.218.46, mailfrom: schnitzeltony@gmail.com)
Received: by mail-ej1-f46.google.com with SMTP id k7so36598983ejv.12
        for <openembedded-devel@lists.openembedded.org>; Tue, 08 Jun 2021 23:38:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=fKa0UongH7ug4iCoHWFD8qDX1h3c2dok4MRV7fVsRwM=;
        b=S+FExCaTEVZQKkxB2Hf4UyblMA4mGs+Yyh2d4pXMUmDfA11dhBvCKfVMB8gr5wqkvW
         nlFOKjKxQEKjCLMroe0gCbB9N0QBlxxJdNU9bBNaQ248Kkni/4VGEdyArCRT9KFPm77o
         vhscDbrt73u4OpCB9iJmBIi26LBOVLIMzLt/38ldisOELfduygzakTKEiPoTAvdJ1thz
         speTGssmVwu6g/Osbr3LbgAO0h5qxnf62NpKavMRgEuhMe94AbjXhcj1t5K+ZKeqaF6B
         Tt1hllDzFuSHYLQNDlLGelZNNKcqdo4zGb3YKksz3FBcBjAhR3OmF/WWfvg56itej7Zj
         1p1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fKa0UongH7ug4iCoHWFD8qDX1h3c2dok4MRV7fVsRwM=;
        b=VdryBbP/ZvInQuNcJXJEoukQjTcu3BtBUbQa4n5oMTIo3/481mUr2Oqv1UqWS0xtI7
         jzbqvJV//S0uBVRQqpl0nkBvmmgW4CxYSHgJcWuVSKF3QIagP6Y5VgKTq8dDVlax/euo
         3H9melFF98JxV204IDS72MR9f0pKBJX/h4mHgTg/y472Flq1AfPUEx+O6mwbh1U9WwOT
         NQuKJ3NcIc1EXcHxJSWOAKArgeKa7glP8Irol4zXNAmzCkLZ7yOsQORcJFvP7JtNw6gC
         B2ORQyvwYNRVdm4FedtJhAYjYEFLxtRfRvDDMGQlWQg2FEjJI7zi1lkA9irnXvmw5eLj
         Bcog==
X-Gm-Message-State: AOAM531rUaC+5O3RLkGKly643vxKvyoikMc8xAQD2JH9fufuhVfvbMmc
	J/Yt91kn224HdEzbHGQ5IIEBVLNQ/J2HtQ==
X-Google-Smtp-Source: ABdhPJzrYTaaraiLXpzkhFQGi2HLKXQHkTUhM0nidratsKCZT9ItegN/mEsUsY5cQV/2YCio1lgNog==
X-Received: by 2002:a17:906:c1d2:: with SMTP id bw18mr26892010ejb.123.1623220726126;
        Tue, 08 Jun 2021 23:38:46 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from thanks-buchmuellers.speedport.ip (p200300f07f297e89b85a8a6897bdbe62.dip0.t-ipconnect.de. [2003:f0:7f29:7e89:b85a:8a68:97bd:be62])
        by smtp.gmail.com with ESMTPSA id o4sm690810edc.94.2021.06.08.23.38.45
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jun 2021 23:38:45 -0700 (PDT)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 05/28] file-roller: upgrade 3.38.1 -> 3.40.0
Date: Wed,  9 Jun 2021 08:38:08 +0200
Message-Id: <20210609063831.3400611-5-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210609063831.3400611-1-schnitzeltony@gmail.com>
References: <20210609063831.3400611-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

version 3.40.0
--------------
 Bugs fixed:
  * Error when creating an archive with no extension (!99)
  * Fixed encrypted files emblem (!120)
  * Open destination: fixed when using junk_paths (!112)
 New or updated application translations:
  * Romanian (Florentina Mușat)
  * Ukrainian (Yuri Chornoivan)

version 3.39.1
--------------
 New features and user visibile changes:
  * Let nautilus handle properly rar files. (Simental Magana, Marcos)
    (!1813)
  * Remember If Showing Other Options. (programmer-ceds)
  * Action Enter key in password field. (programmer-ceds)
  * libarchive: multicore xz compression. (Julian Groß)

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../{file-roller_3.38.1.bb => file-roller_3.40.0.bb}          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-gnome/recipes-gnome/file-roller/{file-roller_3.38.1.bb => file-roller_3.40.0.bb} (76%)

diff --git a/meta-gnome/recipes-gnome/file-roller/file-roller_3.38.1.bb b/meta-gnome/recipes-gnome/file-roller/file-roller_3.40.0.bb
similarity index 76%
rename from meta-gnome/recipes-gnome/file-roller/file-roller_3.38.1.bb
rename to meta-gnome/recipes-gnome/file-roller/file-roller_3.40.0.bb
index 379857c94..e4aeea26f 100644
--- a/meta-gnome/recipes-gnome/file-roller/file-roller_3.38.1.bb
+++ b/meta-gnome/recipes-gnome/file-roller/file-roller_3.40.0.bb
@@ -13,11 +13,11 @@ DEPENDS = " \
 
 inherit gnomebase gsettings itstool gnome-help gettext upstream-version-is-even mime-xdg
 
-SRC_URI[archive.sha256sum] = "94a0130e12d321aa119793a14d09716523e2e4a61f29570cee53fd88dd6abc57"
+SRC_URI[archive.sha256sum] = "4a2886a3966200fb0a9cbba4e2b79f8dad9d26556498aacdaed71775590b3c0d"
 
 PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'packagekit', '', d)}"
 
-PACKAGECONFIG[nautilus] = "-Dnautilus-actions=true,-Dnautilus-actions=false,nautilus"
+PACKAGECONFIG[nautilus] = "-Dnautilus-actions=enabled,-Dnautilus-actions=disabled,nautilus"
 PACKAGECONFIG[packagekit] = "-Dpackagekit=true,-Dpackagekit=false,"
 
 FILES_${PN} += " \
-- 
2.31.1

