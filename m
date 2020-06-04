Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web10.4178.1591231322061034285
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 03 Jun 2020 17:42:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Kvm7WWzm;
 spf=pass (domain: gmail.com, ip: 209.85.221.43, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f43.google.com with SMTP id e1so4241271wrt.5
        for <openembedded-devel@lists.openembedded.org>; Wed, 03 Jun 2020 17:42:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=J/QAnEipxIXdA9XVi7+0vWIYcoG1rAbTSBzYH6QC/vs=;
        b=Kvm7WWzmHqRD8GOLVq3d/mhNwkdD9J/6leBqGVS0jwCEjRtt6mUqplqJDr3mSkpb2o
         f6YOacf/r6O0OXQ0uYMta4KPyeWhTAF/j9yUuwf6I0rMZA/RiLuFg+mKs3SCHCAsZloT
         DtDwW3jf/Vh7Ula6/RX0EblIpHYAsuXlxazI36vJ2hJ3MRcT9VszbYkCQjV6/3fbENla
         5x7HJbGRDBAET+X6qokv3KbNaY7UPK4UfNPbmPJuL1xM7b3OkSdJy3EAahkLSm6+7qPx
         tmTgoDxJO9lj3sRSKHcGOPttyayYmeI+1nAUoPyxUCva8b1DbOmWcNilnb3ulYspd8ar
         4b3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=J/QAnEipxIXdA9XVi7+0vWIYcoG1rAbTSBzYH6QC/vs=;
        b=J+HMJG8/jxLkWuaRCpB7MbD7ndesMJIwnjHvA/NcWqVFcJrqzJ755TWnANwu2jFphR
         QicxVUai0WQ4Vp/tjVshid/h6HB2Iozt5J8PlJ4oduOxA0+nQ5I8Ffp9bPi/UIv3y8Xr
         XHwVSEZ4g9F2nDn5rWAeSEh2MlMVqx50LvV674x4EfoeGhRKnEqHdHpEXuKe1QbW7EED
         BHCLsJmtDxf1HTPHrJd0W5m780/d0Tm01wgv6UuvXydfGTLqVqL6eUod58Td0CbhKHZa
         zA+xM8oC1ChtF843hbODjAZOHie78UD9g/VMlNIyPz17lxeS7drJarskARHpn2DzbJLZ
         8H1Q==
X-Gm-Message-State: AOAM530DgKtCHwTJNT/PjQKJeQtDpl/tm1S7a0XaWdAggPkM9o319FQ3
	dQt7PGjCcZJAZ4UzN4dhMgswrf2T
X-Google-Smtp-Source: ABdhPJzBVhu6NpR3bOTnBknxGWYoHTtFRC4034wq/hiCgoRy3S8CdCzwuuX7sMqPVWRtHGP8lxxN1Q==
X-Received: by 2002:a5d:5351:: with SMTP id t17mr1726901wrv.287.1591231320419;
        Wed, 03 Jun 2020 17:42:00 -0700 (PDT)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost ([109.238.218.228])
        by smtp.gmail.com with ESMTPSA id n1sm5506689wrp.10.2020.06.03.17.41.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2020 17:41:59 -0700 (PDT)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCHv2] meta-python: depend on core version 12 or higher
Date: Thu,  4 Jun 2020 02:41:57 +0200
Message-Id: <20200604004157.742720-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

* python3-pyelftools and python3-pycryptodome(x) recipes were recently
  moved from meta-python to oe-core in:
  https://git.openembedded.org/meta-openembedded/commit/?id=7aee545a61c4f91d5e462d5b46b1b8f9a8bad1e3
  https://git.openembedded.org/meta-openembedded/commit/?id=a8f3c00d8d113b46a49584682e10435157d516ca
* core version was bumped now:
  https://git.openembedded.org/openembedded-core/commit/?id=2d503b27e7c88cee9a37c79c4605c77b11f230b6
* this dependency will make sure that people do upgrade oe-core when they do
  upgrade meta-python past these revisions, so the recipes won't suddenly
  disappear as a bonus they will get slightly newer versionw which are now
  in oe-core
  python3-pycryptodome(x) from 3.9.4 to 3.9.7:
  https://www.pycryptodome.org/en/latest/src/changelog.html#february-2020
  python2-pyelftools from 0.25 to 0.26:
  https://github.com/eliben/pyelftools/commit/8a40f295bc36f96efeb8633dc4a5314f6077d0bf#diff-e4eb329834da3d36278b1b7d943b3bc9

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-python/conf/layer.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/conf/layer.conf b/meta-python/conf/layer.conf
index 7cfeafe599..0dbc4296eb 100644
--- a/meta-python/conf/layer.conf
+++ b/meta-python/conf/layer.conf
@@ -12,7 +12,7 @@ BBFILE_PRIORITY_meta-python = "7"
 # cause compatibility issues with other layers
 LAYERVERSION_meta-python = "1"
 
-LAYERDEPENDS_meta-python = "core openembedded-layer"
+LAYERDEPENDS_meta-python = "core (>= 12) openembedded-layer"
 
 LAYERSERIES_COMPAT_meta-python = "thud warrior zeus dunfell"
 
-- 
2.25.1

