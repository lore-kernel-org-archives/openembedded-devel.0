Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
 by mx.groups.io with SMTP id smtpd.web10.930.1632338551905044364
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 22 Sep 2021 12:22:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Pc2/5Zr8;
 spf=pass (domain: gmail.com, ip: 209.85.215.173, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f173.google.com with SMTP id 17so3783036pgp.4
        for <openembedded-devel@lists.openembedded.org>; Wed, 22 Sep 2021 12:22:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=k2UjJv+TFkAqqUR3NYsOAcSHZiYzuL+441pornlXMOU=;
        b=Pc2/5Zr8hB7eYjNf56B5S71BNe/MkInHPw14jV/2O8b2hweOamCulKuCJh2LNcYVU0
         GeEySg+VslYCs/UYs/o57z+zD2B3D6aiYQg1zArBNu2lSP0ion2021PyIX+dTxUaWq2A
         yw/WRSEgpiBzPJ2bD1KdexHPE6ZluaXz3S5fWthKKOY1gh1DKd4jW7DKkLo4ABJj5fGW
         rAmtGG2seItrFH1nZqI6odXblLmM9aftEsiQXC23stQsoFnQwa/KiJELdKa1tgPugyFS
         V2Cry9+B/MNDvZQbHznjqUoslSHLyJpu2qctHDKhbMnnVDqQ6CMwT0MXgHOUFfKkNZpC
         FDyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=k2UjJv+TFkAqqUR3NYsOAcSHZiYzuL+441pornlXMOU=;
        b=n+dASFYQHehz22SOaLkcu1e1tiP2aCGQPnuCmZdB/E2B78AEHSmBfYrqkTYzPrt0Hz
         0a1Xw4neb2dy72Z0NpBlf4Q4PCY4M1+gRC8fIlUBnhmra2HqtjX+HzjrRzsN4fyU4x1z
         jm5kh3Mnhj6VTj1osAZe4sgG0uYZ5llE2/U9aKul49sJh551RLaObjm1HCybvzOkdpP7
         gEWJL6KU18SHfaK/I11u3BGUPLfHrjtGrjfLofy5I4Awm2Qy8iCqt5T3rSUHcjIwQ+TD
         KfOEP8Yex8EAhnYsT246uWHCY/ZpOZZbAsGNwgpbZ/xfiOGixO2ceilUBRbn2NiGoGBZ
         jR9Q==
X-Gm-Message-State: AOAM531EjekyDLdKlhcV5CA3fC4lzOpo75J+NVf5NqmtRjxI1sucCvhH
	9iASC/ePUOFVhZCJqRms+TAfbo5a/XfPTw==
X-Google-Smtp-Source: ABdhPJxfSQEL/PgUjLWDaznqu5PBOe/QsNVuTmXiH9hayiQAloxxCbXiBtDgggS5hESOaLaZ/D6mUA==
X-Received: by 2002:a05:6a00:1789:b0:43d:ea98:7ea8 with SMTP id s9-20020a056a00178900b0043dea987ea8mr717856pfg.67.1632338551336;
        Wed, 22 Sep 2021 12:22:31 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::728f])
        by smtp.gmail.com with ESMTPSA id y13sm3083119pjc.50.2021.09.22.12.22.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Sep 2021 12:22:31 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH 18/39] python3-h5py: Inherit pkgconfig
Date: Wed, 22 Sep 2021 12:21:52 -0700
Message-Id: <20210922192213.3062719-18-raj.khem@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210922192213.3062719-1-raj.khem@gmail.com>
References: <20210922192213.3062719-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixes
error: pkg-config probably not installed: FileNotFoundError(2, 'No such file or directory')

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-python/recipes-devtools/python/python3-h5py_3.4.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-h5py_3.4.0.bb b/meta-python/recipes-devtools/python/python3-h5py_3.4.0.bb
index cc23802626..89000b7936 100644
--- a/meta-python/recipes-devtools/python/python3-h5py_3.4.0.bb
+++ b/meta-python/recipes-devtools/python/python3-h5py_3.4.0.bb
@@ -11,7 +11,7 @@ SRC_URI:append = " \
            file://0001-setup.py-Fix-numpy-version.patch \
           "
 
-inherit pypi setuptools3
+inherit pkgconfig pypi setuptools3
 
 BBCLASSEXTEND = "native"
 
-- 
2.33.0

