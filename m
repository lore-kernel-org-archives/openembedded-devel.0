Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web11.10740.1593562063958540268
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Jun 2020 17:07:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=PzT68Gi6;
 spf=pass (domain: gmail.com, ip: 209.85.210.175, mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f175.google.com with SMTP id x3so4621396pfo.9
        for <openembedded-devel@lists.openembedded.org>; Tue, 30 Jun 2020 17:07:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=QDOvaBqhstwD3mawT68smPkomzQUpBFAdAg7WhMZV2M=;
        b=PzT68Gi6M8Fh7miIkaRsgVawxKF2gvh0YtfvBg3byDuXiq1TlJWuoV5ToTdIOjR2eC
         3W0kFUXrsNVQJr6+1x7F5Bc/5Fo452qEBb6V7MyQPK2AfKF58nTwlpyI39rzUJMFv2bT
         KHYUQxyUN4nSGh8GFttUH601qWUsIF8PzXk/BWf24Jk6CxnUP0SzTfCaYemAx4+GkQr2
         +b9hZVLI4Tvu2FyvPujgHUolK6vuFjeiaSn3TG/CGpJ76OZ8q23PgY9ikE6AbCjajz2f
         d91Ba6hz7HDHvRAa3O4GoBrvL1N0BX8m4TeTEBSLyoDkcm9oRpskCOosMJDPStBAJfme
         URcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=QDOvaBqhstwD3mawT68smPkomzQUpBFAdAg7WhMZV2M=;
        b=aNZaBumjLQseuu/UTdVT2tJ2HscCRDL9pvf3KnaeHLKles4e/0dZDdUlhYSMm70t3Y
         VWyayRTyOvlW1JK0hJM6bcwga5jM1y5eJUiXt1qdN6GKNA4IN7zAI4c/5JwMaW4dB3vJ
         tVJJbaeaTjNQ/GnbdiB76Zke8IilnZMkoB0KxwvrsEP2eFEfMxgAfRtEy02fWIndUVuC
         mr99YnDC43/VsnXbF6XLUeYNDlX+OabsHiQVMn1KDdBq2nnyGAKliqf0BVbB5wNdNbqg
         dk6gVoQkSUs/MMapLtrAcW1qoZ9NawcgZXf74yD40F1lI0bj9HM0hPK9mJt+HMi7vaSC
         xNHg==
X-Gm-Message-State: AOAM532LlEDgQmZ5W9EHxcNKW68Xrasl9Evon8eyYdsA2ooDbFW4AEKp
	o5ys6pZwKfydoUr8N8Hrhn4qULXtNwo=
X-Google-Smtp-Source: ABdhPJxaQ5/tHEuQxnhNMoJ/ynTJKk/gXi67kdcX4w5I0x5Fu7XM7CmWsLnqAHkegzxNWwHi6wEkHA==
X-Received: by 2002:a63:ca11:: with SMTP id n17mr17114319pgi.439.1593562063076;
        Tue, 30 Jun 2020 17:07:43 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:c85d:3ce:5443:9164])
        by smtp.gmail.com with ESMTPSA id z2sm3940544pff.36.2020.06.30.17.07.42
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2020 17:07:42 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfel 19/32] python-django: set CVE_PRODUCT to be django
Date: Tue, 30 Jun 2020 17:07:04 -0700
Message-Id: <33719e8d17226b4edfa3b4584c390cd6b678e89d.1593561840.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1593561840.git.akuster808@gmail.com>
References: <cover.1593561840.git.akuster808@gmail.com>

From: "Qi.Chen@windriver.com" <Qi.Chen@windriver.com>

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 639eae8901467c0bf79a05b6b6e6cda94a937ae9)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-python/recipes-devtools/python/python-django.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python-django.inc b/meta-python/recipes-devtools/python/python-django.inc
index 73b7ac99f9..c02b3fa522 100644
--- a/meta-python/recipes-devtools/python/python-django.inc
+++ b/meta-python/recipes-devtools/python/python-django.inc
@@ -30,3 +30,5 @@ RDEPENDS_${PN} += "\
     ${PYTHON_PN}-xml \
     ${PYTHON_PN}-distutils \
 "
+
+CVE_PRODUCT = "django"
-- 
2.17.1

