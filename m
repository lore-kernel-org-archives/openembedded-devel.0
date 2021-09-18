Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web11.2125.1631991292446001169
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 18 Sep 2021 11:54:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=TWDsHH64;
 spf=pass (domain: gmail.com, ip: 209.85.214.179, mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f179.google.com with SMTP id v2so8378781plp.8
        for <openembedded-devel@lists.openembedded.org>; Sat, 18 Sep 2021 11:54:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=GzntSOwYhH38Q88PsTOINH22OgHVsKnLkTXWwTEJwRw=;
        b=TWDsHH647XB1qkp7dsGDcGcI+WU8sNS0BMw6OWZvPFBnazXdZX2fntS25XpQHmtZoG
         z645qwMPxpqTuDBMDiitR5FB+rb0vyQIxwYhPXDO+ighixjjSMZjIv4Hyw52EIfAApK6
         LEV6oF1tZAK5FoqzbVTyiz7QD77Q4G9fkwbjvj/QZW4OzIUrqcJvXBzwF05bmwKIBNdS
         SAIBFhyRinSkzsjPLCBCduSpMVqxhRtktVGfTpIRR5oREA4yUO4cZ4tgM6XjuujTKCaC
         boISON6cOcIk2jEA8MAVLY5rFOsw7vGZ86tlVd82H+gSOeZgcGZQhBIzo6TvvPItzoSD
         tYQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=GzntSOwYhH38Q88PsTOINH22OgHVsKnLkTXWwTEJwRw=;
        b=lyJmYdlxjQthsR5aqd+YjQFRfHg+Ctz6FHIj+CvfKJZhsD5M5q2fu74XIM66WBSMh4
         wZQu2LQAMVbGiLsN5v5TCDbpJwrNKXn7/WaEiBryPE8Un2ownv+veBQyCcJLh/7z5DcN
         SXE9RRkP9y5Wj0y5QcXMRNdZPRl95N6lMhOJQ7C+occRBQ/m6gZS5AhDVDbGHVJjtcC7
         87DwDYE2hp6eh9/9ekskk9uM+mgHcb782d4ZNXCrmclfY/JtpvCuJwJRk7d7zxgrFYvp
         /lcPeOZHUCgHJ6zm/1Llt4FVr48K4Ekt+jblmrg2IMiEU/Gb4rnuQ59F4KbT2k7gv4Dj
         Dg8Q==
X-Gm-Message-State: AOAM533KwcqQ4lD9ZaCii0JGKRAZbJ6SxYdA+e2psoZMoI5UY6tYuEuL
	qdSmHINv25iotc1uOVzvKruJnAhor3A=
X-Google-Smtp-Source: ABdhPJzTS1xf7maQ8QmARMceyx7vA7RnHYMLvrQXKVilJsdFR7qGp6CFGXS8KXvDJOF8nYcM5UMhlQ==
X-Received: by 2002:a17:902:6b49:b0:136:3f21:7a9 with SMTP id g9-20020a1709026b4900b001363f2107a9mr15388324plt.81.1631991291703;
        Sat, 18 Sep 2021 11:54:51 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from keaua.hsd1.ca.comcast.net ([2601:202:4180:a5c0:f923:d379:e6c9:abf7])
        by smtp.gmail.com with ESMTPSA id q21sm8503698pjg.55.2021.09.18.11.54.51
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Sep 2021 11:54:51 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 2/2] gpsd-machine-conf: set precise BSD license
Date: Sat, 18 Sep 2021 11:54:49 -0700
Message-Id: <20210918185449.3691848-2-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210918185449.3691848-1-akuster808@gmail.com>
References: <20210918185449.3691848-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

"BSD" is ambiguous, use the precise licenses BSD-3-Clause

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-navigation/gpsd/gpsd-machine-conf_1.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-navigation/gpsd/gpsd-machine-conf_1.0.bb b/meta-oe/recipes-navigation/gpsd/gpsd-machine-conf_1.0.bb
index d2058ba570..8d74eb4a2c 100644
--- a/meta-oe/recipes-navigation/gpsd/gpsd-machine-conf_1.0.bb
+++ b/meta-oe/recipes-navigation/gpsd/gpsd-machine-conf_1.0.bb
@@ -1,5 +1,5 @@
 SUMMARY = "Machine specific gpsd config"
-LICENSE = "BSD"
+LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/BSD;md5=3775480a712fc46a69647678acb234cb"
 
 # empty by default
-- 
2.25.1

