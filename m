Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web10.1641.1598917869862817863
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 31 Aug 2020 16:51:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=uhnhbqCz;
 spf=pass (domain: gmail.com, ip: 209.85.214.179, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f179.google.com with SMTP id h2so4039127plr.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 31 Aug 2020 16:51:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7CAlZEsiyi3kep8Uw5isiOhTZJxed3IbGok9JZrOugQ=;
        b=uhnhbqCzas9shuIU2lDXwQqvgPrGI9GQ1O9ccizftFHTGMuY6OgxD7QfBTXHPsWmdo
         AlSRg3o+pxaqaod5ypi+ekIWWAYmlmZoTotCBUiphjBL8z7knKBdc7rVDY6PyLI+tc0x
         t1sR1fyHyf03tZxb5llaNcjfnNsldhjCuBADfm61FS0Mq5zVqI5CdXM3MsjzFD9+XdE8
         jXyWdEjOAtGek9/obOKIM+umAUkw81jfez8q2Fcbhx3fmgQkswBImW6RdqLz5Tca7SUL
         zImKk96CKU/2lTX0SJBjVoEydTa8lgCgND/Oa2VKArUJ0v18Vp1zUORS3WeZACHANRiU
         B/0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7CAlZEsiyi3kep8Uw5isiOhTZJxed3IbGok9JZrOugQ=;
        b=Axam2f12aF1RFuNA1KzWOD7P3PnA0QyNVLVqmm1JjeqAMlHz0ZKVRvkYJP8GXM5SHa
         ZQTroITJ9Xp9IKFz9Tadc11+XyKMzvhnDcjZFeuwWsDC4wW8MtTeX3JCsLXEgShd485b
         KquLtitvBiMGd3BoTraXEavlRlxW/z3fDfwRtitSkRCaH9gWRkZL0L3Sv1AupJtkoOUQ
         8B6YTjvyWiDLRhFFvixR8KVq4JQYxcdLnlyOpB8gEX/ba39ogM3DQ/gqgYQiCF5CZIKD
         dm7L+qJfsfDdImmK7f6TkOMt898UcsJlSoXF90sBzM73d8iGphGp4tMAxdI4TmPNBkUs
         LZcQ==
X-Gm-Message-State: AOAM531QgoeXu2LUQEdyR+Ype4akHyPKo9wZwbWbNB5cU9u8+xHcUG3l
	roUAxQ8FbRaY3Fna4b2xxjbOIUue3yydDg==
X-Google-Smtp-Source: ABdhPJwxKLbuXoFOUhVaa0kXOFuONFBb5yICWBF0cE5PGqmGY4rcAiuQjOsObifT7Qgf+q/fg9S/iw==
X-Received: by 2002:a17:902:e789:: with SMTP id cp9mr2894113plb.215.1598917869057;
        Mon, 31 Aug 2020 16:51:09 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::e89d])
        by smtp.gmail.com with ESMTPSA id b15sm2892293pft.84.2020.08.31.16.51.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2020 16:51:08 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	=?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
Subject: [meta-xfce][PATCH 1/2] layer.conf: fixes icon-theme signature changes
Date: Mon, 31 Aug 2020 16:51:05 -0700
Message-Id: <20200831235106.48150-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

openzone and rodent-icon-theme are allarch but recently

gtk-icon-cache, since commit 31e3d34c8a9c3e8481aa837aa0bf52adf095fe62
[gtk-icon-cache.bbclass: add runtime dependency], it start depend on
non-allarch packages gdk-pixbuf and gtk+3, which make it's signature
changes when machine changed.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Andreas Müller <schnitzeltony@gmail.com>
---
 meta-xfce/conf/layer.conf | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta-xfce/conf/layer.conf b/meta-xfce/conf/layer.conf
index 199c69e7b2..7e4bb178e0 100644
--- a/meta-xfce/conf/layer.conf
+++ b/meta-xfce/conf/layer.conf
@@ -20,3 +20,10 @@ LAYERDEPENDS_xfce-layer += "meta-python"
 LAYERDEPENDS_xfce-layer += "networking-layer"
 
 LAYERSERIES_COMPAT_xfce-layer = "thud warrior zeus dunfell"
+
+SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS += "\
+  openzone->gdk-pixbuf \
+  openzone->gtk+3 \
+  rodent-icon-theme->gdk-pixbuf \
+  rodent-icon-theme->gtk+3 \
+"
-- 
2.28.0

