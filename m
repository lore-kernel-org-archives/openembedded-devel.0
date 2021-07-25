Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web08.14665.1627188764667649691
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 24 Jul 2021 21:52:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=EXSTZoTu;
 spf=pass (domain: gmail.com, ip: 209.85.214.181, mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f181.google.com with SMTP id n10so7937329plf.4
        for <openembedded-devel@lists.openembedded.org>; Sat, 24 Jul 2021 21:52:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=0ByMib0O5Z6kswB4W3nFJEZh6aOE1BZ23GXMckG44/s=;
        b=EXSTZoTuMFVO4te5Yi2dhuhZNbxW2kEphKgpviH4tTuYTiQhzn2EUu9dhhxVO2wMwU
         LCbWyL99i7lsNV2hMmwmXok1TP7JletsCjxxLb1SGcDKT+mHAVHxVlNdzWszVWyepgZc
         nbsugu3ELeLEWiJTiMVlMV7dBAUMY01eQDp5/fJ218E25UDtQ5BtPOlfSmCxXeQqeVrH
         1HJIWPeFlNlpT83G9fL+YE/PuDz4fYVEiCk+zt1E8cpc+05ZpXA+ym1EcgKL6m4sYqX2
         geBBZFYTJ/ymILpro1cPCat6LjbSF7K9l7QmzaT85uOymKB1XSDQmkqL3x+Z8tMWZTmK
         f/Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0ByMib0O5Z6kswB4W3nFJEZh6aOE1BZ23GXMckG44/s=;
        b=QbxdWuZSTfZzwIOfIioozd8ubnmv047wF2uJeDAMvp46d4qiaNxZubi1aJtKE2VnxE
         U+bQ/3fXldPxlTTIkFjTFSaa86LVtQXaDHUxtsjc4s7h6AVlTY9XoKyDH0BW1lnbeyZ5
         QXWn4a39Ecn9bped5RoBHkYShpKmhUc3MoYdCVhp4mkBGdWa+NrU7uJhFcdn5FNleOuM
         rDTHq8s7jvBB1rJFVesEqYtUCLXvOa6A1+Bo0Z0nwO5DHIi59ufKNghh3nZKmaELOIUX
         XCV4kVIRctDB69Oi0xOieP4Rm6g0Y4wq5SRu+4t4KHXOYwjCrf1fDiMbQ7PuBzKchIF8
         wZQQ==
X-Gm-Message-State: AOAM532sdTVVFmgSxTUVfwk9bo9c5qic9bQrZh7NZ7Fyg7MHdADLGkYx
	RIs5+EY0SOkM5MLjjdrXvswqgh4SUBLXpw==
X-Google-Smtp-Source: ABdhPJxiHNMt97ttIsv/hLPgVRGKNMCD1Y7GbYlhTPgV7g9Gt8dbj5mHcf9/EzHhRzemi1iw7Xe4hA==
X-Received: by 2002:a05:6a00:24c2:b029:32e:424c:53ac with SMTP id d2-20020a056a0024c2b029032e424c53acmr11580946pfv.17.1627188764130;
        Sat, 24 Jul 2021 21:52:44 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from keaua.caveonetworks.com ([2601:202:4180:a5c0:d2f1:9af3:9c5d:7e26])
        by smtp.gmail.com with ESMTPSA id t10sm43368804pgv.52.2021.07.24.21.52.43
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Jul 2021 21:52:43 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfell 14/15] hiawatha: fix url.
Date: Sat, 24 Jul 2021 21:52:20 -0700
Message-Id: <5eff5262e3890ccef11f9fa4bbc81963c0889da2.1627164868.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1627164868.git.akuster808@gmail.com>
References: <cover.1627164868.git.akuster808@gmail.com>
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

