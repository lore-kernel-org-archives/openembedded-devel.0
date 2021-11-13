Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20855C433F5
	for <webhook@archiver.kernel.org>; Sat, 13 Nov 2021 17:46:13 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com
 [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web08.399.1636825572334378589
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 13 Nov 2021 09:46:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=XAgLBaws;
 spf=pass (domain: gmail.com, ip: 209.85.216.48, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f48.google.com with SMTP id
 j5-20020a17090a318500b001a6c749e697so8190939pjb.1
        for <openembedded-devel@lists.openembedded.org>;
 Sat, 13 Nov 2021 09:46:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=jSe+qfAsf5bDUT/D2ALZBZns/eATYErwpZyBoVYcYZE=;
        b=XAgLBawsNcCiiXiD1OLBDJMYAkfLuv2pXAg6GAa9xboA3vT9xgM/GHwPuObvMXe8KA
         DHEPdwqGSihZAwDhXB+Vv9VzugAsfhfpNdimpARl8nPySevzoZ47e4fPzBoS4iuMZNdQ
         dC0l3JnhMdhiUnRewX0ffoXyz12CqDzDwhyn5lk68pVpwseKlfEW8TfxZrvdyJoM/KRm
         p3IJVKKIjE7RzYLrbQv/jDWf2JbUQYMOAEyBOujyXQPw0NhAc1qbouLOj7uiWg4ccGUG
         Z4/e5HPeDGQcZUfhSg8riJdhffgbOH1/8vy8J88ljs9ygi6IHz0qiykFDyvc+hTjPA33
         Rm1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jSe+qfAsf5bDUT/D2ALZBZns/eATYErwpZyBoVYcYZE=;
        b=cot7MNwSu63QVxAzkpqg2PP27GfKuhDJAqnZzdt0FuElk9s7yqR0cM1UOD6wilE/qJ
         O3HzKT53HQwqPc3oEQT8ywa3oUE5Jp2cuj22DHtKUcO+qFoJE6QTTrLsEBYzxCXEctRh
         5/ghH5VdO7MoUTSN0cS26vqrE98slz90chrTIJNw49c1u6dNu0CoSIAaNABTpuR6Tx3/
         HQrvWMMRJ1qimZu+RbkzD05JkanwiqNBpSnuH2CED+WyGZ7ZV7gg8mFL64xwMzImNQU8
         eTyZn0qyqOJSpgPy1jm7JxvpkCrlsZMV7uQhTc4jQFlSUe6RWWLpCVEzWODfzmLRcUAY
         H8Gw==
X-Gm-Message-State: AOAM532hlMkZScFDKnKpTV1+spFgYHQNB/Mzz6XB4Fh47kNnmvmRK0O+
	UcxzE8+NxHL+/56eHc0vQVIHQO3hoEQ=
X-Google-Smtp-Source: 
 ABdhPJw8O9yKifbdQKgm+9PJBNRzfX7jVZE0fGhAHNcX/Xmra0ERGicu1+S8laJjKikHUMkbhLy7qg==
X-Received: by 2002:a17:90b:1bcb:: with SMTP id
 oa11mr47522925pjb.140.1636825571619;
        Sat, 13 Nov 2021 09:46:11 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::7905])
        by smtp.gmail.com with ESMTPSA id
 d13sm10649107pfu.196.2021.11.13.09.46.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Nov 2021 09:46:11 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-gnome][PATCH 5/9] tepl: introspection is not valid meson option
Date: Sat, 13 Nov 2021 09:46:02 -0800
Message-Id: <20211113174606.2044137-5-raj.khem@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211113174606.2044137-1-raj.khem@gmail.com>
References: <20211113174606.2044137-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 13 Nov 2021 17:46:13 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93934

meson 0.60+ errors out on unknown options and -Dintrospection
is not a valid option

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-gnome/recipes-gnome/tepl/tepl_6.00.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/tepl/tepl_6.00.0.bb b/meta-gnome/recipes-gnome/tepl/tepl_6.00.0.bb
index 755cb964c3..0ac7e3693d 100644
--- a/meta-gnome/recipes-gnome/tepl/tepl_6.00.0.bb
+++ b/meta-gnome/recipes-gnome/tepl/tepl_6.00.0.bb
@@ -19,6 +19,6 @@ SRC_URI[archive.sha256sum] = "a86397a895dca9c0de7a5ccb063bda8f7ef691cccb950ce2cf
 
 # gobject-introspection is mandatory and cannot be configured
 REQUIRED_DISTRO_FEATURES = "gobject-introspection-data"
-UNKNOWN_CONFIGURE_WHITELIST:append = " introspection"
+GIR_MESON_OPTION = ""
 
 GTKDOC_MESON_OPTION = "gtk_doc"
-- 
2.33.1


