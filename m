Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web11.7630.1627140079977029112
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 24 Jul 2021 08:21:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=iAs8WVd6;
 spf=pass (domain: gmail.com, ip: 209.85.214.171, mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f171.google.com with SMTP id c16so972869plh.7
        for <openembedded-devel@lists.openembedded.org>; Sat, 24 Jul 2021 08:21:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0ByMib0O5Z6kswB4W3nFJEZh6aOE1BZ23GXMckG44/s=;
        b=iAs8WVd6YjFvRsCPCWPWWkS5ZDWt+Y5EtJZdE0s5GhxWkmo4GLdYHQZUHM3FL8K+Hy
         +7/C2pVJgII+1gdlZ9qlgHkHVxOEDWyPTpr57dj5K65RBVmsMzqqza/SGv7ZasyJGNO0
         8PZIHcciE5FSMpYK+0hJe9cTJIQw+YBlWdcysttijAkmxMnls0RS4WoGIS40BieCbeLO
         ZixCuVKdIngWAGRiYbhNZFnNWfJWtEdHyn0ZO41Jwo+GgRLRno/u3RHCvionESoah3By
         SGYyEV3MtjGBzi03FvvZJhtDrZo1qAHfjAr9OJElEOWanSYySoyIkJs57yuVUvkrn3f+
         9vHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0ByMib0O5Z6kswB4W3nFJEZh6aOE1BZ23GXMckG44/s=;
        b=n+Jfc/ESmkr/8ccXsGGZKIf09++ibGmy1nqhfvEp4uyto8ommyikmJ3FDvJDkQ9qf8
         Bq/hKM4SBkvo6yBSQugXPlEjKSTlNJDdTrsHU4cBH5T3q+tosESUG92XQoz4bpkMYsui
         5/TBFM25yRG+0BiX7ygQ5X8RTsVVu+SJZt88qLSG57goIFFcmCkGXgQcoDJ3oagEn9an
         89KHLc+pedWw3kBjAzd/2/hP+9Z+H2k0PzUno5oU+ywb8+0KEwmWrUz8t7wpesyCHPRN
         qEFdPcl63GYwKiSd2sxrEaMwno5KP+Ux13MN3gQRorKspmS1ZuAJPdASN3FAHyRbY+i/
         zuYw==
X-Gm-Message-State: AOAM530ct99QsVw74Ei+iajcDzDYsIe6gEVDi0no5wBw5+U+7zwHNVeZ
	8CQWoBW9kTCF8MI31UE5qdHibMkRK2nW0A==
X-Google-Smtp-Source: ABdhPJxsj/okekjhGvUX2KRAeSZ6km5bGSRWetxfZivake+HOLa4elH7/9QDQONTEXg9chn/Acb6ZA==
X-Received: by 2002:a17:90b:214:: with SMTP id fy20mr18284856pjb.62.1627140078807;
        Sat, 24 Jul 2021 08:21:18 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from keaua.caveonetworks.com ([2601:202:4180:a5c0:734d:6ce:6223:58e4])
        by smtp.gmail.com with ESMTPSA id g4sm43834276pgn.45.2021.07.24.08.21.17
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Jul 2021 08:21:18 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [[meta-webserver][dunfell]] hiawatha: fix url.
Date: Sat, 24 Jul 2021 08:21:16 -0700
Message-Id: <20210724152116.852884-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

files moved under a new dir structure.

ERROR: hiawatha-10.10-r0 do_fetch: Fetcher failure for URL: 'http://hiawatha-webserver.org/files/hiawatha-10.10.tar.gz'. Unable to fetch URL from any source.

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-webserver/recipes-httpd/hiawatha/hiawatha_10.10.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-webserver/recipes-httpd/hiawatha/hiawatha_10.10.bb b/meta-webserver/recipes-httpd/hiawatha/hiawatha_10.10.bb
index ed3df19390..2503f53166 100644
--- a/meta-webserver/recipes-httpd/hiawatha/hiawatha_10.10.bb
+++ b/meta-webserver/recipes-httpd/hiawatha/hiawatha_10.10.bb
@@ -6,7 +6,7 @@ DEPENDS = "libxml2 libxslt virtual/crypt"
 
 SECTION = "net"
 
-SRC_URI = "http://hiawatha-webserver.org/files/${BP}.tar.gz \
+SRC_URI = "http://hiawatha-webserver.org/files/hiawatha-10/${BP}.tar.gz \
            file://hiawatha-init \
            file://hiawatha.service "
 
-- 
2.25.1

