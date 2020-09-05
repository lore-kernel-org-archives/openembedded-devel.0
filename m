Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.web12.3146.1599324984087539153
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 05 Sep 2020 09:56:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=qI3NFoDx;
 spf=pass (domain: gmail.com, ip: 209.85.216.45, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f45.google.com with SMTP id a9so1426656pjg.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 05 Sep 2020 09:56:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=+rzWpBC/WuPT9ecX2ZhO/L6DVUstr5Ud6mXUCy32Q/o=;
        b=qI3NFoDxBqzF2/pXXYPYs9TMfAj3X7wjW8Fp7DrLmng+X2XAnDdWct0mAnK4dURV8J
         pV6p9qecJqhP4FwwIHj+rTE5y703s3YQhxHySZbZmt5Z+QXR4voIGZGjgdxAgAqT1Fv9
         fIOu0npB2a3yJsgJtgZgc5oqYPwEAkKKzo5nWtuY9NJxyA5HPnKX4+8Aa+jpsMvw5YK+
         MF7rBRiqoOvsglgoRRh7p1r/+vnOf9pOu2hmdBPAeCfpDRrqXKXxtK6ciwNo3kW6FVno
         MiTMb3Z4lOqCwqfZ6IxcaJ8Lob+P1WuTvs5qc+0VJIhjtjoadEZoGJye54ZKtu1D8i4+
         muTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=+rzWpBC/WuPT9ecX2ZhO/L6DVUstr5Ud6mXUCy32Q/o=;
        b=oFyvZFEraBJZWkvyEXmgRX3zY/+Cvys1HEZgujsUzX25lw/dLk6AE+d0B+2VX9Zlff
         3O5a11Y6HVstx30lBvtzBKo5tKtFLr0K43xzCNyG3mBmfEa/CvdBCCFE2RBKwZpyldGB
         x++2FUa41iDa8O/G/rUaKbJLKoQdqxT1I0G577pVR0XoeC1TNCVlpjD5eBUQxoLQt0Mb
         yahxar8EU6CyQYq4Fyn1JRRun5c6Yc/I59JP0DoMAhIcnVYtyw31TUAu1DGXjY1T7WpB
         QaqEMPapnUdMszpL4GEIAoXuNb8AV59UjqogbTErEf+XMNsiUVEjLJePdhcdfP/bYjvk
         vLqw==
X-Gm-Message-State: AOAM530eYFDIhQXmZ0X3FmpKUcB1SXjK8+rG9BEsfYXsCCXrtYoDq+3C
	f8hAbOH6yxmmS/5QM08bUBzi/qIZ8E8=
X-Google-Smtp-Source: ABdhPJzhMhGpxsLAHZX8vtkoaorWYyLY/enxsqchiqBHT3/UlWgkVIwAKl2oC6drhqRu5e0Qtlh8ZQ==
X-Received: by 2002:a17:902:c253:: with SMTP id 19mr1698356plg.65.1599324983484;
        Sat, 05 Sep 2020 09:56:23 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net ([2601:202:4180:a5c0:745b:fcae:da87:5147])
        by smtp.gmail.com with ESMTPSA id lb1sm7410944pjb.26.2020.09.05.09.56.22
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2020 09:56:22 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfell 19/20] gnome-settings-daemon: Remove duplicate outdated SRC_URI hashes
Date: Sat,  5 Sep 2020 09:56:02 -0700
Message-Id: <b72b233d268c51376ecfa277ea8346621f632467.1599324864.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1599324864.git.akuster808@gmail.com>
References: <cover.1599324864.git.akuster808@gmail.com>

From: Adrian Bunk <bunk@stusta.de>

They got overwritten later with the correct values.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 0b22ed995fec7ee23c23a9eed8323685af1e1403)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../gnome-settings-daemon/gnome-settings-daemon_3.34.2.bb      | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings-daemon_3.34.2.bb b/meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings-daemon_3.34.2.bb
index e2fbcb401d..1b77582433 100644
--- a/meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings-daemon_3.34.2.bb
+++ b/meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings-daemon_3.34.2.bb
@@ -6,9 +6,6 @@ GNOMEBASEBUILDCLASS = "meson"
 
 inherit gnomebase gsettings gobject-introspection gettext features_check upstream-version-is-even
 
-SRC_URI[archive.md5sum] = "528b0b7cc2dd22c6026a9c8739c71fa7"
-SRC_URI[archive.sha256sum] = "7ce4979817866911a94ecb75b36db56797e038c0c524c5c1a81aefccafc17337"
-
 DEPENDS = " \
     colord \
     geocode-glib \
-- 
2.17.1

