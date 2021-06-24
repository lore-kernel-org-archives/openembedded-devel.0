Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web12.176.1624567056350514658
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 24 Jun 2021 13:37:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=nf1LOL5U;
 spf=pass (domain: gmail.com, ip: 209.85.221.50, mailfrom: texier.pj2@gmail.com)
Received: by mail-wr1-f50.google.com with SMTP id j2so8062545wrs.12
        for <openembedded-devel@lists.openembedded.org>; Thu, 24 Jun 2021 13:37:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=OXvWW2wVWKwAmwkkD+xqEnOFPaElcWKdmSI/TWoWVew=;
        b=nf1LOL5UYaJKpWz1iy2CqLjzgZKCa82sQSH29EDbU4+tAod2TSRixE8XKm/rHdKfB/
         nv2jd5IGOWhQpWuVIURi2j1NZ1Iel1MDS8Z8JrLpvbrDjiiieQuuk9kO5AO3k9J63/40
         yYsSllpmry+I3broygcE7X1HYO9OvjmSCzUdZU6SkssigxBxNJrU2v6MjNkLum865Jh9
         A8p4ITR3r2X0Ou1Ke6C47w1AW2Ur98eascCPXedVkbHB1xuZ1kCRrGomRhIAMemUhhwW
         KjC3zmMXvJGJkR1Cl84vOsWRSs2Kj2NhoS1xhE+nRnvepdYCKSi8khPzaksHSF2vESbx
         kqxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=OXvWW2wVWKwAmwkkD+xqEnOFPaElcWKdmSI/TWoWVew=;
        b=JSbUwGGjBTgAiGJwAuxS5PkN6yJKucae0QRrcpyWqQSOYEt/e8qExTBXvc9jAGeqTl
         3NVRj8LrdJE7sisH9W6hzHdPzuSTXevebpQhtz574Jreh6J8n+GF1mENZj60VXDFL/+Z
         OnT9hZS9OR9MJSvbSwGXgH7VThTctc3oJCo491rDrh1CJLjE1fNRq+gn+Kv1MwVuGJ30
         2rZ8QnEnv2naMAKGgxasJ7rfMX9XRZovxmpey1MQE+L9cMf6rSsfmtN+9EHqfSBUCG3a
         jEZ98bwLv5GQHQQGbf0I4sKyoEvXwpI+ym4gIAuX/8dH8MqTjldJEYSy9p/y5PqsKhbU
         JlIQ==
X-Gm-Message-State: AOAM5304oIpI/i63kjaznDZPFsoOLX2tNxhUYfs8C7WISh0GuuSNym8I
	l7SsP3wGSBi0XCWuHx6qByY2EEn6+U8lrA==
X-Google-Smtp-Source: ABdhPJwFiz/D50hFeounyKRRHRH9uLx50zrCTtFKgn7L/28aDGHq1LG5tv+qUjvPkAWlIoIkpUvx9Q==
X-Received: by 2002:adf:e2cf:: with SMTP id d15mr6618555wrj.48.1624567054557;
        Thu, 24 Jun 2021 13:37:34 -0700 (PDT)
Return-Path: <texier.pj2@gmail.com>
Received: from menoah.home ([2a01:cb19:190:c500:744d:25d4:358f:5207])
        by smtp.gmail.com with ESMTPSA id 204sm4051595wma.30.2021.06.24.13.37.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jun 2021 13:37:34 -0700 (PDT)
From: "Pierre-Jean Texier" <texier.pj2@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Pierre-Jean Texier <texier.pj2@gmail.com>
Subject: [meta-oe][PATCH] libtinyxml2: upgrade 8.1.0 -> 9.0.0
Date: Thu, 24 Jun 2021 22:37:22 +0200
Message-Id: <20210624203722.25076-1-texier.pj2@gmail.com>
X-Mailer: git-send-email 2.17.1

Signed-off-by: Pierre-Jean Texier <texier.pj2@gmail.com>
---
 .../libtinyxml2/{libtinyxml2_8.1.0.bb => libtinyxml2_9.0.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/libtinyxml2/{libtinyxml2_8.1.0.bb => libtinyxml2_9.0.0.bb} (89%)

diff --git a/meta-oe/recipes-support/libtinyxml2/libtinyxml2_8.1.0.bb b/meta-oe/recipes-support/libtinyxml2/libtinyxml2_9.0.0.bb
similarity index 89%
rename from meta-oe/recipes-support/libtinyxml2/libtinyxml2_8.1.0.bb
rename to meta-oe/recipes-support/libtinyxml2/libtinyxml2_9.0.0.bb
index 5245059a89..215f32a785 100644
--- a/meta-oe/recipes-support/libtinyxml2/libtinyxml2_8.1.0.bb
+++ b/meta-oe/recipes-support/libtinyxml2/libtinyxml2_9.0.0.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=135624eef03e1f1101b9ba9ac9b5fffd"
 
 SRC_URI = "git://github.com/leethomason/tinyxml2.git"
 
-SRCREV = "3291390336141573e51dfa991b4179c8bcd8f306"
+SRCREV = "1dee28e51f9175a31955b9791c74c430fe13dc82"
 
 S = "${WORKDIR}/git"
 
-- 
2.17.1

