Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web11.33976.1622393933374344434
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 30 May 2021 09:58:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Jbyz21uR;
 spf=pass (domain: gmail.com, ip: 209.85.214.171, mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f171.google.com with SMTP id v12so4006840plo.10
        for <openembedded-devel@lists.openembedded.org>; Sun, 30 May 2021 09:58:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=S2RJVdvn98KxVRXXOgvrgaYn5q4ANFjpqP4h0GXx61U=;
        b=Jbyz21uRrJxnoRO6hsdJ5Wq3J3AO+nOy08WdQnjoKsvOYN/FeVd/c9eMLz25t6Iq1I
         tKy1zCl0pMJoOqhl1zGfkOWJuf9K/zKNK0KuYkZcbMH+Avcw/lv4yv8lh9iSjW2UXNMx
         PAs9LhlhOcIA42nXq+qfP2P2P7oL8kIFi07VatFWMiKQCQUUajaVHxvDJtFg7Ll2JNFH
         Xy/WbRtLyewpe+FwafAXbsN48ZFKGB+E+MG8Q+zqldfjMS2vZcmByr7nH9cBG9VLmq8b
         v9MKi3Z0Br050xNZlZb2rNkEz3R9ifi4YRqcSr+EY34ueKGTfU1dE6F2AOKRmDqCotjt
         D2Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=S2RJVdvn98KxVRXXOgvrgaYn5q4ANFjpqP4h0GXx61U=;
        b=AQsEqqo7HiYtwA5IahPVYoUvyL0Dt8C/7a3YBE2aM4gs5yqCFyqar3u7F6ew5ge4KW
         Z/M9qgDj9gf4ybP8R/JaFg5Bx7WFaqZAyrRkZ9r3kZTuqcnZYsHJTjnVc1wz1QZAylc2
         ZnmqxXFlrobdmde5G5lYdKCx5jTjf2PT2ig4otKmPBxV+jLeNRF4DSAk9Vzo/Ecjc4A9
         oLL0k4F238f7UDtDH2hQKlT5K2XVGJwnM5NFiit+dh1ZZXahBVYa8FkW7CnygbA9UVQW
         5yKTZD7pETdHzkuzV4zLXXV8l/ikW9LDz8NHnDRhkeYPHQcSg2fbcEsE4R8zo/wrXYJk
         bVaw==
X-Gm-Message-State: AOAM531md3bz6f08s4uD2jYIpVDHAs0Deun2WkuVj5/GKqNGMGOrnIY4
	d48eDwNKqA5IY2lBURgP/Mu+JemBPX83XA==
X-Google-Smtp-Source: ABdhPJwEQLhjNGBicExKrjhSO4FuqrgVb8ZmZAoczLFGTR9DmdroOnuaBiLU5DUAKOWnTlB+o61vPw==
X-Received: by 2002:a17:902:70c2:b029:ee:b4e5:64d5 with SMTP id l2-20020a17090270c2b02900eeb4e564d5mr16635722plt.77.1622393932791;
        Sun, 30 May 2021 09:58:52 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from hilo.hsdl.ca.comcast.net (c-67-181-203-136.hsd1.ca.comcast.net. [67.181.203.136])
        by smtp.gmail.com with ESMTPSA id m1sm9068641pfb.14.2021.05.30.09.58.52
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 May 2021 09:58:52 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-openembedded[PATCH 2/2] python3-scapy: drop from pkg grp
Date: Sun, 30 May 2021 16:58:50 +0000
Message-Id: <20210530165850.554590-2-akuster808@gmail.com>
X-Mailer: git-send-email 2.24.3
In-Reply-To: <20210530165850.554590-1-akuster808@gmail.com>
References: <20210530165850.554590-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../recipes-core/packagegroups/packagegroup-meta-python.bb       | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
index b283d13bf..9f3d48253 100644
--- a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
+++ b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
@@ -367,7 +367,6 @@ RDEPENDS_packagegroup-meta-python3 = "\
     python3-robotframework-seriallibrary \
     python3-rsa \
     python3-ruamel-yaml \
-    python3-scapy \
     python3-scrypt \
     python3-sdnotify \
     python3-semver \
-- 
2.24.3

