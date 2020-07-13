Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.web10.11838.1594608990237499285
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 12 Jul 2020 19:56:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=NqxE6bIw;
 spf=pass (domain: gmail.com, ip: 209.85.216.51, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f51.google.com with SMTP id f16so5515629pjt.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 12 Jul 2020 19:56:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=EP4hxRe2CJXKZ4sqaOUQtK793kq7uPBvTLfocfWlk90=;
        b=NqxE6bIw+05jsDMQiurSFahWdmzFPsVJ6q+GAIDnmCM8IbjGoRvRtMA+Zia/U0rdAq
         7nKi4xXNK4GEv3vcFeQOhclLrF/Ns+/XwEGv6QvAdmyqOXwcSeWYudZNVUETw/a8XMW9
         zbgWsAzgBCciw2BOq61wmrnUyWjMtbmEqDTnKQxneZm+w1rANcLVx72JN+HEZBls5Oxu
         WmUduaC7lMvBX6vYqLN/bCKh6R7o57nNOFsNx/v1VWlZ4WAhpBKL8hAQTz5ht5GInf2o
         v7m6PVjOPZ+uIMFzbzqTz9Q/GUNeaWlhM+aGwx5Nk5o92cili3CKR3bm0Z0AeGIWiskW
         nDzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=EP4hxRe2CJXKZ4sqaOUQtK793kq7uPBvTLfocfWlk90=;
        b=U/lEprwLbKk/RYeqBT0BfrNoqOjzAsIAwcOI6uKGyz4OSpGpsNWVlzEHboBYAA/om6
         GcWOtl64xhBuZ2lkAitKoYZIqQOzl3RaAr2XkvYZ1NEaEbxdTNZ86kAUco4IcRRreWM/
         z0fbenZUsgsX4/2xRbABDSkdaDublxaRIcQUnwME/A96xrzYqWQN0tP4okhCBOEFWrqK
         Iv+it626lYWSNWV7rPfQdgvV6ohbXvuVpk1zazQtySM9GDkaGu/qD1CwwGLQBId1c3Zj
         amNll4bYaGnTQvlEyJFxhvWdGfi+G2S2oAmk4+B5kYhXDn/EfoUEmig6T/mq8n+jZDtM
         OJrg==
X-Gm-Message-State: AOAM5322wB9VFww7v8mpv1PHTFezVrgiMAhoftpoltlAbwqZyHPfUVJg
	F5UOT3nImj4kZd/UlFYr8XgNqM+VDmo=
X-Google-Smtp-Source: ABdhPJz2Gjcg0sK1XahgICAJQc9MvdAWUxN6q9qQNx8Gc2o6tAn1uJzqWKme1cBK5cjRniLkSrGkEw==
X-Received: by 2002:a17:90a:a887:: with SMTP id h7mr18100317pjq.0.1594608989639;
        Sun, 12 Jul 2020 19:56:29 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:e013:ddd8:d9b9:dad6])
        by smtp.gmail.com with ESMTPSA id u19sm13687976pfk.98.2020.07.12.19.56.28
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2020 19:56:29 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfell 12/18] mraa: Disable python2, otherwise, there is a build error when enable multilib.
Date: Sun, 12 Jul 2020 19:56:08 -0700
Message-Id: <aa6371f7bf24ae3fa3da7974f953502995b79c8f.1594608813.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1594608813.git.akuster808@gmail.com>
References: <cover.1594608813.git.akuster808@gmail.com>

From: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>

ERROR: mraa-2.1.0+gitAUTOINC+e15ce6fbc7-r0 do_package: QA Issue: mraa:
Files/directories were installed but not shipped in any package:
  /usr/lib/python3.8/site-packages/_mraa.so
  /usr/lib/python3.8/site-packages/mraa.py

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit fadaf4867074d0140e769b954b7e8afb92c4dd1a)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-extended/mraa/mraa_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/mraa/mraa_git.bb b/meta-oe/recipes-extended/mraa/mraa_git.bb
index 403d641ee9..0b40dcb71b 100644
--- a/meta-oe/recipes-extended/mraa/mraa_git.bb
+++ b/meta-oe/recipes-extended/mraa/mraa_git.bb
@@ -21,7 +21,7 @@ inherit cmake distutils3-base
 
 DEPENDS += "json-c"
 
-EXTRA_OECMAKE_append = " -DINSTALLTOOLS:BOOL=ON -DFIRMATA=ON -DCMAKE_SKIP_RPATH=ON \
+EXTRA_OECMAKE_append = " -DINSTALLTOOLS:BOOL=ON -DFIRMATA=ON -DCMAKE_SKIP_RPATH=ON -DPYTHON2_LIBRARY=OFF \
                          -DPYTHON3_PACKAGES_PATH:PATH=${baselib}/python${PYTHON_BASEVERSION}/site-packages \
                          -DPYTHON_LIBRARY=${STAGING_LIBDIR}/lib${PYTHON_DIR}${PYTHON_ABI}.so \
                          -DPYTHON_INCLUDE_DIR=${STAGING_INCDIR}/${PYTHON_DIR}${PYTHON_ABI} \
-- 
2.17.1

