Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com [209.85.221.67])
 by mx.groups.io with SMTP id smtpd.web11.38465.1599226056162629001
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 04 Sep 2020 06:27:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kynetics-com.20150623.gappssmtp.com header.s=20150623 header.b=fDt3GSZt;
 spf=neutral (domain: kynetics.com, ip: 209.85.221.67, mailfrom: diego.rondini@kynetics.com)
Received: by mail-wr1-f67.google.com with SMTP id x14so6718481wrl.12
        for <openembedded-devel@lists.openembedded.org>; Fri, 04 Sep 2020 06:27:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kynetics-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zl9mSnnn02Wto70arI+yH7GTbgW8D60BpBVqD8n9UyU=;
        b=fDt3GSZtkvpFFHavI13cOwaoA29sSB51Yw1kMfYRbW0XvW3qNHtECaZrvMQqlK2gDY
         ib/7gjnRAFgUqTJzcyWK7uNvpO2UIH236ZvRaLWJDKon8/0uy6GFzHScSfG8D7Xs9dcS
         TEbkV3BkBEwICn1gAVsEl8wXZCKRF8dwkEJawD5c4vx+SQ7zoDPRju4CDgL3YcNarrt5
         xx5V68xHIl/qoL7Pg9RvVJ8RGgX+jqUZVR1qH4ySeHPoS+xIQDOp45q7KSqOs3GjtlFB
         9EQWhbqtDDIdLPE91x72Cfw3p6j/SooqP8F3nIhNS9XynqEz2+s7ConNizwBuBMMa+Ge
         bTWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zl9mSnnn02Wto70arI+yH7GTbgW8D60BpBVqD8n9UyU=;
        b=kdnNbfbHLoQrU3EKlmUqbsNAqXUNnbSXkhis+bL4PK3ggQQTzc/zVi0XszxLFRHB1U
         BrOYk0dsaaFpM4wAzNCguZeo86zpFzH728GsoPubi1poC7y3M659FMTa5AD1uHv1FirG
         HtiqK69omWJNQcBVvaDLzeEwXHjcnfUE5CoPKFfSIgLwfIOmnAjYC8wAwYWe63HgH6Ak
         sfhfXOraqrdu3dDChGtF6r6i5GzIOngJKXL1otf//aPi7Yfc2YtK30unC+pGbHFbSqNY
         KGfW+dxuxWskZGkHZIK/WeuZWUbYI8iSuJPdl2Domsh5YfaOjrHtXR55EAFNMRIrkEVq
         ijtQ==
X-Gm-Message-State: AOAM530e9NHLMy/dtMqUpmhrg/h153r6oEXrrz3eTseXv3JG+ZsmEPKu
	e0daX9Dd5ckOkx72nlkbJUu//zhEKHbzjg==
X-Google-Smtp-Source: ABdhPJybLhleRp9jTRlUmZM5AbHOzPOcW7r6kN4u9t68U129wVepD8uHKDFIj48OCLkuS+6HPCw+pw==
X-Received: by 2002:adf:e74d:: with SMTP id c13mr7285990wrn.45.1599226054281;
        Fri, 04 Sep 2020 06:27:34 -0700 (PDT)
Return-Path: <diego.rondini@kynetics.com>
Received: from localhost.lan (217-133-17-98.static.clienti.tiscali.it. [217.133.17.98])
        by smtp.gmail.com with ESMTPSA id h2sm11636027wrp.69.2020.09.04.06.27.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2020 06:27:33 -0700 (PDT)
From: "Diego" <diego.rondini@kynetics.com>
To: openembedded-devel@lists.openembedded.org
Cc: Diego Rondini <diego.rondini@kynetics.com>
Subject: [meta-gnome][PATCH] gvfs: adjust fuse packageconfig to fuse3
Date: Fri,  4 Sep 2020 15:27:23 +0200
Message-Id: <20200904132723.754430-1-diego.rondini@kynetics.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Adjust fuse packageconfig to depend on fuse3, which is the only supported
option in gvfs ≥ 1.41.
https://gitlab.gnome.org/GNOME/gvfs/-/commit/7a0a06186b6fef07b8fce2360c04fd075fc84ed1

Signed-off-by: Diego Rondini <diego.rondini@kynetics.com>
---
 meta-gnome/recipes-gnome/gvfs/gvfs_1.44.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/gvfs/gvfs_1.44.1.bb b/meta-gnome/recipes-gnome/gvfs/gvfs_1.44.1.bb
index ec0ac2b29..ad5dab5ec 100644
--- a/meta-gnome/recipes-gnome/gvfs/gvfs_1.44.1.bb
+++ b/meta-gnome/recipes-gnome/gvfs/gvfs_1.44.1.bb
@@ -62,7 +62,7 @@ PACKAGECONFIG[samba] = "-Dsmb=true, -Dsmb=false, samba"
 PACKAGECONFIG[systemd] = "-Dsystemduserunitdir=${systemd_user_unitdir} -Dtmpfilesdir=${libdir}/tmpfiles.d, -Dsystemduserunitdir=no -Dtmpfilesdir=no, systemd"
 
 # needs meta-filesystems
-PACKAGECONFIG[fuse] = "-Dfuse=true, -Dfuse=false, fuse"
+PACKAGECONFIG[fuse] = "-Dfuse=true, -Dfuse=false, fuse3"
 
 # libcdio-paranoia recipe doesn't exist yet
 PACKAGECONFIG[cdda] = "-Dcdda=true, -Dcdda=false, libcdio-paranoia"
-- 
2.26.2

