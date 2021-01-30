Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
 by mx.groups.io with SMTP id smtpd.web10.8763.1612035479273277199
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 30 Jan 2021 11:37:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ZaYGKMl4;
 spf=pass (domain: gmail.com, ip: 209.85.215.178, mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f178.google.com with SMTP id t25so9181281pga.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 30 Jan 2021 11:37:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=a14rbcqbH4we3Ue7mIpuVlWo48xadVIn8OFA69iKUhk=;
        b=ZaYGKMl4fpVirsAZ7vtCOUZCZMk3TJ8ACu2OSNiKqvKKpUFvBpJu2QzrG49w+wK0TJ
         sizsoZyv4oXX/cUijaN0Q5aIla8qd8u/ikpS7IpE7CDaWbGRKX9KmNrv1SJ5SgzI8yVM
         GggaSP7l6ZV5hoTeIxCdn5OPROdyQtJJK2ZforE64muStfmHhui6i0ROyFFC9vyKvRpM
         4iBxZa1/5Hry18iqWBuKx/r9N+YCJQlQl28FjTOJkBFHd8XWY679weik24L4vgf9ArY7
         K36RgLm50vjs85gqhmYjGPezvOAfIO3uxvLaOLYbQmRpTKU8MtYEw7J/LxoUCvLFO4qW
         lvjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=a14rbcqbH4we3Ue7mIpuVlWo48xadVIn8OFA69iKUhk=;
        b=aWduQI0uwZL3osJunUONFx+Rsw9Rvsz4sx8n4sAUm6HlQMq2aWe58Tn2ybpQf2wjiT
         vVjr6/OalWYt0qX6ZVtGUd5xRJa77hO20j0GIdCJ45//1YcEQej9g/H9o0US4d5wVbqE
         JgqOZEJ0FaDmCe8Jixb5WAzxdn6fizQ1ASkKVhV71wyJ6xLe2C2b6f0xCnjMyAMr6O9n
         AKw2o3FO/UN5SPH8u7e69Kt2Pvsrpw6sDSyA805RRY6qEhHSNyXATsyUeCgaBDBMABoo
         GSs6saOmS/nlo530srpc7oAlFoA23ZiumwClFfBD6x3An0pOxXZ61mk0u9NTf57dUhEq
         nE+A==
X-Gm-Message-State: AOAM530KShOD9BgIuqdtYG6lXUxNox/gKR5Hm9CFO52IOYf+RbHW/OmY
	xQXAWJqZWzl7EdJTT9phKzpsrV5cJFUiHQ==
X-Google-Smtp-Source: ABdhPJzOWGsvZvN24WAFEHT7b1irSudX+GVkxkNvxdRfRnthDVn5UuLJcz/cxLNFBykzcESTTd2EBQ==
X-Received: by 2002:a63:1f1d:: with SMTP id f29mr10077129pgf.47.1612035478658;
        Sat, 30 Jan 2021 11:37:58 -0800 (PST)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:315d:c5e7:1295:54a9])
        by smtp.gmail.com with ESMTPSA id q197sm12518096pfc.155.2021.01.30.11.37.57
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Jan 2021 11:37:58 -0800 (PST)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfell 13/13] mariadb: Fix 64bit builds if pam is enabled
Date: Sat, 30 Jan 2021 11:37:38 -0800
Message-Id: <74c1298dfcc697859f210ba50a6a72fbbc897704.1612035229.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1612035229.git.akuster808@gmail.com>
References: <cover.1612035229.git.akuster808@gmail.com>

From: Dan Murphy <dmurphy@ti.com>

Fix the installation of the pam.so for 64bit builds.
This is an indirect backport of commit

8fa0a3ace6b8835ba623fac118e0bdb4ea0f1f24 ("mariadb: upgrade to 10.5.4")

from the master branch.

Signed-off-by: Dan Murphy <dmurphy@ti.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-dbs/mysql/mariadb.inc | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-dbs/mysql/mariadb.inc b/meta-oe/recipes-dbs/mysql/mariadb.inc
index 1a86bc0446..9f7203c40d 100644
--- a/meta-oe/recipes-dbs/mysql/mariadb.inc
+++ b/meta-oe/recipes-dbs/mysql/mariadb.inc
@@ -167,8 +167,12 @@ do_install() {
         mv ${D}${datadir}/doc/README ${D}${datadir}/doc/${PN}/
     fi
     if ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'true', 'false', d)}; then
-        mv ${D}/lib/security ${D}/${libdir}
-        rmdir --ignore-fail-on-non-empty ${D}/lib
+        pam_so=$(find ${D} -name pam_user_map.so)
+        if [ x"${pam_so}" != x ]; then
+            pam_dir=$(dirname ${pam_so})
+            mv ${pam_dir} ${D}/${libdir}
+            rmdir --ignore-fail-on-non-empty ${pam_dir%security}
+        fi
     fi
 }
 
-- 
2.17.1

