Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web08.6301.1622029974453695499
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 26 May 2021 04:52:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=XErfuyYw;
 spf=pass (domain: gmail.com, ip: 209.85.210.174, mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f174.google.com with SMTP id q67so737744pfb.4
        for <openembedded-devel@lists.openembedded.org>; Wed, 26 May 2021 04:52:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=kahjp7GH66gYqzbBL3SsLDe+qXBaRX9045RPnuht9ws=;
        b=XErfuyYwcchtyX3eXYHKKL0aulBzwb4/VcETDTt/6zKK8dBBW8YC3kEaSWlvBnSkCy
         kzpKxc47X4O5hTJOxk2q2Q5/9ENcDArftijBNJ1h8j/v0UPoQh5Qb9y/qriIryJBs2o/
         qF9Az23agUAdOvqKJIsK82D+nxhc3QDV4rlFkNOpoDjqKWtZtXFmSBnnqdzbMDwhU2is
         97C3zkjs+9dEeQF2WdfhMW8SKDxXqaGCcWxISZ7X7yScU7dqrzA+93ohJnDl7p21ZHU+
         4j58twsy+PV1Qhx5hzqnToqdZt0xFXfOk00qAuheVrfzv0X9vXJosd3OICusdHyK2jXp
         Jw+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=kahjp7GH66gYqzbBL3SsLDe+qXBaRX9045RPnuht9ws=;
        b=ratrRKaBu8bk8ZR6l574uVqVxwJ6ewXjoAsZj71ogByeLjqzIiYymld/r5q2aVRmoZ
         Oosy9RfGHU40U2rdzRlAJdZYpvtMlh3Uz1VmmfiKnZynAIS0kqkvXgbWW7N4PKHAMV2T
         6sn7pY04s/D2vWQrb0JUdcBTFHjJ9ZZij4cigDXIlCSaQAIXsx0mrh1Wq/hEqQ4xATCw
         Oqo75ZOsMSzcoYFK223QOg3i/2lJl2586JVUKn+kiKeWa2m36xG+LIUO/Jthecydme0m
         2pGLUC4t+nf2zTkZj/v7esT6ohTkDGCs3I5GWAMKnNzKfHx8+A5YR0QDR4RgS5pgG9+Z
         NWDg==
X-Gm-Message-State: AOAM533ClrRTmt2QwbkQhg6EjMh3hX1l6v7GC5uFYkrdnPn2BT0z2C/t
	dKlBAff0ir3SMJioB++rLNWT1HmDGwpPjg==
X-Google-Smtp-Source: ABdhPJzDPARvz7lL/rB7RwQhilsNi30ZNBZWedevNe1x4V+1gFmocXwemE3caNd8jQfyR2desToNzg==
X-Received: by 2002:a62:ce47:0:b029:2e6:cfb9:925a with SMTP id y68-20020a62ce470000b02902e6cfb9925amr22096433pfg.69.1622029973951;
        Wed, 26 May 2021 04:52:53 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:68d3:e59c:b64:76e3])
        by smtp.gmail.com with ESMTPSA id h22sm15408818pfn.55.2021.05.26.04.52.53
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 May 2021 04:52:53 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [harkknott 05/23] python3-rfc3339-validator: Upgrade 0.1.3 -> 0.1.4
Date: Wed, 26 May 2021 04:52:20 -0700
Message-Id: <cc118b56ad11bbfcd610ec73ad911f4eda2cb4e6.1622029873.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1622029873.git.akuster808@gmail.com>
References: <cover.1622029873.git.akuster808@gmail.com>

From: Leon Anavi <leon.anavi@konsulko.com>

Upgrade to release 0.1.4:

- Fix test failure on darwin

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
(cherry picked from commit b5fb8390df11253fc7b20cd7a31db136f1d19a5c)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 ...39-validator_0.1.3.bb => python3-rfc3339-validator_0.1.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-rfc3339-validator_0.1.3.bb => python3-rfc3339-validator_0.1.4.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-rfc3339-validator_0.1.3.bb b/meta-python/recipes-devtools/python/python3-rfc3339-validator_0.1.4.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-rfc3339-validator_0.1.3.bb
rename to meta-python/recipes-devtools/python/python3-rfc3339-validator_0.1.4.bb
index a07a094479..f1064f327d 100644
--- a/meta-python/recipes-devtools/python/python3-rfc3339-validator_0.1.3.bb
+++ b/meta-python/recipes-devtools/python/python3-rfc3339-validator_0.1.4.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=a21b13b5a996f08f7e0b088aa38ce9c6"
 
 FILESEXTRAPATHS_prepend := "${THISDIR}/python-rfc3339-validator:"
 
-SRC_URI[sha256sum] = "7a578aa0740e9ee2b48356fe1f347139190c4c72e27f303b3617054efd15df32"
+SRC_URI[sha256sum] = "138a2abdf93304ad60530167e51d2dfb9549521a836871b88d7f4695d0022f6b"
 
 PYPI_PACKAGE = "rfc3339_validator"
 
-- 
2.17.1

