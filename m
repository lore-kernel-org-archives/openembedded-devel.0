Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web10.5528.1600745057870501470
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 21 Sep 2020 20:24:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ULlDIQms;
 spf=pass (domain: gmail.com, ip: 209.85.210.177, mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f177.google.com with SMTP id b124so11137025pfg.13
        for <openembedded-devel@lists.openembedded.org>; Mon, 21 Sep 2020 20:24:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id;
        bh=bOTeDEFDRL+P5ztFlqRGi42Vf1pHpKYQtEW4AUIO1wE=;
        b=ULlDIQmsEPWSGurx9ObGBUf88lU7wYJ5DogJDKniwqbL6k8sd7D1B9pHVMNKFfD0nX
         05Ub7V4w1GGUiYTKAY3VMmjyvfqYRapoFuPN4905pHL3icZSGAMUJ62wBFA7bWyDZRG8
         9CuIK955aeBDyopplEOLsNnkr+eABdROfmG2pmOh5li2pP27BiPR5SHw4OaSG8z/hwsV
         pp54KTdc4SWg4QhPm23Z9Ku7LImgHOuaGc0QJRtiVEPq6pXBaHGpI2RuPWcExNoTCiBH
         X2l7jIPGVF9NsaJ5NhOyUvoGLyxghhsK2qs6ld5+0Yn+1zm8Gc8k+SXr4LIctqW1XFq0
         qQBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id;
        bh=bOTeDEFDRL+P5ztFlqRGi42Vf1pHpKYQtEW4AUIO1wE=;
        b=AUcF5LYEomH2EFvuFD71dgdlfDc44ZcdynR/VDUlZAZweP7sTOYzBKUh/j8Pe8kIOJ
         iLLvdKecce9hM48HjWUTdRLGseCVIlZlWoOhd3XBNXcgZ5JBhywTsy2PrUSf7yPPhS5J
         ywcUOJPidn3z+/Fr1iJHWqtQzk3d0BSMaqv4dO2ZWfTuPMVMFk3OE3kfieBtgXvajEM4
         CetVUxT4G9sLdJRicw3ZQdGpFYbMLwMytSB3PahrCK+BlSdDkQFHTEmzrOu8rHh+qREe
         aBuPwCI+RYPdKlZP0dMpjOQpvrPFkc4YLBs45xwxr+5au8UJGgO/hMXvJaRLlCZe6c2u
         Q/pQ==
X-Gm-Message-State: AOAM533vAxyuNW1bvBqEagNeFH8ZIxXzC5pegHkraB7VLG1TqPYW3Uko
	0RiP6uZVUUPTln9qEfyUtkb+saRtCg4=
X-Google-Smtp-Source: ABdhPJwoJI8CRyMSiJiuV2sYi1eu3CQlRiGwJFNuNiko0rDQ6sE8MxXxH9pLYk2PdjNC5yaJAR6J6g==
X-Received: by 2002:a62:fc51:0:b029:142:4506:9a7b with SMTP id e78-20020a62fc510000b029014245069a7bmr2411862pfh.28.1600745057072;
        Mon, 21 Sep 2020 20:24:17 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:8852:ddb9:5d69:c36d])
        by smtp.gmail.com with ESMTPSA id o20sm13351923pgh.63.2020.09.21.20.24.16
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2020 20:24:16 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfell 0/5] Merge request Sept 21
Date: Mon, 21 Sep 2020 20:24:00 -0700
Message-Id: <cover.1600744944.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1

Please merge these to dunfell.
This series was already on the list for review.

The following changes since commit d7b41ced4b9a9a68083b0fcceff3b226298cff8b:

  net-snmp: Fix CVE-2020-15861 and CVE-2020-15862 (2020-09-03 08:28:37 -0700)

are available in the Git repository at:

  git://git.openembedded.org/meta-openembedded dunfell-next
  http://cgit.openembedded.org/meta-openembedded/log/?h=dunfell-next

Khem Raj (1):
  iwd: Upgrade to 1.9

Oleksandr Kravchuk (1):
  iwd: update to 1.8

Pierre-Jean Texier (1):
  iwd: upgrade 1.6 -> 1.7

Robert Joslyn (1):
  postgresql: Update to 12.4

Yi Zhao (1):
  libldb: upgrade 1.5.7 -> 1.5.8

 .../libldb/{libldb_1.5.7.bb => libldb_1.5.8.bb}               | 4 ++--
 meta-oe/recipes-connectivity/iwd/{iwd_1.6.bb => iwd_1.9.bb}   | 2 +-
 meta-oe/recipes-dbs/postgresql/postgresql.inc                 | 4 +---
 .../postgresql/{postgresql_12.3.bb => postgresql_12.4.bb}     | 3 +--
 4 files changed, 5 insertions(+), 8 deletions(-)
 rename meta-networking/recipes-support/libldb/{libldb_1.5.7.bb => libldb_1.5.8.bb} (95%)
 rename meta-oe/recipes-connectivity/iwd/{iwd_1.6.bb => iwd_1.9.bb} (96%)
 rename meta-oe/recipes-dbs/postgresql/{postgresql_12.3.bb => postgresql_12.4.bb} (63%)

-- 
2.17.1

