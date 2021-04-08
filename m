Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
 by mx.groups.io with SMTP id smtpd.web11.238.1617899815760008931
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 08 Apr 2021 09:36:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=WXMl5m3+;
 spf=pass (domain: gmail.com, ip: 209.85.210.41, mailfrom: akuster808@gmail.com)
Received: by mail-ot1-f41.google.com with SMTP id y19-20020a0568301d93b02901b9f88a238eso2862556oti.11
        for <openembedded-devel@lists.openembedded.org>; Thu, 08 Apr 2021 09:36:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=O81YbR14U9O8N0loKqwU3CM9EN8Oacq20H/C+dAfMSw=;
        b=WXMl5m3+GVvtbthZXt0UHTYA16+0y9PO6oMt2NifL7Yl4X7/r282g+aX61ft65KKqX
         kZyhdV2H6RP2/PXgqxrNxJTGa+AHqK/v65CNx0NnHJkipluFVFWPEiowsDjcHSdMafVc
         iNbzPrQXVVQgobzLnql3+WHyaKRkAleRrefuULeNVUNuctwLCgNFgJ6LfDYOEUFugHro
         cm750BircT3a4StMUKGLiP0w6lEcLFS1ezWamqEyOjP/mGRWqPmsKdkVdJYc6Pswpa1u
         sWZP9WK0e7H4p7GEo3qf9JcIeFDO8HAkPmMEhSvnsRepfZ6HOLzsQk0KZu625ydrdrgE
         /2uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=O81YbR14U9O8N0loKqwU3CM9EN8Oacq20H/C+dAfMSw=;
        b=RKVHeMHGFIJqklOtN71tGKbqE0vPI7Ywlc3WFITUDoOBQc9yjJ8wfxuroHzTRaWy6M
         6q805XuNI5OevbgdHcu9Jh2o0ZEo3JO2GrAlBqu2NgNd8UaXV+mrFskpwqQm+9Qy1+P1
         +3+wdKxkdingooahqS6+MeHG28L93ITeknNMMjNC8+JEWap+TN8AnNqH7OE0YfhugEsy
         ZYny5kzoidwkMazMNMunaz63GepLwMNYPIigDHoYdtH2Zom/L/M7IGP01VclYqoeRUI2
         DVIyOdSAaPjAJ2yF7Qno7EsJdB5+wPGR79+PJ+1MGWQh0MLgb38dkKuHUkgqUvujkC0J
         KduA==
X-Gm-Message-State: AOAM530wEphrHj7opzWLtvzvTKh2JLgZQgMdt3WoAVpCAapFv7Hy+cgQ
	M3s/ConGqOPzbZglxkmeMcIokQgiOHM=
X-Google-Smtp-Source: ABdhPJzX1fYyUEuhueCaA3jZxDYdHNnbf/loHyUlqax7O/Z6fi3VNBEbh0J1bxX1tJRqzqK3IbHNcQ==
X-Received: by 2002:a9d:7003:: with SMTP id k3mr8508897otj.351.1617899815001;
        Thu, 08 Apr 2021 09:36:55 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:8533:6d3:7a8:8272])
        by smtp.gmail.com with ESMTPSA id s131sm4977838oib.14.2021.04.08.09.36.53
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Apr 2021 09:36:54 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [hardknott 45/64] python3-networkx: Upgrade 2.5 -> 2.5.1
Date: Thu,  8 Apr 2021 09:35:52 -0700
Message-Id: <da9b72447adb74e1f6d9db7e5e1f1e10ef84ec3e.1617899100.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1617899100.git.akuster808@gmail.com>
References: <cover.1617899100.git.akuster808@gmail.com>

From: Leon Anavi <leon.anavi@konsulko.com>

Upgrade to release 2.5.1:

- pagerank uses scipy by default now
- New source argument to has_eulerian_path to look for path
  starting at source
- prefix_tree now uses a non-recursive algorithm. The original
  recursive algorithm is still available via prefix_tree_recursive

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
(cherry picked from commit 6b98728840639ec426d3e8ae06ac064ed73cd24b)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../{python3-networkx_2.5.bb => python3-networkx_2.5.1.bb}     | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-networkx_2.5.bb => python3-networkx_2.5.1.bb} (70%)

diff --git a/meta-python/recipes-devtools/python/python3-networkx_2.5.bb b/meta-python/recipes-devtools/python/python3-networkx_2.5.1.bb
similarity index 70%
rename from meta-python/recipes-devtools/python/python3-networkx_2.5.bb
rename to meta-python/recipes-devtools/python/python3-networkx_2.5.1.bb
index 70573828bd3..0b52cfd7e59 100644
--- a/meta-python/recipes-devtools/python/python3-networkx_2.5.bb
+++ b/meta-python/recipes-devtools/python/python3-networkx_2.5.1.bb
@@ -3,8 +3,7 @@ HOMEPAGE = "http://networkx.github.io/"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=a24ea029adac8935699bf69b2e38c728"
 
-SRC_URI[md5sum] = "21f25be1f4373e19153a9beca63346e7"
-SRC_URI[sha256sum] = "7978955423fbc9639c10498878be59caf99b44dc304c2286162fd24b458c1602"
+SRC_URI[sha256sum] = "109cd585cac41297f71103c3c42ac6ef7379f29788eb54cb751be5a663bb235a"
 
 inherit pypi setuptools3
 
-- 
2.17.1

