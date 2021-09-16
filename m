Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web08.557.1631804810515732837
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Sep 2021 08:06:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ZCyIhVW8;
 spf=pass (domain: gmail.com, ip: 209.85.210.181, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f181.google.com with SMTP id y8so6141005pfa.7
        for <openembedded-devel@lists.openembedded.org>; Thu, 16 Sep 2021 08:06:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=snQhQ9kU4VZSS+hOdnPL6hDWaZyoA5Dq8JMmi/JmwVg=;
        b=ZCyIhVW8SHy2b5y0qkQSsSLvMmbhN2HkK9bRMD6x5clfnlBBNs9HsI8U1f8vZ/SmtE
         43SlRLYbvY6vHNHvmyrMIngTWDyg42oyIAHaiRwDq+A35eCaT8rYGEIKlDA1igNH7Glv
         207xTifh5cp6fELytae0V+csF8E6bIaEkPtNjj4LdDDBikZkuixiQEnbwVIQolb+ckKK
         AM3PvGw4zVfamTbEBMLDwKpQIPg8MHfxwH05rM7oKhjWl6q8N5oXW7hTyEHVeMh00M52
         9/c5Ly3npx1d+Jp7ti0CHJ0WbXtEkxh42zGCf4zLFvOM6FdRsXr7veyfuEOOSlTdKwYx
         IVOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=snQhQ9kU4VZSS+hOdnPL6hDWaZyoA5Dq8JMmi/JmwVg=;
        b=Abs5bmgqRcgnXhP7WdBufjCbKYXEOpQgLEHYVW8lSYTrXzjeHN9/vpZ2WIs2N9kR1p
         5VCkiY8BZsKCnZZGn4yn33ETJUPsW4eS27/ugVrf4x2rfroVBIbd7E0NvHse0Q+iN+mP
         qwklIeVqWOEa3Gk8CVg5KaxQo6mgJ80h+Xv03avkhdJJi1d96vFSGtusp3yYhyqvUwGD
         0d8ccfDRqWtbS/dlshVUR1dRIzwxVkW3T/e4pNwRPYND+EPCtcyV93SKYnXzTg2tRMP3
         y22z5fVlKIodQEfQ0YcOOhN6FrOnwgjrPRRLwuJB33fShIqFNAfuTltgo8GhUr2WDXuP
         PbEA==
X-Gm-Message-State: AOAM5330S9gQjCUxZXsiDyIVwbYlgBwY2OtFfzt/B109AT+btWnwop0M
	f1zydUSCrZvuZagIv5ssfWGF/gqQMPK1bA==
X-Google-Smtp-Source: ABdhPJwCxpi2OQYB0RKg4DvyAv7Zw7RHQSB37l2i2kTm99gA2Ake2SroVZ2wrPO/WDwHCswMfSGKSw==
X-Received: by 2002:aa7:9841:0:b0:439:c4cb:fe9a with SMTP id n1-20020aa79841000000b00439c4cbfe9amr5725444pfq.13.1631804809722;
        Thu, 16 Sep 2021 08:06:49 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::728f])
        by smtp.gmail.com with ESMTPSA id v4sm3519566pff.11.2021.09.16.08.06.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Sep 2021 08:06:49 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	=?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
Subject: [meta-gnome][PATCH] gdm: Add polkit to required distro features
Date: Thu, 16 Sep 2021 08:06:47 -0700
Message-Id: <20210916150647.4034139-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

it depends on accountservice package which already needs this
DISTRO_FEATURE

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Andreas Müller <schnitzeltony@gmail.com>
---
 meta-gnome/recipes-gnome/gdm/gdm_3.36.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/gdm/gdm_3.36.3.bb b/meta-gnome/recipes-gnome/gdm/gdm_3.36.3.bb
index 74e2bd677f..e4c590e482 100644
--- a/meta-gnome/recipes-gnome/gdm/gdm_3.36.3.bb
+++ b/meta-gnome/recipes-gnome/gdm/gdm_3.36.3.bb
@@ -10,7 +10,7 @@ DEPENDS = " \
     libpam \
 "
 
-REQUIRED_DISTRO_FEATURES = "x11 systemd pam"
+REQUIRED_DISTRO_FEATURES = "x11 systemd pam polkit"
 
 inherit gnomebase gsettings gobject-introspection gettext systemd useradd upstream-version-is-even features_check
 
-- 
2.33.0

