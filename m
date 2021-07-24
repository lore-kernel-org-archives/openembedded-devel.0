Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web11.8693.1627146053260691752
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 24 Jul 2021 10:00:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Tcnk3yu+;
 spf=pass (domain: gmail.com, ip: 209.85.214.174, mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f174.google.com with SMTP id c11so6685312plg.11
        for <openembedded-devel@lists.openembedded.org>; Sat, 24 Jul 2021 10:00:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wAaw5rvHVGtbSgroGvAqbBnSWAnanL6bWbiyqNg9HEk=;
        b=Tcnk3yu+9G06trVQI7c60YZkYsFxTsVawFpd70b090sGtq6H8yUuhUX4a0yHNIR6Gi
         UA9tSHkF46zV/yIF3Bgi+vPj4vQ/DIEzXCfQdSYhmOlsI5YGj7dTLCYJV81hhVnNWH7+
         nL6iKK8/kd4Na2P9ujy+bN7yz6/whsMoh75m5ToxlwbHU7I/JW9ZXGEXzq+yYYjlHCJi
         thf6dhj17CT10pdbcIhwev4ERx3+QkOyEz6XPWJQW2dBJtfBUqh0oN/n7EphMM7vjAS4
         /zg3RCdgzQm7Efi+Ct/xF+j+/VSa7d6Zo04Z7LGnT6Ceh7yFcLTUJU5fTySIvk23dP+o
         1wXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wAaw5rvHVGtbSgroGvAqbBnSWAnanL6bWbiyqNg9HEk=;
        b=uel2wqjzzARV45W4S/GTEHHaDheInEFNP0W5cSzLQNOLNg1I1K3PTIR0qgsbYmoNXT
         OsDzIo2E6T5SrQQLIwHu4ZvjANrPvv1vM099jz09LKesHEPWOJ7NBAyS0obXR3qv/Vi/
         uqb30jLrJCPg1TjUNoxw3Hw2t8AG4/QheuO9KcSLMt7LPfl4SASpGG2ia3Xz66mDIHlo
         mhNYwW0/u3eLihANDQmOobuGXUeeIOv2V6w5Z16x8G1pU6mYqPkc4oh+rqYcuYvy1qH1
         RRRxoVjmHJXdxP86kjU+IU1jENfzVVstjRLnbxPnTc4lRY0lgke+AYcYlA2DfGyQOR9K
         Gi5Q==
X-Gm-Message-State: AOAM530F6qmO/Z1OlY8ZKfq32GIKiKva//toOKY12UgiwG5tPIMqFCoz
	4ff9s1yi0kmGJbrVaG//bytKsuNTRoqnJg==
X-Google-Smtp-Source: ABdhPJxYIBlSdawdzsQnvvotp2Qigqfd94ctkJbMrU//xwlmUJI3svo9OVn6IODwGDsYtdKN4JCPuA==
X-Received: by 2002:a65:64c9:: with SMTP id t9mr5154999pgv.378.1627146052762;
        Sat, 24 Jul 2021 10:00:52 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from keaua.caveonetworks.com ([2601:202:4180:a5c0:734d:6ce:6223:58e4])
        by smtp.gmail.com with ESMTPSA id fz10sm2453500pjb.40.2021.07.24.10.00.52
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Jul 2021 10:00:52 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [[meta-webserver][master]] hiawatha: fix url.
Date: Sat, 24 Jul 2021 10:00:51 -0700
Message-Id: <20210724170051.854430-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

files moved under a new dir structure.

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-webserver/recipes-httpd/hiawatha/hiawatha_10.12.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-webserver/recipes-httpd/hiawatha/hiawatha_10.12.bb b/meta-webserver/recipes-httpd/hiawatha/hiawatha_10.12.bb
index 9729fd4a80..4b902bfda6 100644
--- a/meta-webserver/recipes-httpd/hiawatha/hiawatha_10.12.bb
+++ b/meta-webserver/recipes-httpd/hiawatha/hiawatha_10.12.bb
@@ -6,7 +6,7 @@ DEPENDS = "libxml2 libxslt virtual/crypt"
 
 SECTION = "net"
 
-SRC_URI = "http://hiawatha-webserver.org/files/${BP}.tar.gz \
+SRC_URI = "http://hiawatha-webserver.org/files/hiawatha-10/${BP}.tar.gz \
            file://hiawatha-init \
            file://hiawatha.service "
 
-- 
2.25.1

